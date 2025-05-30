--------------------------------------------------------
--  DDL for Procedure TEMPMIFINGOLDMASTER_NEWDB
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" 
AS

BEGIN

   EXECUTE IMMEDIATE ' TRUNCATE TABLE RBL_TEMPDB.TEMPMIFINGOLDMASTER ';
   INSERT INTO RBL_TEMPDB.TEMPMIFINGOLDMASTER
     ( DateofData, CaratMarket, Rate )
     ( SELECT DateofData ,
              CaratMarket ,
              Rate 
       FROM RBL_STGDB.MIFINGOLDMASTER_STG  );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."TEMPMIFINGOLDMASTER_NEWDB" TO "ADF_CDR_RBL_STGDB";
