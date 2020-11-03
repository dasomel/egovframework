<%--
  Filename : ComUtlFccDeRndmCreate.jsp
  Description : 두 개의 날짜 사이의 랜덤일자를 구하는 기능 TEST JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.02.26    이중호          최초 생성
 
    author   : 이중호
    since    : 2009.02.26
   
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"  %>
<%@page import="java.util.*"  %>
<script type="text/javaScript" language="javascript">
function fn_ready() {
	if (document.ready.startDate.value == ''
	||  document.ready.endDate.value == ''
	) {
		alert("시작일자, 종료일자는 필수 입력사항입니다.");
		return;
	}

	if(isDate(document.ready.startDate.value, "시작일자")) {
		if(isDate(document.ready.endDate.value, "종료일자")) {
			document.ready.submit();
		}else{
			return;
		}
	}else{
		return;
	}
}
</script>

<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js" ></script>
<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">

<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr   = "ComUtlFccDeRndmCreate";
if(execFlag==null || execFlag.equals("")) {
	execFlag="READY";
}
%>

<%	
if(!execFlag.equals("EgovDateUtil")){
%>

<!-- 준비화면  시작-->
<form name="ready" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="EgovDateUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr%>">
<table border="1">
	<tr><td>기능설명:</td><td>두 개의 날짜 사이의 랜덤일자를 구하는 기능</td></tr>
	<tr><td>시작날짜(yyyyMMdd):</td><td><input type = "text" name="startDate"  size=10 title="시작날짜"></td></tr>
	<tr><td>종료날짜(yyyyMMdd):</td><td><input type = "text" name="endDate"  	size=10 title="종료날짜"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>

<%	
if(execFlag.equals("EgovDateUtil")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	startDate = request.getParameter("startDate");
String  endDate   = request.getParameter("endDate");

String resultStr = EgovDateUtil.getRandomDate(startDate,endDate);
%>


<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr%>">
<table border="1">
   	<tr><td>랜덤날짜구하기 (<%=startDate%>~<%=endDate%>)</td><td>값: <%=resultStr%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->


<%
}
%>

