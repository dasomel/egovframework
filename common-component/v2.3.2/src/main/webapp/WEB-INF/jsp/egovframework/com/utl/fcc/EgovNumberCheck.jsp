<%--
  Filename : ComUtlFccNumberCheck.jsp
  Description : 입력주민번호, 입력법인번호, 입력사업자번호, 입력외국인등록번호가   유효한지 확인하는 기능 TEST JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.06.10    윤성록          최초 생성
 
    author   : 윤성록
    since    : 2009.06.10
   
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovNumberCheckUtil"%>
<%@page import="java.util.*"  %>

<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js" ></script>
<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
function fn_ready1() {
	if (document.ready1.identy1.value == '' || document.ready1.identy2.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}
		document.ready1.submit();	
}

function fn_ready2() {
	if (document.ready2.bubin1.value == '' || document.ready2.bubin2.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}	
		document.ready2.submit();
}

function fn_ready3() {
	if (document.ready3.comp1.value == ''
	||  document.ready3.comp2.value == ''
	||  document.ready3.comp3.value == ''
	) {
		alert(" 필수 입력사항입니다.");
		return;
	}
			document.ready3.submit();		
}

function fn_ready4() {
	if (document.ready4.foreign1.value == ''
	||  document.ready4.foreign2.value == ''
	) {
		alert(" 필수 입력사항입니다.");
		return;
	}
				document.ready4.submit();		
}

function fn_ready5() {
	if (document.ready1.identy.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}
		document.ready1.submit();	
}

function fn_ready6() {
	if (document.ready2.bubin.value == ''
	) {
		alert("필수 입력사항입니다.");
		return;
	}	
		document.ready2.submit();
}

function fn_ready7() {
	if (document.ready3.comp.value == ''
	) {
		alert(" 필수 입력사항입니다.");
		return;
	}
			document.ready3.submit();		
}

function fn_ready8() {
	if (document.ready4.foreign.value == ''
	) {
		alert(" 필수 입력사항입니다.");
		return;
	}
				document.ready4.submit();		
}

</script>
<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr1   = "ComUtlFccJuminNumberCheck";
String CmdStr2   = "ComUtlFccBubinNumberCheck";
String CmdStr3   = "ComUtlFccCompNumberCheck";
String CmdStr4   = "ComUtlFccForeignCheck";

String cmdStr    = "";

