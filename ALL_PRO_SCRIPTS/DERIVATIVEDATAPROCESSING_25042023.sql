--------------------------------------------------------
--  DDL for Procedure DERIVATIVEDATAPROCESSING_25042023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" 
----/*=========================================
 ---- AUTHER : TRILOKI KHANNA
 ---- CREATE DATE : 27-11-2019
 ---- MODIFY DATE : 27-11-2019
 ---- DESCRIPTION : UPDATE InvestmentDataProcessing
 ---- --EXEC [PRO].[InvestmentDataProcessing] @TIMEKEY=26053
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

BEGIN

   BEGIN
      DECLARE
         --DECLARE @TIMEKEY INT=@TimeKey
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
         UPDATE CurDat_RBL_MISDB_PROD.DerivativeDetail
            SET DPD = 0
          WHERE  EffectiveFromTimeKey <= v_timekey
           AND EffectiveToTimeKey >= v_timekey
           AND NVL(DPD, 0) = 0;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0, 0, 'N', 'N', NULL, NULL
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_DivOverdue = 0,
                                      A.DPD = 0,
                                      A.FLGDEG = 'N',
                                      A.FLGUPG = 'N',
                                      A.DEGREASON = NULL,
                                      A.UPGDATE = NULL;
         /*UPDATE PREVISOU DAY STATUS AS INITIAL STATUS FOR CURRENT DAY */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.FinalAssetClassAlt_Key, B.NPIDt
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A
                JOIN CurDat_RBL_MISDB_PROD.DerivativeDetail B   ON A.DerivativeEntityID = B.DerivativeEntityID
                AND A.EffectiveFromTimeKey <= v_timekey
                AND A.EffectiveToTimeKey >= v_timekey
                AND B.EffectiveFromTimeKey <= v_timekey - 1
                AND B.EffectiveToTimeKey >= v_timekey - 1 ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.InitialAssetAlt_Key = src.FinalAssetClassAlt_Key,
                                      A.InitialNPIDt = src.NPIDt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN Duedate IS NOT NULL THEN utils.datediff('DAY', Duedate, v_PROCESSDATE)
         ELSE 0
            END) AS DPD_DivOverdue
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_DivOverdue = src.DPD_DivOverdue;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DPD_DivOverdue
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD = DPD_DivOverdue;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y', 'DEGRADE BY Derivative Overdue' AS pos_3
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND DPD >= 90) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = 'Y',
                                      A.DEGREASON = pos_3;
         /*---------------UPDATE DEG FLAG AT ACCOUNT LEVEL---------------*/
         /*------------Calculate NpaDt -------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND NVL(A.FLGDEG, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPIDt = v_ProcessDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('DAY', NVL(90, 0), utils.dateadd('DAY', -NVL(DPD, 0), v_ProcessDate)) AS NPIDt
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND NVL(A.FLGDEG, 'N') = 'Y'
           AND A.DEGREASON IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPIDt = src.NPIDt;
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
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND NVL(A.FlgDeg, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         IF utils.object_id('TEMPDB..tt_TEMPMINASSETCLASS_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPMINASSETCLASS_6 ';
         END IF;
         DELETE FROM tt_TEMPMINASSETCLASS_6;
         UTILS.IDENTITY_RESET('tt_TEMPMINASSETCLASS_6');

         INSERT INTO tt_TEMPMINASSETCLASS_6 ( 
         	SELECT UCIC_ID ,
                 MAX(NVL(FinalAssetClassAlt_Key, 1))  FinalAssetClassAlt_Key  ,
                 MIN(NPIDt)  NPIDt  
         	  FROM CurDat_RBL_MISDB_PROD.DerivativeDetail A
         	 WHERE  A.EffectiveFromTimeKey <= v_timekey
                    AND A.EffectiveToTimeKey >= v_timekey
                    AND NVL(FinalAssetClassAlt_Key, 1) > 1
         	  GROUP BY UCIC_ID );
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.FinalAssetClassAlt_Key, A.NPIDt, 'PERCOLATION BY' || ' ' || A.UCIC_ID AS pos_4
         FROM B ,tt_TEMPMINASSETCLASS_6 A
                JOIN CurDat_RBL_MISDB_PROD.DerivativeDetail B   ON B.EffectiveFromTimeKey <= v_timekey
                AND B.EffectiveToTimeKey >= v_timekey
                AND A.UCIC_ID = B.UCIC_ID
                AND B.AssetClass_AltKey = 1 ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      B.NPIDt = src.NPIDt,
                                      B.DEGREASON = pos_4;
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
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE NVL(A.FlgDeg, 'N') <> 'Y'
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey
           AND FinalAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A 
          WHERE NVL(FinalAssetClassAlt_Key, 0) = 0
           AND A.EffectiveFromTimeKey <= v_timekey
           AND A.EffectiveToTimeKey >= v_timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = 1,
                                      A.NPIDt = NULL;
         ------/*------------------UPGRAD CUSTOMER ACCOUNT------------------*/  21022023 ---- Sudesh ---Same Code applied in Pro.UpgradeAccountCustomer
         --UPDATE A SET FLGUPG='N'
         --FROM   [CurDat].[DerivativeDetail] A   
         --WHERE    A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey 
         --IF OBJECT_ID('TEMPDB..#TEMPTABLE') IS NOT NULL
         --      DROP TABLE #TEMPTABLE
         --SELECT A.UCIC_ID,TOTALCOUNT  INTO #TEMPTABLE FROM 
         --(
         --SELECT A.UCIC_ID,COUNT(1) TOTALCOUNT  
         --FROM   [CurDat].[DerivativeDetail] A 
         --WHERE A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey
         --GROUP BY A.UCIC_ID
         --)
         --A INNER JOIN 
         --(
         --SELECT B.UCIC_ID,COUNT(1) TOTALDPD_MAXCOUNT 
         --FROM   [CurDat].[DerivativeDetail] B
         --WHERE (ISNULL(B.DPD,0)<=0 )
         --   and ISNULL(FinalAssetClassAlt_Key,1) not in(1)
         --  AND B.EffectiveFromTimeKey<=@TimeKey and B.EffectiveToTimeKey>=@TimeKey
         -- GROUP BY B.UCIC_ID
         --) B ON A.UCIC_ID=B.UCIC_ID AND A.TOTALCOUNT=B.TOTALDPD_MAXCOUNT
         ------  /*------ UPGRADING CUSTOMER-----------*/
         --UPDATE A SET A.FlgUpg='U'
         --FROM   [CurDat].[DerivativeDetail] A INNER JOIN #TEMPTABLE B ON A.UCIC_ID=B.UCIC_ID
         --WHERE  A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey
         --UPDATE A SET  A.UpgDate=@PROCESSDATE
         --             ,A.DegReason=NULL
         --			 ,A.AssetClass_AltKey=1
         --			 ,A.FlgDeg='N'
         --			 ,A.NPIDt=null
         --             ,A.FlgUpg='U'
         --			 FROM  [CurDat].[DerivativeDetail] A
         --WHERE  ISNULL(A.FlgUpg,'U')='U' 
         --AND A.EffectiveFromTimeKey<=@timekey and A.EffectiveToTimeKey>=@timekey
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'DerivativeDataProcessing';
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
       WHERE  RUNNINGPROCESSNAME = 'DerivativeDataProcessing';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DERIVATIVEDATAPROCESSING_25042023" TO "ADF_CDR_RBL_STGDB";
