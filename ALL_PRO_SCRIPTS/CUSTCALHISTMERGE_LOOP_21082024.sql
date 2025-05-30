--------------------------------------------------------
--  DDL for Procedure CUSTCALHISTMERGE_LOOP_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" 
----USE [RBL_MISDB]
 ----GO
 ----/****** Object:  StoredProcedure [PRO].[CustAcctCalHistMerge]    Script Date: 10/17/2021 7:16:07 PM ******/
 ----SET ANSI_NULLS ON
 ----GO
 ----SET QUOTED_IDENTIFIER ON
 ----GO
 ------ =============================================
 ------ Author:		<Author,,Name>
 ------ Create date: <Create Date,,>
 ------ Description:	<Description,,>
 ------ =============================================
 ----/*   ADD NEW OLUMN
 ----	ALTER TABLE PRO.PUI_CAL ADD IsChanged CHAR(1)
 ----	ALTER TABLE PRO.ADVACRESTRUCTURECAL ADD IsChanged CHAR(1)
 ----	ALTER TABLE PRO.ACCOUNTCAL ADD IsChanged CHAR(1)
 ----	ALTER TABLE PRO.CUSTOMERCAL ADD IsChanged CHAR(1)
 ----*/
 -----exec [PRO].[CustCalHistMerge_loop] @date1='2021-07-11', @date2='2021-07-31'

(
  ---- Add the parameters for the stored procedure here
  v_date1 IN VARCHAR2 DEFAULT ' ' ,
  v_date2 IN VARCHAR2 DEFAULT ' ' 
)
AS
   --declare @date1 date='2021-07-01'
   --declare @date2 date ='2021-07-01'
   v_VEFFECTIVETO NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_RowCnt NUMBER(5,0) := ( SELECT MAX(rowid_)  
     FROM tt_TIMEKEY_6  );
   v_RowNo NUMBER(5,0) := 1;

