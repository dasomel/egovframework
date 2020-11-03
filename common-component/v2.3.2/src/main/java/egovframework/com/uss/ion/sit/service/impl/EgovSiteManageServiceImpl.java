package egovframework.com.uss.ion.sit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.uss.ion.sit.service.EgovSiteManageService;
import egovframework.com.uss.ion.sit.service.SiteManageDefaultVO;
import egovframework.com.uss.ion.sit.service.SiteManageVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


/**
 * 
 * 사이트정보를 처리하는 구현 클래스
 * @author 공통서비스 개발팀 박정규
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  박정규          최초 생성
 *
 * </pre>
 */
@Service("SiteManageService")
public class EgovSiteManageServiceImpl extends AbstractServiceImpl implements
        EgovSiteManageService {

    @Resource(name="SiteManageDAO")
    private SiteManageDAO siteManageDAO;
        
    /** ID Generation */    
	@Resource(name="egovSiteManageIdGnrService")
	private EgovIdGnrService idgenService;

    
    /**
	 * 사이트상세정보를 조회한다.
	 * @param vo - 조회할 정보가 담긴 SiteManageVO
	 * @return 조회한 글
	 * @exception Exception
	 */
    public SiteManageVO selectSiteDetail(SiteManageVO vo) throws Exception {
        SiteManageVO resultVO = siteManageDAO.selectSiteDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 사이트정보 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
    public List selectSiteList(SiteManageDefaultVO searchVO) throws Exception {
        return siteManageDAO.selectSiteList(searchVO);
    }

    /**
	 * 사이트정보 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
    public int selectSiteListTotCnt(SiteManageDefaultVO searchVO) {
		return siteManageDAO.selectSiteListTotCnt(searchVO);
	}
    
	/**
	 * 사이트정보를 등록한다.
	 * @param vo - 등록할 정보가 담긴 SiteManageVO
	 * @exception Exception
	 */
    public void insertSiteInfo(SiteManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
		String	siteId = idgenService.getNextStringId();

		vo.setSiteId(siteId);
		
    	siteManageDAO.insertSiteInfo(vo);    	
    }
    
	/**
	 * 사이트정보를 수정한다.
	 * @param vo - 수정할 정보가 담긴 SiteManageVO
	 * @exception Exception
	 */
    public void updateSiteInfo(SiteManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	           	
    	siteManageDAO.updateSiteInfo(vo);    	
    }

	/**
	 * 사이트정보를 삭제한다.
	 * @param vo - 수정할 정보가 담긴 SiteManageVO
	 * @exception Exception
	 */
    public void deleteSiteInfo(SiteManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
    	siteManageDAO.deleteSiteInfo(vo);    	
    }
    
}
