--------------------------------------------------------
--  DDL for Procedure UPGRADE_CUSTOMER_ACCOUNT_09102021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" /*=========================================
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
         /*=========================================
          AUTHOR : TRILOKI KHANNA
          CREATE DATE : 09-04-2021
          MODIFY DATE : 09-04-2021
          DESCRIPTION : Test Case Cover in This SP

         RefCustomerID	TestCase
         143	Reversefeed Upgradation
         94	UPG-TL/DL - Ac Level: Eligible for Upgrade
         96	UPG-Bills/ PC - Ac Level: Eligible for Upgradae
         98	UPG-CC/OD: Eligible for Upgrade
         95	UPG-TL/DL - Ac Level: Not Eligible for Upgrade
         97	UPG-Bills/ PC - Ac Level: Not Eligible for Upgradae
         99	UPG-CC/OD: Not Eligible for Upgrade
         =============================================*/
         /*check the customer when all account to cutomer dpdmax must be 0*/
         v_PROCESSDATE VARCHAR2(200) := ( SELECT Date_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FLGUPG = 'N';
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET FLGUPG = 'N';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_169') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_169 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_169;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_169');

         INSERT INTO tt_TEMPTABLE_169 ( 
         	SELECT A.UCIF_ID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.UCIF_ID ,
                          COUNT(1)  TOTALCOUNT  
                   FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
                    WHERE  ( A.FlgProcessing = 'N' )
                             AND A.UCIF_ID IS NOT NULL
                             AND B.Asset_Norm NOT IN ( 'ALWYS_STD' )

                     GROUP BY A.UCIF_ID ) A
                   JOIN ( SELECT A.UCIF_ID ,
                                 COUNT(1)  TOTALDPD_MAXCOUNT  
                          FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                                 JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
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
                                    AND A.UCIF_ID IS NOT NULL
                                    AND NVL(B.UnserviedInt, 0) = 0
                                    AND NVL(B.AccountStatus, 'N') <> 'Z'
                            GROUP BY A.UCIF_ID ) B   ON A.UCIF_ID = B.UCIF_ID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*------ UPGRADING CUSTOMER-----------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLE_169 B   ON A.UCIF_ID = B.UCIF_ID
                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_1691') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE1_9 ';
         END IF;
         DELETE FROM tt_TEMPTABLE1_9;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE1_9');

         INSERT INTO tt_TEMPTABLE1_9 ( 
         	SELECT A.UCIF_ID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.UCIF_ID ,
                          COUNT(1)  TOTALCOUNT  
                   FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
                    WHERE  ( A.FlgProcessing = 'N' )
                             AND A.UCIF_ID IS NOT NULL
                             AND B.Asset_Norm NOT IN ( 'ALWYS_STD' )

                     GROUP BY A.UCIF_ID ) A
                   JOIN ( SELECT A.UCIF_ID ,
                                 COUNT(1)  TOTALDPD_MAXCOUNT  
                          FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                                 JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
                           WHERE  ( B.DPD_IntService <= B.RefPeriodIntServiceUPG
                                    AND B.DPD_NoCredit <= B.RefPeriodNoCreditUPG
                                    AND B.DPD_Overdrawn <= B.RefPeriodOverDrawnUPG
                                    AND B.DPD_Overdue <= B.RefPeriodOverdueUPG
                                    AND B.DPD_Renewal <= B.RefPeriodReviewUPG
                                    AND B.DPD_StockStmt <= B.RefPeriodStkStatementUPG )
                                    AND B.FinalAssetClassAlt_Key NOT IN ( 1 )

                                    AND ( A.FlgProcessing = 'N' )
                                    AND B.Asset_Norm NOT IN ( 'ALWYS_NPA','ALWYS_STD' )

                                    AND NVL(A.MocStatusMark, 'N') = 'N'
                                    AND NVL(B.UnserviedInt, 0) = 0
                                    AND A.UCIF_ID IS NOT NULL
                                    AND NVL(B.AccountStatus, 'N') <> 'Z'
                            GROUP BY A.UCIF_ID ) B   ON A.UCIF_ID = B.UCIF_ID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*------ UPGRADING CUSTOMER-----------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLE1_9 B   ON A.UCIF_ID = B.UCIF_ID
                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_169RefCustomerID') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLERefCustomerID_4 ';
         END IF;
         DELETE FROM tt_TEMPTABLERefCustomerID_4;
         UTILS.IDENTITY_RESET('tt_TEMPTABLERefCustomerID_4');

         INSERT INTO tt_TEMPTABLERefCustomerID_4 ( 
         	SELECT A.RefCustomerID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.RefCustomerID ,
                          COUNT(1)  TOTALCOUNT  
                   FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID
                    WHERE  ( A.FlgProcessing = 'N' )
                             AND A.UCIF_ID IS NULL
                             AND A.RefCustomerID IS NOT NULL
                             AND B.Asset_Norm NOT IN ( 'ALWYS_STD' )

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
                                    AND A.UCIF_ID IS NULL
                                    AND A.RefCustomerID IS NOT NULL
                            GROUP BY A.RefCustomerID ) B   ON A.RefCustomerID = B.RefCustomerID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*-----------UPGRADING CUSTOMER----------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLERefCustomerID_4 B   ON A.RefCustomerID = B.RefCustomerID
                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         -------Changes done in case of Same Pan Number One Customer Upgrade and One Npa To handle that Issue ---
         IF utils.object_id('TEMPDB..tt_PANUPDATEUPGRADE_4') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_PANUPDATEUPGRADE_4 ';
         END IF;
         DELETE FROM tt_PANUPDATEUPGRADE_4;
         UTILS.IDENTITY_RESET('tt_PANUPDATEUPGRADE_4');

         INSERT INTO tt_PANUPDATEUPGRADE_4 ( 
         	SELECT A.PANNO ,
                 A.TotalCountMAX ,
                 B.TotalCount 
         	  FROM ( SELECT COUNT(1)  TotalCountMAX  ,
                          PANNO 
                   FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL 
                    WHERE  PANNO IS NOT NULL
                     GROUP BY PANNO ) A
                   JOIN ( SELECT COUNT(1)  TotalCount  ,
                                 PANNO 
                          FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL 
                           WHERE  PANNO IS NOT NULL
                                    AND FLGUPG = 'U'
                            GROUP BY PANNO ) B   ON A.PANNO = B.PANNO
                   AND A.TotalCountMAX <> B.TotalCount );
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'N'
         FROM B ,tt_PANUPDATEUPGRADE_4 A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.PANNO = B.PANNO 
          WHERE B.FlgUpg = 'U') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FLGUPG = 'N';
         -------Changes done in case of Same Pan Number One Customer Upgrade and One Npa To handle that Issue ---
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
         /* 16-04-2021 AMAR  -- ADDED THIS CODE FOR  COMMING NEW ACCOUNT BECOMING NPA DUE TO 
         	EXISTING NPA CUSTOMER  AND ALSO UPGRADEING */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
          WHERE InitialAssetClassAlt_Key = 1
           AND FinalAssetClassAlt_Key = 1
           AND FlgUpg = 'U') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FLGUPG = 'N',
                                      UpgDate = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A 
          WHERE SysAssetClassAlt_Key = 1
           AND DegReason IS NOT NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = NULL;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_169 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE1_9 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLERefCustomerID_4 ';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Upgrade_Customer_Account';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      --------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Upgrade_Customer_Account';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_09102021" TO "ADF_CDR_RBL_STGDB";
