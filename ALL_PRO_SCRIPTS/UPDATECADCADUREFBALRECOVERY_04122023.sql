--------------------------------------------------------
--  DDL for Procedure UPDATECADCADUREFBALRECOVERY_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" /*===========================================
AUTHER : TRILOKI KHANN
CREATE DATE : 27-11-2019
MODIFY DATE : 27-11-2019
DESCRIPTION : CALCULATE PREV QTR AND CURRENT QTR CREDIT AND PREV AND CURRENT QTR INT
--EXEC [PRO].[UpdateCADCADURefBalRecovery] 25490
===================================================*/
(
  v_TimeKey IN NUMBER
)
AS
   v_cursor SYS_REFCURSOR;

BEGIN

   BEGIN
      DECLARE
         v_QtrDefinition VARCHAR2(5);
         v_Refdate VARCHAR2(200);
         -- **************************
         -- Code for Qtr Boundry
         -- **************************
         v_Crt_Qtr_StartDt VARCHAR2(200);
         v_Crt_Qtr_EndDt VARCHAR2(200);
         v_Prev_Qtr_StartDt VARCHAR2(200);
         v_Prev_Qtr_EndDt VARCHAR2(200);

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET PreQtrCredit = 0,
                PrvQtrInt = 0,
                CurQtrCredit = 0,
                CurQtrInt = 0;
         SELECT Date_ 

           INTO v_Refdate
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TimeKey;
         IF ( v_Refdate = EOMONTH(v_Refdate) ) THEN

         BEGIN
            UPDATE SysSolutionParameter
               SET ParameterValue = 'Qtr'
             WHERE  EffectiveFromTimeKey <= v_TimeKey
              AND EffectiveToTimeKey >= v_TimeKey
              AND ParameterName = 'QtrDefinition';

         END;
         ELSE

         BEGIN
            UPDATE SysSolutionParameter
               SET ParameterValue = 'Day'
             WHERE  EffectiveFromTimeKey <= v_TimeKey
              AND EffectiveToTimeKey >= v_TimeKey
              AND ParameterName = 'QtrDefinition';

         END;
         END IF;
         -- Qtr condition
         SELECT ParameterValue 

           INTO v_QtrDefinition
           FROM SysSolutionParameter 
          WHERE  EffectiveFromTimeKey <= v_TimeKey
                   AND EffectiveToTimeKey >= v_TimeKey
                   AND ParameterName = 'QtrDefinition';
         IF v_QtrDefinition = 'Qtr' THEN

         BEGIN
            --SELECT @Crt_Qtr_StartDt= DATEADD(DD,1,LastQtrDate),
            --       @Crt_Qtr_EndDt=Date,
            --	   @Prev_Qtr_StartDt=DATEADD(DD,1,LastToLastQtrDate),
            --	   @Prev_Qtr_EndDt= LastQtrDate
            --FROM SysDayMAtrix
            --WHERE TimeKEy=@TimeKey
            SELECT utils.dateadd('DAY', 1, EOMONTH(utils.dateadd('MONTH', -3, Date_))) ,
                   EOMONTH(DATE_) ,
                   utils.dateadd('DAY', 1, EOMONTH(utils.dateadd('MONTH', -6, Date_))) ,
                   EOMONTH(utils.dateadd('MONTH', -3, Date_)) 

              INTO v_Crt_Qtr_StartDt,
                   v_Crt_Qtr_EndDt,
                   v_Prev_Qtr_StartDt,
                   v_Prev_Qtr_EndDt
              FROM SysDayMAtrix 
             WHERE  TimeKEy = v_TimeKey;

         END;
         ELSE

         BEGIN
            SELECT utils.dateadd('MONTH', -3, DATE_) ,
                   Date_ ,
                   utils.dateadd('MONTH', -6, DATE_) ,
                   utils.dateadd('MONTH', 3, utils.dateadd('MONTH', -6, DATE_) - 1) 

              INTO v_Crt_Qtr_StartDt,
                   v_Crt_Qtr_EndDt,
                   v_Prev_Qtr_StartDt,
                   v_Prev_Qtr_EndDt
              FROM SysDayMAtrix 
             WHERE  TimeKEy = v_TimeKey;

         END;
         END IF;
         IF utils.object_id('Tempdb..tt_AcDailyTxnDetail_4') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AcDailyTxnDetail_4 ';
         END IF;
         DELETE FROM tt_AcDailyTxnDetail_4;
         UTILS.IDENTITY_RESET('tt_AcDailyTxnDetail_4');

         INSERT INTO tt_AcDailyTxnDetail_4 ( 
         	SELECT A.* 
         	  FROM AcDailyTxnDetail A
         	 WHERE  TxnType IN ( 'CREDIT','DEBIT' )

                    AND TxnSubType IN ( 'RECOVERY','INTEREST' )

                    AND TxnDate BETWEEN v_Prev_Qtr_StartDt AND v_Crt_Qtr_EndDt );
         EXECUTE IMMEDIATE ' CREATE INDEX tt_AcDailyTxnDetail_4_Ctrl
            ON tt_AcDailyTxnDetail_4 ( EntityKey)';
         EXECUTE IMMEDIATE ' CREATE INDEX tt_AcDailyTxnDetail_4_001_IX
            ON tt_AcDailyTxnDetail_4 ( TxnType,
                                       TxnSubType,
                                       TxnDate)';
         --***********************
         -- Previous Qtr Credit
         --***********************
         WITH CTE_PreQtrCredit ( TxnAmount,
                                 AccountEntityID ) AS ( SELECT SUM(NVL(TxnAmount, 0))  ,
                                                               A.AccountEntityID 
           FROM tt_AcDailyTxnDetail_4 A
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityID = B.AccountEntityID
          WHERE  TxnType = 'CREDIT'
                   AND TxnSubType = 'RECOVERY'
                   AND TxnDate BETWEEN v_Prev_Qtr_StartDt AND v_Prev_Qtr_EndDt

         --AND TxnDate < = (SELECT DataEffectiveToDate FROM SysDataMatrix WHERE TimeKey = @TimeKey)
         GROUP BY A.AccountEntityID ) 
            MERGE INTO FCC 
            USING (SELECT FCC.ROWID row_id, utils.round_(PQC.TxnAmount, 0) AS PreQtrCredit
            FROM FCC ,PRO_RBL_MISDB_PROD.ACCOUNTCAL FCC
                   JOIN CTE_PreQtrCredit PQC   ON FCC.AccountEntityID = PQC.AccountEntityID ) src
            ON ( FCC.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET PreQtrCredit = src.PreQtrCredit
            ;
         --***********************
         -- Previous Qtr Interest
         --***********************
         WITH CTE_PreQtrInterest ( TxnAmount,
                                   AccountEntityID ) AS ( SELECT SUM(NVL(TxnAmount, 0))  ,
                                                                 A.AccountEntityID 
           FROM tt_AcDailyTxnDetail_4 A
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityID = B.AccountEntityID
          WHERE  TxnType = 'DEBIT'
                   AND TxnSubType = 'INTEREST'
                   AND TxnDate BETWEEN v_Prev_Qtr_StartDt AND v_Prev_Qtr_EndDt

         --AND TxnDate < = (SELECT DataEffectiveToDate FROM SysDataMatrix 	WHERE TimeKey = @TimeKey)
         GROUP BY A.AccountEntityID ) 
            MERGE INTO FCC 
            USING (SELECT FCC.ROWID row_id, utils.round_(PQC.TxnAmount, 0) AS PrvQtrInt
            FROM FCC ,PRO_RBL_MISDB_PROD.ACCOUNTCAL FCC
                   JOIN CTE_PreQtrInterest PQC   ON FCC.AccountEntityID = PQC.AccountEntityID ) src
            ON ( FCC.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET PrvQtrInt = src.PrvQtrInt
            ;
         --***********************
         -- Current Qtr Credit
         --***********************
         WITH CTE_CurQtrCredit ( TxnAmount,
                                 AccountEntityID ) AS ( SELECT SUM(NVL(TxnAmount, 0))  ,
                                                               A.AccountEntityID 
           FROM tt_AcDailyTxnDetail_4 A
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityID = B.AccountEntityID
          WHERE  TxnType = 'CREDIT'
                   AND TxnSubType = 'RECOVERY'
                   AND TxnDate BETWEEN v_Crt_Qtr_StartDt AND v_Crt_Qtr_EndDt

         --AND TxnDate < = (SELECT DataEffectiveToDate FROM SysDataMatrix	WHERE TimeKey = @TimeKey)
         GROUP BY A.AccountEntityID ) 
            MERGE INTO FCC 
            USING (SELECT FCC.ROWID row_id, utils.round_(PQC.TxnAmount, 0) AS CurQtrCredit
            FROM FCC ,PRO_RBL_MISDB_PROD.ACCOUNTCAL FCC
                   JOIN CTE_CurQtrCredit PQC   ON FCC.AccountEntityID = PQC.AccountEntityID ) src
            ON ( FCC.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET CurQtrCredit = src.CurQtrCredit
            ;
         --***********************
         -- Current Qtr Interest
         --***********************
         WITH CTE_CurQtrInterest ( TxnAmount,
                                   AccountEntityID ) AS ( SELECT SUM(NVL(TxnAmount, 0))  ,
                                                                 A.AccountEntityID 
           FROM tt_AcDailyTxnDetail_4 A
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityID = B.AccountEntityID
          WHERE  TxnType = 'DEBIT'
                   AND TxnSubType = 'INTEREST'
                   AND TxnDate BETWEEN v_Crt_Qtr_StartDt AND v_Crt_Qtr_EndDt

         --AND TxnDate < = (SELECT DataEffectiveToDate FROM SysDataMatrix 	WHERE TimeKey = @TimeKey)
         GROUP BY A.AccountEntityID ) 
            MERGE INTO FCC 
            USING (SELECT FCC.ROWID row_id, utils.round_(PQC.TxnAmount, 0) AS CurQtrInt
            FROM FCC ,PRO_RBL_MISDB_PROD.ACCOUNTCAL FCC
                   JOIN CTE_CurQtrInterest PQC   ON FCC.AccountEntityID = PQC.AccountEntityID ) src
            ON ( FCC.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET CurQtrInt = src.CurQtrInt
            ;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET PreQtrCredit = 0
          WHERE  PreQtrCredit IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET PrvQtrInt = 0
          WHERE  PrvQtrInt IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET CurQtrCredit = 0
          WHERE  CurQtrCredit IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET CurQtrInt = 0
          WHERE  CurQtrInt IS NULL;

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      OPEN  v_cursor FOR
         SELECT 'Proc Name: ' || NVL(utils.error_procedure, ' ') || ' ErrorMsg: ' || NVL(SQLERRM, ' ') 
           FROM DUAL  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATECADCADUREFBALRECOVERY_04122023" TO "ADF_CDR_RBL_STGDB";
