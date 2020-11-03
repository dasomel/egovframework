<%--
  Class Name : EgovRandomStr.jsp
  Description : 문자열 A에서 Z사이의 랜덤 문자열을 구하는 기능을 제공함
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

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 실행버튼클릭시
 ******************************************************** */
function fnSubmit(){ 

	if(document.getElementById("startStr").value == ""){
		alert("시작문자열을 입력해주세요!");
		document.getElementById("startStr").focus();
		return;
	}


	if(document.getElementById("endStr").value == ""){
		alert("종료문자열을  입력해주세요!");
		document.getElementById("endStr").focus();
		return;
	}


	document.getElementById("fm114").submit();
}
</script>
<!-- 준비화면  시작-->
<form name="fm114" id="fm114" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-114">
<input type = "hidden" name="cmdStr" value="REQ-COM-114">
<input type = "hidden" name="link" value="cmm/utl/EgovRandomStr">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
			문자열 A에서 Z사이의 랜덤 문자열을 구하는 기능을 제공함<br>
		  <br>시작 문자열과 종료 문자열 사이의 랜덤 문자열을 구한 값		
		</td>
		<td>
		    시작문자열:<input type = "text" name="startStr" id="startStr"  size=1 >
		</td>
		<td>
		    종료문자열:<input type = "text" name="endStr"  id="endStr" 	size=1>
		</td>										
		<td> <input type = "button" method="post"  value="실행!" onclick="fnSubmit()">
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->



<%	
}else if(execFlag.equals("REQ-COM-114")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
String startStr = safeGetParameter(request,"startStr");
String endStr   = safeGetParameter(request,"endStr");

char	startChr = startStr.charAt(0);
char	endChr   = endStr.charAt(0);

String resultStr = EgovStringUtil.getRandomStr(startChr, endChr);
%>

<!-- 결과화면 시작 -->
<form name="fm114" action ="/EgovPageLink.do">
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="REQ-COM-114">
<input type = "hidden" name="link" value="cmm/utl/EgovRandomStr">
<table border="1">
   	<tr>
   		<td>랜덤 문자열구하기(A ~ Z)- (util클래스로 확인) : 
   		</td>
   		<td>값: <%=resultStr%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm114.submit()">
</form>
<!--  결과화면 끝 -->


<%
}
%>

