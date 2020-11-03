package egovframework.com.uss.ion.nts.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uss.ion.nts.service.EgovNoteTrnsmitService;
import egovframework.com.uss.ion.nts.service.NoteTrnsmit;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 보낸쪽지함관리를 처리하는 Controller Class 구현
 * @author 공통서비스 장동한
 * @since 2010.06.16
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.06.16  장동한          최초 생성
 *    2011.8.26	정진오			IncludedInfo annotation 추가
 * 
 * </pre>
 */

@Controller
public class EgovNoteTrnsmitController {
	
	 
	 

    @Autowired
    private DefaultBeanValidator beanValidator;

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

    /** egovOnlinePollService */
    @Resource(name = "egovNoteTrnsmitService")
    private EgovNoteTrnsmitService egovNoteTrnsmitService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	protected Log log = LogFactory.getLog(this.getClass());
	
    /**
     * 보낸쪽지함관리 목록을 조회한다.
     * @param searchVO -검색정보가 담긴 객체 
     * @param commandMap -Request Variable
     * @param noteTrnsmit -보낸쪽지함정보가 담긴객체
     * @param model -Spring 제공하는 ModelMap
     * @return String -리턴 URL
     * @throws Exception
     */
	@IncludedInfo(name="보낸쪽지함관리", order = 860 ,gid = 50)
    @RequestMapping(value = "/uss/ion/nts/listNoteTrnsmit.do")
    public String EgovNoteTrnsmitList(
    		@ModelAttribute("searchVO") NoteTrnsmit searchVO, 
            Map commandMap,
            @ModelAttribute("noteTrnsmit") NoteTrnsmit noteTrnsmit, 
            ModelMap model) throws Exception {
    	
    	//변수 설정
    	String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
    	
		//Spring Security 사용자권한 처리
	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	    if (!isAuthenticated) {
	        model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
	        return "egovframework/com/uat/uia/EgovLoginUsr";
	    }
	    
        //로그인 객체 선언
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
        
        //삭제 모드로 실행시
        if(sCmd.equals("del")){
	        //한개의 값으로 삭제가 넘어올때 처리
	        if(commandMap.get("checkList") instanceof String){
	            String sCheckList = (String)commandMap.get("checkList");
	            
	            String[] sArrCheckListValue = sCheckList.split(",");
	            
	            log.debug("==================================EgovNoteTrnsmitList");
	            log.debug("checkList" + sCheckList);
	            log.debug("sArrCheckListValue[0]>" + sArrCheckListValue[0]);
	            log.debug("sArrCheckListValue[1]>" + sArrCheckListValue[1]);
	            
	            noteTrnsmit.setFrstRegisterId((String)loginVO.getUniqId());
	            noteTrnsmit.setLastUpdusrId((String)loginVO.getUniqId());
	            noteTrnsmit.setNoteId(sArrCheckListValue[0]);
	            noteTrnsmit.setNoteTrnsmitId(sArrCheckListValue[1]);
	            
	            egovNoteTrnsmitService.deleteNoteTrnsmit(noteTrnsmit);
	            
	        }
	
	        //여러개의 값으로 삭제가 넘어올때 처리
	        if(commandMap.get("checkList") instanceof String[]){
	            String[] sArrCheckList  = (String[])commandMap.get("checkList");
	            log.debug("sArrCheckList" + sArrCheckList);
	            
	            for(int i=0;i<sArrCheckList.length;i++){
	                String[] sArrCheckListValue = sArrCheckList[i].split(",");
	                
	                noteTrnsmit.setFrstRegisterId((String)loginVO.getUniqId());
	                noteTrnsmit.setLastUpdusrId((String)loginVO.getUniqId());
	                noteTrnsmit.setNoteId(sArrCheckListValue[0]);
	                noteTrnsmit.setNoteTrnsmitId(sArrCheckListValue[1]);
	                
	                egovNoteTrnsmitService.deleteNoteTrnsmit(noteTrnsmit);
	            }
	        }
	        
	        //삭제후 페이지 인덱스 설정
	        searchVO.setPageIndex(1);
        }
        
        
        /** EgovPropertyService.sample */
        searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
        searchVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
        paginationInfo.setPageSize(searchVO.getPageSize());

        searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
        searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
        //발시자설정
        searchVO.setTrnsmiterId((String)loginVO.getUniqId());
        
        List reusltList = egovNoteTrnsmitService.selectNoteTrnsmitList(searchVO);
        model.addAttribute("resultList", reusltList);

        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));

        int totCnt = (Integer) egovNoteTrnsmitService.selectNoteTrnsmitListCnt(searchVO);
        paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        
    	return "egovframework/com/uss/ion/nts/EgovNoteTrnsmitList";

    }

    /**
     * 보낸쪽지함관리 목록을 상세조회 조회한다.
     * @param searchVO -검색정보가 담긴 객체 
     * @param commandMap -Request Variable
     * @param model -Spring 제공하는 ModelMap
     * @return String -리턴 URL
     * @throws Exception
     */
    @RequestMapping(value = "/uss/ion/nts/detailNoteTrnsmit.do")
    public String EgovNoteTrnsmitDetail(
    		@ModelAttribute("searchVO") NoteTrnsmit searchVO, 
            Map commandMap,
            ModelMap model) throws Exception {
    	
    		String sLocationUrl = "egovframework/com/uss/ion/nts/EgovNoteTrnsmitDetail";

            String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

    		//Spring Security 사용자권한 처리
    	    Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	    if (!isAuthenticated) {
    	        model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	        return "egovframework/com/uat/uia/EgovLoginUsr";
    	    }
    	    
            //로그인 객체 선언
            LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
            
            if(sCmd.equals("del")){
            	searchVO.setFrstRegisterId((String)loginVO.getUniqId());
            	searchVO.setLastUpdusrId((String)loginVO.getUniqId());
            	//log.debug("EgovNoteTrnsmitDetail searchVO>"+searchVO);
            	egovNoteTrnsmitService.deleteNoteTrnsmit(searchVO);
            	
            	sLocationUrl = "redirect:/uss/ion/nts/listNoteTrnsmit.do";
            }else{
            	Map noteTrnsmitMap = egovNoteTrnsmitService.selectNoteTrnsmitDetail(searchVO);
            	model.addAttribute("noteTrnsmit", noteTrnsmitMap);
            	
                List resultRecptnEmp = egovNoteTrnsmitService.selectNoteTrnsmitCnfirm(searchVO);
            	model.addAttribute("resultRecptnEmp", resultRecptnEmp);
            }
    	
    		return sLocationUrl;
    }
    
    /**
     * 수신자목록을 조회한다.
     * @param noteTrnsmit -보낸쪽지함 정보가 담긴 객체
     * @param commandMap -Request Variable
     * @param model -Spring 제공하는 ModelMap
     * @return String -리턴 URL
     * @throws Exception
     */
    @RequestMapping(value = "/uss/ion/nts/selectNoteTrnsmitCnfirm.do")
    public String EgovNoteTrnsmitCnfirm(
    		NoteTrnsmit noteTrnsmit, 
    		Map commandMap,
            ModelMap model) throws Exception {

    		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");
    		
    		if(sCmd.equals("del")){
    			egovNoteTrnsmitService.deleteNoteRecptn(noteTrnsmit);
    		}
    		
            List resultList = egovNoteTrnsmitService.selectNoteTrnsmitCnfirm(noteTrnsmit);
        	model.addAttribute("resultList", resultList);
    	
    		return "egovframework/com/uss/ion/nts/EgovNoteTrnsmitCnfirm";
    }

}
