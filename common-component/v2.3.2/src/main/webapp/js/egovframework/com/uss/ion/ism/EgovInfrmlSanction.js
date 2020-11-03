/****************************************************************
 *
 * 파일명 : EgovInfrmlSanction.js
 * 설  명 : 약식결재자 서비스 기능 사용 JavaScript
 *
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2010.09.10    장철호       1.0             최초생성
 *
 *
 * **************************************************************/

/* ********************************************************
* 아이디  팝업창열기
fn_egov_sanctner
* param 타이틀, ID 폼명, 사원번호 폼명, 사원명 폼명, 부서명 폼명, url
* ******************************************************** */
function fn_egov_sanctner(strTitle, frmUniqId, frmEmplNo, frmEmplyrNm, frmOrgnztNm, url){
	var arrParam = new Array(6);
	arrParam[0] = window;
	arrParam[1] = strTitle;
	arrParam[2] = frmUniqId;
	arrParam[3] = frmEmplNo;
	arrParam[4] = frmEmplyrNm;
	arrParam[5] = frmOrgnztNm;

 	window.showModalDialog(url, arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
}

