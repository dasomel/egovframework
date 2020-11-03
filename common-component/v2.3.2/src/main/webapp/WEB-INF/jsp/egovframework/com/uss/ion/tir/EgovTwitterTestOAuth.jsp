<%--
  Class Name : EgovTwitterRecptn.jsp
  Description : 트위터 수신(목록) 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2010.07.07    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2010.07.07

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="twitter4j.*"%>
<%@ page import="twitter4j.http.*"%>
<%@ page import="twitter4j.util.*"%>
<%@ page import="twitter4j.api.*"%>
<%
String sCONSUMER_KEY = "jZolrlAWY2wgseQjukGw";
String sCONSUMER_SECRET = "y2alndDN9R3VDU9wmEabmnhfacwVDqfVIrWYwMeFGSw";
//========================================================================
//수신된 트위터 결과
//========================================================================
Twitter twitter = new Twitter();
twitter.setOAuthConsumer(sCONSUMER_KEY, sCONSUMER_SECRET);
String oauthToken = request.getParameter("oauth_token");
// 2011.10.10 보안점검 후속조치
String rtoken = "";
if (rtoken != null) {
    rtoken = session.getAttribute("rtoken").toString().trim();
}
String rstoken = "";
if (rstoken != null) {
    rstoken = session.getAttribute("rstoken").toString().trim();
}
//2011.10.10 보안점검 후속조치 끝
AccessToken accessToken = null;
if(rtoken.equals(oauthToken)){
	try {
		accessToken = twitter.getOAuthAccessToken(oauthToken, rstoken);
	}catch(TwitterException te) {
		//out.println("<br>" + te.toString());
		System.out.println(te);	// 2011.10.10 보안점검 후속조치
	}
}

try{
	if (accessToken !=null) {	// 2011.10.21 보안검검 후속조치
		twitter.setOAuthAccessToken(accessToken);
		//해당키 저장
		session.setAttribute("atoken", accessToken.getToken());
		session.setAttribute("astoken", accessToken.getTokenSecret());
	}
}catch(Exception e) {
	//out.println("<br>" + e.toString());
	//e.printStackTrace();
	System.out.println(e);	// 2011.10.10 보안점검 후속조치
}

//========================================================================
//보내기 테스트
//========================================================================
String tweetStsText ="Twitter OAuth TEST";

String atoken = session.getAttribute("atoken").toString().trim();
String astoken = session.getAttribute("astoken").toString().trim();
try {
	Twitter twitter1 = new Twitter();
	twitter1.setOAuthConsumer(sCONSUMER_KEY, sCONSUMER_SECRET);
	AccessToken accessToken1 = null;
	accessToken1 = new AccessToken(atoken, astoken);
	twitter1.setOAuthAccessToken(accessToken1);
	Status status = twitter1.updateStatus(tweetStsText);
	String result_msg = status.getText();
}catch (TwitterException e) {
	//e.printStackTrace();
	System.out.println(e);	// 2011.10.10 보안점검 후속조치
}

out.println("<br>");
out.println("rtoken>"+session.getAttribute("atoken"));
out.println("<br>");
out.println("rstoken>"+session.getAttribute("astoken"));
out.println("<br>");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<title>트위터(Twitter)-수신</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="${CssUrl}com.css">
<link type="text/css" rel="stylesheet" href="${CssUrl}button.css">

</head>
<body>
<DIV id="content" style="width:712px">
<!-- noscript 테그 -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

TEST

</body>
</html>