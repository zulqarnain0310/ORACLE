--------------------------------------------------------
--  DDL for Procedure MARKING_FLGDEG_DEGREASON_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" /*=========================================
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
         --UPDATE C
         --	SET C.FlgDeg=B.FlgDeg
         --	   ,C.SrcNPA_Dt=B.DegDate
         --	   ,DegReason=ISNULL(a.DegReason,'')+',DEGRADE BY RESTRUCTURE'	
         --FROM PRO.ACCOUNTCAL A
         --	INNER JOIN PRO.AdvAcRestructureCal B
         --		ON A.AccountEntityID =B.AccountEntityId
         --	INNER JOIN PRO.CUSTOMERCAL C
         --		ON C.CustomerEntityID =A.CustomerEntityID
         --WHERE B.FlgDeg='Y'
         /*END OF RFESTR WORK */
         /* START OF PUI WORK*/
         ---The NPA reason in this case will be “Original DCCO is Crossed */
         v_DysOfDelay NUMBER(10,0) := 90;

      BEGIN
         /*---------------INTIAL LEVEL FLG DEG SET N------------------------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = 'N';
         /*---------------UPDATE DEG FLAG AT CUSTOMER LEVEL------------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'N'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
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
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
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
         /* LOAN BUYOUT DPD CALCULATION */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y', CASE 
         WHEN NVL(B.DPD_Seller, 0) >= A.RefPeriodOverdue THEN 'NPA Due to Virtual DPD'   END AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE NVL(A.DPD_Overdue, 0) >= A.RefPeriodOverdue
           AND A.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = 'Y',
                                      DegReason --------WHEN  PeakDPD>=A.REFPERIODOVERDUE THEN 'NPA due to Months Peak DPD'
                                       = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y', 'NPA with Seller' AS pos_3, 'ALWYS_NPA'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE B.NPA_ClassSeller = 'Y'
           AND A.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGDEG = 'Y',
                                      DegReason = pos_3,
                                      Asset_Norm = 'ALWYS_NPA';
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, CASE 
         WHEN NVL(A.DPD_Overdue, 0) >= A.RefPeriodOverdue THEN 'NPA_VDPD'
         WHEN B.NPA_ClassSeller = 'Y' THEN 'NPA_SELLER'
         ELSE B.NPA_Flag
            END AS NPA_FLAG
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE NVL(A.DPD_Overdue, 0) >= A.RefPeriodOverdue
           AND A.FinalAssetClassAlt_Key = 1) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_FLAG = src.NPA_FLAG;
         /* END OF LOAN BUYOUT CODE */
         /* RESTRUCTURE DEGRADE */
         /* UPDATE DPD_Breach_Date FOR 'RESOLUTION'  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
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
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
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
         USING (SELECT A.ROWID row_id, v_ProcessDate, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
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
         WHEN MATCHED THEN UPDATE SET D.ZeroDPD_Date = v_ProcessDate,
                                      D.DPD_Breach_Date = NULL;
         ----------------------------------------------------------------------------------------------------------------------------------------------
         --UPDATE A
         --	SET SP_ExpiryExtendedDate=CASE WHEN SP_ExpiryDate < DATEADD(yy,1,@ProcessDate)
         --										THEN DATEADD(yy,1,@ProcessDate)
         --									ELSE  NULL END
         --FROM  PRO.AdvAcRestructureCal A
         --	INNER JOIN PRO.ACCOUNTCAL B
         --		ON A.AccountEntityId =B.AccountEntityID
         --	INNER JOIN DimParameter D 
         --		ON D.EffectiveFromTimeKey <=@timekey AND D.EffectiveToTimeKey>=@timekey 
         --		AND D.ParameterAlt_Key=A.RestructureTypeAlt_Key
         --		AND D.DimParameterName='TypeofRestructuring' 
         --WHERE DPD_Breach_Date IS NOT NULL
         --	AND D.ParameterShortNameEnum IN('MSME_OLD','MSME_COVID','MSME_COVID_RF2')
         --	and DPD_Breach_Date=@ProcessDate
         ------------------------------------------Added by Prashant 14-09-2022--as per Ashish Sir mail dated 12-09-2022-----------------------------------------------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN SP_ExpiryDate < utils.dateadd('YY', 1, v_ProcessDate) THEN utils.dateadd('YY', 1, v_ProcessDate)
         ELSE NULL
            END AS SP_ExpiryExtendedDate
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE ZeroDPD_Date IS NOT NULL
           AND D.ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )

           AND ZeroDPD_Date = v_ProcessDate) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET D.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate;
         ------------------------------------------------------------------------------------------------------------------------------------
         /* update DPD_Breach_Date -  'PRUDENTIAL','IRAC','OTHER' */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_ProcessDate, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.AccountEntityId = B.AccountEntityID
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
                AND E.DimParameterName = 'Covid - OTR Category'
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL ac   ON a.AccountEntityId = ac.AccountEntityID 
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
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL AC   ON A.AccountEntityId = AC.AccountEntityID
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
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId 
          WHERE B.FlgDeg = 'Y'
           AND a.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgDeg
                                      --	   ,A.FinalNpaDt=B.DegDate
                                       --	   ,DegReason=ISNULL(a.DegReason,'')+',DEGRADE BY RESTRUCTURE'	
                                       = src.FlgDeg;
         ---FinnalDCCO_Date   - Original DCCO, CIO DCCO and FreshDCCO
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN ( utils.datediff('DD', FinnalDCCO_Date, v_ProcessDate) > v_DysOfDelay
           AND RevisedDCCO IS NULL ) THEN 'Original DCCO/ CIO_DCCO is Crossed'
         WHEN ( FinnalDCCO_Date < v_ProcessDate
           AND RevisedDCCO IS NOT NULL
           AND utils.datediff('DD', RevisedDCCO, v_ProcessDate) > 90 ) THEN 'Revised DCCO is crossed'
         WHEN ( RevisedDCCO IS NOT NULL
           AND CostOverrun = 'Y'
           AND ( ( NVL(CostOverRunPer, 0) > 10 )
           OR ( NVL(RevisedDebt, 0) > NVL(OriginalDebt, 0) ) )
           AND ( utils.dateadd('YY', (CASE 
                                           WHEN ProjCategory = 'Infra' THEN 2
                               ELSE 1
                                  END), FinnalDCCO_Date) > RevisedDCCO
           AND utils.dateadd('YY', (CASE 
                                         WHEN ProjCategory = 'Infra' THEN 4
                             ELSE 2
                                END), FinnalDCCO_Date) < RevisedDCCO ) ) THEN 'Cost Overrun or Revised DE Ratio is more than Permissible Limits'
         WHEN ( TakeOutFinance = 'Y'
           AND AssetClassSellerBookAlt_key > 1 ) THEN 'The account is NPA in sellers book'   END AS DEFAULT_REASON
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A 
          WHERE FinalAssetClassAlt_Key = 1
           AND ActualDCCO_Date IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DEFAULT_REASON /* 1. The original DCCO or CIO_DCCO whichever is higher is passed more than -90- days and revised DCCO is blank and Actual DCCO is blank. The NPA reason in this case will be “Original DCCO/ CIO_DCCO is Crossed” (Put case to find which date is applicable)*/ /*2. Original DCCO is passed and revised DCCO is also passed more than -90 days and Actual DCCO is blank. The NPA reason in this case will be “Revised DCCO is crossed” */ /*3. In case of Revised DCCO is not blank and Cost Overrun % is more than 10% or Revised DE ratio is higher than Original DE ratio, the NPA Reason in this case would be “Cost Overrun or Revised DE Ration is more than Permissible Limits”   */
                                      -- add condition for infra 2/4 and non infra 1/2 yr and non 
                                       = src.DEFAULT_REASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y', v_ProcessDate
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A 
          WHERE ( BeyonControlofPromoters = 'Y'
           OR CourtCaseArbitration = 'Y' )
           AND RevisedDCCO <= utils.dateadd('YY', (CASE 
                                                        WHEN ProjCategory = 'Infra' THEN 2
                                            ELSE 1
                                               END), FinnalDCCO_Date)) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET RESTRUCTURING = 'Y',
                                      RestructureDate = v_ProcessDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y', v_ProcessDate
         FROM A ,PRO_RBL_MISDB_PROD.PUI_CAL A 
          WHERE NVL(DEFAULT_REASON, ' ') <> ' ') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLG_DEG = 'Y',
                                      A.NPA_DATE = v_ProcessDate;
         /* END  OF PUI WORK*/
         /* ------------------------UPDATE DEG FLAG AT CUSTOMER LEVEL----------------------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'Y'
         FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE A.FlgDeg = 'Y'
           AND ( B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgDeg = 'Y';
         /*---------------------ASSIGNE DEG REASON------------------------------------------------------*/
         --UPDATE  A SET A.DEGREASON=NULL 
         --FROM PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.RefCustomerID =B.RefCustomerID
         --WHERE (B.FlgProcessing='N')
         --UPDATE A SET A.NPA_Reason= ISNULL(A.NPA_Reason,'')+' DEGRADE BY INT NOT SERVICED'  
         --FROM PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.CustomerEntityID =B.CustomerEntityID
         --WHERE (B.FlgProcessing='N')  AND ( isnull(FinalAssetClassAlt_Key,1)<>1 AND (A.DPD_INTSERVICE>0))
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || 'DEGRADE BY INT NOT SERVICED' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND ( A.DPD_IntService >= A.RefPeriodIntService ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY CONTI EXCESS' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Overdrawn >= A.RefPeriodOverDrawn )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY NO CREDIT' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_NoCredit >= A.RefPeriodNoCredit )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY STOCK STATEMENT' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_StockStmt >= A.RefPeriodStkStatement )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY REVIEW DUE DATE' AS DEGREASON
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Renewal >= A.RefPeriodReview )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DEGREASON = src.DEGREASON;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(A.DegReason, ' ') || ', DEGRADE BY OVERDUE' AS DegReason
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( B.FlgProcessing = 'N' )
           AND ( A.FlgDeg = 'Y'
           AND A.DPD_Overdue >= A.RefPeriodOverdue )
           AND NVL(a.DegReason, ' ') NOT LIKE '%NPA Due to Virtual DPD%'
           AND NVL(A.DegReason, ' ') NOT LIKE '%NPA with Seller%') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DegReason = src.DegReason;-- Buyout changes
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
         WHEN MATCHED THEN UPDATE SET B.DegReason = src.DegReason;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
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
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'Marking_FlgDeg_Degreason';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."MARKING_FLGDEG_DEGREASON_04122023" TO "ADF_CDR_RBL_STGDB";
