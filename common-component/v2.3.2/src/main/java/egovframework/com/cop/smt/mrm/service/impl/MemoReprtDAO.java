package egovframework.com.cop.smt.mrm.service.impl;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cop.smt.mrm.service.MemoReprt;
import egovframework.com.cop.smt.mrm.service.MemoReprtVO;
import egovframework.com.cop.smt.mrm.service.ReportrVO;
import egovframework.com.utl.fcc.service.EgovDateUtil;

/**
 * 개요
 * - 메모보고에 대한 DAO 클래스를 정의한다.
 * 
 * 상세내용
 * - 메모보고에 대한 등록, 수정, 삭제, 조회기능을 제공한다.
 * - 메모보고의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 장철호
 * @version 1.0
 * @created 19-7-2010 오전 10:14:53
 */
@Repository("MemoReprtDAO")
public class MemoReprtDAO extends EgovComAbstractDAO {
	
	/**
	 * 주어진 조건에 맞는 보고자를 불러온다.
	 * @param ReportrVO
	 * @return List
	 * 
	 * @param reportrVO
	 */
	@SuppressWarnings("unchecked")
	public List<ReportrVO> selectReportrList(ReportrVO reportrVO) throws Exception{
		return list("MemoReprtDAO.selectReportrList", reportrVO);
	}
	
	/**
	 * 보고자 목록에 대한 전체 건수를 조회한다.
	 * @param ReportrVO
	 * @return int
	 * 
	 * @param reportrVO
	 */
	public int selectReportrListCnt(ReportrVO reportrVO) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("MemoReprtDAO.selectReportrListCnt", reportrVO);
	}
	
	/**
	 * 주어진 조건에 맞는 직위명을 불러온다.
	 * @param DeptVO
	 * @return String
	 * 
	 * @param DeptVO
	 */
	public String selectWrterClsfNm(String wrterId) throws Exception{
		return (String)selectByPk("MemoReprtDAO.selectWrterClsfNm", wrterId);
	}
	
	/**
	 * 주어진 조건에 따른 메모보고 목록을 불러온다.
	 * @param MemoReprtVO - 메모보고 VO
	 * @return List<MemoReprtVO> - 메모보고 List
	 * 
	 * @param memoReprtVO
	 */
	@SuppressWarnings("unchecked")
	public List<MemoReprtVO> selectMemoReprtList(MemoReprtVO memoReprtVO) throws Exception{
		//날짜관련
		memoReprtVO.setSearchBgnDe(memoReprtVO.getSearchBgnDe().replaceAll("-", ""));
		memoReprtVO.setSearchEndDe(memoReprtVO.getSearchEndDe().replaceAll("-", ""));
		
		List<MemoReprtVO> resultList = list("MemoReprtDAO.selectMemoReprtList", memoReprtVO);
		for(int i=0; i < resultList.size(); i++){
			MemoReprtVO resultVO = resultList.get(i);
			resultVO.setReprtDe(EgovDateUtil.convertDate(resultVO.getReprtDe(), "0000", "yyyy-MM-dd"));
			resultList.set(i, resultVO);
		}
		return resultList;
	}

	/**
	 * 주어진 조건에 맞는 메모보고를 불러온다.
	 * @param MemoReprtVO - 메모보고 VO
	 * @return MemoReprtVO - 메모보고 VO
	 * 
	 * @param memoReprtVO
	 */
	public MemoReprtVO selectMemoReprt(MemoReprtVO memoReprtVO) throws Exception{
		MemoReprtVO resultVO = (MemoReprtVO)selectByPk("MemoReprtDAO.selectMemoReprt", memoReprtVO);
		resultVO.setReprtDe(EgovDateUtil.convertDate(resultVO.getReprtDe(), "0000", "yyyy-MM-dd"));
		return resultVO;
	}

	/**
	 * 메모보고 정보의 보고자 조회일시를 수정한다.
	 * @param MemoReprt - 메모보고 model
	 * 
	 * @param memoReprt
	 */
	public void readMemoReprt(MemoReprt memoReprt) throws Exception{
		update("MemoReprtDAO.readMemoReprt", memoReprt);
	}

	/**
	 * 메모보고 정보를 수정한다.
	 * @param MemoReprt - 메모보고 model
	 * 
	 * @param memoReprt
	 */
	public void updateMemoReprt(MemoReprt memoReprt) throws Exception{
		//날짜관련
		memoReprt.setReprtDe(memoReprt.getReprtDe().replaceAll("-", ""));
		update("MemoReprtDAO.updateMemoReprt", memoReprt);
	}

	/**
	 * 메모보고 정보의 지시사항을 등록한다.
	 * @param MemoReprt - 메모보고 model
	 * 
	 * @param memoReprt
	 */
	public void updateMemoReprtDrctMatter(MemoReprt memoReprt) throws Exception{
		update("MemoReprtDAO.updateMemoReprtDrctMatter", memoReprt);
	}

	/**
	 * 메모보고 정보를 등록한다.
	 * @param MemoReprt - 메모보고 model
	 * 
	 * @param memoReprt
	 */
	public void insertMemoReprt(MemoReprt memoReprt) throws Exception{
		//날짜관련
		memoReprt.setReprtDe(memoReprt.getReprtDe().replaceAll("-", ""));
		insert("MemoReprtDAO.insertMemoReprt", memoReprt);
	}

	/**
	 * 메모보고 정보를 삭제한다.
	 * @param MemoReprt - 메모보고 model
	 * 
	 * @param memoReprt
	 */
	public void deleteMemoReprt(MemoReprt memoReprt) throws Exception{
		delete("MemoReprtDAO.deleteMemoReprt", memoReprt);
	}

	/**
	 * 메모보고 목록에 대한 전체 건수를 조회한다.
	 * @param MemoReprtVO - 메모보고 VO
	 * @return int - 메모보고 목록 갯수
	 * 
	 * @param memoReprtVO
	 */
	public int selectMemoReprtListCnt(MemoReprtVO memoReprtVO) throws Exception{
		//날짜관련
		memoReprtVO.setSearchBgnDe(memoReprtVO.getSearchBgnDe().replaceAll("-", ""));
		memoReprtVO.setSearchEndDe(memoReprtVO.getSearchEndDe().replaceAll("-", ""));
		
		return (Integer)getSqlMapClientTemplate().queryForObject("MemoReprtDAO.selectMemoReprtListCnt", memoReprtVO);
	}

}