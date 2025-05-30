--------------------------------------------------------
--  DDL for Procedure DEGRADEOVERRIDINGCASES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" 
AS
   v_TimeKey NUMBER(10,0) := ( SELECT TimeKey 
     FROM Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   --Declare @TimeKey AS INT =26298
   v_cursor SYS_REFCURSOR;

BEGIN

   OPEN  v_cursor FOR
      SELECT 'FinacleDegrade' TableName  ,
             customeracid || '|' || UTILS.CONVERT_TO_VARCHAR2(A.FinalNpaDt,10,p_style=>105) || '|' DataUtility  
        FROM PRO_RBL_MISDB_PROD.AccountCal_Hist A
               JOIN DIMSOURCEDB B   ON A.SourceAlt_Key = B.SourceAlt_Key
               AND B.EffectiveFromTimeKey <= v_TimeKey
               AND B.EffectiveToTimeKey >= v_TimeKey
               JOIN DimAssetClass E   ON A.FinalAssetClassAlt_Key = E.AssetClassAlt_Key
               AND E.EffectiveFromTimeKey <= v_TimeKey
               AND E.EffectiveToTimeKey >= v_TimeKey
       WHERE  B.SourceName = 'Finacle'
                AND A.InitialAssetClassAlt_Key > 1
                AND A.FinalAssetClassAlt_Key > 1
                AND A.InitialNpaDt <> A.FinalNpaDt
                AND A.EffectiveFromTimekey <= v_TimeKey
                AND A.EffectiveToTimeKey >= v_TimeKey ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."DEGRADEOVERRIDINGCASES" TO "ADF_CDR_RBL_STGDB";
