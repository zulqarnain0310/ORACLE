--------------------------------------------------------
--  DDL for Table METASCREENFIELDDETAIL
--------------------------------------------------------

  CREATE TABLE "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" 
   (	"ENTITYKEY" NUMBER(10,0) GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"MENUID" NUMBER(5,0), 
	"SCREENNAME" VARCHAR2(50 CHAR), 
	"CTRLNAME" VARCHAR2(100 CHAR), 
	"RESOURCEKEY" VARCHAR2(150 CHAR), 
	"FLDDATATYPE" VARCHAR2(20 CHAR), 
	"COL_LG" VARCHAR2(2 CHAR), 
	"COL_MD" VARCHAR2(2 CHAR), 
	"COL_SM" VARCHAR2(2 CHAR), 
	"MINLENGTH" NUMBER(5,0), 
	"MAXLENGTH" NUMBER(5,0), 
	"ERRORCHECK" CHAR(1 CHAR), 
	"DATASEQ" NUMBER(5,0), 
	"FLDGRIDVIEW" VARCHAR2(2 CHAR), 
	"CRITICALERRORTYPE" VARCHAR2(2 CHAR), 
	"SCREENFIELDNO" NUMBER(10,0), 
	"ISEDITABLE" CHAR(1 CHAR), 
	"ISVISIBLE" CHAR(1 CHAR), 
	"ISUPPER" CHAR(1 CHAR), 
	"ISMANDATORY" CHAR(1 CHAR), 
	"ALLOWCHAR" VARCHAR2(50 CHAR), 
	"DISALLOWCHAR" VARCHAR2(50 CHAR), 
	"DEFAULTVALUE" VARCHAR2(50 CHAR), 
	"ALLOWTOOLTIP" CHAR(1 CHAR), 
	"REFERENCECOLUMNNAME" VARCHAR2(80 CHAR), 
	"REFERENCETABLENAME" VARCHAR2(80 CHAR), 
	"MOC_FLAG" CHAR(1 CHAR), 
	"USERID" VARCHAR2(20 CHAR), 
	"CREATEDBY" VARCHAR2(20 CHAR), 
	"DATECREATED" DATE, 
	"MODIFIEDBY" VARCHAR2(20 CHAR), 
	"DATEMODIFIED" DATE, 
	"SCREENFIELDGROUP" CHAR(2 CHAR), 
	"HIGHERLEVELEDIT" CHAR(1 CHAR), 
	"APPLICABLEFORWORKFLOW" CHAR(1 CHAR), 
	"ISEXTRACTEDEDITABLE" CHAR(1 CHAR), 
	"ISMOCVISIBLE" CHAR(1 CHAR)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "PREMOC_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "QPI_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ALERT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DWH_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "MAIN_PRO";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CURDAT_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BS_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ACL_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ALTER ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DELETE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INDEX ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT INSERT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT SELECT ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT UPDATE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT REFERENCES ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT READ ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT ON COMMIT REFRESH ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT QUERY REWRITE ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ROLE_ALL_DB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "CC_CDR_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_BI_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "BSG_READ_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STD_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "RBL_TEMPDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "STG_FIN_RBL_STGDB";
  GRANT FLASHBACK ON "RBL_MISDB_PROD"."METASCREENFIELDDETAIL" TO "ADF_CDR_RBL_STGDB";
