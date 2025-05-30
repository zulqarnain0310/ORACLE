--------------------------------------------------------
--  DDL for Procedure REFERENCE_PERIOD_CALCULATION_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" /*=========================================
 AUTHER : TRILOKIKHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : Calculation Reference Period WITH HELPOF REFPERIOD
 --EXEC [pro].[Reference_Period_Calculation] @TIMEKEY=25202 
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN

      BEGIN
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntService int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_NoCredit int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdrawn int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdue int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Renewal int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_StockStmt int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Max int 
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_FinMaxType varchar(50)
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_SMA int 
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_PrincOverdue int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntOverdueSince int
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_OtherOverdueSince int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_IntService')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntService int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_NoCredit')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_NoCredit int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Overdrawn')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdrawn int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Overdue')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Overdue int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Renewal')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Renewal int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_StockStmt')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_StockStmt int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_Max')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_Max int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_FinMaxType')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_FinMaxType varchar(50)
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_SMA')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_SMA int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_PrincOverdue')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_PrincOverdue int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_IntOverdueSince')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_IntOverdueSince int
         --if NOT exists (SELECT * FROM   RBL_MISDB.INFORMATION_SCHEMA.COLUMNS 
         --WHERE  TABLE_NAME = N'ACCOUNTCAL'   AND  COLUMN_NAME = 'DPD_OtherOverdueSince')
         --ALTER TABLE PRO.ACCOUNTCAL ADD DPD_OtherOverdueSince int
         UPDATE tt_ACCOUNTCAL_54
            SET REFPERIODOVERDUE = 0,
                REFPERIODOVERDRAWN = 0,
                REFPERIODNOCREDIT = 0,
                REFPERIODINTSERVICE = 0,
                REFPERIODSTKSTATEMENT = 0,
                REFPERIODREVIEW = 0;
         /*   -- BELOW CODE COMMENTED - BEXOS AS PER DISCUSSIONS ASSET NOR WILL BE USED FROM ACCOUNT SOURCE DATA
         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'  AND B.ProductSubGroup=''AGRI366'''  
         WHERE BusinessRule='RefPeriodAgr366' 

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET A.RefPeriodoverdue= '+CAST(RefValue AS varchar)+' ,A.RefPeriodOverDrawn= '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit= '+CAST(RefValue AS varchar)+',A.RefPeriodIntService= '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+' AND B.ProductSubGroup=''AGRI456'''  
         WHERE BusinessRule='RefPeriodAgr456'

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET A.RefPeriodoverdue= '+CAST(RefValue AS varchar)+' ,A.RefPeriodOverDrawn= '+CAST(RefValue AS VARCHAR)+' ,A.RefPeriodNoCredit= '+CAST(RefValue AS varchar)+' ,A.RefPeriodIntService= '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+' AND B.ProductSubGroup=''AGRI731'''  
         WHERE BusinessRule='RefPeriodAgr731'

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'  AND  B.NPANorms=''DPD61'''
         WHERE BusinessRule='DPD61' 

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'  AND  B.NPANorms=''DPD91'''
         WHERE BusinessRule='DPD91'

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'  AND  B.NPANorms=''DPD181'''
         WHERE BusinessRule='DPD181'

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'  AND  B.NPANorms=''DPD366'''
         WHERE BusinessRule='DPD366'


         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_K-ey=B.ProductAlt_Key AND A.SourceAlt_Key=3 and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'   AND  B.NPANorms=''DPD91'''

         WHERE BusinessRule='ECBF_90'

         UPDATE PRO.RefPeriod SET LogicSql='UPDATE A SET  A.RefPeriodoverdue    = '+CAST(RefValue AS varchar)+',A.RefPeriodOverDrawn  = '+CAST(RefValue AS VARCHAR)+',A.RefPeriodNoCredit     = '+CAST(RefValue AS varchar)+',A.RefPeriodIntService = '+CAST(RefValue AS varchar)+'
         FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B ON A.ProductAlt_Key=B.ProductAlt_Key AND A.SourceAlt_Key=3 and B.EffectiveFromTimeKey<='+cast(@TIMEKEY as varchar)+' AND B.EffectiveToTimeKey>='+cast(@TIMEKEY as varchar)+'  AND  B.NPANorms=''DPD366'''
         WHERE BusinessRule='ECBF_365'

         */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.ReferencePeriod, B.ReferencePeriod, B.ReferencePeriod, B.ReferencePeriod
         FROM A ,tt_ACCOUNTCAL_54 A
                JOIN ADVACBASICDETAIL B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID
                AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.REFPERIODOVERDUE = src.ReferencePeriod,
                                      A.REFPERIODOVERDRAWN = src.ReferencePeriod,
                                      A.REFPERIODNOCREDIT = src.ReferencePeriod,
                                      A.REFPERIODINTSERVICE = src.ReferencePeriod;
         --IF OBJECT_ID('TEMPDB..#TEMPTABLE') IS NOT NULL
         --DROP TABLE #TEMPTABLE
         --SELECT IDENTITY(INT,1,1) ID ,LOGICSQL INTO #TEMPTABLE FROM PRO.REFPERIOD 
         --WHERE (LOGICSQL IS NOT NULL AND LOGICSQL<>'')
         --DECLARE @START INT=1 ,@TOTALCOUNT INT=(SELECT COUNT(1) FROM #TEMPTABLE)
         --DECLARE @RESULT VARCHAR(MAX)
         --WHILE(@START<=@TOTALCOUNT)
         --BEGIN
         --  SET @RESULT=(SELECT LOGICSQL FROM #TEMPTABLE WHERE ID=@START)
         --  EXEC (@RESULT)
         --  SET @START=@START+1
         --END
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 91
         FROM A ,tt_ACCOUNTCAL_54 A 
          WHERE RefPeriodOverdue = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RefPeriodOverdue = 91;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 91
         FROM A ,tt_ACCOUNTCAL_54 A 
          WHERE RefPeriodOverDrawn = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RefPeriodOverDrawn = 91;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 91
         FROM A ,tt_ACCOUNTCAL_54 A 
          WHERE RefPeriodNoCredit = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RefPeriodNoCredit = 91;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 91
         FROM A ,tt_ACCOUNTCAL_54 A 
          WHERE RefPeriodIntService = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RefPeriodIntService = 91;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 181
         FROM A ,tt_ACCOUNTCAL_54 A 
          WHERE RefPeriodStkStatement = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RefPeriodStkStatement = 181;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 181
         FROM A ,tt_ACCOUNTCAL_54 A 
          WHERE RefPeriodReview = 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RefPeriodReview = 181;
         --UPDATE A SET 
         -- A.RefPeriodOverDrawn    = 32677
         --,A.RefPeriodNoCredit     = 32677
         --,A.RefPeriodIntService   = 32677
         ----,A.RefPeriodStkStatement = 32677
         ----,A.RefPeriodReview       = 32677
         --FROM PRO.ACCOUNTCAL A 
         --WHERE FACILITYTYPE IN ('BD','BP','PC','TL','DL')
         --UPDATE A SET  
         --A.RefPeriodoverdue    = 365,
         --A.RefPeriodOverDrawn  = 365,
         --A.RefPeriodNoCredit   = 365,
         --A.RefPeriodIntService = 365 
         --FROM PRO.ACCOUNTCAL A INNER JOIN DimProduct B
         --ON A.ProductAlt_Key=B.ProductAlt_Key 
         --AND B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY  
         --AND B.ProductSubGroup IN('KCC')  
         ----DROP TABLE #TEMPTABLE
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Reference_Period_Calculation';

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
       WHERE  RUNNINGPROCESSNAME = 'Reference_Period_Calculation';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."REFERENCE_PERIOD_CALCULATION_21082024" TO "ADF_CDR_RBL_STGDB";
