<%--
  Class Name : EgovRandomNumber.jsp
  Description : 특정숫자 집합에서 랜덤 숫자를 구하는 기능
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

<script type="text/javascript" src="/js/egovframework/com/cmm/utl/EgovCmmUtl.js" ></script>
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
function fn_egov_fm115_submit() {
	
	if (isNumber(document.fm115.startNum.value, "시작숫자") && isNumber(document.fm115.endNum.value, "종료숫자")) {      
        document.fm115.submit();
    }else{
        return;
    }

}
</script>

<!-- 준비화면  시작-->
<form name="fm115" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-115">
<input type = "hidden" name="cmdStr" value="REQ-COM-115">
<input type = "hidden" name="link" value="cmm/utl/EgovRandomNumber">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    특정숫자 집합에서 랜덤 숫자를 구하는 기능<br>
		  <br>시작숫자와 종료숫자 사이에서 구한 랜덤숫자를 반환한다.
		</td>
		<td>
		    시작숫자:<input type = "text" name="startNum"  size=10 >
		</td>
		<td>
		    종료숫자:<input type = "text" name="endNum"  	size=10>
		</td>										
		<td>
			<input type = "button" method="post"  value="실행!" onClick="javascript:fn_egov_fm115_submit();"/>		 
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->

<%	
}else if(execFlag.equals("REQ-COM-115")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인
int startNum = Integer.parseInt(safeGetParameter(request,"startNum"));
int endNum 	 = Integer.parseInt(safeGetParameter(request,"endNum"));

int resultInt = EgovNumberUtil.getRandomNum(startNum, endNum);
%>

<!-- 결과화면 시작 -->
<form name="fm115" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" value="REQ-COM-115">
<input type = "hidden" name="link" value="cmm/utl/EgovRandomNumber">
<table border="1">
   	<tr>
   		<td>특정숫자집합에서 랜덤 숫자를 구하는 기능- (util클래스로 확인) : 
   		</td>
   		<td>값: <%=resultInt%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm115.submit()">
</form>
<!--  결과화면 끝 -->

<%
}
%>

