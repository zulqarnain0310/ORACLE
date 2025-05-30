--------------------------------------------------------
--  DDL for Procedure CUSTACCOUNTMERGE_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" 
AS
   v_TimeKey NUMBER(10,0);
   v_vEffectivefrom NUMBER(10,0);
   v_vEffectiveto NUMBER(10,0);
   /*  New Customers EntityKey ID Update  */
   v_EntityKey NUMBER(19,0) := 0;

BEGIN

   SELECT TimeKey 

     INTO v_TimeKey
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT TimeKey 

     INTO v_vEffectiveFrom
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT Timekey - 1 

     INTO v_vEffectiveto
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   /* ADVCUSTNPA DETAIL */
   --begin try
   --	begin tran
   IF utils.object_id('TEMPDB..#AdvCustNPAdetail') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AdvCustNPAdetail_7 ';
   END IF;
   DELETE FROM tt_AdvCustNPAdetail_8;
   INSERT INTO tt_AdvCustNPAdetail_7
     ( CustomerEntityId, Cust_AssetClassAlt_Key, NPADt, LastInttChargedDt, DbtDt, LosDt, DefaultReason1Alt_Key, DefaultReason2Alt_Key, StaffAccountability, LastIntBooked, RefCustomerID, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, MocStatus, MocDate, MocTypeAlt_Key, NPA_Reason )
     ( SELECT CustomerEntityId ,
              A.SysAssetClassAlt_Key Cust_AssetClassAlt_Key  ,
              SysNPA_Dt NPADt  ,
              NULL LastInttChargedDt  ,
              DbtDt DbtDt  ,
              LossDt LosDt  ,
              NULL DefaultReason1Alt_Key  ,
              NULL DefaultReason2Alt_Key  ,
              NULL StaffAccountability  ,
              NULL LastIntBooked  ,
              RefCustomerID RefCustomerID  ,
              NULL AuthorisationStatus  ,
              A.EffectiveFromTimeKey EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              NULL CreatedBy  ,
              SYSDATE DateCreated  ,
              NULL ModifiedBy  ,
              NULL DateModified  ,
              NULL ApprovedBy  ,
              NULL DateApproved  ,
              NULL MocStatus  ,
              NULL MocDate  ,
              NULL MocTypeAlt_Key  ,
              A.DegReason NPA_Reason  
       FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL A
              JOIN RBL_MISDB_PROD.DimAssetClass B   ON ( B.EffectiveFromTimeKey <= v_TimeKey
              AND B.EffectiveToTimeKey >= v_TimeKey )
              AND A.SysAssetClassAlt_Key = B.AssetClassAlt_Key
              AND NVL(B.AssetClassShortNameEnum, 'STD') <> 'STD' );
   ----------For New Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N'
   FROM A ,tt_AdvCustNPAdetail_7 A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvCustNPADetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.CustomerEntityId = A.CustomerEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'N';
   /* EXPIRE RECORDS FOR PREV TI,EKEY */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSERACL'
   FROM O ,RBL_MISDB_PROD.AdvCustNPADetail O
          JOIN tt_AdvCustNPAdetail_7 T   ON O.CustomerEntityId = T.CustomerEntityId
          AND O.EFFECTIVETOTimekey = 49999
          AND T.EFFECTIVETOTimekey = 49999
          AND O.EffectiveFromTimeKey < v_TimeKey 
    WHERE ( NVL(O.Cust_AssetClassAlt_Key, 0) <> NVL(T.Cust_AssetClassAlt_Key, 0)
     OR NVL(O.NPADt, '1900-01-01') <> NVL(t.NPADt, '1900-01-01')
     OR NVL(O.LosDt, '1900-01-01') <> NVL(t.LosDt, '1900-01-01')
     OR NVL(O.DbtDt, '1900-01-01') <> NVL(t.DbtDt, '1900-01-01') )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSERACL';
   ----- OR  isnull(O.[RefCustomerID],'')		 <> IsnuLL(T.[RefCustomerID],'')
   /* UPDATE RECORDS FOR CURRENT TIMEKEY */
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.Cust_AssetClassAlt_Key, T.NPADt, T.LosDt, T.DbtDt, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_6, 'SSISUSERACL'
   FROM O ,RBL_MISDB_PROD.AdvCustNPADetail O
          JOIN tt_AdvCustNPAdetail_7 T   ON O.CustomerEntityId = T.CustomerEntityId
          AND O.EFFECTIVETOTimekey = 49999
          AND T.EFFECTIVETOTimekey = 49999
          AND O.EffectiveFromTimeKey = v_TimeKey ) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.Cust_AssetClassAlt_Key = src.Cust_AssetClassAlt_Key,
                                O.NPADt = src.NPADt,
                                O.LosDt = src.LosDt,
                                O.DbtDt = src.DbtDt,
                                O.DateModified = pos_6,
                                O.ModifiedBy = 'SSISUSERACL';
   /* EXPIRE PREVIOUS NPA AND STD IN CURRENT */
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSERACL'
   FROM AA ,RBL_MISDB_PROD.AdvCustNPADetail AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM tt_AdvCustNPAdetail_7 BB
                       WHERE  AA.CustomerEntityId = BB.CustomerEntityId
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSERACL';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,tt_AdvCustNPAdetail_7 A
          JOIN RBL_MISDB_PROD.AdvCustNPADetail B   ON B.CustomerEntityId = A.CustomerEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto
     AND b.EffectiveFromTimeKey < v_TimeKey
     AND B.ModifiedBy = 'SSISUSERACL') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'C';
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB_PROD.AdvCustNPADetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,tt_AdvCustNPAdetail_7 TEMP
          JOIN ( SELECT tt_AdvCustNPAdetail_7.CustomerEntityId ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM tt_AdvCustNPAdetail_7 
                  WHERE  tt_AdvCustNPAdetail_7.EntityKey = 0
                           OR tt_AdvCustNPAdetail_7.EntityKey IS NULL ) ACCT   ON TEMP.CustomerEntityId = ACCT.CustomerEntityId 
    WHERE Temp.IsChanged IN ( 'N','C' )
   ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   INSERT INTO RBL_MISDB_PROD.AdvCustNPADetail
     ( ENTITYKEY, CustomerEntityId, Cust_AssetClassAlt_Key, NPADt, LastInttChargedDt, DbtDt, LosDt, DefaultReason1Alt_Key, DefaultReason2Alt_Key, StaffAccountability, LastIntBooked, RefCustomerID, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocStatus, MocDate, MocTypeAlt_Key, NPA_Reason )
     ( SELECT ENTITYKEY ,
              CustomerEntityId ,
              Cust_AssetClassAlt_Key ,
              NPADt ,
              LastInttChargedDt ,
              DbtDt ,
              LosDt ,
              DefaultReason1Alt_Key ,
              DefaultReason2Alt_Key ,
              StaffAccountability ,
              LastIntBooked ,
              RefCustomerID ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CreatedBy ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              SYSDATE D2Ktimestamp  ,
              MocStatus ,
              MocDate ,
              MocTypeAlt_Key ,
              NPA_Reason 
       FROM tt_AdvCustNPAdetail_7 T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );
   ------------------End
   /*        AdvAcFinancialDetail  Start         */
   IF utils.object_id('TEMPDB..tt_AdvAcFinancialDetail_4') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AdvAcFinancialDetail_4 ';
   END IF;
   DELETE FROM tt_AdvAcFinancialDetail_4;
   INSERT INTO tt_AdvAcFinancialDetail_4
     ( ENTITYKEY, AccountEntityId, Ac_LastReviewDueDt, Ac_ReviewTypeAlt_key, Ac_ReviewDt, Ac_ReviewAuthAlt_Key, Ac_NextReviewDueDt, DrawingPower, InttRate, NpaDt, BookDebts, UnDrawnAmt, UnAdjSubSidy, LastInttRealiseDt, MocStatus, MOCReason, LimitDisbursed, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocDate, MocTypeAlt_Key, CropDuration, Ac_ReviewAuthLevelAlt_Key, AccountBlkCode2 )
     ( SELECT NULL ENTITYKEY  ,
              B.AccountEntityId ,
              B.Ac_LastReviewDueDt ,
              B.Ac_ReviewTypeAlt_key ,
              B.Ac_ReviewDt ,
              B.Ac_ReviewAuthAlt_Key ,
              B.Ac_NextReviewDueDt ,
              B.DrawingPower ,
              B.InttRate ,
              A.FinalNpaDt NpaDt  ,
              B.BookDebts ,
              B.UnDrawnAmt ,
              B.UnAdjSubSidy ,
              B.LastInttRealiseDt ,
              B.MocStatus ,
              B.MOCReason ,
              B.LimitDisbursed ,
              B.RefCustomerId ,
              B.RefSystemAcId ,
              B.AuthorisationStatus ,
              v_TimeKey EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              B.CreatedBy ,
              B.DateCreated ,
              B.ModifiedBy ,
              B.DateModified ,
              B.ApprovedBy ,
              B.DateApproved ,
              NULL D2Ktimestamp  ,
              B.MocDate ,
              B.MocTypeAlt_Key ,
              B.CropDuration ,
              B.Ac_ReviewAuthLevelAlt_Key ,
              B.AccountBlkCode2 
       FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
              JOIN RBL_MISDB_PROD.AdvAcFinancialDetail B   ON A.AccountEntityID = B.AccountEntityID
              AND B.EffectiveToTimeKey = 49999
              AND NVL(B.NpaDt, '1900-01-01') <> NVL(A.FinalNpaDt, '1900-01-01') );
   -----------------------------------------------
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSERACL'
   FROM O ,RBL_MISDB_PROD.AdvAcFinancialDetail O
          JOIN tt_AdvAcFinancialDetail_4 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey < v_TimeKey 
    WHERE ( NVL(O.NpaDt, '1900-01-01') <> NVL(T.NpaDt, '1900-01-01') )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSERACL';
   -----------------------------------------------
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.NpaDt, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSERACL'
   FROM O ,RBL_MISDB_PROD.AdvAcFinancialDetail O
          JOIN tt_AdvAcFinancialDetail_4 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey = v_TimeKey 
    WHERE ( NVL(O.NpaDt, '1900-01-01') <> NVL(T.NpaDt, '1900-01-01') )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.NpaDt = src.NpaDt,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSERACL';
   MERGE INTO t 
   USING (SELECT t.ROWID row_id, 'D'
   FROM t ,RBL_MISDB_PROD.AdvAcFinancialDetail O
          JOIN tt_AdvAcFinancialDetail_4 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey = v_TimeKey ) src
   ON ( t.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET t.IsChanged = 'D';
   /***************************************************************************************************************/
   --  ----------For Changes Records
   --UPDATE A SET A.IsChanged='C'
   ------Select * 
   --from tt_AdvAcFinancialDetail_4 A
   --INNER JOIN DBO.AdvAcFinancialDetail B 
   --ON B.AccountEntityId=A.AccountEntityId   
   --Where B.EffectiveToTimeKey= @vEffectiveto
   --And B.ModifiedBy='SSISUSERACL'
   /*  New Customers EntityKey ID Update  */
   v_EntityKey := 0 ;
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB_PROD.AdvAcFinancialDetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,tt_AdvAcFinancialDetail_4 TEMP
          JOIN ( SELECT tt_AdvAcFinancialDetail_4.AccountEntityId ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM tt_AdvAcFinancialDetail_4 
                  WHERE  tt_AdvAcFinancialDetail_4.EntityKey = 0
                           OR tt_AdvAcFinancialDetail_4.EntityKey IS NULL ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   ---Where Temp.IsChanged in ('N','C')
   ------------------------------------------------------------------
   INSERT INTO RBL_MISDB_PROD.AdvAcFinancialDetail
     ( ENTITYKEY, AccountEntityId, Ac_LastReviewDueDt, Ac_ReviewTypeAlt_key, Ac_ReviewDt, Ac_ReviewAuthAlt_Key, Ac_NextReviewDueDt, DrawingPower, InttRate, NpaDt, BookDebts, UnDrawnAmt, UnAdjSubSidy, LastInttRealiseDt, MocStatus, MOCReason, LimitDisbursed, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, D2Ktimestamp, MocDate, MocTypeAlt_Key, CropDuration, Ac_ReviewAuthLevelAlt_Key, AccountBlkCode2 )
     ( SELECT ENTITYKEY ,
              AccountEntityId ,
              Ac_LastReviewDueDt ,
              Ac_ReviewTypeAlt_key ,
              Ac_ReviewDt ,
              Ac_ReviewAuthAlt_Key ,
              Ac_NextReviewDueDt ,
              DrawingPower ,
              InttRate ,
              NpaDt ,
              BookDebts ,
              UnDrawnAmt ,
              UnAdjSubSidy ,
              LastInttRealiseDt ,
              MocStatus ,
              MOCReason ,
              LimitDisbursed ,
              RefCustomerId ,
              RefSystemAcId ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CreatedBy ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              SYSDATE D2Ktimestamp  ,
              MocDate ,
              MocTypeAlt_Key ,
              CropDuration ,
              Ac_ReviewAuthLevelAlt_Key ,
              AccountBlkCode2 
       FROM tt_AdvAcFinancialDetail_4 T
        WHERE  NVL(T.IsChanged, 'U') <> 'D' );--IN ('N','C')
   /*        AdvAcFinancialDetail  END         */
   -------
   -----------------------------------------------------------------------------------------------------------------------------------------
   /*        AdvAcBalanceDetail  Start         */
   IF utils.object_id('TEMPDB..#AdvAcBalanceDetail') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_AdvAcBalanceDetail_7 ';
   END IF;
   DELETE FROM tt_AdvAcBalanceDetail_8;
   INSERT INTO tt_AdvAcBalanceDetail_7
     ( EntityKey, AccountEntityId, AssetClassAlt_Key, BalanceInCurrency, Balance, SignBalance, LastCrDt, OverDue, TotalProv, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, OverDueSinceDt, MocStatus, MocDate, MocTypeAlt_Key, Old_OverDueSinceDt, Old_OverDue, ORG_TotalProv, IntReverseAmt, UnAppliedIntAmount, PS_Balance, NPS_Balance, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, CreatedBy, UpgradeDate, OverduePrincipal, NotionalInttAmt, PrincipalBalance, Overdueinterest, AdvanceRecovery, PS_NPS_FLAG, DFVAmt, InterestReceivable, OverduePrincipalDt, OverdueIntDt, OverOtherdue, OverdueOtherDt, SourceAssetClass, SourceNpaDate )
     ( SELECT NULL EntityKey  ,
              A.AccountEntityID ,
              A.FinalAssetClassAlt_Key AssetClassAlt_Key  ,
              B.BalanceInCurrency ,
              A.Balance Balance  ,
              b.SignBalance ,
              B.LastCrDt ,
              B.OverDue ,
              A.TotalProvision TotalProv  ,
              B.RefCustomerId ,
              B.RefSystemAcId ,
              B.AuthorisationStatus ,
              v_TimeKey EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  ,
              B.OverDueSinceDt ,
              B.MocStatus ,
              B.MocDate ,
              B.MocTypeAlt_Key ,
              B.Old_OverDueSinceDt ,
              B.Old_OverDue ,
              B.ORG_TotalProv ,
              B.IntReverseAmt ,
              B.UnAppliedIntAmount ,
              B.PS_Balance ,
              B.NPS_Balance ,
              B.DateCreated ,
              B.ModifiedBy ,
              B.DateModified ,
              B.ApprovedBy ,
              B.DateApproved ,
              B.CreatedBy ,
              B.UpgradeDate ,
              b.OverduePrincipal ,
              B.NotionalInttAmt ,
              A.PrincOutStd PrincipalBalance  ,
              B.Overdueinterest ,
              B.AdvanceRecovery ,
              B.PS_NPS_FLAG ,
              B.DFVAmt ,
              B.InterestReceivable ,
              B.OverduePrincipalDt ,
              B.OverdueIntDt ,
              B.OverOtherdue ,
              B.OverdueOtherDt ,
              B.SourceAssetClass ,
              B.SourceNpaDate 
       FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
              JOIN RBL_MISDB_PROD.AdvAcBalanceDetail B   ON A.AccountEntityID = B.AccountEntityId
              AND B.EffectiveToTimeKey = 49999
        WHERE  ( NVL(B.ASSETCLASSALT_KEY, 0) <> NVL(A.FinalAssetClassAlt_Key, 0)
                 OR NVL(B.BALANCE, 0) <> NVL(A.Balance, 0)
                 OR NVL(B.TOTALPROV, 0) <> NVL(A.TotalProvision, 0)
                 OR NVL(B.PrincipalBalance, 0) <> NVL(A.PrincOutStd, 0) ) );
   -----------------------------------------------------------------------------------------------------------------------------------------
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSERACL'
   FROM O ,RBL_MISDB_PROD.AdvAcBalanceDetail O
          JOIN tt_AdvAcBalanceDetail_7 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey < v_TimeKey 
    WHERE ( NVL(O.ASSETCLASSALT_KEY, 0) <> NVL(T.ASSETCLASSALT_KEY, 0)
     OR NVL(O.BALANCE, 0) <> NVL(T.BALANCE, 0)
     OR NVL(O.TOTALPROV, 0) <> NVL(T.TOTALPROV, 0)
     OR NVL(O.PrincipalBalance, 0) <> NVL(T.PrincipalBalance, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSERACL';
   -----------------For Same TimeKey And EffectiveFromTimeKey
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.ASSETCLASSALT_KEY, T.BALANCE, T.TOTALPROV, T.PrincipalBalance, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_6, 'SSISUSERACL'
   FROM O ,RBL_MISDB_PROD.AdvAcBalanceDetail O
          JOIN tt_AdvAcBalanceDetail_7 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey = v_TimeKey 
    WHERE ( NVL(O.ASSETCLASSALT_KEY, 0) <> NVL(T.ASSETCLASSALT_KEY, 0)
     OR NVL(O.BALANCE, 0) <> NVL(T.BALANCE, 0)
     OR NVL(O.TOTALPROV, 0) <> NVL(T.TOTALPROV, 0)
     OR NVL(O.PrincipalBalance, 0) <> NVL(T.PrincipalBalance, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.ASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                O.BALANCE = src.BALANCE,
                                O.TOTALPROV = src.TOTALPROV,
                                O.PrincipalBalance = src.PrincipalBalance,
                                O.DateModified = pos_6,
                                O.ModifiedBy = 'SSISUSERACL';
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, 'D'
   FROM T ,RBL_MISDB_PROD.AdvAcBalanceDetail O
          JOIN tt_AdvAcBalanceDetail_7 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999
          AND O.EffectiveFromTimeKey = v_TimeKey ) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET t.IsChanged = 'D';
   ----------For Changes Records
   --UPDATE A SET A.IsChanged='C'
   --from #AdvAcBalanceDetail A
   --INNER JOIN DBO.AdvAcBalanceDetail B 
   --ON B.AccountEntityId=A.AccountEntityId            
   --Where B.EffectiveToTimeKey= @vEffectiveto
   --And B.ModifiedBy='SSISUSERACL'
   /*  New Customers EntityKey ID Update  */
   v_EntityKey := 0 ;
   SELECT MAX(EntityKey)  

     INTO v_EntityKey
     FROM RBL_MISDB_PROD.AdvAcBalanceDetail ;
   IF v_EntityKey IS NULL THEN

   BEGIN
      v_EntityKey := 0 ;

   END;
   END IF;
   MERGE INTO TEMP 
   USING (SELECT TEMP.ROWID row_id, ACCT.EntityKey
   FROM TEMP ,tt_AdvAcBalanceDetail_7 TEMP
          JOIN ( SELECT tt_AdvAcBalanceDetail_7.AccountEntityId ,
                        (v_EntityKey + ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  )) EntityKey  
                 FROM tt_AdvAcBalanceDetail_7 
                  WHERE  tt_AdvAcBalanceDetail_7.EntityKey = 0
                           OR tt_AdvAcBalanceDetail_7.EntityKey IS NULL ) ACCT   ON TEMP.AccountEntityId = ACCT.AccountEntityId ) src
   ON ( TEMP.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET TEMP.EntityKey = src.EntityKey;
   --Where Temp.IsChanged in ('N','C')
   /***************************************************************************************************************/
   INSERT INTO RBL_MISDB_PROD.AdvAcBalanceDetail
     ( EntityKey, AccountEntityId, AssetClassAlt_Key, BalanceInCurrency, Balance, SignBalance, LastCrDt, OverDue, TotalProv, RefCustomerId, RefSystemAcId, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, OverDueSinceDt, MocStatus, MocDate, MocTypeAlt_Key, Old_OverDueSinceDt, Old_OverDue, ORG_TotalProv, IntReverseAmt, UnAppliedIntAmount, PS_Balance, NPS_Balance, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, CreatedBy, UpgradeDate, OverduePrincipal, NotionalInttAmt, PrincipalBalance, Overdueinterest, AdvanceRecovery, PS_NPS_FLAG, DFVAmt, InterestReceivable, OverduePrincipalDt, OverdueIntDt, OverOtherdue, OverdueOtherDt, SourceAssetClass, SourceNpaDate )
     ( SELECT EntityKey ,
              AccountEntityId ,
              AssetClassAlt_Key ,
              BalanceInCurrency ,
              Balance ,
              SignBalance ,
              LastCrDt ,
              OverDue ,
              TotalProv ,
              RefCustomerId ,
              RefSystemAcId ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              OverDueSinceDt ,
              MocStatus ,
              MocDate ,
              MocTypeAlt_Key ,
              Old_OverDueSinceDt ,
              Old_OverDue ,
              ORG_TotalProv ,
              IntReverseAmt ,
              UnAppliedIntAmount ,
              PS_Balance ,
              NPS_Balance ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              CreatedBy ,
              UpgradeDate ,
              OverduePrincipal ,
              NotionalInttAmt ,
              PrincipalBalance ,
              Overdueinterest ,
              AdvanceRecovery ,
              PS_NPS_FLAG ,
              DFVAmt ,
              InterestReceivable ,
              OverduePrincipalDt ,
              OverdueIntDt ,
              OverOtherdue ,
              OverdueOtherDt ,
              SourceAssetClass ,
              SourceNpaDate 
       FROM tt_AdvAcBalanceDetail_7 T
        WHERE  NVL(T.IsChanged, 'U') <> 'D' -- IN ('N','C')
      );--commit tran
   --end try
   --begin catch
   --	select ERROR_MESSAGE()
   --	rollback tran
   --end catch
   /*        AdvAcBalanceDetail  END         */

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CUSTACCOUNTMERGE_21082024" TO "ADF_CDR_RBL_STGDB";
