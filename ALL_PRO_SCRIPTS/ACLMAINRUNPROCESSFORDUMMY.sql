--------------------------------------------------------
--  DDL for Function ACLMAINRUNPROCESSFORDUMMY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" 
(
  v_Date IN VARCHAR2,
  v_Result OUT NUMBER/* DEFAULT 0*/
)
RETURN NUMBER
AS
   v_TimeKey NUMBER(10,0) := ( SELECT TimeKey 
     FROM sysdaymatrix 
    WHERE  UTILS.CONVERT_TO_VARCHAR2(Date_,200) = CASE 
                                                       WHEN NVL(v_Date, ' ') = ' ' THEN '2020-09-30'
           ELSE UTILS.CONVERT_TO_VARCHAR2(v_Date,200)
              END );
   v_ProcessingDate VARCHAR2(200) := ( SELECT DATE_ 
     FROM SYSDAYMATRIX 
    WHERE  TIMEKEY = v_TIMEKEY );
   v_PROCESSMONTH VARCHAR2(200) := ( SELECT date_ 
     FROM SysDayMatrix 
    WHERE  TimeKey = v_TIMEKEY );

BEGIN

   /*TODO:SQLDEV*/ SET DATEFORMAT DMY /*END:SQLDEV*/
   ----------------
   UPDATE RBL_MISDB_PROD.Automate_Advances
      SET EXT_FLG = 'N'
    WHERE  EXT_FLG = 'Y';
   UPDATE RBL_MISDB_PROD.Automate_Advances
      SET EXT_FLG = 'Y'
    WHERE  UTILS.CONVERT_TO_VARCHAR2(Date_,200) = UTILS.CONVERT_TO_VARCHAR2(v_Date,200);
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET EffectiveFromTimeKey = v_TimeKey,
          EffectiveToTimekey = v_TimeKey;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET EffectiveFromTimeKey = v_TimeKey,
          EffectiveToTimekey = v_TimeKey;
   ------------
   UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
      SET Completed = 'N'
    WHERE  id > 1;
   UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
      SET ASSET_NORM = 'NORMAL';
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET ASSET_NORM = 'NORMAL';
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET UpgDate = NULL;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_4, 'NPA DUE TO Inherent Weakness Account' AS pos_5, 'Y'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.WeakAccount = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 2,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5,
                                A.WeakAccount = 'Y';
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
   --,A.FinalAssetClassAlt_Key=2
    --,A.FinalNpaDt=CASE WHEN FinalNpaDt is NULL then @PROCESSINGDATE else  FinalNpaDt end
   , 'NPA DUE TO Inherent Weakness Account' AS pos_3, 'Y'
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.WeakAccount = 'Y'
     AND FinalAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.NPA_Reason = pos_3,
                                A.WeakAccount = 'Y';
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
   FROM a ,PRO_RBL_MISDB_PROD.CUSTOMERCAL a
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.CustomerEntityID = b.CustomerEntityID 
    WHERE b.WeakAccount = 'Y') src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                a.SysNPA_Dt = src.FinalNpaDt,
                                a.DegReason = src.NPA_Reason,
                                a.Asset_Norm = src.Asset_Norm;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_4, 'NPA DUE TO SARFAESI  Account' AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.Sarfaesi = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 2,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
   --  ,A.FinalAssetClassAlt_Key=2
    --,A.FinalNpaDt=CASE WHEN FinalNpaDt is NULL then @PROCESSINGDATE else  FinalNpaDt end
   , 'NPA DUE TO SARFAESI  Account' AS pos_3
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.Sarfaesi = 'Y'
     AND FinalAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.NPA_Reason = pos_3;
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
   FROM a ,PRO_RBL_MISDB_PROD.CUSTOMERCAL a
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.CustomerEntityID = b.CustomerEntityID 
    WHERE b.Sarfaesi = 'Y') src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                a.SysNPA_Dt = src.FinalNpaDt,
                                a.DegReason = src.NPA_Reason,
                                a.Asset_Norm = src.Asset_Norm;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
   WHEN REPOSSESSIONDATE IS NULL THEN v_PROCESSINGDATE
   ELSE REPOSSESSIONDATE
      END AS pos_4, 'NPA DUE TO RePossession  Account' AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.RePossession = 'Y'
     AND FinalAssetClassAlt_Key = 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 2,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
   -- ,A.FinalAssetClassAlt_Key=2
    --,A.FinalNpaDt=CASE WHEN REPOSSESSIONDATE is NULL then @PROCESSINGDATE else  REPOSSESSIONDATE end
   , 'NPA DUE TO RePossession  Account' AS pos_3
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A 
    WHERE A.RePossession = 'Y'
     AND FinalAssetClassAlt_Key > 1) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.NPA_Reason = pos_3;
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
   FROM a ,PRO_RBL_MISDB_PROD.CUSTOMERCAL a
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.CustomerEntityID = b.CustomerEntityID 
    WHERE b.RePossession = 'Y') src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                a.SysNPA_Dt = src.FinalNpaDt,
                                a.DegReason = src.NPA_Reason,
                                a.Asset_Norm = src.Asset_Norm;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 6, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_4, 'NPA DUE TO FRAUD MARKING' AS pos_5
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
    WHERE A.SplCatg1Alt_Key = 870) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 6,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 6, CASE 
   WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
   ELSE FinalNpaDt
      END AS pos_4, 'NPA DUE TO FRAUD MARKING' AS pos_5, 870
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID 
    WHERE B.SplCatg1Alt_Key = 870) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                A.FinalAssetClassAlt_Key = 6,
                                A.FinalNpaDt = pos_4,
                                A.NPA_Reason = pos_5,
                                A.SplCatg1Alt_Key = 870;
   MERGE INTO a 
   USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
   FROM a ,PRO_RBL_MISDB_PROD.CUSTOMERCAL a
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL b   ON a.CustomerEntityID = b.CustomerEntityID 
    WHERE B.SplCatg1Alt_Key = 870) src
   ON ( a.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET a.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                a.SysNPA_Dt = src.FinalNpaDt,
                                a.DegReason = src.NPA_Reason,
                                a.Asset_Norm = src.Asset_Norm;
   MERGE INTO B 
   USING (SELECT B.ROWID row_id, 'S'
   FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
    WHERE NVL(CurntQtrRv, 0) > 0) src
   ON ( B.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET SecApp = 'S';
   MERGE INTO B 
   USING (SELECT B.ROWID row_id, 'D'
   FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
          JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.CustomerEntityID = B.CustomerEntityID 
    WHERE NVL(CurntQtrRv, 0) > 0) src
   ON ( B.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET FlgSecured = 'D';
   MERGE INTO PRO_RBL_MISDB_PROD.ACCOUNTCAL 
   USING (SELECT PRO_RBL_MISDB_PROD.ACCOUNTCAL.ROWID row_id, 'D'
   FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL ,PRO_RBL_MISDB_PROD.ACCOUNTCAL  
    WHERE securityvalue > 0) src
   ON ( PRO_RBL_MISDB_PROD.ACCOUNTCAL.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET FlgSecured = 'D';
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET NETBALANCE = BALANCE;
   WITH CTE ( REFCUSTOMERID,
              TOTOSFUNDED ) AS ( SELECT B.REFCUSTOMERID ,
                                        SUM(NVL(A.BALANCE, 0))  TOTOSFUNDED  
     FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
            JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID
    WHERE  A.BALANCE > 0
             AND b.CurntQtrRv > 0
     GROUP BY B.REFCUSTOMERID ) 
      MERGE INTO D 
      USING (SELECT D.ROWID row_id, CASE 
      WHEN ((D.NETBALANCE / A.TOTOSFUNDED) * b.CurntQtrRv) > D.NETBALANCE THEN D.NETBALANCE
      ELSE ((D.NETBALANCE / A.TOTOSFUNDED) * b.CurntQtrRv)
         END AS SecurityValue
      FROM D ,CTE A
             JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.REFCUSTOMERID = B.REFCUSTOMERID
             JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL D   ON D.RefCustomerID = B.RefCustomerID 
       WHERE b.CurntQtrRv > 0) src
      ON ( D.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET D.SecurityValue = src.SecurityValue
      ;
   UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
      SET InttServiced = 'Y',
          INTNOTSERVICEDDT = NULL;
   IF ( v_PROCESSMONTH = EOMONTH(v_PROCESSMONTH) ) THEN

   BEGIN
      MERGE INTO A 
      USING (SELECT A.ROWID row_id, 'N', utils.dateadd('DAY', -90, v_PROCESSINGDATE) AS pos_3
      FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
             JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key 
       WHERE NVL(A.Balance, 0) > 0
        AND NVL(A.CurQtrCredit, 0) < NVL(A.CurQtrInt, 0)
        AND A.FacilityType IN ( 'CC','OD' )

        AND ( utils.dateadd('DAY', 90, A.FirstDtOfDisb) < v_PROCESSINGDATE
        AND A.FirstDtOfDisb IS NOT NULL
        AND Asset_Norm <> 'ALWYS_STD' )
        AND C.EffectiveFromTimeKey <= v_timekey
        AND C.EffectiveToTimeKey >= v_timekey
        AND NVL(C.ProductSubGroup, 'N') NOT IN ( 'Agri Busi','Agri TL','KCC' )
      ) src
      ON ( A.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET A.InttServiced = 'N',
                                   A.INTNOTSERVICEDDT = pos_3;
      MERGE INTO A 
      USING (SELECT A.ROWID row_id, 'N', NULL
      FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
             JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key 
       WHERE A.FacilityType IN ( 'CC','OD' )

        AND ( utils.dateadd('DAY', 90, A.DebitSinceDt) > v_PROCESSINGDATE
        AND A.DebitSinceDt IS NOT NULL
        AND Asset_Norm <> 'ALWYS_STD' )
        AND C.EffectiveFromTimeKey <= v_timekey
        AND C.EffectiveToTimeKey >= v_timekey
        AND NVL(C.ProductSubGroup, 'N') NOT IN ( 'Agri Busi','Agri TL','KCC' )

        AND InttServiced = 'N') src
      ON ( A.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET A.InttServiced = 'N',
                                   INTNOTSERVICEDDT = NULL;

   END;
   END IF;
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N', utils.dateadd('DAY', -366, v_PROCESSINGDATE) AS pos_3
   FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
          JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key 
    WHERE NVL(A.Balance, 0) > 0
     AND NVL(A.CurQtrCredit, 0) < NVL(A.CurQtrInt, 0)

     --AND  FacilityType IN('CC','OD')
     AND utils.dateadd('DAY', 90, A.FirstDtOfDisb) < v_PROCESSINGDATE
     AND A.FirstDtOfDisb IS NOT NULL
     AND Asset_Norm <> 'ALWYS_STD'

     --AND DATEADD(DAY,90,A.DebitSinceDt)<@PROCESSINGDATE AND A.DebitSinceDt IS NOT NULL AND Asset_Norm<>'ALWYS_STD' 
     AND C.EffectiveFromTimeKey <= v_timekey
     AND C.EffectiveToTimeKey >= v_timekey
     AND NVL(C.ProductSubGroup, 'N') IN ( 'Agri Busi','Agri TL','KCC' )
   ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.InttServiced = 'N',
                                A.INTNOTSERVICEDDT = pos_3;
   PRO_RBL_MISDB_PROD.Reference_Period_Calculation(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.DPD_Calculation(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Marking_InMonthMark_Customer_Account_level(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Marking_FlgDeg_Degreason(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.MaxDPD_ReferencePeriod_Calculation(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.NPA_Date_Calculation(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Update_AssetClass(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.NPA_Erosion_Aging(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Final_AssetClass_Npadate(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Upgrade_Customer_Account(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.SMA_MARKING(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Marking_FlgPNPA(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.Marking_NPA_Reason_NPAAccount(v_TIMEKEY => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.UpdateProvisionKey_AccountWise(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.UpdateNetBalance_AccountWise(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.GovtGuarAppropriation(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.SecurityAppropriation(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.UpdateUsedRV(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.ProvisionComputationSecuredAcctProvWork(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.ProvisionComputationSecured(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.GovtGurCoverAmount(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.UpdationProvisionComputationUnSecured(v_TimeKey => v_TimeKey) ;
   PRO_RBL_MISDB_PROD.UpdationTotalProvision(v_TimeKey => v_TimeKey) ;
   v_Result := 1 ;
   RETURN v_Result;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."ACLMAINRUNPROCESSFORDUMMY" TO "ADF_CDR_RBL_STGDB";
