안녕하십니까? 공통컴포넌트 팀입니다.

1. Code, Server, DB의 인코딩 설정을 UTF-8로 하는 것을 권장합니다.
 - 인코딩 문제로 동작시 오류가 발생할 가능성이 있으며, 다른 인코딩을 사용하기 위해서는 별도의 커스터마이징이 필요함
2. globals.properties 파일에서 DB정보 입력해야 정상적으로 작동함
3. DB script는 (/src/script/) 해당 DB에 ddl, dml을 활용하셔 직접 import 하시기 바랍니다.
4. 표준프레임워크에서 제공하는 5종(alitbase, cubrid, mysql, oracle, tibero) 이외에 DB에 사용하기 위해서는
 - 기존에 있는 ddl, dml을 참조하여 커스터마이징하여  생성하시기 바랍니다.
 - 해당 쿼리문도 기존에 존재하는 쿼리문을 참조하여 커스터마이징하여 생성하시기 바랍니다.
   
----------------------------------------------------------------------------------------------------
주의!, 템플릿을 통해 설치하신 all-in-one 파일은 기본적으로 인증서 로그인 컴포넌트를 사용하도록 설정이 되어있습니다.
따라서 gpki 라이브러리가 존재하지 않는 경우 오류가 발생하는 것처럼 보일 수 있습니다.
아래와 같이 조치하시면 됩니다.

1. GPKI 라이브러리를 사용하실 경우 
 - 행정전자서명 인증관리센터에 공무원이 직접 신청하여 라이브러리를 제공받아야 합니다.
   (GPKI서비스관련 URL : http://www.gpki.go.kr)
 - 제공받은 라이브러리를 다음 경로에(\src\main\webapp\WEB-INF\lib) GPKI 라이브러리를 넣으시면 오류없이 사용이 가능합니다.
 
2. GPKI 라이브러리를 사용하지 않으실 경우
 - 아래의 안내에 따라 조치하시면 오류를 제거하실 수 있습니다.
============================================================================================  
2-1.pom.xml 파일에 주석처리(pom.xml 파일 참조 : GPKI 관련 dependency 2종)  

**************** pom.xml ****************
``` xml
<!-- GPKI인증서 로그인처리 라이브러리 -->
<dependency>
    <groupId>kr.go.gpki</groupId>
    <artifactId>gpkisecureweb</artifactId>
    <version>1.0.4.9</version>
    <scope>system</scope>
    <systemPath>${basedir}/src/main/webapp/WEB-INF/lib/gpkisecureweb-1.0.4.9.jar</systemPath>
</dependency>
<dependency>
    <groupId>kr.go.gpki</groupId>
    <artifactId>libgpkiapi_jni</artifactId>
    <version>1.4.0.0</version>
    <scope>system</scope>
    <systemPath>${basedir}/src/main/webapp/WEB-INF/lib/libgpkiapi_jni-1.4.0.0.jar</systemPath>
</dependency>
```
*****************************************

2-2. 관련 파일 삭제
* GPKI 인증서
src/main/java/egovframework/com/sec/pki/service/impl/EgovGPKIServiceImpl.java
src/main/java/egovframework/com/sec/pki/web/EgovGPKITestController.java
src/main/java/egovframework/com/utl/sec/service/EgovCertInfoUtil.java
src/main/java/egovframework/com/utl/sec/web/EgovCertLoginController.java
============================================================================================