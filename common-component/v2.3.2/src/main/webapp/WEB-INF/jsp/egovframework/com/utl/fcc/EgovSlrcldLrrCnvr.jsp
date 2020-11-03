<%--
  Filename : ComUtlFccSlrcldLrrCnvr.jsp
  Description : 양력/음력 변환기능 TEST JSP
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
	if (document.ready2.sDate.value == ''
	) {
		alert("일자는 필수 입력사항입니다.");
		return;
	}

	if(isDate(document.ready2.sDate.value, "일자")) {
		document.ready2.submit();
	}else{
		return;
	}
}

</script>

<%
// 준비화면, 실행결과 출력화면의 구분
String execFlag = request.getParameter("execFlag");
String CmdStr1   = "ComUtlFccSlrcldLrrCnvr1";
String CmdStr2   = "ComUtlFccSlrcldLrrCnvr2";
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
	<tr><td>기능설명:</td><td>양력->음력 변환기능<br></td></tr>
 	<tr><td>양력일자(yyyyMMdd):</td><td><input type = "text" name="sSlrDate"  size=10><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready1()"></td></tr> 
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
String	sSlrDate = request.getParameter("sSlrDate");

HashMap hm = EgovDateUtil.toLunar(sSlrDate);

String  retLrrDate   = hm.get("day").toString();
String  retLeapMonth = hm.get("leap").toString(); 


%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr1%>">
<table border="1">
   	<tr><td>입력일자:(<%=sSlrDate%>)</td><td>결과(음력):<%=retLeapMonth.equals("0")?"평달":"윤달"%> <%=retLrrDate%></td></tr>
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
	<tr><td>기능설명:</td><td>음력->양력 변환기능<br></td></tr>
 	<tr><td>음력일자(yyyyMMdd):</td><td><select name="iLeapMonth"><option value=0>평달</option><option value=1>윤달</option><input type = "text" name="sLrrDate"  size=10><input type = "button" method="post"  value="실행!" onclick="javascript:fn_ready2()"></td></tr> 
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
String  sLrrDate = request.getParameter("sLrrDate");
int   iLeapMonth = Integer.parseInt(request.getParameter("iLeapMonth"));

String retSlrDate = EgovDateUtil.toSolar(sLrrDate, iLeapMonth);

%>

<!-- 결과화면 시작 -->
<form name="result" action ="/utl/fcc/EgovDateUtil.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="<%=CmdStr2%>">
<table border="1">
   	<tr><td>입력일자 :(<%=sLrrDate%>)</td><td>결과(양력): <%=retSlrDate%></td></tr>
</table> 
<br>
<input type = "button" method="post"  value="테스트로 돌아가기" onclick="result.submit()">
</form>
<!--  결과화면 끝 -->
<%
	}
}
%>

