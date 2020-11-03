package egovframework.com.uss.ion.wik.bmk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.com.uss.ion.wik.bmk.service.EgovWikiBookmarkService;
import egovframework.com.uss.ion.wik.bmk.service.WikiBookmark;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 위키북마크를 처리하는 ServiceImpl Class 구현
 * @author 공통콤포넌트 장동한
 * @since 2010.10.20
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.10.20  장동한          최초 생성
 * 
 * </pre>
 */
@Service("egovWikiBookmarkService")
public class EgovWikiBookmarkServiceImpl extends AbstractServiceImpl implements EgovWikiBookmarkService {

	/* 위키북마크 DAO */
    @Resource(name = "wikiBookmarkDao")
    private WikiBookmarkDao dao;

    /* WIKI_ID Generator Service */
    @Resource(name = "egovWikiBookmarkIdGnrService")
    private EgovIdGnrService idgenService;
	
    protected Log log = LogFactory.getLog(this.getClass());
    
    /**
	 * 위키북마크 목록을 조회한다. 
	 * @param wikiBookmark -조회할 정보가 담긴 객체
	 * @return List
	 * @throws Exception
	 */
	public List selectWikiBookmarkList(WikiBookmark wikiBookmark) throws Exception{
		return (List)dao.selectWikiBookmarkList(wikiBookmark);
	}
	
    /**
     * 위키북마크를(을) 목록 전체 건수를(을) 조회한다.
     * @param wikiBookmark  -조회할 정보가 담긴 객체
     * @return int -조회한건수가담긴Integer
     * @throws Exception
     */
    public int selectWikiBookmarkListCnt(WikiBookmark wikiBookmark) throws Exception{
    	return (Integer)dao.selectWikiBookmarkListCnt(wikiBookmark);
    }
    
    /**
     * 위키북마크를(을) 중복을 조회한다.
     * @param wikiBookmark  -조회할 정보가 담긴 객체
     * @return int -조회한건수가담긴Integer
     * @throws Exception
     */
    public int selectWikiBookmarkDuplicationCnt(WikiBookmark wikiBookmark) throws Exception{
    	return (Integer)dao.selectWikiBookmarkDuplicationCnt(wikiBookmark);
    }
    
    /**
	 * 위키북마크를(을) 등록한다.
	 * @param wikiBookmark -위키북마크 정보 담김 객체
	 * @throws Exception
	 */
    public void insertWikiBookmark(WikiBookmark wikiBookmark) throws Exception{
    	//아이디 가져오기
  
    	String sUsid  = (String)dao.selectWikiBookmarkEmpUniqId(wikiBookmark);
    	
    	log.debug("EgovWikiBookmarkServiceImpl.java sUsid>" + sUsid);

		//아이디 비교
    	if(sUsid != null){
    		//위키북마크 키 설정
        	wikiBookmark.setWikiBkmkId((String)idgenService.getNextStringId());
        	//아이디 설정
    		wikiBookmark.setUsid((String)sUsid);
    		wikiBookmark.setFrstRegisterId((String)sUsid);
    		wikiBookmark.setLastUpdusrId((String)sUsid);
    		dao.insertWikiBookmark(wikiBookmark);
    		log.debug("insertWikiBookmark>" + sUsid);
    	};
    	
	}
	
     /**
	 * 위키북마크를(을) 삭제한다.
	 * @param wikiBookmark -위키북마크 정보 담김 객체
	 * @throws Exception
	 */
	public void deleteWikiBookmark(WikiBookmark wikiBookmark) throws Exception{
		dao.deleteWikiBookmark(wikiBookmark);
	}
	
}
