--------------------------------------------------------
--  DDL for Procedure CUST_GRID_PUI_PROD_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" 
-- [Cust_grid_PUI] '1714222715864042'
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(
  v_AccountID IN VARCHAR2
)
AS
   v_Timekey NUMBER(10,0);
   --SET @Timekey=25999
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   OPEN  v_cursor FOR
      SELECT CustomerID ,
             UCIFID ,
             AccountID ,
             CustomerName ,
             ProjectCategoryAlt_Key ,
             PC.ProjectCategoryDescription ,
             ProjectSubCategoryAlt_key ,
             PCS.ProjectCategorySubTypeDescription ,
             ProjectOwnerShipAlt_Key ,
             ProjectAuthorityAlt_key ,
             UTILS.CONVERT_TO_VARCHAR2(OriginalDCCO,10,p_style=>103) OriginalDCCO  ,
             OriginalProjectCost ,
             OriginalDebt ,
             ProjectSubCatDescription ,
             'UpdatePUI' TableName  
        FROM AdvAcPUIDetailMain PUI
               JOIN ProjectCategory PC   ON PC.ProjectCategoryAltKey = PUI.ProjectCategoryAlt_Key
               AND PUI.EffectiveFromTimeKey <= v_Timekey
               AND PUI.EffectiveToTimeKey >= v_Timekey
               AND PC.EffectiveFromTimeKey <= v_Timekey
               AND PC.EffectiveToTimeKey >= v_Timekey
               LEFT JOIN ProjectCategorySubType PCS   ON PCS.ProjectCategorySubTypeAltKey = PUI.ProjectSubCategoryAlt_key
               AND PC.ProjectCategoryAltKey = PCS.ProjectCategoryTypeAltKey
               AND PCS.EffectiveFromTimeKey <= v_Timekey
               AND PCS.EffectiveToTimeKey >= v_Timekey
       WHERE  PUI.AccountID = v_AccountID ;
      DBMS_SQL.RETURN_RESULT(v_cursor);--select * from AdvAcPUIDetailMain
   --select * from ProjectCategory ---where ProjectCategoryAltKey=2
   --select * from ProjectCategorySubType

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CUST_GRID_PUI_PROD_04122023" TO "ADF_CDR_RBL_STGDB";
