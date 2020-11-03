<%--
  Filename : ComUtlFccDateCnvr.jsp
  Description : 입력된 데이터 타입의 정보를 일자, 시간, 요일 문자열로 변경/변환하는 기능 TEST JSP
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

<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js" ></script>
<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
function fn_ready1() {
	if (document.ready1.sDate.value == ''
	) {
		alert("일자는 필수 입력사항입니다.");
		return;
	}
	
	if(isDate(document.ready1.sDate.value, "일자")) {
		document.ready1.submit();
	}else{
		return;
	}
}

function fn_ready2() {
	if (document.ready2.sTime.value == ''
	) {
		alert("시간은 필수 입력사항입니다.");
		return;
	}

	if(isNumber(document.ready2.sTime.value, "시간")) {
		document.ready2.submit();
	}else{
		return;
	}
}

function fn_ready3() {
	if (document.ready3.sDate.value == ''
	) {
		alert("일자는 필수 입력사항입니다.");
		return;
	}

	if(isDate(document.ready3.sDate.value, "일자")) {
		document.ready3.submit();
	}else{
		return;
	}
}

function fn_ready4() {
	if (document.ready4.sTime.value == ''
	) {
		alert("시간은 필수 입력사항입니다.");
		return;
	}

	if(isNumber(document.ready4.sTime.value, "시간")) {
		document.ready4.submit();
	}else{
		return;
	}
}

</script>

<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr1   = "ComUtlFccDateCnvr1";
String CmdStr2   = "ComUtlFccDateCnvr2";
String CmdStr3   = "ComUtlFccDateCnvr3";
String CmdStr4   = "ComUtlFccDateCnvr4";
String cmdStr    = "";

if(execFlag==null || execFlag.equals("")) {
	execFlag="READY";
}
if(execFlag.equals("EgovDateUtil")){
	cmdStr = request.getParameter("cmdStr");
}
%>
<%	
if(!execFlag.equals("EgovDateUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready1" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="EgovDateUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
	<tr><td>      기능설명:</td><td>입력된 일자를 String으로 변경 <br></td></tr>
 	<tr><td>일자(yyyyMMdd):</td><td><input type = "text" name="sDate" size=10 title="일자"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%	
}
%>
<%	
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr1)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	sDate = request.getParameter("sDate");

String resDate = EgovDateUtil.convertDate(sDate, "0000", "yyyy-MM-dd");

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
   	<tr><td>일자 :(<%=sDate%>)</td></tr>
   	<tr><td>결과 : <%=resDate%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
<%	
if(!execFlag.equals("EgovDateUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready2" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="EgovDateUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
	<tr><td>      기능설명:</td><td>입력된 시간을 String으로 변경 <br></td></tr>
 	<tr><td>    시간(HHmm):</td><td><input type = "text" name="sTime"  size=10 title="시간"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%	
}
%>
<%	 
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr2)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String  sTime = request.getParameter("sTime");

String resDate = EgovDateUtil.convertDate("00000101", sTime, "HH:mm");

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
   	<tr><td>시간 :(<%=sTime%>)</td></tr>
   	<tr><td>결과 : <%=resDate%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
<%	
if(!execFlag.equals("EgovDateUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready3" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="EgovDateUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
	<tr><td>        기능설명:</td><td>입력된 일자를 int 로 변경 <br></td></tr>
 	<tr><td>일자(yyyy-MM-dd):</td><td><input type = "text" name="sDate"  size=10 title="일자"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready3()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%	
}
%>
<%	
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr3)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	sDate = request.getParameter("sDate");

int resDate = EgovDateUtil.datetoInt(sDate);

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
   	<tr><td>일자 :(<%=sDate%>)</td></tr>
   	<tr><td>결과 : <%=resDate%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
<%	
if(!execFlag.equals("EgovDateUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready4" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="EgovDateUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr4%>">
<table border="1">
	<tr><td>       기능설명:</td><td>입력된 시간을 Int 로 변경 <br></td></tr>
 	<tr><td>    시간(HH:mm):</td><td><input type = "text" name="sTime"  size=10 title="시간"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready4()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%	
}
%>
<%	 
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr4)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String  sTime = request.getParameter("sTime");

int resDate = EgovDateUtil.timetoInt(sTime);

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr4%>">
<table border="1">
   	<tr><td>시간 :(<%=sTime%>)</td></tr>
   	<tr><td>결과 : <%=resDate%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>