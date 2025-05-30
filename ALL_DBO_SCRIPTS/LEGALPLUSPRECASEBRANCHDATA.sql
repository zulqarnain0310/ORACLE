--------------------------------------------------------
--  DDL for Procedure LEGALPLUSPRECASEBRANCHDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

(
  v_UserLoginID IN VARCHAR2 DEFAULT ' ' ,
  v_TimeKey IN NUMBER DEFAULT 9999 
)
AS
   --END
   v_LocatationCode VARCHAR2(100);
   v_Location CHAR(2) := 'HO';
   --AND @LocatationCode= CASE WHEN @Location='HO' THEN @LocatationCode 
   --						  WHEN @Location='ZO' THEN CAST(A.BranchZoneAlt_Key AS varchar(10))
   --						  WHEN @Location='RO' THEN CAST(A.BranchRegionAlt_Key AS varchar(10))
   --						  WHEN @Location='BO' THEN CAST(A.BranchCode AS varchar(10))
   --					  END
   v_cursor SYS_REFCURSOR;

BEGIN

   --------- ADD LOGIC TO CHECK THE ACL PROCESS IS RUNNING OR NOT BY SATWAJI AS ON 28/08/2023 ------------------
   --IF (@OperationFlag IN(1,2,3,16,17,20))
   --BEGIN
   DBMS_OUTPUT.PUT_LINE('ACL Process Status Check');
   ACLProcessStatusCheck() ;
   SELECT NVL(UserLocation, ' ') ,
          NVL(UserLocationCode, ' ') 

     INTO v_Location,
          v_LocatationCode
     FROM DimUserInfo 
    WHERE  UserLoginID = v_UserLoginID;
   DBMS_OUTPUT.PUT_LINE(v_Location);
   DBMS_OUTPUT.PUT_LINE(v_LocatationCode);
   IF utils.object_id('Tempdb..tt_TempBrData') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TempBrData ';
   END IF;
   DELETE FROM tt_TempBrData;
   INSERT INTO tt_TempBrData
     ( SELECT BranchCode ,
              BranchName 
       FROM DimBranch A
        WHERE  ( EffectiveFromTimeKey <= v_TimeKey
                 AND EffectiveToTimeKey >= v_TimeKey ) );
   OPEN  v_cursor FOR
      SELECT * 
        FROM tt_TempBrData  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LEGALPLUSPRECASEBRANCHDATA" TO "ADF_CDR_RBL_STGDB";
