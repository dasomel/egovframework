CREATE TABLE COMTECOPSEQ
(
	TABLE_NAME            VARCHAR(60)  NOT NULL ,
	NEXT_ID               NUMERIC(30)  NULL ,
CONSTRAINT  COMTECOPSEQ_PK PRIMARY KEY (TABLE_NAME)
);




CREATE TABLE COMTNTMPLATINFO
(
	TMPLAT_ID             CHAR(20)  NOT NULL ,
	TMPLAT_NM             VARCHAR(765)  NULL ,
	TMPLAT_COURS          VARCHAR(6000)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	TMPLAT_SE_CODE        CHAR(6)  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
CONSTRAINT  COMTNTMPLATINFO_PK PRIMARY KEY (TMPLAT_ID)
);




CREATE TABLE COMTNRESTDE
(
	RESTDE_NO             NUMERIC(6)  NOT NULL ,
	RESTDE                CHAR(8)  NULL ,
	RESTDE_NM             VARCHAR(180)  NULL ,
	RESTDE_DC             VARCHAR(600)  NULL ,
	RESTDE_SE_CODE        VARCHAR(6)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNRESTDE_PK PRIMARY KEY (RESTDE_NO)
);




CREATE TABLE COMTNSCRAP
(
	SCRAP_ID              CHAR(20)  NOT NULL ,
	NTT_ID                NUMERIC(20)  NOT NULL ,
	BBS_ID                CHAR(20)  NOT NULL ,
	SCRAP_NM              VARCHAR(300)  NOT NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNSCRAP_PK PRIMARY KEY (SCRAP_ID)
);




CREATE TABLE COMTNSTSFDG
(
	STSFDG_NO             NUMERIC(20)  NOT NULL ,
	NTT_ID                NUMERIC(20)  NOT NULL ,
	BBS_ID                CHAR(20)  NOT NULL ,
	WRTER_ID              VARCHAR(60)  NULL ,
	WRTER_NM              VARCHAR(60)  NULL ,
	PASSWORD              VARCHAR(600)  NULL ,
	STSFDG                NUMERIC(1)  NOT NULL ,
	STSFDG_CN             VARCHAR(600)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNSTSFDG_PK PRIMARY KEY (STSFDG_NO)
);




CREATE TABLE COMTHCONFMHISTORY
(
	CONFM_NO              NUMERIC(8)  NOT NULL ,
	CONFM_RQESTER_ID      VARCHAR(60)  NOT NULL ,
	CONFMER_ID            VARCHAR(60)  NULL ,
	CONFM_DE              CHAR(20)  NULL ,
	CONFM_TY_CODE         CHAR(4)  NOT NULL ,
	CONFM_STTUS_CODE      CHAR(4)  NOT NULL ,
	OPERT_TY_CODE         CHAR(4)  NULL ,
	OPERT_ID              VARCHAR(60)  NULL ,
	TRGET_JOB_TY_CODE     CHAR(3)  NULL ,
	TRGET_JOB_ID          CHAR(20)  NULL ,
CONSTRAINT  COMTHCONFMHISTORY_PK PRIMARY KEY (CONFM_NO)
);




CREATE TABLE COMTCCMMNCLCODE
(
	CL_CODE               CHAR(3)  NOT NULL ,
	CL_CODE_NM            VARCHAR(180)  NULL ,
	CL_CODE_DC            VARCHAR(600)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTCCMMNCLCODE_PK PRIMARY KEY (CL_CODE)
);




CREATE TABLE COMTCCMMNCODE
(
	CODE_ID               VARCHAR(18)  NOT NULL ,
	CODE_ID_NM            VARCHAR(180)  NULL ,
	CODE_ID_DC            VARCHAR(600)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	CL_CODE               CHAR(3)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTCCMMNCODE_PK PRIMARY KEY (CODE_ID)
);




CREATE TABLE COMTCCMMNDETAILCODE
(
	CODE_ID               VARCHAR(18)  NOT NULL ,
	CODE                  VARCHAR(45)  NOT NULL ,
	CODE_NM               VARCHAR(180)  NULL ,
	CODE_DC               VARCHAR(600)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTCCMMNDETAILCODE_PK PRIMARY KEY (CODE_ID,CODE)
);




