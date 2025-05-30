--------------------------------------------------------
--  DDL for Procedure DISTRICT_DROPDOWN_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" 
(
  iv_Timekey IN NUMBER,
  v_StateAlt_Key IN NUMBER
)
AS
   v_Timekey NUMBER(10,0) := iv_Timekey;
   v_cursor SYS_REFCURSOR;

BEGIN

   --declare @Timekey int,@StateAlt_Key int  =10  --varchar(50)='BIHAR'
   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT DistrictAlt_Key ,
             DistrictName ,
             'DistrictNameList' TableName  
        FROM DimGeography 
       WHERE  EffectiveFromTimeKey <= v_Timekey
                AND EffectiveToTimeKey >= v_Timekey
                AND StateAlt_Key = v_StateAlt_Key
        ORDER BY DistrictName ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DISTRICT_DROPDOWN_04122023" TO "ADF_CDR_RBL_STGDB";
