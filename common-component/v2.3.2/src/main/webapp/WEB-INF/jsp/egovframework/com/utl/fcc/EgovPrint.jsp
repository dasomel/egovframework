<%-- *******************************************************
* Filename : ComUtlPintPrinting.jsp
* Class    :
* Function : 화면에 인쇄  미리보고 출력   
*
* @version   1.0
* @author    
*******************************************************  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="false" %>
<html lang="ko">
<head>
<title>공통서비스 메뉴</title>
<BASE TARGET="EgovComUtlFcc">
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<link href="/css/egovframework/com/cmm/utl/com.css" rel="stylesheet" type="text/css">
</head>
<body>

<SCRIPT Language="Javascript">
<!--
var NS = 1;
if( document.all) NS = 0;

function PrintOption(type1,type2){
//네스케이프일 경우
        if (NS) {
                window.print();
//익스플로러일 경우
        } else {
                var active = '<OBJECT ID="active1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
                document.body.insertAdjacentHTML('beforeEnd', active);
                active1.ExecWB(type1,type2); 
                active1.outerHTML ="";
        }
}
//-->
</SCRIPT>
<!--인쇄 옵션 설정 스크립트 끝-->
<center>
<h2>화면인쇄</h2>
<input type=button value="인쇄 미리 보기" onclick="PrintOption(7,1)">  
<input type=button value="인쇄 바로 하기" onclick="PrintOption(6,-1)">
<input type=button value="페이지 설정" onclick="PrintOption(8,1)"> 
</center>
<hr>

<table align="center" width="500">
<tr>
	<td>
	
서울=연합뉴스) 최현석 기자 = 원.달러 환율이 장중 상승폭을 확대하면서 1,600원에 근접했다. 외환당국이 개입에 나서면서 1,600원대 진입을 제한하고 있다.

2일 서울 외환시장에서 달러화에 대한 원화 환율은 오후 1시20분 현재 지난 주말보다 달러당 51.50원 폭등한 1,585.50원에 거래되고 있다. 

환율이 현 수준으로 마감하면 종가 기준으로 1998년 3월10일 이후 11년 만에 최고치를 기록하게 된다. 지난달 10일 이후 상승폭은 200원을 웃돌고 있다.

이날 환율은 8.00원 상승한 1,542.00원으로 거래를 시작해 매수세가 유입되면서 1,560원대로 상승했다. 

한동안 1,560원대에서 등락하던 환율은 점심때 매수세가 강화되자 1,596.00원까지 급등하고서 개입으로 추정되는 매물이 유입되자 1,580원대로 밀렸다.

외환시장 참가자들은 역내외 달러화 매수세와 주가 약세 등으로 환율이 급등하고 있다고 전했다. 

수입업체의 결제수요와 외국인 주식매도분 역송금 수요, 투신권의 환위험 헤지분 청산 관련 수요 등 달러화 매수세가 우위를 점하고 있다. 

외국인의 주식 순매도 규모가 3천억 원을 넘어선 점도 원화 약세 요인이 되고 있다.

외환당국이 달러화 매도 개입에 나서면서 1,600원대 진입을 차단한 것으로 관측되고 있다.

기업은행 김성순 차장은 "수입업체 결제수요 등 달러화 매수세가 확연한 우위를 보이고 있다"며 "주가가 급락하면서 달러화 매수심리가 확산되고 있다"고 말했다. 

같은 시각 원.엔 환율은 100엔당 1,624.23원을, 엔.달러 환율은 97.56엔을 기록하고 있다. 원.엔 환율은 1991년 고시환율 집계 이후 최고 수준이다.


	
	</td>
</tr>
</table>




</body>
</html>