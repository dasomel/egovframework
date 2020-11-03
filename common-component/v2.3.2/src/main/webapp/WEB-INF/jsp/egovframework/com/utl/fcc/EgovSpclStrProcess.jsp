<%--
  Class Name : EgovSpclStrProcess.jsp
  Description : 특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리('<' -> & LT)하는 기능
  Modification Information
 
      수정일                  수정자                   수정내용
  -------    --------    ---------------------------
 2009.02.01    박정규                 최초 생성
 
    author   : 박정규
    since    : 2009.02.10
   
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovStringUtil"  %>
<%@page import="java.util.*"  %>
<%!
    String safeGetParameter (HttpServletRequest request, String name){
        String value = request.getParameter(name);
        if (value == null) {
            value = "";
        }
        return value;
    }
%>

<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">

<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = safeGetParameter(request,"execFlag");
if(execFlag==null || execFlag.equals("")) {
	execFlag="READY";
}
 
%>
<%
if(execFlag.equals("READY")){
	// 실행을 위한 화면 준비
	System.out.println("READY");
%>

<!-- 준비화면  시작-->
<form name="fm123" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-123">
<input type = "hidden" name="cmdStr" value="REQ-COM-123">
<input type = "hidden" name="link" value="cmm/utl/EgovSpclStrProcess">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		     특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리('<' -> & LT)하는 기능 <br>
		</td>
		<td>
		    원본문자열:<input type = "text" name="srcString"  size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm123.submit()">
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->



<%	
}else if(execFlag.equals("REQ-COM-123")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String srcString = safeGetParameter(request,"srcString");

String	resultStr = EgovStringUtil.getSpclStrCnvr(srcString);
%>

<!-- 결과화면 시작 -->
<form name="fm123" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-123">
<input type = "hidden" name="link" value="cmm/utl/EgovSpclStrProcess">
<table border="1">
   	<tr>
   		<td>특수문자를 웹 브라우저에서 정상적으로 보이기 위해 특수문자를 처리('<' -> & LT)하는 기능
   		</td>
   		<td>값: <%=resultStr%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm123.submit()">
</form>
<!--  결과화면 끝 -->



<%
}
%>

