--------------------------------------------------------
--  DDL for Procedure SMA_MARKING_TEST_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."SMA_MARKING_TEST_04122023" /*=====================================
AUTHER : TRILOKI KHANNA
CREATE DATE : 27-11-2019
MODIFY DATE : 27-11-2019
DESCRIPTION : SMA MARKING
EXEC PRO.SMA_MARKING  @TIMEKEY=25140
====================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TIMEKEY = v_TIMEKEY );
         v_vEffectiveto NUMBER(10,0);
         v_temp NUMBER(1, 0) := 0;

      BEGIN
         SELECT Timekey - 1 

           INTO v_vEffectiveto
           FROM RBL_MISDB_PROD.Automate_Advances 
          WHERE  EXT_FLG = 'Y';
         --IF OBJECT_ID('TEMPDB..#DpdToday') IS NOT NULL
         --   DROP TABLE #DpdToday
         --select AccountEntityId,DPD_Overdrawn,DPD_Overdue,sum(DPD_Overdrawn+DPD_Overdue) as DPD_Max
         --INTO #DpdToday
         --FROM PRO.ACCOUNTCAL_test A
         --where  ( isnull(DPD_Overdrawn,0)>0  OR isnull(DPD_Overdue,0)>0 ) 
         --group by AccountEntityId,DPD_Overdrawn,DPD_Overdue
         IF utils.object_id('TEMPDB..tt_DPD_38') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_DPD_38 ';
         END IF;
         DELETE FROM tt_DPD_38;
         UTILS.IDENTITY_RESET('tt_DPD_38');

         INSERT INTO tt_DPD_38 ( 
         	SELECT AccountEntityID ,
                 UcifEntityID ,
                 CustomerEntityID ,
                 CustomerAcID ,
                 RefCustomerID ,
                 SourceSystemCustomerID ,
                 UCIF_ID ,
                 IntNotServicedDt ,
                 LastCrDate ,
                 ContiExcessDt ,
                 OverDueSinceDt ,
                 ReviewDueDt ,
                 StockStDt ,
                 RefPeriodIntService ,
                 RefPeriodNoCredit ,
                 RefPeriodOverDrawn ,
                 RefPeriodOverdue ,
                 RefPeriodReview ,
                 RefPeriodStkStatement ,
                 0 DPD_IntService  ,
                 0 DPD_NoCredit  ,
                 DPD_Overdrawn ,
                 DPD_Overdue ,
                 0 DPD_Renewal  ,
                 0 DPD_StockStmt  ,
                 0 DPD_MAX  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST a
         	 WHERE  NVL(A.DPD_Overdrawn, 0) > 0
                    OR NVL(A.DPD_Overdue, 0) > 0 );
         ------/*---------- CALCULATED ALL DPD---------------------------------------------------------*/
         --UPDATE A SET  A.DPD_IntService = (CASE WHEN  A.IntNotServicedDt IS NOT NULL THEN DATEDIFF(DAY,A.IntNotServicedDt,'2020-12-31')  ELSE 0 END)			   
         --             ,A.DPD_NoCredit =  (CASE WHEN  A.LastCrDate IS NOT NULL      THEN DATEDIFF(DAY,A.LastCrDate,  '2020-12-31')       ELSE 0 END)
         --			 ,A.DPD_Overdrawn=  (CASE WHEN   A.ContiExcessDt IS NOT NULL    THEN DATEDIFF(DAY,A.ContiExcessDt,  '2020-12-31') + 1    ELSE 0 END)
         --			 ,A.DPD_Overdue =   (CASE WHEN  A.OverDueSinceDt IS NOT NULL   THEN  DATEDIFF(DAY,A.OverDueSinceDt,  '2020-12-31')   ELSE 0 END) 
         --			 ,A.DPD_Renewal =   (CASE WHEN  A.ReviewDueDt IS NOT NULL      THEN DATEDIFF(DAY,A.ReviewDueDt, '2020-12-31')      ELSE 0 END)
         --			 ,A.DPD_StockStmt=  (CASE WHEN  A.StockStDt IS NOT NULL         THEN   DATEDIFF(DAY,A.StockStDt,'2020-12-31')       ELSE 0 END)
         --FROM tt_DPD_38 A 
         ----/*--------------IF ANY DPD IS NEGATIVE THEN ZERO---------------------------------*/
         UPDATE tt_DPD_38
            SET DPD_IntService = 0
          WHERE  NVL(DPD_IntService, 0) < 0;
         UPDATE tt_DPD_38
            SET DPD_NoCredit = 0
          WHERE  NVL(DPD_NoCredit, 0) < 0;
         UPDATE tt_DPD_38
            SET DPD_Overdrawn = 0
          WHERE  NVL(DPD_Overdrawn, 0) < 0;
         UPDATE tt_DPD_38
            SET DPD_Overdue = 0
          WHERE  NVL(DPD_Overdue, 0) < 0;
         UPDATE tt_DPD_38
            SET DPD_Renewal = 0
          WHERE  NVL(DPD_Renewal, 0) < 0;
         UPDATE tt_DPD_38
            SET DPD_StockStmt = 0
          WHERE  NVL(DPD_StockStmt, 0) < 0;
         ----/* CALCULATE MAX DPD */
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_132') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_132 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_132;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_132');

         INSERT INTO tt_TEMPTABLE_132 ( 
         	SELECT A.CustomerAcID ,
                 CASE 
                      WHEN NVL(A.DPD_IntService, 0) >= NVL(A.RefPeriodIntService, 0) THEN A.DPD_IntService
                 ELSE 0
                    END DPD_IntService  ,
                 CASE 
                      WHEN NVL(A.DPD_NoCredit, 0) >= NVL(A.RefPeriodNoCredit, 0) THEN A.DPD_NoCredit
                 ELSE 0
                    END DPD_NoCredit  ,
                 CASE 
                      WHEN NVL(A.DPD_Overdrawn, 0) >= NVL(A.RefPeriodOverDrawn, 0) THEN A.DPD_Overdrawn
                 ELSE 0
                    END DPD_Overdrawn  ,
                 CASE 
                      WHEN NVL(A.DPD_Overdue, 0) >= NVL(A.RefPeriodOverdue, 0) THEN A.DPD_Overdue
                 ELSE 0
                    END DPD_Overdue  ,
                 CASE 
                      WHEN NVL(A.DPD_Renewal, 0) >= NVL(A.RefPeriodReview, 0) THEN A.DPD_Renewal
                 ELSE 0
                    END DPD_Renewal  ,
                 CASE 
                      WHEN NVL(A.DPD_StockStmt, 0) >= NVL(A.RefPeriodStkStatement, 0) THEN A.DPD_StockStmt
                 ELSE 0
                    END DPD_StockStmt  
         	  FROM tt_DPD_38 A
         	 WHERE  ( NVL(DPD_IntService, 0) >= NVL(RefPeriodIntService, 0)
                    OR NVL(DPD_NoCredit, 0) >= NVL(RefPeriodNoCredit, 0)
                    OR NVL(DPD_Overdrawn, 0) >= NVL(RefPeriodOverDrawn, 0)
                    OR NVL(DPD_Overdue, 0) >= NVL(RefPeriodOverdue, 0)
                    OR NVL(DPD_Renewal, 0) >= NVL(RefPeriodReview, 0)
                    OR NVL(DPD_StockStmt, 0) >= NVL(RefPeriodStkStatement, 0) ) );
         ----	/*--------------INTIAL MAX DPD 0 FOR RE PROCESSING DATA-------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0
         FROM A ,tt_DPD_38 A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_Max = 0;
         ----		/*----------------FIND MAX DPD---------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN ( NVL(A.DPD_IntService, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(A.DPD_IntService, 0)
         WHEN ( NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(A.DPD_NoCredit, 0)
         WHEN ( NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(A.DPD_Overdrawn, 0)
         WHEN ( NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(A.DPD_Renewal, 0)
         WHEN ( NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(A.DPD_Overdue, 0)
         ELSE NVL(A.DPD_StockStmt, 0)
            END) AS DPD_Max
         FROM A ,tt_DPD_38 a 
          WHERE NVL(A.DPD_Overdrawn, 0) > 0
           OR NVL(A.DPD_Overdue, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_Max = src.DPD_Max;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS = NULL,
                                      A.SMA_REASON = NULL,
                                      A.SMA_DT = NULL,
                                      A.FLGSMA = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN dpd.DPD_Max BETWEEN 1 AND 30 THEN 'SMA_0'
         WHEN dpd.DPD_Max BETWEEN 31 AND 60 THEN 'SMA_1'
         WHEN dpd.DPD_Max BETWEEN 61 AND 90 THEN 'SMA_2'
         WHEN dpd.DPD_Max > 90 THEN 'SMA_2'
         ELSE NULL
            END) AS pos_2, (CASE 
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_INTSERVICE, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY INT NOT SERVICED'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_NOCREDIT, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY NO CREDIT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(dpd.DPD_OVERDRAWN, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY CONTI EXCESS'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_STOCKSTMT, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY STOCK STATEMENT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_RENEWAL, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY REVIEW DUE DATE'
         WHEN A.FacilityType IN ( 'TL','DL','BP','BD','PC' )

           AND NVL(dpd.DPD_OVERDUE, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY OVERDUE'
         ELSE 'OTHER'
            END) AS pos_3, utils.dateadd('DAY', -dpd.DPD_MAX, v_ProcessDate) AS pos_4, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.CustomerEntityID = B.CustomerEntityID
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
                JOIN tt_DPD_38 dpd   ON dpd.AccountEntityId = a.AccountEntityID
              --LEFT JOIN DIMPRODUCT C ON C.PRODUCTALT_KEY=A.PRODUCTALT_KEY   
               --AND ISNULL(C.PRODUCTGROUP,'N')<>'KCC'  
               --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
               --and c.NPANorms='DPD91'
               --AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)

          WHERE NVL(B.FlgProcessing, 'N') = 'N'
           AND NVL(FINALASSETCLASSALT_KEY, 1) = 1
           AND NVL(A.Balance, 0) > 0
           AND A.Asset_Norm <> 'ALWYS_STD'
           AND ( NVL(dpd.DPD_Overdrawn, 0) >= 0
           OR NVL(dpd.DPD_Overdue, 0) >= 0 )
           AND NVL(DPD.DPD_MAX, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS = pos_2,
                                      A.SMA_REASON = pos_3,
                                      A.SMA_DT = pos_4,
                                      A.FLGSMA = 'Y';
         --UPDATE A SET A.SMA_CLASS= (
         --                              CASE WHEN A.FACILITYTYPE IN('CC','OD') THEN ( CASE WHEN  REFPERIODOVERDRAWN-60>=DPD_MAX
         --							                                                       THEN 'SMA_0'
         --							                                                  WHEN REFPERIODOVERDRAWN-30>=DPD_MAX  THEN 'SMA_1'
         --																			    ELSE 'SMA_2' END) 
         --                              ELSE ( CASE WHEN  REFPERIODOVERDUE-60>=DPD_MAX
         --							                                                       THEN 'SMA_0'
         --							                                                  WHEN REFPERIODOVERDUE-30>=DPD_MAX  THEN 'SMA_1'
         --																			    ELSE 'SMA_2' END)
         --							  END)
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN dpd.DPD_MAX BETWEEN 1 AND 30 THEN 'SMA_0'
         WHEN dpd.DPD_MAX BETWEEN 31 AND 60 THEN 'SMA_1'
         WHEN dpd.DPD_MAX BETWEEN 61 AND 365 THEN 'SMA_2'
         WHEN dpd.DPD_MAX > 366 THEN 'SMA_2'
         ELSE NULL
            END) AS pos_2, (CASE 
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_INTSERVICE, 0) = NVL(DPD.DPD_MAX, 0) THEN 'DEGRADE BY INT NOT SERVICED'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_NOCREDIT, 0) = NVL(DPD.DPD_MAX, 0) THEN 'DEGRADE BY NO CREDIT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_OVERDRAWN, 0) = NVL(DPD.DPD_MAX, 0) THEN 'DEGRADE BY CONTI EXCESS'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_STOCKSTMT, 0) = NVL(DPD.DPD_MAX, 0) THEN 'DEGRADE BY STOCK STATEMENT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD.DPD_RENEWAL, 0) = NVL(DPD.DPD_MAX, 0) THEN 'DEGRADE BY REVIEW DUE DATE'
         WHEN A.FacilityType IN ( 'TL','DL','BP','BD','PC' )

           AND NVL(DPD.DPD_OVERDUE, 0) = NVL(dpd.DPD_MAX, 0) THEN 'DEGRADE BY OVERDUE'
         ELSE 'OTHER'
            END) AS pos_3, utils.dateadd('DAY', -dpd.DPD_MAX, v_PROCESSDATE) AS pos_4, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.CustomerEntityID = B.CustomerEntityID
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
                JOIN tt_DPD_38 DPD   ON dpd.AccountEntityId = a.AccountEntityID
              --INNER JOIN DIMPRODUCT C ON C.PRODUCTALT_KEY=A.PRODUCTALT_KEY 
               -- --AND ISNULL(C.PRODUCTGROUP,'N')='KCC'  
               -- --AND isnull(C.ProductSubGroup,'N')  in('KCC')
               --  and C.NPANorms='DPD366'
               --AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)

          WHERE NVL(B.FlgProcessing, 'N') = 'N'
           AND NVL(FINALASSETCLASSALT_KEY, 1) = 1
           AND NVL(A.Balance, 0) > 0
           AND A.Asset_Norm <> 'ALWYS_STD'
           AND ( NVL(DPD.DPD_Overdrawn, 0) >= 0
           OR NVL(DPD.DPD_Overdue, 0) >= 0 )
           AND NVL(DPD.DPD_MAX, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS = pos_2,
                                      A.SMA_REASON = pos_3,
                                      A.SMA_DT = pos_4,
                                      A.FLGSMA = 'Y';
         /*--------Account not to be reported in  SMA 0 for Continuous Excess Date Criteria up to  30 days-------------------- */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST a 
          WHERE NVL(DPD_Max, 0) > 0

           --AND  FacilityType in('CC','OD') 
           AND DPD_Overdrawn = DPD_Max
           AND DPD_Max <= 30
           AND FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_Class = NULL,
                                      A.SMA_Reason = NULL,
                                      A.SMA_Dt = NULL,
                                      A.FlgSMA = NULL;
         /*------SMA MARKING FOR CUSTOMER LEVEL-------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGSMA = NULL,
                                      A.SMA_CLASS_KEY = NULL,
                                      A.SMA_DT = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE B.FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGSMA = 'Y';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_132_SMACLASS') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_SMACLASS_7 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_SMACLASS_7;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_SMACLASS_7');

         INSERT INTO tt_TEMPTABLE_SMACLASS_7 ( 
         	SELECT A.CustomerEntityID ,
                 MAX(CASE 
                          WHEN SMA_CLASS = 'SMA_0' THEN 1
                          WHEN SMA_CLASS = 'SMA_1' THEN 2
                          WHEN SMA_CLASS = 'SMA_2' THEN 3
                     ELSE 0
                        END)  MAXSMA_CLASS  ,
                 MIN(A.SMA_Dt)  SMA_Dt  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.CustomerEntityID = B.CustomerEntityID
                   AND B.FlgSMA = 'Y'
         	  GROUP BY A.CustomerEntityID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.MAXSMA_CLASS, B.SMA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN tt_TEMPTABLE_SMACLASS_7 B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE A.FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS_KEY = src.MAXSMA_CLASS,
                                      A.SMA_DT = src.SMA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.UCIF_ID = B.UCIF_ID 
          WHERE B.FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGSMA = 'Y';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_132_SMACLASSUcif') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_SMACLASSUcif_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_SMACLASSUcif_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_SMACLASSUcif_6');

         INSERT INTO tt_TEMPTABLE_SMACLASSUcif_6 ( 
         	SELECT A.UCIF_ID ,
                 MAX(CASE 
                          WHEN SMA_CLASS = 'SMA_0' THEN 1
                          WHEN SMA_CLASS = 'SMA_1' THEN 2
                          WHEN SMA_CLASS = 'SMA_2' THEN 3
                     ELSE 0
                        END)  MAXSMA_CLASS  ,
                 MIN(A.SMA_Dt)  SMA_Dt  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.UCIF_ID = B.UCIF_ID
                   AND B.FlgSMA = 'Y'
         	  GROUP BY A.UCIF_ID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.MAXSMA_CLASS, B.SMA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN tt_TEMPTABLE_SMACLASSUcif_6 B   ON A.UCIF_ID = B.UCIF_ID 
          WHERE A.FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS_KEY = src.MAXSMA_CLASS,
                                      A.SMA_DT = src.SMA_Dt;
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.SMA_MOVEMENT_HISTORY 
                             WHERE  TIMEKEY = v_TIMEKEY );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            DELETE PRO_RBL_MISDB_PROD.SMA_MOVEMENT_HISTORY

             WHERE  TIMEKEY = v_TIMEKEY;

         END;
         END IF;
         IF utils.object_id('TEMPDB..tt_SMACLASS_7') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_SMACLASS_7 ';
         END IF;
         DELETE FROM tt_SMACLASS_7;
         UTILS.IDENTITY_RESET('tt_SMACLASS_7');

         INSERT INTO tt_SMACLASS_7 ( 
         	SELECT A.CustomerAcID ,
                 NVL(A.SMA_Class, CHOOSE(B.SMA_Class_Key, 'SMA_0', 'SMA_1', 'SMA_2')) SMA_CLASS  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID
                   AND A.CustomerEntityID = B.CustomerEntityID
                   AND A.FlgSMA = 'Y'
         	 WHERE  B.FlgSMA = 'Y'
                    AND NVL(A.Balance, 0) > 0
                    AND NVL(B.SysAssetClassAlt_Key, 1) = 1 );
         UPDATE tt_SMACLASS_7
            SET SMA_CLASS = (CASE 
                                  WHEN SMA_CLASS = 'SMA_0' THEN 1
                                  WHEN SMA_CLASS = 'SMA_1' THEN 2
                                  WHEN SMA_CLASS = 'SMA_2' THEN 3
                ELSE SMA_CLASS
                   END);
         INSERT INTO PRO_RBL_MISDB_PROD.SMA_MOVEMENT_HISTORY
           ( TIMEKEY, CustomerAcID, PREVSTATUS, CURRENTSTATUS )
           ( SELECT v_TIMEKEY ,
                    B.CustomerAcID ,
                    A.SMA_Class ,
                    B.SMA_CLASS 
             FROM PRO_RBL_MISDB_PROD.PrevSMAStatus A
                    RIGHT JOIN tt_SMACLASS_7 B   ON A.CustomerAcID = B.CustomerAcID
              WHERE  B.SMA_CLASS IS NOT NULL
                       AND NVL(A.SMA_Class, ' ') <> NVL(B.SMA_CLASS, ' ') );
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.PREVSMASTATUS ';
         INSERT INTO PRO_RBL_MISDB_PROD.PrevSMAStatus
           ( SELECT v_TIMEKEY ,
                    CustomerAcID ,
                    SMA_CLASS 
             FROM tt_SMACLASS_7  );
         --INSERT INTO PRO.ACCOUNT_MOVEMENT_HISTORY (CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,EffectiveFromTimeKey,EffectiveToTimeKeY)
         --SELECT A.CustomerAcID,A.FinalAssetClassAlt_Key,A.FinalNpaDt,@TIMEKEY,49999 
         --FROM PRO.ACCOUNTCAL_test A  LEFT OUTER JOIN  Pro.ACCOUNT_MOVEMENT_HISTORY B
         --ON A.CustomerAcID=B.CustomerAcID
         --WHERE  ISNULL(A.FinalAssetClassAlt_Key,'')<>ISNULL(B.FinalAssetClassAlt_Key,'') AND B.EffectiveToTimeKeY=49999
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'STD'
          WHERE  SYSASSETCLASSALT_KEY = 1;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'SUB'
          WHERE  SYSASSETCLASSALT_KEY = 2;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'DB1'
          WHERE  SYSASSETCLASSALT_KEY = 3;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'DB2'
          WHERE  SYSASSETCLASSALT_KEY = 4;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'DB3'
          WHERE  SYSASSETCLASSALT_KEY = 5;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'LOS'
          WHERE  SYSASSETCLASSALT_KEY = 6;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'SMA_0'
          WHERE  SMA_CLASS_KEY = 1;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'SMA_1'
          WHERE  SMA_CLASS_KEY = 2;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL_test
            SET CustMoveDescription = 'SMA_2 '
          WHERE  SMA_CLASS_KEY = 3;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST
            SET SMA_CLASS = 'STD'
          WHERE  FinalAssetClassAlt_Key = 1
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST
            SET SMA_CLASS = 'SUB'
          WHERE  FinalAssetClassAlt_Key = 2
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST
            SET SMA_CLASS = 'DB1'
          WHERE  FinalAssetClassAlt_Key = 3
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST
            SET SMA_CLASS = 'DB2'
          WHERE  FinalAssetClassAlt_Key = 4
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST
            SET SMA_CLASS = 'DB3'
          WHERE  FinalAssetClassAlt_Key = 5
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST
            SET SMA_CLASS = 'LOS'
          WHERE  FinalAssetClassAlt_Key = 6
           AND SMA_CLASS IS NULL;
         --IF OBJECT_ID('TEMPDB..tt_ACCOUNT_MOVEMENT_HISTORY_7') IS NOT NULL
         --  DROP TABLE tt_ACCOUNT_MOVEMENT_HISTORY_7
         --  SELECT CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,EffectiveFromTimeKey,EffectiveToTimeKeY  INTO tt_ACCOUNT_MOVEMENT_HISTORY_7
         --  FROM  PRO.ACCOUNTCAL_test 
         --  ALTER TABLE tt_ACCOUNT_MOVEMENT_HISTORY_7 ADD MATCH CHAR(1)
         --  UPDATE tt_ACCOUNT_MOVEMENT_HISTORY_7 SET MATCH='N'
         --	UPDATE A SET MATCH='Y'
         --		FROM  tt_ACCOUNT_MOVEMENT_HISTORY_7 A
         --		INNER JOIN PRO.ACCOUNT_MOVEMENT_HISTORY B   ON A.CustomerAcID=B.CustomerAcID
         --		AND A.FinalAssetClassAlt_Key=B.FinalAssetClassAlt_Key
         --		WHERE B.EffectiveToTimeKey=49999
         --	 UPDATE A SET MATCH='D'
         --			FROM  tt_ACCOUNT_MOVEMENT_HISTORY_7 A
         --			INNER JOIN PRO.ACCOUNT_MOVEMENT_HISTORY B	   ON A.CustomerAcID=B.CustomerAcID
         --			AND A.FinalAssetClassAlt_Key<>B.FinalAssetClassAlt_Key
         --	 WHERE B.EffectiveToTimeKey=49999
         --	 UPDATE B  SET EffectiveToTimeKey=@TIMEKEY-1
         --		FROM tt_ACCOUNT_MOVEMENT_HISTORY_7 A   INNER JOIN PRO.ACCOUNT_MOVEMENT_HISTORY B
         --		ON A.CustomerAcID=B.CustomerAcID 
         --		WHERE A.MATCH='D' AND B.EffectiveToTimeKey=49999
         --	INSERT INTO PRO.ACCOUNT_MOVEMENT_HISTORY (CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,EffectiveFromTimeKey,EffectiveToTimeKeY)
         --	select CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,@TIMEKEY,49999
         --	from tt_ACCOUNT_MOVEMENT_HISTORY_7 where MATCH  in ('N','D')
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY 
                             WHERE  EffectiveFromTimeKey = v_Timekey );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            DBMS_OUTPUT.PUT_LINE('NO NEDD TO INSERT DATA');

         END;
         ELSE

         BEGIN
            IF utils.object_id('TEMPDB..tt_ACCOUNT_MOVEMENT_HISTORY_7') IS NOT NULL THEN
             EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ACCOUNT_MOVEMENT_HISTORY_7 ';
            END IF;
            DELETE FROM tt_ACCOUNT_MOVEMENT_HISTORY_7;
            -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 
            -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
            INSERT INTO tt_ACCOUNT_MOVEMENT_HISTORY_7
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerAcID, FinalAssetClassAlt_Key, FinalNpaDt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, TotOsAcc, MovementFromDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 
            , MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
             )
              ( SELECT UCIF_ID ,
                       RefCustomerID ,
                       SourceSystemCustomerID ,
                       CustomerAcID ,
                       FinalAssetClassAlt_Key ,
                       FinalNpaDt ,
                       EffectiveFromTimeKey ,
                       49999 EffectiveToTimeKey  ,
                       SMA_CLASS MovementFromStatus  ,
                       SMA_CLASS MovementToStatus  ,
                       NVL(Balance, 0) TotOsAcc  ,
                       v_ProcessDate MovementFromDate ,-- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 

                       '2086-11-21' MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE

                FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST  );
            INSERT INTO PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerAcID, FinalAssetClassAlt_Key, FinalNpaDt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, TotOsAcc, MovementFromDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 
            , MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
             )
              ( SELECT A.UCIF_ID ,
                       A.RefCustomerID ,
                       A.SourceSystemCustomerID ,
                       A.CustomerAcID ,
                       A.FinalAssetClassAlt_Key ,
                       A.FinalNpaDt ,
                       A.EffectiveFromTimeKey ,
                       A.EffectiveToTimeKey ,
                       NVL(B.MovementToStatus, A.MovementFromStatus) ,
                       A.MovementToStatus ,
                       NVL(A.TotOsAcc, 0) TotOsAcc  ,
                       A.MovementFromDate ,-- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 

                       A.MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE

                FROM tt_ACCOUNT_MOVEMENT_HISTORY_7 A
                       LEFT JOIN PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY B   ON A.CustomerAcID = B.CustomerAcID
                       AND B.EffectiveToTimeKey = 49999
                 WHERE  (CASE 
                              WHEN B.CustomerAcID IS NULL THEN 1
                              WHEN B.CustomerAcID IS NOT NULL
                                AND A.MOVEMENTFROMSTATUS <> B.MovementToStatus THEN 1   END) = 1 );
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto, utils.dateadd('DD', -1, v_ProcessDate) AS pos_3
            FROM AA ,PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY AA
                   LEFT JOIN tt_ACCOUNT_MOVEMENT_HISTORY_7 B   ON AA.CustomerAcID = B.CustomerAcID
                   AND B.EffectiveToTimeKey = 49999 
             WHERE AA.EffectiveToTimeKey = 49999
              AND B.CustomerAcID IS NULL) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET AA.EffectiveToTimeKey = v_vEffectiveto,
                                         AA.MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
                                          = pos_3;
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto, utils.dateadd('DD', -1, v_ProcessDate) AS pos_3
            FROM AA ,PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND AA.EffectiveFromTimeKey < v_TIMEKEY
              AND EXISTS ( SELECT 1 
                           FROM tt_ACCOUNT_MOVEMENT_HISTORY_7 BB
                            WHERE  AA.CustomerAcID = BB.CustomerAcID
                                     AND BB.EffectiveToTimeKey = 49999

                                     --AND AA.MOVEMENTFROMSTATUS<>BB.MOVEMENTTOSTATUS
                                     AND AA.MovementToStatus <> BB.MOVEMENTTOSTATUS )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                         MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
                                          = pos_3;

         END;
         END IF;
         ---- -- COMMENTED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
         --------UPDATE A SET MovementFromDate=B.DATE
         --------  FROM PRO.ACCOUNT_MOVEMENT_HISTORY  A 
         -------- inner join sysdaymatrix B on A.EffectiveFromTimeKey=B.TimeKey
         -------- UPDATE A SET MovementToDate=B.DATE
         --------  FROM PRO.ACCOUNT_MOVEMENT_HISTORY  A 
         -------- inner join sysdaymatrix B on A.EffectiveToTimeKey=B.TimeKey
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY 
                             WHERE  EffectiveFromTimeKey = v_Timekey );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            DBMS_OUTPUT.PUT_LINE('NO NEDD TO INSERT DATA');

         END;
         ELSE

         BEGIN
            IF utils.object_id('TEMPDB..tt_Customer_MOVEMENT_HISTOR_7') IS NOT NULL THEN
             -----------------Added for DashBoard 04-03-2021
            --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
            EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Customer_MOVEMENT_HISTOR_7 ';
            END IF;
            DELETE FROM tt_Customer_MOVEMENT_HISTOR_7;
            -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 
            -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
            INSERT INTO tt_Customer_MOVEMENT_HISTOR_7
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerName, SysAssetClassAlt_Key, SysNPA_Dt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, totOsCust, MovementFromDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 
            , MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
             )
              ( SELECT UCIF_ID ,
                       RefCustomerID ,
                       SourceSystemCustomerID ,
                       CustomerName ,
                       SysAssetClassAlt_Key ,
                       SysNPA_Dt ,
                       EffectiveFromTimeKey ,
                       49999 EffectiveToTimeKey  ,
                       CustMoveDescription MovementFromStatus  ,
                       CustMoveDescription MovementToStatus  ,
                       NVL(TotOsCust, 0) TotOsCust  ,
                       v_ProcessDate MovementFromDate ,-- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 

                       '2086-11-21' MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE

                FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL_test  );
            INSERT INTO PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerName, SysAssetClassAlt_Key, SysNPA_Dt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, TotOsCust, MovementFromDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 
            , MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
             )
              ( SELECT A.UCIF_ID ,
                       A.RefCustomerID ,
                       A.SourceSystemCustomerID ,
                       A.CustomerName ,
                       A.SysAssetClassAlt_Key ,
                       A.SysNPA_Dt ,
                       A.EffectiveFromTimeKey ,
                       A.EffectiveToTimeKey ,
                       NVL(B.MovementToStatus, A.MovementFromStatus) ,
                       A.MovementToStatus ,
                       NVL(A.TotOsCust, 0) TotOsCust  ,
                       A.MovementFromDate ,-- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE 

                       A.MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE

                FROM tt_Customer_MOVEMENT_HISTOR_7 A
                       LEFT JOIN PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                       AND B.EffectiveToTimeKey = 49999
                 WHERE  (CASE 
                              WHEN B.SourceSystemCustomerID IS NULL THEN 1
                              WHEN B.SourceSystemCustomerID IS NOT NULL
                                AND A.MOVEMENTFROMSTATUS <> B.MovementToStatus THEN 1   END) = 1 );
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto, utils.dateadd('DD', -1, v_ProcessDate) AS pos_3
            FROM AA ,PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY AA
                   LEFT JOIN tt_Customer_MOVEMENT_HISTOR_7 B   ON AA.SourceSystemCustomerID = B.SourceSystemCustomerID
                   AND B.EffectiveToTimeKey = 49999 
             WHERE AA.EffectiveToTimeKey = 49999
              AND B.SourceSystemCustomerID IS NULL) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                         MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
                                          = pos_3;
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto, utils.dateadd('DD', -1, v_ProcessDate) AS pos_3
            FROM AA ,PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND AA.EffectiveFromTimeKey < v_TIMEKEY
              AND EXISTS ( SELECT 1 
                           FROM tt_Customer_MOVEMENT_HISTOR_7 BB
                            WHERE  AA.SourceSystemCustomerID = BB.SourceSystemCustomerID
                                     AND BB.EffectiveToTimeKey = 49999

                                     --AND AA.MOVEMENTFROMSTATUS<>BB.MOVEMENTTOSTATUS
                                     AND AA.MovementToStatus <> BB.MOVEMENTTOSTATUS )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                         MovementToDate -- ADDED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
                                          = pos_3;

         END;
         END IF;
         ---- -- COMMENTED BY AMAR ON 13102021 FOR OPTIMISE - TABIKNG TME TO UPDATE
         ------UPDATE A SET MovementFromDate=B.DATE
         ------  FROM PRO.Customer_MOVEMENT_HISTORY  A 
         ------ inner join sysdaymatrix B on A.EffectiveFromTimeKey=B.TimeKey
         ------ UPDATE A SET MovementToDate=B.DATE
         ------  FROM PRO.Customer_MOVEMENT_HISTORY  A 
         ------ inner join sysdaymatrix B on A.EffectiveToTimeKey=B.TimeKey
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'SMA_MARKING';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_SMACLASS_7 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_SMACLASS_7 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ACCOUNT_MOVEMENT_HISTORY_7 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Customer_MOVEMENT_HISTOR_7 ';
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'SMA_MARKING';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_TEST_04122023" TO "ADF_CDR_RBL_STGDB";
