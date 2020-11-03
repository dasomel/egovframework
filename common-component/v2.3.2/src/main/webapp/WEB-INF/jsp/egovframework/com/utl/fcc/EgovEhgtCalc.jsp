<%--
  Class Name : EgovEhgtCalc.jsp
  Description : 환율을 계산하여 결과를 문자열로 출력
  Modification Information
 
      수정일                  수정자                   수정내용
  -------    --------    ---------------------------
 2008.01.01    박정규                 최초 생성
 
    author   : 박정규
    since    : 2009.02.10
   
--%>
 
<%@ page language="java" contentType="text/html; charset=utf-8" session="false" %>
<%@page import="egovframework.com.utl.fcc.service.EgovEhgtCalcUtil"  %>
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
function fn_egov_submit() {
	
	if(isNumber(document.fm124.srcAmount.value, "환율변환대상금액")){      
        document.fm124.submit();
    }else{
        return;
    }

}
</script>

<!-- 준비화면  시작-->
<form name="fm124" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-124">
<input type = "hidden" name="cmdStr" value="REQ-COM-124">
<input type = "hidden" name="link" value="cmm/utl/EgovEhgtCalc">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		     대한민국(KRW), <br> 
		     미국(USD), <br> 
		  유럽연합(EUR),<br> 
		     일본(JPY),   <br> 
		     중국원화(CNY)<br> 
		   사이의 환율을 계산하는 기능 <br>
		</td>
		<td>		
   			<select name="BeforeCondition" class="select">
		   		<option selected value='K'>대한민국(KRW)</option>
		   		<option value='K'>대한민국(KRW)</option>
		   		<option value='U'>미국(USD)</option>
		   		<option value='E'>유럽연합EUR)</option>
		   		<option value='J'>일본(JPY)</option>
		   		<option value='C'>중국연합(CNY)</option>		   		
	   		</select>
		</td>		
		<td>
		    원금액:<input type = "text" name="srcAmount"  size=10 >을(를) ->
		</td>
		<td>		
   			<select name="AfterCondition" class="select">
		   		<option selected value='K'>대한민국(KRW)</option>
		   		<option value='K'>대한민국(KRW)</option>
		   		<option value='U'>미국(USD)</option>
		   		<option value='E'>유럽연합EUR)</option>
		   		<option value='J'>일본(JPY)</option>
		   		<option value='C'>중국연합(CNY)</option>		   		
	   		</select>
		</td>				
		<td> 
			<input type = "button" method="post"  value="환율계산!" onClick="javascript:fn_egov_submit();"/>
		</td>				
   		<td><iframe src="http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/4176_0.html" width="175" height="220" border="0" frameborder="no" scrolling="no" marginwidth="0" hspace="0" vspace="0"> </iframe>
   		</td>
   	</tr>	
</table>
</form>
<!--  준비화면 끝 -->


<%	
}else if(execFlag.equals("REQ-COM-124")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String srcType = safeGetParameter(request,"BeforeCondition");

Long srcAmount  = Long.parseLong(safeGetParameter(request,"srcAmount"));

String cnvrType = safeGetParameter(request,"AfterCondition");


String	resultStr = EgovEhgtCalcUtil.getEhgtCalc(srcType, srcAmount, cnvrType);

%>

<!-- 결과화면 시작 -->
<form name="fm124" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-124">
<input type = "hidden" name="link" value="cmm/utl/EgovEhgtCalc">
<table border="1">
   	<tr>
   		<td>대한민국(KRW), 미국(USD), 유럽연합(EUR), 일본(JPY), 중국원화(CNY) 사이의 환율을 계산하는 기능이다
   		</td>
   		<td><iframe src="http://community.fxkeb.com/fxportal/jsp/RS/DEPLOY_EXRATE/4176_0.html" width="175" height="220" border="0" frameborder="no" scrolling="no" marginwidth="0" hspace="0" vspace="0"> </iframe>
   		</td>
   	</tr>
   	<tr>
		<td>
		  변환유형:<input type = "text" name="srcType"  value = <%=srcType%>   size=3 >&nbsp;&nbsp;&nbsp;&nbsp;
		 원금액:<input type = "text" name="srcAmount"  value = <%=srcAmount%> size=10 >을(를)-> &nbsp;&nbsp;&nbsp;&nbsp;
		  변환유형:<input type = "text" name="cnvrType" value = <%=cnvrType%>  size=3 >
		</td>
   		<td>
   		변환금액: <%=resultStr%>
   		</td>		
   	</tr>
   	
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm124.submit()">
</form>
<!--  결과화면 끝 -->

<%
}
%>

