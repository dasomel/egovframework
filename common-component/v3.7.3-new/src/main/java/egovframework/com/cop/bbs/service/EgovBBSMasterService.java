package egovframework.com.cop.bbs.service;

import java.util.Map;

import egovframework.com.cop.bbs.service.BlogUser;
import egovframework.com.cop.bbs.service.BlogVO;
import egovframework.com.cop.bbs.service.Blog;
import egovframework.rte.fdl.cmmn.exception.FdlException;

public interface EgovBBSMasterService {

	Map<String, Object> selectNotUsedBdMstrList(BoardMasterVO boardMasterVO);

	void deleteBBSMasterInf(BoardMaster boardMaster);

	void updateBBSMasterInf(BoardMaster boardMaster);

	BoardMasterVO selectBBSMasterInf(BoardMasterVO boardMasterVO) throws Exception;

	Map<String, Object> selectBBSMasterInfs(BoardMasterVO boardMasterVO);
	
	void insertBBSMasterInf(BoardMaster boardMaster) throws FdlException;

	/*
	 * 블로그 관련
	 */
	Map<String, Object> selectBlogMasterInfs(BoardMasterVO boardMasterVO);
	
	String checkBlogUser(BlogVO blogVO);
	
	BlogVO checkBlogUser2(BlogVO blogVO);

	void insertBoardBlogUserRqst(BlogUser blogUser);
	
	void insertBlogMaster(Blog blog) throws FdlException;
	
	BlogVO selectBlogDetail(BlogVO blogVO) throws Exception;

}
