package egovframework.com.uss.olp.mgt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.uss.olp.mgt.service.EgovMeetingManageService;
import egovframework.com.uss.olp.mgt.service.MeetingManageVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
/**
 * 회의관리를 처리하기 위한 ServiceImpl 구현 Class
 * @author 공통서비스 장동한
 * @since 2009.03.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  장동한          최초 생성
 *
 * </pre>
 */
@Service("egovMeetingManageService")
public class EgovMeetingManageServiceImpl extends AbstractServiceImpl implements EgovMeetingManageService{

	//final private Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="meetingManageDao")
	private MeetingManageDao dao;
	
	@Resource(name="egovMgtIdGnrService")
	private EgovIdGnrService idgenService;
	
    /**
	 * 부서 목록을 조회한다. 
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @throws Exception
	 */
	public List egovMeetingManageLisAuthorGroupPopup(ComDefaultVO searchVO){
		return (List)dao.egovMeetingManageLisAuthorGroupPopup(searchVO);
	}
	
    /**
	 * 아이디 목록을 조회한다. 
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @throws Exception
	 */
	public List egovMeetingManageLisEmpLyrPopup(ComDefaultVO searchVO){
		return (List)dao.egovMeetingManageLisEmpLyrPopup(searchVO);
	}
	
    /**
	 * 회의정보 목록을 조회한다. 
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @throws Exception
	 */
	public List selectMeetingManageList(ComDefaultVO searchVO) throws Exception{
		return (List)dao.selectMeetingManageList(searchVO);
	}
	
    /**
	 * 회의정보를 상세조회 한다.
	 * @param MeetingManageVO - 회정정보가 담김 VO
	 * @return List
	 * @throws Exception
	 */
	public List selectMeetingManageDetail(MeetingManageVO meetingManageVO) throws Exception{
		return (List)dao.selectMeetingManageDetail(meetingManageVO);
	}
	
    /**
	 * 회의정보를 목록 전체 건수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return int 
	 * @throws Exception
	 */
	public int selectMeetingManageListCnt(ComDefaultVO searchVO) throws Exception{
		return (Integer)dao.selectMeetingManageListCnt(searchVO);
	}

    /**
	 * 회의정보를 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @throws Exception
	 */
	public void insertMeetingManage(MeetingManageVO meetingManageVO) throws Exception {
		String sMakeId = idgenService.getNextStringId();
		
		meetingManageVO.setMtgId(sMakeId);

		dao.insertMeetingManage(meetingManageVO);
	}
	
    /**
	 * 회의정보를 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @throws Exception
	 */
	public void updateMeetingManage(MeetingManageVO meetingManageVO){
		dao.updateMeetingManage(meetingManageVO);
	}
	
    /**
	 * 회의정보를 삭제한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @throws Exception
	 */
	public void deleteMeetingManage(MeetingManageVO meetingManageVO){
		dao.deleteMeetingManage(meetingManageVO);
	}
}