if(execFlag==null || execFlag.equals("")) {
	execFlag="READY";
}
if(execFlag.equals("EgovNumberCheckUtil")){
	cmdStr = request.getParameter("cmdStr");
}
%>
<%
if(!execFlag.equals("EgovNumberCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready1" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="EgovNumberCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
	<tr><td>            기능설명:</td><td>주민등록번호가  유효한 주민등록번호인지 확인하는 기능<br></td></tr>
 	<tr><td>      주민번호:</td><td><input type = "text" name="identy1"  maxlength="6" size="6"> -
 									 <input type = "text" name="identy2"  maxlength="7" size="7">
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()"></td></tr>
    <tr><td>주민번호("-"생략):</td><td><input type = "text" name="identy"  maxlength="13" size="13"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready5()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovNumberCheckUtil")){
	if(cmdStr.equals(CmdStr1)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	identy1 = request.getParameter("identy1");
String	identy2 = request.getParameter("identy2");
String  identy = request.getParameter("identy");

boolean resultType1 = EgovNumberCheckUtil.checkJuminNumber(identy1,identy2);
boolean resultType2 = EgovNumberCheckUtil.checkJuminNumber(identy);


%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
	<%if(identy.equals("")) {%>
   	<tr><td>주민번호:(<%=identy1+" - "+identy2%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>주민번호:(<%=identy%>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
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
if(!execFlag.equals("EgovNumberCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready2" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="EgovNumberCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
	<tr><td>            기능설명:</td><td>법인번호가  유효한 법인번호인지 확인하는 기능<br></td></tr>
 	<tr><td>       법인번호:</td><td><input type = "text" name="bubin1"  maxlength="6" size="5"> -
 									 <input type = "text" name="bubin2"  maxlength="7" size="6">
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr>
    <tr><td>법인번호("-"생략):</td><td><input type = "text" name="bubin"  maxlength="13" size="13"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready6()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovNumberCheckUtil")){
	if(cmdStr.equals(CmdStr2)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String  bubin1 = request.getParameter("bubin1");
String  bubin2 = request.getParameter("bubin2");
String  bubin = request.getParameter("bubin");

boolean resultType1 = EgovNumberCheckUtil.checkBubinNumber(bubin1,bubin2);
boolean resultType2 = EgovNumberCheckUtil.checkBubinNumber(bubin);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
	<%if(bubin.equals("")) {%>
   	<tr><td>법인번호:(<%=bubin1+" - "+bubin2%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>법인번호:(<%=bubin%>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
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
if(!execFlag.equals("EgovNumberCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready3" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="EgovNumberCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
	<tr><td>            기능설명:</td><td>사업자 번호가 유효한 사업자번호인지  확인하는 기능<br></td></tr>
 	<tr><td>      사업자번호:</td><td><input type = "text" name="comp1"  maxlength="3" size="3"> -
 									 <input type = "text" name="comp2"  maxlength="2" size="2"> - 
 									 <input type = "text" name="comp3"  maxlength="5" size="4">  									 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready3()"></td></tr>
    <tr><td>사업자번호("-"생략):</td><td><input type = "text" name="comp"  maxlength="13" size="13"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready7()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovNumberCheckUtil")){
	if(cmdStr.equals(CmdStr3)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
System.out.println("라기천재");
String	comp1 = request.getParameter("comp1");
String  comp2 = request.getParameter("comp2");
String  comp3 = request.getParameter("comp3");
String  comp = request.getParameter("comp");

boolean resultType1 = EgovNumberCheckUtil.checkCompNumber(comp1,comp2,comp3);
boolean resultType2 = EgovNumberCheckUtil.checkCompNumber(comp);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr3%>">
<table border="1">
<%if(comp.equals("")) {%>
   	<tr><td>사업자번호:(<%=comp1+" - "+comp2 +" - "+comp3%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>사업자번호:(<%=comp%>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
   	<% }%></table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
<%
if(!execFlag.equals("EgovNumberCheckUtil")){
%>
<!-- 준비화면  시작-->
<form name="ready4" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="EgovNumberCheckUtil">
<input type = "hidden" name="cmdStr" value="<%=CmdStr4%>">
<table border="1">
	<tr><td>            기능설명:</td><td>외국인등록번호가  유효한 외국인등록번호인지 확인하는 기능<br></td></tr>
 	<tr><td>      외국인등록번호:</td><td><input type = "text" name="foreign1"  maxlength="6" size="5"> -
 									 <input type = "text" name="foreign2"  maxlength="7" size="6">
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready4()"></td></tr>
	<tr><td>외국인등록번호("-"생략):</td><td><input type = "text" name="foreign"  maxlength="13" size="13"> 
 									 <input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready8()"></td></tr>
</table>
</form>
<!--  준비화면 끝 -->
<%
}
%>
<%	
if(execFlag.equals("EgovNumberCheckUtil")){
	if(cmdStr.equals(CmdStr4)){
%>
<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String	foreign1 = request.getParameter("foreign1");
String	foreign2 = request.getParameter("foreign2");
String	foreign = request.getParameter("foreign");

boolean resultType1 = EgovNumberCheckUtil.checkforeignNumber(foreign1,foreign2);
boolean resultType2 = EgovNumberCheckUtil.checkforeignNumber(foreign);
%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovNumberCheckUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr4%>">
<table border="1">
<%if(foreign.equals("")) {%>
   	<tr><td>외국인등록번호:(<%=foreign1+" - "+foreign2%>)</td><td>결과:<%=resultType1?"True":"False"%></td></tr>
   	<%}else {%>
   	<tr><td>외국인등록번호:(<%=foreign%>)</td><td>결과:<%=resultType2?"True":"False"%></td></tr>
   	<% }%></table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>
