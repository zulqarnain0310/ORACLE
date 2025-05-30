--------------------------------------------------------
--  DDL for Procedure NPA_DATE_CALCULATION_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" /*=========================================
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
         UPDATE tt_AccountCal_35
            SET InitialNpaDt = NULL
          WHERE  ( InitialNpaDt = '1900-01-01'
           OR InitialNpaDt = '01/01/1900' );
         UPDATE tt_AccountCal_35
            SET FinalNpaDt = NULL
          WHERE  FinalNpaDt = '1900-01-01'
           OR FinalNpaDt = '01/01/1900';
         MERGE INTO tt_AccountCal_35 A
         USING (SELECT A.ROWID row_id, NULL, NULL
         FROM tt_AccountCal_35 A
                JOIN tt_CustomerCal_24 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N'
           AND NVL(A.FLGDEG, 'N') = 'Y' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET InitialNpaDt = NULL,
                                      FinalNpaDt = NULL;
         /*------------CALCULATE NpaDt -------------------------------------*/
         IF utils.object_id('TEMPDB..tt_TEMPTABLEDPD_8') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEDPD_8 ';
         END IF;
         DELETE FROM tt_TEMPTABLEDPD_8;
         UTILS.IDENTITY_RESET('tt_TEMPTABLEDPD_8');

         INSERT INTO tt_TEMPTABLEDPD_8 ( 
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
         	  FROM tt_AccountCal_35 A
         	 WHERE  ( NVL(DPD_IntService, 0) >= NVL(RefPeriodIntService, 0)
                    OR NVL(DPD_NoCredit, 0) >= NVL(RefPeriodNoCredit, 0)
                    OR NVL(DPD_Overdrawn, 0) >= NVL(RefPeriodOverDrawn, 0)
                    OR NVL(DPD_Overdue, 0) >= NVL(RefPeriodOverdue, 0)
                    OR NVL(DPD_Renewal, 0) >= NVL(RefPeriodReview, 0)
                    OR NVL(DPD_StockStmt, 0) >= NVL(RefPeriodStkStatement, 0) ) );
         IF utils.object_id('TEMPDB..tt_TEMPTABLENPA_8') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLENPA_8 ';
         END IF;
         DELETE FROM tt_TEMPTABLENPA_8;
         UTILS.IDENTITY_RESET('tt_TEMPTABLENPA_8');

         INSERT INTO tt_TEMPTABLENPA_8 ( 
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
         	  FROM tt_TEMPTABLEDPD_8 A
                   JOIN tt_AccountCal_35 B   ON A.CustomerAcID = B.CustomerAcID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('DAY', NVL(REFPERIODMAX, 0), utils.dateadd('DAY', -NVL(REFPERIODNPA, 0), v_ProcessDate)) AS FinalNpaDt
         FROM A ,tt_AccountCal_35 A
                JOIN tt_TEMPTABLENPA_8 B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE NVL(A.FLGDEG, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalNpaDt = src.FinalNpaDt;
         ----UPDATE  A  SET FinalNpaDt= DATEADD(DAY,ISNULL(REFPERIODMAX,0),DATEADD(DAY,-ISNULL(DPD_MAX,0),@ProcessDate))
         ----FROM PRO.ACCOUNTCAL A INNER JOIN PRO.CustomerCal B ON A.REFCUSTOMERID=B.REFCUSTOMERID
         ----WHERE (ISNULL(B.FlgProcessing,'N')='N' AND ISNULL(A.FLGDEG,'N')='Y')
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate
         FROM A ,tt_AccountCal_35 A
                JOIN tt_CustomerCal_24 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE A.ASSET_NORM = 'ALWYS_NPA'
           AND NVL(a.FLGDEG, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FINALNPADT = v_ProcessDate;
         /* RESTRUCTURE NPA DATE */
         --UPDATE c
         --	SET c.DEGDATE=C.RestructureDt
         --FROM PRO.ACCOUNTCAL A
         --	INNER JOIN PRO.AdvAcRestructureCal C
         --		ON C.AccountEntityID =A.AccountEntityId
         --WHERE A.FlgDeg='Y' --AND C.FlgDeg ='Y'
         --UPDATE A
         --	SET A.FinalNpaDt=C.RestructureDt
         --	FROM PRO.ACCOUNTCAL A
         --	INNER JOIN PRO.AdvAcRestructureCal C
         --		ON C.AccountEntityID =A.AccountEntityId
         --WHERE A.FlgDeg='Y' 
         /* EXCEPTIONAL UPDATE FORO NPA DATE FOR EXISTING NPA ACCOUNT  */
         MERGE INTO b 
         USING (SELECT b.ROWID row_id, (CASE 
         WHEN PreRestructureNPA_Date IS NOT NULL THEN PreRestructureNPA_Date
         ELSE B.RestructureDt
            END) AS DEGDATE
         FROM b ,tt_AccountCal_35 A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId
              -------and a.CustomerAcID ='Z015DQE_01316307'
               ----INNER JOIN DimParameter D ON D.EffectiveFromTimeKey <=@tIMEKEY AND D.EffectiveToTimeKey>=@tIMEKEY 
               ----	AND D.ParameterAlt_Key=B.RestructureTypeAlt_Key
               ----	AND D.DimParameterName='TypeofRestructuring'

          WHERE ( A.FINALASSETCLASSALT_KEY > 1
           OR a.FlgDeg = 'Y' )

           --added by Prashant --11032024----for NPA Date changed issue-------
           AND NVL(SP_ExpiryExtendedDate, SP_ExpiryDate) >= v_ProcessDate) src
         ON ( b.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET b.DEGDATE --(CASE WHEN ParameterShortNameEnum IN('IRAC' ,'OTHER','PRUDENTIAL')
                                       --			THEN 
                                       ---- WHEN ParameterShortNameEnum IN('MSME_OLD','MSME_COVID','COVID_OTR_RF','COVID_OTR_RF_2','MSME_COVID_RF2')
                                       ----		THEN (CASE WHEN PreRestructureNPA_Date IS NOT NULL 
                                       ----						THEN PreRestructureNPA_Date
                                       ----				ELSE 
                                       ----						B.RestructureDt
                                       ----				END)
                                       ----ELSE A.FinalNpaDt END)
                                       --select a.*
                                       = src.DEGDATE;
         --AND ParameterShortNameEnum IN('IRAC' ,'OTHER','PRUDENTIAL','MSME_OLD','MSME_COVID','COVID_OTR_RF'
         --								,'COVID_OTR_RF_2','MSME_COVID_RF2')
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_RESTR_NPA_7  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_RESTR_NPA_7;
         UTILS.IDENTITY_RESET('tt_RESTR_NPA_7');

         INSERT INTO tt_RESTR_NPA_7 ( 
         	SELECT UcifEntityID ,
                 MIN(CASE 
                          WHEN NVL(a.FinalNpaDt, '2099-12-31') > NVL(b.DegDate, '2099-12-31') THEN b.DegDate
                     ELSE a.FinalNpaDt
                        END)  FinalNpaDt  
         	  FROM tt_AccountCal_35 A
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId
                   JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                   AND D.EffectiveToTimeKey >= v_timekey
                   AND D.ParameterAlt_Key = B.RestructureTypeAlt_Key
                   AND D.DimParameterName = 'TypeofRestructuring'
         	 WHERE  ( A.FINALASSETCLASSALT_KEY > 1
                    OR a.FlgDeg = 'Y' )
         	  GROUP BY UcifEntityID );
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, NVL(A.FinalNpaDt, SysNPA_Dt) AS SysNPA_Dt
         FROM C ,tt_RESTR_NPA_7 A
                JOIN tt_CustomerCal_24 C   ON C.UcifEntityID = A.UcifEntityID 
          WHERE C.SysAssetClassAlt_Key > 1
           OR FlgDeg = 'Y') src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET C.SysNPA_Dt = src.SysNPA_Dt;
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, A.FinalNpaDt
         FROM C ,tt_RESTR_NPA_7 A
                JOIN tt_AccountCal_35 C   ON C.UcifEntityID = A.UcifEntityID 
          WHERE C.FINALASSETCLASSALT_KEY > 1
           OR c.FlgDeg = 'Y') src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET C.FinalNpaDt = src.FinalNpaDt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N'
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_tIMEKEY
                AND D.EffectiveToTimeKey >= v_tIMEKEY
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND A.FlgDeg = 'Y' 
          WHERE D.DimParameterName = 'TypeofRestructuring'
           AND ParameterShortNameEnum NOT IN ( 'PRUDENTIAL','IRAC','OTHER' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgDeg = 'N';
         /*END OF RFESTR WORK */
         /* PUI WORK */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.FLG_DEG, B.NPA_DATE, NVL(DegReason, ' ') || ',' || B.DEFAULT_REASON AS pos_4
         FROM A ,tt_AccountCal_35 A
                JOIN PRO_RBL_MISDB_PROD.PUI_CAL B   ON A.AccountEntityID = B.AccountEntityId 
          WHERE B.FLG_DEG = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgDeg = src.FLG_DEG,
                                      A.FinalNpaDt = src.NPA_DATE,
                                      A.DegReason = pos_4;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.FLG_DEG, B.NPA_DATE, NVL(DegReason, ' ') || ',' || B.DEFAULT_REASON AS pos_4
         FROM A ,tt_CustomerCal_24 A
                JOIN PRO_RBL_MISDB_PROD.PUI_CAL B   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE B.FLG_DEG = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgDeg = src.FLG_DEG,
                                      A.SysNPA_Dt = src.NPA_DATE,
                                      DegReason = pos_4;
         /* END OF PUI WORK */
         /*------MIN NPA DATE CUSTOMER LEVEL ---------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, C.FinalNpaDt, 'Y'
         FROM A ,tt_CustomerCal_24 A
                JOIN ( SELECT A.REFCUSTOMERID ,
                              MIN(A.FinalNpaDt)  FinalNpaDt  
                       FROM tt_AccountCal_35 A
                              JOIN tt_CustomerCal_24 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
                        WHERE  NVL(A.FlgDeg, 'N') = 'Y'
                                 AND NVL(B.FlgProcessing, 'N') = 'N'
                         GROUP BY A.REFCUSTOMERID ) C   ON A.REFCUSTOMERID = C.REFCUSTOMERID
                AND ( NVL(A.FlgProcessing, 'N') = 'N' ) ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysNPA_Dt = src.FinalNpaDt,
                                      A.FlgDeg = 'Y';
         /*-----UPDATE Initial LEVEL InitialNpaDt IS SET NULL FOR Fresh Npa Accounts---------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SysNPA_Dt
         FROM A ,tt_AccountCal_35 A
                JOIN tt_CustomerCal_24 B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE NVL(A.ASSET_NORM, 'NORMAL') <> 'ALWYS_STD'
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

  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_DATE_CALCULATION_21082024" TO "ADF_CDR_RBL_STGDB";
