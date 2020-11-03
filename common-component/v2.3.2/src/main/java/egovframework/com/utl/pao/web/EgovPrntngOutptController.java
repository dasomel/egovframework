package egovframework.com.utl.pao.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * 전자관인 출력 화면 Controller 클래스
 * @author 공통서비스 개발팀 이중호
 * @since 2009.02.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.02.01  이중호          최초 생성
 *
 * </pre>
 */
@Controller
public class EgovPrntngOutptController{

    protected final Log logger = LogFactory.getLog(getClass());

    /**
     * 전자관인 출력 화면 컨트롤
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping(value="/utl/pao/EgovPrntngOutpt.do")
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("EgovPrntngOutptController start....");
        Map<String, Object> cmdModel = new HashMap<String, Object>();

        // 이동할 JSP
        String jspStr = "";
        // 결과정보
        String resultStr = "";
        // 실행명령어
        String cmdStr = request.getParameter("cmdStr");
        if(cmdStr==null||cmdStr.equals("")){
        	cmdStr="";
        }


        // 실행명령어에 따른 JSP 할당
        if(cmdStr.equals("ComUtlPaoErncslOutpt")){ // test 샘플용 경로
        	jspStr = "egovframework/com/utl/pao/EgovErncslOutpt";

        	try {
        		cmdModel.put("resultStr", "UTILITY 직접 호출");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				jspStr = "/egovDevIndex";
				//e.printStackTrace();
				logger.error(e);	// 2011.10.10 보안점검 후속조치
			}
        } else {
        	jspStr = "/egovDevIndex";
        }
        logger.info("EgovPrntngOutptController end....");
        return new ModelAndView(jspStr, "cmdModel", cmdModel);
    }
}