BEGIN

   TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF tt_TIMEKEY_6  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_TIMEKEY_6;
   UTILS.IDENTITY_RESET('tt_TIMEKEY_6');

   INSERT INTO tt_TIMEKEY_6 SELECT Timekey ,
                                   DATE_ ,
                                   ROW_NUMBER() OVER ( ORDER BY TIMEKEY  ) ROWID_  
        FROM sysdaymatrix 
       WHERE  date_ BETWEEN v_date1 AND v_date2;
   /*  CUSTOMER DATA MERGE */
   WHILE v_RowNo <= v_RowCnt 
   LOOP 

      BEGIN
         SELECT Timekey ,
                Timekey - 1 

           INTO v_Timekey,
                v_VEFFECTIVETO
           FROM tt_TIMEKEY_6 
          WHERE  ROWID_ = v_RowNo;
         SELECT Timekey ,
                Timekey - 1 

           INTO v_Timekey,
                v_VEFFECTIVETO
           FROM tt_TIMEKEY_6 
          WHERE  ROWID_ = v_RowNo;
         /*  ACCOUNT DATA MERGE */
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_custdata_3  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_custdata_3;
         UTILS.IDENTITY_RESET('tt_custdata_3');

         INSERT INTO tt_custdata_3 ( 
         	SELECT * ,
                 'N' IsChanged  ,
                 UTILS.CONVERT_TO_NUMBER(0,19,0) EntityKeyNew  
         	  FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist 
         	 WHERE  EffectiveFromTimeKey = v_TimeKey );
         IF 1 = 1 THEN
          DECLARE
            /*  New Customers Ac Key ID Update  */
            v_EntityKeyAc NUMBER(19,0) := 0;

         BEGIN
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'E'
            FROM T ,PRO_RBL_MISDB_PROD.CustomerCal_Hist_new O
                   JOIN tt_custdata_3 T   ON O.CustomerEntityId = T.CustomerEntityId
                   AND O.EffectiveToTimeKey = 49999 ) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'E';
            MERGE INTO T 
            USING (SELECT T.ROWID row_id, 'C'
            FROM T ,PRO_RBL_MISDB_PROD.CustomerCal_Hist_new O
                   JOIN tt_custdata_3 T   ON O.CustomerEntityId = T.CustomerEntityId
                   AND O.EffectiveToTimeKey = 49999 
             WHERE ( NVL(O.BranchCode, ' ') <> NVL(T.BranchCode, ' ')
              OR NVL(O.UCIF_ID, ' ') <> NVL(T.UCIF_ID, ' ')
              OR NVL(O.UcifEntityID, 0) <> NVL(T.UcifEntityID, 0)
              OR NVL(O.CustomerEntityID, 0) <> NVL(T.CustomerEntityID, 0)
              OR NVL(O.ParentCustomerID, ' ') <> NVL(T.ParentCustomerID, ' ')
              OR NVL(O.RefCustomerID, ' ') <> NVL(T.RefCustomerID, ' ')
              OR NVL(O.SourceSystemCustomerID, ' ') <> NVL(T.SourceSystemCustomerID, ' ')
              OR NVL(O.CustomerName, ' ') <> NVL(T.CustomerName, ' ')
              OR NVL(O.CustSegmentCode, ' ') <> NVL(T.CustSegmentCode, ' ')
              OR NVL(O.ConstitutionAlt_Key, 0) <> NVL(T.ConstitutionAlt_Key, 0)
              OR NVL(O.PANNO, ' ') <> NVL(T.PANNO, ' ')
              OR NVL(O.AadharCardNO, ' ') <> NVL(T.AadharCardNO, ' ')
              OR NVL(O.SrcAssetClassAlt_Key, 0) <> NVL(T.SrcAssetClassAlt_Key, 0)
              OR NVL(O.SysAssetClassAlt_Key, 0) <> NVL(T.SysAssetClassAlt_Key, 0)
              OR NVL(O.SplCatg1Alt_Key, 0) <> NVL(T.SplCatg1Alt_Key, 0)
              OR NVL(O.SplCatg2Alt_Key, 0) <> NVL(T.SplCatg2Alt_Key, 0)
              OR NVL(O.SplCatg3Alt_Key, 0) <> NVL(T.SplCatg3Alt_Key, 0)
              OR NVL(O.SplCatg4Alt_Key, 0) <> NVL(T.SplCatg4Alt_Key, 0)
              OR NVL(O.SMA_Class_Key, 0) <> NVL(T.SMA_Class_Key, 0)
              OR NVL(O.PNPA_Class_Key, 0) <> NVL(T.PNPA_Class_Key, 0)
              OR NVL(O.PrvQtrRV, 0) <> NVL(T.PrvQtrRV, 0)
              OR NVL(O.CurntQtrRv, 0) <> NVL(T.CurntQtrRv, 0)
              OR NVL(O.TotProvision, 0) <> NVL(T.TotProvision, 0)
              OR NVL(O.BankTotProvision, 0) <> NVL(T.BankTotProvision, 0)
              OR NVL(O.RBITotProvision, 0) <> NVL(T.RBITotProvision, 0)
              OR NVL(O.SrcNPA_Dt, '1900-01-01') <> NVL(T.SrcNPA_Dt, '1900-01-01')
              OR NVL(O.SysNPA_Dt, '1900-01-01') <> NVL(T.SysNPA_Dt, '1900-01-01')
              OR NVL(O.DbtDt, '1900-01-01') <> NVL(T.DbtDt, '1900-01-01')
              OR NVL(O.DbtDt2, '1900-01-01') <> NVL(T.DbtDt2, '1900-01-01')
              OR NVL(O.DbtDt3, '1900-01-01') <> NVL(T.DbtDt3, '1900-01-01')
              OR NVL(O.LossDt, '1900-01-01') <> NVL(T.LossDt, '1900-01-01')
              OR NVL(O.MOC_Dt, '1900-01-01') <> NVL(T.MOC_Dt, '1900-01-01')
              OR NVL(O.ErosionDt, '1900-01-01') <> NVL(T.ErosionDt, '1900-01-01')
              OR NVL(O.SMA_Dt, '1900-01-01') <> NVL(T.SMA_Dt, '1900-01-01')
              OR NVL(O.PNPA_Dt, '1900-01-01') <> NVL(T.PNPA_Dt, '1900-01-01')
              OR NVL(O.Asset_Norm, ' ') <> NVL(T.Asset_Norm, ' ')
              OR NVL(O.FlgDeg, ' ') <> NVL(T.FlgDeg, ' ')
              OR NVL(O.FlgUpg, ' ') <> NVL(T.FlgUpg, ' ')
              OR NVL(O.FlgMoc, ' ') <> NVL(T.FlgMoc, ' ')
              OR NVL(O.FlgSMA, ' ') <> NVL(T.FlgSMA, ' ')
              OR NVL(O.FlgProcessing, ' ') <> NVL(T.FlgProcessing, ' ')
              OR NVL(O.FlgErosion, ' ') <> NVL(T.FlgErosion, ' ')
              OR NVL(O.FlgPNPA, ' ') <> NVL(T.FlgPNPA, ' ')
              OR NVL(O.FlgPercolation, ' ') <> NVL(T.FlgPercolation, ' ')
              OR NVL(O.FlgInMonth, ' ') <> NVL(T.FlgInMonth, ' ')
              OR NVL(O.FlgDirtyRow, ' ') <> NVL(T.FlgDirtyRow, ' ')
              OR NVL(O.DegDate, '1900-01-01') <> NVL(T.DegDate, '1900-01-01')
              OR NVL(O.CommonMocTypeAlt_Key, 0) <> NVL(T.CommonMocTypeAlt_Key, 0)
              OR NVL(O.InMonthMark, ' ') <> NVL(T.InMonthMark, ' ')
              OR NVL(O.MocStatusMark, ' ') <> NVL(T.MocStatusMark, ' ')
              OR NVL(O.SourceAlt_Key, 0) <> NVL(T.SourceAlt_Key, 0)
              OR NVL(O.BankAssetClass, ' ') <> NVL(T.BankAssetClass, ' ')
              OR NVL(O.Cust_Expo, 0) <> NVL(T.Cust_Expo, 0)
              OR NVL(O.MOCReason, ' ') <> NVL(T.MOCReason, ' ')
              OR NVL(O.AddlProvisionPer, 0) <> NVL(T.AddlProvisionPer, 0)
              OR NVL(O.FraudDt, '1900-01-01') <> NVL(T.FraudDt, '1900-01-01')
              OR NVL(O.FraudAmount, 0) <> NVL(T.FraudAmount, 0)
              OR NVL(O.DegReason, ' ') <> NVL(T.DegReason, ' ')
              OR NVL(O.CustMoveDescription, ' ') <> NVL(T.CustMoveDescription, ' ')
              OR NVL(O.TotOsCust, 0) <> NVL(T.TotOsCust, 0)
              OR NVL(O.MOCTYPE, ' ') <> NVL(T.MOCTYPE, ' ') )) src
            ON ( T.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET T.IsChanged = 'C';
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'U'
            FROM A ,tt_custdata_3 A
                   JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist_new B   ON B.CustomerEntityId = A.CustomerEntityId 
             WHERE B.EffectiveFromTimeKey = v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.IsChanged = 'U';
            ----------For Changes Records
            MERGE INTO b 
            USING (SELECT b.ROWID row_id, v_VEFFECTIVETO
            FROM b ,tt_custdata_3 A
                   JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist_new B   ON B.CustomerEntityId = A.CustomerEntityId
                   AND B.EffectiveToTimeKey = 49999 
             WHERE B.EffectiveFromTimeKey < v_TimeKey
              AND A.IsChanged = 'C') src
            ON ( b.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET b.EffectiveToTimeKey = v_VEFFECTIVETO;
            MERGE INTO O 
            USING (SELECT O.ROWID row_id, T.BranchCode, T.UCIF_ID, T.UcifEntityID, T.ParentCustomerID, T.RefCustomerID, T.SourceSystemCustomerID, T.CustomerName, T.CustSegmentCode, T.ConstitutionAlt_Key, T.PANNO, T.AadharCardNO, T.SrcAssetClassAlt_Key, T.SysAssetClassAlt_Key, T.SplCatg1Alt_Key, T.SplCatg2Alt_Key, T.SplCatg3Alt_Key, T.SplCatg4Alt_Key, T.SMA_Class_Key, T.PNPA_Class_Key, T.PrvQtrRV, T.CurntQtrRv, T.TotProvision, T.BankTotProvision, T.RBITotProvision, T.SrcNPA_Dt, T.SysNPA_Dt, T.DbtDt, T.DbtDt2, T.DbtDt3, T.LossDt, T.MOC_Dt, T.ErosionDt, T.SMA_Dt, T.PNPA_Dt, T.Asset_Norm, T.FlgDeg, T.FlgUpg, T.FlgMoc, T.FlgSMA, T.FlgProcessing, T.FlgErosion, T.FlgPNPA, T.FlgPercolation, T.FlgInMonth, T.FlgDirtyRow, T.DegDate, T.CommonMocTypeAlt_Key, T.InMonthMark, T.MocStatusMark, T.SourceAlt_Key, T.BankAssetClass, T.Cust_Expo, T.MOCReason, T.AddlProvisionPer, T.FraudDt, T.FraudAmount, T.DegReason, T.CustMoveDescription, T.TotOsCust, T.MOCTYPE
            FROM O ,PRO_RBL_MISDB_PROD.CustomerCal_Hist_new O
                   JOIN tt_custdata_3 T   ON O.CustomerEntityId = T.CustomerEntityId 
             WHERE O.EffectiveFromTimeKey = v_TimeKey
              AND T.IsChanged = 'U') src
            ON ( O.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET O.BranchCode = src.BranchCode,
                                         O.UCIF_ID = src.UCIF_ID,
                                         O.UcifEntityID = src.UcifEntityID,
                                         O.ParentCustomerID = src.ParentCustomerID,
                                         O.RefCustomerID = src.RefCustomerID,
                                         O.SourceSystemCustomerID = src.SourceSystemCustomerID,
                                         O.CustomerName = src.CustomerName,
                                         O.CustSegmentCode = src.CustSegmentCode,
                                         O.ConstitutionAlt_Key = src.ConstitutionAlt_Key,
                                         O.PANNO = src.PANNO,
                                         O.AadharCardNO = src.AadharCardNO,
                                         O.SrcAssetClassAlt_Key = src.SrcAssetClassAlt_Key,
                                         O.SysAssetClassAlt_Key = src.SysAssetClassAlt_Key,
                                         O.SplCatg1Alt_Key = src.SplCatg1Alt_Key,
                                         O.SplCatg2Alt_Key = src.SplCatg2Alt_Key,
                                         O.SplCatg3Alt_Key = src.SplCatg3Alt_Key,
                                         O.SplCatg4Alt_Key = src.SplCatg4Alt_Key,
                                         O.SMA_Class_Key = src.SMA_Class_Key,
                                         O.PNPA_Class_Key = src.PNPA_Class_Key,
                                         O.PrvQtrRV = src.PrvQtrRV,
                                         O.CurntQtrRv = src.CurntQtrRv,
                                         O.TotProvision = src.TotProvision,
                                         O.BankTotProvision = src.BankTotProvision,
                                         O.RBITotProvision = src.RBITotProvision,
                                         O.SrcNPA_Dt = src.SrcNPA_Dt,
                                         O.SysNPA_Dt = src.SysNPA_Dt,
                                         O.DbtDt = src.DbtDt,
                                         O.DbtDt2 = src.DbtDt2,
                                         O.DbtDt3 = src.DbtDt3,
                                         O.LossDt = src.LossDt,
                                         O.MOC_Dt = src.MOC_Dt,
                                         O.ErosionDt = src.ErosionDt,
                                         O.SMA_Dt = src.SMA_Dt,
                                         O.PNPA_Dt = src.PNPA_Dt,
                                         O.Asset_Norm = src.Asset_Norm,
                                         O.FlgDeg = src.FlgDeg,
                                         O.FlgUpg = src.FlgUpg,
                                         O.FlgMoc = src.FlgMoc,
                                         O.FlgSMA = src.FlgSMA,
                                         O.FlgProcessing = src.FlgProcessing,
                                         O.FlgErosion = src.FlgErosion,
                                         O.FlgPNPA = src.FlgPNPA,
                                         O.FlgPercolation = src.FlgPercolation,
                                         O.FlgInMonth = src.FlgInMonth,
                                         O.FlgDirtyRow = src.FlgDirtyRow,
                                         O.DegDate = src.DegDate,
                                         O.CommonMocTypeAlt_Key = src.CommonMocTypeAlt_Key,
                                         O.InMonthMark = src.InMonthMark,
                                         O.MocStatusMark = src.MocStatusMark,
                                         O.SourceAlt_Key = src.SourceAlt_Key,
                                         O.BankAssetClass = src.BankAssetClass,
                                         O.Cust_Expo = src.Cust_Expo,
                                         O.MOCReason = src.MOCReason,
                                         O.AddlProvisionPer = src.AddlProvisionPer,
                                         O.FraudDt = src.FraudDt,
                                         O.FraudAmount = src.FraudAmount,
                                         O.DegReason = src.DegReason,
                                         O.CustMoveDescription = src.CustMoveDescription,
                                         O.TotOsCust = src.TotOsCust,
                                         O.MOCTYPE = src.MOCTYPE;
            ----------------------------------------------------------------------------------------------------------------------------------------------
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_VEFFECTIVETO
            FROM AA ,PRO_RBL_MISDB_PROD.CustomerCal_Hist_new AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND NOT EXISTS ( SELECT 1 
                               FROM tt_custdata_3 BB
                                WHERE  AA.CustomerEntityId = BB.CustomerEntityId )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_VEFFECTIVETO;
            SELECT MAX(EntityKey)  

              INTO v_EntityKeyAc
              FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist_new ;
            IF v_EntityKeyAc IS NULL THEN

            BEGIN
               v_EntityKeyAc := 0 ;

            END;
            END IF;
            MERGE INTO TEMP 
            USING (SELECT TEMP.ROWID row_id, ACCT.EntityKeyNew
            FROM TEMP ,tt_custdata_3 TEMP
                   JOIN ( SELECT tt_custdata_3.CustomerEntityId ,
                                 (v_EntityKeyAc + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                                   FROM DUAL  )  )) EntityKeyNew  
                          FROM tt_custdata_3 
                           WHERE  tt_custdata_3.IsChanged IN ( 'C','N' )
                         ) ACCT   ON TEMP.CustomerEntityId = ACCT.CustomerEntityId 
             WHERE Temp.IsChanged IN ( 'C','N' )
            ) src
            ON ( TEMP.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET TEMP.EntityKeyNew = src.EntityKeyNew;
            /***************************************************************************************************************/
            INSERT INTO PRO_RBL_MISDB_PROD.CustomerCal_Hist_new
              ( EntityKey, BranchCode, UCIF_ID, UcifEntityID, CustomerEntityID, ParentCustomerID, RefCustomerID, SourceSystemCustomerID, CustomerName, CustSegmentCode, ConstitutionAlt_Key, PANNO, AadharCardNO, SrcAssetClassAlt_Key, SysAssetClassAlt_Key, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SMA_Class_Key, PNPA_Class_Key, PrvQtrRV, CurntQtrRv, TotProvision, BankTotProvision, RBITotProvision, SrcNPA_Dt, SysNPA_Dt, DbtDt, DbtDt2, DbtDt3, LossDt, MOC_Dt, ErosionDt, SMA_Dt, PNPA_Dt, Asset_Norm, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, DegDate, EffectiveFromTimeKey, EffectiveToTimeKey, CommonMocTypeAlt_Key, InMonthMark, MocStatusMark, SourceAlt_Key, BankAssetClass, Cust_Expo, MOCReason, AddlProvisionPer, FraudDt, FraudAmount, DegReason, CustMoveDescription, TotOsCust, MOCTYPE )
              ( SELECT EntityKeyNew ,
                       BranchCode ,
                       UCIF_ID ,
                       UcifEntityID ,
                       CustomerEntityID ,
                       ParentCustomerID ,
                       RefCustomerID ,
                       SourceSystemCustomerID ,
                       CustomerName ,
                       CustSegmentCode ,
                       ConstitutionAlt_Key ,
                       PANNO ,
                       AadharCardNO ,
                       SrcAssetClassAlt_Key ,
                       SysAssetClassAlt_Key ,
                       SplCatg1Alt_Key ,
                       SplCatg2Alt_Key ,
                       SplCatg3Alt_Key ,
                       SplCatg4Alt_Key ,
                       SMA_Class_Key ,
                       PNPA_Class_Key ,
                       PrvQtrRV ,
                       CurntQtrRv ,
                       TotProvision ,
                       BankTotProvision ,
                       RBITotProvision ,
                       SrcNPA_Dt ,
                       SysNPA_Dt ,
                       DbtDt ,
                       DbtDt2 ,
                       DbtDt3 ,
                       LossDt ,
                       MOC_Dt ,
                       ErosionDt ,
                       SMA_Dt ,
                       PNPA_Dt ,
                       Asset_Norm ,
                       FlgDeg ,
                       FlgUpg ,
                       FlgMoc ,
                       FlgSMA ,
                       FlgProcessing ,
                       FlgErosion ,
                       FlgPNPA ,
                       FlgPercolation ,
                       FlgInMonth ,
                       FlgDirtyRow ,
                       DegDate ,
                       EffectiveFromTimeKey ,
                       49999 EffectiveToTimeKey  ,
                       CommonMocTypeAlt_Key ,
                       InMonthMark ,
                       MocStatusMark ,
                       SourceAlt_Key ,
                       BankAssetClass ,
                       Cust_Expo ,
                       MOCReason ,
                       AddlProvisionPer ,
                       FraudDt ,
                       FraudAmount ,
                       DegReason ,
                       CustMoveDescription ,
                       TotOsCust ,
                       MOCTYPE 
                FROM tt_custdata_3 T
                 WHERE  NVL(T.IsChanged, 'N') IN ( 'C','N' )
               );

         END;
         END IF;
         WITH CTE_Reccount AS ( SELECT v_TimeKey timekey  ,
                                       COUNT(1)  NoofCust_Opt  
           FROM PRO_RBL_MISDB_PROD.CustomerCal_Hist_new 
          WHERE  EffectiveFromTimeKey <= v_TimeKey
                   AND EffectiveToTimeKey >= v_TimeKey ) 
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, NoofCust_Opt, a.CustCount_Current - NoofCust_Opt AS pos_3
            FROM A ,CUSTHIST_TIMEKEY_REC_COUNT a
                   JOIN CTE_Reccount b   ON a.timekey = b.timekey ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.CustCount_Opt = NoofCust_Opt,
                                         A.CustCount_Diff = pos_3
            ;
         /*  END OF ACCOUNT DATA MERGE */
         v_RowNo := v_RowNo + 1 ;

      END;
   END LOOP;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTCALHISTMERGE_LOOP_21082024" TO "ADF_CDR_RBL_STGDB";
