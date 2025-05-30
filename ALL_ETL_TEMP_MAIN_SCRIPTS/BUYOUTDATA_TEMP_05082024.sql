--------------------------------------------------------
--  DDL for Procedure BUYOUTDATA_TEMP_05082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" 
-- =============================================
 -- Author:		MANDEEP SINGH
 -- Create date: 26-08-2022
 -- Description:	<Description,,>
 -- =============================================

AS
   v_vEffectivefrom NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_DATE VARCHAR2(200) := ( SELECT Date_ 
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   ---------------------------------------------------------------------------------------------------------------------------------------------
   v_DATE1 VARCHAR2(200) := ( SELECT UTILS.CONVERT_TO_VARCHAR2(Date_,200) 
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_temp NUMBER(1, 0) := 0;
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
   BEGIN
      SELECT 1 INTO v_temp
        FROM DUAL
       WHERE v_DATE1 = ( SELECT DISTINCT UTILS.CONVERT_TO_VARCHAR2(CreatedDate,200) 
                         FROM RBL_STGDB.BUYOUTDATA_STG_Hist 
                          WHERE  UTILS.CONVERT_TO_VARCHAR2(CreatedDate,200) = v_DATE1 );
   EXCEPTION
      WHEN OTHERS THEN
         NULL;
   END;

   IF v_temp = 1 THEN

   BEGIN
      DBMS_OUTPUT.PUT_LINE('1');
      EXECUTE IMMEDIATE ' TRUNCATE TABLE RBL_STGDB.BUYOUTDATA_STG ';
      INSERT INTO RBL_STGDB.BUYOUTDATA_STG
        ( Vendor_Account_No, Vendor_Account_NPA_Date, Vendor_Account_DPD, Account_Report_Date )
        ( SELECT Vendor_Account_No ,
                 Vendor_Account_NPA_Date ,
                 Vendor_Account_DPD ,
                 Account_Report_Date 
          FROM RBL_STGDB.BUYOUTDATA_STG_Hist 
           WHERE  UTILS.CONVERT_TO_VARCHAR2(CreatedDate,200) = v_DATE1 );

   END;
   ELSE

   BEGIN
      DBMS_OUTPUT.PUT_LINE('2');
      EXECUTE IMMEDIATE ' TRUNCATE TABLE RBL_STGDB.BUYOUTDATA_STG ';
      INSERT INTO RBL_STGDB.BUYOUTDATA_STG
        ( Vendor_Account_No, Vendor_Account_NPA_Date, Vendor_Account_DPD, Account_Report_Date )
        ( SELECT Vendor_Account_No ,
                 Vendor_Account_NPA_Date ,
                 Vendor_Account_DPD ,
                 Account_Report_Date 
          FROM RBL_STGDB.BUYOUTDATA_STG_Hist 
           WHERE  UTILS.CONVERT_TO_VARCHAR2(CreatedDate,200) = utils.dateadd('DAY', -1, v_DATE1) );

   END;
   END IF;
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TempBuyoutData ';
   INSERT INTO TempBuyoutData
     ( DateofData, ReportDate, AccountEntityId, SchemeCode, NPA_ClassSeller, NPA_DateSeller, DPD_Seller, PeakDPD, PeakDPD_Date, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, NPA_DueToMainAdv, NPA_EffectedToMainAdv, IsChanged, NPA_Flag, RBL_Account_No, Seller_Account_No )
     ( 
       -------------    FINACLE  ---------
       SELECT A.Account_Report_Date DateofData  ,
              A.Account_Report_Date ReportDate  ,
              0 AccountEntityId  ,
              NULL SchemeCode  ,
              NULL NPA_ClassSeller  ,
              Vendor_Account_NPA_Date NPA_DateSeller  ,
              Vendor_Account_DPD DPD_Seller  ,
              NULL PeakDPD  ,
              NULL PeakDPD_Date  ,
              NULL AuthorisationStatus  ,
              v_vEffectivefrom EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              NULL NPA_DueToMainAdv  ,
              NULL NPA_EffectedToMainAdv  ,
              NULL IsChanged  ,
              NULL NPA_Flag  ,
              NULL RBL_Account_No  ,
              A.Vendor_Account_No Seller_Account_No  

       --   'SSISUSER' CreatedBy

       --,GETDATE() DateCreated

       --,NULL ModifiedBy

       --,NULL DateModified

       --,NULL ApprovedBy

       --,NULL DateApproved

       --,NULL D2Ktimestamp

       --,NULL MocStatus

       --,NULL MocDate

       --,NULL MocTypeAlt_Key
       FROM RBL_STGDB.BUYOUTDATA_STG A );
   /*********************************************************************************************************/
   /*  Existing RBL_Account_No  Update  */
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, MAIN.AccountNoinRBLHostSystem, ADVAC.AccountEntityId, MAIN.SchemeCode
   FROM TEMP ,RBL_TEMPDB.TempBuyoutData TEMP
          JOIN RBL_MISDB.BuyoutMapperUpload MAIN   ON TEMP.Seller_Account_No = MAIN.AccountNoofSeller
          AND MAIN.EffectiveFromTimeKey <= v_TimeKey
          AND MAIN.EffectiveToTimeKey >= v_TimeKey
          JOIN CurDat_RBL_MISDB.AdvAcBasicDetail ADVAC   ON ADVAC.CustomerACID = MAIN.AccountNoinRBLHostSystem
          AND ADVAC.EffectiveFromTimeKey <= v_TimeKey
          AND ADVAC.EffectiveToTimeKey >= v_TimeKey ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.RBL_Account_No = src.AccountNoinRBLHostSystem,
                                TEMP.AccountEntityId = src.AccountEntityId,
                                TEMP.SchemeCode = src.SchemeCode;
   --select * into #BUYOUTDATA_STG from BUYOUTDATA_STG where 1=2
   --------------------------------------------------------------------------------------------------------------------------------------------------- 
   EXECUTE IMMEDIATE ' TRUNCATE TABLE RBL_STGDB.BUYOUTDATA_STG ';---GO
   /*********************************************************************************************************/
   /*  Existing Customers Account Entity ID Update  */
   --UPDATE TEMP 
   --SET TEMP.AccountEntityId=MAIN.AccountEntityId
   --FROM  RBL_TEMPDB.DBO.[TempBuyoutData] TEMP
   --INNER JOIN UATRestore_RBL_MISDB.[PRO].[BuyoutUploadDetailsCal] MAIN ON TEMP.[RBL_Account_No]=MAIN.CustomerAcId
   --WHERE MAIN.EffectiveToTimeKey=49999
   --GO
   /*********************************************************************************************************/
   /*  New Customers Account Entity ID Update  */
   --DECLARE @AccountEntityId INT=0 
   --SELECT @AccountEntityId=MAX(AccountEntityId) FROM  [PRO].[BuyoutUploadDetails]
   --IF @AccountEntityId IS NULL  
   --BEGIN
   --SET @AccountEntityId=0
   --END
   ----;WITH CTE_ENNTID
   ----AS
   ----(
   --DROP TABLE IF EXISTS #CTE_ENNTID
   --SELECT [RBL_Account_No],(@AccountEntityId + ROW_NUMBER()OVER(ORDER BY (SELECT 1))) AccountEntityId
   --	INTO #CTE_ENNTID
   --			FROM RBL_TEMPDB.[dbo].[TempBuyoutData]
   --			WHERE AccountEntityId=0 OR AccountEntityId IS NULL
   --UPDATE TEMP 
   --SET TEMP.AccountEntityId=ACCT.AccountEntityId
   -- FROM RBL_TEMPDB.[dbo].[TEMPBuyoutUploadDetails] TEMP
   --INNER JOIN #CTE_ENNTID 
   --				--(SELECT CustomerAcId,(@AccountEntityId + ROW_NUMBER()OVER(ORDER BY (SELECT 1))) AccountEntityId
   --				--			FROM RBL_TEMPDB.DBO.[TempAdvAcBasicDetail]
   --				--			WHERE AccountEntityId=0 OR AccountEntityId IS NULL)
   --			ACCT ON TEMP.CustomerAcId=ACCT.CustomerAcId
   --DROP TABLE IF EXISTS #CTE_ENNTID

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."BUYOUTDATA_TEMP_05082024" TO "ADF_CDR_RBL_STGDB";
