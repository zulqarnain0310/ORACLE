--------------------------------------------------------
--  DDL for Procedure UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : FIRST UPGRADE TO CUSTOMER LEVEL  AFTER THAT ACCOUNT LEVEL
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         /*check the customer when all account to cutomer dpdmax must be 0*/
         v_PROCESSDATE VARCHAR2(200) := ( SELECT Date_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FLGUPG = 'N';
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET FLGUPG = 'N';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_178') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_178 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_178;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_178');

         INSERT INTO tt_TEMPTABLE_178 ( 
         	SELECT A.RefCustomerID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.RefCustomerID ,
                          COUNT(1)  TOTALCOUNT  
                   FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID
                    WHERE  ( A.FlgProcessing = 'N' )
                             AND A.RefCustomerID IS NOT NULL
                     GROUP BY A.RefCustomerID ) A
                   JOIN ( SELECT A.RefCustomerID ,
                                 COUNT(1)  TOTALDPD_MAXCOUNT  
                          FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                                 JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID
                           WHERE  ( B.DPD_IntService <= B.RefPeriodIntServiceUPG
                                    AND B.DPD_NoCredit <= B.RefPeriodNoCreditUPG
                                    AND B.DPD_Overdrawn <= B.RefPeriodOverDrawnUPG
                                    AND B.DPD_Overdue <= B.RefPeriodOverdueUPG
                                    AND B.DPD_Renewal <= B.RefPeriodReviewUPG
                                    AND B.DPD_StockStmt <= B.RefPeriodStkStatementUPG )
                                    AND B.InitialAssetClassAlt_Key NOT IN ( 1 )

                                    AND ( A.FlgProcessing = 'N' )
                                    AND B.Asset_Norm NOT IN ( 'ALWYS_NPA','ALWYS_STD' )

                                    AND NVL(A.MocStatusMark, 'N') = 'N'
                                    AND A.RefCustomerID IS NOT NULL

                          --AND ISNULL(B.UNSERVIEDINT,0)=0 --As per discussion 14/04/2020 and mail dated by bank condition removed
                          GROUP BY A.RefCustomerID ) B   ON A.RefCustomerID = B.RefCustomerID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*------ UPGRADING CUSTOMER-----------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLE_178 B   ON A.RefCustomerID = B.RefCustomerID
                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET SysNPA_Dt = NULL,
                DbtDt = NULL,
                LossDt = NULL,
                ErosionDt = NULL,
                FlgErosion = 'N',
                SysAssetClassAlt_Key = 1,
                FlgDeg = 'N'
          WHERE  FlgUpg = 'U';
         /*--------MARKING UPGRADED ACCOUNT --------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, v_PROCESSDATE, NULL, 1, 'N', NULL, 'U'
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE NVL(A.FlgUpg, 'U') = 'U'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.UpgDate = v_PROCESSDATE,
                                      B.DegReason = NULL,
                                      B.FinalAssetClassAlt_Key = 1,
                                      B.FlgDeg = 'N',
                                      B.FinalNpaDt = NULL,
                                      B.FlgUpg = 'U';
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, v_PROCESSDATE, NULL, 1, 'N', NULL, 'U'
         FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE NVL(A.FlgUpg, 'U') = 'U'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.UpgDate = v_PROCESSDATE,
                                      B.DegReason = NULL,
                                      B.FinalAssetClassAlt_Key = 1,
                                      B.FlgDeg = 'N',
                                      B.FinalNpaDt = NULL,
                                      B.FlgUpg = 'U';
         -----------COVID WORK START-------
         -----------COVID IMPLEMENTION DONE BY TRILOKI 17/05/2020-------
         ----IF OBJECT_ID('TEMPDB..#COVID19') IS NOT NULL
         ----      DROP TABLE #COVID19
         ----select CustomerEntityID,RefCustomerID
         ----INTO #COVID19
         ---- from CURDAT.AdvCustNPAdetail 
         ----where EffectiveToTimeKey=49999
         ----and NPADt>='2020-03-01'
         ----and EffectiveToTimeKey=49999
         ----and EffectiveFromTimeKey>=25811-- New condition added 28/09/2020 
         ---- /*------ UPGRADING COVID19 CUSTOMER-----------*/
         ----UPDATE A SET A.FlgUpg='U'
         ------select * 
         ----FROM PRO.CUSTOMERCAL A INNER JOIN #COVID19 B ON A.RefCustomerID=B.RefCustomerID
         ---- INNER JOIN DIMASSETCLASS C ON C.AssetClassAlt_Key=A.SYSASSETCLASSALT_KEY
         ----AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)
         ----WHERE  (not(isnull(A.ASSET_NORM,'NORMAL')='ALWYS_NPA' ) AND  C.ASSETCLASSGROUP ='NPA')
         ----UPDATE   PRO.CustomerCal SET SysNPA_Dt=NULL,
         ----							 DbtDt=NULL,
         ----							 LossDt=NULL,
         ----							 ErosionDt=NULL,
         ----							 FlgErosion='N',
         ----							 SysAssetClassAlt_Key=1
         ----							 ,FlgDeg='N'
         ----WHERE FlgUpg='U'
         ----/*--------MARKING COVID19  UPGRADED ACCOUNT --------------*/
         ----UPDATE B SET  B.UpgDate=@PROCESSDATE
         ----             ,B.DegReason=NULL
         ----	      ,B.FinalAssetClassAlt_Key=1
         ----	      ,B.FlgDeg='N'
         ----	      ,B.FinalNpaDt=null
         ----              ,B.FlgUpg='U'
         ----	      FROM PRO.CUSTOMERCAL A INNER JOIN PRO.ACCOUNTCAL B ON A.RefCustomerID=B.RefCustomerID
         ----WHERE  ISNULL(A.FlgUpg,'U')='U' AND (ISNULL(A.FlgProcessing,'N')='N')
         ----UPDATE B SET  B.UpgDate=@PROCESSDATE
         ----             ,B.DegReason=NULL
         ----			 ,B.FinalAssetClassAlt_Key=1
         ----			 ,B.FlgDeg='N'
         ----			 ,B.FinalNpaDt=null
         ----             ,B.FlgUpg='U'
         ----			 FROM PRO.CUSTOMERCAL A INNER JOIN PRO.ACCOUNTCAL B ON A.RefCustomerID=B.RefCustomerID
         ----WHERE  ISNULL(A.FlgUpg,'U')='U' AND (ISNULL(A.FlgProcessing,'N')='N')
         -----------COVID WORK END-------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A 
          WHERE SysAssetClassAlt_Key = 1
           AND DegReason IS NOT NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = NULL;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_178 ';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Upgrade_Customer_Account_old';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Upgrade_Customer_Account_old';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_OLD_04122023" TO "ADF_CDR_RBL_STGDB";
