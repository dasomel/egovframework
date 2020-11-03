<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%> --%>
<c:set var="pageTitle"><spring:message code="comCopBbs.articleVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>${pageTitle} <spring:message code="title.list" /></title>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/cop/bbs/style.css' />">
<script src="<c:url value='/js/egovframework/com/cmm/jquery-1.12.4.min.js' />"></script>

<script>

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	document.articleForm.pageIndex.value = pageNo;
	document.articleForm.action = "<c:url value='/cop/bbs/selectArticleBlogList.do'/>";
   	document.articleForm.submit();
}

function layer_toggle(ma) {
	 if (ma.style.display == 'none') {
		 ma.style.display = 'block'; 
		 document.getElementById('blog_cnt').style.display = 'none';
	}else{
		 ma.style.display = 'none'; 
		 document.getElementById('blog_cnt').style.display = 'block';
	 }
 }

function fn_egov_loadBdList(bbsId,blogNm,cnt){
	document.blogfrm.bbsId.value = bbsId;
	var searchCnd = document.postCnt.searchCnd.value;
	$('#sub').text(blogNm);
	$(".comm_List").empty();
	$.ajax({
		url :"<c:url value='/cop/bbs/selectArticleBlogDetail.do'/>"
        ,type: "POST"
        	,data : {"bbsId":bbsId, "searchCnd":searchCnd}
        ,dataType: 'json'  	   
        ,success : function(data){
        	var innerHtml = "";
        	var innerReply = "";
        	var innerPaging = "";
        	var length = data['blogSubJectList'].length;
        	if(length > 0) {
        		$.each(data['blogSubJectList'], function(i) {
        	          innerHtml += '<tr>';  
        	          innerHtml +=    '<td id="target" onclick="fn_clickComm(\'' + bbsId + '\', \''+data['blogSubJectList'][i].nttId+'\', \''+data['blogSubJectList'][i].ntcrId+'\', \''+data['blogSubJectList'][i].replyPosblAt+'\', \''+data['blogSubJectList'][i].blogId+'\', \''+cnt+'\')"; style="cursor:pointer">';
        	          if(data['blogSubJectList'][i].commentCo != "") {
        	        	  innerHtml +=      data['blogSubJectList'][i].nttSj+"["+data['blogSubJectList'][i].commentCo+"]";
        	          }else{
        	        	  innerHtml +=      data['blogSubJectList'][i].nttSj;
        	          }
        	          innerHtml +=    '</td>';
        	          innerHtml +=    '<td>';
        	          innerHtml +=      data['blogSubJectList'][i].frstRegisterPnttm;
        	          innerHtml +=    '</td>';
        	          innerHtml += '</tr>';
        	          
        		});
        		
        		innerPaging += '<ul>';
  	          	innerPaging += '<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_linkPage"/>';
  	          	innerPaging += '</ul>';
  	          	
        		$("#subtitle").html(innerHtml);
        		$("#paging").html(innerPaging);
        		$("#target").click(); //댓글표시
        		if(data['blogCnOne'].nttCn != null){
        			$(".cnt").html(data['blogCnOne'].nttCn);	
        		}
        	}
		}
	    ,error: function(){
	    	alert("게시글이 없습니다!\n게시글을 등록해 주세요.");
	    }
	});
}

function fn_blog_cn(blogId){
	var bbsId = document.blogfrm.bbsId.value;
	location.href="<c:url value='/cop/bbs/insertArticleView.do' />?bbsId="+bbsId+"&blogAt=Y&blogId="+blogId;
}

function fn_clickComm(bbsId, nttId, ntcrId, replyPosblAt, blogId, cnt){
	$.ajax({
		url :"<c:url value='/cop/bbs/selectArticleBlogDetailCn.do'/>"
        ,type: "POST"
        ,data : {"bbsId":bbsId, "nttId":nttId}
        ,dataType: 'json'  	   
        ,success : function(data){
        	var length = data['blogCnList'].length;
        	var innerHtml = "";
        	var innerReply = "";
        	if(length > 0) {
        		$.each(data['blogCnList'], function(i) {
        	          innerHtml += data['blogCnList'][i].nttCn;
        		});
        		$(".cnt").html(innerHtml);
        		
        		$('input[name=bbsId]').attr('value',bbsId);
        		$('input[name=nttId]').attr('value',nttId);
        		$('input[name=blogId]').attr('value',blogId);
        		
        		$.each(data['resultList'], function(i) {
        			innerReply += "<dl>";
        			innerReply += "<dt>";
        			innerReply += "<strong>";
        			innerReply += data['resultList'][i].wrterNm;
        			innerReply += "</strong>";
        			innerReply += "<span>"
        			innerReply += data['resultList'][i].frstRegisterPnttm;
        			innerReply += "</span>"
        			
       				if(cnt == 1) {
           				innerReply += "<div align='right'>";
           				innerReply += '<a href="javascript:fn_egov_deleteCommentList(\''+data['resultList'][i].commentNo+'\', \''+bbsId+'\', \''+nttId+'\', \''+blogId+'\')" >삭제</a>';
           				innerReply += "</div>";
           			}
        			
        			innerReply += "</dt>";
        			innerReply += "<dd>";
        			innerReply += data['resultList'][i].commentCn;
        			innerReply += "</dd>";
        			innerReply += "</dl>";
      			});
        		innerReply += "<dl>";
        		innerReply += "<dd>";
        		innerReply += "<form id='formComment' name='formComment' method='post'>";
        		innerReply += "<textarea name='commentCn' placeholder='댓글은 500byte 까지 작성할 수 있습니다.'/>";
        		innerReply += "<button type='button' onclick='fn_egov_insert_commentList(\""+bbsId+"\", \""+nttId+"\", \""+blogId+"\");'>등록</button>";
        		innerReply += "<input name='bbsId' type='hidden' value=''>";
        		innerReply += "<input name='nttId' type='hidden' value=''>";
        		innerReply += "<input name='blogId' type='hidden' value=''>";
        		innerReply += "<input name='modified' type='hidden' value=''>";
        		innerReply += "<input name='commentNo' type='hidden' value=''>";
        		innerReply += "<input name='blogAt' type='hidden' value='Y'>";
        		innerReply += "</form>";
        		innerReply += "</dd>";
        		innerReply += "</dl>";
        		$(".comm_List").html(innerReply);
        	}else{
		  	          innerHtml += "본문 내용이 존재하지 않습니다!";
		  	    $(".cnt").html(innerHtml);
        	}
		}
	    ,error: function(){
	    	alert("에러발생");
	    }
	});
}

