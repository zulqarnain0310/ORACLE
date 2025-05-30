--------------------------------------------------------
--  DDL for Procedure MARKING_FLGPNPA_A
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_FLGPNPA_A" /*=========================================
 AUTHER : TRILOKI SHANKER KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-09-2019
 DESCRIPTION : MARKING OF FlgPNPA AND DEG REASON 
  EXEC [PRO].[Marking_FlgPNPA] 25435
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TIMEKEY = 26267 );
         ----DECLARE @PNPAProcessDate DATE  =(SELECT EOMONTH(DATE) FROM SYSDAYMATRIX WHERE CAST(DATE AS DATE) =@ProcessDate)--(SELECT DATE FROM SYSDAYMATRIX WHERE TIMEKEY=@TIMEKEY
         v_PNPAProcessDate --APPLIED LOGIC OF 30DAYS ROLLING PERIOD AS ADVISED BY sITARAM sIR ON CALL AFTER DISCUSSED WITH sHARMA sIR AND aSHISH SIR
          VARCHAR2(200) := utils.dateadd('DD', 30, v_ProcessDate);
         v_PNPA_DAYS NUMBER(10,0) := utils.datediff('DAY', v_PROCESSDATE, v_PNPAProcessDate);
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

      BEGIN
         /*--------------------INTIAL LEVEL FlgPNPA SET N-------------------------------------------- */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgPNPA = 'N',
                                      PNPA_DATE = NULL;
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
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
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
         --FROM PRO.AccountCal A INNER JOIN Curdat.AdvAcRestructureDetail B ON A.AccountEntityID=B.AccountEntityId
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
         ----FROM  Curdat.AdvAcRestructureDetail A INNER JOIN PRO.AccountCal
         ---- B ON A.AccountEntityId=B.AccountEntityID
         ---- AND A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY
         ---- WHERE  CustomerEntityID  NOT IN(SELECT CustomerEntityID FROM AdvAcProjectDetail WHERE EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         ---- AND   A.SDR_REFER_DATE IS NOT NULL   AND ISNULL(FinalAssetClassAlt_Key,1)=1 AND ISNULL(B.Balance,0)>0
         /*-------------------------ASSIGNE PNPA REASON-------------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ',DEGRADE BY INT NOT SERVICED' AS pos_2, utils.dateadd('DAY', -(A.DPD_IntService + v_PNPA_DAYS - 91), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
              ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_IntService + v_PNPA_DAYS) >= 61 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY CONTI EXCESS' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdrawn + v_PNPA_DAYS - 91), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
              ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdrawn + v_PNPA_DAYS) >= 61 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY OVERDUE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdue + v_PNPA_DAYS - 91), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
              ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdue + v_PNPA_DAYS) >= 61 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         ----AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'DEGRADE BY DEBIT BALANCE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdue + v_PNPA_DAYS - 91), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TimeKey
                AND C.EffectiveToTimeKey >= v_TimeKey ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdue + v_PNPA_DAYS) >= 61 ) )
           AND A.DebitSinceDt IS NOT NULL
           AND NVL(C.SrcSysProductCode, 'N') = 'SAVING') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY NO CREDIT' AS pos_2, utils.dateadd('DAY', -(A.DPD_NoCredit + v_PNPA_DAYS - 91), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A --INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
              --INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_NoCredit + v_PNPA_DAYS) >= 61 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         ---AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS pos_2, utils.dateadd('DAY', -(A.DPD_StockStmt + v_PNPA_DAYS - 91), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ---INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
              ---INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_StockStmt + v_PNPA_DAYS) >= 61 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         ---AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Renewal + v_PNPA_DAYS - 91), v_PNPAPROCESSDATE) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A --- INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI
               ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91 
          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_Renewal + v_PNPA_DAYS) >= 61 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
         -----AND C.NPANorms='DPD91'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ',DEGRADE BY INT NOT SERVICED' AS pos_2, utils.dateadd('DAY', -(A.DPD_IntService + v_PNPA_DAYS - 366), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              --INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_IntService + v_PNPA_DAYS) >= 335 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ----AND C.NPANorms='DPD366'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY CONTI EXCESS' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdrawn + v_PNPA_DAYS - 366), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              ---INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdrawn + v_PNPA_DAYS) >= 335 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ---AND C.NPANorms='DPD366'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY OVERDUE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdue + v_PNPA_DAYS - 366), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              ---INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdue + v_PNPA_DAYS) >= 335 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ---AND C.NPANorms='DPD366'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'DEGRADE BY DEBIT BALANCE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Overdue + v_PNPA_DAYS - 366), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TimeKey
                AND C.EffectiveToTimeKey >= v_TimeKey ) 
          WHERE ( A.FlgPNPA = 'Y'
           AND ( (A.DPD_Overdue + v_PNPA_DAYS) >= 335 ) )
           AND A.DebitSinceDt IS NOT NULL
           AND NVL(C.SrcSysProductCode, 'N') = 'SAVING') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ---AND C.NPANorms='DPD366'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY NO CREDIT' AS pos_2, utils.dateadd('DAY', -(A.DPD_NoCredit + v_PNPA_DAYS - 366), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A --INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              ----INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_NoCredit + v_PNPA_DAYS) >= 335 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         ---AND C.NPANorms='DPD366'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS pos_2, utils.dateadd('DAY', -(A.DPD_StockStmt + v_PNPA_DAYS - 366), v_PNPAProcessDate) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ---INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              ---INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_StockStmt + v_PNPA_DAYS) >= 335 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N')  in('KCC')
         --AND C.NPANorms='DPD366'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.PNPA_Reason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS pos_2, utils.dateadd('DAY', -(A.DPD_Renewal + v_PNPA_DAYS - 366), v_PNPAPROCESSDATE) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A --- INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID -- Modification DONE 03/09/2019 TRILOKI

                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              --INNER JOIN DimProduct C ON  A.ProductAlt_Key=C.ProductAlt_Key AND (C.EffectiveFromTimeKey<=@TimeKey AND C.EffectiveToTimeKey>=@TimeKey)

          WHERE ( A.FlgPNPA = 'Y'
           AND (A.DPD_Renewal + v_PNPA_DAYS) >= 335 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_Reason = pos_2,
                                      A.PNPA_DATE = pos_3;
         --AND isnull(C.ProductSubGroup,'N')  in('KCC')
         ----AND C.NPANorms='DPD366'
         /*-------------------UPDATE PNPA FLAG AT CUSTOMER LEVEL------------------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE A.FlgPNPA = 'Y'
           AND ( B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgPNPA = 'Y';
         IF utils.object_id('TEMPDB..tt_TEMPTABLEPNPA_7') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEPNPA_7 ';
         END IF;
         DELETE FROM tt_TEMPTABLEPNPA_7;
         UTILS.IDENTITY_RESET('tt_TEMPTABLEPNPA_7');

         INSERT INTO tt_TEMPTABLEPNPA_7 ( 
         	SELECT A.RefCustomerID ,
                 MIN(A.PNPA_DATE)  PNPA_DATE  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID
         	 WHERE  B.FlgPNPA = 'Y'
                    AND ( B.FlgProcessing = 'N' )
         	  GROUP BY A.RefCustomerID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PNPA_DATE
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLEPNPA_7 B   ON A.RefCustomerID = B.REFCUSTOMERID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_DT = src.PNPA_DATE;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PNPA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE B.FlgPNPA = 'Y'
           AND ( B.FlgProcessing = 'N' )
           AND A.FlgPNPA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPA_DATE = src.PNPA_Dt;
         /*----------------UPDATE FOR PnpaAssetClassAlt_key--------------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.FinalAssetClassAlt_Key, 1) AS PNPAASSETCLASSALT_KEY
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPAASSETCLASSALT_KEY = src.PNPAASSETCLASSALT_KEY;
         --WHERE (B.FLGPROCESSING='N')
         IF utils.object_id('TEMPDB..tt_CTE_CUSTOMERWISEBALANCEP_7') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CUSTOMERWISEBALANCEP_7 ';
         END IF;
         DELETE FROM tt_CTE_CUSTOMERWISEBALANCEP_7;
         UTILS.IDENTITY_RESET('tt_CTE_CUSTOMERWISEBALANCEP_7');

         INSERT INTO tt_CTE_CUSTOMERWISEBALANCEP_7 ( 
         	SELECT A.UcifEntityID ,
                 SUM(NVL(A.Balance, 0))  BALANCE  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID
         	 WHERE  B.SysAssetClassAlt_Key IN ( 1 )

                    AND B.FlgDeg <> 'Y'
                    AND ( NVL(B.FlgProcessing, 'N') = 'N' )

                    --AND ISNULL(A.FACILITYTYPE,'N')NOT IN('INV','LC','BG')
                    AND B.UcifEntityID > 0
         	  GROUP BY A.UcifEntityID );
         --UPDATE  B SET B.PNPA_Class_Key=
         --  (CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.BALANCE,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='LOS' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --       WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.BALANCE,0)<= ISNULL(B.CurntQtrRv,0)) THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='DB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY) 
         --	   ELSE (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='SUB' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --   END)
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
           FROM DimAssetClass 
          WHERE  DIMASSETCLASS.AssetClassShortName = 'SUB'
                   AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                   AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY ) AS PNPA_Class_Key
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID
                JOIN tt_CTE_CUSTOMERWISEBALANCEP_7 C   ON C.UcifEntityID = B.UcifEntityID
                JOIN DimAssetClass D   ON D.AssetClassAlt_Key = B.SysAssetClassAlt_Key
                AND ( D.EffectiveFromTimeKey <= v_TIMEKEY
                AND D.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE NVL(A.Balance, 0) > 0
           AND b.FlgPNPA = 'Y'
           AND ( NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.PNPA_Class_Key = src.PNPA_Class_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PNPA_Class_Key
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE B.FlgPNPA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PNPAASSETCLASSALT_KEY = src.PNPA_Class_Key;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Marking_FlgPNPA';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEPNPA_7 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CUSTOMERWISEBALANCEP_7 ';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_FlgPNPA';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGPNPA_A" TO "ADF_CDR_RBL_STGDB";
