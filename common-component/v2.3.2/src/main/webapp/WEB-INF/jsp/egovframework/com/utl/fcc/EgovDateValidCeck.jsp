<%--
  Filename : ComUtlFccDateValidCeck.jsp
  Description : 입력일자, 입력일자의 입력요일 및 입력시간이  유효한지 확인하는 기능 TEST JSP
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
	if (document.ready3.sTime.value == ''
	||  document.ready3.iWeek.value == ''
	) {
		alert("일자, 요일은 필수 입력사항입니다.");
		return;
	}

	if(isDate(document.ready3.sDate.value, "일자")) {
		if(isNumber(document.ready3.iWeek.value, "요일")) {
			document.ready3.submit();
		}else{
			return;
		}
	}else{
		return;
	}
}

</script>
<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr1   = "ComUtlFccDateValidCeck1";
String CmdStr2   = "ComUtlFccDateValidCeck2";
String CmdStr3   = "ComUtlFccDateValidCeck3";
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
	<tr><td>            기능설명:</td><td>입력일자가  유효한 일자인지 확인하는 기능<br></td></tr>
 	<tr><td>      일자(yyyyMMdd):</td><td><input type = "text" name="sDate"  size=8 title="일자"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()"></td></tr>
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

boolean resultDate = EgovDateUtil.validDate(sDate);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
   	<tr><td>입력일자:(<%=sDate%>)</td><td>결과:<%=resultDate?"True":"False"%></td></tr>
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
	<tr><td>            기능설명:</td><td>입력시간이  유효한지 시간인지 확인하는 기능<br></td></tr>
 	<tr><td>          시간(HHmm):</td><td><input type = "text" name="sTime"  size=4 title="시간"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr>
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

boolean resultTime = EgovDateUtil.validTime(sTime);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
   	<tr><td>    시간:(<%=sTime%>)</td><td>결과:<%=resultTime?"True":"False"%></td></tr>
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
	<tr><td>            기능설명:</td><td>입력일자의 요일이 입력요일과  동일한지 확인하는 기능<br></td></tr>
 	<tr><td>      일자(yyyyMMdd):</td><td><input type = "text" name="sDate"  size=8 title="일자"></td></tr>
 	<tr><td>요일(1~7 ; 1:일요일):</td><td><select name="sWeek" title="요일"><option value=1>일요일</option><option value=2>월요일</option><option value=3>화요일</option><option value=4>수요일</option><option value=5>목요일</option><option value=6>금요일</option><option value=7>토요일</option><!-- input type = "text" name="sWeek"  size=1 --></select><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready3()"></td></tr>
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
String  sWeek = request.getParameter("sWeek");

int iWeek = 0;
if (!sWeek.equals("")){
	iWeek = Integer.parseInt(sWeek);
}

boolean resultWeek = EgovDateUtil.validDate(sDate, iWeek);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
   	<tr><td>    요일:(<%=sWeek%>)</td><td>결과:<%=resultWeek?"True":"False"%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
