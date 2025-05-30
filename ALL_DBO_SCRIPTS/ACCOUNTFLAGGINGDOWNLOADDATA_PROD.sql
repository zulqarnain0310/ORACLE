--------------------------------------------------------
--  DDL for Procedure ACCOUNTFLAGGINGDOWNLOADDATA_PROD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" 
(
  iv_Timekey IN NUMBER,
  v_UserLoginId IN VARCHAR2,
  v_ExcelUploadId IN NUMBER,
  v_UploadType IN VARCHAR2
)
AS
   v_Timekey NUMBER(10,0) := iv_Timekey;
   v_cursor SYS_REFCURSOR;
--,@Page SMALLINT =1     
--   ,@perPage INT = 30000   
----DECLARE @Timekey INT=49999
----	,@UserLoginId VARCHAR(100)='FNASUPERADMIN'
----	,@ExcelUploadId INT=4
----	,@UploadType VARCHAR(50)='Interest reversal'

BEGIN

   SELECT ( SELECT UTILS.CONVERT_TO_NUMBER(B.TimeKey,10,0) 
            FROM SysDataMatrix A
                   JOIN SysDayMatrix B   ON A.TimeKey = B.TimeKey
             WHERE  A.CurrentStatus = 'C' ) 

     INTO v_Timekey
     FROM DUAL ;
   DBMS_OUTPUT.PUT_LINE(v_Timekey);
   --DECLARE @PageFrom INT, @PageTo INT   
   --SET @PageFrom = (@perPage*@Page)-(@perPage) +1  
   --SET @PageTo = @perPage*@Page  
   IF ( v_UploadType = 'Account Flagging Upload' ) THEN

   BEGIN
      DBMS_OUTPUT.PUT_LINE('REV');
      --SELECT * FROM(
      OPEN  v_cursor FOR
         SELECT 'Details' TableName  ,
                UploadID ,
                ACID ,
                Amount ,
                Date_ ,
                ACTION 

           ------,ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS ROW_NUM
           FROM AccountFlaggingDetails_Mod 
          WHERE  UploadId = v_ExcelUploadId
                   AND EffectiveFromTimeKey <= v_Timekey
                   AND EffectiveToTimeKey >= v_Timekey ;
         DBMS_SQL.RETURN_RESULT(v_cursor);----SELECT 'Summary' as TableName, Row_Number() over(order by PoolID) as SrNo
      ----,UploadID
      ----,SummaryID
      ----,PoolID
      ----,PoolName
      ----,PoolType
      ----,BalanceOutstanding
      ----,IBPCExposureAmt
      ----,IBPCReckoningDate
      ----,IBPCMarkingDate
      ----,MaturityDate
      ----------,ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS ROW_NUM
      ----FROM IBPCPoolSummary_Mod
      ----WHERE UploadId=@ExcelUploadId
      ----AND EffectiveFromTimeKey<=@Timekey AND EffectiveToTimeKey>=@Timekey
      --)A
      --WHERE ROW_NUM BETWEEN  @PageFrom AND @PageTo
      --ORDER BY ROW_NUM  

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."ACCOUNTFLAGGINGDOWNLOADDATA_PROD" TO "ADF_CDR_RBL_STGDB";