CREATE TABLE COMTNAUTHORGROUPINFO
(
	GROUP_ID              CHAR(20)  NOT NULL ,
	GROUP_NM              VARCHAR(180)  NOT NULL ,
	GROUP_CREAT_DE        CHAR(40)  NOT NULL ,
	GROUP_DC              VARCHAR(300)  NULL ,
CONSTRAINT  COMTNAUTHORGROUPINFO_PK PRIMARY KEY (GROUP_ID)
);




CREATE TABLE COMTNGNRLMBER
(
	MBER_ID               VARCHAR(60)  NOT NULL ,
	PASSWORD              VARCHAR(600)  NOT NULL ,
	PASSWORD_HINT         VARCHAR(300)  NULL ,
	PASSWORD_CNSR         VARCHAR(300)  NULL ,
	IHIDNUM               VARCHAR(600)  NULL ,
	MBER_NM               VARCHAR(150)  NOT NULL ,
	ZIP                   VARCHAR(18)  NOT NULL ,
	ADRES                 VARCHAR(300)  NOT NULL ,
	AREA_NO               VARCHAR(12)  NOT NULL ,
	MBER_STTUS            VARCHAR(45)  NULL ,
	DETAIL_ADRES          VARCHAR(300)  NULL ,
	END_TELNO             VARCHAR(12)  NOT NULL ,
	MBTLNUM               VARCHAR(60)  NOT NULL ,
	GROUP_ID              CHAR(20)  NULL ,
	MBER_FXNUM            VARCHAR(60)  NULL ,
	MBER_EMAIL_ADRES      VARCHAR(150)  NULL ,
	MIDDLE_TELNO          VARCHAR(12)  NOT NULL ,
	SBSCRB_DE             DATETIME  NULL ,
	SEXDSTN_CODE          CHAR(1)  NULL ,
	ESNTL_ID              CHAR(20)  NOT NULL ,
CONSTRAINT  COMTNGNRLMBER_PK PRIMARY KEY (MBER_ID)
);




CREATE TABLE COMTNORGNZTINFO
(
	ORGNZT_ID             CHAR(20)  NOT NULL ,
	ORGNZT_NM             VARCHAR(60)  NOT NULL ,
	ORGNZT_DC             VARCHAR(300)  NULL ,
CONSTRAINT  COMTNORGNZTINFO_PK PRIMARY KEY (ORGNZT_ID)
);




CREATE TABLE COMTNEMPLYRINFO
(
	EMPLYR_ID             VARCHAR(60)  NOT NULL ,
	ORGNZT_ID             CHAR(20)  NULL ,
	USER_NM               VARCHAR(180)  NOT NULL ,
	PASSWORD              VARCHAR(600)  NOT NULL ,
	EMPL_NO               VARCHAR(60)  NULL ,
	IHIDNUM               VARCHAR(600)  NULL ,
	SEXDSTN_CODE          CHAR(1)  NULL ,
	BRTHDY                CHAR(20)  NULL ,
	FXNUM                 VARCHAR(60)  NULL ,
	HOUSE_ADRES           VARCHAR(300)  NOT NULL ,
	PASSWORD_HINT         VARCHAR(300)  NOT NULL ,
	PASSWORD_CNSR         VARCHAR(300)  NOT NULL ,
	HOUSE_END_TELNO       VARCHAR(12)  NOT NULL ,
	AREA_NO               VARCHAR(12)  NOT NULL ,
	DETAIL_ADRES          VARCHAR(300)  NULL ,
	ZIP                   VARCHAR(18)  NOT NULL ,
	OFFM_TELNO            VARCHAR(60)  NULL ,
	MBTLNUM               VARCHAR(60)  NULL ,
	EMAIL_ADRES           VARCHAR(150)  NULL ,
	OFCPS_NM              VARCHAR(180)  NULL ,
	HOUSE_MIDDLE_TELNO    VARCHAR(12)  NOT NULL ,
	GROUP_ID              CHAR(20)  NULL ,
	PSTINST_CODE          CHAR(8)  NULL ,
	EMPLYR_STTUS_CODE     CHAR(1)  NOT NULL ,
	ESNTL_ID              CHAR(20)  NOT NULL ,
	CRTFC_DN_VALUE        VARCHAR(300)  NULL ,
	SBSCRB_DE             DATETIME  NULL ,
CONSTRAINT  COMTNEMPLYRINFO_PK PRIMARY KEY (EMPLYR_ID)
);




