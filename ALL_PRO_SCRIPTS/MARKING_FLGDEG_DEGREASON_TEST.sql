--------------------------------------------------------
--  DDL for Procedure MARKING_FLGDEG_DEGREASON_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : MARKING OF FLGDEG AND DEG REASON 
 --EXEC [Pro].[Marking_FlgDeg_Degreason] @TIMEKEY=25140
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         /*---------------INTIAL LEVEL FLG DEG SET N------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = 'N';
         /*---------------UPDATE DEG FLAG AT CUSTOMER LEVEL------------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'N'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgDeg = 'N';
         /*---------------UPDATE DEG FLAG AT ACCOUNT LEVEL-----------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN NVL(A.DPD_IntService, 0) >= A.RefPeriodIntService THEN 'Y'
         WHEN NVL(A.DPD_Overdrawn, 0) >= A.RefPeriodOverDrawn THEN 'Y'
         WHEN NVL(A.DPD_NoCredit, 0) >= A.RefPeriodNoCredit THEN 'Y'
         WHEN NVL(A.DPD_Overdue, 0) >= A.RefPeriodOverdue THEN 'Y'
         WHEN NVL(A.DPD_StockStmt, 0) >= A.RefPeriodStkStatement THEN 'Y'
         WHEN NVL(A.DPD_Renewal, 0) >= A.RefPeriodReview THEN 'Y'
         ELSE 'N'
            END) AS FLGDEG
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( a.FinalAssetClassAlt_Key IN ( SELECT AssetClassAlt_Key 
                                                FROM DimAssetClass 
                                                 WHERE  AssetClassShortNameEnum IN ( 'STD' )

                                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                                          AND EffectiveToTimeKey >= v_TIMEKEY )
          )
           AND ( NVL(A.Asset_Norm, 'NORMAL') <> 'ALWYS_STD' )
           AND ( B.FlgProcessing = 'N' )
           AND NVL(InMonthMark, 'N') = 'Y'
           AND NVL(B.FlgMoc, 'N') = 'N'
           AND NVL(A.Balance, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = src.FLGDEG;
         /* RESTRUCTURE DEGRADE */
         /* UPDATE DPD_Breach_Date FOR 'RESOLUTION'  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE DPD_Breach_Date IS NULL
           AND D.ParameterShortNameEnum IN ( 'COVID_OTR_RF','COVID_OTR_RF_2' )

           AND ( ( FacilityType NOT IN ( 'CC','OD' )

           AND NVL(DPD_MaxFin, 0) > 30 )
           OR ( FacilityType IN ( 'CC','OD' )

           AND NVL(B.DPD_Overdrawn, 0) > 60 ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.DPD_Breach_Date = v_ProcessDate,
                                      D.ZeroDPD_Date = NULL,
                                      D.SP_ExpiryExtendedDate = NULL;
         /* update DPD_Breach_Date -  'MSME_OLD','MSME_COVID' */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE DPD_Breach_Date IS NULL
           AND D.ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )

           AND ( NVL(DPD_MaxNonFin, 0) >= 90
           OR NVL(DPD_MaxFin, 0) > 30 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.DPD_Breach_Date = v_ProcessDate,
                                      D.ZeroDPD_Date = NULL,
                                      D.SP_ExpiryExtendedDate = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE DPD_Breach_Date IS NOT NULL
           AND D.ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )

           AND ( NVL(DPD_MaxNonFin, 0) < 90
           AND NVL(DPD_MaxFin, 0) <= 30 )
           AND ZeroDPD_Date IS NULL
           AND (CASE 
                     WHEN NVL(SP_ExpiryDate, '1900-01-01') >= NVL(SP_ExpiryExtendedDate, '1900-01-01') THEN SP_ExpiryDate
         ELSE SP_ExpiryExtendedDate
            END) > v_ProcessDate) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.ZeroDPD_Date = v_ProcessDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN SP_ExpiryDate < utils.dateadd('YY', 1, v_ProcessDate) THEN utils.dateadd('YY', 1, v_ProcessDate)
         ELSE NULL
            END AS SP_ExpiryExtendedDate
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE DPD_Breach_Date IS NOT NULL
           AND D.ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )

           AND ZeroDPD_Date = v_ProcessDate) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate;
         /* update DPD_Breach_Date -  'PRUDENTIAL','IRAC','OTHER' */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE DPD_Breach_Date IS NULL
           AND D.ParameterShortNameEnum IN ( 'PRUDENTIAL','IRAC','OTHER' )

           AND ( ( FacilityType NOT IN ( 'CC','OD' )

           AND NVL(DPD_MaxFin, 0) > 0 )
           OR ( ( FacilityType IN ( 'CC','OD' )

           AND ( NVL(DPD_MaxFin, 0) >= 30
           OR NVL(DPD_MaxNonFin, 0) >= 90 ) ) ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.DPD_Breach_Date = v_ProcessDate,
                                      D.ZeroDPD_Date = NULL,
                                      D.SP_ExpiryExtendedDate = NULL;
         /*  RESOLUTION  COVID- PERAONl AND OTHERS */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         --,DegDate=CASE WHEN PreRestructureNPA_Date IS NOT NULL 
          --				THEN PreRestructureNPA_Date
          --			ELSE 
          --					A.RestructureDt
          --			END
         , CASE 
         WHEN Res_POS_to_CurrentPOS_Per <= 30 THEN 'Restructured slippage'
         ELSE ' '
            END AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                JOIN DimParameter E   ON E.EffectiveFromTimeKey <= v_timekey
                AND E.EffectiveToTimeKey >= v_timekey
                AND E.ParameterAlt_Key = A.COVID_OTR_CatgAlt_Key
                AND D.DimParameterName = 'Covid - OTR Category'
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST ac   ON a.AccountEntityId = ac.AccountEntityID 
          WHERE D.ParameterShortNameEnum IN ( 'COVID_OTR_RF','OVID_OTR_RF_2' )

           AND A.FinalAssetClassAlt_Key = 1
           AND ( ( E.ParameterShortNameEnum = 'PERSONAL'
           AND ac.FlgDeg = 'Y' )
           OR ( E.ParameterShortNameEnum = 'OTHER'
           AND DPD_Breach_Date IS NOT NULL
           AND SP_ExpiryDate > v_ProcessDate ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.FlgDeg = 'Y',
                                      A.DegReason = pos_3;
         /* 'MSME_OLD','MSME_COVID' */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST AC   ON A.AccountEntityId = AC.AccountEntityID
                AND ac.FlgDeg = 'Y' 
          WHERE D.DimParameterName = 'TypeofRestructuring'
           AND ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )

           AND A.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.FlgDeg
                                      --,DegDate=CASE WHEN PreRestructureNPA_Date IS NOT NULL 
                                       --			THEN PreRestructureNPA_Date
                                       --		 ELSE 
                                       --			A.RestructureDt
                                       --		 END
                                       --,A.DegReason ='Restructured slippage'
                                       = 'Y';
         /*  'IRAC' ,'OTHER','PRUDENTIAL' */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key 
          WHERE D.DimParameterName = 'TypeofRestructuring'
           AND ParameterShortNameEnum IN ( 'IRAC','OTHER','PRUDENTIAL' )

           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.FlgDeg
                                      --,DegDate=CASE WHEN PreRestructureNPA_Date IS NOT NULL 
                                       --		THEN PreRestructureNPA_Date 
                                       --	ELSE A.RestructureDt END
                                       = 'Y';
         --and (isnull(SP_ExpiryExtendedDate,SP_ExpiryDate)>@ProcessDate
         --	)
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.FlgDeg
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId 
          WHERE B.FlgDeg = 'Y'
           AND a.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgDeg
                                      --	   ,A.FinalNpaDt=B.DegDate
                                       --	   ,DegReason=ISNULL(a.DegReason,'')+',DEGRADE BY RESTRUCTURE'	
                                       = src.FlgDeg;
         --UPDATE C
         --	SET C.FlgDeg=B.FlgDeg
         --	   ,C.SrcNPA_Dt=B.DegDate
         --	   ,DegReason=ISNULL(a.DegReason,'')+',DEGRADE BY RESTRUCTURE'	
         --FROM PRO.AccountCal_TEST A
         --	INNER JOIN PRO.AdvAcRestructureCal B
         --		ON A.AccountEntityID =B.AccountEntityId
         --	INNER JOIN PRO.CustomerCal_TEST C
         --		ON C.CustomerEntityID =A.CustomerEntityID
         --WHERE B.FlgDeg='Y'
         /*END OF RFESTR WORK */
         /* ------------------------UPDATE DEG FLAG AT CUSTOMER LEVEL----------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE A.FlgDeg = 'Y'
           AND ( B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgDeg = 'Y';
         /*---------------------ASSIGNE DEG REASON------------------------------------------------------*/
         --UPDATE  A SET A.DEGREASON=NULL 
         --FROM PRO.AccountCal_TEST A INNER JOIN PRO.CustomerCal_TEST B ON A.RefCustomerID =B.RefCustomerID
         --WHERE (B.FlgProcessing='N')
         --UPDATE A SET A.NPA_Reason= ISNULL(A.NPA_Reason,'')+' DEGRADE BY INT NOT SERVICED'  
         --FROM PRO.AccountCal_TEST A INNER JOIN PRO.CustomerCal_TEST B ON A.CustomerEntityID =B.CustomerEntityID
         --WHERE (B.FlgProcessing='N')  AND ( isnull(FinalAssetClassAlt_Key,1)<>1 AND (A.DPD_INTSERVICE>0))
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || 'DEGRADE BY INT NOT SERVICED' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND ( A.DPD_IntService >= A.RefPeriodIntService ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY CONTI EXCESS' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Overdrawn >= A.RefPeriodOverDrawn )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY NO CREDIT' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_NoCredit >= A.RefPeriodNoCredit )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_StockStmt >= A.RefPeriodStkStatement )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS DEGREASON
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Renewal >= A.RefPeriodReview )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DEGREASON = src.DEGREASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY OVERDUE' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Overdue >= A.RefPeriodOverdue )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'N' )
           AND B.DegReason IS NOT NULL
           AND A.FinalAssetClassAlt_Key > 1
           AND A.DegReason IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Marking_FlgDeg_Degreason';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_FlgDeg_Degreason';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_TEST" TO "ADF_CDR_RBL_STGDB";
