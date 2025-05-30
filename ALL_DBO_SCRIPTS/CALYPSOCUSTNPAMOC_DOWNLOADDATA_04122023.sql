--------------------------------------------------------
--  DDL for Procedure CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" 
(
  iv_Timekey IN NUMBER,
  v_UserLoginId IN VARCHAR2,
  v_ExcelUploadId IN NUMBER,
  v_UploadType IN VARCHAR2
)
AS
   v_Timekey NUMBER(10,0) := iv_Timekey;
--,@Page SMALLINT =1     
--   ,@perPage INT = 30000   
----DECLARE @Timekey INT=49999
----	,@UserLoginId VARCHAR(100)='FNASUPERADMIN'
----	,@ExcelUploadId INT=4
----	,@UploadType VARCHAR(50)='Interest reversal'

BEGIN

   --SET @Timekey =(Select TimeKey from SysDataMatrix where CurrentStatus='C') 
   --SET @Timekey =(Select LastMonthDateKey from SysDayMatrix where Timekey=@Timekey) 
   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  MOC_Initialised = 'Y'
             AND NVL(MOC_Frozen, 'N') = 'N';
   DBMS_OUTPUT.PUT_LINE(v_Timekey);--DECLARE @PageFrom INT, @PageTo INT   
   --SET @PageFrom = (@perPage*@Page)-(@perPage) +1  
   --SET @PageTo = @perPage*@Page  
   --SELECT * FROM(
   @UploadType = 'Calypso Customer MOC Upload' ) BEGIN IF EXISTS ( SELECT 1 FROM CalypsoCustomerLevelMOC_Mod A INNER JOIN InvestmentIssuerDetail B ON A . UCIFID = B . UCIFID WHERE UploadId = @ExcelUploadId AND A . EffectiveFromTimeKey <= @Timekey AND A . EffectiveToTimeKey >= @Timekey AND B . EffectiveFromTimeKey <= @Timekey AND B . EffectiveToTimeKey >= @Timekey ) BEGIN SELECT DISTINCT A . UCIFID AS UCICID , 'Details' AS TableName , UploadID , B . IssuerName AS CustomerName , A . AssetClass , TRY_CAST ( NPADate AS VARCHAR  --SQLDEV: NOT RECOGNIZED
   --A.SecurityValue,
   AS NPADate , AdditionalProvision , A . MOCType , A . MOCReason , TRY_CAST ( A . MOCDate AS  --SQLDEV: NOT RECOGNIZED
   --MOCBy,
   AS MOCDate , MOCSource FROM CalypsoCustomerLevelMOC_Mod A INNER JOIN InvestmentIssuerDetail B ON A . UCIFID = B . UCIFID WHERE UploadId = @ExcelUploadId AND A . EffectiveFromTimeKey <= @Timekey AND A . EffectiveToTimeKey >= @Timekey AND B . EffectiveFromTimeKey <= @Timekey AND B . EffectiveToTimeKey >= @Timekey  --SQLDEV: NOT RECOGNIZED

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CALYPSOCUSTNPAMOC_DOWNLOADDATA_04122023" TO "ADF_CDR_RBL_STGDB";
