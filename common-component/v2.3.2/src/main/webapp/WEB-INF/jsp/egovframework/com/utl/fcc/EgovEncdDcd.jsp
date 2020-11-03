<%--
  Class Name : EgovEncdDcd.jsp
  Description : 문자열을 다양한 문자셋(EUC-KR,UTF-8..)을 사용하여 인코딩하는 기능
  Modification Information
 
      수정일                  수정자                   수정내용
  -------    --------    ---------------------------
 2008.01.01    박정규                 최초 생성
 
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

String cnvrStr = safeGetParameter(request,"cnvrStr");

%>
<%
if(execFlag.equals("READY")){
	// 실행을 위한 화면 준비
	System.out.println("READY");
	

%>

<!-- 준비화면  시작-->
<form name="fm122_1" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-122_1">
<input type = "hidden" name="cmdStr" value="REQ-COM-122">
<input type = "hidden" name="cnvrStr">
<input type = "hidden" name="link" value="cmm/utl/EgovEncdDcd">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		     문자열을 EUC-KR => UTF-8 인코딩하는 기능 <br> 
		</td>
		<td>
		    원본문자열:<input type = "text" name="srcString"  size=10 >
		</td>
		<td>
		    원본Charset:<input type = "text" name="srcCharset"  value="ksc5601" size=10 >
		</td>		
		<td>
		   인코딩타입:<input type = "text" name="EncdType"  value="8859_1" size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm122_1.submit()">
		</td>						
	</tr> 	 
</table>
</form>
<!--  준비화면 끝 -->

<!-- 준비화면  시작-->
<form name="fm122_2" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="REQ-COM-122_2">
<input type = "hidden" name="cmdStr" value="REQ-COM-122">
<input type = "hidden" name="cnvrStr">
<input type = "hidden" name="link" value="cmm/utl/EgovEncdDcd">
<table border="1">
	<tr>
		<td>
		기능설명:
		</td>
		<td>
		     문자열을  UTF-8 => EUC-KR 디코딩하는 기능 <br> 
		</td>
		<td>
		    원본문자열:<input type = "text" name="srcString"  value =<%=cnvrStr%> size=10 >
		</td>
		<td>
		    원본Charset:<input type = "text" name="srcCharset"  value="8859_1" size=10 >
		</td>		
		<td>
		   디코딩타입:<input type = "text" name="DcdType"  value="ksc5601" size=10 >
		</td>
		<td> 
			<input type = "button" method="post"  value="실행!" onclick="fm122_2.submit()">
		</td>						
	</tr> 	 
</table>
</form>
<!--  준비화면 끝 -->



<%	
}else if(execFlag.equals("REQ-COM-122_1")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String srcString = safeGetParameter(request,"srcString");

String srcCharset = safeGetParameter(request,"srcCharset");

String EncdType = safeGetParameter(request,"EncdType");

String	resultEncd = EgovStringUtil.getEncdDcd( srcString, srcCharset, EncdType);


%>

<!-- 결과화면 시작 -->
<form name="fm122_1" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr"   value="REQ-COM-122">
<input type = "hidden" name="cnvrStr"  value=<%=resultEncd%>>
<input type = "hidden" name="link" value="cmm/utl/EgovEncdDcd">
<table border="1">
   	<tr>
   		<td>문자열을 다양한 문자셋을 사용하여 인코딩하는 기능 : 
   		</td>
   		<td>원래 인코딩 문자열[ <%=srcString%> ]
   		</td>
   		<td>인코딩 결과 [ <%=resultEncd%> ] 
   		</td>   		
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm122_1.submit()">
</form>
<!--  결과화면 끝 -->

<%	
}else if(execFlag.equals("REQ-COM-122_2")){
%>

<%
//실행결과 출력화면인 경우 결과정보 확인 - util 형태로 바로 확인

String srcString 	= safeGetParameter(request,"srcString");
String srcCharset 	= safeGetParameter(request,"srcCharset");
String DcdType 		= safeGetParameter(request,"DcdType");

String	resultDcd  = EgovStringUtil.getEncdDcd( srcString, srcCharset, DcdType);

%>

<!-- 결과화면 시작 -->
<form name="fm122_2" action ="/EgovPageLink.do" method=post>
<input type = "hidden" name="execFlag" value="READY">
<input type = "hidden" name="cmdStr" 	value="REQ-COM-122">
<input type = "hidden" name="link" value="cmm/utl/EgovEncdDcd">
<table border="1">
   	<tr>
   		<td>문자열을 다양한 문자셋을 사용하여 인코딩하는 기능 : 
   		</td>
   		<td>원래 인코딩 문자열[ <%=srcString%> ]
   		<td>디코딩 결과 [<%=resultDcd%> ] 
   		</td>   		
   	</tr>
</table> 
<br>
<input type = "button" method="post"  value="화면으로 돌아가기" onclick="fm122_2.submit()">
</form>
<!--  결과화면 끝 -->


<%
}
%>
