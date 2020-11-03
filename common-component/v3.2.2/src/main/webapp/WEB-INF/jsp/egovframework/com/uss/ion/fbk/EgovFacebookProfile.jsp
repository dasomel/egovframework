<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%

/**
 * @Class Name : EgovFacebookProfile.jsp
 * @Description : EgovFacebookProfile.jsp
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
<title>Facebook 프로필 조회</title>
</head>
<body>
    <div id="border" style="width:730px">
        <h3>Your Facebook Profile</h3>
        <p>Hello, <c:out value="${profile.firstName}"/>!</p>
        <dl>
        	<dt>Facebook ID:</dt>
        	<dd><c:out value="${profile.id}"/></dd>
        	<dt>Name:</dt>
        	<dd><c:out value="${profile.name}"/></dd>
        	<dt>Email:</dt>
        	<dd><c:out value="${profile.email}"/></dd>
        </dl>
        
        <form id="disconnect" action="<c:url value="/uss/ion/fbk/facebookSignout.do"/>" method="post">
        	<button type="submit">Disconnect from Facebook</button>	
        	<input type="hidden" name="_method" value="delete" />
        </form>
    </div>
</body>
</html>