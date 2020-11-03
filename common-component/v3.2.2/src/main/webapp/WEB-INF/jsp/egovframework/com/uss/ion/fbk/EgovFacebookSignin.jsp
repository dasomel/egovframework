<%@ page contentType="text/html; charset=utf-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

/**
 * @Class Name : EgovFacebookSignin.jsp
 * @Description : EgovFacebookSignin.jsp
 * @Modification Information
 * @
 * @  수정일             수정자              수정내용
 * @ ---------     -----------------    -------------------------
 * @ 2014.11.10    표준프레임워크센터        최초생성
 *
 *  @author 표준프레임워크센터
 *  @since 2014.11.10
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2014 by MOGAHA  All right reserved.
 */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Facebook 로그인</title>
</head>
<body>
    <div id="border" style="width:730px">
		<form action="<c:url value="/signin/facebook" />" method="POST" target="_top">
		    <button type="submit">Sign in with Facebook</button>
		    <input type="hidden" name="scope" value="publish_stream,email,publish_actions,read_stream,user_photos" />
		</form>
    </div>
</body>
</html>
