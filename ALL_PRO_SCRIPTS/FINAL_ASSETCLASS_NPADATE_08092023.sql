--------------------------------------------------------
--  DDL for Procedure FINAL_ASSETCLASS_NPADATE_08092023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION :UPDATE FINAL ASSET CLASS AND MIN NPA DATE UPDATE CUSTOMER LEVEL AT ACCOUNT LEVEL
 EXEC [PRO].[Final_AssetClass_Npadate] 25233
=============================================*/
(
  v_TIMEKEY IN NUMBER,
  v_FlgPreErosion IN CHAR DEFAULT 'N' 
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
         ----------------------------------Added by Prashant 03012023 as per ashish sir and amar sir ----------------------------------------------------------
         WITH CTE_NPA_UCIFID AS ( SELECT UcifEntityID 
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  FinalAssetClassAlt_Key > 1
           GROUP BY UcifEntityID ) 
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'CONDI_STD'
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN CTE_NPA_UCIFID B   ON A.UcifEntityID = B.UcifEntityID
                   JOIN DimProduct P   ON P.EffectiveFromTimeKey <= v_TIMEKEY
                   AND P.EffectiveToTimeKey >= v_TIMEKEY
                   AND P.ProductAlt_Key = A.ProductAlt_Key
                   AND P.ProductGroup = 'FDSEC' 
             WHERE ASSET_NORM = 'ALWYS_STD') src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.ASSET_NORM = 'CONDI_STD'
            ;
         ------------------------------------------------------------------------------------------------------------
         ----UPDATE  B SET B.finalAssetClassAlt_Key=1, FinalNpaDt =NULL
         ----FROM PRO.CustomerCal  A INNER JOIN PRO.AccountCal B ON A.SourceSystemCustomerID=B.SourceSystemCustomerID AND (A.FlgProcessing='N')
         ---- WHERE A.Asset_Norm='ALWYS_STD'
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
         USING (SELECT A.ROWID row_id, 1, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE ASSET_NORM = 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FINALASSETCLASSALT_KEY = 1,
                                      FINALNPADT = NULL,
                                      DEGREASON = NULL;--- AND FINALASSETCLASSALT_KEY>1S_STD'
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
          WHERE A.DegReason = 'PERCOLATION BY OTHER ACCOUNT'
           AND A.FlgDeg = 'N') src
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
         --IF OBJECT_ID('TEMPDB..tt_TEMPTABLE_UCFIC1_6') IS NOT NULL
         --   DROP TABLE tt_TEMPTABLE_UCFIC1_6
         --/*07072021AMAR COMMENT  ED  JOIN FOR DIMDBSOURCE FOR PERCULATE AT UCIF LEVEL AS DISCUSSED WITH sHARMA SIR AND TRILOKI SIR */
         --SELECT UCIF_ID,MAX(ISNULL(SYSASSETCLASSALT_KEY,1)) SYSASSETCLASSALT_KEY
         --,MIN(SYSNPA_DT) SYSNPA_DT-- ,B.SourceDBName 
         -- INTO tt_TEMPTABLE_UCFIC1_6 FROM PRO.CUSTOMERCAL A
         -- ---INNER JOIN DIMSOURCEDB  B ON B.SourceAlt_Key=A.SourceAlt_Key 
         -- --AND B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY
         --WHERE ( UCIF_ID IS NOT NULL and UCIF_ID<>'0' ) AND  ISNULL(SYSASSETCLASSALT_KEY,1)<>1
         --GROUP BY  UCIF_ID--,B.SourceDBName
         /* START PERCOLATION WORK -- AMAR 31082021 */
         IF v_FlgPreErosion = 'Y' THEN

         BEGIN
            PRO_RBL_MISDB_PROD.InvestmentDataProcessing(v_TimeKey) ;
            PRO_RBL_MISDB_PROD.DerivativeDataProcessing(v_TimeKey) ;

         END;
         END IF;
         /* MERGING DATA FOR ALL SOURCES FOR FIND LOWEST ASSET CLASS AND MIN NPA DATE */
         IF utils.object_id('TEMPDB..tt_CTE_PERC_5') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_PERC_5 ';
         END IF;
         DELETE FROM tt_CTE_PERC_5;
         UTILS.IDENTITY_RESET('tt_CTE_PERC_5');

         INSERT INTO tt_CTE_PERC_5 ( 
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
                     GROUP BY UCIF_ID
                   UNION 
                    /* INVESTMENT DATA */
                   SELECT UcifId UCIF_ID  ,
                          MAX(NVL(FinalAssetClassAlt_Key, 1))  SYSASSETCLASSALT_KEY  ,
                          MIN(NPIDt)  SYSNPA_DT  ,
                          'INV' PercType  
                   FROM InvestmentFinancialDetail A
                          JOIN InvestmentBasicDetail B   ON A.InvEntityId = B.InvEntityId
                          AND A.EffectiveFromTimeKey <= v_TIMEKEY
                          AND A.EffectiveToTimeKey >= v_TIMEKEY
                          AND B.EffectiveFromTimeKey <= v_TIMEKEY
                          AND B.EffectiveToTimeKey >= v_TIMEKEY
                          JOIN InvestmentIssuerDetail C   ON C.IssuerEntityId = B.IssuerEntityId
                          AND C.EffectiveFromTimeKey <= v_TIMEKEY
                          AND C.EffectiveToTimeKey >= v_TIMEKEY
                    WHERE  NVL(FinalAssetClassAlt_Key, 1) <> 1
                     GROUP BY UcifId
                   UNION 
                    /* DERIVATIVE DATA */
                   SELECT UCIC_ID ,
                          MAX(NVL(FinalAssetClassAlt_Key, 1))  SYSASSETCLASSALT_KEY  ,
                          MIN(NPIDt)  SYSNPA_DT  ,
                          'DER' PercType  
                   FROM CurDat_RBL_MISDB_PROD.DerivativeDetail A
                    WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                             AND A.EffectiveToTimeKey >= v_TIMEKEY
                             AND NVL(FinalAssetClassAlt_Key, 1) <> 1
                     GROUP BY UCIC_ID ) A );
         /*  FIND LOWEST ASSET CLASS AND IN NPA DATE IN AALL SOURCES */
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_UCFIC1_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_UCFIC1_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_UCFIC1_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_UCFIC1_6');

         INSERT INTO tt_TEMPTABLE_UCFIC1_6 ( 
         	SELECT UCIF_ID ,
                 MAX(SYSASSETCLASSALT_KEY)  SYSASSETCLASSALT_KEY  ,
                 MIN(SYSNPA_DT)  SYSNPA_DT  ,
                 'XXX' PercType  
         	  FROM tt_CTE_PERC_5 
         	  GROUP BY UCIF_ID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PercType
         FROM A ,tt_TEMPTABLE_UCFIC1_6 A
                JOIN tt_CTE_PERC_5 B   ON A.UCIF_ID = B.UCIF_ID
                AND A.SYSASSETCLASSALT_KEY = B.SYSASSETCLASSALT_KEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PercType = src.PercType;
         IF  --SQLDEV: NOT RECOGNIZED
         /*  UPDATE LOWEST ASSET CLASS AND MIN NPA DATE IN - ADVANCE DATA */
         IF tt_CTE_PERC_5  --SQLDEV: NOT RECOGNIZED
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
                JOIN tt_TEMPTABLE_UCFIC1_6 B   ON A.UCIF_ID = B.UCIF_ID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = src.SYSASSETCLASSALT_KEY,
                                      A.SysNPA_Dt = src.SYSNPA_DT,
                                      A.DegReason = pos_4;
         /* UPDATE INVESTMENT DATA - LOWEST ASSET CLASS AND MIN NPA DATE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, D.SYSASSETCLASSALT_KEY, D.SYSNPA_DT, CASE 
         WHEN A.FinalAssetClassAlt_Key = 1
           AND D.SYSASSETCLASSALT_KEY > 1 THEN CASE 
                                                    WHEN D.PercType = 'ADV' THEN 'PERCOLATION BY LOAN AC UCIFID ' || D.UCIF_ID
                                                    WHEN D.PercType = 'DER' THEN 'PERCOLATION BY DERIVATIVE UCIFID ' || D.UCIF_ID
         ELSE A.DegReason
            END
         ELSE A.DegReason
            END AS pos_4
         FROM A ,InvestmentFinancialDetail A
                JOIN InvestmentBasicDetail B   ON A.InvEntityId = B.InvEntityId
                AND A.EffectiveFromTimeKey <= v_TIMEKEY
                AND A.EffectiveToTimeKey >= v_TIMEKEY
                AND B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY
                JOIN InvestmentIssuerDetail C   ON C.IssuerEntityId = B.IssuerEntityId
                AND C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY
                JOIN tt_TEMPTABLE_UCFIC1_6 D   ON D.UCIF_ID = C.UcifId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SYSASSETCLASSALT_KEY,
                                      A.NPIDt = src.SYSNPA_DT,
                                      A.DegReason = pos_4;
         /*  UPDATE   LOWEST ASSET CLASS AND MIN NPA DATE IN -  DERIVATIVE DATA */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SYSASSETCLASSALT_KEY, SYSNPA_DT, CASE 
         WHEN A.FinalAssetClassAlt_Key = 1
           AND B.SYSASSETCLASSALT_KEY > 1 THEN CASE 
                                                    WHEN B.PercType = 'ADV' THEN 'PERCOLATION BY LOAN AC UCIFID ' || B.UCIF_ID
                                                    WHEN B.PercType = 'INV' THEN 'PERCOLATION BY INVESTMENT UCIFID ' || B.UCIF_ID
         ELSE A.DegReason
            END
         ELSE A.DegReason
            END AS pos_4
         FROM A ,CurDat_RBL_MISDB_PROD.DerivativeDetail A
                JOIN tt_TEMPTABLE_UCFIC1_6 B   ON A.UCIC_ID = B.UCIF_ID
                AND A.EffectiveFromTimeKey <= v_TIMEKEY
                AND A.EffectiveToTimeKey >= v_TIMEKEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FinalAssetClassAlt_Key = src.SYSASSETCLASSALT_KEY,
                                      A.NPIDt = SYSNPA_DT,
                                      A.DegReason = pos_4;
         IF  --SQLDEV: NOT RECOGNIZED
         /* INVESTMENT AND DERVATIVE PROVISION CALCULATION */
         IF tt_TEMPTABLE_UCFIC1_6  --SQLDEV: NOT RECOGNIZED
         IF v_FlgPreErosion = 'N' THEN

         BEGIN
            PRO_RBL_MISDB_PROD.InvestmentDerivativeProvisionCal(v_TIMEKEY) ;

         END;
         END IF;
         /* END OF PERCOLATION WORK */
         /* BUYOUT - MARKING OF PERCoLATION/LiNCKED ACCOUNT NPA IN ADVANCE DATA FROM BUYOUT */
         TABLE IF  --SQLDEV: NOT RECOGNIZED
         IF #BUYOUT_NPA_EFFCTD_TO_NRML_AC  --SQLDEV: NOT RECOGNIZED
         #BUYOUT_NPA_EFFCTD_TO_NRML_AC TABLE IF  --SQLDEV: NOT RECOGNIZED
         IF tt_CTE_AA_3  --SQLDEV: NOT RECOGNIZED
         tt_CTE_AA_3 TABLE IF  --SQLDEV: NOT RECOGNIZED
         IF tt_CTE_BB_3  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_CTE_AA_3;
         UTILS.IDENTITY_RESET('tt_CTE_AA_3');

         INSERT INTO tt_CTE_AA_3 ( 
         	SELECT UcifEntityID 
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.AccountEntityID = B.AccountEntityId
         	 WHERE  ( FlgDeg = 'Y'
                    OR NVL(A.DPD_Overdue, 0) >= A.RefPeriodOverdue
                    OR NPA_ClassSeller = 'Y' )
                    AND Asset_Norm <> 'ALYWS_STD'
         	  GROUP BY UcifEntityID );
         /* REMOVE FLAG NPA_VDPD OR NPA_SELLER IN CASE OF SAME UCIF OTHER ACCOUNT DEGRADE  BY REFERENCE PERIOD */
         DELETE FROM tt_CTE_BB_3;
         UTILS.IDENTITY_RESET('tt_CTE_BB_3');

         INSERT INTO tt_CTE_BB_3 ( 
         	SELECT A.UcifEntityID 
         	  FROM tt_CTE_AA_3 A
                   JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UcifEntityID = B.UcifEntityID
                   LEFT JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal C   ON B.CustomerAcID = C.CustomerAcID
         	 WHERE  C.CustomerAcID IS NULL
                    AND ( B.FlgDeg = 'Y'
                    OR ( NVL(B.DPD_IntService, 0) >= B.RefPeriodIntService )
                    OR ( NVL(B.DPD_Overdrawn, 0) >= B.RefPeriodOverDrawn )
                    OR ( NVL(B.DPD_NoCredit, 0) >= B.RefPeriodNoCredit )
                    OR ( NVL(B.DPD_Overdue, 0) >= B.RefPeriodOverdue )
                    OR ( NVL(B.DPD_StockStmt, 0) >= B.RefPeriodStkStatement )
                    OR ( NVL(B.DPD_Renewal, 0) >= B.RefPeriodReview ) )
         	  GROUP BY A.UcifEntityID );
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'NPA_OTHERS'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN tt_CTE_BB_3 AA   ON A.UcifEntityID = A.UcifEntityID
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON B.AccountEntityId = A.AccountEntityID ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_FLAG = 'NPA_OTHERS';
         /* END OF NPA FLAG UPDATE*/
         ----SELECT A.UcifEntityID INTO #BUYOUT_NPA_EFFCTD_TO_NRML_AC
         ----FROM tt_CTE_AA_3 A
         ----	INNER JOIN PRO.ACCOUNTCAL B
         ----		ON A.UcifEntityID =B.UcifEntityID
         ----		AND B.FlgDeg='N'
         ----		AND Asset_Norm<>'ALYWS_STD'
         ----EXCEPT				
         ----SELECT A.UcifEntityID 
         ----FROM tt_CTE_AA_3 A
         ----	INNER JOIN PRO.ACCOUNTCAL B
         ----		ON A.UcifEntityID =B.UcifEntityID
         ----	LEFT JOIN PRO.BuyoutUploadDetailsCal C
         ----		ON C.AccountEntityID=B.AccountEntityID
         ----	WHERE C.AccountEntityID IS NULL
         ----		AND (B.FlgDeg='Y'  
         ----					OR (ISNULL(B.DPD_INTSERVICE,0)>=B.REFPERIODINTSERVICE)
         ----					OR (ISNULL(B.DPD_OVERDRAWN,0)>=B.REFPERIODOVERDRAWN)
         ----					OR (ISNULL(B.DPD_NOCREDIT,0) >=B.REFPERIODNOCREDIT)
         ----					OR (ISNULL(B.DPD_OVERDUE,0)  >=B.REFPERIODOVERDUE)
         ----					OR (ISNULL(B.DPD_STOCKSTMT,0)>=B.REFPERIODSTKSTATEMENT)
         ----					OR (ISNULL(B.DPD_RENEWAL,0)  >=B.REFPERIODREVIEW)
         ----			)
         ----		AND Asset_Norm<>'ALYWS_STD'
         ----UPDATE A
         ----	SET A.NPA_EffectedToMainAdv=CASE WHEN C.UcifEntityID IS NULL THEN 'N' ELSE 'Y' END
         ----FROM PRO.BuyoutUploadDetailsCal A
         ----	INNER JOIN pro.ACCOUNTCAL B
         ----		ON A.AccountEntityID=B.AccountEntityID
         ----	 LEFT JOIN #BUYOUT_NPA_EFFCTD_TO_NRML_AC C
         ----		ON B.UcifEntityID=C.UcifEntityID
         /* END OF LOAN BUYOUT */
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
         ----FROM PRO.CustomerCal A INNER JOIN tt_TEMPTABLE_UCFIC1_6 B ON A.UCIF_ID=B.UCIF_ID
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
         USING (SELECT A.ROWID row_id, 1, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE A.Asset_Norm = 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FinalAssetClassAlt_Key = 1,
                                      FinalNpaDt = NULL,
                                      DEGREASON = NULL;
         ---UPDATE  MULTIPLE   DegReason IN PRO.CUSTOMERCAL TABLE-------
         IF utils.object_id('TEMPDB..tt_Data_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Data_6 ';
         END IF;
         DELETE FROM tt_Data_6;
         UTILS.IDENTITY_RESET('tt_Data_6');

         INSERT INTO tt_Data_6 ( 
         	SELECT DISTINCT DegReason ,
                          UcifEntityID 
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
         	 WHERE  DegReason IS NOT NULL
                    AND FLGDEG = 'Y' );
         IF utils.object_id('TEMPDB..tt_NPADegReason_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_NPADegReason_6 ';
         END IF;
         DELETE FROM tt_NPADegReason_6;
         UTILS.IDENTITY_RESET('tt_NPADegReason_6');

         INSERT INTO tt_NPADegReason_6 ( 
         	SELECT UcifEntityID ,
                 STRING_AGG(DegReason, ' ') DegReason  
         	  FROM tt_Data_6 
         	  GROUP BY UcifEntityID );
         --IF object_id('TEMPDB..#DD') is NOT NULL
         --DROP TABLE #DD
         --Select SourceSystemCustomerID ,DegReason ,ROW_NUMBER()OVER(PARTITION by SourceSystemCustomerID order by SourceSystemCustomerID) AS RN  INTO #DD  FROM tt_Data_6
         --IF object_id('TEMPDB..tt_NPADegReason_6') is NOT NULL
         --DROP TABLE tt_NPADegReason_6
         --SELECT SourceSystemCustomerID ,DegReason INTO tt_NPADegReason_6 FROM
         --(
         --Select SourceSystemCustomerID,([1] +ISNULL(' ,'+[2],'') +ISNULL(' ,' + [3],'')   +ISNULL(' ,' + [4],'')  +ISNULL(' ,' + [5],'')  +ISNULL(' ,' + [6],'')
         --+ISNULL(' ,' + [7],'')  +ISNULL(' ,' + [8],'')  +ISNULL(' ,' + [9],'')  +ISNULL(' ,' + [10],'')  +ISNULL(' ,' + [11],'')  +ISNULL(' ,' + [12],'')
         --+ISNULL(' ,' + [13],'')  +ISNULL(' ,' + [14],'')  +ISNULL(' ,' + [15],'')  +ISNULL(' ,' + [16],'')  +ISNULL(' ,' + [17],'')) AS DegReason
         --FROM(
         --Select SourceSystemCustomerID, DegReason,  RN FROM #DD  )a 
         --PIVOT 
         --(
         --MAX(DegReason)  FOR RN IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13],[14],[15],[16],[17])
         --) S
         --) A
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_NPADegReason_6 B   ON A.UcifEntityID = B.UcifEntityID
                AND A.FlgDeg = 'Y' ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET FlgUpg = 'N'
          WHERE  SrcAssetClassAlt_Key = 1
           AND SysAssetClassAlt_Key > 1;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET FlgDeg = 'N'
          WHERE  SrcAssetClassAlt_Key > 1
           AND SysAssetClassAlt_Key = 1;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FlgUpg = 'N',
                UpgDate = NULL
          WHERE  InitialAssetClassAlt_Key = 1
           AND FinalAssetClassAlt_Key > 1;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FlgDeg = 'N'
          WHERE  InitialAssetClassAlt_Key > 1
           AND FinalAssetClassAlt_Key = 1;
         IF v_FlgPreErosion = 'N' THEN

         BEGIN
            UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
               SET COMPLETED = 'Y',
                   ERRORDATE = NULL,
                   ERRORDESCRIPTION = NULL,
                   COUNT = NVL(COUNT, 0) + 1
             WHERE  RUNNINGPROCESSNAME = 'Final_AssetClass_Npadate';

         END;
         END IF;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Data_6 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_NPADegReason_6 ';

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

  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."FINAL_ASSETCLASS_NPADATE_08092023" TO "ADF_CDR_RBL_STGDB";
