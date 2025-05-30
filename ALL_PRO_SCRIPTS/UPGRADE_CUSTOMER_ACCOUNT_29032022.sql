--------------------------------------------------------
--  DDL for Procedure UPGRADE_CUSTOMER_ACCOUNT_29032022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" /*=========================================
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
         /* END OF RESTR UPGRADE */
         /*pui UPGRADE */
         v_DysOfDelay NUMBER(3,0) := 90;
         v_temp NUMBER(1, 0) := 0;

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET FLGUPG = 'N';
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET FLGUPG = 'N';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_171') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_171 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_171;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_171');

         INSERT INTO tt_TEMPTABLE_171 ( 
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

                          ---AMAR  28032022 AS DISCUSSED WITH aSHISH SIR ON 24TH MAR'2022 -- ADDED FOR CHECK INTT OVERDUE AMOUNT FOR CCOD ACCOUNT FOR UPGRADE

                          -------AND ( (FacilityType IN('CC','OD') and isnull(IntOverdue,0)=0) OR (ISNULL(FacilityType,'') NOT IN('CC','OD')))
                          GROUP BY A.UCIF_ID ) B   ON A.UCIF_ID = B.UCIF_ID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*------ UPGRADING CUSTOMER-----------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLE_171 B   ON A.UCIF_ID = B.UCIF_ID
                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         /* BUYOUT UPGARDE */
         /*  UPGRADE ACCOUNTS- NPA DUTE TO DPD_SELLER/VIRTUAL DPD */
         TABLE IF  --SQLDEV: NOT RECOGNIZED
         IF tt_NPA_SELLER  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_NPA_SELLER;
         UTILS.IDENTITY_RESET('tt_NPA_SELLER');

         INSERT INTO tt_NPA_SELLER ( 
         	SELECT UcifEntityID --,a.CustomerAcID

         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal D   ON A.AccountEntityID = D.AccountEntityId

                   --AND a.customeracid='809002073957'
                   AND NPA_ClassSeller = 'N'
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist E   ON e.EffectiveFromTimeKey <= v_TIMEKEY - 1
                   AND e.EffectiveToTimeKey >= v_TIMEKEY - 1
         	 WHERE  E.NPA_Flag = 'NPA_SELLER'
                    AND NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_NPA'
         	  GROUP BY UcifEntityID );
         --SELECT * FROM tt_NPA_SELLER WHERE  ucifentityid=2860237
         DELETE a
         --SELECT B.DPD_MAX,A.UcifEntityID,B.CustomerAcID

          WHERE ROWID IN 
         ( SELECT a.ROWID
           FROM tt_NPA_SELLER a
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON A.UcifEntityID = B.UcifEntityID
                  AND NVL(DPD_MAX, 0) > 0,
                a
                --SELECT B.DPD_MAX,A.UcifEntityID,B.CustomerAcID
          );
         --and B.customeracid='809002073957'
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_NPA_SELLER B   ON A.UcifEntityID = B.UcifEntityID
              ----and a.CustomerEntityID=1194338

                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_NPA'
           AND C.ASSETCLASSGROUP = 'NPA') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         -------------------
         /*  UPGRADE ACCOUNTS- NPA DUTE TO VIRTUAL DPD - AND VERTIUAL DPD IS 0 */
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_NPA_VDPD  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_NPA_VDPD;
         UTILS.IDENTITY_RESET('tt_NPA_VDPD');

         INSERT INTO tt_NPA_VDPD ( 
         	SELECT UcifEntityID 
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal D   ON A.AccountEntityID = D.AccountEntityId
                 ------and ucifentityid=2860237
                  -------and a.AccountEntityID=2162686

                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist E   ON e.EffectiveFromTimeKey <= v_TIMEKEY - 1
                   AND e.EffectiveToTimeKey >= v_TIMEKEY - 1
                   AND A.AccountEntityID = E.AccountEntityId
         	 WHERE  E.NPA_Flag = 'NPA_VDPD'
                    AND D.PeakDPD IS NOT NULL
                    AND ( NVL(D.PeakDPD, 0) < A.RefPeriodOverdue
                    AND NVL(D.DPD_Seller, 0) > 0 )

         	--AND ISNULL(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
         	GROUP BY UcifEntityID );
         ----select * from tt_NPA_VDPD where ucifentityid=2860237
         DELETE A
          WHERE ROWID IN 
         ( SELECT A.ROWID
           FROM tt_NPA_VDPD A
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UcifEntityID = B.UcifEntityID,
                A
          WHERE  ( NVL(B.DPD_INTSERVICE, 0) >= B.REFPERIODINTSERVICE
                   OR NVL(B.DPD_OVERDRAWN, 0) >= B.REFPERIODOVERDRAWN
                   OR NVL(B.DPD_NOCREDIT, 0) >= B.REFPERIODNOCREDIT
                   OR NVL(B.DPD_OVERDUE, 0) >= B.REFPERIODOVERDUE
                   OR NVL(B.DPD_STOCKSTMT, 0) >= B.REFPERIODSTKSTATEMENT
                   OR NVL(B.DPD_RENEWAL, 0) >= B.REFPERIODREVIEW ) );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_NPA_VDPD B   ON A.UcifEntityID = B.UcifEntityID
              ----and a.CustomerEntityID=1194338

                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_NPA'
           AND C.ASSETCLASSGROUP = 'NPA') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         /*  UPGRADE ACCOUNTS- NPA DUTE TO VIRTUAL DPD - AND VERTIUAL DPD IS >0 */
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_NPA_VDPD_1  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_NPA_VDPD_1;
         UTILS.IDENTITY_RESET('tt_NPA_VDPD_1');

         INSERT INTO tt_NPA_VDPD_1 ( 
         	SELECT UcifEntityID 
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal D   ON A.AccountEntityID = D.AccountEntityId
                 ------and a.CustomerAcID ='809002513811'
                  -------and a.AccountEntityID=2162686

                   JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal_Hist E   ON e.EffectiveFromTimeKey <= v_TIMEKEY - 1
                   AND e.EffectiveToTimeKey >= v_TIMEKEY - 1
                   AND A.AccountEntityID = E.AccountEntityId
         	 WHERE  E.NPA_Flag = 'NPA_VDPD'
                    AND D.PeakDPD IS NOT NULL
                    AND NVL(D.DPD_Seller, 0) = 0

         	--AND ISNULL(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
         	GROUP BY UcifEntityID );
         ----select * from tt_NPA_VDPD where ucifentityid=2860237
         DELETE A
         ---select  dpd_max,*

          WHERE ROWID IN 
         ( SELECT A.ROWID
           FROM tt_NPA_VDPD_1 A
                  JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.UcifEntityID = B.UcifEntityID,
                A
                ---select  dpd_max,*

          WHERE  ( NVL(b.dpd_max, 0) > 0 ) );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'U'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_NPA_VDPD_1 B   ON A.UcifEntityID = B.UcifEntityID
              ----and a.CustomerEntityID=1194338

                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_NPA'
           AND C.ASSETCLASSGROUP = 'NPA') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         --DROP TABLE IF EXISTS #UCIF_ENTITYID
         --SELECT A.UcifEntityID
         --	INTO #UCIF_ENTITYID
         --FROM PRO.ACCOUNTCAL A
         --	LEFT JOIN PRO.BuyoutUploadDetailsCal D
         --		ON A.AccountEntityID=D.AccountEntityID
         --	WHERE A.FinalAssetClassAlt_Key>1
         --		AND (    (D.NPA_EffectedToMainAdv='Y' AND D.AccountEntityID IS NULL) 
         --			  OR (D.NPA_EffectedToMainAdv='Y' AND FlgDeg='N') 
         --			)
         --	GROUP BY A.UcifEntityID
         --union
         --select a.UcifEntityID	
         --FROM PRO.ACCOUNTCAL A
         --	inner JOIN PRO.BuyoutUploadDetailsCal D
         --		ON A.AccountEntityID=D.AccountEntityID
         --	WHERE A.FinalAssetClassAlt_Key>1
         --		OR (ISNULL(A.DPD_OVERDUE,0) <A.REFPERIODOVERDUE) 
         --	GROUP BY A.UcifEntityID
         --delete A 
         --from #UCIF_ENTITYID a
         --	INNER JOIN  PRO.ACCOUNTCAL B
         --		ON A.UcifEntityID =B.UcifEntityID
         --	WHERE (	   ISNULL(B.DPD_INTSERVICE,0)>=B.REFPERIODINTSERVICE  
         --			OR ISNULL(B.DPD_OVERDRAWN,0)>=B.REFPERIODOVERDRAWN     
         --			OR ISNULL(B.DPD_NOCREDIT,0)>=B.REFPERIODNOCREDIT      
         --               OR ISNULL(B.DPD_OVERDUE,0) >=B.REFPERIODOVERDUE        
         --               OR ISNULL(B.DPD_STOCKSTMT,0)>=B.REFPERIODSTKSTATEMENT  
         --			OR ISNULL(B.DPD_RENEWAL,0)>=B.REFPERIODREVIEW         
         --			)
         --	 UPDATE A
         --		SET A.FlgUpg='U'
         --	FROM PRO.CUSTOMERCAL A
         --	 INNER JOIN #UCIF_ENTITYID B
         --		ON A.UcifEntityID=B.UcifEntityID
         --		----and a.CustomerEntityID=1194338
         --	 INNER JOIN DIMASSETCLASS C ON C.AssetClassAlt_Key=A.SYSASSETCLASSALT_KEY 
         --		AND (C.EffectiveFromTimeKey<=@Timekey AND C.EffectiveToTimeKey>=@Timekey)
         --	WHERE	isnull(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
         --			AND  C.ASSETCLASSGROUP ='NPA' 
         --			AND ISNULL(A.FLGDEG,'N')<>'Y' 
         /*END OF BUYOUT UPGRADE */
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_1711') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE1_11 ';
         END IF;
         DELETE FROM tt_TEMPTABLE1_11;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE1_11');

         INSERT INTO tt_TEMPTABLE1_11 ( 
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
                JOIN tt_TEMPTABLE1_11 B   ON A.UCIF_ID = B.UCIF_ID
                JOIN DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_171RefCustomerID') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLERefCustomerID_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLERefCustomerID_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLERefCustomerID_6');

         INSERT INTO tt_TEMPTABLERefCustomerID_6 ( 
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
                JOIN tt_TEMPTABLERefCustomerID_6 B   ON A.RefCustomerID = B.RefCustomerID
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
         IF utils.object_id('TEMPDB..tt_PANUPDATEUPGRADE_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_PANUPDATEUPGRADE_6 ';
         END IF;
         DELETE FROM tt_PANUPDATEUPGRADE_6;
         UTILS.IDENTITY_RESET('tt_PANUPDATEUPGRADE_6');

         INSERT INTO tt_PANUPDATEUPGRADE_6 ( 
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
         FROM B ,tt_PANUPDATEUPGRADE_6 A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.PANNO = B.PANNO 
          WHERE B.FlgUpg = 'U') src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FLGUPG = 'N';
         /* RFESTR UPGRADE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )
          THEN (CASE 
                     WHEN DPD_Breach_Date IS NOT NULL
                       AND (CASE 
                                 WHEN NVL(SP_ExpiryDate, '1900-01-01') >= NVL(SP_ExpiryExtendedDate, '1900-01-01') THEN SP_ExpiryDate
                     ELSE SP_ExpiryExtendedDate
                        END) >= v_PROCESSDATE THEN 'N'
         ELSE C.FlgUpg
            END)
         WHEN ParameterShortNameEnum IN ( 'PRUDENTIAL' )
          THEN 'N'
         WHEN ParameterShortNameEnum IN ( 'IRAC','OTHER' )
          THEN (CASE 
                     WHEN DPD_Breach_Date IS NOT NULL
                       OR SP_ExpiryDate >= v_PROCESSDATE THEN 'N'
         ELSE C.FlgUpg
            END)
         ELSE B.FlgUpg
            END AS FLGUPG
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
                JOIN CUSTOMERCAL C   ON C.CustomerEntityID = B.CustomerEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key 
          WHERE D.DimParameterName = 'TypeofRestructuring'
           AND ParameterShortNameEnum IN ( 'IRAC','OTHER','MSME_OLD','MSME_COVID','MSME_COVID_RF2','PRUDENTIAL' )

           AND C.FlgUpg = 'U') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET C.FLGUPG -- AS DISCUSSED WITH aSHISH sIR - PRIDENTIAL ACCOUNTS NEVER WILL WILL UPGRADE- WILL BE NPA TILL THEN CLOSED
                                       --(CASE WHEN DPD_Breach_Date IS NOT NULL OR InvestmentGrade='N'
                                       --		THEN 'N'
                                       --	ELSE
                                       --		C.FlgUpg
                                       --	END
                                       --)
                                       = src.FLGUPG;
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, 'N', ',DEGRADEY BY RESTRUCTURE' AS pos_3
         FROM C ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
                JOIN CUSTOMERCAL C   ON C.CustomerEntityID = B.CustomerEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE A.FlgUpg = 'N'
           AND C.FlgUpg = 'U'
           AND ParameterShortNameEnum IN ( 'IRAC','OTHER','MSME_OLD','MSME_COVID','MSME_COVID_RF2','PRUDENTIAL' )
         ) src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET C.FLGUPG = 'N',
                                      C.DegReason = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN ActualDCCO_Date IS NOT NULL
           OR RevisedDCCO > v_PROCESSDATE
           OR ( RevisedDCCO IS NULL
           AND FinnalDCCO_Date > v_PROCESSDATE )
           AND ( ( NVL(CostOverRunPer, 0) <= 10 )
           OR ( NVL(RevisedDebt, 0) <= NVL(OriginalDebt, 0) ) ) THEN 'U'
         WHEN ( TakeOutFinance = 'N' ) THEN 'U'   END AS FLG_UPG
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID 
          WHERE b.FinalAssetClassAlt_Key > 1
           AND B.DPD_Max = 0
           AND B.FlgUpg = 'U') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLG_UPG ---AND AssetClassSellerBookAlt_key>1
                                       = src.FLG_UPG;
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, 'N'
         FROM C ,PRO_RBL_MISDB_PROD.PUI_CAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL C   ON C.CustomerEntityID = A.CustomerEntityID 
          WHERE A.FLG_UPG = 'N'
           AND C.FlgUpg = 'U') src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET FLGUPG = 'N';
         /*END OF PUI WORK*/
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
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_171 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE1_11 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLERefCustomerID_6 ';
         /* added by amar on 14102021 for check acl and dpd missmatch issue*/
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                             WHERE  ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' )
                                      AND NVL(A.Balance, 0) > 0
                                      AND A.FinalAssetClassAlt_Key = 1
                                      AND ( NVL((CASE 
                                                      WHEN A.IntNotServicedDt IS NOT NULL THEN utils.datediff('DAY', A.IntNotServicedDt, v_PROCESSDATE)
                                                ELSE 0
                                                   END), 0) >= A.REFPERIODINTSERVICE
                                      OR NVL((CASE 
                                                   WHEN A.ContiExcessDt IS NOT NULL THEN utils.datediff('DAY', A.ContiExcessDt, v_PROCESSDATE) + 1
                                             ELSE 0
                                                END), 0) >= A.REFPERIODOVERDRAWN
                                      OR NVL(CASE 
                                                  WHEN ( DebitSinceDt IS NULL
                                                    OR utils.datediff('DAY', DebitSinceDt, v_PROCESSDATE) > 90 ) THEN (CASE 
                                                                                                                            WHEN A.LastCrDate IS NOT NULL THEN utils.datediff('DAY', A.LastCrDate, v_PROCESSDATE)
                                                  ELSE 0
                                                     END)
                                             ELSE 0
                                                END, 0) >= A.REFPERIODNOCREDIT
                                      OR NVL((CASE 
                                                   WHEN A.OverDueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.OverDueSinceDt, v_PROCESSDATE)
                                             ELSE 0
                                                END), 0) >= A.REFPERIODOVERDUE
                                      OR NVL((CASE 
                                                   WHEN A.StockStDt IS NOT NULL THEN utils.datediff('DAY', A.StockStDt, v_PROCESSDATE)
                                             ELSE 0
                                                END), 0) >= A.REFPERIODSTKSTATEMENT
                                      OR NVL((CASE 
                                                   WHEN A.ReviewDueDt IS NOT NULL THEN utils.datediff('DAY', A.ReviewDueDt, v_PROCESSDATE)
                                             ELSE 0
                                                END), 0) >= A.REFPERIODREVIEW ) );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            utils.raiserror( 0, 'Missmatch in DPD and Asset Class, need to check....' );

         END;
         END IF;
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

  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_29032022" TO "ADF_CDR_RBL_STGDB";
