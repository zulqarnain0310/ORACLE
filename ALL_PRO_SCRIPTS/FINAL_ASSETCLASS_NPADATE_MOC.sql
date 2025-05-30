--------------------------------------------------------
--  DDL for Procedure FINAL_ASSETCLASS_NPADATE_MOC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION :UPDATE FINAL ASSET CLASS AND MIN NPA DATE UPDATE CUSTOMER LEVEL AT ACCOUNT LEVEL
 EXEC [PRO].[Final_AssetClass_Npadate] 25233
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         --DECLARE @PANCARDFLAG CHAR(1)=(SELECT REFVALUE FROM PRO.REFPERIOD WHERE BUSINESSRULE='PANCARDNO' AND EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND EFFECTIVETOTIMEKEY>=@TIMEKEY)
         --DECLARE @AADHARCARDFLAG CHAR(1)=(SELECT REFVALUE FROM PRO.REFPERIOD WHERE BUSINESSRULE='AADHARCARD' AND EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND EFFECTIVETOTIMEKEY>=@TIMEKEY)
         v_PANCARDFLAG CHAR(1) := ( SELECT 'Y' 
           FROM solutionglobalparameter 
          WHERE  ParameterName = 'PAN Aadhar Dedup Integration'
                   AND ParameterValueAlt_Key = 1
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_AADHARCARDFLAG CHAR(1) := ( SELECT 'Y' 
           FROM solutionglobalparameter 
          WHERE  ParameterName = 'PAN Aadhar Dedup Integration'
                   AND ParameterValueAlt_Key = 1
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_JointAccountFlag CHAR(1) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'Joint Account'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_UCFICFlag CHAR(1) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'UCFIC'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         ---------------------------------------------------------------------
         --START OF MODIFICATION--HANDLING OF ACCOUNTS WITH FUTURE NPA DATE
         ---------------------------------------------------------------------
         v_REF_DATE VARCHAR2(200) := ( SELECT Date_ 
           FROM RBL_MISDB_PROD.Automate_Advances 
          WHERE  EXT_FLG = 'Y' );

      BEGIN
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 1
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                AND ( A.FlgProcessing = 'N' ) 
          WHERE A.Asset_Norm = 'ALWYS_STD') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.finalAssetClassAlt_Key = 1;
         /*---update FINALAssetClassAlt_Key  of those account which are not synk customer asset class key---------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CASE 
         WHEN A.Asset_Norm <> 'ALWYS_STD' THEN A.SysAssetClassAlt_Key
         ELSE ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
           FROM DimAssetClass 
          WHERE  DIMASSETCLASS.AssetClassShortName = 'STD'
                   AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                   AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
            END AS finalAssetClassAlt_Key
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.RefCustomerID = B.RefCustomerID
                AND ( NVL(A.FlgProcessing, 'N') = 'N' )
                AND A.RefCustomerID IS NOT NULL ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.finalAssetClassAlt_Key = src.finalAssetClassAlt_Key;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CASE 
         WHEN A.Asset_Norm <> 'ALWYS_STD' THEN A.SysAssetClassAlt_Key
         ELSE ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
           FROM DimAssetClass 
          WHERE  DIMASSETCLASS.AssetClassShortName = 'STD'
                   AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                   AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
            END AS finalAssetClassAlt_Key
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                AND ( NVL(A.FlgProcessing, 'N') = 'N' ) 
          WHERE A.SysAssetClassAlt_Key <> B.FinalAssetClassAlt_Key
           AND B.RefCustomerID IS NULL) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.finalAssetClassAlt_Key = src.finalAssetClassAlt_Key;
         /*---------------NPA DATE UPDATE CUSTOMER TO ACCOUNT LEVEL----------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.SYSNPA_DT
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.ASSET_NORM, 'NORMAL') <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND NVL(A.SysNPA_Dt, ' ') <> NVL(b.FinalNpaDt, ' ')
           AND NVL(A.FlgDeg, 'N') = 'Y') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FinalNpaDt = src.SYSNPA_DT;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL
         FROM A ,tt_AccountCal_18 A 
          WHERE ASSET_NORM = 'ALWYS_STD'
           AND FINALASSETCLASSALT_KEY > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FINALASSETCLASSALT_KEY = 1,
                                      A.FINALNPADT = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL, NULL, NULL
         FROM A ,tt_AccountCal_18 A 
          WHERE A.ASSET_NORM = 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = 1,
                                      A.InitialNpaDt = NULL,
                                      A.FinalNpaDt = NULL,
                                      A.DEGREASON = NULL;
         /*------UPDATING DEG REASON  FOR ACCOUNT WHERE  NO DEFAULT IS THERE------ */
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, NULL
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE A.FLGDEG = 'Y'
           AND B.DEGREASON IS NULL
           AND B.ASSET_NORM <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = NULL;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY OTHER ACCOUNT' AS DEGREASON
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE A.FLGDEG = 'Y'
           AND B.DEGREASON IS NULL
           AND B.ASSET_NORM <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DEGREASON
         FROM A ,tt_AccountCal_18 A
                JOIN tt_CUSTOMERCAL_15 B   ON A.SOURCESYSTEMCUSTOMERID = B.SOURCESYSTEMCUSTOMERID 
          WHERE A.DEGREASON = 'PERCOLATION BY OTHER ACCOUNT') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DEGREASON = src.DEGREASON;
         UPDATE tt_CUSTOMERCAL_15
            SET SysNPA_Dt = v_REF_DATE
          WHERE  NVL(SysNPA_Dt, '1900-01-01') > v_REF_DATE;
         UPDATE tt_AccountCal_18
            SET FinalNpaDt = v_REF_DATE
          WHERE  NVL(FinalNpaDt, '1900-01-01') > v_REF_DATE;
         UPDATE tt_CUSTOMERCAL_15
            SET SysNPA_Dt = v_REF_DATE
          WHERE  SysNPA_Dt IS NULL
           AND SysAssetClassAlt_Key > 1;
         UPDATE tt_AccountCal_18
            SET FinalNpaDt = v_REF_DATE
          WHERE  FinalNpaDt IS NULL
           AND FinalAssetClassAlt_Key > 1;
         /*------------------------------UPDATE UNIFORM ASSET CLASSIFICATION--------------------------------*/
         --IF OBJECT_ID('TEMPDB..tt_TEMPTABLE_UCFIC1_14') IS NOT NULL
         --   DROP TABLE tt_TEMPTABLE_UCFIC1_14
         --/*07072021AMAR COMMENT  ED  JOIN FOR DIMDBSOURCE FOR PERCULATE AT UCIF LEVEL AS DISCUSSED WITH sHARMA SIR AND TRILOKI SIR */
         --SELECT UCIF_ID,MAX(ISNULL(SYSASSETCLASSALT_KEY,1)) SYSASSETCLASSALT_KEY
         --,MIN(SYSNPA_DT) SYSNPA_DT-- ,B.SourceDBName 
         -- INTO tt_TEMPTABLE_UCFIC1_14 FROM PRO.CUSTOMERCAL A
         -- ---INNER JOIN DIMSOURCEDB  B ON B.SourceAlt_Key=A.SourceAlt_Key 
         -- --AND B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY
         --WHERE ( UCIF_ID IS NOT NULL and UCIF_ID<>'0' ) AND  ISNULL(SYSASSETCLASSALT_KEY,1)<>1
         --GROUP BY  UCIF_ID--,B.SourceDBName
         /* MERGING DATA FOR ALL SOURCES FOR FIND LOWEST ASSET CLASS AND MIN NPA DATE */
         IF utils.object_id('TEMPDB..tt_CTE_PERC_13') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_PERC_13 ';
         END IF;
         DELETE FROM tt_CTE_PERC_13;
         UTILS.IDENTITY_RESET('tt_CTE_PERC_13');

         INSERT INTO tt_CTE_PERC_13 ( 
         	SELECT * 
         	  FROM (  /* ADVANCE DATA */
                   SELECT UCIF_ID ,
                          MAX(NVL(SYSASSETCLASSALT_KEY, 1))  SYSASSETCLASSALT_KEY  ,
                          MIN(SYSNPA_DT)  SYSNPA_DT  ,
                          'ADV' PercType  
                   FROM tt_CUSTOMERCAL_15 A
                    WHERE  ( UCIF_ID IS NOT NULL
                             AND UCIF_ID <> '0' )
                             AND NVL(SYSASSETCLASSALT_KEY, 1) <> 1
                     GROUP BY UCIF_ID ) A );
         /*  FIND LOWEST ASSET CLASS AND IN NPA DATE IN AALL SOURCES */
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_UCFIC1_14') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_UCFIC1_14 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_UCFIC1_14;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_UCFIC1_14');

         INSERT INTO tt_TEMPTABLE_UCFIC1_14 ( 
         	SELECT UCIF_ID ,
                 MAX(SYSASSETCLASSALT_KEY)  SYSASSETCLASSALT_KEY  ,
                 MIN(SYSNPA_DT)  SYSNPA_DT  ,
                 'XXX' PercType  
         	  FROM tt_CTE_PERC_13 
         	  GROUP BY UCIF_ID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PercType
         FROM A ,tt_TEMPTABLE_UCFIC1_14 A
                JOIN tt_CTE_PERC_13 B   ON A.UCIF_ID = B.UCIF_ID
                AND A.SYSASSETCLASSALT_KEY = B.SYSASSETCLASSALT_KEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PercType = src.PercType;
         IF  --SQLDEV: NOT RECOGNIZED
         /*  UPDATE LOWEST ASSET CLASS AND MIN NPA DATE IN - ADVANCE DATA */
         IF tt_CTE_PERC_13  --SQLDEV: NOT RECOGNIZED
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SYSASSETCLASSALT_KEY, B.SYSNPA_DT, CASE 
         WHEN A.SysAssetClassAlt_Key = 1
           AND B.SYSASSETCLASSALT_KEY > 1 THEN CASE 
                                                    WHEN B.PercType = 'INV' THEN 'PERCOLATION BY INVESTMENT UCIFID ' || B.UCIF_ID
                                                    WHEN B.PercType = 'DER' THEN 'PERCOLATION BY DERIVATIVE UCIFID ' || B.UCIF_ID
         ELSE A.DegReason
            END
         ELSE A.DegReason
            END AS pos_4
         FROM A ,tt_CUSTOMERCAL_15 A
                JOIN tt_TEMPTABLE_UCFIC1_14 B   ON A.UCIF_ID = B.UCIF_ID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.SysAssetClassAlt_Key = src.SYSASSETCLASSALT_KEY,
                                      A.SysNPA_Dt = src.SYSNPA_DT,
                                      A.DegReason = pos_4;
         IF  --SQLDEV: NOT RECOGNIZED
         /* END OF PERCOLATION WORK */
         IF tt_TEMPTABLE_UCFIC1_14  --SQLDEV: NOT RECOGNIZED
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS pos_2, B.SysNPA_Dt
         FROM A ,tt_AccountCal_18 A
                JOIN tt_CUSTOMERCAL_15 B   ON A.RefCustomerID = B.RefCustomerID
                AND A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.SysAssetClassAlt_Key, 1) <> 1
           AND B.RefCustomerID <> '0') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS pos_2, B.SysNPA_Dt
         FROM A ,tt_AccountCal_18 A
                JOIN tt_CUSTOMERCAL_15 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.SysAssetClassAlt_Key, 1) <> 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS pos_2, B.SysNPA_Dt
         FROM A ,tt_AccountCal_18 A
                JOIN tt_CUSTOMERCAL_15 B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE NVL(B.SysAssetClassAlt_Key, 1) <> 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DEGREASON
         FROM A ,tt_AccountCal_18 A
                JOIN tt_CUSTOMERCAL_15 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FLGDEG = 'N' )
           AND B.DegReason IS NOT NULL
           AND A.FinalAssetClassAlt_Key > 1
           AND A.DegReason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DEGREASON = src.DEGREASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DEGREASON
         FROM A ,tt_AccountCal_18 A
                JOIN tt_CUSTOMERCAL_15 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FLGDEG = 'N' )
           AND B.DegReason IS NOT NULL
           AND A.FinalAssetClassAlt_Key > 1
           AND A.DegReason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DEGREASON = src.DEGREASON;
         ----UPDATE A SET DegReason='PERCOLATION BY UCIFID ' + ' ' + B.SourceDBName + '  ' + B.UCIF_ID 
         ----FROM PRO.CustomerCal A INNER JOIN tt_TEMPTABLE_UCFIC1_14 B ON A.UCIF_ID=B.UCIF_ID
         ----WHERE A.SrcAssetClassAlt_Key=1 AND A.SysAssetClassAlt_Key>1
         ----AND A.DegReason IS NULL
         ---- IF OBJECT_ID('TEMPDB..#TEMPTABLE_UCFICDbtDt') IS NOT NULL
         ----   DROP TABLE #TEMPTABLE_UCFICDbtDt
         ----SELECT UcifEntityID,DbtDt
         ---- INTO #TEMPTABLE_UCFICDbtDt FROM PRO.CUSTOMERCAL
         ----WHERE ( UCIF_ID IS NOT NULL and UCIF_ID<>'0' ) AND  ISNULL(SYSASSETCLASSALT_KEY,1) IN(3,4,5)
         ---- AND DbtDt IS NOT NULL 
         ----GROUP BY  UcifEntityID,DbtDt
         ---- UPDATE B SET DbtDt =A.DbtDt FROM #TEMPTABLE_UCFICDbtDt A
         ----INNER JOIN PRO.CUSTOMERCAL B ON A.UcifEntityID=B.UcifEntityID	 AND B.DbtDt IS NULL
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.SYSNPA_DT
         FROM B ,tt_CUSTOMERCAL_15 A
                JOIN tt_AccountCal_18 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.ASSET_NORM, 'NORMAL') <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND NVL(A.SysNPA_Dt, ' ') <> NVL(b.FinalNpaDt, ' ')
           AND NVL(A.FlgDeg, 'N') = 'N'
           AND A.RefCustomerID <> '0') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FinalNpaDt = src.SYSNPA_DT;
         /*---------------UPDATE ASSET CLASS STD WHERE ASSET NORM ALWAYS STD---------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL, NULL, NULL
         FROM A ,tt_AccountCal_18 A 
          WHERE A.ASSET_NORM = 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = 1,
                                      A.InitialNpaDt = NULL,
                                      A.FinalNpaDt = NULL,
                                      A.DEGREASON = NULL;
         ---UPDATE  MULTIPLE   DegReason IN PRO.CUSTOMERCAL TABLE-------
         IF utils.object_id('TEMPDB..tt_Data_14') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Data_14 ';
         END IF;
         DELETE FROM tt_Data_14;
         UTILS.IDENTITY_RESET('tt_Data_14');

         INSERT INTO tt_Data_14 ( 
         	SELECT DISTINCT DegReason ,
                          SourceSystemCustomerID 
         	  FROM tt_AccountCal_18 
         	 WHERE  DegReason IS NOT NULL
                    AND FLGDEG = 'Y' );
         IF utils.object_id('TEMPDB..tt_DD_4') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_DD_4 ';
         END IF;
         DELETE FROM tt_DD_4;
         UTILS.IDENTITY_RESET('tt_DD_4');

         INSERT INTO tt_DD_4 SELECT SourceSystemCustomerID ,
                                    DegReason ,
                                    ROW_NUMBER() OVER ( PARTITION BY SourceSystemCustomerID ORDER BY SourceSystemCustomerID  ) RN  
              FROM tt_Data_14 ;
         IF utils.object_id('TEMPDB..tt_NPADegReason_14') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_NPADegReason_14 ';
         END IF;
         DELETE FROM tt_NPADegReason_14;
         UTILS.IDENTITY_RESET('tt_NPADegReason_14');

         INSERT INTO tt_NPADegReason_14 ( 
         	SELECT PivotTable.SourceSystemCustomerID,
                 MAX( DECODE( , , PivotTable.aggregate, NULL) ) "Pivot Column"                                
         	  FROM ( 
         	     SELECT SourceSystemCustomerID ,
                      , 
                       aggregate
         	       FROM tt_DD_4 ( SELECT PivotTable.SourceSystemCustomerID,
         	         MAX( DECODE( , , PivotTable.aggregate, NULL) ) "Pivot Column"                                
         	  FROM ( 
         	     SELECT SourceSystemCustomerID ,
         	            , 
         	             aggregate
         	       FROM 
         	      GROUP BY SourceSystemCustomerID,
         	 ) PivotTable 
         	 GROUP BY PivotTable.SourceSystemCustomerID ) a
         	      GROUP BY SourceSystemCustomerID,
         	 ) PivotTable 
         	 GROUP BY PivotTable.SourceSystemCustomerID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,tt_CUSTOMERCAL_15 A
                JOIN tt_NPADegReason_14 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                AND A.FlgDeg = 'Y' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         UPDATE tt_CUSTOMERCAL_15
            SET FlgUpg = 'N'
          WHERE  SrcAssetClassAlt_Key = 1
           AND SysAssetClassAlt_Key > 1;
         UPDATE tt_CUSTOMERCAL_15
            SET FlgDeg = 'N'
          WHERE  SrcAssetClassAlt_Key > 1
           AND SysAssetClassAlt_Key = 1;
         UPDATE tt_AccountCal_18
            SET FlgUpg = 'N',
                UpgDate = NULL
          WHERE  InitialAssetClassAlt_Key = 1
           AND FinalAssetClassAlt_Key > 1;
         UPDATE tt_AccountCal_18
            SET FlgDeg = 'N'
          WHERE  InitialAssetClassAlt_Key > 1
           AND FinalAssetClassAlt_Key = 1;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Final_AssetClass_Npadate';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Data_14 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_DD_4 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_NPADegReason_14 ';

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
       WHERE  RUNNINGPROCESSNAME = 'Final_AssetClass_Npadate';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_MOC" TO "ADF_CDR_RBL_STGDB";
