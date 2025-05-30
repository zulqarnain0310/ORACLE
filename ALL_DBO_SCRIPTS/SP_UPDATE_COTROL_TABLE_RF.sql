--------------------------------------------------------
--  DDL for Procedure SP_UPDATE_COTROL_TABLE_RF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" 
AS
   v_ACL_Date VARCHAR2(200);

BEGIN

   SELECT UTILS.CONVERT_TO_VARCHAR2(Date_,200) 

     INTO v_ACL_Date
     FROM Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   UPDATE Control_Table_for_RF_Process
      SET COUNTER = 1
    WHERE  COUNTER = 0
     AND DateOfData = v_ACL_Date;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_UPDATE_COTROL_TABLE_RF" TO "ADF_CDR_RBL_STGDB";
