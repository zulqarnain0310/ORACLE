--------------------------------------------------------
--  DDL for Procedure UPDATENETBALANCE_ACCOUNTWISE_BKUP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" /*==========================    
AUTHER : TRILOKI KHANNA    
CREATE DATE : 27-11-2019    
MODIFY DATE : 27-11-2019    
DESCRIPTION : UPDATE NET BALANCE ACCOUNT WISE    
--EXEC [dbo].[UpdateNetBalance_AccountWise] @TimeKey=25410       
======================================================*/
(
  v_TimeKey IN NUMBER
)
AS

BEGIN

   BEGIN

      BEGIN
         --UPDATE A         
         --SET  
         --		NetBalance = (CASE WHEN (isnull(A.Balance,0) - (ISNULL(UnAdjSubSidy,0)+ ISNULL(WriteOffAmount,0))) < 0      
         --         THEN 0         
         --     	   ELSE (isnull(A.Balance,0) - (ISNULL(UnAdjSubSidy,0)+ ISNULL(WriteOffAmount,0)))  
         --     END)        
         --FROM PRO.AccountCal A       
         /*28062021 changes as per email dated 27-06-2021 obs point no.18  -bank remark -> Net Balance is not tallying with POS balance. D2K to update POS_Balance in Net Balance  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN (NVL(A.Balance, 0) - (NVL(UnAdjSubSidy, 0) + NVL(WriteOffAmount, 0))) < 0 THEN 0
         ELSE (NVL(A.PrincOutStd, 0) - (NVL(UnAdjSubSidy, 0) + NVL(WriteOffAmount, 0)))
            END) AS NetBalance
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET NetBalance = src.NetBalance;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN (NVL(A.PrincOutStd, 0) - (NVL(UnAdjSubSidy, 0) + NVL(WriteOffAmount, 0) + NVL(UnserviedInt, 0))) < 0 THEN 0
         ELSE (NVL(A.PrincOutStd, 0) - (NVL(UnAdjSubSidy, 0) + NVL(WriteOffAmount, 0) + NVL(UnserviedInt, 0)))
            END) AS NetBalance
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN DimAssetClass B   ON B.AssetClassAlt_Key = NVL(A.FinalAssetClassAlt_Key, 1)
                AND ( B.EffectiveFromTimeKey <= v_TimeKey
                AND B.EffectiveToTimeKey >= v_TimeKey ) 
          WHERE B.ASSETCLASSGROUP = 'NPA') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NetBalance = src.NetBalance;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'UpdateNetBalance_AccountWise';

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
       WHERE  RUNNINGPROCESSNAME = 'UpdateNetBalance_AccountWise';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."UPDATENETBALANCE_ACCOUNTWISE_BKUP" TO "ADF_CDR_RBL_STGDB";
