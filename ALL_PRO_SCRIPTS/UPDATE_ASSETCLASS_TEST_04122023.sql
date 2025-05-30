--------------------------------------------------------
--  DDL for Procedure UPDATE_ASSETCLASS_TEST_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : UPDATE AssetClass
 ---EXEC [Pro].[Update_AssetClass] @TIMEKEY=25140 
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_SUB_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'SUB_Days'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_DB1_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'DB1_Days'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_DB2_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'DB2_Days'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_MoveToDB1 NUMBER(5,2) := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue / 100.00,5,2) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'MoveToDB1'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_MoveToLoss NUMBER(5,2) := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue / 100.00,5,2) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BusinessRule = 'MoveToLoss'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         IF utils.object_id('TEMPDB..tt_CTE_CustomerWiseBalance_16') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CustomerWiseBalance_16 ';
         END IF;
         DELETE FROM tt_CTE_CustomerWiseBalance_16;
         UTILS.IDENTITY_RESET('tt_CTE_CustomerWiseBalance_16');

         INSERT INTO tt_CTE_CustomerWiseBalance_16 ( 
         	SELECT A.RefCustomerID ,
                 SUM(NVL(A.Balance, 0))  Balance  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID
         	 WHERE  NVL(B.FlgProcessing, 'N') = 'N'
         	  GROUP BY A.RefCustomerID );
         EXECUTE IMMEDIATE ' CREATE INDEX I1
            ON tt_CTE_CustomerWiseBalance_16 ( refcustomerid)';
         /*-----INTIAL LEVEL SysAssetClassAlt_Key DbtDt,C DegDate----------- */
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, NULL, NULL, NULL
         FROM B ,tt_CTE_CustomerWiseBalance_16 a
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.REFCUSTOMERID = B.RefCustomerID 
          WHERE ( NVL(B.FlgDeg, 'N') = 'Y'
           AND NVL(B.FlgProcessing, 'N') = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.DbtDt = NULL,
                                      B.LossDt = NULL,
                                      B.DegDate = NULL;
         /*---CALCULATE SysAssetClassAlt_Key ,DbtDt,DegDate-----------------------*/
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, (CASE 
         WHEN utils.dateadd('DAY', v_SUB_Days, B.SysNPA_Dt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                   FROM DimAssetClass 
                                                                                    WHERE  DIMASSETCLASS.AssetClassShortName = 'SUB'
                                                                                             AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                             AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', v_SUB_Days, B.SysNPA_Dt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, B.SysNPA_Dt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                 FROM DimAssetClass 
                                                                                                  WHERE  DIMASSETCLASS.AssetClassShortName = 'DB1'
                                                                                                           AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                           AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, B.SysNPA_Dt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days + v_DB2_Days, B.SysNPA_Dt) > v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                              FROM DimAssetClass 
                                                                                                               WHERE  DIMASSETCLASS.AssetClassShortName = 'DB2'
                                                                                                                        AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                        AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('DAY', (v_DB1_Days + v_SUB_Days + v_DB2_Days), B.SysNPA_Dt) <= v_ProcessDate THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                                FROM DimAssetClass 
                                                                                                                 WHERE  DIMASSETCLASS.AssetClassShortName = 'DB3'
                                                                                                                          AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                          AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )   END) AS pos_2, (CASE 
         WHEN utils.dateadd('DAY', v_SUB_Days, B.SysNPA_Dt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, B.SysNPA_Dt) > v_ProcessDate THEN utils.dateadd('DAY', v_SUB_Days, B.SysNPA_Dt)
         WHEN utils.dateadd('DAY', v_SUB_Days + v_DB1_Days, B.SysNPA_Dt) <= v_ProcessDate
           AND utils.dateadd('DAY', v_SUB_Days + v_DB1_Days + v_DB2_Days, B.SysNPA_Dt) > v_ProcessDate THEN utils.dateadd('DAY', v_SUB_Days, B.SysNPA_Dt)
         WHEN utils.dateadd('DAY', (v_DB1_Days + v_SUB_Days + v_DB2_Days), B.SysNPA_Dt) <= v_ProcessDate THEN utils.dateadd('DAY', (v_SUB_Days), B.SysNPA_Dt)
         ELSE DBTDT
            END) AS pos_3, v_ProcessDate
         FROM B ,tt_CTE_CustomerWiseBalance_16 A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.REFCUSTOMERID = B.REFCUSTOMERID 
          WHERE ( NVL(B.FlgDeg, 'N') = 'Y'
           AND B.FlgProcessing = 'N' )) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.SysAssetClassAlt_Key --CASE WHEN    B.CurntQtrRv< (A.BALANCE *@MoveToLoss) THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='LOS' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
                                       = pos_2,
                                      B.DBTDT
                                      --,B.LossDt= (CASE  WHEN     B.CurntQtrRv< (A.BALANCE *@MoveToLoss)   THEN @PROCESSDATE ELSE LossDt END)
                                       = pos_3,
                                      B.DegDate = v_ProcessDate;
         /*-------------MARKING OF FRAUD-----------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
           FROM DimAssetClass 
          WHERE  DIMASSETCLASS.AssetClassShortName = 'LOS'
                   AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                   AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY ) AS SysAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A 
          WHERE ( NVL(A.SplCatg1Alt_Key, 0) = 870
           OR NVL(A.SplCatg2Alt_Key, 0) = 870
           OR NVL(A.SplCatg3Alt_Key, 0) = 870
           OR NVL(A.SplCatg4Alt_Key, 0) = 870 )
           AND NVL(A.FlgDeg, 'N') = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = src.SysAssetClassAlt_Key;
         /*-------- UPDATE DBT DATE NULL FOR LOS CUSTOMERS------------------- */
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, NULL
         FROM B ,tt_CTE_CustomerWiseBalance_16 A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.REFCUSTOMERID = B.RefCustomerID 
          WHERE ( NVL(B.FlgDeg, 'N') = 'Y'
           AND NVL(B.FlgProcessing, 'N') = 'N' )
           AND SysAssetClassAlt_Key IN ( SELECT AssetClassAlt_Key 
                                         FROM DimAssetClass 
                                          WHERE  AssetClassShortName = 'LOS'
                                                   AND EffectiveFromTimeKey <= v_TIMEKEY
                                                   AND EffectiveToTimeKey >= v_TIMEKEY )
         ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DbtDt = NULL;
         /*----UPDATE FINALASSETALT_KEY IN ACCOUNT LEVEL FROM CUSTOMER--------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SysAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE ( NVL(B.FlgDeg, 'N') = 'Y'
           AND NVL(B.FlgProcessing, 'N') = 'N' )
           AND ( NVL(A.Asset_Norm, 'NORMAL') = 'NORMAL'
           AND NVL(A.FlgDeg, 'N') = 'Y' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.SysAssetClassAlt_Key;
         --UPDATE A
         -- SET  A.FinalAssetClassAlt_Key =CASE WHEN A.FlgDeg='Y' AND Asset_Norm='CONDI_STD' THEN FinalAssetClassAlt_Key ELSE  1 END
         --  FROM PRO.ACCOUNTCAL_test  A
         --WHERE ISNULL(A.Asset_Norm,'NORMAL')='CONDI_STD' and isnull(InitialAssetClassAlt_Key,1)=1
         --/*------to handle upgrade of advance agianst  cash security IF CUSTOMER IS NPA BUT ISLAD ACCOUNT IS REGULAR------------------------------------*/
         --UPDATE A
         -- SET  A.FinalAssetClassAlt_Key =  case when b.ContinousExcessSecDt is not null  then FinalAssetClassAlt_Key else 1 end
         --  FROM PRO.ACCOUNTCAL_test  A left outer join CurDat.AdvAcOtherDetail  b on a.AccountEntityID=b.AccountEntityId and (b.EffectiveFromTimeKey<=@TIMEKEY
         --  and b.EffectiveToTimeKey>=@TIMEKEY)
         --WHERE ISNULL(A.Asset_Norm,'NORMAL')='CONDI_STD' and isnull(a.InitialAssetClassAlt_Key,1)<>1
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CustomerWiseBalance_16 ';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'Update_AssetClass';

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
       WHERE  RUNNINGPROCESSNAME = 'Update_AssetClass';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATE_ASSETCLASS_TEST_04122023" TO "ADF_CDR_RBL_STGDB";
