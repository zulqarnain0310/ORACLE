--------------------------------------------------------
--  DDL for Procedure HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" 
--exec [HostSystemStatusReport]

AS
   v_TimeKey NUMBER(10,0) := ( SELECT timekey 
     FROM Automate_Advances 
    WHERE  Ext_flg = 'Y' );
   v_Date VARCHAR2(200) := ( SELECT Date_ 
     FROM Automate_Advances 
    WHERE  Ext_flg = 'Y' );
--(
--@Date datetime
--)

BEGIN

   DELETE FROM tt_temp_160;
   UTILS.IDENTITY_RESET('tt_temp_160');

   INSERT INTO tt_temp_160 ( 
   	SELECT DISTINCT UCIF_ID 
   	  FROM PRO_RBL_MISDB_PROD.AccountCal_Hist 
   	 WHERE  Effectivefromtimekey <= v_TimeKey
              AND EffectiveToTimeKey >= v_Timekey
              AND CustomerAcID IN ( SELECT DISTINCT CustomerAcID 
                                    FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
                                     WHERE  InitialAssetClassAlt_Key > 1
                                              AND FinalAssetClassAlt_Key = 1 )
    );
   DELETE HostSystemStatus

    WHERE  EffectiveFromTimeKey <= v_Timekey
             AND EffectiveToTimeKey >= v_Timekey;
   INSERT INTO HostSystemStatus
     ( UCIC_Code, CustomerID, CustomerName, AccountNo, Host_System_Name, OSBalance, Report_Date, ActSegmentCode, Account_Level_Business_Segment, Business_Seg_Desc, Base_Account_Scheme_Code, Base_Account_Scheme_Owner, Host_System_Status, Main_Classification, Remarks, Closed_Date, Cr_Dr, EffectiveFromTimekey, EffectiveToTimekey )
     ( SELECT A.UCIF_ID UCIC_Code  ,
              A.RefCustomerID CustomerID  ,
              CustomerName ,
              CustomerAcid AccountNo  ,
              SourceName Host_System_Name  ,
              Balance OSBalance  ,
              v_Date Report_Date  ,
              B.ActSegmentCode ,
              CASE 
                   WHEN SourceName = 'Ganaseva' THEN 'FI'
                   WHEN SourceName = 'VisionPlus' THEN 'Credit Card'
              ELSE S.AcBuRevisedSegmentCode
                 END Account_Level_Business_Segment  ,
              AcBuSegmentDescription Business_Seg_Desc  ,
              b.ProductCode Base_Account_Scheme_Code  ,
              NULL Base_Account_Scheme_Owner  ,
              SMA_Class Host_System_Status  ,
              NULL Main_Clasification  ,
              NULL Remarks  ,
              NULL Closed_Date  ,
              (CASE 
                    WHEN NVL(Balance, 0) < 0 THEN 'Dr'
              ELSE 'Cr'
                 END) Cr_Dr  ,
              A.EffectiveFromTimeKey ,
              A.EffectiveToTimeKey 
       FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist A
              JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist B   ON A.CustomerEntityID = B.CustomerEntityID
              LEFT JOIN DIMSOURCEDB src   ON b.SourceAlt_Key = src.SourceAlt_Key
              LEFT JOIN DimProduct PD   ON PD.EffectiveToTimeKey = 49999
              AND PD.ProductAlt_Key = b.PRODUCTALT_KEY
              LEFT JOIN DimAssetClass a1   ON a1.EffectiveToTimeKey = 49999
              AND a1.AssetClassAlt_Key = b.InitialAssetClassAlt_Key
              LEFT JOIN DimAssetClass a2   ON a2.EffectiveToTimeKey = 49999
              AND a2.AssetClassAlt_Key = b.FinalAssetClassAlt_Key
              LEFT JOIN DimAcBuSegment S   ON B.ActSegmentCode = S.AcBuSegmentCode
              AND S.EffectiveToTimeKey = 49999
        WHERE  CustomerAcID IN ( SELECT CustomerAcID 
                                 FROM PRO_RBL_MISDB_PROD.AccountCal_Hist 
                                  WHERE  UCIF_ID IN ( SELECT UCIF_ID 
                                                      FROM tt_temp_160  )

                                           AND EffectiveFromTimeKey <= v_Timekey
                                           AND EffectiveToTimeKey >= v_TimeKey )

                 AND A.EffectiveFromTimeKey <= v_Timekey
                 AND A.EffectiveToTimeKey >= v_TimeKey
                 AND B.EffectiveFromTimeKey <= v_Timekey
                 AND B.EffectiveToTimeKey >= v_TimeKey );

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."HOSTSYSTEMSTATUSREPORT_UPGRADE_OLD" TO "ADF_CDR_RBL_STGDB";
