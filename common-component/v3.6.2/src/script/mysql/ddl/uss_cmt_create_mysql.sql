CREATE TABLE `comtncommute` (
  `WRKTM_ID` char(20) NOT NULL,
  `EMPLYR_ID` varchar(20) NOT NULL,
  `ORGNZT_ID` varchar(20) DEFAULT NULL,
  `WRKT_DT` varchar(10) NOT NULL DEFAULT '',
  `WRK_START_TIME` varchar(14) DEFAULT NULL,
  `WRK_END_TIME` varchar(14) DEFAULT NULL,
  `WRK_HOURS` char(2) DEFAULT NULL,
  `OVTMWRK_HOURS` char(2) DEFAULT NULL,
  `WRK_START_STATUS` varchar(10) DEFAULT NULL,
  `WRK_END_STATUS` varchar(10) DEFAULT NULL,
  `RM` varchar(100) DEFAULT NULL,
  `FRST_REGISTER_ID` varchar(20) DEFAULT NULL,
  `FRST_REGIST_PNTTM` datetime DEFAULT NULL,
  `LAST_UPDUSR_ID` varchar(20) DEFAULT NULL,
  `LAST_UPDT_PNTTM` datetime DEFAULT NULL,
  PRIMARY KEY (`EMPLYR_ID`,`WRKT_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
