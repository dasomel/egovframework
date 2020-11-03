<%--
  Class Name : EgovRecentSrchwrdList.jsp
  Description : 최근검색어관리 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.12.14    이기하          최근검색어 오류 수정
     2018.08.16    이정은	        공통컴포넌트 3.8 개선(다국어처리, 퍼블리싱 확인)

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

    Copyright (C) 2009 by MOPAS  All right reserved.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title><spring:message code="ussIonRsm.recentSrchwrdList.recentSrchwrdList"/></title><!-- 최근검색어 관리 목록 -->
<link href="<c:url value="/css/egovframework/com/com.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/egovframework/com/button.css"/>" rel="stylesheet" type="text/css">

<!-- Ajax Tags start -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/egovframework/com/uss/ion/rsm/prototype-1.6.0.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/scriptaculous/scriptaculous.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/overlibmws/overlibmws.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/ajaxtags.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/egovframework/com/uss/ion/rsm/recentSrchwrd.js"></script>

<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/ajaxtags/css/ajaxtags.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/ajaxtags/css/displaytag.css">
<!-- Ajax Tags end -->

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/uss/ion/rsm/listRecentSrchwrd.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_detail_RecentSrchwrd(srchwrdManageId){
	var vFrom = document.listForm;
	vFrom.srchwrdManageId.value = srchwrdManageId;
	vFrom.action = "<c:url value='/uss/ion/rsm/detailRecentSrchwrd.do' />";
	vFrom.submit();
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_RecentSrchwrd(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/rsm/listRecentSrchwrd.do' />";
	vFrom.submit();

}


</script>
</head>
<body>

<div class="board">
	<h1><spring:message code="ussIonRsm.recentSrchwrdList.recentSrchwrdList"/></h1><!-- 최근검색어관리 목록 -->
	<form name="listForm" action="<c:url value=''/>" method="post">
	<div class="search_box" title="<spring:message code="common.noScriptTitle.msg"/>"><!-- 이 레이아웃은 하단 정보를 대한 검색 정보로 구성되어 있습니다. -->
		<ul>
			<li>
				<select name="searchCondition" id="searchCondition" class="select" title="<spring:message code="title.searchCondition"/>"><!-- 검색조건선택 -->
					<option value=''><spring:message code="input.select"/></option><!-- --선택하세요-- -->
					<option value='SRCHWRD_MANAGE_NM' <c:if test="${searchCondition == 'SRCHWRD_MANAGE_NM'}">selected</c:if>><spring:message code="ussIonRsm.recentSrchwrdList.srchwrdManageNm"/></option><!-- 최근검색어관리명 -->
					<option value='SRCHWRD_CONECT_URL' <c:if test="${searchCondition == 'SRCHWRD_CONECT_URL'}">selected</c:if>><spring:message code="ussIonRsm.recentSrchwrdList.srchwrdManageUrl"/></option><!-- 최근검색어관리URL -->
				</select>
				<input id="searchKeyword" class="s_input2 vat" name="searchKeyword" type="text" value="<c:out value="${searchVO.searchKeyword}"/>" maxlength="35" size="10" onkeypress="press();" title="<spring:message code="title.search"/>" /><!-- 검색단어입력 -->

				<!--Ajax Tags 등록 -->				
				<input type="hidden" name="rsm_url" id="rsm_url" value="<c:url value='/uss/ion/rsm/registRecentSrchwrdResult.do'/>" >
				<span class="btn_b"><a id="btnInquire" href="" onclick="fn_egov_regist_RecentSrchwrdResult('SRCMGR_0000000000001',$('searchKeyword').value,'fn_egov_search_RecentSrchwrd()', document.listForm); return false;" title='<spring:message code="button.inquire" />'><spring:message code="button.inquire" /></a></span>
				<span class="btn_b"><a href="<c:url value='/uss/ion/rsm/registRecentSrchwrd.do' />" onclick="" title='<spring:message code="button.create" />'><spring:message code="button.create" /></a></span>
				<!--Ajax Tags 끝 -->
			</li>
		</ul>
	</div>
		<input name="srchwrdManageId" type="hidden" value="">
		<input name="searchMode" type="hidden" value="">
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	</form>

<!--Ajax Tags Script-->
<ajax:autocomplete
  baseUrl="${pageContext.request.contextPath}/uss/ion/rsm/listRecentSrchwrdResultSerach.do"
  source="searchKeyword"
  target="searchKeyword"
  className="autocomplete"
  parameters="srchwrdManageId=SRCMGR_0000000000001"
  minimumCharacters="1" />


	<table class="board_list">
		<caption></caption>
		<colgroup>
			<col style="width:35px" />
			<col style="width:150px" />
			<col style="" />
			<col style="width:50px" />
			<col style="width:70px" />
			<col style="width:90px" />
		</colgroup>
		<thead>
			<tr>
			   <th scope="col"><spring:message code="ussIonRsm.recentSrchwrdList.srchwrdNum"/></th><!-- 순번 -->
			   <th scope="col"><spring:message code="ussIonRsm.recentSrchwrdList.srchwrdManageNm"/></th><!-- 최근검색어관리명 -->
			   <th scope="col"><spring:message code="ussIonRsm.recentSrchwrdList.srchwrdManageUrl"/></th><!-- 최근검색어관리URL -->
			   <th scope="col"><spring:message code="ussIonRsm.recentSrchwrdList.srchwrdManageResult"/></th><!-- 결과 -->
			   <th scope="col"><spring:message code="ussIonRsm.recentSrchwrdList.frstRegisterNm"/></th><!-- 등록자 -->
			   <th scope="col"><spring:message code="ussIonRsm.recentSrchwrdList.frstRegisterPnttm"/></th><!-- 등록일자 -->
			</tr>
		</thead>
		<tbody>
			<%-- 데이터를 화면에 출력해준다 --%>
			<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
			<tr>
				<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
				<td>
					<form name="subForm" method="post" action="<c:url value='/uss/ion/rsm/detailRecentSrchwrd.do'/>">
						<input name="srchwrdManageId" type="hidden" value="${resultInfo.srchwrdManageId}">
						<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
						<input class="link" type="submit" value="<c:out value="${resultInfo.srchwrdManageNm}"/>" onclick="fn_egov_detail_RecentSrchwrd('${resultInfo.srchwrdManageId}'); return false;">
					</form>
				</td>
				<td><c:out value="${resultInfo.srchwrdManageUrl}"/></td>
				<td>
					<form name="subFormSrchwrdResult" method="post" action="<c:url value='/uss/ion/rsm/listRecentSrchwrdResult.do'/>">
						<input name="srchwrdManageId" type="hidden" value="${resultInfo.srchwrdManageId}">
						<input class="btn01" type="submit" value="<spring:message code="ussIonRsm.recentSrchwrdList.view"/>" /><!-- 보기 -->
					</form>
				</td>
				<td><c:out value="${resultInfo.frstRegisterNm}"/></td>
				<td><c:out value="${resultInfo.frstRegisterPnttm}"/></td>
			</tr>
			</c:forEach>
			
			<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
			<c:if test="${fn:length(resultList) == 0}">
			<tr>
				<td colspan="6">
					<spring:message code="common.nodata.msg" />
				</td>
			</tr>
			</c:if>
		</tbody>
	</table>

	<!-- paging navigation -->
	<div class="pagination">
		<ul>
			<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
		</ul>
	</div>
</div>
</body>
</html>
