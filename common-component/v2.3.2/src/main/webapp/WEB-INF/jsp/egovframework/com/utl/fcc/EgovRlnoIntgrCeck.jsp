<%--
  Class Name : EgovRlnoIntgrCeck.jsp
  Description : 특정숫자가 실수인지, 정수인지, 음수인지 체크하는 기능
  Modification Information
 
      수정일                  수정자                   수정내용
  -------    --------    ---------------------------
 2009.02.01    박정규                 최초 생성
 
    author   : 박정규
    since    : 2009.02.10
   
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovNumberUtil"  %>
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
<form name="fm120" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-120">
<input type = "hidden" name="cmdStr" value="REQ-COM-120">
<input type = "hidden" name="link" value="cmm/utl/EgovRlnoIntgrCeck">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    특정숫자가 실수인지, 정수인지, 음수인지 체크하는 기능<br>
		  <br>123이 실수인지, 정수인지, 음수인지 체크하는 기능을 제공함.
		</td>
		<td>
		    원본숫자:<input type = "text" name="srcNumber"  size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm120.submit()">
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->



<%	
}else if(execFlag.equals("REQ-COM-120")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
double srcNumber = Double.parseDouble(safeGetParameter(request,"srcNumber"));

int	resultInt = EgovNumberUtil.checkRlnoInteger(srcNumber);
%>

<!-- 결과화면 시작 -->
<form name="fm120" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-120">
<input type = "hidden" name="link" value="cmm/utl/EgovRlnoIntgrCeck">
<table border="1">
   	<tr>
   		<td>특정숫자가 실수인지, 정수인지, 음수인지 체크하는 기능 : 
   		</td>
   		<td>값: <%=resultInt%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm120.submit()">
</form>
<!--  결과화면 끝 -->




<%
}
%>

