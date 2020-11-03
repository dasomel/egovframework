<%--
  Filename : ComUtlFccDfkCnvr.jsp
  Description : 입력된 데이터 타입의 정보를 일자, 시간, 요일 문자열로 변경/변환하는 기능 TEST JSP
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.02.26    이중호          최초 생성

    author   : 이중호
    since    : 2009.02.26

--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=utf-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovDateUtil"  %>
<%@page import="java.util.*"  %>
<%@page import="java.text.SimpleDateFormat"  %>

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
	if (document.ready3.sWeek.value == ''
	) {
		alert("요일은 필수 입력사항입니다.");
		return;
	}

	document.ready3.submit();
}

</script>
<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr1   = "ComUtlFccDfkCnvr1";
String CmdStr2   = "ComUtlFccDfkCnvr2";
String CmdStr3   = "ComUtlFccDfkCnvr3";
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
	<tr><td>      기능설명:</td><td>입력된 일자를 포멧스트링 형태로 변경 </td>
	</tr>
 	<tr>
 		<td colspan="2">
 		<pre>
	           G  Era designator  Text  AD
	           y  Year  Year  1996; 96
	           M  Month in year  Month  July; Jul; 07
	           w  Week in year  Number  27
	           W  Week in month  Number  2
	           D  Day in year  Number  189
	           d  Day in month  Number  10
	           F  Day of week in month  Number  2
	           E  Day in week  Text  Tuesday; Tue
	           a  Am/pm marker  Text  PM
	           H  Hour in day (0-23)  Number  0
	           k  Hour in day (1-24)  Number  24
	           K  Hour in am/pm (0-11)  Number  0
	           h  Hour in am/pm (1-12)  Number  12
	           m  Minute in hour  Number  30
	           s  Second in minute  Number  55
	           S  Millisecond  Number  978
	           z  Time zone  General time zone  Pacific Standard Time; PST; GMT-08:00
	           Z  Time zone  RFC 822 time zone  -0800
	    </pre>
 		</td>
 	</tr>
 	<tr>
 		<td>일자(yyyyMMdd):</td>
 		<td>
		 	<input type = "text" name="sDate"  size="10" title="일자">
 		</td>
 	</tr>
 	<tr>
 		<td>포멧스트링(yyyy-MM-dd):</td>
 		<td>
		 	<input type = "text" name="sFormatStr"  size=30 value='yyyy-MM-dd' title="포멧스트링">
		 	<input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()">
 		</td>
 	</tr>

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
String	sDate      = request.getParameter("sDate");
String	sFormatStr = request.getParameter("sFormatStr");
Calendar cal  = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("HHmm",Locale.ENGLISH);
String  sTime = sdf.format(cal.getTime());

String resDate = EgovDateUtil.convertDate(sDate, sTime, sFormatStr);

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
	<tr><td>      기능설명:</td><td>입력된 시간을 포멧스트링 형태로 변경 <br></td></tr>
 	<tr>
 		<td>시간(HHmm):</td>
 		<td>
		 	<input type = "text" name="sTime"  size=10 title="시간">
 		</td>
 	</tr>
 	<tr>
 		<td>포멧스트링(yyyy-MM-dd):</td>
 		<td>
		 	<input type = "text" name="sFormatStr"  size=30 value='HH:mm' title="포멧스트링">
		 	<input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr>
 		</td>
 	</tr>
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
String  sTime      = request.getParameter("sTime");
String  sFormatStr = request.getParameter("sFormatStr");

Calendar cal  = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd",Locale.ENGLISH);
String  sDate = sdf.format(cal.getTime());

String resDate = EgovDateUtil.convertDate(sDate, sTime, sFormatStr);

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
	<tr><td>기능설명:</td><td>입력된 요일을 한글 요일로 변경하는 기능</td></tr>
 	<tr><td>요일(SUN, MON, ..., SAT):</td><td><input type = "text" name="sWeek"  size=10 title="요일"><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready3()"></td></tr>
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
String sWeek   = request.getParameter("sWeek");
String resDate = EgovDateUtil.convertWeek(sWeek);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
   	<tr>
   		<td>요일 : (<%=sWeek%>)
   		</td>
   	</tr>
   	<tr>
   		<td>결과 : <%=resDate%>
   	</tr>
</table>
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
