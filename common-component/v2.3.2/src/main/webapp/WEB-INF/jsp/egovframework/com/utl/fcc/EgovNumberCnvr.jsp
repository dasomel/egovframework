<%--
  Class Name : EgovNumberCnvr.jsp
  Description : 숫자타입을 문자열로  변환하는 기능, 숫자타입을 데이트타입으로 변환하는 기능
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
function fn_egov_fm117_1_submit() {
	
	if(isNumber(document.fm117_1.cnvrNumber.value, "원본숫자")){      
        document.fm117_1.submit();
    }else{
        return;
    }

}

</script>


<!-- 준비화면  시작-->
<form name="fm117_1" id="fm117_1" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-117_1">
<input type = "hidden" name="cmdStr" value="REQ-COM-117">
<input type = "hidden" name="link" value="cmm/utl/EgovNumberCnvr">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    숫자타입을 문자열로  변환하는 기능<br>
		  <br>숫자 20081212를 문자열 '20081212'로 변환하는 기능<br>		  
		</td>
		<td>
		    원본숫자:<input type = "text" name="cnvrNumber" id="cnvrNumber"  size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onClick="javascript:fn_egov_fm117_1_submit();"/>			
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->

<script type="text/javaScript" language="javascript">
function fn_egov_fm117_2_submit() {
	
	if(isNumber(document.fm117_2.cnvrNumber.value, "원본숫자")){      
		if(isDate(document.fm117_2.cnvrNumber.value, "원본숫자")){  
	       	 document.fm117_2.submit();
		}
    }else{
        return;
    }

}
</script>
<!-- 준비화면  시작-->
<form name="fm117_2" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-117_2">
<input type = "hidden" name="cmdStr" value="REQ-COM-117">
<input type = "hidden" name="link" value="cmm/utl/EgovNumberCnvr">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    숫자타입을 데이터타입으로 변환하는 기능<br>
		  <br>숫자 20081212를 데이터타입  '2008-12-12'로 변환하는 기능		  
		</td>
		<td>
		    원본숫자:<input type = "text" name="cnvrNumber"  size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onClick="javascript:fn_egov_fm117_2_submit();"/>			
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->



<%	
}else if(execFlag.equals("REQ-COM-117_1")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

int    cnvrNumber = Integer.parseInt(safeGetParameter(request,"cnvrNumber"));

String	resultStr = EgovNumberUtil.getNumToStrCnvr(cnvrNumber);
%>

<!-- 결과화면 시작 -->
<form name="fm117_1" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-117">
<input type = "hidden" name="link" value="cmm/utl/EgovNumberCnvr">
<table border="1">
   	<tr>
   		<td>숫자타입을 문자열로 변환하는 기능 : 
   		</td>
   		<td>값: <%=resultStr%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm117_1.submit()">
</form>
<!--  결과화면 끝 -->

<%	
}else if(execFlag.equals("REQ-COM-117_2")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

int    cnvrNumber = Integer.parseInt(safeGetParameter(request,"cnvrNumber"));

// Date형식으로 변환 후 다시  String형태로 다시 변환("YYYY-MM-DD");
String	resultStr = EgovNumberUtil.getNumToDateCnvr(cnvrNumber);

%>

<!-- 결과화면 시작 -->
<form name="fm117_2" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-117">
<input type = "hidden" name="link" value="cmm/utl/EgovNumberCnvr">
<table border="1">
   	<tr>
   		<td>숫자타입을 데이트타입으로 변환하는 기능 : 
   		</td>
   		<td>값: <%=resultStr%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm117_2.submit()">
</form>
<!--  결과화면 끝 -->



<%
}
%>

