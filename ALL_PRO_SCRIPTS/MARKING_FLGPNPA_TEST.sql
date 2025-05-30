--------------------------------------------------------
--  DDL for Procedure MARKING_FLGPNPA_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_FLGPNPA_TEST" /*=========================================
 AUTHER : TRILOKI SHANKER KHANNA
CREATE DATE : 27-11-2019
MODIFY DATE : 27-09-2019
DESCRIPTION : MARKING OF FlgPNPA AND DEG REASON 
EXEC [PRO].[Marking_FlgPNPA] 26279
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         --declare @TIMEKEY int=26279
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TIMEKEY = v_TIMEKEY );
         ----DECLARE @PNPAProcessDate DATE  =(SELECT EOMONTH(DATE) FROM SYSDAYMATRIX WHERE CAST(DATE AS DATE) =@ProcessDate)--(SELECT DATE FROM SYSDAYMATRIX WHERE TIMEKEY=@TIMEKEY
         v_PNPAProcessDate --APPLIED LOGIC OF 30DAYS ROLLING PERIOD AS ADVISED BY sITARAM sIR ON CALL AFTER DISCUSSED WITH sHARMA sIR AND aSHISH SIR
          VARCHAR2(200) := utils.dateadd('DD', 30, v_ProcessDate);
         v_PNPA_DAYS NUMBER(10,0) := utils.datediff('DAY', v_PROCESSDATE, v_PNPAProcessDate);

      BEGIN
         /*--------------------INTIAL LEVEL FlgPNPA SET N-------------------------------------------- */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgPNPA = 'N',
                                      A.PNPA_DATE = NULL,
                                      A.PnpaAssetClassAlt_key = NULL,
                                      A.PNPA_Reason = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgPNPA = 'N',
                                      A.PNPA_Dt = NULL,
                                      A.PNPA_Class_Key = NULL;
         /*---------------UPDATE FlgPNPA FLAG AT ACCOUNT LEVEL----------------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN ( (A.DPD_IntService + v_PNPA_DAYS) >= A.RefPeriodIntService ) THEN 'Y'
         WHEN ( (A.DPD_NoCredit + v_PNPA_DAYS) >= A.RefPeriodNoCredit ) THEN 'Y'
         WHEN ( (A.DPD_Overdue + v_PNPA_DAYS) >= A.RefPeriodOverdue ) THEN 'Y'
         WHEN ( (A.DPD_StockStmt + v_PNPA_DAYS) >= A.RefPeriodStkStatement ) THEN 'Y'
         WHEN ( (A.DPD_Renewal + v_PNPA_DAYS) >= A.RefPeriodReview ) THEN 'Y'
         WHEN ( (A.DPD_Overdrawn + v_PNPA_DAYS) >= A.RefPeriodOverDrawn ) THEN 'Y'
         ELSE 'N'
            END) AS FlgPNPA
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( a.FinalAssetClassAlt_Key IN ( SELECT AssetClassAlt_Key 
                                                FROM DimAssetClass 
                                                 WHERE  AssetClassShortNameEnum IN ( 'STD' )

                                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                                          AND EffectiveToTimeKey >= v_TIMEKEY )
          )
           AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' )
           AND ( NVL(B.FlgProcessing, 'N') = 'N' )
           AND NVL(A.FlgMoc, 'N') <> 'Y'
           AND NVL(A.Balance, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgPNPA = src.FlgPNPA;
         /*----------------------------------HANDLE TO RESTRUCTURE ACCOUNT ----------------------------------*/
         --UPDATE A SET A.FlgPNPA='Y',a.PNPA_Reason='Account Restructured after 01-04-2015', A.PNPA_DATE=@PNPAPROCESSDATE
         --FROM PRO.ACCOUNTCAL_test A INNER JOIN Curdat.AdvAcRestructureDetail B ON A.AccountEntityID=B.AccountEntityId
         --AND (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY)
         --WHERE B.RestructureDt IS NOT NULL AND RestructureDt >= '2015-04-01' and RestructureDt >= DATEADD(YEAR,-1,@PNPAPROCESSDATE) AND ISNULL(FinalAssetClassAlt_Key,1)=1 AND ISNULL(A.Balance,0)>0
         /*-------------------------REVERSING DEGRADED ACCOUNT THROUGH NORMAL PROCESS--------------*/
         ----UPDATE B SET B.FlgPNPA=
         ----(CASE WHEN ISNULL(SDR_INVOKED,'N')='Y' AND  DATEADD(DAY,@PNPA_DAYS, SDR_REFER_DATE) >DATEADD(MONTH,-18,@PNPAPROCESSDATE) THEN 'N'
         ----ELSE B.FlgPNPA
         ---- END)
         ---- ,b.PNPA_Reason=(CASE WHEN ISNULL(SDR_INVOKED,'N')='Y' AND  DATEADD(DAY,@PNPA_DAYS, SDR_REFER_DATE) >DATEADD(MONTH,-18,@PNPAPROCESSDATE) THEN null
         ----ELSE b.PNPA_Reason
         ---- END)
         ---- ,B.PNPA_DATE=(CASE WHEN ISNULL(SDR_INVOKED,'N')='Y' AND  DATEADD(DAY,@PNPA_DAYS, SDR_REFER_DATE) >DATEADD(MONTH,-18,@PNPAPROCESSDATE) THEN  NULL ELSE B.PNPA_DATE END )
         ----FROM  Curdat.AdvAcRestructureDetail A INNER JOIN PRO.ACCOUNTCAL_test
         ---- B ON A.AccountEntityId=B.AccountEntityID
         ---- AND A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY
         ---- WHERE  CustomerEntityID  NOT IN(SELECT CustomerEntityID FROM AdvAcProjectDetail WHERE EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         ---- AND   A.SDR_REFER_DATE IS NOT NULL   AND ISNULL(FinalAssetClassAlt_Key,1)=1 AND ISNULL(B.Balance,0)>0
         /*-------------------------ASSIGNE PNPA REASON-------------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ',DEGRADE BY INT NOT SERVICED' AS pos_2, utils.dateadd('DAY', -(A.DPD_IntService + v_PNPA_DAYS - NVL(A.RefPeriodIntService, 0)), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              --AND ABD.ReferencePeriod=91
               ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
               ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_IntService + v_PNPA_DAYS) >= NVL(REFPERIODINTSERVICE, 0) ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY CONTI EXCESS' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdrawn + v_PNPA_DAYS - NVL(REFPERIODOVERDRAWN, 0)), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              --AND ABD.ReferencePeriod=91
               ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
               ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdrawn + v_PNPA_DAYS) >= NVL(REFPERIODOVERDRAWN, 0) ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY OVERDUE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdue + v_PNPA_DAYS - NVL(RefPeriodOverdue, 0)), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              ----AND ABD.ReferencePeriod=91
               ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
               ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.RefPeriodOverdue + v_PNPA_DAYS) >= NVL(RefPeriodOverdue, 0) ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         ----AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'DEGRADE BY DEBIT BALANCE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdue + v_PNPA_DAYS - NVL(RefPeriodOverdue, 0)), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              ----AND ABD.ReferencePeriod=91
               )
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TimeKey
                AND C.EffectiveToTimeKey >= v_TimeKey ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdue + v_PNPA_DAYS) >= NVL(RefPeriodOverdue, 0) ) )
           AND A.DebitSinceDt IS NOT NULL
           AND NVL(C.SrcSysProductCode, 'N') = 'SAVING') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY NO CREDIT' AS pos_2, utils.dateadd('DAY', -(A.DPD_NoCredit + v_PNPA_DAYS - NVL(RefPeriodNoCredit, 0)), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A --INNER JOIN PRO.CUSTOMERCAL_test B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              ----AND ABD.ReferencePeriod=91
               --INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
               ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_NoCredit + v_PNPA_DAYS) >= NVL(RefPeriodNoCredit, 0) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         ---AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS pos_2, utils.dateadd('DAY', -(A.DPD_StockStmt + v_PNPA_DAYS - NVL(RefPeriodStkStatement, 0)), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A ---INNER JOIN PRO.CUSTOMERCAL_test B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              ----AND ABD.ReferencePeriod=91
               ---INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
               ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_StockStmt + v_PNPA_DAYS) >= NVL(RefPeriodStkStatement, 0) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ---AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Renewal + v_PNPA_DAYS - NVL(RefPeriodReview, 0)), v_PNPAPROCESSDATE) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A --- INNER JOIN PRO.CUSTOMERCAL_test B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI
               ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY
              ----AND ABD.ReferencePeriod=91
               ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_Renewal + v_PNPA_DAYS) >= NVL(RefPeriodReview, 0) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         -----AND C.NPANorms='DPD91'
         --------UPDATE A SET A.PNPA_Reason= ISNULL(A.PNPA_Reason,'')+',DEGRADE BY INT NOT SERVICED' 
         --------             ,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_INTSERVICE+@PNPA_DAYS-ISNULL(RefPeriodIntService,0)),@PNPAProcessDate)
         --------FROM PRO.ACCOUNTCAL_test A 
         -------- INNER JOIN AdvAcBasicDetail ABD
         --------	  ON A.AccountEntityID=ABD.AccountEntityId
         --------	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         --------	  ------AND ABD.ReferencePeriod=366
         ----------INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         --------WHERE  (A.FlgPNPA='Y' AND ((A.DPD_INTSERVICE+@PNPA_DAYS)>=ISNULL(RefPeriodIntService,0))) 
         ----------AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ------------AND C.NPANorms='DPD366'
         --------UPDATE A SET A.PNPA_Reason= ISNULL(A.PNPA_Reason,'')+', DEGRADE BY CONTI EXCESS'
         --------           ,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_OVERDRAWN+@PNPA_DAYS-ISNULL(REFPERIODOVERDRAWN,0)),@PNPAProcessDate)
         --------FROM PRO.ACCOUNTCAL_test A 
         -------- INNER JOIN AdvAcBasicDetail ABD
         --------	  ON A.AccountEntityID=ABD.AccountEntityId
         --------	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         --------	  ----AND ABD.ReferencePeriod=366
         -----------INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         --------WHERE (A.FlgPNPA='Y' AND ((A.DPD_OVERDRAWN+@PNPA_DAYS)>=ISNULL(REFPERIODOVERDRAWN,0))) 
         ----------AND isnull(C.ProductSubGroup,'N')  in('KCC')
         -----------AND C.NPANorms='DPD366'
         --------UPDATE A SET A.PNPA_Reason= ISNULL(A.PNPA_Reason,'')+', DEGRADE BY OVERDUE'    
         --------      ,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_OVERDUE +@PNPA_DAYS-ISNULL(RefPeriodOverdue,0) ),@PNPAProcessDate)          
         --------FROM PRO.ACCOUNTCAL_test A 
         -------- INNER JOIN AdvAcBasicDetail ABD
         --------	  ON A.AccountEntityID=ABD.AccountEntityId
         --------	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         --------	  ----AND ABD.ReferencePeriod=366
         -----------INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         --------WHERE  (A.FlgPNPA='Y' AND ((A.DPD_OVERDUE +@PNPA_DAYS)>=ISNULL(RefPeriodOverdue,0)))  
         ----------AND isnull(C.ProductSubGroup,'N')  in('KCC')
         -----------AND C.NPANorms='DPD366'
         ----UPDATE A SET A.PNPA_Reason= 'DEGRADE BY DEBIT BALANCE'    
         ----      ,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_OVERDUE +@PNPA_DAYS-ISNULL(RefPeriodOverdue,0) ),@PNPAProcessDate)          
         ----FROM PRO.ACCOUNTCAL_test A
         ---- INNER JOIN AdvAcBasicDetail ABD
         ----	  ON A.AccountEntityID=ABD.AccountEntityId
         ----	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         ----	  AND ABD.ReferencePeriod=366
         ----	INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         ----WHERE (A.FlgPNPA='Y' AND ((A.DPD_OVERDUE +@PNPA_DAYS)>=ISNULL(RefPeriodOverdue,0)))  
         ----AND A.DebitSinceDt IS NOT NULL AND ISNULL(C.SrcSysProductCode,'N')='SAVING'
         ------AND isnull(C.ProductSubGroup,'N')  in('KCC')
         -------AND C.NPANorms='DPD366'
         ----UPDATE A SET PNPA_Reason= ISNULL(A.PNPA_Reason,'')+', DEGRADE BY NO CREDIT'   
         ----         ,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_NOCREDIT+@PNPA_DAYS-ISNULL(RefPeriodNoCredit,0) ),@PNPAProcessDate)
         ----FROM PRO.ACCOUNTCAL_test A --INNER JOIN PRO.CUSTOMERCAL_test B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI
         ---- INNER JOIN AdvAcBasicDetail ABD
         ----	  ON A.AccountEntityID=ABD.AccountEntityId
         ----	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         ----	  ----AND ABD.ReferencePeriod=366
         --------INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         ----WHERE   (A.FlgPNPA='Y' AND (A.DPD_NOCREDIT+@PNPA_DAYS)>=ISNULL(RefPeriodNoCredit,0))
         -------AND C.NPANorms='DPD366'
         ----UPDATE A SET PNPA_Reason= ISNULL(A.PNPA_Reason,'')+', DEGRADE BY STOCK STATEMENT' 
         ----            ,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_STOCKSTMT+@PNPA_DAYS-RefPeriodStkStatement ),@PNPAProcessDate)   
         ----FROM PRO.ACCOUNTCAL_test A ---INNER JOIN PRO.CUSTOMERCAL_test B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI
         ---- INNER JOIN AdvAcBasicDetail ABD
         ----	  ON A.AccountEntityID=ABD.AccountEntityId
         ----	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         ----	  ----AND ABD.ReferencePeriod=366
         -------INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         ----WHERE  (A.FlgPNPA='Y' AND (A.DPD_STOCKSTMT+@PNPA_DAYS)>=ISNULL(RefPeriodStkStatement,0))  
         ------AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ------AND C.NPANorms='DPD366'
         ----UPDATE A SET A.PNPA_Reason= ISNULL(A.PNPA_Reason,'')+', DEGRADE BY REVIEW DUE DATE'   
         ----,A.PNPA_DATE=DATEADD(DAY,-(A.DPD_RENEWAL+@PNPA_DAYS-ISNULL(RefPeriodReview,0) ),@PNPAPROCESSDATE)    
         ----FROM PRO.ACCOUNTCAL_test A--- INNER JOIN PRO.CUSTOMERCAL_test B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI
         ---- INNER JOIN AdvAcBasicDetail ABD
         ----	  ON A.AccountEntityID=ABD.AccountEntityId
         ----	  AND (ABD.EffectiveFromTimeKey<=@TIMEKEY AND ABD.EffectiveToTimeKey>=@TIMEKEY)
         ----	  ----AND ABD.ReferencePeriod=366
         ------INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)
         ----WHERE  (A.FlgPNPA='Y' AND (A.DPD_RENEWAL+@PNPA_DAYS)>=ISNULL(RefPeriodReview,0)) 
         ------AND isnull(C.ProductSubGroup,'N')  in('KCC')
         --------AND C.NPANorms='DPD366'
         /*-------------------UPDATE PNPA FLAG AT CUSTOMER LEVEL------------------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE A.FlgPNPA = 'Y'
           AND ( B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgPNPA = 'Y';
         IF utils.object_id('TEMPDB..tt_TEMPTABLEPNPA_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEPNPA_2 ';
         END IF;
         DELETE FROM tt_TEMPTABLEPNPA_2;
         UTILS.IDENTITY_RESET('tt_TEMPTABLEPNPA_2');

         INSERT INTO tt_TEMPTABLEPNPA_2 ( 
         	SELECT A.CustomerEntityID ,
                 MIN(A.PNPA_DATE)  PNPA_DATE  ,
                 ( SELECT AssetClassAlt_Key 
                   FROM DimAssetClass 
                    WHERE  AssetClassShortName = 'SUB'
                             AND EffectiveFromTimeKey <= 26279
                             AND EffectiveToTimeKey >= 26279 ) PNPA_Class_Key  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.CustomerEntityID = B.CustomerEntityID
         	 WHERE  B.FLGPNPA = 'Y'
                    AND ( B.FLGPROCESSING = 'N' )
         	  GROUP BY A.CustomerEntityID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PNPA_DATE, 'Y', b.PNPA_Class_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN tt_TEMPTABLEPNPA_2 B   ON A.CustomerEntityID = B.CustomerEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_DT = src.PNPA_DATE,
                                      A.FlgPNPA = 'Y',
                                      a.PNPA_Class_Key = src.PNPA_Class_Key;
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, b.PNPA_Dt, 'Y', b.PNPA_Class_Key
         FROM a ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST a
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test b   ON a.CustomerEntityID = b.CustomerEntityID
                AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' )
                AND b.FlgPNPA = 'Y' ) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET a.PNPA_DATE = src.PNPA_Dt,
                                      a.FlgPNPA = 'Y',
                                      a.PnpaAssetClassAlt_key = src.PNPA_Class_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Link By AccountId' || ' ' || B.CustomerAcID AS PNPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.CustomerEntityID = B.CustomerEntityID
                AND A.FlgPNPA = 'Y'
                AND A.FlgPNPA = 'Y'

                --AND A.CustomerEntityID= 1376663
                AND A.PNPA_Reason IS NULL
                AND B.PNPA_Reason IS NOT NULL
                AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' ) ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET a.PNPA_Reason
                                      --SELECT A.PNPA_Reason,B.PNPA_Reason, *  
                                       = src.PNPA_Reason;
         /*-------------------UPDATE PNPA FLAG AT UCIF LEVEL------------------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE A.FlgPNPA = 'Y'
           AND ( B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgPNPA = 'Y';
         IF utils.object_id('TEMPDB..tt_CTE_CUSTOMERWISEBALANCEP_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CUSTOMERWISEBALANCEP_2 ';
         END IF;
         DELETE FROM tt_CTE_CUSTOMERWISEBALANCEP_2;
         UTILS.IDENTITY_RESET('tt_CTE_CUSTOMERWISEBALANCEP_2');

         INSERT INTO tt_CTE_CUSTOMERWISEBALANCEP_2 ( 
         	SELECT A.UcifEntityID ,
                 MIN(A.PNPA_DATE)  PNPA_DATE  ,
                 ( SELECT AssetClassAlt_Key 
                   FROM DimAssetClass 
                    WHERE  AssetClassShortName = 'SUB'
                             AND EffectiveFromTimeKey <= v_TIMEKEY
                             AND EffectiveToTimeKey >= v_TIMEKEY ) PNPA_Class_Key  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.UcifEntityID = B.UcifEntityID
         	 WHERE  B.FLGPNPA = 'Y'
                    AND ( B.FLGPROCESSING = 'N' )
         	  GROUP BY A.UcifEntityID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PNPA_DATE, 'Y', b.PNPA_Class_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN tt_CTE_CUSTOMERWISEBALANCEP_2 B   ON A.UcifEntityID = B.UcifEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_DT = src.PNPA_DATE,
                                      A.FlgPNPA = 'Y',
                                      a.PNPA_Class_Key = src.PNPA_Class_Key;
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, b.PNPA_DATE, 'Y', b.PNPA_Class_Key
         FROM a ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST a
                JOIN tt_CTE_CUSTOMERWISEBALANCEP_2 b   ON a.UcifEntityID = b.UcifEntityID
                AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' ) ) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET a.PNPA_DATE = src.PNPA_DATE,
                                      a.FlgPNPA = 'Y',
                                      a.PnpaAssetClassAlt_key = src.PNPA_Class_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'PERCOLATION BY UCIF ' || ' ' || B.UCIF_ID AS PNPA_Reason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST a
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST b   ON a.UcifEntityID = b.UcifEntityID 
          WHERE b.FlgPNPA = 'Y'
           AND A.FlgPNPA = 'Y'
           AND A.PNPA_Reason IS NULL
           AND B.PNPA_Reason IS NOT NULL
           AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET a.PNPA_Reason = src.PNPA_Reason;
         --------UPDATE A SET A.PNPA_DATE=B.PNPA_DT FROM PRO.ACCOUNTCAL_test A INNER JOIN  PRO.CUSTOMERCAL_test B 
         --------ON A.UcifEntityID=B.UcifEntityID
         --------WHERE B.FLGPNPA='Y' AND (B.FLGPROCESSING='N')
         --------AND A.FlgPNPA='Y' 
         ------/*----------------UPDATE FOR PnpaAssetClassAlt_key--------------------------------------------------*/
         --------UPDATE A SET A.PNPAASSETCLASSALT_KEY=ISNULL(A.PNPAASSETCLASSALT_KEY,1) 
         --------	FROM PRO.ACCOUNTCAL_test A INNER JOIN  PRO.CUSTOMERCAL_test B 
         --------ON A.UcifEntityID=B.UcifEntityID
         ----------WHERE (B.FLGPROCESSING='N')
         ------IF OBJECT_ID('TEMPDB..tt_CTE_CUSTOMERWISEBALANCEP_2') IS NOT NULL
         ------   DROP TABLE tt_CTE_CUSTOMERWISEBALANCEP_2
         ------SELECT A.UcifEntityID,SUM(ISNULL(A.BALANCE,0)) BALANCE INTO tt_CTE_CUSTOMERWISEBALANCEP_2
         ------ FROM PRO.ACCOUNTCAL_test A 
         ------ INNER JOIN PRO.CUSTOMERCAL_test B ON A.UcifEntityID=B.UcifEntityID
         ------WHERE    B.SYSASSETCLASSALT_KEY  IN (1) 
         ------AND B.FLGDEG<>'Y'
         ------ AND (ISNULL(B.FLGPROCESSING,'N')='N')    
         ------ --AND ISNULL(A.FACILITYTYPE,'N')NOT IN('INV','LC','BG')
         ----------and B.refcustomerid<>'0' 
         ------GROUP BY A.UcifEntityID
         ------DECLARE @MoveToDB1 DECIMAL(5,2) =(SELECT cast(RefValue/100.00 as decimal(5,2))FROM PRO.refperiod where BusinessRule='MoveToDB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         ------DECLARE @MoveToLoss DECIMAL(5,2)=(SELECT cast(RefValue/100.00 as decimal(5,2)) FROM PRO.refperiod where BusinessRule='MoveToLoss' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --------UPDATE  B SET B.PNPA_Class_Key=
         --------  (CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.BALANCE,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='LOS' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --------       WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.BALANCE,0)<= ISNULL(B.CurntQtrRv,0)) THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='DB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY) 
         --------	   ELSE (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='SUB' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --------   END)
         ------UPDATE  B SET B.PNPA_Class_Key= (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='SUB' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         ------FROM  PRO.ACCOUNTCAL_test A 
         ------INNER JOIN PRO.CUSTOMERCAL_test B ON A.UcifEntityID=B.UcifEntityID
         ------INNER JOIN #CTE_CustomerWiseBalancePNPA C ON C.UcifEntityID=B.UcifEntityID
         ------INNER JOIN DimAssetClass D ON D.AssetClassAlt_Key=B.SysAssetClassAlt_Key 
         ------	AND (D.EffectiveFromTimeKey<=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY)
         ------WHERE ISNULL(A.Balance,0)>0 AND b.FlgPNPA='Y' AND (ISNULL(B.FlgProcessing,'N')='N')
         ------UPDATE A SET A.PNPAASSETCLASSALT_KEY=B.PNPA_CLASS_KEY
         ------	FROM  PRO.ACCOUNTCAL_test A 
         ------INNER JOIN PRO.CUSTOMERCAL_test B ON A.UcifEntityID=B.UcifEntityID
         ------	WHERE B.FLGPNPA='Y' 
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Marking_FlgPNPA';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEPNPA_2 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CUSTOMERWISEBALANCEP_2 ';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_FlgPNPA';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_TEST" TO "ADF_CDR_RBL_STGDB";
