<%--
  Filename : ComUtlFccFormatCeck.jsp
  Description : 입력 전화번호, 입력 폰번호 , 입력 이메일 주소의 형식이  유효한 형식인지 확인하는 기능 TEST JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.06.23    윤성록          최초 생성
 
    author   : 윤성록
    since    : 2009.06.23
   
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovFormatCheckUtil" %>
<%@page import="java.util.*"  %>

<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js" ></script>
<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
function fn_ready1() {
	if (document.ready1.tell1.value == '' || document.ready1.tell2.value == '' || document.ready1.tell3.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}
		document.ready1.submit();	
}

function fn_ready2() {
	if (document.ready2.cell1.value == '' || document.ready2.cell2.value == '' || document.ready2.cell3.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}	
		document.ready2.submit();
}

function fn_ready3() {
	if (document.ready3.mail1.value == '' ||  document.ready3.mail2.value == ''
	) {
		alert(" 필수 입력사항입니다.");
		return;
	}
			document.ready3.submit();		
}

function fn_ready4() {
	if (document.ready1.tell.value == ''	
	) {
		alert(" 필수 입력사항입니다.");
		return;
	}
				document.ready1.submit();		
}

function fn_ready5() {
	if (document.ready2.cell.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}
		document.ready2.submit();	
}

function fn_ready6() {
	if (document.ready3.mail.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}	
		document.ready3.submit();
}

</script>
<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr1   = "ComUtlFccFormatTellCheck";
String CmdStr2   = "ComUtlFccFormatCellCheck";
String CmdStr3   = "ComUtlFccFormatMailCheck";

String cmdStr    = "";

if(execFlag==null || execFlag.equals("")) {
	execFlag="READY";
}
if(execFlag.equals("EgovFormatCheckUtil")){
	cmdStr = request.getParameter("cmdStr");
}
%>
<%
if(!execFlag.equals("EgovFormatCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready1" action ="/utl/fcc/EgovFormatCheckUtil.do">
<input type = "hidden" name="execFlag" value="EgovFormatCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
	<tr><td>            기능설명:</td><td>입력된 전화번호의 형식이 맞는지를 체크한다<br></td></tr>
 	<tr><td>      전화번호:</td><td><input type = "text" name="tell1"  maxlength="4" size="4"> -
 									 <input type = "text" name="tell2"  maxlength="4" size="4"> -
 									 <input type = "text" name="tell3"  maxlength="4" size="4">
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()"></td></tr>
    <tr><td>전화번호("-"생략):</td><td><input type = "text" name="tell"  maxlength="11" size="11"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready4()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%
if(execFlag.equals("EgovFormatCheckUtil")){
	if(cmdStr.equals(CmdStr1)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	tell1 = request.getParameter("tell1");
String	tell2 = request.getParameter("tell2");
String  tell3 = request.getParameter("tell3");
String  tell = request.getParameter("tell");

boolean resultType1 = EgovFormatCheckUtil.checkFormatTell(tell1,tell2,tell3);
boolean resultType2 = EgovFormatCheckUtil.checkFormatTell(tell);


%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovFormatCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
	<%if(tell.equals("")) {%>
   	<tr><td>전화번호:(<%=tell1 + " - " + tell2 + " - " + tell3%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>전화번호:( <%= tell %>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
   	<% }%>
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
if(!execFlag.equals("EgovFormatCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready2" action ="/utl/fcc/EgovFormatCheckUtil.do">

<input type = "hidden" name="execFlag" value="EgovFormatCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
	<tr><td>            기능설명:</td><td>입력된 휴대폰번호의 형식이 맞는지 확인한다.<br></td></tr>
 	<tr><td>       휴대폰번호:</td><td><input type = "text" name="cell1"  maxlength="3" size="3" onfocus=""> -
 									 <input type = "text" name="cell2"  maxlength="4" size="4"> - 
 									 <input type = "text" name="cell3"  maxlength="4" size="4">
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr>
    <tr><td>휴대폰번호("-"생략):</td><td><input type = "text" name="cell"  maxlength="11" size="11"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready5()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovFormatCheckUtil")){
	if(cmdStr.equals(CmdStr2)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String  cell1 = request.getParameter("cell1");
String  cell2 = request.getParameter("cell2");
String  cell3 = request.getParameter("cell3");
String  cell = request.getParameter("cell");

boolean resultType1 = EgovFormatCheckUtil.checkFormatCell(cell1, cell2, cell3);
boolean resultType2 = EgovFormatCheckUtil.checkFormatCell(cell);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovFormatCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
	<%if(cell.equals("")) {%>
   	<tr><td>휴대폰번호:(<%=cell1+" - "+cell2%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>휴대폰번호:(<%=cell%>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
   	<% }%>
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
if(!execFlag.equals("EgovFormatCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready3" action ="/utl/fcc/EgovFormatCheckUtil.do">
<input type = "hidden" name="execFlag" value="EgovFormatCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
	<tr><td>            기능설명:</td><td>입력된 이메일의 형식이 맞는지를 검사한다.<br></td></tr>
 	<tr><td>      이메일주소:</td><td><input type = "text" name="mail1"  maxlength="12" size="14"> @
 									 <input type = "text" name="mail2"  maxlength="12" size="14"> 									 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready3()"></td></tr>
    <tr><td>이메일주소:</td><td><input type = "text" name="mail"  maxlength="24" size="24"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready6()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovFormatCheckUtil")){
	if(cmdStr.equals(CmdStr3)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String	mail1 = request.getParameter("mail1");
String  mail2 = request.getParameter("mail2");
String  mail = request.getParameter("mail");

boolean resultType1 = EgovFormatCheckUtil.checkFormatMail(mail1,mail2);
boolean resultType2 = EgovFormatCheckUtil.checkFormatMail(mail);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovFormatCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
<%if(mail.equals("")) {%>
   	<tr><td>메일주소:(<%=mail1+" @ "+mail2%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>메일주소:(<%=mail%>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
   	<% }%></table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>

