--------------------------------------------------------
--  DDL for Procedure PROJECTOWNERSHIP_PUI
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" 
AS
   --@ProjectownId  INT
   v_TimeKey NUMBER(10,0);
   --Declare @ProjectownId int=1
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT ParameterAlt_Key ,
             ParameterName ,
             'ProjectOwnership' TableName  
        FROM DimParameter D
       WHERE  dimparametername = 'ProjectOwnership'
                AND D.EffectiveFromTimeKey <= v_Timekey
                AND D.EffectiveToTimeKey >= v_Timekey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);--And ParameterAlt_Key=@ProjectownId

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PROJECTOWNERSHIP_PUI" TO "ADF_CDR_RBL_STGDB";