CREATE TABLE COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID       VARCHAR(60)  NOT NULL ,
	ENTRPRS_SE_CODE       CHAR(8)  NULL ,
	BIZRNO                VARCHAR(30)  NULL ,
	JURIRNO               VARCHAR(39)  NULL ,
	CMPNY_NM              VARCHAR(180)  NOT NULL ,
	CXFC                  VARCHAR(150)  NULL ,
	ZIP                   VARCHAR(18)  NOT NULL ,
	ADRES                 VARCHAR(300)  NOT NULL ,
	ENTRPRS_MIDDLE_TELNO  VARCHAR(12)  NOT NULL ,
	FXNUM                 VARCHAR(60)  NULL ,
	INDUTY_CODE           CHAR(1)  NULL ,
	APPLCNT_NM            VARCHAR(150)  NOT NULL ,
	APPLCNT_IHIDNUM       VARCHAR(600)  NULL ,
	SBSCRB_DE             DATETIME  NULL ,
	ENTRPRS_MBER_STTUS    VARCHAR(45)  NULL ,
	ENTRPRS_MBER_PASSWORD  VARCHAR(600)  NULL ,
	ENTRPRS_MBER_PASSWORD_HINT  VARCHAR(300)  NOT NULL ,
	ENTRPRS_MBER_PASSWORD_CNSR  VARCHAR(300)  NOT NULL ,
	GROUP_ID              CHAR(20)  NULL ,
	DETAIL_ADRES          VARCHAR(300)  NULL ,
	ENTRPRS_END_TELNO     VARCHAR(12)  NOT NULL ,
	AREA_NO               VARCHAR(12)  NOT NULL ,
	APPLCNT_EMAIL_ADRES   VARCHAR(150)  NOT NULL ,
	ESNTL_ID              CHAR(20)  NOT NULL ,
CONSTRAINT  COMTNENTRPRSMBER_PK PRIMARY KEY (ENTRPRS_MBER_ID)
);






CREATE  VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNGNRLMBER
	UNION ALL
		SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
		FROM COMTNEMPLYRINFO
	UNION ALL
		SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNENTRPRSMBER ORDER BY ESNTL_ID;


CREATE TABLE COMTNBBSMASTER
(
	BBS_ID                CHAR(20)  NOT NULL ,
	BBS_NM                VARCHAR(765)  NOT NULL ,
	BBS_INTRCN            VARCHAR(7200)  NULL ,
	BBS_TY_CODE           CHAR(6)  NOT NULL ,
	BBS_ATTRB_CODE        CHAR(6)  NOT NULL ,
	REPLY_POSBL_AT        CHAR(1)  NULL ,
	FILE_ATCH_POSBL_AT    CHAR(1)  NOT NULL ,
	ATCH_POSBL_FILE_NUMBER  NUMERIC(2)  NOT NULL ,
	ATCH_POSBL_FILE_SIZE  NUMERIC(8)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	TMPLAT_ID             CHAR(20)  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
CONSTRAINT  COMTNBBSMASTER_PK PRIMARY KEY (BBS_ID)
);




CREATE TABLE COMTNBBSUSE
(
	BBS_ID                CHAR(20)  NOT NULL ,
	TRGET_ID              CHAR(20)  NOT NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	REGIST_SE_CODE        CHAR(6)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNBBSUSE_PK PRIMARY KEY (BBS_ID,TRGET_ID)
);




CREATE TABLE COMTNBBS
(
	NTT_ID                NUMERIC(20)  NOT NULL ,
	BBS_ID                CHAR(20)  NOT NULL ,
	NTT_NO                NUMERIC(20)  NULL ,
	NTT_SJ                VARCHAR(6000)  NULL ,
	NTT_CN                STRING  NULL ,
	ANSWER_AT             CHAR(1)  NULL ,
	PARNTSCTT_NO          NUMERIC(10)  NULL ,
	ANSWER_LC             NUMERIC(8)  NULL ,
	SORT_ORDR             NUMERIC(8)  NULL ,
	RDCNT                 NUMERIC(10)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	NTCE_BGNDE            CHAR(20)  NULL ,
	NTCE_ENDDE            CHAR(20)  NULL ,
	NTCR_ID               VARCHAR(60)  NULL ,
	NTCR_NM               VARCHAR(60)  NULL ,
	PASSWORD              VARCHAR(600)  NULL ,
	ATCH_FILE_ID          CHAR(20)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNBBS_PK PRIMARY KEY (NTT_ID,BBS_ID)
);




