<%--
  Filename : ComUtlFccWeekCalc.jsp
  Description : 입력일자에 연, 월, 일을 계산한  일자를 계산하고 요일을 확인하는 기능 TEST JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.02.26    이중호          최초 생성
 
    author   : 이중호
    since    : 2009.02.26
   
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"  %>
<%@page import="java.util.*"  %>

<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js" ></script>
<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
function fn_ready1() {
	if (document.ready1.sDate.value == ''
	||  document.ready1.sDay.value  == '' 	
	) {
		alert("일자, 일은 필수 입력사항입니다.");
		return;
	}

	if(isDate(document.ready1.sDate.value, "일자")) {
		if(isNumber(document.ready1.sDay.value, "일")) {
			document.ready1.submit();
		}else{
			return;
		}
	}else{
		return;
	}
}

function fn_ready2() {
	if (document.ready2.sDate.value == ''
	||  document.ready2.sTime.value  == '' 	
	||  document.ready2.sHour.value  == '' 	
	) {
		alert("일자, 시간, 시는 필수 입력사항입니다.");
		return;
	}
	
	if(isDate(document.ready2.sDate.value, "일자")) {
		if(isNumber(document.ready2.sTime.value, "시간")) {
			if(isNumber(document.ready2.sHour.value, "시")) {
				document.ready2.submit();
			}else{
				return;
			}
		}else{
			return;
		}
	}else{
		return;
	}
}

function fn_ready3() {
	if (document.ready3.sDate.value == ''
	||  document.ready3.sYear.value  == '' 	
	||  document.ready3.sMonth.value  == '' 	
	||  document.ready3.sDay.value  == '' 	
	) {
		alert("일자, 연, 월, 일은 필수 입력사항입니다.");
		return;
	}

	if(isDate(document.ready3.sDate.value, "일자")) {
		if(isNumber(document.ready3.sYear.value, "연")) {
			if(isNumber(document.ready3.sMonth.value, "월")) {
				if(isNumber(document.ready3.sDay.value, "일")) {
					document.ready3.submit();
				}else{
					return;
				}
			}else{
				return;
			}
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
String CmdStr1   = "ComUtlFccWeekCalc1";
String CmdStr2   = "ComUtlFccWeekCalc2";
String CmdStr3   = "ComUtlFccWeekCalc3";
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
	<tr><td>기능설명:</td><td>입력일자에  일을 계산한 일자를 확인</td></tr>
 	<tr><td>일자(yyyyMMdd) :</td><td><input type = "text" name="sDate"  size=10></td></tr> 
 	<tr><td>일 :</td><td><input type = "text" name="sDay"  size=10><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr1)){
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	sDate   = request.getParameter("sDate");
int     sDay    = Integer.parseInt(request.getParameter("sDay"));

String resDate = EgovDateUtil.addYMDtoDayTime(sDate, "0000", 0, 0, sDay, 0, 0, "yyyyMMdd");

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
    <tr><td>일자 : <%=sDate%> </td></tr>
    <tr><td>일 : <%=sDay%> </td></tr>
    <tr><td>결과 : <%=resDate%> </tr>
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
	<tr><td>기능설명:</td><td>입력일자 시간에 시간을 계산한 시간을 확인</td></tr>
 	<tr><td>일자(yyyyMMdd) :</td><td><input type = "text" name="sDate"  size=10></td></tr> 
 	<tr><td>시간(HHmm) :</td><td> <input type = "text" name="sTime"  size=10></td></tr> 
 	<tr><td>시 :</td><td><input type = "text" name="sHour"  size=10><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr2)){
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	sDate   = request.getParameter("sDate");
String	sTime   = request.getParameter("sTime");
int     sHour    = Integer.parseInt(request.getParameter("sHour"));

String resDate = EgovDateUtil.addYMDtoDayTime(sDate, sTime, 0, 0, 0, sHour, 0, "yyyyMMddHHmm");

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
    <tr><td>일자 : <%=sDate%> </td></tr>
    <tr><td>시간 : <%=sTime%> </td></tr>
    <tr><td>시 : <%=sHour%> </td></tr>
    <tr><td>결과 : <%=resDate%> </tr>
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
	<tr><td>기능설명:</td><td>입력일자에 연, 월, 일을 계산한  일자를 계산하고 요일을 확인<br></td></tr>
 	<tr><td>일자(yyyyMMdd):</td><td><input type = "text" name="sDate"  size=10></td></tr> 
 	<tr><td>연 :</td><td><input type = "text" name="sYear"  size=10></td></tr> 
 	<tr><td>월 :</td><td><input type = "text" name="sMonth"  size=10></td></tr> 
 	<tr><td>일 :</td><td><input type = "text" name="sDay"  size=10><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready3()"></td></tr> 
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovDateUtil")){
	if(cmdStr.equals(CmdStr3)){
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	sDate  = request.getParameter("sDate");
int     sYear  = Integer.parseInt(request.getParameter("sYear"));
int     sMonth = Integer.parseInt(request.getParameter("sMonth"));
int     sDay   = Integer.parseInt(request.getParameter("sDay"));

String resDate = EgovDateUtil.addYMDtoWeek(sDate, sYear, sMonth, sDay);

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
    <tr><td>일자 : <%=sDate%> </td></tr>
    <tr><td>연 : <%=sYear%> </td></tr>
    <tr><td>월 : <%=sMonth%> </td></tr>
    <tr><td>일 : <%=sDay%> </td></tr>
    <tr><td>결과 : <%=resDate%> </tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
