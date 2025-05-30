--------------------------------------------------------
--  DDL for Procedure NPA_DATE_CALCULATION_09102021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : CALCULATED NPA DATE 
 --EXEC [PRO].[NPA_DATE_CALCULATION]  @TIMEKEY=25841
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_INTTSERNORM --'PROGRESSIVE'
          VARCHAR2(50) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'RECOVERYADJUSTMENT'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET InitialNpaDt = NULL
          WHERE  ( InitialNpaDt = '1900-01-01'
           OR InitialNpaDt = '01/01/1900' );
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FinalNpaDt = NULL
          WHERE  FinalNpaDt = '1900-01-01'
           OR FinalNpaDt = '01/01/1900';
         MERGE INTO PRO_RBL_MISDB_PROD.ACCOUNTCAL 
         USING (SELECT PRO_RBL_MISDB_PROD.ACCOUNTCAL.ROWID row_id, NULL, NULL
         FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N'
           AND NVL(A.FlgDeg, 'N') = 'Y' )) src
         ON ( PRO_RBL_MISDB_PROD.ACCOUNTCAL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET InitialNpaDt = NULL,
                                      FinalNpaDt = NULL;
         /*------------CALCULATE NpaDt -------------------------------------*/
         IF utils.object_id('TEMPDB..tt_TEMPTABLEDPD_5') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEDPD_5 ';
         END IF;
         DELETE FROM tt_TEMPTABLEDPD_5;
         UTILS.IDENTITY_RESET('tt_TEMPTABLEDPD_5');

         INSERT INTO tt_TEMPTABLEDPD_5 ( 
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
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
         	 WHERE  ( NVL(DPD_IntService, 0) >= NVL(RefPeriodIntService, 0)
                    OR NVL(DPD_NoCredit, 0) >= NVL(RefPeriodNoCredit, 0)
                    OR NVL(DPD_Overdrawn, 0) >= NVL(RefPeriodOverDrawn, 0)
                    OR NVL(DPD_Overdue, 0) >= NVL(RefPeriodOverdue, 0)
                    OR NVL(DPD_Renewal, 0) >= NVL(RefPeriodReview, 0)
                    OR NVL(DPD_StockStmt, 0) >= NVL(RefPeriodStkStatement, 0) ) );
         IF utils.object_id('TEMPDB..tt_TEMPTABLENPA_5') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLENPA_5 ';
         END IF;
         DELETE FROM tt_TEMPTABLENPA_5;
         UTILS.IDENTITY_RESET('tt_TEMPTABLENPA_5');

         INSERT INTO tt_TEMPTABLENPA_5 ( 
         	SELECT A.CustomerAcID ,
                 CASE 
                      WHEN ( NVL(A.DPD_IntService, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_IntService, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(a.DPD_IntService, 0)
                      WHEN ( NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_NoCredit, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(a.DPD_NoCredit, 0)
                      WHEN ( NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_Overdrawn, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(a.DPD_Overdrawn, 0)
                      WHEN ( NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_Overdue, 0)
                        AND NVL(A.DPD_Renewal, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(a.DPD_Renewal, 0)
                      WHEN ( NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_NoCredit, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_IntService, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Overdrawn, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_Renewal, 0)
                        AND NVL(A.DPD_Overdue, 0) >= NVL(A.DPD_StockStmt, 0) ) THEN NVL(a.DPD_Overdue, 0)
                 ELSE NVL(a.DPD_StockStmt, 0)
                    END REFPERIODNPA  
         	  FROM tt_TEMPTABLEDPD_5 A
                   JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.CustomerAcID = B.CustomerAcID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('DAY', NVL(REFPERIODMAX, 0), utils.dateadd('DAY', -NVL(REFPERIODNPA, 0), v_ProcessDate)) AS FinalNpaDt
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN tt_TEMPTABLENPA_5 B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE NVL(A.FlgDeg, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FinalNpaDt = src.FinalNpaDt;
         ----UPDATE  A  SET FinalNpaDt= DATEADD(DAY,ISNULL(REFPERIODMAX,0),DATEADD(DAY,-ISNULL(DPD_MAX,0),@ProcessDate))
         ----FROM PRO.ACCOUNTCAL A INNER JOIN PRO.CustomerCal B ON A.REFCUSTOMERID=B.REFCUSTOMERID
         ----WHERE (ISNULL(B.FlgProcessing,'N')='N' AND ISNULL(A.FLGDEG,'N')='Y')
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE A.Asset_Norm = 'ALWYS_NPA'
           AND NVL(a.FlgDeg, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FINALNPADT = v_ProcessDate;
         /*------MIN NPA DATE CUSTOMER LEVEL ---------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, C.FinalNpaDt, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN ( SELECT A.RefCustomerID ,
                              MIN(A.FinalNpaDt)  FinalNpaDt  
                       FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                              JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
                        WHERE  NVL(A.FlgDeg, 'N') = 'Y'
                                 AND NVL(B.FlgProcessing, 'N') = 'N'
                         GROUP BY A.RefCustomerID ) C   ON A.RefCustomerID = C.REFCUSTOMERID
                AND ( NVL(A.FlgProcessing, 'N') = 'N' ) ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysNPA_Dt = src.FinalNpaDt,
                                      A.FlgDeg = 'Y';
         /*-----UPDATE Initial LEVEL InitialNpaDt IS SET NULL FOR Fresh Npa Accounts---------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SysNPA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD'
           AND NVL(A.FlgDeg, 'N') = 'Y'
           AND NVL(B.FlgProcessing, 'N') = 'N') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FINALNPADT = src.SysNPA_Dt;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'NPA_Date_Calculation';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'NPA_Date_Calculation';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_09102021" TO "ADF_CDR_RBL_STGDB";
