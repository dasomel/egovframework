package egovframework.com.uss.ion.rec.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.uss.ion.rec.service.EgovRecomendSiteManageService;
import egovframework.com.uss.ion.rec.service.RecomendSiteManageDefaultVO;
import egovframework.com.uss.ion.rec.service.RecomendSiteManageVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;



/**
 * 
 * 추천사이트정보를 처리하는 구현 클래스
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
@Service("RecomendSiteManageService")
public class EgovRecomendSiteManageServiceImpl extends AbstractServiceImpl implements
        EgovRecomendSiteManageService {

    @Resource(name="RecomendSiteManageDAO")
    private RecomendSiteManageDAO recomendSiteManageDAO;
        
    /** ID Generation */    
	@Resource(name="egovRecomendSiteManageIdGnrService")
	private EgovIdGnrService idgenService;

    
    /**
	 * 추천사이트 상세조회를 한다.
	 * @param vo
	 * @return 조회한 글
	 * @exception Exception
	 */
    public RecomendSiteManageVO selectRecomendSiteDetail(RecomendSiteManageVO vo) throws Exception {
        RecomendSiteManageVO resultVO = recomendSiteManageDAO.selectRecomendSiteDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 추천사이트 목록을 조회한다.
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
    public List selectRecomendSiteList(RecomendSiteManageDefaultVO searchVO) throws Exception {
        return recomendSiteManageDAO.selectRecomendSiteList(searchVO);
    }

    /**
	 * 추천사이트 총 갯수를 조회한다.
	 * @param searchVO
	 * @return 글 총 갯수
	 * @exception
	 */
    public int selectRecomendSiteListTotCnt(RecomendSiteManageDefaultVO searchVO) {
		return recomendSiteManageDAO.selectRecomendSiteListTotCnt(searchVO);
	}
    
	/**
	 * 추천사이트를 등록한다.
	 * @param vo
	 * @exception Exception
	 */
    public void insertRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
		String	recomendSiteId = idgenService.getNextStringId();

		vo.setRecomendSiteId(recomendSiteId);
		
    	recomendSiteManageDAO.insertRecomendSiteInfo(vo);    	
    }
    
	/**
	 * 추천사이트를 수정한다.
	 * @param vo
	 * @exception Exception
	 */
    public void updateRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	           	
    	recomendSiteManageDAO.updateRecomendSiteInfo(vo);    	
    }

	/**
	 * 추천사이트를 삭제한다.
	 * @param vo
	 * @exception Exception
	 */
    public void deleteRecomendSiteInfo(RecomendSiteManageVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
    	recomendSiteManageDAO.deleteRecomendSiteInfo(vo);    	
    }
    
}
