<%--
  Class Name : EgovNumberReplc.jsp
  Description : 특정숫자를 다른 숫자로 치환하는 기능
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
function fn_egov_fm119_submit() {

	if (isNumber(document.fm119.srcNumber.value, "원본숫자") && isNumber(document.fm119.cnvrSrcNumber.value, "변환할 원본숫자") && 
		isNumber(document.fm119.cnvrTrgtNumber.value, "변환할타겟숫자")) {
		      
        document.fm119.submit();
        
    }else{
        
        return;
        
    }

}
</script>

<!-- 준비화면  시작-->
<form name="fm119" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-119">
<input type = "hidden" name="cmdStr" value="REQ-COM-119">
<input type = "hidden" name="link" value="cmm/utl/EgovNumberReplc">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		    특정숫자를 다른 숫자로 치환하는 기능<br>
		  <br>숫자 12345678에서 123를 999로 변환하는 기능을 제공함
		</td>
		<td>
		    원본숫자:<input type = "text" name="srcNumber"  size=10 >
		</td>
		<td>
		    변환할 원본 숫자:<input type = "text" name="cnvrSrcNumber"  size=10 >
		</td>
		<td>
		   변환할 타겟 숫자:<input type = "text" name="cnvrTrgtNumber"  size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onClick="javascript:fn_egov_fm119_submit();"/>		
		</td>				
	</tr> 
</table>
</form>
<!--  준비화면 끝 -->


<%	
}else if(execFlag.equals("REQ-COM-119")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

int srcNumber = Integer.parseInt(safeGetParameter(request,"srcNumber"));
int cnvrSrcNumber = Integer.parseInt(safeGetParameter(request,"cnvrSrcNumber"));
int cnvrTrgtNumber = Integer.parseInt(safeGetParameter(request,"cnvrTrgtNumber"));

int	resultInt = EgovNumberUtil.getNumberCnvr(srcNumber, cnvrSrcNumber, cnvrTrgtNumber);
%>

<!-- 결과화면 시작 -->
<form name="fm119" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-119">
<input type = "hidden" name="link" value="cmm/utl/EgovNumberReplc">
<table border="1">
   	<tr>
   		<td>특정숫자를 다른 숫자로 치환하는 기능 : 
   		</td>
   		<td>값: <%=resultInt%>
   		</td>
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm119.submit()">
</form>
<!--  결과화면 끝 -->




<%
}
%>

