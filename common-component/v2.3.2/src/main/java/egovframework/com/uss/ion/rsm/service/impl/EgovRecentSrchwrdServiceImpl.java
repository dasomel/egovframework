package egovframework.com.uss.ion.rsm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.uss.ion.rsm.service.EgovRecentSrchwrdService;
import egovframework.com.uss.ion.rsm.service.RecentSrchwrd;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 최근검색어를 처리하는 ServiceImpl Class 구현
 * @author 공통서비스 장동한
 * @since 2009.07.03
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.07.03  장동한          최초 생성
 * 
 * </pre>
 */ 
@Service("egovRecentSrchwrdService")
public class EgovRecentSrchwrdServiceImpl extends AbstractServiceImpl 
        implements EgovRecentSrchwrdService { 

    @Resource(name = "onlineRecentSrchwrdDao")
    private RecentSrchwrdDao dao;

    @Resource(name = "egovSrchwrdIdGnrService")
    private EgovIdGnrService egovSrchwrdIdGnrService;

    @Resource(name = "egovSrchwrdManageIdGnrService")
    private EgovIdGnrService egovSrchwrdManageIdGnrService;
    /**
     * 최근검색어관리를(을) 목록을 조회 한다.
     * @param searchVO 조회할 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    public List selectRecentSrchwrdList(RecentSrchwrd searchVO) throws Exception {
        return (List)dao.selectRecentSrchwrdList(searchVO);
    }

    /**
     * 최근검색어관리를(을) 목록 전체 건수를(을) 조회한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return int
     * @throws Exception
     */
    public int selectRecentSrchwrdListCnt(RecentSrchwrd searchVO) throws Exception {
        return (Integer)dao.selectRecentSrchwrdListCnt(searchVO);
    }
    
    /**
     * 최근검색어관리를(을) 상세조회 한다.
     * @param recentSrchwrd 최근검색어관리 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    public RecentSrchwrd selectRecentSrchwrdDetail( RecentSrchwrd recentSrchwrd) throws Exception {
        return (RecentSrchwrd)dao.selectRecentSrchwrdDetail(recentSrchwrd);
    }

    /**
     * 최근검색어관리를(을) 등록한다.
     * @param recentSrchwrd 최근검색어관리 정보가 담김 VO
     * @throws Exception
     */
    public void insertRecentSrchwrd(RecentSrchwrd recentSrchwrd)throws Exception {
        String sMakeId = egovSrchwrdManageIdGnrService.getNextStringId();
        recentSrchwrd.setSrchwrdManageId(sMakeId);
        dao.insertRecentSrchwrd(recentSrchwrd);
    }

    /**
     * 최근검색어관리를(을) 수정한다.
     * @param recentSrchwrd 최근검색어관리 정보가 담김 VO
     * @throws Exception
     */
    public void updateRecentSrchwrd(RecentSrchwrd recentSrchwrd) throws Exception {
        dao.updateRecentSrchwrd(recentSrchwrd);
    }

    /**
     * 최근검색어관리를(을) 삭제한다.
     * @param recentSrchwrd 최근검색어관리 정보가 담김 VO
     * @throws Exception
     */
    public void deleteRecentSrchwrd(RecentSrchwrd recentSrchwrd) throws Exception {
        dao.deleteRecentSrchwrd(recentSrchwrd);
    }
    
    
    /**
     * 최근검색어결과를(을) 목록을 조회 한다.
     * @param searchVO 조회할 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    public List selectRecentSrchwrdResultInquire(RecentSrchwrd recentSrchwrd) throws Exception {
        return (List)dao.selectRecentSrchwrdResultInquire(recentSrchwrd);
    }
    
    /**
     * 최근검색어결과를(을) 목록을 조회 한다.
     * @param searchVO 조회할 정보가 담김 VO
     * @return List
     * @throws Exception
     */
    public List selectRecentSrchwrdResultList(RecentSrchwrd searchVO) throws Exception {
        return (List)dao.selectRecentSrchwrdResultList(searchVO);
    }

    /**
     * 최근검색어결과를(을) 목록 전체 건수를(을) 조회한다.
     * @param searchVO  조회할 정보가 담긴 VO
     * @return int
     * @throws Exception
     */
    public int selectRecentSrchwrdResultListCnt(RecentSrchwrd searchVO) throws Exception {
        return (Integer)dao.selectRecentSrchwrdResultListCnt(searchVO);
    }
    
    /**
     * 최근검색어결과를(을) 등록한다.
     * @param recentSrchwrd 최근검색어관리 정보가 담김 VO
     * @throws Exception
     */
    public void insertRecentSrchwrdResult(RecentSrchwrd recentSrchwrd)throws Exception {
        String sMakeId = egovSrchwrdIdGnrService.getNextStringId();
        recentSrchwrd.setSrchwrdId(sMakeId);
        dao.insertRecentSrchwrdResult(recentSrchwrd);
    }
    
    /**
     * 최근검색어결과를(을) 건별로 삭제 한다.
     * @param recentSrchwrd  최근검색어관리 정보가 담김 VO
     * @throws Exception
     */
    public void deleteRecentSrchwrdResult(RecentSrchwrd recentSrchwrd) throws Exception {
        dao.deleteRecentSrchwrdResult(recentSrchwrd);
    }
    
    /**
     * 최근검색어결과를(을) 관리별로 삭제 한다.
     * @param recentSrchwrd  최근검색어관리 정보가 담김 VO
     * @throws Exception
     */
    public void deleteRecentSrchwrdResultAll(RecentSrchwrd recentSrchwrd) throws Exception {
        dao.deleteRecentSrchwrdResultAll(recentSrchwrd);
    }
    
    
}
