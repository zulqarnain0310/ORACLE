--------------------------------------------------------
--  DDL for Procedure FINAL_ASSETCLASS_NPADATE_A
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" /*=========================================
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
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
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
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID
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
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                AND ( NVL(A.FlgProcessing, 'N') = 'N' ) 
          WHERE A.SysAssetClassAlt_Key <> B.FinalAssetClassAlt_Key
           AND B.RefCustomerID IS NULL) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.finalAssetClassAlt_Key = src.finalAssetClassAlt_Key;
         /*---------------NPA DATE UPDATE CUSTOMER TO ACCOUNT LEVEL----------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.SysNPA_Dt
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.Asset_Norm, 'NORMAL') <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND NVL(A.SysNPA_Dt, ' ') <> NVL(b.FinalNpaDt, ' ')
           AND NVL(A.FlgDeg, 'N') = 'Y') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE ASSET_NORM = 'ALWYS_STD'
           AND FINALASSETCLASSALT_KEY > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FINALASSETCLASSALT_KEY = 1,
                                      FINALNPADT = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, 1, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE A.Asset_Norm = 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET InitialAssetClassAlt_Key = 1,
                                      FinalAssetClassAlt_Key = 1,
                                      InitialNpaDt = NULL,
                                      FinalNpaDt = NULL,
                                      DEGREASON = NULL;
         /*------UPDATING DEG REASON  FOR ACCOUNT WHERE  NO DEFAULT IS THERE------ */
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, NULL
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE A.FlgDeg = 'Y'
           AND B.DegReason IS NULL
           AND B.Asset_Norm <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = NULL;
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'PERCOLATION BY OTHER ACCOUNT' AS DEGREASON
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE A.FlgDeg = 'Y'
           AND B.DegReason IS NULL
           AND B.Asset_Norm <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE A.DegReason = 'PERCOLATION BY OTHER ACCOUNT') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DegReason;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET SysNPA_Dt = v_REF_DATE
          WHERE  NVL(SysNPA_Dt, '1900-01-01') > v_REF_DATE;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FinalNpaDt = v_REF_DATE
          WHERE  NVL(FinalNpaDt, '1900-01-01') > v_REF_DATE;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET SysNPA_Dt = v_REF_DATE
          WHERE  SysNPA_Dt IS NULL
           AND SysAssetClassAlt_Key > 1;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FinalNpaDt = v_REF_DATE
          WHERE  FinalNpaDt IS NULL
           AND FinalAssetClassAlt_Key > 1;
         /*------------------------------UPDATE UNIFORM ASSET CLASSIFICATION--------------------------------*/
         --IF OBJECT_ID('TEMPDB..tt_TEMPTABLE_UCFIC1_2') IS NOT NULL
         --   DROP TABLE tt_TEMPTABLE_UCFIC1_2
         --/*07072021AMAR COMMENT  ED  JOIN FOR DIMDBSOURCE FOR PERCULATE AT UCIF LEVEL AS DISCUSSED WITH sHARMA SIR AND TRILOKI SIR */
         --SELECT UCIF_ID,MAX(ISNULL(SYSASSETCLASSALT_KEY,1)) SYSASSETCLASSALT_KEY
         --,MIN(SYSNPA_DT) SYSNPA_DT-- ,B.SourceDBName 
         -- INTO tt_TEMPTABLE_UCFIC1_2 FROM PRO.CUSTOMERCAL A
         -- ---INNER JOIN DIMSOURCEDB  B ON B.SourceAlt_Key=A.SourceAlt_Key 
         -- --AND B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY
         --WHERE ( UCIF_ID IS NOT NULL and UCIF_ID<>'0' ) AND  ISNULL(SYSASSETCLASSALT_KEY,1)<>1
         --GROUP BY  UCIF_ID--,B.SourceDBName
         /* START PERCOLATION WORK -- AMAR 31082021 */
         ----EXEC [PRO].[InvestmentDataProcessing] @TimeKey
         ----EXEC [PRO].[DerivativeDataProcessing] @TimeKey
         /* MERGING DATA FOR ALL SOURCES FOR FIND LOWEST ASSET CLASS AND MIN NPA DATE */
         IF utils.object_id('TEMPDB..tt_CTE_PERC_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_PERC_2 ';
         END IF;
         DELETE FROM tt_CTE_PERC_2;
         UTILS.IDENTITY_RESET('tt_CTE_PERC_2');

         INSERT INTO tt_CTE_PERC_2 ( 
         	SELECT * 
         	  FROM (  /* ADVANCE DATA */
                   SELECT UCIF_ID ,
                          MAX(NVL(SYSASSETCLASSALT_KEY, 1))  SYSASSETCLASSALT_KEY  ,
                          MIN(SYSNPA_DT)  SYSNPA_DT  ,
                          'ADV' PercType  
                   FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                    WHERE  ( UCIF_ID IS NOT NULL
                             AND UCIF_ID <> '0' )
                             AND NVL(SYSASSETCLASSALT_KEY, 1) <> 1
                     GROUP BY UCIF_ID ) 
                 ---UNION

                 --/* INVESTMENT DATA */

                 --SELECT UcifId UCIF_ID,MAX(ISNULL(FinalAssetClassAlt_Key,1)) SYSASSETCLASSALT_KEY ,MIN(NPIDt) SYSNPA_DT

                 --,'INV' PercType

                 --FROM InvestmentFinancialDetail A 

                 --	INNER JOIN InvestmentBasicDetail B

                 --		ON A.InvEntityId =B.InvEntityId

                 --		AND A.EffectiveFromTimeKey <=@TIMEKEY AND A.EffectiveToTimeKey >=@TIMEKEY

                 --		AND B.EffectiveFromTimeKey <=@TIMEKEY AND B.EffectiveToTimeKey >=@TIMEKEY

                 --	INNER JOIN InvestmentIssuerDetail C

                 --		ON C.IssuerEntityId=B.IssuerEntityId

                 --		AND C.EffectiveFromTimeKey <=@TIMEKEY AND C.EffectiveToTimeKey >=@TIMEKEY

                 --WHERE ISNULL(FinalAssetClassAlt_Key,1)<>1

                 --GROUP BY  UcifId

                 --/* DERIVATIVE DATA */

                 --UNION 

                 --	SELECT UCIC_ID,MAX(ISNULL(FinalAssetClassAlt_Key,1)) SYSASSETCLASSALT_KEY ,MIN(NPIDt) SYSNPA_DT

                 --	,'DER' PercType

                 --FROM CurDat.DerivativeDetail A 

                 --	WHERE  A.EffectiveFromTimeKey <=@TIMEKEY AND A.EffectiveToTimeKey >=@TIMEKEY

                 --		AND ISNULL(FinalAssetClassAlt_Key,1)<>1

                 --GROUP BY  UCIC_ID
                 A );
         /*  FIND LOWEST ASSET CLASS AND IN NPA DATE IN AALL SOURCES */
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_UCFIC1_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_UCFIC1_2 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_UCFIC1_2;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_UCFIC1_2');

         INSERT INTO tt_TEMPTABLE_UCFIC1_2 ( 
         	SELECT UCIF_ID ,
                 MAX(SYSASSETCLASSALT_KEY)  SYSASSETCLASSALT_KEY  ,
                 MIN(SYSNPA_DT)  SYSNPA_DT  ,
                 'XXX' PercType  
         	  FROM tt_CTE_PERC_2 
         	  GROUP BY UCIF_ID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PercType
         FROM A ,tt_TEMPTABLE_UCFIC1_2 A
                JOIN tt_CTE_PERC_2 B   ON A.UCIF_ID = B.UCIF_ID
                AND A.SYSASSETCLASSALT_KEY = B.SYSASSETCLASSALT_KEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PercType = src.PercType;
         IF  --SQLDEV: NOT RECOGNIZED
         /*  UPDATE LOWEST ASSET CLASS AND MIN NPA DATE IN - ADVANCE DATA */
         IF tt_CTE_PERC_2  --SQLDEV: NOT RECOGNIZED
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLE_UCFIC1_2 B   ON A.UCIF_ID = B.UCIF_ID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = src.SYSASSETCLASSALT_KEY,
                                      A.SysNPA_Dt = src.SYSNPA_DT,
                                      A.DegReason = pos_4;
         ----/* UPDATE INVESTMENT DATA - LOWEST ASSET CLASS AND MIN NPA DATE */
         ----UPDATE A SET A.FinalAssetClassAlt_Key=D.SYSASSETCLASSALT_KEY
         ----             ,A.NPIDt=D.SYSNPA_DT  
         ----			,A.DegReason=CASE WHEN A.FinalAssetClassAlt_Key =1 AND D.SYSASSETCLASSALT_KEY >1 
         ----							THEN  
         ----								CASE WHEN D.PercType ='ADV' THEN	'PERCOLATION BY LOAN AC UCIFID ' + D.UCIF_ID 
         ----									 WHEN D.PercType ='DER' THEN	'PERCOLATION BY DERIVATIVE UCIFID '  + D.UCIF_ID  	
         ----									ELSE A.DegReason
         ----								END 
         ----							ELSE  A.DegReason
         ----						END
         ---- FROM InvestmentFinancialDetail A 
         ----			INNER JOIN InvestmentBasicDetail B
         ----				ON A.InvEntityId =B.InvEntityId
         ----				AND A.EffectiveFromTimeKey <=@TIMEKEY AND A.EffectiveToTimeKey >=@TIMEKEY
         ----				AND B.EffectiveFromTimeKey <=@TIMEKEY AND B.EffectiveToTimeKey >=@TIMEKEY
         ----			INNER JOIN InvestmentIssuerDetail C
         ----				ON C.IssuerEntityId=B.IssuerEntityId
         ----				AND C.EffectiveFromTimeKey <=@TIMEKEY AND C.EffectiveToTimeKey >=@TIMEKEY
         ----			INNER JOIN tt_TEMPTABLE_UCFIC1_2 D ON D.UCIF_ID =C.UcifId
         ----/*  UPDATE   LOWEST ASSET CLASS AND MIN NPA DATE IN -  DERIVATIVE DATA */
         ----UPDATE A SET FinalAssetClassAlt_Key=B.SYSASSETCLASSALT_KEY
         ----			,A.NPIDt=SYSNPA_DT
         ----			,A.DegReason=CASE WHEN A.FinalAssetClassAlt_Key =1 AND B.SYSASSETCLASSALT_KEY >1 
         ----							THEN  
         ----								CASE WHEN B.PercType ='ADV' THEN 'PERCOLATION BY LOAN AC UCIFID ' + B.UCIF_ID 
         ----									 WHEN B.PercType ='INV' THEN 'PERCOLATION BY INVESTMENT UCIFID ' + B.UCIF_ID  	
         ----									ELSE A.DegReason
         ----								END 
         ----							ELSE  A.DegReason
         ----						END
         ----FROM CurDat.DerivativeDetail A
         ----	INNER JOIN tt_TEMPTABLE_UCFIC1_2 B ON A.UCIC_ID =B.UCIF_ID
         ----	AND A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY
         ----DROP TABLE IF EXISTS tt_TEMPTABLE_UCFIC1_2
         ----/* INVESTMENT AND DERVATIVE PROVISION CALCULATION */
         ----EXEC [PRO].[InvestmentDerivativeProvisionCal] @TIMEKEY
         /* END OF PERCOLATION WORK */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS pos_2, B.SysNPA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
                AND A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.SysAssetClassAlt_Key, 1) <> 1
           AND B.RefCustomerID <> '0') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS pos_2, B.SysNPA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.SysAssetClassAlt_Key, 1) <> 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS pos_2, B.SysNPA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE NVL(B.SysAssetClassAlt_Key, 1) <> 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'N' )
           AND B.DegReason IS NOT NULL
           AND A.FinalAssetClassAlt_Key > 1
           AND A.DegReason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'N' )
           AND B.DegReason IS NOT NULL
           AND A.FinalAssetClassAlt_Key > 1
           AND A.DegReason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DegReason;
         ----UPDATE A SET DegReason='PERCOLATION BY UCIFID ' + ' ' + B.SourceDBName + '  ' + B.UCIF_ID 
         ----FROM PRO.CustomerCal A INNER JOIN tt_TEMPTABLE_UCFIC1_2 B ON A.UCIF_ID=B.UCIF_ID
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
         USING (SELECT B.ROWID row_id, A.SysNPA_Dt
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE NVL(B.Asset_Norm, 'NORMAL') <> 'ALWYS_STD'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND NVL(A.SysNPA_Dt, ' ') <> NVL(b.FinalNpaDt, ' ')
           AND NVL(A.FlgDeg, 'N') = 'N'
           AND A.RefCustomerID <> '0') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FinalNpaDt = src.SysNPA_Dt;
         /*---------------UPDATE ASSET CLASS STD WHERE ASSET NORM ALWAYS STD---------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, 1, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE A.Asset_Norm = 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET InitialAssetClassAlt_Key = 1,
                                      FinalAssetClassAlt_Key = 1,
                                      InitialNpaDt = NULL,
                                      FinalNpaDt = NULL,
                                      DEGREASON = NULL;
         ---UPDATE  MULTIPLE   DegReason IN PRO.CUSTOMERCAL TABLE-------
         IF utils.object_id('TEMPDB..tt_Data_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Data_2 ';
         END IF;
         DELETE FROM tt_Data_2;
         UTILS.IDENTITY_RESET('tt_Data_2');

         INSERT INTO tt_Data_2 ( 
         	SELECT DISTINCT DegReason ,
                          SourceSystemCustomerID 
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
         	 WHERE  DegReason IS NOT NULL
                    AND FLGDEG = 'Y' );
         IF utils.object_id('TEMPDB..tt_DD') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_DD ';
         END IF;
         DELETE FROM tt_DD;
         UTILS.IDENTITY_RESET('tt_DD');

         INSERT INTO tt_DD SELECT SourceSystemCustomerID ,
                                  DegReason ,
                                  ROW_NUMBER() OVER ( PARTITION BY SourceSystemCustomerID ORDER BY SourceSystemCustomerID  ) RN  
              FROM tt_Data_2 ;
         IF utils.object_id('TEMPDB..tt_NPADegReason_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_NPADegReason_2 ';
         END IF;
         DELETE FROM tt_NPADegReason_2;
         UTILS.IDENTITY_RESET('tt_NPADegReason_2');

         INSERT INTO tt_NPADegReason_2 ( 
         	SELECT PivotTable.SourceSystemCustomerID,
                 MAX( DECODE( , , PivotTable.aggregate, NULL) ) "Pivot Column"                                
         	  FROM ( 
         	     SELECT SourceSystemCustomerID ,
                      , 
                       aggregate
         	       FROM tt_DD ( SELECT PivotTable.SourceSystemCustomerID,
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_NPADegReason_2 B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                AND A.FlgDeg = 'Y' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Final_AssetClass_Npadate';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Data_2 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_DD ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_NPADegReason_2 ';

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

  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_A" TO "ADF_CDR_RBL_STGDB";
