--------------------------------------------------------
--  DDL for Procedure MAXDPD_REFERENCEPERIOD_CALCULATION_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" /*=========================================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : CALCULATED MAX DPD AND REGARD OF REFERENCE PERIOD ON  MAX DPD
 --EXEC [Pro].[MaxDPD_ReferencePeriod_Calculation] 25140
==============================================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN

      BEGIN
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_80') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_80 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_80;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_80');

         INSERT INTO tt_TEMPTABLE_80 ( 
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

         	  --FROM PRO.ACCOUNTCAL A inner join pro.CustomerCal B on a.RefCustomerID=b.RefCustomerID
         	  FROM tt_ACCOUNTCAL_45 A
                   JOIN tt_CustomerCal_22 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
         	 WHERE  ( NVL(DPD_IntService, 0) >= NVL(RefPeriodIntService, 0)
                    OR NVL(DPD_NoCredit, 0) >= NVL(RefPeriodNoCredit, 0)
                    OR NVL(DPD_Overdrawn, 0) >= NVL(RefPeriodOverDrawn, 0)
                    OR NVL(DPD_Overdue, 0) >= NVL(RefPeriodOverdue, 0)
                    OR NVL(DPD_Renewal, 0) >= NVL(RefPeriodReview, 0)
                    OR NVL(DPD_StockStmt, 0) >= NVL(RefPeriodStkStatement, 0) )
                    AND ( NVL(B.FlgProcessing, 'N') = 'N' ) );
         --and A.RefCustomerID<>'0'
         /*--------------INTIAL MAX DPD 0 FOR RE PROCESSING DATA-------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0
         FROM A ,tt_ACCOUNTCAL_45 A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_Max = 0;
         --inner join PRO.CUSTOMERCAL B on A.RefCustomerID=B.RefCustomerID
         --WHERE  isnull(B.FlgProcessing,'N')='N'  
         /*----------------FIND MAX DPD---------------------------------------*/
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
         FROM A ,tt_ACCOUNTCAL_45 a
              --INNER JOIN PRO.CUSTOMERCAL C ON C.RefCustomerID=a.RefCustomerID

                JOIN tt_CustomerCal_22 C   ON C.SourceSystemCustomerID = a.SourceSystemCustomerID 
          WHERE ( NVL(C.FlgProcessing, 'N') = 'N' )
           AND ( NVL(A.DPD_IntService, 0) > 0
           OR NVL(A.DPD_Overdrawn, 0) > 0
           OR NVL(A.DPD_Overdue, 0) > 0
           OR NVL(A.DPD_Renewal, 0) > 0
           OR NVL(A.DPD_StockStmt, 0) > 0
           OR NVL(DPD_NoCredit, 0) > 0 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_Max = src.DPD_Max;
         /*----------------DPD_FinMaxType ---------------------------------------*/
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, (CASE 
         WHEN ( NVL(A.DPD_IntService, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN 'RefPeriodIntService'
         WHEN ( NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN 'RefPeriodNoCredit'
         WHEN ( NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN 'RefPeriodOverDrawn'
         WHEN ( NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdue, 0)
           AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN 'RefPeriodReview'
         WHEN ( NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_NoCredit, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_IntService, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Overdrawn, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Renewal, 0)
           AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN 'RefPeriodOverdue'
         ELSE 'RefPeriodStkStatement'
            END) AS DPD_FinMaxType
         FROM a ,tt_ACCOUNTCAL_45 a
              --INNER JOIN PRO.CUSTOMERCAL C ON C.RefCustomerID=a.RefCustomerID

                JOIN tt_CustomerCal_22 C   ON C.SourceSystemCustomerID = a.SourceSystemCustomerID 
          WHERE ( NVL(C.FlgProcessing, 'N') = 'N' )
           AND ( NVL(A.DPD_INTSERVICE, 0) > 0
           OR NVL(A.DPD_OVERDRAWN, 0) > 0
           OR NVL(A.DPD_OVERDUE, 0) > 0
           OR NVL(A.DPD_RENEWAL, 0) > 0
           OR NVL(A.DPD_STOCKSTMT, 0) > 0
           OR NVL(DPD_NOCREDIT, 0) > 0 )) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET a.DPD_FinMaxType = src.DPD_FinMaxType;
         /*-------Update REFPeriodMax---------------------------*/
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_802') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE2_5 ';
         END IF;
         DELETE FROM tt_TEMPTABLE2_5;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE2_5');

         INSERT INTO tt_TEMPTABLE2_5 ( 
         	SELECT A.CustomerAcID ,
                 CASE 
                      WHEN ( NVL(A.DPD_IntService, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(RefPeriodIntService, 0)
                      WHEN ( NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(RefPeriodNoCredit, 0)
                      WHEN ( NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(RefPeriodOverDrawn, 0)
                      WHEN ( NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(RefPeriodReview, 0)
                      WHEN ( NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(RefPeriodOverdue, 0)
                 ELSE NVL(RefPeriodStkStatement, 0)
                    END REFPERIOD  
         	  FROM tt_TEMPTABLE_80 A
                   JOIN tt_ACCOUNTCAL_45 B   ON A.CustomerAcID = B.CustomerAcID
                 --INNER JOIN PRO.CUSTOMERCAL C ON C.RefCustomerID=B.RefCustomerID

                   JOIN tt_CustomerCal_22 C   ON C.SourceSystemCustomerID = B.SourceSystemCustomerID
         	 WHERE  ( NVL(C.FLGPROCESSING, 'N') = 'N' ) );
         /*------- INTIAL REFPERIODMAX 0 FOR RE-PROCESSING----- */
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 0
         FROM B ,tt_TEMPTABLE2_5 A
                JOIN tt_ACCOUNTCAL_45 B   ON A.CustomerAcID = B.CustomerAcID
              --INNER JOIN PRO.CUSTOMERCAL C ON C.RefCustomerID=B.RefCustomerID

                JOIN tt_CustomerCal_22 C   ON C.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( NVL(C.FLGPROCESSING, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.REFPERIODMAX = 0;
         /*----CALCULATE REFPERIODMAX  REGARDING MAX DPD--------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.REFPERIOD
         FROM B ,tt_TEMPTABLE2_5 A
                JOIN tt_ACCOUNTCAL_45 B   ON A.CustomerAcID = B.CustomerAcID
              --INNER JOIN PRO.CUSTOMERCAL C ON C.RefCustomerID=B.RefCustomerID

                JOIN tt_CustomerCal_22 C   ON C.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( NVL(C.FLGPROCESSING, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.REFPERIODMAX = src.REFPERIOD;
         --AND B.Balance>0
         /*---FOR HANDING NULL REFERENCE PERIOD ----------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.RefPeriodOverdue, 0) AS REFPeriodMax
         FROM A ,tt_ACCOUNTCAL_45 A 
          WHERE NVL(FlgDeg, 'N') = 'Y'
           AND NVL(InitialAssetClassAlt_Key, 1) = 1
           AND Balance > 0
           AND NVL(REFPeriodMax, 0) = 0
           AND NVL(DPD_Max, 0) < NVL(RefPeriodOverdue, 0)
           AND FacilityType IN ( 'TL','DL','BP','BD','PC' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.REFPeriodMax = src.REFPeriodMax;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.RefPeriodIntService, 0) AS REFPeriodMax
         FROM A ,tt_ACCOUNTCAL_45 A 
          WHERE NVL(FlgDeg, 'N') = 'Y'
           AND NVL(InitialAssetClassAlt_Key, 1) = 1
           AND Balance > 0
           AND NVL(DPD_Max, 0) < NVL(RefPeriodIntService, 0)
           AND FacilityType IN ( 'CC','OD' )

           AND NVL(REFPeriodMax, 0) = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.REFPeriodMax = src.REFPeriodMax;
         ----Added By Triloki 10/06/2021  But if ALL DPD ZERO than REFPeriodMax is null---
         UPDATE tt_ACCOUNTCAL_45
            SET REFPeriodMax = RefPeriodNoCredit
          WHERE  REFPeriodMax IS NULL
           AND DPD_FinMaxType = 'RefPeriodNoCredit';
         UPDATE tt_ACCOUNTCAL_45
            SET REFPeriodMax = RefPeriodOverdue
          WHERE  REFPeriodMax IS NULL
           AND DPD_FinMaxType = 'RefPeriodOverdue';
         UPDATE tt_ACCOUNTCAL_45
            SET REFPeriodMax = RefPeriodOverDrawn
          WHERE  REFPeriodMax IS NULL
           AND DPD_FinMaxType = 'RefPeriodOverDrawn';
         UPDATE tt_ACCOUNTCAL_45
            SET REFPeriodMax = RefPeriodStkStatement
          WHERE  REFPeriodMax IS NULL
           AND DPD_FinMaxType = 'RefPeriodStkStatement';
         UPDATE tt_ACCOUNTCAL_45
            SET REFPeriodMax = RefPeriodReview
          WHERE  REFPeriodMax IS NULL
           AND DPD_FinMaxType = 'RefPeriodReview';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'MaxDPD_ReferencePeriod_Calculation';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_80 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE2_5 ';

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
       WHERE  RUNNINGPROCESSNAME = 'MaxDPD_ReferencePeriod_Calculation';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MAXDPD_REFERENCEPERIOD_CALCULATION_21082024" TO "ADF_CDR_RBL_STGDB";
