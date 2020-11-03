[개선 공통컴포넌트]
- 공통컴포넌트 실행환경 3.9.0 버전 적용
신규컴포넌트를 포함한 전체 컴포넌트의 통합배포파일을 제공하니 필요하신 분은 첨부파일을 다운로드 받아서 사용하시기 바랍니다.

*** 주의사항 ***
1. Code, Server, DB의 인코딩 설정을 UTF-8로 하는 것을 권장합니다.
(인코딩 문제로 동작시 오류가 발생할 가능성이 있으며, 다른 인코딩을 사용하기 위해서는 별도의 커스터마이징이 필요함)
2.  globals.properties 파일에서 DB정보 입력해야 정상적으로 작동함
3. DB script는 (/script/) 해당 DB에 ddl, dml을 활용하셔 직접 import 하시기 바랍니다.
4. 표준프레임워크에서 제공하는 7종(alitbase, cubrid, mysql, oracle, tibero, maria, postgres) 이외에 DB에 사용하기 위해서는
 - 기존에 있는 ddl, dml을 참조하여 커스터마이징하여  생성하시기 바랍니다.
 - 해당 쿼리문도 기존에 존재하는 쿼리문을 참조하여 커스터마이징하여 생성하시기 바랍니다.
----------------------------------------------------------------------------------------------------
1) globals.properties  파일에 Globals.Auth 통해 동적으로 인증방식 변경이 가능 합니다.
- session : 세션 방식으로 사용자 권한을 인증함
- security : spring security 방식으로 사용자 권한을 인증함
- dummy : dummy 모드 방식으로 사용자 권한을 인증함
2) web.xml 설정이 WebApplicationInitializer 방식으로 변경 되었습니다.
- egovframework.com.cmm.config.EgovWebApplicationInitializer 파일을 통해 설정 가능합니다.