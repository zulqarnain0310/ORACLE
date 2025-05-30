--------------------------------------------------------
--  DDL for Procedure ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   -- Insert statements for procedure here
   v_vEffectivefrom NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_DATE VARCHAR2(200) := ( SELECT Date_ 
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
-- Add the parameters for the stored procedure here

BEGIN

   SELECT TimeKey 

     INTO v_vEffectiveFrom
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT TimeKey 

     INTO v_TimeKey
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   --------------------------------------------------------------------------------------------------------------------------------------------------- 
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TempAdvSecurityValueDetail ';
   INSERT INTO TempAdvSecurityValueDetail
     ( SecurityEntityID, ValuationSourceAlt_Key, ValuationDate, CurrentValue, ValuationExpiryDate, CollateralID, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, SecurityValueMain )
     ( 
       -------------    mifin  ---------
       SELECT C.SecurityEntityID ,
              NULL ValuationSourceAlt_Key  ,
              A.ValuationDate ,
              A.SecurityValue CurrentValue  ,
              A.ValuationExpiryDate ,
              a.CollateralID ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL D2Ktimestamp  ,
              a.SecurityValue SecurityValueMain  
       FROM RBL_STGDB.Security_All_Source_System A
              JOIN TempAdvAcBasicDetail B   ON A.AccountID = B.CustomerAcid
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              JOIN TempAdvSecurityDetail C   ON C.AccountEntityID = B.AccountEntityID
              AND A.CollateralID = C.CollateralID
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
              AND C.SecurityType = 'P'
       UNION 

       ----finacle
       SELECT C.SecurityEntityID ,
              NULL ValuationSourceAlt_Key  ,
              A.ValuationDate ,
              A.SecValue_Final CurrentValue  ,
              A.ValuationExpiryDate_New ,
              a.COLLATERALID ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL D2Ktimestamp  ,
              MainSecurityValue SecurityValueMain  
       FROM RBL_STGDB.FINACLE_COLLATERAL_DATA A
              JOIN TempCustomerBasicDetail B   ON A.CUSTOMER_ID = B.CUSTOMERID
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              JOIN TempAdvSecurityDetail C   ON C.CustomerEntityID = B.CustomerEntityID
              AND A.CollateralID = C.CollateralID
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
              AND C.SecurityType = 'C'
       UNION ALL 
       SELECT C.SecurityEntityID ,
              NULL ValuationSourceAlt_Key  ,
              A.ValuationDate ,
              A.SecValue_Final CurrentValue  ,
              --,A.apportioned_value
              --	,case when (ValuationExpiryDate <=@Date OR  (a.SecurityValue= 0 OR ISNULL(ValuationExpiryDate,'')='' ))
              --then 0 else A.apportioned_value end apportioned_value
              A.ValuationExpiryDate ValuationExpiryDate_New  ,
              a.COLLATERALID ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL D2Ktimestamp  ,
              A.apportioned_value SecurityValueMain  
       FROM RBL_SECURITY_CAL_Account A
              JOIN TempCustomerBasicDetail B   ON A.CUSTOMER_ID = B.CUSTOMERID
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              JOIN TempAdvSecurityDetail C   ON C.CustomerEntityID = B.CustomerEntityID
              AND A.CollateralID = C.CollateralID
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
              AND C.SecurityType = 'P'
        WHERE  a.COLLATERAL_TYPE IN ( 'Deposits','Insurance/NSC/KVP/IVP','Shares/MF/Gold','Movable FA' )
      );--UNION
   ---------------    INDUS  ---------
   --  SELECT   C.SecurityEntityID
   --		,NULL ValuationSourceAlt_Key
   --		,A.ValuationDate
   --		,A.SecurityValue CurrentValue
   --		,A.ValuationExpiryDate
   --		,NULL AuthorisationStatus
   --		,@vEffectivefrom EffectiveFromTimeKey
   --		,49999 EffectiveToTimeKey
   --		,'SSISUSER' CreatedBy
   --		,GETDATE() DateCreated
   --		,NULL ModifiedBy
   --		,NULL DateModified
   --		,NULL ApprovedBy
   --		,NULL DateApproved
   --		,NULL D2Ktimestamp
   --FROM			RBL_STGDB.[dbo].[SECURITY_SOURCESYSTEM02_STG] A
   --LEFT JOIN		TempAdvAcBasicDetail B ON A.AccountID=B.CustomerAcid
   --				AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   --LEFT JOIN		TempAdvSecurityDetail C ON C.AccountEntityId=B.AccountEntityId
   --				AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey
   --UNION
   ---------------    MIFIN  ---------
   --  SELECT   C.SecurityEntityID
   --		,NULL ValuationSourceAlt_Key
   --		,NULL ValuationDate
   --		,NULL CurrentValue                                --A.SecurityValue CurrentValue
   --		,NULL ValuationExpiryDate
   --		,NULL AuthorisationStatus
   --		,@vEffectivefrom EffectiveFromTimeKey
   --		,49999 EffectiveToTimeKey
   --		,'SSISUSER' CreatedBy
   --		,GETDATE() DateCreated
   --		,NULL ModifiedBy
   --		,NULL DateModified
   --		,NULL ApprovedBy
   --		,NULL DateApproved
   --		,NULL D2Ktimestamp
   --FROM			RBL_STGDB.[dbo].[SECURITY_SOURCESYSTEM04_STG] A
   --LEFT JOIN		TempAdvAcBasicDetail B ON A.AccountID=B.CustomerAcid
   --				AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey
   --LEFT JOIN		TempAdvSecurityDetail C ON C.AccountEntityId=B.AccountEntityId
   --				AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYVALUEDETAIL_TEMP_08072022_REVISED" TO "ADF_CDR_RBL_STGDB";
