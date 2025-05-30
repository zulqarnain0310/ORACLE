--------------------------------------------------------
--  DDL for Procedure UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" /*=========================================
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
    DECLARE V_SQLERRM VARCHAR(150);
   BEGIN
      DECLARE
      V_REFPERIODLATESTBS_DATE SMALLINT:=360;
         /*check the customer when all account to cutomer dpdmax must be 0*/
         v_PROCESSDATE VARCHAR2(200) ;

      BEGIN
               SELECT Date_ INTO v_PROCESSDATE 
           FROM RBL_MISDB_PROD.SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY ;
          
        UPDATE GTT_ACCOUNTCAL SET FLGUPG='N';
        UPDATE GTT_CUSTOMERCAL SET FLGUPG='N';

         IF utils.object_id('TEMPDB..GTT_TEMPTABLE') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE GTT_TEMPTABLE ';
         END IF;
         DELETE FROM GTT_TEMPTABLE;
         UTILS.IDENTITY_RESET('GTT_TEMPTABLE');

         INSERT INTO GTT_TEMPTABLE ( 
         	SELECT A.UCIF_ID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.UCIF_ID ,COUNT(1)  TOTALCOUNT  FROM GTT_CUSTOMERCAL A
                          JOIN GTT_ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
                    WHERE  ( A.FlgProcessing = 'N' ) AND A.UCIF_ID IS NOT NULL AND B.ASSET_NORM NOT IN ('ALWYS_STD')
                     GROUP BY A.UCIF_ID 
                     UNION ALL
                        SELECT B.UCIFID,COUNT(1) TOTALCOUNT FROM CURDAT_RBL_MISDB_PROD.InvestmentFinancialDetail A
                        INNER JOIN CURDAT_RBL_MISDB_PROD.InvestmentIssuerDetail B
                        ON A.RefIssuerID=B.IssuerID
                        AND A.EffectiveFromTimeKey<=V_TIMEKEY AND A.EffectiveToTimeKey>=V_TIMEKEY
                        AND B.EffectiveFromTimeKey<=V_TIMEKEY AND B.EffectiveToTimeKey>=V_TIMEKEY
                        AND A.Asset_Norm NOT IN ('ALWYS_STD')
                        GROUP BY B.UCIFID
                        UNION ALL
                        SELECT A.UCIC_ID,COUNT(1) TOTALCOUNT FROM 
                        CurDat_RBL_MISDB_PROD.DerivativeDetail A
                        WHERE A.EffectiveFromTimeKey<=V_TIMEKEY AND A.EffectiveToTimeKey>=V_TIMEKEY
                        GROUP BY A.UCIC_ID
                     ) A
                   JOIN ( SELECT A.UCIF_ID ,
                                 COUNT(1)  TOTALDPD_MAXCOUNT  
                          FROM GTT_CUSTOMERCAL A
                                 JOIN GTT_ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
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
                                    AND NVL(B.UNSERVIEDINT,0)=0 
                                    AND  NVL(B.AccountStatus,'N')<>'Z'
                                    AND ( (FacilityType IN('CC','OD') and NVL(IntOverdue,0)=0) OR (NVL(FacilityType,'') NOT IN('CC','OD')))
                                    
                                    UNION ALL
                                    SELECT B.UCIFID,COUNT(1) TOTALDPD_MAXCOUNT FROM CURDAT_RBL_MISDB_PROD.InvestmentFinancialDetail A
                                    INNER JOIN CURDAT_RBL_MISDB_PROD.InvestmentIssuerDetail B
                                    ON A.RefIssuerID=B.IssuerID
                                    AND A.EffectiveFromTimeKey<=V_TIMEKEY AND A.EffectiveToTimeKey>=V_TIMEKEY
                                    AND B.EffectiveFromTimeKey<=V_TIMEKEY AND B.EffectiveToTimeKey>=V_TIMEKEY
                                    WHERE
                                    ((NVL(A.DPD_DivOverdue,0)<=0) and (NVL(A.PartialRedumptionDPD,0)<=0) AND NVL(DPD_BS_Date,0)<V_REFPERIODLATESTBS_DATE
                                    AND NVL(FinalAssetClassAlt_Key,1)<>1
                                    AND A.Asset_Norm NOT IN ('ALWYS_STD'))
                                    GROUP BY B.UCIFID
                                    UNION ALL
                                    SELECT A.UCIC_ID,COUNT(1) TOTALDPD_MAXCOUNT FROM 
                                    CURDAT_RBL_MISDB_PROD.DerivativeDetail A
                                    WHERE A.EffectiveFromTimeKey<=V_TIMEKEY AND A.EffectiveToTimeKey>=V_TIMEKEY
                                    AND ( NVL(A.DPD,0)<=0
                                    AND NVL(FinalAssetClassAlt_Key,1)<>1)
                                    GROUP BY A.UCIC_ID
                                    ) B   ON A.UCIF_ID = B.UCIF_ID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*------ UPGRADING CUSTOMER-----------*/
         MERGE INTO GTT_CUSTOMERCAL A
         USING (SELECT A.ROWID row_id, 'U'
         FROM GTT_CUSTOMERCAL A
                JOIN GTT_TEMPTABLE B   ON A.UCIF_ID = B.UCIF_ID
                JOIN RBL_MISDB_PROD.DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
        
        MERGE INTO  CURDAT_RBL_MISDB_PROD.InvestmentFinancialDetail A 
        --UPDATE A SET A.FlgUpg='U'
        USING (SELECT A.ROWID row_id, 'U'
        FROM CURDAT_RBL_MISDB_PROD.InvestmentFinancialDetail A 
        INNER JOIN CURDAT_RBL_MISDB_PROD.InvestmentIssuerDetail D on A.RefIssuerID = D.IssuerID 
        AND A.EffectiveFromTimeKey <= V_TIMEKEY and A.EffectiveToTimeKey >= V_TIMEKEY
        AND D.EffectiveFromTimeKey <= V_TIMEKEY and D.EffectiveToTimeKey >= V_TIMEKEY
        INNER JOIN GTT_TEMPTABLE B ON D.Ucifid=B.UCIF_ID
         INNER JOIN RBL_MISDB_PROD.DIMASSETCLASS C ON C.AssetClassAlt_Key=A.FinalAssetClassAlt_Key AND (C.EffectiveFromTimeKey<=V_TIMEKEY AND C.EffectiveToTimeKey>=V_TIMEKEY)
        WHERE  (not(NVL(A.ASSET_NORM,'NORMAL')='ALWYS_NPA' ) AND  C.ASSETCLASSGROUP ='NPA' AND not(NVL(A.FLGDEG,'N')='Y')) 
        )SRC 
        ON ( A.ROWID = src.row_id )
        WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
        
        MERGE INTO CURDAT_RBL_MISDB_PROD.DerivativeDetail A
        --UPDATE A SET A.FlgUpg='U'
        USING (SELECT A.ROWID ROW_ID,'U'
        FROM CURDAT_RBL_MISDB_PROD.DerivativeDetail A INNER JOIN GTT_TEMPTABLE B ON A.UCIC_ID=B.UCIF_ID
         INNER JOIN RBL_MISDB_PROD.DIMASSETCLASS C ON C.AssetClassAlt_Key=A.FinalAssetClassAlt_Key AND (C.EffectiveFromTimeKey<=V_TIMEKEY AND C.EffectiveToTimeKey>=V_TIMEKEY)
        WHERE  
          C.ASSETCLASSGROUP ='NPA' AND not(NVL(A.FLGDEG,'N')='Y') 
          )SRC
          ON (A.ROWID=SRC.ROW_ID)
          WHEN MATCHED THEN UPDATE SET A.FlgUpg='U';
         
/* BUYOUT UPGARDE */

/*
	/*  UPGRADE ACCOUNTS- NPA DUTE TO DPD_SELLER/VIRTUAL DPD */
        INSERT INTO GTT_NPA_SELLER
		SELECT UcifEntityID--,a.CustomerAcID
		FROM MAIN_PRO.ACCOUNTCAL A
			inner JOIN MAIN_PRO.BuyoutUploadDetailsCal D
				ON A.AccountEntityID=D.AccountEntityID
				--AND a.customeracid='809002073957'
				and NPA_ClassSeller='N'
			INNER JOIN MAIN_PRO.BuyoutUploadDetailsCal_Hist E
				on e.EffectiveFromTimeKey<=V_TIMEKEY-1 and e.EffectiveToTimeKey>=V_TIMEKEY -1
			WHERE E.NPA_FLAG='NPA_SELLER'
				AND NVL(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
		GROUP BY UcifEntityID;
	
	--SELECT * FROM GTT_NPA_SELLER WHERE  ucifentityid=2860237
		
        DELETE FROM GTT_NPA_SELLER WHERE UcifEntityID IN (
            SELECT B.UcifEntityID FROM MAIN_PRO.ACCOUNTCAL b
    			WHERE NVL(DPD_MAX,0)>0);
            
			--and B.customeracid='809002073957'
        MERGE INTO MAIN_PRO.CUSTOMERCAL A
        USING (
            SELECT A.ROWID row_id, 'U'
		FROM MAIN_PRO.CUSTOMERCAL A
		 INNER JOIN GTT_NPA_SELLER B
			ON A.UcifEntityID=B.UcifEntityID			
		 INNER JOIN RBL_MISDB_PROD.DIMASSETCLASS C ON C.AssetClassAlt_Key=A.SYSASSETCLASSALT_KEY 
			AND (C.EffectiveFromTimeKey<=V_TIMEKEY AND C.EffectiveToTimeKey>=V_TIMEKEY)
		WHERE	NVL(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
				AND  C.ASSETCLASSGROUP ='NPA' )SRC
            ON (A.ROWID=SRC.ROW_ID)
              WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
				
			
-------------------
	/*  UPGRADE ACCOUNTS- NPA DUTE TO VIRTUAL DPD - AND VERTIUAL DPD IS 0 */
		
        INSERT INTO GTT_NPA_VDPD
        
		SELECT UcifEntityID
		FROM MAIN_PRO.ACCOUNTCAL A
			INNER JOIN MAIN_PRO.BuyoutUploadDetailsCal D
				ON A.AccountEntityID=D.AccountEntityID
				------and ucifentityid=2860237
				-------and a.AccountEntityID=2162686
			INNER JOIN MAIN_PRO.BuyoutUploadDetailsCal_Hist E
				on e.EffectiveFromTimeKey<=V_TIMEKEY-1 and e.EffectiveToTimeKey>=V_TIMEKEY -1
				AND A.AccountEntityID=E.AccountEntityId
			WHERE E.NPA_FLAG='NPA_VDPD' and d.PeakDPD is not null
							AND (NVL(D.PeakDPD,0)<A.RefPeriodOverdue and NVL(D.DPD_Seller,0)>0)
		GROUP BY UcifEntityID;


		DELETE FROM GTT_NPA_VDPD
        WHERE UcifEntityID IN (
		SELECT UcifEntityID FROM  MAIN_PRO.ACCOUNTCAL B
		WHERE (	   NVL(B.DPD_INTSERVICE,0)>=B.REFPERIODINTSERVICE  
				OR NVL(B.DPD_OVERDRAWN,0)>=B.REFPERIODOVERDRAWN     
				OR NVL(B.DPD_NOCREDIT,0)>=B.REFPERIODNOCREDIT      
                OR NVL(B.DPD_OVERDUE,0) >=B.REFPERIODOVERDUE        
                OR NVL(B.DPD_STOCKSTMT,0)>=B.REFPERIODSTKSTATEMENT  
				OR NVL(B.DPD_RENEWAL,0)>=B.REFPERIODREVIEW         
				)
                );


        MERGE INTO MAIN_PRO.CUSTOMERCAL A
        USING (SELECT A.ROWID ROW_ID,'U'
                FROM MAIN_PRO.CUSTOMERCAL A
        		 INNER JOIN GTT_NPA_VDPD B
            	ON A.UcifEntityID=B.UcifEntityID
		 INNER JOIN RBL_MISDB_PROD.DIMASSETCLASS C ON C.AssetClassAlt_Key=A.SYSASSETCLASSALT_KEY 
			AND (C.EffectiveFromTimeKey<=V_TIMEKEY AND C.EffectiveToTimeKey>=V_TIMEKEY)
		WHERE	NVL(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
				AND  C.ASSETCLASSGROUP ='NPA')SRC
                ON (A.ROWID=SRC.ROW_ID)
        WHEN MATCHED THEN UPDATE SET A.FlgUpg='U';
        
				

	/*  UPGRADE ACCOUNTS- NPA DUTE TO VIRTUAL DPD - AND VERTIUAL DPD IS >0 */
		EXECUTE IMMEDIATE 'TRUNCATE TABLE GTT_NPA_VDPD;';
        
        INSERT INTO GTT_NPA_VDPD
		SELECT UcifEntityID		
		FROM MAIN_PRO.ACCOUNTCAL A
			INNER JOIN MAIN_PRO.BuyoutUploadDetailsCal D
				ON A.AccountEntityID=D.AccountEntityID
			INNER JOIN MAIN_PRO.BuyoutUploadDetailsCal_Hist E
				on e.EffectiveFromTimeKey<=V_TIMEKEY-1 and e.EffectiveToTimeKey>=V_TIMEKEY -1
				AND A.AccountEntityID=E.AccountEntityId
			WHERE E.NPA_FLAG='NPA_VDPD' and d.PeakDPD is not null
							AND NVL(D.DPD_Seller,0)=0
		GROUP BY UcifEntityID;

		DELETE from GTT_NPA_VDPD A WHERE UcifEntityID IN (SELECT 
		UcifEntityID FROM MAIN_PRO.ACCOUNTCAL 
		WHERE (	NVL(dpd_max,0)>0));

        MERGE INTO MAIN_PRO.CUSTOMERCAL A
        USING (SELECT A.ROWID ROW_ID,'U'
    		FROM MAIN_PRO.CUSTOMERCAL A
		 INNER JOIN GTT_NPA_VDPD B
			ON A.UcifEntityID=B.UcifEntityID
		 INNER JOIN RBL_MISDB_PROD.DIMASSETCLASS C ON C.AssetClassAlt_Key=A.SYSASSETCLASSALT_KEY 
			AND (C.EffectiveFromTimeKey<=V_TIMEKEY AND C.EffectiveToTimeKey>=V_TIMEKEY)
		WHERE	NVL(A.ASSET_NORM,'NORMAL')<>'ALWYS_NPA' 
				AND  C.ASSETCLASSGROUP ='NPA' )SRC
                ON (A.ROWID=SRC.ROW_ID)
                WHEN MATCHED THEN UPDATE SET A.FLGUPG='U';

	
	--DROP TABLE IF EXISTS #UCIF_ENTITYID

	         IF utils.object_id('TEMPDB..tt_TEMPTABLE_1761') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE1_16 ';
         END IF;
         DELETE FROM tt_TEMPTABLE1_16;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE1_16');

         INSERT INTO tt_TEMPTABLE1_16 ( 
         	SELECT A.UCIF_ID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.UCIF_ID ,
                          COUNT(1)  TOTALCOUNT  
                   FROM GTT_CUSTOMERCAL A
                          JOIN GTT_ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
                    WHERE  ( A.FlgProcessing = 'N' )
                             AND A.UCIF_ID IS NOT NULL
                     GROUP BY A.UCIF_ID ) A
                   JOIN ( SELECT A.UCIF_ID ,
                                 COUNT(1)  TOTALDPD_MAXCOUNT  
                          FROM GTT_CUSTOMERCAL A
                                 JOIN GTT_ACCOUNTCAL B   ON A.UCIF_ID = B.UCIF_ID
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
                                    AND A.UCIF_ID IS NOT NULL
                            GROUP BY A.UCIF_ID ) B   ON A.UCIF_ID = B.UCIF_ID
                   AND A.TOTALCOUNT = B.TOTALDPD_MAXCOUNT );
         /*------ UPGRADING CUSTOMER-----------*/
         MERGE INTO GTT_CUSTOMERCAL A
         USING (SELECT A.ROWID row_id, 'U'
         FROM GTT_CUSTOMERCAL A
                JOIN tt_TEMPTABLE1_16 B   ON A.UCIF_ID = B.UCIF_ID
                JOIN RBL_MISDB_PROD.DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         

         
MERGE INTO CURDAT_RBL_MISDB_PROD.InvestmentFinancialDetail A 
USING(SELECT A.ROWID ROW_ID
FROM CURDAT_RBL_MISDB_PROD.InvestmentFinancialDetail A 
INNER JOIN CURDAT_RBL_MISDB_PROD.InvestmentIssuerDetail D on A.RefIssuerID = D.IssuerID 
AND A.EffectiveFromTimeKey <= V_TIMEKEY and A.EffectiveToTimeKey >= V_TIMEKEY
AND D.EffectiveFromTimeKey <= V_TIMEKEY and D.EffectiveToTimeKey >= V_TIMEKEY
INNER JOIN GTT_TEMPTABLE B ON D.Ucifid=B.UCIF_ID
 INNER JOIN RBL_MISDB_PROD.DIMASSETCLASS C ON C.AssetClassAlt_Key=A.FinalAssetClassAlt_Key AND 
                                                (C.EffectiveFromTimeKey<=V_TIMEKEY AND C.EffectiveToTimeKey>=V_TIMEKEY)
WHERE  (not(NVL(A.ASSET_NORM,'NORMAL')='ALWYS_NPA' ) AND  C.ASSETCLASSGROUP ='NPA' AND not(NVL(A.FLGDEG,'N')='Y')) 
)SRC ON (A.ROWID=SRC.ROW_ID)
WHEN MATCHED THEN UPDATE SET A.FlgUpg='U';
         
         
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_176RefCustomerID') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE GTT_TEMPTABLERefCustomerID ';
         END IF;
         DELETE FROM GTT_TEMPTABLERefCustomerID;
         UTILS.IDENTITY_RESET('GTT_TEMPTABLERefCustomerID');

         INSERT INTO GTT_TEMPTABLERefCustomerID ( 
         	SELECT A.RefCustomerID ,
                 TOTALCOUNT 
         	  FROM ( SELECT A.RefCustomerID ,
                          COUNT(1)  TOTALCOUNT  
                   FROM GTT_CUSTOMERCAL A
                          JOIN GTT_ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID
                    WHERE  ( A.FlgProcessing = 'N' )
                             AND A.UCIF_ID IS NULL
                             AND A.RefCustomerID IS NOT NULL
                     GROUP BY A.RefCustomerID ) A
                   JOIN ( SELECT A.RefCustomerID ,
                                 COUNT(1)  TOTALDPD_MAXCOUNT  
                          FROM GTT_CUSTOMERCAL A
                                 JOIN GTT_ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID
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
         MERGE INTO GTT_CUSTOMERCAL A
         USING (SELECT A.ROWID row_id, 'U'
         FROM GTT_CUSTOMERCAL A
                JOIN GTT_TEMPTABLERefCustomerID B   ON A.RefCustomerID = B.RefCustomerID
                JOIN RBL_MISDB_PROD.DIMASSETCLASS C   ON C.AssetClassAlt_Key = A.SysAssetClassAlt_Key
                AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE ( NOT ( NVL(A.Asset_Norm, 'NORMAL') = 'ALWYS_NPA' )
           AND C.ASSETCLASSGROUP = 'NPA'
           AND NOT ( NVL(A.FlgDeg, 'N') = 'Y' ) )
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgUpg = 'U';
         
         UPDATE GTT_CUSTOMERCAL
            SET SysNPA_Dt = NULL,
                DbtDt = NULL,
                LossDt = NULL,
                ErosionDt = NULL,
                FlgErosion = 'N',
                SysAssetClassAlt_Key = 1,
                FlgDeg = 'N'
          WHERE  FlgUpg = 'U';
         /*--------MARKING UPGRADED ACCOUNT --------------*/
         MERGE INTO GTT_ACCOUNTCAL B
         USING (SELECT B.ROWID row_id, v_PROCESSDATE
         FROM GTT_CUSTOMERCAL A
                JOIN GTT_ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE NVL(A.FlgUpg, 'U') = 'U'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.UpgDate = v_PROCESSDATE,
                                      B.DegReason = NULL,
                                      B.FinalAssetClassAlt_Key = 1,
                                      B.FlgDeg = 'N',
                                      B.FinalNpaDt = NULL,
                                      B.FlgUpg = 'U';
         MERGE INTO GTT_ACCOUNTCAL B  
         USING (SELECT B.ROWID row_id, v_PROCESSDATE
         FROM GTT_CUSTOMERCAL A
                JOIN GTT_ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE NVL(A.FlgUpg, 'U') = 'U'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.UpgDate = v_PROCESSDATE,
                                      B.DegReason = NULL,
                                      B.FinalAssetClassAlt_Key = 1,
                                      B.FlgDeg = 'N',
                                      B.FinalNpaDt = NULL,
                                      B.FlgUpg = 'U';
         MERGE INTO GTT_CUSTOMERCAL A 
         USING (SELECT A.ROWID row_id, NULL
         FROM GTT_CUSTOMERCAL A 
          WHERE SysAssetClassAlt_Key = 1
           AND DegReason IS NOT NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = NULL;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE GTT_TEMPTABLE ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE1_16 ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE GTT_TEMPTABLERefCustomerID ';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Upgrade_Customer_Account_UCIF_ID';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
    V_SQLERRM :=SQLERRM;
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = V_SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Upgrade_Customer_Account_UCIF_ID';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPGRADE_CUSTOMER_ACCOUNT_UCIF_ID_21082024" TO "ADF_CDR_RBL_STGDB";
