--------------------------------------------------------
--  DDL for Procedure ADVSECURITYDETAIL_TEMP_26092022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" 
-- =============================================  
 -- Author:  <Author,,Name>  
 -- Create date: <Create Date,,>  
 -- Description: <Description,,>  
 -- =============================================  

AS
   -- SET NOCOUNT ON added to prevent extra result sets from  
   -- interfering with SELECT statements.  
   -- Insert statements for procedure here  
   v_vEffectivefrom NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_DATE VARCHAR2(200) := ( SELECT Date_ 
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   --GO
   /*********************************************************************************************************/
   /*  New Customers Account Entity ID Update  */
   v_SecurityEntityId NUMBER(10,0) := 0;
-- Add the parameters for the stored procedure here  

BEGIN

   SELECT TimeKey 

     INTO v_vEffectiveFrom
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT TimeKey 

     INTO v_TimeKey
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   ---------------------------------------------------------------------------------------------------------------------------------------------------   
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TempAdvSecurityDetail ';
   INSERT INTO TempAdvSecurityDetail
     ( AccountEntityId, CustomerEntityId, SecurityType, CollateralType, SecurityAlt_Key, SecurityEntityID, Security_RefNo, SecurityNature, SecurityChargeTypeAlt_Key, CurrencyAlt_Key, EntryType, ScrCrError, InwardNo, Limitnode_Flag, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocTypeAlt_Key, MocStatus, MocDate, SecurityParticular, OwnerTypeAlt_Key, AssetOwnerName, ValueAtSanctionTime, BranchLastInspecDate, SatisfactionNo, SatisfactionDate, BankShare, ActionTakenRemark, SecCharge, CollateralID )
     ( 
       -------------    FINACLE  ---------  
       SELECT B.AccountEntityId ,
              B.CustomerEntityId ,
              'P' SecurityType  ,
              NULL CollateralType  ,
              0 SecurityAlt_Key  ,
              0 SecurityEntityID  ,
              NULL Security_RefNo  ,
              NULL SecurityNature  ,
              NULL SecurityChargeTypeAlt_Key  ,
              NULL CurrencyAlt_Key  ,
              NULL EntryType  ,
              NULL ScrCrError  ,
              NULL InwardNo  ,
              NULL Limitnode_Flag  ,
              B.RefCustomerId ,
              B.SystemAcId ,
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
              NULL MocTypeAlt_Key  ,
              NULL MocStatus  ,
              NULL MocDate  ,
              NULL SecurityParticular  ,
              NULL OwnerTypeAlt_Key  ,
              NULL AssetOwnerName  ,
              NULL ValueAtSanctionTime  ,
              NULL BranchLastInspecDate  ,
              NULL SatisfactionNo  ,
              NULL SatisfactionDate  ,
              NULL BankShare  ,
              NULL ActionTakenRemark  ,
              NULL SecCharge  ,
              CollateralID 
       FROM RBL_STGDB.Security_All_Source_System A
              LEFT JOIN TempAdvAcBasicDetail B   ON A.AccountID = B.CustomerAcid
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey );
   --LEFT JOIN  select * from UATRestore_RBL_MISDB.[dbo].[DimCollateralSubType] C ON C.SrcSysSecurityCode=A.SecurityCode  
   --    AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey  
   --LEFT JOIN  UATRestore_RBL_MISDB.[dbo].[DimSecurityChargeType] D ON D.SecurityChargeTypeName=A.SecurityChargeStatus  
   --    AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey  
   /*  
    UNION  


      -------------    INDUS  ---------  
      SELECT   B.AccountEntityId  
      ,B.CustomerEntityId  
      ,NULL SecurityType  
      ,NULL CollateralType  
      ,C.SecurityAlt_Key  
      ,0 SecurityEntityID  
      ,NULL Security_RefNo  
      ,NULL SecurityNature  
      ,D.SecurityChargeTypeAlt_Key  
      ,NULL CurrencyAlt_Key  
      ,NULL EntryType  
      ,NULL ScrCrError  
      ,NULL InwardNo  
      ,NULL Limitnode_Flag  
      ,B.RefCustomerId  
      ,B.SystemAcId  
      ,NULL AuthorisationStatus  
      ,@vEffectivefrom EffectiveFromTimeKey  
      ,49999 EffectiveToTimeKey  
      ,'SSISUSER' CreatedBy  
      ,GETDATE() DateCreated  
      ,NULL ModifiedBy  
      ,NULL DateModified  
      ,NULL ApprovedBy  
      ,NULL DateApproved  
      ,NULL D2Ktimestamp  
      ,NULL MocTypeAlt_Key  
      ,NULL MocStatus  
      ,NULL MocDate  
      ,NULL SecurityParticular  
      ,NULL OwnerTypeAlt_Key  
      ,NULL AssetOwnerName  
      ,NULL ValueAtSanctionTime  
      ,NULL BranchLastInspecDate  
      ,NULL SatisfactionNo  
      ,NULL SatisfactionDate  
      ,NULL BankShare  
      ,NULL ActionTakenRemark  
      ,NULL SecCharge  
    FROM   RBL_STGDB.[dbo].[SECURITY_SOURCESYSTEM02_STG] A  
    LEFT JOIN  TempAdvAcBasicDetail B ON A.AccountID=B.CustomerAcid  
        AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey  
    LEFT JOIN  UATRestore_RBL_MISDB.[dbo].[DimSecurity] C ON C.SrcSysSecurityCode=A.SecurityCode  
        AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey  
    LEFT JOIN  UATRestore_RBL_MISDB.[dbo].[DimSecurityChargeType] D ON D.SecurityChargeTypeName=A.SecurityChargeStatus  
        AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey  


    UNION  

    -------------    MIFIN  ---------  
      SELECT   B.AccountEntityId  
      ,B.CustomerEntityId  
      ,NULL SecurityType  
      ,NULL CollateralType  
      ,NULL SecurityAlt_Key  
      ,0 SecurityEntityID  
      ,NULL Security_RefNo  
      ,NULL SecurityNature  
      ,NULL SecurityChargeTypeAlt_Key  
      ,NULL CurrencyAlt_Key  
      ,NULL EntryType  
      ,NULL ScrCrError  
      ,NULL InwardNo  
      ,NULL Limitnode_Flag  
      ,B.RefCustomerId  
      ,B.SystemAcId  
      ,NULL AuthorisationStatus  
      ,@vEffectivefrom EffectiveFromTimeKey  
      ,49999 EffectiveToTimeKey  
      ,'SSISUSER' CreatedBy  
      ,GETDATE() DateCreated  
      ,NULL ModifiedBy  
      ,NULL DateModified  
      ,NULL ApprovedBy  
      ,NULL DateApproved  
      ,NULL D2Ktimestamp  
      ,NULL MocTypeAlt_Key  
      ,NULL MocStatus  
      ,NULL MocDate  
      ,NULL SecurityParticular  
      ,NULL OwnerTypeAlt_Key  
      ,NULL AssetOwnerName  
      ,NULL ValueAtSanctionTime  
      ,NULL BranchLastInspecDate  
      ,NULL SatisfactionNo  
      ,NULL SatisfactionDate  
      ,NULL BankShare  
      ,NULL ActionTakenRemark  
      ,NULL SecCharge  
    FROM   RBL_STGDB.[dbo].[SECURITY_SOURCESYSTEM04_STG] A  
    LEFT JOIN  TempAdvAcBasicDetail B ON A.AccountID=B.CustomerAcid  
        AND B.EffectiveFromTimeKey<=@TimeKey AND B.EffectiveToTimeKey>=@TimeKey  
    --LEFT JOIN  UATRestore_RBL_MISDB.[dbo].[DimSecurity] C ON C.SrcSysSecurityCode=A.SecurityCode  
    --    AND C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey  
    --LEFT JOIN  UATRestore_RBL_MISDB.[dbo].[DimSecurityChargeType] D ON D.SecurityChargeTypeName=A.SecurityChargeStatus  
    --    AND D.EffectiveFromTimeKey<=@TimeKey AND D.EffectiveToTimeKey>=@TimeKey  




     */
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, MAIN.SecurityEntityId
   FROM TEMP ,RBL_TEMPDB.tempadvsecuritydetail TEMP
          JOIN UATRestore_RBL_MISDB.AdvSecurityDetail MAIN   ON TEMP.AccountEntityId = MAIN.AccountEntityId
          AND TEMP.CollateralId = MAIN.CollateralId 
    WHERE MAIN.EffectiveToTimeKey = 49999) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.SecurityEntityId = src.SecurityEntityId;
   SELECT MAX(SecurityEntityId)  

     INTO v_SecurityEntityId
     FROM UATRestore_RBL_MISDB.AdvSecurityDetail ;
   IF v_SecurityEntityId IS NULL THEN

   BEGIN
      v_SecurityEntityId := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.SecurityEntityId
   FROM TEMP ,RBL_TEMPDB.tempadvsecuritydetail TEMP
          JOIN ( SELECT "TEMPADVSECURITYDETAIL".AccountEntityId ,
                        "TEMPADVSECURITYDETAIL".CollateralId ,
                        (v_SecurityEntityId + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                               FROM DUAL  )  )) SecurityEntityId  
                 FROM RBL_TEMPDB.tempadvsecuritydetail 
                  WHERE  "TEMPADVSECURITYDETAIL".AccountEntityId = 0
                           OR "TEMPADVSECURITYDETAIL".AccountEntityId IS NULL ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId
          AND TEMP.CollateralId = ACCT.CollateralId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.SecurityEntityId = src.SecurityEntityId;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVSECURITYDETAIL_TEMP_26092022" TO "ADF_CDR_RBL_STGDB";
