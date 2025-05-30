--------------------------------------------------------
--  DDL for Procedure HOSTSYSTEMDATAINSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" 
AS
   v_Date VARCHAR2(200) := ( SELECT Date_ 
     FROM Automate_Advances 
    WHERE  Ext_flg = 'Y' );
--@Date date

BEGIN

   --delete  from ENPA_Host_System_Status_tbl where Report_Date in(select date from Automate_advances where Ext_flg = 'Y')
   INSERT INTO ENPA_Host_System_Status_tbl
     ( Account_No, Host_System_Name, Report_Date, Create_On )
     ( SELECT AccountID ,
              SourceSystemName ,
              Dateofdata ,
              SYSDATE 
       FROM ReverseFeedData 
        WHERE  UTILS.CONVERT_TO_VARCHAR2(DateofData,200) IN ( v_Date )

                 AND AssetClass > 1
                 AND SourceSystemName NOT IN ( 'VisionPlus' )
      );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMDATAINSERT" TO "ADF_CDR_RBL_STGDB";
