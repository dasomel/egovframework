package egovframework.com.sym.bat.web;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.bat.service.BatchResult;
import egovframework.com.sym.bat.service.EgovBatchResultService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 배치결과관리에 대한 controller 클래스
 * 
 * @author 김진만
 * @since 2010.06.17
 * @version 1.0
 * @updated 17-6-2010 오전 10:27:13
 * @see
 * <pre>
 * == 개정이력(Modification Information) ==
 * 
 *   수정일       수정자           수정내용
 *  -------     --------    ---------------------------
 *  2010.06.17   김진만     최초 생성
 *  2011.8.26	정진오			IncludedInfo annotation 추가
 * </pre>
 */

@Controller
public class EgovBatchResultController {

	 
	 
	
	/**
	 * egovBatchResultService
	 */
	@Resource(name = "egovBatchResultService")
	private EgovBatchResultService egovBatchResultService;

	/*
	 * Property 서비스
	 */
    @Resource(name="propertiesService")
    private EgovPropertyService propertyService;
    
    /*
     * 메세지 서비스
     */
    @Resource(name="egovMessageSource")
    private EgovMessageSource egovMessageSource;

	/**
	 * logger
	 */    
    private final Logger log = Logger.getLogger(this.getClass());	
    
	/**
	 * 배치결과을 삭제한다.
	 * @return 리턴URL
	 * 
	 * @param batchResult 삭제대상 배치결과model
	 * @param model		ModelMap
	 * @exception Exception Exception
	 */
    @RequestMapping("/sym/bat/deleteBatchResult.do")
	public String deleteBatchResult(BatchResult batchResult, ModelMap model)
	  throws Exception{
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovLoginUsr";
    	}
		
    	egovBatchResultService.deleteBatchResult(batchResult);
		
    	return "forward:/sym/bat/getBatchResultList.do";
	}

	/**
	 * 배치결과정보을 상세조회한다.
	 * @return 리턴URL
	 * 
	 * @param batchResult 조회대상 배치결과model
	 * @param model		ModelMap
	 * @exception Exception Exception
	 */
    @RequestMapping("/sym/bat/getBatchResult.do")
	public String selectBatchResult(@ModelAttribute("searchVO")BatchResult batchResult, ModelMap model)
	  throws Exception{
		if (log.isDebugEnabled()) {
			  log.debug(" 조회조건 : " + batchResult);
		}
		BatchResult result = egovBatchResultService.selectBatchResult(batchResult);
		model.addAttribute("resultInfo", result);
		if (log.isDebugEnabled()) {
			log.debug(" 결과값 : " + result);
		}

		return "egovframework/com/sym/bat/EgovBatchResultDetail";
	}

	/**
	 * 배치결과 목록을 조회한다.
	 * @return 리턴URL
	 * 
	 * @param searchVO 목록조회조건VO
	 * @param model		ModelMap
	 * @exception Exception Exception
	 */
    @IncludedInfo(name="배치결과관리", listUrl="/sym/bat/getBatchResultList.do", order = 1130 ,gid = 60)
    @RequestMapping("/sym/bat/getBatchResultList.do")
	public String selectBatchResultList(@ModelAttribute("searchVO")BatchResult searchVO, ModelMap model)
	  throws Exception{
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<BatchResult> resultList = (List<BatchResult>) egovBatchResultService.selectBatchResultList(searchVO);
		int totCnt = egovBatchResultService.selectBatchResultListCnt(searchVO);
		
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", resultList);
		model.addAttribute("resultCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/sym/bat/EgovBatchResultList";
	}


}