function fn_egov_deleteCommentList(commentNo, bbsId, nttId, blogId) {

	var form = document.getElementById("formComment");
	
	if (confirm('<spring:message code="common.delete.msg" />')) {
		form.modified.value = "true";
		form.commentNo.value = commentNo;
		form.bbsId.value = bbsId;
		form.nttId.value = nttId;
		form.blogId.value = blogId;
		form.action = "<c:url value='/cop/cmt/deleteArticleComment.do'/>";
		form.submit();
	}
}

function fn_egov_insert_commentList(bbsId, nttId, blogId) {
	document.formComment.bbsId.value = bbsId;
	document.formComment.nttId.value = nttId;
	document.formComment.blogId.value = blogId;
	document.formComment.modified.value = false;
  	document.formComment.action = "<c:url value='/cop/cmt/insertArticleComment.do'/>";
  	document.formComment.submit();
}

$(document).ready(function() { 
	$("#titleck").click();
});

</script>
</head>
<body>
<!-- 블로그 -->
<div class="blog_wrap">
	<!-- header -->
	<div class="blog_header">
		<div class="visual_default">
			<h1>${boardMasterVO.blogNm}</h1>
			<p>${boardMasterVO.blogIntrcn}</p>
		</div>
		<div class="h_menu">
			<ul class="gnb">
				<c:forEach items="${blogNameList}" var="resultInfo" varStatus="status">
					<li><a id="titleck" onclick="javascript:fn_egov_loadBdList('<c:out value="${resultInfo.bbsId}"/>','<c:out value="${resultInfo.bbsNm}" />','<c:out value="${loginUserCnt}"/>');"><c:out value="${resultInfo.bbsNm}" /></a></li>
				</c:forEach>
			</ul>
		
			<ul class="gnb">
				<c:choose>
					<c:when test="${loginUserCnt == 1}">
					<li><a href="<c:url value='/cop/bbs/insertBBSMasterView.do?blogId=${boardMasterVO.blogId}&blogAt=Y' />" onclick="javascript:fn_egov_ls()">카테고리등록</a></li>
					<li><a href="<c:url value='/cop/bbs/selectBlogListManager.do?blogId=${boardMasterVO.blogId}' />" ><spring:message code="comCopBlog.blogUseMgrMain.btnBoard" /></a></li> <!-- 개인블로그관리  -->
			</ul>
					<span class="write"><a href="javascript:fn_blog_cn('${boardMasterVO.blogId}')" title="<spring:message code="button.create" /> <spring:message code="input.button" />"><spring:message code="button.create" /></a></span>
					</c:when>
				</c:choose>
		</div>
	</div>
	<!-- header //-->

	<!-- 블로그 리스트 -->
	<div class="post">
		<div class="post_title">
			<div id="sub"></div>
		</div>

		<div class="listBox">
			<table class="tbl_list">
				<caption>블로그 리스트</caption>
				<colgroup>
					<col style="width: ;" />
					<col style="width:10%" />
				</colgroup>
				<tbody id=subtitle>
				</tbody>
			</table>
			<form name="postCnt" method="post" onChange="$('#titleck').click();">
				<div class="post_opt">
					<label for="" class="blind">포스트 갯수 설정</label>
					<select name="searchCnd" id="searchCnd">
						<option value="5"  <c:if test="${searchVO.searchCnd == '5'}">selected="selected"</c:if>>5줄 보기</option>
						<option value="10" <c:if test="${searchVO.searchCnd == '10'}">selected="selected"</c:if>>10줄 보기</option>
						<option value="15" <c:if test="${searchVO.searchCnd == '15'}">selected="selected"</c:if>>15줄 보기</option>
						<option value="20" <c:if test="${searchVO.searchCnd == '20'}">selected="selected"</c:if>>20줄 보기</option>
						<option value="30" <c:if test="${searchVO.searchCnd == '30'}">selected="selected"</c:if>>30줄 보기</option>
					</select>
				</div>
			</form>
			<div id="paging" class="paging">
			</div>
		</div>
	</div>
	<!-- 블로그 리스트 //-->
	
	<!-- 블로그 본문 -->
	<div id="blog_cnt" class="blog_cnt" style="display:block;">
		<div class="blog_title">
		<!-- 본문타이틀 -->
		</div>
		<div class="cnt">
		<!-- 본문내용 -->
		</div>
		<!-- 댓글 -->
		<div class="comm_List" >
		</div>
	</div>
	<!-- 블로그 본문 //-->
</div>

<!-- 블로그 //-->
<form name="blogfrm">
<input name="blogCn" type="hidden" value="">
<input name="blogName" type="hidden" value="">
<input name="bbsId" type="hidden" value="">
</form>
</body>
</html>