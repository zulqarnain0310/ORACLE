--------------------------------------------------------
--  DDL for Procedure INVESTMENTDATAPROCESSING_18032023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" 
----/*=========================================
 ---- AUTHER : TRILOKI KHANNA
 ---- CREATE DATE : 27-11-2019
 ---- MODIFY DATE : 27-11-2019
 ---- DESCRIPTION : UPDATE InvestmentDataProcessing
 ---- --EXEC [PRO].[InvestmentDataProcessing] @TIMEKEY=26196
 --[PRO].[InvestmentDataProcessing] 26637
 ----=============================================*/

(
  v_TIMEKEY IN NUMBER
)
AS
/*=========================================
-- AUTHOR : TRILOKI KHANNA
-- CREATE DATE : 09-04-2021
-- MODIFY DATE : 09-04-2021
-- DESCRIPTION : Test Case Cover in This SP

--=============================================*/

 --=26267
BEGIN

   BEGIN
      DECLARE
         v_PROCESSDATE VARCHAR2(200) := ( SELECT DATE_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );
         v_SUB_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'SUB_Days'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_DB1_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'DB1_Days'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_DB2_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'DB2_Days'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_MoveToDB1 NUMBER(5,2) := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue / 100.00,5,2) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'MoveToDB1'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_MoveToLoss NUMBER(5,2) := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue / 100.00,5,2) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'MoveToLoss'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_SubStandard NUMBER(10,0) := ( SELECT PROVISIONALT_KEY 
           FROM DIMPROVISION_SEG 
          WHERE  segment = 'IRAC'
                   AND PROVISIONNAME = 'Sub Standard'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_DoubtfulI NUMBER(10,0) := ( SELECT PROVISIONALT_KEY 
           FROM DIMPROVISION_SEG 
          WHERE  segment = 'IRAC'
                   AND PROVISIONNAME = 'Doubtful-I'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_DoubtfulII NUMBER(10,0) := ( SELECT PROVISIONALT_KEY 
           FROM DIMPROVISION_SEG 
          WHERE  segment = 'IRAC'
                   AND PROVISIONNAME = 'Doubtful-II'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_DoubtfulIII NUMBER(10,0) := ( SELECT PROVISIONALT_KEY 
           FROM DIMPROVISION_SEG 
          WHERE  segment = 'IRAC'
                   AND PROVISIONNAME = 'Doubtful-III'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_Loss NUMBER(10,0) := ( SELECT PROVISIONALT_KEY 
           FROM DIMPROVISION_SEG 
          WHERE  segment = 'IRAC'
                   AND PROVISIONNAME = 'Loss'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );

      BEGIN
         UPDATE InvestmentFinancialDetail
            SET DPD = 0
          WHERE  EffectiveFromTimeKey <= v_timekey
           AND EffectiveToTimeKey >= v_timekey
           AND NVL(DPD, 0) = 0;
         --/*---------------ASSIGNE DEG REASON---------------*/
         --UPDATE B SET B.DEGREASON= 'DEGRADE BY MTMValue Less Than 1 Rs.' 
         --FROM InvestmentBasicDetail A
         --inner join InvestmentIssuerDetail C ON A.IssuerEntityId=C.IssuerEntityId
         --AND C.EffectiveFromTimeKey <=@timekey AND C.EffectiveToTimeKey>=@timekey
         --inner join InvestmentFinancialDetail B on A.InvEntityId=B.InvEntityId
         --AND A.EffectiveFromTimeKey<=@timekey AND A.EffectiveToTimeKey>=@timekey
         --AND B.EffectiveFromTimeKey<=@timekey AND B.EffectiveToTimeKey>=@timekey
         --where MTMValueINR=1 and InvestmentNature='FD' AND B.AssetClass_AltKey=1
         --AND FLGDEG ='Y'
         ----alter table rbl_tempdb.dbo.TempInvestmentFinancialDetail add PartialRedumptionDPD smallint
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'NORMAL'
         FROM A ,InvestmentFinancialDetail A 
          WHERE EffectiveFromTimeKey <= v_TIMEKEY
           AND EffectiveToTimeKey >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET Asset_Norm = 'NORMAL';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0, 0, 0, 'N', 'N', NULL, NULL, 0, 0 --Added by mandeep for Balancesheet DPD

         FROM A ,CurDat_RBL_MISDB_PROD.InvestmentFinancialDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DPD_DivOverdue = 0,
                                      DPD_Maturity = 0,
                                      DPD = 0,
                                      FLGDEG = 'N',
                                      FLGUPG = 'N',
                                      DEGREASON = NULL,
                                      UPGDATE = NULL,
                                      PartialRedumptionDPD = 0,
                                      DPD_BS_Date = 0;
         /*UPDATE PREVISOU DAY STATUS AS INITIAL STATUS FOR CURRENT DAY */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.FinalAssetClassAlt_Key, B.NPIDt
         FROM A ,CurDat_RBL_MISDB_PROD.InvestmentFinancialDetail A
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey - 1
                AND B.EffectiveToTimeKey >= v_timekey - 1 ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET InitialAssetAlt_Key = src.FinalAssetClassAlt_Key,
                                      InitialNPIDt = src.NPIDt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_STD'
         FROM A ,InvestmentFinancialDetail A
                JOIN InvestmentBasicDetail Bb   ON A.InvEntityId = bb.InvEntityId
                AND bb.EffectiveFromTimeKey <= v_TIMEKEY
                AND bb.EffectiveToTimeKey >= v_TIMEKEY
                JOIN InvestmentIssuerDetail Cc   ON Cc.IssuerEntityId = bb.IssuerEntityId
                AND Cc.EffectiveFromTimeKey <= v_TIMEKEY
                AND Cc.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND NVL(UcifId, ' ') IN ( 'RBL008827709','RBL003034380','RBL002980785' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET Cc.Asset_Norm = 'ALWYS_STD';
         /*  mannual npa as per RBL team Mr. Divakar  email dated  17-09-2021 time 14:12 for marked Manual NPA forcefully */
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, (CASE 
         WHEN B.Interest_DividendDueDate IS NOT NULL THEN utils.datediff('DAY', B.Interest_DividendDueDate, v_PROCESSDATE) + 1
         ELSE 0
            END) AS DPD_DivOverdue
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey
                JOIN DIMINSTRUMENTTYPE INS   ON INS.EffectiveFromTimeKey <= v_timekey
                AND INS.EffectiveToTimeKey >= v_timekey
                AND INS.InstrumentTypeAlt_Key = A.InstrTypeAlt_Key 
          WHERE B.Interest_DividendDueDate IS NOT NULL
           AND NVL(INS.InstrumentTypeSubGroup, ' ') IN ( 'BONDS','Preference Shares','CP','CD','PTC' )
         ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DPD_DivOverdue = src.DPD_DivOverdue;
         --Added by mandeep to count balancesheet DPD
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, (CASE 
         WHEN B.BalanceSheetDate IS NOT NULL THEN utils.datediff('DAY', B.BalanceSheetDate, v_PROCESSDATE)
         ELSE 0
            END) AS DPD_BS_Date
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey
                JOIN DIMINSTRUMENTTYPE INS   ON INS.EffectiveFromTimeKey <= v_timekey
                AND INS.EffectiveToTimeKey >= v_timekey
                AND INS.InstrumentTypeAlt_Key = A.InstrTypeAlt_Key 
          WHERE B.DPD_BS_Date IS NOT NULL
           AND ListedShares = 'Unlisted'

           --and DAY(B.BalanceSheetDate)=31

           --AND MONTH(B.BalanceSheetDate)=03
           AND NVL(INS.InstrumentTypeSubGroup, ' ') IN ( 'Equity' )
         ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DPD_BS_Date = src.DPD_BS_Date;
         --UPDATE B SET DPD_Maturity=(CASE WHEN  a.MaturityDt IS NOT NULL   
         --      THEN   DATEDIFF(DAY,a.MaturityDt,@PROCESSDATE)       ELSE 0 END)
         --FROM InvestmentBasicDetail A
         --inner join InvestmentIssuerDetail C ON A.IssuerEntityId=C.IssuerEntityId
         --AND C.EffectiveFromTimeKey <=@timekey AND C.EffectiveToTimeKey>=@timekey
         --inner join InvestmentFinancialDetail B on A.InvEntityId=B.InvEntityId
         --AND A.EffectiveFromTimeKey<=@timekey AND A.EffectiveToTimeKey>=@timekey
         --AND B.EffectiveFromTimeKey<=@timekey AND B.EffectiveToTimeKey>=@timekey
         --INNER JOIN DIMINSTRUMENTTYPE INS 
         --ON INS.EffectiveFromTimeKey<=@timekey AND INS.EffectiveToTimeKey>=@timekey
         --AND INS.InstrumentTypeAlt_Key=A.InstrTypeAlt_Key
         --WHERE a.MaturityDt IS NOT  NULL AND ISNULL(B.FinalAssetClassAlt_Key,1)=1
         ----------AND INSTRUMENTTYPEALT_KEY IN(1,3,4) 
         --AND ISNULL(BookValue,0) > 0 AND ISNULL(Interest_DividendDueAmount,0) > 0--1 -> eQUITY, 2->PREFERENTIAL SHAHRES, 3-> BONDS
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, (CASE 
         WHEN b.PartialRedumptionDueDate IS NOT NULL THEN utils.datediff('DAY', B.PartialRedumptionDueDate, v_PROCESSDATE) + 1
         ELSE 0
            END) AS PartialRedumptionDPD
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey
                JOIN DIMINSTRUMENTTYPE INS   ON INS.EffectiveFromTimeKey <= v_timekey
                AND INS.EffectiveToTimeKey >= v_timekey
                AND INS.InstrumentTypeAlt_Key = A.InstrTypeAlt_Key 
          WHERE b.PartialRedumptionDueDate IS NOT NULL
           AND PartialRedumptionSettledY_N = 'N'

           --AND ISNULL(B.FinalAssetClassAlt_Key,1)=1
           AND NVL(INS.InstrumentTypeSubGroup, ' ') IN ( 'BONDS','Preference Shares','CP','CD','PTC' )
         ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET PartialRedumptionDPD = src.PartialRedumptionDPD;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CASE 
         WHEN NVL(DPD_DivOverdue, 0) >= NVL(DPD_Maturity, 0)
           AND NVL(DPD_DivOverdue, 0) >= NVL(PartialRedumptionDPD, 0)
           AND NVL(DPD_DivOverdue, 0) >= NVL(DPD_BS_Date, 0) THEN NVL(DPD_DivOverdue, 0)
         WHEN NVL(DPD_Maturity, 0) >= NVL(DPD_DivOverdue, 0)
           AND NVL(DPD_Maturity, 0) >= NVL(PartialRedumptionDPD, 0)
           AND NVL(DPD_Maturity, 0) >= NVL(DPD_BS_Date, 0) THEN NVL(DPD_Maturity, 0)
         WHEN NVL(DPD_BS_Date, 0) >= NVL(DPD_DivOverdue, 0)
           AND NVL(DPD_BS_Date, 0) >= NVL(PartialRedumptionDPD, 0)
           AND NVL(DPD_BS_Date, 0) >= NVL(DPD_Maturity, 0) THEN NVL(DPD_BS_Date, 0)
         ELSE NVL(PartialRedumptionDPD, 0)
            END AS DPD
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey
                JOIN DIMINSTRUMENTTYPE INS   ON INS.EffectiveFromTimeKey <= v_timekey
                AND INS.EffectiveToTimeKey >= v_timekey
                AND INS.InstrumentTypeAlt_Key = A.InstrTypeAlt_Key ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DPD = src.DPD;
         --WHERE  isnull(B.FinalAssetClassAlt_Key,1)=1 AND (ISNULL(DPD_DivOverdue,0)>0 OR ISNULL(DPD_Maturity,0)>0)
         --AND INSTRUMENTTYPEALT_KEY IN(1,3,4) --1 -> eQUITY, 2->PREFERENTIAL SHAHRES, 3-> BONDS
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CASE 
         WHEN NVL(DPD, 0) < 0 THEN 0
         ELSE NVL(DPD, 0)
            END AS pos_2, CASE 
         WHEN NVL(DPD_MATURITY, 0) < 0 THEN 0
         ELSE NVL(DPD_MATURITY, 0)
            END AS pos_3, CASE 
         WHEN NVL(DPD_DivOverdue, 0) < 0 THEN 0
         ELSE NVL(DPD_DivOverdue, 0)
            END AS pos_4, CASE 
         WHEN NVL(PartialRedumptionDPD, 0) < 0 THEN 0
         ELSE NVL(PartialRedumptionDPD, 0)
            END AS pos_5, CASE 
         WHEN NVL(DPD_BS_Date, 0) < 0 THEN 0
         ELSE NVL(DPD_BS_Date, 0)
            END AS pos_6
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE NVL(DPD, 0) < 0
           OR NVL(DPD_MATURITY, 0) < 0
           OR NVL(DPD_DivOverdue, 0) < 0
           OR B.DPD_BS_Date < 0) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DPD = pos_2,
                                      B.DPD_MATURITY = pos_3,
                                      B.DPD_DivOverdue = pos_4,
                                      B.PartialRedumptionDPD --added by mandeep
                                       = pos_5,
                                      B.DPD_BS_Date --added by mandeep
                                       = pos_6;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey
              --DPD>=90 commented and new added

          WHERE ( DPD_DivOverdue >= 91
           OR PartialRedumptionDPD >= 91
           OR DPD_BS_Date >= 541 )
           AND Asset_Norm = 'NORMAL'
           AND FinalAssetClassAlt_Key = 1) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FLGDEG = 'Y';
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'DEGRADE BY Interest_DividendDueDate' AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE B.Interest_DividendDueDate IS NOT NULL
           AND NVL(B.FinalAssetClassAlt_Key, 1) = 1
           AND DPD_DivOverdue >= 91
           AND FLGDEG = 'Y') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CONCAT(DEGREASON, CASE 
                                WHEN DPD_DivOverdue >= 91 THEN ','
         ELSE ' '
            END, 'DEGRADE BY Partial Redumption Due Date') AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE B.Interest_DividendDueDate IS NOT NULL
           AND NVL(B.FinalAssetClassAlt_Key, 1) = 1
           AND ----------ISNULL(DPD_Maturity,0)>=90 or 
          ( NVL(PartialRedumptionDPD, 0) >= 91 )
           AND FLGDEG = 'Y') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CONCAT(DEGREASON, CASE 
                                WHEN DPD_BS_Date >= 541 THEN (CASE 
                                                                   WHEN DEGREASON IS NOT NULL THEN ','
                                ELSE ' '
                                   END)
         ELSE ' '
            END, 'NPA due to overdue Balance Sheet Date') AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE B.BalanceSheetDate IS NOT NULL
           AND NVL(B.FinalAssetClassAlt_Key, 1) = 1
           AND ----------ISNULL(DPD_Maturity,0)>=90 or 
          ( NVL(DPD_BS_Date, 0) >= 541 )
           AND FLGDEG = 'Y') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         /*---------------UPDATE DEG FLAG AT ACCOUNT LEVEL---------------*/
         /*
         UPDATE B SET FLGDEG ='Y'
         		, B.DEGREASON= 'DEGRADE BY MTMValue Less Than 1 Rs.' 
         FROM InvestmentBasicDetail A
         inner join InvestmentIssuerDetail C ON A.IssuerEntityId=C.IssuerEntityId
         AND C.EffectiveFromTimeKey <=@timekey AND C.EffectiveToTimeKey>=@timekey
         inner join InvestmentFinancialDetail B on A.InvEntityId=B.InvEntityId
         AND A.EffectiveFromTimeKey<=@timekey AND A.EffectiveToTimeKey>=@timekey
         AND B.EffectiveFromTimeKey<=@timekey AND B.EffectiveToTimeKey>=@timekey
         where ISNULL(MTMValueINR,0)<1
         and InvestmentNature='EQUITY' AND ISNULL(B.FinalAssetClassAlt_Key,1)=1 

         */
         /*------------Calculate NpaDt -------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(A.FLGDEG, 'N') = 'Y'
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND A.DEGREASON = 'DEGRADE BY MTMValue Less Than 1 Rs.') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NPIDt = v_ProcessDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('DAY', NVL(91, 0), utils.dateadd('DAY', -NVL(DPD, 0), v_ProcessDate)) AS NPIDt
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(A.FLGDEG, 'N') = 'Y'
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND DEGREASON NOT LIKE '%NPA due to overdue Balance Sheet Date%') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NPIDt = src.NPIDt;
         ----AND  A.DEGREASON IS NULL
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('DAY', NVL(541, 0), utils.dateadd('DAY', -NVL(DPD_BS_Date, 0), v_ProcessDate)) AS NPIDt
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(A.FLGDEG, 'N') = 'Y'
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND DEGREASON LIKE '%Balance Sheet Date%') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NPIDt = src.NPIDt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN utils.dateadd('DAY', v_SUB_Days, A.NPIDt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                               FROM DimAssetClass 
                                                                                WHERE  DIMASSETCLASS.AssetClassShortName = 'SUB'
                                                                                         AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                         AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', v_SUB_Days, A.NPIDt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, A.NPIDt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                             FROM DimAssetClass 
                                                                                              WHERE  DIMASSETCLASS.AssetClassShortName = 'DB1'
                                                                                                       AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                       AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, A.NPIDt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days + v_DB2_Days, A.NPIDt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                          FROM DimAssetClass 
                                                                                                           WHERE  DIMASSETCLASS.AssetClassShortName = 'DB2'
                                                                                                                    AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                    AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', (v_DB1_Days + v_SUB_Days + v_DB2_Days), A.NPIDt) <= v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                            FROM DimAssetClass 
                                                                                                             WHERE  DIMASSETCLASS.AssetClassShortName = 'DB3'
                                                                                                                      AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                      AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )   END) AS FinalAssetClassAlt_Key
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(A.FlgDeg, 'N') = 'Y'
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         /*


         ----IF OBJECT_ID('TEMPDB..tt_TEMPMINASSETCLASS_14') IS NOT NULL
         ----  DROP TABLE tt_TEMPMINASSETCLASS_14

         ----	SELECT UcifId,MAX(ISNULL(FinalAssetClassAlt_Key,1)) FinalAssetClassAlt_Key
         ----	,MIN(NPIDt) NPIDt 
         ----	 INTO tt_TEMPMINASSETCLASS_14 
         ----	 FROM  InvestmentFinancialDetail A
         ----		INNER JOIN InvestmentBasicDetail B
         ----			ON A.INVENTITYID=B.INVENTITYID
         ----			AND B.EffectiveFromTimeKey<=@timekey and B.EffectiveToTimeKey>=@timekey
         ----		inner join InvestmentIssuerDetail C ON B.IssuerEntityId=C.IssuerEntityId
         ----			AND B.EffectiveFromTimeKey<=@timekey and B.EffectiveToTimeKey>=@timekey
         ----	  WHERE  ISNULL(FinalAssetClassAlt_Key,1)>1
         ----	  AND  A.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND A.EFFECTIVETOTIMEKEY>=@TIMEKEY
         ----	  GROUP BY UcifId


         ----	  ALTER TABLE  tt_TEMPMINASSETCLASS_14 ADD RefInvID VARCHAR (200)


         ----	  UPDATE A SET RefInvID=B.RefInvID
         ----	 FROM tt_TEMPMINASSETCLASS_14  A
         ----	 INNER JOIN InvestmentFinancialDetail  B ON A.RefIssuerID=B.RefIssuerID
         ----	  WHERE  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY
         ----	  AND  A.FinalAssetClassAlt_Key=B.FinalAssetClassAlt_Key AND A.NPIDt=B.NPIDt


         ----	  UPDATE D SET FinalAssetClassAlt_Key=A.FinalAssetClassAlt_Key,NPIDt=A.NPIDt,DEGREASON='PERCOLATION BY' + ' ' +A.UcifId
         ----	  FROM tt_TEMPMINASSETCLASS_14  A
         ----		inner join InvestmentIssuerDetail B ON B.UcifId=B.UcifId
         ----			AND B.EffectiveFromTimeKey<=@timekey and B.EffectiveToTimeKey>=@timekey
         ----		INNER JOIN InvestmentBasicDetail C
         ----			ON B.INVENTITYID=B.INVENTITYID
         ----			AND C.EffectiveFromTimeKey<=@timekey and C.EffectiveToTimeKey>=@timekey
         ----	  INNER JOIN InvestmentFinancialDetail  D
         ----			ON A.RefIssuerID=B.RefIssuerID
         ----	   WHERE D.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND D.EFFECTIVETOTIMEKEY>=@TIMEKEY
         ----	  AND B.AssetClass_AltKey=1
         */
         IF utils.object_id('TEMPDB..tt_TEMPMINASSETCLASS_14') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPMINASSETCLASS_14 ';
         END IF;
         DELETE FROM tt_TEMPMINASSETCLASS_14;
         UTILS.IDENTITY_RESET('tt_TEMPMINASSETCLASS_14');

         INSERT INTO tt_TEMPMINASSETCLASS_14 ( 
         	SELECT UcifId ,
                 MAX(NVL(FinalAssetClassAlt_Key, 1))  FinalAssetClassAlt_Key  ,
                 MIN(NPIDt)  NPIDt  
         	  FROM InvestmentFinancialDetail A
                   JOIN InvestmentBasicDetail B   ON A.INVENTITYID = B.INVENTITYID
                   AND B.EffectiveFromTimeKey <= v_TimeKey
                   AND B.EffectiveToTimeKey >= v_TimeKey
                   JOIN InvestmentIssuerDetail C   ON B.IssuerEntityId = C.IssuerEntityId
                   AND B.EffectiveFromTimeKey <= v_TimeKey
                   AND B.EffectiveToTimeKey >= v_TimeKey
         	 WHERE  NVL(FinalAssetClassAlt_Key, 1) > 1
                    AND A.EFFECTIVEFROMTIMEKEY <= v_TimeKey
                    AND A.EFFECTIVETOTIMEKEY >= v_TimeKey
         	  GROUP BY UcifId );
         MERGE INTO D 
         USING (SELECT D.ROWID row_id, A.FinalAssetClassAlt_Key, A.NPIDt
         --,DEGREASON= (CASE WHEN DEGREASON IS NULL THEN
          --(CASE WHEN D.DEGREASON IS NULL THEN  '' ELSE CONCAT(D.DEGREASON,' , ') END)+'PERCOLATION BY' + ' ' +A.UcifId ELSE DEGREASON END)

         FROM D ,tt_TEMPMINASSETCLASS_14 A
                JOIN InvestmentIssuerDetail B   ON A.UcifId = B.UcifId
                AND B.EffectiveFromTimeKey <= v_TimeKey
                AND B.EffectiveToTimeKey >= v_TimeKey
                JOIN InvestmentBasicDetail C   ON B.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_TimeKey
                AND C.EffectiveToTimeKey >= v_TimeKey
                JOIN InvestmentFinancialDetail D   ON C.InvEntityId = D.InvEntityId 
          WHERE D.EFFECTIVEFROMTIMEKEY <= v_TimeKey
           AND D.EFFECTIVETOTIMEKEY >= v_TimeKey
           AND D.FLGDEG = 'Y') src
         ON ( D.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      D.NPIDt = src.NPIDt;
         ----------------------------------------------------------------
         ----------------------------------------------------------------
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CONCAT((CASE 
                      WHEN B.DEGREASON IS NULL THEN ' '
         ELSE CONCAT(B.DEGREASON, ' , ')
            END), 'DEGRADE BY Interest_DividendDueDate') AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE B.Interest_DividendDueDate IS NOT NULL
           AND NVL(B.FinalAssetClassAlt_Key, 1) > 1
           AND DPD_DivOverdue > 0
           AND FLGDEG = 'N') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, (CASE 
         WHEN B.DEGREASON IS NULL THEN ' '
         ELSE CONCAT(B.DEGREASON, ' , ')
            END) || 'DEGRADE BY Partial Redumption Due Date' AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE B.PartialRedumptionDueDate IS NOT NULL
           AND NVL(B.FinalAssetClassAlt_Key, 1) > 1
           AND PartialRedumptionDPD > 0
           AND FLGDEG = 'N') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, (CASE 
         WHEN B.DEGREASON IS NULL THEN ' '
         ELSE CONCAT(B.DEGREASON, ' , ')
            END) || 'NPA due to overdue Balance Sheet Date' AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE B.BalanceSheetDate IS NOT NULL
           AND NVL(B.FinalAssetClassAlt_Key, 1) > 1
           AND NVL(DPD_BS_Date, 0) > 365
           AND FLGDEG = 'N') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY' || ' ' || UcifId AS DEGREASON
         FROM B ,InvestmentBasicDetail A
                JOIN InvestmentIssuerDetail C   ON A.IssuerEntityId = C.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_timekey
                AND C.EffectiveToTimeKey >= v_timekey
                JOIN InvestmentFinancialDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey 
          WHERE NVL(B.FinalAssetClassAlt_Key, 1) > 1
           AND DEGREASON IS NULL
           AND FLGDEG = 'N') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         ----------------------------------------------------------------
         --- SELECT * FROM tt_TEMPMINASSETCLASS_14  
         --  UPDATE D SET FinalAssetClassAlt_Key=A.FinalAssetClassAlt_Key,NPIDt=A.NPIDt,DEGREASON=CONCAT(DEGREASON,', PERCOLATION BY' + ' ' +A.UcifId)
         --FROM tt_TEMPMINASSETCLASS_14  A
         --	inner join InvestmentIssuerDetail B ON A.UcifId=B.UcifId
         --		AND B.EffectiveFromTimeKey<=@TimeKey and B.EffectiveToTimeKey>=@TimeKey
         --	INNER JOIN InvestmentBasicDetail C
         --		ON B.IssuerEntityId=C.IssuerEntityId
         --		AND C.EffectiveFromTimeKey<=@TimeKey and C.EffectiveToTimeKey>=@TimeKey
         --  INNER JOIN InvestmentFinancialDetail  D
         --		ON C.InvEntityId=D.InvEntityId
         --   WHERE D.EFFECTIVEFROMTIMEKEY<=@TimeKey AND D.EFFECTIVETOTIMEKEY>=@TimeKey
         --        --AND D.FLGDEG='Y'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN utils.dateadd('DAY', v_SUB_Days, A.NPIDt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                               FROM DimAssetClass 
                                                                                WHERE  DIMASSETCLASS.AssetClassShortName = 'SUB'
                                                                                         AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                         AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', v_SUB_Days, A.NPIDt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, A.NPIDt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                             FROM DimAssetClass 
                                                                                              WHERE  DIMASSETCLASS.AssetClassShortName = 'DB1'
                                                                                                       AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                       AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, A.NPIDt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days + v_DB2_Days, A.NPIDt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                          FROM DimAssetClass 
                                                                                                           WHERE  DIMASSETCLASS.AssetClassShortName = 'DB2'
                                                                                                                    AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                    AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', (v_DB1_Days + v_SUB_Days + v_DB2_Days), A.NPIDt) <= v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                            FROM DimAssetClass 
                                                                                                             WHERE  DIMASSETCLASS.AssetClassShortName = 'DB3'
                                                                                                                      AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                      AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         ELSE A.FinalAssetClassAlt_Key
            END) AS FinalAssetClassAlt_Key
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(A.FlgDeg, 'N') <> 'Y'
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND FinalAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key -- Changes done by Satwaji as per Calypso issue occured as on 01/01/2023
                                       = src.FinalAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(FinalAssetClassAlt_Key, 0) = 0
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FinalAssetClassAlt_Key = 1,
                                      NPIDt = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N'
         FROM A ,InvestmentFinancialDetail A 
          WHERE NVL(FinalAssetClassAlt_Key, 0) > 1
           AND NVL(InitialAssetAlt_Key, 0) > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FlgDeg = 'N';
         /*
         ------------------------UPGRAD CUSTOMER ACCOUNT--------------------

         UPDATE A SET FLGUPG='N'
         FROM InvestmentFinancialDetail A
         WHERE    A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey 


         IF OBJECT_ID('TEMPDB..#TEMPTABLE') IS NOT NULL
               DROP TABLE #TEMPTABLE

         SELECT A.RefIssuerID,TOTALCOUNT  INTO #TEMPTABLE FROM 
         (
         SELECT A.RefIssuerID,COUNT(1) TOTALCOUNT FROM 
         InvestmentFinancialDetail A
         WHERE A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey
         GROUP BY A.RefIssuerID
         )
         A INNER JOIN 
         (
         SELECT B.RefIssuerID,COUNT(1) TOTALDPD_MAXCOUNT 
         FROM InvestmentFinancialDetail B
         WHERE (ISNULL(B.DPD,0)<=0 AND [DPD_BS_Date]<=365 )
            and ISNULL(FinalAssetClassAlt_Key,1) not in(1)
           AND B.EffectiveFromTimeKey<=@TimeKey and B.EffectiveToTimeKey>=@TimeKey
          GROUP BY B.RefIssuerID
         --
         SELECT B.RefIssuerID,COUNT(1) TOTALDPD_MAXCOUNT 
         FROM InvestmentFinancialDetail B
         	INNER JOIN InvestmentBasicDetail A
         		ON A.InvEntityId=B.InvEntityId
         		AND B.EffectiveFromTimeKey<=@TimeKey and B.EffectiveToTimeKey>=@TimeKey
         WHERE (		(a.InvestmentNature='EQUITY' AND ISNULL(MTMValueINR,0)>=1) 					
         		OR (ISNULL(a.InvestmentNature,'')<>'EQUITY' AND  ISNULL(B.DPD,0)<=0) 
         	   )
            and ISNULL(FinalAssetClassAlt_Key,1) not in(1)
           AND B.EffectiveFromTimeKey<=@TimeKey and B.EffectiveToTimeKey>=@TimeKey
          GROUP BY B.RefIssuerID
          --
         ) B ON A.RefIssuerID=B.RefIssuerID AND A.TOTALCOUNT=B.TOTALDPD_MAXCOUNT


         ------  -------- UPGRADING CUSTOMER------------- Same Upgrade Code is applicable in Pro.UpgradeCustomerAccount SP 2102023 --- Sudesh

         --UPDATE A SET A.FlgUpg='U'
         --FROM InvestmentFinancialDetail A INNER JOIN #TEMPTABLE B ON A.RefIssuerID=B.RefIssuerID
         --WHERE  A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey

         UPDATE A SET A.FlgUpg='U'
         FROM InvestmentFinancialDetail A 
         INNER JOIN #TEMPTABLE B ON A.RefIssuerID=B.RefIssuerID
         				INNER JOIN InvestmentBasicDetail Bb
         					ON A.InvEntityId =bb.InvEntityId

         					AND bb.EffectiveFromTimeKey <=@TIMEKEY AND bb.EffectiveToTimeKey >=@TIMEKEY
         				INNER JOIN InvestmentIssuerDetail Cc
         					ON Cc.IssuerEntityId=bb.IssuerEntityId
         					AND Cc.EffectiveFromTimeKey <=@TIMEKEY AND Cc.EffectiveToTimeKey >=@TIMEKEY

         WHERE  A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey
          AND ASSET_NORM='NORMAL'



         UPDATE A SET  A.UpgDate=@PROCESSDATE
                      ,A.DegReason=NULL
         			 ,A.AssetClass_AltKey=1
         			 ,A.FinalAssetClassAlt_Key=1
         			 ,A.FlgDeg='N'
         			 ,A.NPIDt=null
                      ,A.FlgUpg='U'
         			 FROM InvestmentFinancialDetail A
         WHERE  ISNULL(A.FlgUpg,'U')='U' 
         AND A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey


         --=======Added by Mandeep Date 12-12-2022(To remove upgrade flag and upgrade date from loss accounts)============================================================================
         UPDATE A SET  A.UpgDate=NULL
                      ,A.FlgUpg=NULL
         			 FROM InvestmentFinancialDetail A
         WHERE 
         ISNULL(A.FinalAssetClassAlt_Key,1)>1
         AND A.NPIDt IS NOT NULL
         AND A.FlgUpg='U'
         AND A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey

         UPDATE A 
         SET
         A.DEGREASON=NULL
         FROM InvestmentFinancialDetail A
         WHERE 
         A.FlgUpg='U'
         AND A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey



         ----UPDATE A SET A.FinalAssetClassAlt_Key=2
         ----			,A.NPIDt='2021-09-19'
         ----			,A.FLGDEG='N'
         ----FROM InvestmentFinancialDetail A 
         ----INNER JOIN InvestmentBasicDetail Bb
         ----	ON A.InvEntityId =bb.InvEntityId
         ----	AND bb.EffectiveFromTimeKey <=@TIMEKEY AND bb.EffectiveToTimeKey >=@TIMEKEY
         ----INNER JOIN InvestmentIssuerDetail Cc
         ----	ON Cc.IssuerEntityId=bb.IssuerEntityId
         ----	AND Cc.EffectiveFromTimeKey <=@TIMEKEY AND Cc.EffectiveToTimeKey >=@TIMEKEY
         ----WHERE  A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey
         ----AND isnull(UcifId,'') IN('RBL008827709','RBL003034380','RBL002980785')   --  mannual npa as per RBL team Mr. Divakar  email dated  17-09-2021 time 14:12 for marked Manual NPA forcefully --
         ----and FinalAssetClassAlt_Key >1

         ----------------------PROVISION ALT KEY ALL  ACCOUNTS----------------------------------
         --   commented ;rovision code -  provision updating from seperate SP  in final asset class and npat date updation
         UPDATE A SET PROVISIONALT_KEY=0
         from InvestmentFinancialDetail  A
         where  (A.EffectiveFromTimeKey<=@TimeKey AND A.EffectiveToTimeKey>=@TimeKey)



         UPDATE A SET A.ProvisionAlt_Key=D.ProvisionAlt_Key
         ----SELECT *
         FROM InvestmentFinancialDetail A 
         INNER JOIN DimAssetClass C ON C.AssetClassAlt_Key=isnull(A.FinalAssetClassAlt_Key,1) 
              AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)
         	 INNER JOIN DimProvision_Seg d
         		ON D.EffectiveFromTimeKey <=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY
         		--AND A.DPD BETWEEN d.LowerDPD AND d.UpperDPD
         		AND c.AssetClassShortName=d.PROVISIONSHORTNAMEENUM
         WHERE  C.ASSETCLASSGROUP='NPA'  AND
          (A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY)
           and d.SEGMENT='IRAC'

          UPDATE A 
         	SET TotalProvison =(CASE WHEN ISNULL(B.ASSETCLASSSHORTNAMEENUM,'STD')='LOS' 
         				                    THEN BookValueINR
         						    ELSE (ISNULL(A.BookValueINR,0) * ISNULL(C.PROVISIONUNSECURED,0)/100 )  
         							 END)

         	FROM InvestmentFinancialDetail A  
         	INNER JOIN DIMASSETCLASS B ON B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY
         	                            AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY      
         	                            AND ISNULL(A.AssetClass_AltKey,1) =B.ASSETCLASSALT_KEY 
         	INNER JOIN DIMPROVISION_SEG C ON C.EFFECTIVEFROMTIMEKEY<=@TIMEKEY
         	                          AND C.EFFECTIVETOTIMEKEY>=@TIMEKEY      
         	                          AND ISNULL(A.PROVISIONALT_KEY,1) = C.PROVISIONALT_KEY 

         	WHERE  AssetClass_AltKey>1 AND A.EFFECTIVEFROMTIMEKEY<=@TIMEKEY     AND A.EFFECTIVETOTIMEKEY>=@TIMEKEY  



          -- STD PROVISION ALTKEY --
         UPDATE A SET A.ProvisionAlt_Key=D.ProvisionAlt_Key
         ----SELECT *
         FROM   InvestmentFinancialDetail A 
         INNER JOIN DimAssetClass C ON C.AssetClassAlt_Key=isnull(A.FinalAssetClassAlt_Key,1) 
              AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)
         	 INNER JOIN DimProvision_SegSTD d
         		ON D.EffectiveFromTimeKey <=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY
         		  and d.ProvisionName='Other Portfolio' 
         WHERE  C.ASSETCLASSGROUP='STD'  AND
          (A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY)


         -- STD PROVISION maount --
          UPDATE A 
         	SET TotalProvison =(CASE WHEN ISNULL(B.ASSETCLASSSHORTNAMEENUM,'STD')='LOS' 
         				                    THEN BookValueINR
         						    ELSE (ISNULL(A.BookValueINR,0) * ISNULL(C.PROVISIONUNSECURED,0)/100 )  
         							 END)

         	FROM  InvestmentFinancialDetail A  
         	INNER JOIN DIMASSETCLASS B ON B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY
         	                            AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY      
         	                            AND ISNULL(A.FinalAssetClassAlt_Key,1) =B.ASSETCLASSALT_KEY 
         	INNER JOIN DimProvision_SegStd C ON C.EFFECTIVEFROMTIMEKEY<=@TIMEKEY
         	                          AND C.EFFECTIVETOTIMEKEY>=@TIMEKEY      
         	                          AND ISNULL(A.PROVISIONALT_KEY,1) = C.PROVISIONALT_KEY 
         	WHERE  FinalAssetClassAlt_Key=1 AND A.EFFECTIVEFROMTIMEKEY<=@TIMEKEY     AND A.EFFECTIVETOTIMEKEY>=@TIMEKEY  

          OPTION(RECOMPILE)

         --
         */
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'InvestmentDataProcessing';
         --------------Added for DashBoard 04-03-2021
         UPDATE BANDAUDITSTATUS
            SET CompletedCount = CompletedCount + 1
          WHERE  BandName = 'ASSET CLASSIFICATION';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'InvestmentDataProcessing';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INVESTMENTDATAPROCESSING_18032023" TO "ADF_CDR_RBL_STGDB";
