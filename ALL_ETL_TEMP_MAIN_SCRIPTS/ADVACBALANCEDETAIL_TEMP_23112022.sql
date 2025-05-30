--------------------------------------------------------
--  DDL for Procedure ADVACBALANCEDETAIL_TEMP_23112022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   v_vEffectivefrom NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_DATE VARCHAR2(200) := ( SELECT Date_ 
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
-- Add the parameters for the stored procedure here

BEGIN

   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   -- Insert statements for procedure here
   EXECUTE IMMEDIATE ' TRUNCATE TABLE TEMPADVACBALANCEDETAIL ';
   SELECT TimeKey 

     INTO v_vEffectiveFrom
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT TimeKey 

     INTO v_TimeKey
     FROM UATRestore_RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   /*TODO:SQLDEV*/ set dateformat dmy /*END:SQLDEV*/
   ----------------------------------------------------------------------------------------------------------------------------------------------------
   /* For All Accounts */
   INSERT INTO TEMPADVACBALANCEDETAIL
     ( ACCOUNTENTITYID, ASSETCLASSALT_KEY, BALANCEINCURRENCY, BALANCE, SIGNBALANCE, LASTCRDT, OVERDUE, TOTALPROV
   --,DIRECTBALANCE
    --,INDIRECTBALANCE
    --,LASTCRAMT
   , REFCUSTOMERID, REFSYSTEMACID, AUTHORISATIONSTATUS, EFFECTIVEFROMTIMEKEY, EFFECTIVETOTIMEKEY, OVERDUESINCEDT, MOCSTATUS, MOCDATE, MOCTYPEALT_KEY, OLD_OVERDUESINCEDT, OLD_OVERDUE, ORG_TOTALPROV, INTREVERSEAMT, PS_BALANCE, NPS_BALANCE, DATECREATED, MODIFIEDBY, DATEMODIFIED, APPROVEDBY, DATEAPPROVED, CREATEDBY, PS_NPS_FLAG, UPGRADEDATE, OverduePrincipal, OverduePrincipalDt, Overdueinterest, OverdueIntDt, OverOtherdue, OverdueOtherDt, UnAppliedIntAmount, PrincipalBalance )
     ( 
       -----------------------FINACLE DATA-----------------------
       SELECT ACBD.ACCOUNTENTITYID ACCOUNTENTITYID  ,
              DA.AssetClassAlt_Key ASSETCLASSALT_KEY  ,
              ACC1.BalanceInActualAcCurrency BALANCEINCURRENCY  ,
              ACC1.BalanceOutstandingINR BALANCE  ,
              ACC1.BalanceOutstandingINR SIGNBALANCE  ,
              ACC1.LastCreditDate LASTCRDT  ,
              NVL(PrincipalOverdueAmt, 0) + NVL(InterestOverdueAmt, 0) + NVL(OthChargesOverdueAmt, 0) OVERDUE ,--TDUE

              NULL TOTALPROV  ,
              --,NULL AS DIRECTBALANCE
              --,NULL AS INDIRECTBALANCE
              --,NULL AS LASTCRAMT
              ACBD.REFCUSTOMERID REFCUSTOMERID  ,
              ACBD.SYSTEMACID REFSYSTEMACID  ,
              ACBD.AuthorisationStatus ,
              v_VEFFECTIVEFROM EFFECTIVEFROMTIMEKEY  ,
              49999 EFFECTIVETOTIMEKEY  ,
              GETMINIMUMDATE(PrincipalOverDueSinceDt, InterestOverDueSinceDt, OthChangesOverDueSinceDt) OVERDUESINCEDT ,--GET MINIMUM DATE FOR OVERDUE SINCE DATE

              --,CASE WHEN DAYSDELQ >0  THEN CASE WHEN DIST1ND='NULL'  OR  DIST1ND='' THEN NULL ELSE CONVERT(Date, DIST1ND, 103) END END AS  OVERDUESINCEDT -- AS PER DICUSIION ON 12/06/2019
              'N' MOCSTATUS  ,
              NULL MOCDATE  ,
              NULL MOCTYPEALT_KEY  ,
              NULL OLD_OVERDUESINCEDT  ,
              NULL OLD_OVERDUE  ,
              NULL ORG_TOTALPROV  ,
              NULL INTREVERSEAMT ,-- amar added  10062021

              0 PS_BALANCE  ,
              0 NPS_BALANCE  ,
              SYSDATE DATECREATED  ,
              NULL MODIFIEDBY  ,
              NULL DATEMODIFIED  ,
              NULL APPROVEDBY  ,
              NULL DATEAPPROVED  ,
              'SSISUSER' CREATEDBY  ,
              NULL PS_NPS_FLAG  ,
              NULL UPGRADEDATE  ,
              NVL(ACC1.PrincipalOverdueAmt, 0) OverduePrincipal ,--overdue principal 

              PrincipalOverDueSinceDt OverduePrincipaldate ,--overdue principal date

              NVL(ACC1.InterestOverdueAmt, 0) Overdueintereset ,--overdue intereset  

              ACC1.InterestOverDueSinceDt Overdueinteresetdate ,--overdue intereset  

              --  select *
              acc1.OthChargesOverdueAmt ,
              acc1.OthChangesOverDueSinceDt ,
              acc1.UnAppliedInterestAmt ,
              acc1.PrincipalOS 
       FROM RBL_STGDB.ACCOUNT_ALL_SOURCE_SYSTEM ACC1
              JOIN RBL_TEMPDB.TempAdvAcBasicDetail ACBD   ON ACC1.CustomerAcID = ACBD.CustomerACID
              LEFT JOIN UATRestore_RBL_MISDB.DimAssetClassMapping DA   ON ACC1.AssetClassCode = DA.SrcSysClassCode
              AND DA.EffectiveFromTimeKey <= v_TimeKey
              AND DA.EffectiveToTimeKey >= v_TimeKey
              AND DA.SourceAlt_Key = ( SELECT SourceAlt_Key 
                                       FROM UATRestore_RBL_MISDB.DIMSOURCEDB 
                                        WHERE  SourceSystem = ACC1.SourceSystem
                                                 AND EffectiveToTimeKey = 49999 
                                         FETCH FIRST 1 ROWS ONLY ) );/*


   UNION
   ----------------------INDUS DATA-----------------------
   SELECT 

   		ACBD.ACCOUNTENTITYID AS  ACCOUNTENTITYID
   		,DA.AssetClassAlt_Key AS ASSETCLASSALT_KEY
   		,ACC2.BalanceInActualAcCurrency AS BALANCEINCURRENCY
   		,ACC2.BalanceOutstandingINR AS BALANCE
   		,ACC2.BalanceOutstandingINR AS SIGNBALANCE
   		,ACC2.LastCreditDate AS LASTCRDT
   		,NULL AS OVERDUE  --TDUE
   		,NULL AS TOTALPROV
   		--,NULL AS DIRECTBALANCE
   		--,NULL AS INDIRECTBALANCE
   		--,NULL AS LASTCRAMT
   		,ACBD.REFCUSTOMERID [REFCUSTOMERID]
   		,ACBD.SYSTEMACID [REFSYSTEMACID]
   		,ACBD.AuthorisationStatus
   		,@VEFFECTIVEFROM [EFFECTIVEFROMTIMEKEY]
   		,49999 [EFFECTIVETOTIMEKEY]
   		,NULL AS OVERDUESINCEDT  --DAYSDELQ DAYS CALUCLATE DATE
   		--,CASE WHEN DAYSDELQ >0  THEN CASE WHEN DIST1ND='NULL'  OR  DIST1ND='' THEN NULL ELSE CONVERT(Date, DIST1ND, 103) END END AS  OVERDUESINCEDT -- AS PER DICUSIION ON 12/06/2019
   		,'N' AS MOCSTATUS
   		,NULL AS MOCDATE
   		,NULL AS MOCTYPEALT_KEY
   		,NULL AS OLD_OVERDUESINCEDT
   		,NULL AS OLD_OVERDUE
   		,NULL AS ORG_TOTALPROV
   		,NULL AS INTREVERSEAMT
   		,0 AS PS_BALANCE
   		,0 AS NPS_BALANCE
   		,GETDATE() AS DATECREATED
   		,NULL AS MODIFIEDBY
   		,NULL AS DATEMODIFIED
   		,NULL AS APPROVEDBY
   		,NULL AS DATEAPPROVED
   		,'SSISUSER' AS CREATEDBY
   		,NULL AS PS_NPS_FLAG
   		,NULL AS UPGRADEDATE
   		,ISNULL(ACC2.PrincipalOverdueAmt,0)  AS OverduePrincipal  --overdue principal 
   	--,ISNULL(ACC2.InterestOverdueAmt,0) AS Overdueintereset  --overdue intereset  
   	FROM RBL_STGDB.DBO.ACCOUNT_SOURCESYSTEM02_STG ACC2
   		INNER JOIN RBL_TEMPDB.DBO.TempAdvAcBasicDetail ACBD ON  ACC2.CustomerAcID=ACBD.CustomerACID
   		LEFT JOIN UATRestore_RBL_MISDB.DBO.DimAssetClassMapping DA ON ACC2.AssetClassCode=DA.SrcSysClassCode
   		AND DA.EffectiveFromTimeKey<=@TimeKey AND DA.EffectiveToTimeKey>=@TimeKey

   UNION
   ---------------------- ECBF DATA-----------------------
   SELECT 

   		ACBD.ACCOUNTENTITYID AS  ACCOUNTENTITYID
   		,DA.AssetClassAlt_Key AS ASSETCLASSALT_KEY
   		,ACC3.BalanceInActualAcCurrency AS BALANCEINCURRENCY
   		,ACC3.BalanceOutstandingINR AS BALANCE
   		,ACC3.BalanceOutstandingINR AS SIGNBALANCE
   		,ACC3.LastCreditDate AS LASTCRDT
   		,NULL AS OVERDUE  --TDUE
   		,NULL AS TOTALPROV
   		--,NULL AS DIRECTBALANCE
   		--,NULL AS INDIRECTBALANCE
   		--,NULL AS LASTCRAMT
   		,ACBD.REFCUSTOMERID [REFCUSTOMERID]
   		,ACBD.SYSTEMACID [REFSYSTEMACID]
   		,ACBD.AuthorisationStatus
   		,@VEFFECTIVEFROM [EFFECTIVEFROMTIMEKEY]
   		,49999 [EFFECTIVETOTIMEKEY]
   		,NULL AS OVERDUESINCEDT  --DAYSDELQ DAYS CALUCLATE DATE
   		--,CASE WHEN DAYSDELQ >0  THEN CASE WHEN DIST1ND='NULL'  OR  DIST1ND='' THEN NULL ELSE CONVERT(Date, DIST1ND, 103) END END AS  OVERDUESINCEDT -- AS PER DICUSIION ON 12/06/2019
   		,'N' AS MOCSTATUS
   		,NULL AS MOCDATE
   		,NULL AS MOCTYPEALT_KEY
   		,NULL AS OLD_OVERDUESINCEDT
   		,NULL AS OLD_OVERDUE
   		,NULL AS ORG_TOTALPROV
   		,NULL AS INTREVERSEAMT
   		,0 AS PS_BALANCE
   		,0 AS NPS_BALANCE
   		,GETDATE() AS DATECREATED
   		,NULL AS MODIFIEDBY
   		,NULL AS DATEMODIFIED
   		,NULL AS APPROVEDBY
   		,NULL AS DATEAPPROVED
   		,'SSISUSER' AS CREATEDBY
   		,NULL AS PS_NPS_FLAG
   		,NULL AS UPGRADEDATE
   		,ISNULL(ACC3.PrincipalOverdueAmt,0)  AS OverduePrincipal  --overdue principal 
   		--,ISNULL(ACC3.InterestOverdueAmt,0) AS Overdueintereset  --overdue intereset  
   		FROM RBL_STGDB.DBO.ACCOUNT_SOURCESYSTEM03_STG ACC3
   		INNER JOIN RBL_TEMPDB.DBO.TempAdvAcBasicDetail ACBD ON  ACC3.CustomerAcID=ACBD.CustomerACID
   		LEFT JOIN UATRestore_RBL_MISDB.DBO.DimAssetClassMapping DA ON ACC3.AssetClassCode=DA.SrcSysClassCode
   		AND DA.EffectiveFromTimeKey<=@TimeKey AND DA.EffectiveToTimeKey>=@TimeKey

   UNION 

   -----------------------MIFIN DATA-----------------------
   		SELECT 

   		ACBD.ACCOUNTENTITYID AS  ACCOUNTENTITYID
   		,DA.AssetClassAlt_Key AS ASSETCLASSALT_KEY
   		,ACC4.BalanceInActualAcCurrency AS BALANCEINCURRENCY
   		,ACC4.BalanceOutstandingINR AS BALANCE
   		,ACC4.BalanceOutstandingINR AS SIGNBALANCE
   		,ACC4.LastCreditDate AS LASTCRDT
   		,NULL AS OVERDUE  --TDUE
   		,NULL AS TOTALPROV
   		--,NULL AS DIRECTBALANCE
   		--,NULL AS INDIRECTBALANCE
   		--,NULL AS LASTCRAMT
   		,ACBD.REFCUSTOMERID [REFCUSTOMERID]
   		,ACBD.SYSTEMACID [REFSYSTEMACID]
   		,ACBD.AuthorisationStatus
   		,@VEFFECTIVEFROM [EFFECTIVEFROMTIMEKEY]
   		,49999 [EFFECTIVETOTIMEKEY]
   		,NULL AS OVERDUESINCEDT  --DAYSDELQ DAYS CALUCLATE DATE
   		--,CASE WHEN DAYSDELQ >0  THEN CASE WHEN DIST1ND='NULL'  OR  DIST1ND='' THEN NULL ELSE CONVERT(Date, DIST1ND, 103) END END AS  OVERDUESINCEDT -- AS PER DICUSIION ON 12/06/2019
   		,'N' AS MOCSTATUS
   		,NULL AS MOCDATE
   		,NULL AS MOCTYPEALT_KEY
   		,NULL AS OLD_OVERDUESINCEDT
   		,NULL AS OLD_OVERDUE
   		,NULL AS ORG_TOTALPROV
   		,NULL AS INTREVERSEAMT
   		,0 AS PS_BALANCE
   		,0 AS NPS_BALANCE
   		,GETDATE() AS DATECREATED
   		,NULL AS MODIFIEDBY
   		,NULL AS DATEMODIFIED
   		,NULL AS APPROVEDBY
   		,NULL AS DATEAPPROVED
   		,'SSISUSER' AS CREATEDBY
   		,NULL AS PS_NPS_FLAG
   		,NULL AS UPGRADEDATE
   		,ISNULL(ACC4.PrincipalOverdueAmt,0)  AS OverduePrincipal  --overdue principal 
   		--,ISNULL(ACC4.InterestOverdueAmt,0) AS Overdueintereset  --overdue intereset  
   		FROM RBL_STGDB.DBO.ACCOUNT_SOURCESYSTEM04_STG ACC4
   		INNER JOIN RBL_TEMPDB.DBO.TempAdvAcBasicDetail ACBD ON  ACC4.CustomerAcID=ACBD.CustomerACID
   		LEFT JOIN UATRestore_RBL_MISDB.DBO.DimAssetClassMapping DA ON ACC4.AssetClassCode=DA.SrcSysClassCode
   		AND DA.EffectiveFromTimeKey<=@TimeKey AND DA.EffectiveToTimeKey>=@TimeKey
   UNION
   ----------------------GANASEVA DATA-----------------------
   SELECT 

   		ACBD.ACCOUNTENTITYID AS  ACCOUNTENTITYID
   		,DA.AssetClassAlt_Key AS ASSETCLASSALT_KEY
   		,ACC5.BalanceInActualAcCurrency AS BALANCEINCURRENCY
   		,ACC5.BalanceOutstandingINR AS BALANCE
   		,ACC5.BalanceOutstandingINR AS SIGNBALANCE
   		,ACC5.LastCreditDate AS LASTCRDT
   		,NULL AS OVERDUE  --TDUE
   		,NULL AS TOTALPROV
   		--,NULL AS DIRECTBALANCE
   		--,NULL AS INDIRECTBALANCE
   		--,NULL AS LASTCRAMT
   		,ACBD.REFCUSTOMERID [REFCUSTOMERID]
   		,ACBD.SYSTEMACID [REFSYSTEMACID]
   		,ACBD.AuthorisationStatus
   		,@VEFFECTIVEFROM [EFFECTIVEFROMTIMEKEY]
   		,49999 [EFFECTIVETOTIMEKEY]
   		,NULL AS OVERDUESINCEDT  --DAYSDELQ DAYS CALUCLATE DATE
   		--,CASE WHEN DAYSDELQ >0  THEN CASE WHEN DIST1ND='NULL'  OR  DIST1ND='' THEN NULL ELSE CONVERT(Date, DIST1ND, 103) END END AS  OVERDUESINCEDT -- AS PER DICUSIION ON 12/06/2019
   		,'N' AS MOCSTATUS
   		,NULL AS MOCDATE
   		,NULL AS MOCTYPEALT_KEY
   		,NULL AS OLD_OVERDUESINCEDT
   		,NULL AS OLD_OVERDUE
   		,NULL AS ORG_TOTALPROV
   		,NULL AS INTREVERSEAMT
   		,0 AS PS_BALANCE
   		,0 AS NPS_BALANCE
   		,GETDATE() AS DATECREATED
   		,NULL AS MODIFIEDBY
   		,NULL AS DATEMODIFIED
   		,NULL AS APPROVEDBY
   		,NULL AS DATEAPPROVED
   		,'SSISUSER' AS CREATEDBY
   		,NULL AS PS_NPS_FLAG
   		,NULL AS UPGRADEDATE
   		,ISNULL(ACC5.PrincipalOverdueAmt,0)  AS OverduePrincipal  --overdue principal 
   		--,ISNULL(ACC5.InterestOverdueAmt,0) AS Overdueintereset  --overdue intereset  
   		FROM RBL_STGDB.DBO.ACCOUNT_SOURCESYSTEM05_STG ACC5
   		INNER JOIN RBL_TEMPDB.DBO.TempAdvAcBasicDetail ACBD ON  ACC5.CustomerAcID=ACBD.CustomerACID
   		LEFT JOIN UATRestore_RBL_MISDB.DBO.DimAssetClassMapping DA ON ACC5.AssetClassCode=DA.SrcSysClassCode
   		AND DA.EffectiveFromTimeKey<=@TimeKey AND DA.EffectiveToTimeKey>=@TimeKey

   UNION
   ---------------------- VISION PLUS DATA-----------------------
   SELECT 

   		ACBD.ACCOUNTENTITYID AS  ACCOUNTENTITYID
   		,DA.AssetClassAlt_Key AS ASSETCLASSALT_KEY
   		,ACC6.BalanceInActualAcCurrency AS BALANCEINCURRENCY
   		,ACC6.BalanceOutstandingINR AS BALANCE
   		,ACC6.BalanceOutstandingINR AS SIGNBALANCE
   		,ACC6.LastCreditDate AS LASTCRDT
   		,NULL AS OVERDUE  --TDUE
   		,NULL AS TOTALPROV
   		--,NULL AS DIRECTBALANCE
   		--,NULL AS INDIRECTBALANCE
   		--,NULL AS LASTCRAMT
   		,ACBD.REFCUSTOMERID [REFCUSTOMERID]
   		,ACBD.SYSTEMACID [REFSYSTEMACID]
   		,ACBD.AuthorisationStatus
   		,@VEFFECTIVEFROM [EFFECTIVEFROMTIMEKEY]
   		,49999 [EFFECTIVETOTIMEKEY]
   		,NULL AS OVERDUESINCEDT  --DAYSDELQ DAYS CALUCLATE DATE
   		--,CASE WHEN DAYSDELQ >0  THEN CASE WHEN DIST1ND='NULL'  OR  DIST1ND='' THEN NULL ELSE CONVERT(Date, DIST1ND, 103) END END AS  OVERDUESINCEDT -- AS PER DICUSIION ON 12/06/2019
   		,'N' AS MOCSTATUS
   		,NULL AS MOCDATE
   		,NULL AS MOCTYPEALT_KEY
   		,NULL AS OLD_OVERDUESINCEDT
   		,NULL AS OLD_OVERDUE
   		,NULL AS ORG_TOTALPROV
   		,NULL AS INTREVERSEAMT
   		,0 AS PS_BALANCE
   		,0 AS NPS_BALANCE
   		,GETDATE() AS DATECREATED
   		,NULL AS MODIFIEDBY
   		,NULL AS DATEMODIFIED
   		,NULL AS APPROVEDBY
   		,NULL AS DATEAPPROVED
   		,'SSISUSER' AS CREATEDBY
   		,NULL AS PS_NPS_FLAG
   		,NULL AS UPGRADEDATE
   		,ISNULL(ACC6.PrincipalOverdueAmt,0)  AS OverduePrincipal  --overdue principal 
   		--,ISNULL(ACC6.InterestOverdueAmt,0) AS Overdueintereset  --overdue intereset  
   		FROM RBL_STGDB.DBO.ACCOUNT_SOURCESYSTEM06_STG ACC6
   		INNER JOIN RBL_TEMPDB.DBO.TempAdvAcBasicDetail ACBD ON  ACC6.CustomerAcID=ACBD.CustomerACID
   		LEFT JOIN UATRestore_RBL_MISDB.DBO.DimAssetClassMapping DA ON ACC6.AssetClassCode=DA.SrcSysClassCode
   		AND DA.EffectiveFromTimeKey<=@TimeKey AND DA.EffectiveToTimeKey>=@TimeKey

   */

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_TEMP_RBL_TEMPDB"."ADVACBALANCEDETAIL_TEMP_23112022" TO "ADF_CDR_RBL_STGDB";
