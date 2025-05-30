--------------------------------------------------------
--  DDL for Procedure INVESTMENTBASICDETAIL_TEMP_15122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" 
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
   --UPDATE TEMP 
   --SET TEMP.InvEntityId=MAIN.InvEntityId 
   --FROM  RBL_TEMPDB.DBO.[TempInvestmentBasicDetail] TEMP
   --INNER JOIN RBL_MISDB.[dbo].[InvestmentBasicDetail] MAIN 
   --ON TEMP.InvID=MAIN.InvID
   --WHERE MAIN.EffectiveToTimeKey=49999
   --GO
   /*********************************************************************************************************/
   /*  New Customers Customer Entity ID Update  */
   v_InvEntityId NUMBER(10,0) := 0;
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
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TempInvestmentBasicDetail ';
   INSERT INTO TempInvestmentBasicDetail
     ( BranchCode, Inv_Key, InvID, IssuerID, ISIN, InstrTypeAlt_Key, InstrName, InvestmentNature, InternalRating, InRatingDate, InRatingExpiryDate, ExRating, ExRatingAgency, ExRatingDate, ExRatingExpiryDate, Sector, Industry_AltKey, ListedStkExchange, ExposureType, SecurityValue, MaturityDt, ReStructureDate, MortgageStatus, NHBStatus, ResiPurpose, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved )
     ( SELECT A.BranchCode ,
              NULL Inv_Key  ,
              (CASE 
                    WHEN HoldingNature IS NULL THEN A.InvID
              ELSE (A.InvID || '_' || UTILS.CONVERT_TO_VARCHAR2(NVL(HoldingNature, ' '),10))
                 END) InvID  ,
              A.IssuerID ,
              ISIN ,
              B.InstrumentTypeAlt_Key ,
              A.InstrName ,
              A.InvestmentNature ,
              NULL InternalRating  ,
              NULL InRatingDate  ,
              NULL InRatingExpiryDate  ,
              NULL ExRating  ,
              NULL ExRatingAgency  ,
              NULL ExRatingDate  ,
              NULL ExRatingExpiryDate  ,
              A.Sector ,
              C.IndustryAlt_Key ,
              NULL ListedStkExchange  ,
              A.ExposureType ,
              A.SecurityValue ,
              A.MaturityDt ,
              A.ReStructureDate ,
              NULL MortgageStatus  ,
              NULL NHBStatus  ,
              NULL ResiPurpose  ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              'SSISUSER' CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  
       FROM RBL_STGDB.INVBASIC_SOURCESYSTEM_STG A
              LEFT JOIN RBL_MISDB.DimInstrumentType B   ON A.InstrTypeCode = B.InstrumentTypeSubGroup
              AND B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey
              LEFT JOIN RBL_MISDB.DimIndustry C   ON A.IndustryCode = C.SrcSysIndustryCode
              AND C.EffectiveFromTimeKey <= v_TimeKey
              AND C.EffectiveToTimeKey >= v_TimeKey
              LEFT JOIN RBL_STGDB.INVFINANCIAL_SOURCESYSTEM_STG J   ON A.InvID = J.InvID
              JOIN RBL_TEMPDB.TempInvestmentIssuerDetail I   ON I.IssuerID = A.IssuerID );
   /*********************************************************************************************************/
   /*  Existing Customers Customer Entity ID Update  */
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, MAIN.InvEntityId
   FROM TEMP ,RBL_TEMPDB.TempInvestmentBasicDetail TEMP
          JOIN RBL_MISDB.InvestmentFinancialDetail MAIN   ON TEMP.InvID = (CASE 
                                                                                WHEN HoldingNature IS NULL THEN MAIN.RefInvID
        ELSE (MAIN.RefInvID || '_' || UTILS.CONVERT_TO_VARCHAR2(NVL(HoldingNature, ' '),10))
           END) 
    WHERE MAIN.EffectiveToTimeKey = 49999) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.InvEntityId = src.InvEntityId;
   SELECT MAX(InvEntityId)  

     INTO v_InvEntityId
     FROM RBL_MISDB.InvestmentBasicDetail ;
   IF v_InvEntityId IS NULL THEN

   BEGIN
      v_InvEntityId := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.InvEntityId
   FROM TEMP ,RBL_TEMPDB.TempInvestmentBasicDetail TEMP
          JOIN ( SELECT "TEMPINVESTMENTBASICDETAIL".InvID ,
                        (v_InvEntityId + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                          FROM DUAL  )  )) InvEntityId  
                 FROM RBL_TEMPDB.TempInvestmentBasicDetail 
                  WHERE  "TEMPINVESTMENTBASICDETAIL".InvEntityId = 0
                           OR "TEMPINVESTMENTBASICDETAIL".InvEntityId IS NULL ) ACCT   ON TEMP.InvID = ACCT.InvID ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.InvEntityId = src.InvEntityId;
   --------------------------------------------------
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.IssuerEntityId
   FROM A ,RBL_TEMPDB.TempInvestmentBasicDetail A
          JOIN RBL_TEMPDB.TempInvestmentIssuerDetail B   ON A.IssuerId = B.IssuerId ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IssuerEntityId = src.IssuerEntityId;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."INVESTMENTBASICDETAIL_TEMP_15122023" TO "ADF_CDR_RBL_STGDB";
