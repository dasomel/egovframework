<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovSysHistUpdt.jsp
  * @Description : 시스템 이력 정보 수정 화면
  * @Modification Information
  * @
  * @ 수정일              수정자          수정내용
  * @ ----------  --------  ---------------------------
  * @ 2009.03.09  이삼섭          최초 생성
  *   2011.07.08  이기하          패키지 분리로 경로 수정(sym.log -> sym.log.slg)
  *   2018.09.11  신용호          공통컴포넌트 3.8 개선
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.09
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><spring:message code="comSymLogSlg.sysHistUpdt.title"/></title><!-- 시스템 이력 수정 -->
<link href="<c:url value="/css/egovframework/com/com.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/egovframework/com/button.css"/>" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript">
	function fn_egov_update_sysHist(){
		document.history.action = "<c:url value='/sym/log/slg/UpdateSysHistory.do'/>";
		document.history.submit();
	}

	function fn_egov_select_sysHist(){
		document.history.action = "<c:url value='/sym/log/slg/SelectSysHistoryList.do'/>";
		document.history.submit();
	}

	function fn_egov_check_file(flag) {
		if(flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
</script>
</head>
<body>
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->
<form:form commandName="history" name="history" method="post" enctype="multipart/form-data" >
<input name="pageIndex" type="hidden" value="1" />
<input type="hidden" name="posblAtchFileNumber" value="3" />
<input type="hidden" name="histId" value="<c:out value='${history.histId}'/>" />
<input type="hidden" name="returnUrl" value="<c:url value='/sym/log/slg/ModifySysHistory.do'/>"/>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><spring:message code="comSymLogSlg.sysHistUpdt.pageTop.title"/></h2><!-- 시스템 이력수정 -->

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comSymLogSlg.sysHistUpdt.histSeCodeNm"/> <span class="pilsu">*</span></th><!-- 이력구분 -->
			<td class="left">
			    <select name="histSeCode" class="select" title="<spring:message code="comSymLogSlg.sysHistUpdt.histSeCodeNm"/>"><!-- 이력구분 -->
				<option selected value=''>--<spring:message code="input.select" />--</option><!-- 선택하세요 -->
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<option value='<c:out value="${result.code}"/>' <c:if test="${history.histSeCode == result.code}">selected</c:if>>
				<c:out value="${result.codeNm}"/></option>
				</c:forEach>
				</select>
				<form:errors path="histSeCode" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymLogSlg.sysHistUpdt.sysNm"/> <span class="pilsu">*</span></th><!-- 시스템명 -->
			<td class="left">
			    <input name="sysNm" type="text" size="60" value="<c:out value='${history.sysNm}'/>"  maxlength="60" id="sysNm" >
      			<form:errors path="sysNm" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymLogSlg.sysHistUpdt.histCn"/> <span class="pilsu">*</span></th><!-- 이력내용  -->
			<td class="left">
			    <textarea name="histCn" class="textarea"  cols="50" rows="8"  style="height:100px;" id="histCn"><c:out value='${history.histCn}'/></textarea>
      			<form:errors path="histCn" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymLogSlg.sysHistUpdt.frstRegisterPnttm"/></th><!-- 등록일자 -->
			<td class="left">
			    <c:out value="${history.frstRegisterPnttm}"/>
			</td>
		</tr>
		<c:if test="${history.atchFileId != ''}">
		<tr>
			<th><spring:message code="comSymLogSlg.sysHistUpdt.atchFileList"/></th><!-- 첨부파일목록 -->
			<td class="left">
			    <c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
					<c:param name="param_atchFileId" value="${history.atchFileId}" />
				</c:import>
			</td>
		</tr>
		</c:if>
		<tr>
			<th><spring:message code="comSymLogSlg.sysHistUpdt.atchFile"/></th><!-- 첨부파일 -->
			<td class="left">
			
				<div id="file_upload_posbl"  style="display:none;" >
				    <input name="file_1" id="egovComFileUploader" type="file" title="<spring:message code="comSymLogSlg.sysHistUpdt.atchFile"/>"/><!-- 첨부파일명 입력 -->
			    	<div id="egovComFileList"></div>
				</div>
				 
				<div id="file_upload_imposbl"  style="display:none;" >
					<spring:message code="common.imposbl.fileupload" />
				</div>
			</td>
		</tr>
	</table>
	<c:if test="${history.atchFileId == ''}">
	<input type="hidden" name="fileListCnt" value="0" />
	</c:if>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_update_sysHist();" /><!-- 저장 -->
		<input class="s_submit" type="submit" value="<spring:message code="button.list"/>" onclick="fn_egov_select_sysHist();" /><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>
</div>

<script type="text/javascript">
	var existFileNum = document.history.fileListCnt.value;
	var maxFileNum = document.history.posblAtchFileNumber.value;

	if(existFileNum=="undefined" || existFileNum ==null){
		existFileNum = 0;
	}
	if(maxFileNum=="undefined" || maxFileNum ==null){
		maxFileNum = 0;
	}
	var uploadableFileNum = maxFileNum - existFileNum;
	if(uploadableFileNum<0) {
		uploadableFileNum = 0;
	}
	if(uploadableFileNum != 0){
		fn_egov_check_file('Y');
		var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
		multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	}else{
		fn_egov_check_file('N');
	}
</script>

</form:form>
</body>
</html>