CREATE TABLE COMTNCOMMENT
(
	NTT_ID                NUMERIC(20)  NOT NULL ,
	BBS_ID                CHAR(20)  NOT NULL ,
	ANSWER_NO             NUMERIC(20)  NOT NULL ,
	WRTER_ID              VARCHAR(60)  NULL ,
	WRTER_NM              VARCHAR(60)  NULL ,
	ANSWER                VARCHAR(600)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
	PASSWORD              VARCHAR(600)  NULL ,
CONSTRAINT  COMTNCOMMENT_PK PRIMARY KEY (NTT_ID,BBS_ID,ANSWER_NO)
);




CREATE TABLE COMTNCMMNTY
(
	CMMNTY_ID             CHAR(20)  NOT NULL ,
	CMMNTY_NM             VARCHAR(765)  NOT NULL ,
	CMMNTY_INTRCN         VARCHAR(7200)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	REGIST_SE_CODE        CHAR(6)  NULL ,
	TMPLAT_ID             CHAR(20)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNCMMNTY_PK PRIMARY KEY (CMMNTY_ID)
);




CREATE TABLE COMTNCMMNTYUSER
(
	CMMNTY_ID             CHAR(20)  NOT NULL ,
	EMPLYR_ID             VARCHAR(60)  NOT NULL ,
	MNGR_AT               CHAR(1)  NOT NULL ,
	SBSCRB_DE             DATETIME  NULL ,
	SECSN_DE              CHAR(20)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNCMMNTYUSER_PK PRIMARY KEY (CMMNTY_ID,EMPLYR_ID)
);




CREATE TABLE COMTNFILE
(
	ATCH_FILE_ID          CHAR(20)  NOT NULL ,
	CREAT_DT              DATETIME  NOT NULL ,
	USE_AT                CHAR(1)  NULL ,
CONSTRAINT  COMTNFILE_PK PRIMARY KEY (ATCH_FILE_ID)
);




CREATE TABLE COMTNFILEDETAIL
(
	ATCH_FILE_ID          CHAR(20)  NOT NULL ,
	FILE_SN               NUMERIC(10)  NOT NULL ,
	FILE_STRE_COURS       VARCHAR(6000)  NOT NULL ,
	STRE_FILE_NM          VARCHAR(765)  NOT NULL ,
	ORIGNL_FILE_NM        VARCHAR(765)  NULL ,
	FILE_EXTSN            VARCHAR(60)  NOT NULL ,
	FILE_CN               STRING  NULL ,
	FILE_SIZE             NUMERIC(8)  NULL ,
CONSTRAINT  COMTNFILEDETAIL_PK PRIMARY KEY (ATCH_FILE_ID,FILE_SN)
);




CREATE TABLE COMTNCLUB
(
	CLB_ID                CHAR(20)  NOT NULL ,
	CMMNTY_ID             CHAR(20)  NOT NULL ,
	CLB_NM                VARCHAR(765)  NOT NULL ,
	CLB_INTRCN            VARCHAR(7200)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	REGIST_SE_CODE        CHAR(6)  NULL ,
	TMPLAT_ID             CHAR(20)  NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNCLUB_PK PRIMARY KEY (CLB_ID,CMMNTY_ID)
);




CREATE TABLE COMTNCLUBUSER
(
	CLB_ID                CHAR(20)  NOT NULL ,
	CMMNTY_ID             CHAR(20)  NOT NULL ,
	OPRTR_AT              CHAR(1)  NOT NULL ,
	SBSCRB_DE             DATETIME  NULL ,
	SECSN_DE              CHAR(20)  NULL ,
	USE_AT                CHAR(1)  NOT NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
	EMPLYR_ID             VARCHAR(60)  NOT NULL ,
CONSTRAINT  COMTNCLUBUSER_PK PRIMARY KEY (CLB_ID,CMMNTY_ID,EMPLYR_ID)
);




CREATE TABLE COMTNBBSMASTEROPTN
(
	BBS_ID                CHAR(20)  NOT NULL ,
	ANSWER_AT             CHAR(1)  NOT NULL ,
	STSFDG_AT             CHAR(1)  NOT NULL ,
	FRST_REGIST_PNTTM     DATETIME  NOT NULL ,
	LAST_UPDT_PNTTM       DATETIME  NULL ,
	FRST_REGISTER_ID      VARCHAR(60)  NOT NULL ,
	LAST_UPDUSR_ID        VARCHAR(60)  NULL ,
CONSTRAINT  COMTNBBSMASTEROPTN_PK PRIMARY KEY (BBS_ID)
);




