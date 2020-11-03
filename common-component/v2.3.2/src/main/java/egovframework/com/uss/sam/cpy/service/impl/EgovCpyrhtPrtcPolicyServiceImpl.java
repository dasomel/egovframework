package egovframework.com.uss.sam.cpy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.uss.sam.cpy.service.CpyrhtPrtcPolicyDefaultVO;
import egovframework.com.uss.sam.cpy.service.CpyrhtPrtcPolicyVO;
import egovframework.com.uss.sam.cpy.service.EgovCpyrhtPrtcPolicyService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 
 * 저작권보호정책내용을 처리하는 비즈니스 구현 클래스
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
@Service("CpyrhtPrtcPolicyService")
public class EgovCpyrhtPrtcPolicyServiceImpl extends AbstractServiceImpl implements
        EgovCpyrhtPrtcPolicyService {

    @Resource(name="CpyrhtPrtcPolicyDAO")
    private CpyrhtPrtcPolicyDAO cpyrhtPrtcPolicyDAO;
        
    /** ID Generation */    
	@Resource(name="egovCpyrhtPrtcPolicyIdGnrService")
	private EgovIdGnrService idgenService;

    
    /**
	 * 저작권보호정책 글을 조회한다.
	 * @param vo
	 * @return 조회한 글
	 * @exception Exception
	 */
    public CpyrhtPrtcPolicyVO selectCpyrhtPrtcPolicyDetail(CpyrhtPrtcPolicyVO vo) throws Exception {
        CpyrhtPrtcPolicyVO resultVO = cpyrhtPrtcPolicyDAO.selectCpyrhtPrtcPolicyDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * 저작권보호정책 글 목록을 조회한다.
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
    public List selectCpyrhtPrtcPolicyList(CpyrhtPrtcPolicyDefaultVO searchVO) throws Exception {
        return cpyrhtPrtcPolicyDAO.selectCpyrhtPrtcPolicyList(searchVO);
    }

    /**
	 * 저작권보호정책 글 총 갯수를 조회한다.
	 * @param searchVO
	 * @return 글 총 갯수
	 */
    public int selectCpyrhtPrtcPolicyListTotCnt(CpyrhtPrtcPolicyDefaultVO searchVO) {
		return cpyrhtPrtcPolicyDAO.selectCpyrhtPrtcPolicyListTotCnt(searchVO);
	}
    
	/**
	 * 저작권보호정책 글을 등록한다.
	 * @param vo
	 * @exception Exception
	 */
    public void insertCpyrhtPrtcPolicyCn(CpyrhtPrtcPolicyVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
		String	cpyrhtId = idgenService.getNextStringId();

		vo.setCpyrhtId(cpyrhtId);
		
    	cpyrhtPrtcPolicyDAO.insertCpyrhtPrtcPolicyCn(vo);    	
    }
    
	/**
	 * 저작권보호정책 글을 수정한다.
	 * @param vo
	 * @exception Exception
	 */
    public void updateCpyrhtPrtcPolicyCn(CpyrhtPrtcPolicyVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	           	
    	cpyrhtPrtcPolicyDAO.updateCpyrhtPrtcPolicyCn(vo);    	
    }

	/**
	 * 저작권보호정책 글을 삭제한다.
	 * @param vo
	 * @exception Exception
	 */
    public void deleteCpyrhtPrtcPolicyCn(CpyrhtPrtcPolicyVO vo) throws Exception {
    	log.debug(vo.toString());
    	    	
    	cpyrhtPrtcPolicyDAO.deleteCpyrhtPrtcPolicyCn(vo);    	
    }
    
}
