--------------------------------------------------------
--  DDL for Procedure SMA_CLASS_HISTORY_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" 
AS
   -----------------------------------------------------------------------------------------------------------
   v_Date VARCHAR2(200) := ( SELECT Date_ 
     FROM Automate_Advances 
    WHERE  Ext_flg = 'Y' );
   v_Timekey NUMBER(10,0) := ( SELECT Timekey 
     FROM Automate_Advances 
    WHERE  Ext_flg = 'Y' );
   v_LastQtrDateKey NUMBER(10,0) := ( SELECT LastQtrDateKey 
     FROM sysdaymatrix 
    WHERE  timekey IN ( SELECT Timekey 
                        FROM Automate_Advances 
                         WHERE  Ext_flg = 'Y' )
    );
   v_PROCESSDATE VARCHAR2(200) := ( SELECT DATE_ 
     FROM SYSDAYMATRIX 
    WHERE  TIMEKEY = v_TIMEKEY );
   v_PrvDayTimekey NUMBER(10,0) := ( SELECT timekey - 1 
     FROM Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_VEFFECTIVETO NUMBER(10,0) := v_TIMEKEY - 1;

BEGIN

   ------------------------------------------------------------------------------------------------------
   IF utils.object_id('TEMPDB..tt_TempSMA_Class_2') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TempSMA_Class_2 ';
   END IF;
   DELETE FROM tt_TempSMA_Class_2;
   UTILS.IDENTITY_RESET('tt_TempSMA_Class_2');

   INSERT INTO tt_TempSMA_Class_2 ( 
   	SELECT a.AccountEntityID ,
           B.SMA_Class Initial_SMA_Class  ,
           a.SMA_Class Final_SMA_Class  ,
           a.SMA_Dt ,
           ( SELECT Date_ 
             FROM Automate_Advances 
            WHERE  Ext_flg = 'Y' ) SMA_Change_Date  ,
           a.FlgSMA ,
           a.DPD_SMA ,
           a.SMA_Reason ,
           a.DPD_Max 
   	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL a
             LEFT JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist b   ON a.AccountEntityID = b.AccountEntityid
   	 WHERE  b.EffectiveFromTimeKey <= v_PrvDayTimekey
              AND b.EffectiveToTimeKey >= v_PrvDayTimekey
              AND a.FinalAssetClassAlt_Key = 1 );

   EXECUTE IMMEDIATE ' ALTER TABLE tt_TempSMA_Class_2 
      ADD ( IsChanged VARCHAR2(5)  ) ';
   -------------------------------------------------------------------------------------------------------
   /* ACCOUNT CAL HIST MERGE */
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, 'E'
   FROM T ,PRO_RBL_MISDB_PROD.SMA_Class_hist O
          JOIN tt_TempSMA_Class_2 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999 ) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET T.IsChanged = 'E';
   MERGE INTO T 
   USING (SELECT T.ROWID row_id, 'C'
   FROM T ,PRO_RBL_MISDB_PROD.SMA_Class_hist O
          JOIN tt_TempSMA_Class_2 T   ON O.AccountEntityID = T.AccountEntityID
          AND O.EffectiveToTimeKey = 49999 
    WHERE ( NVL(O.Initial_SMA_Class, 0) <> NVL(T.Initial_SMA_Class, 0)
     OR NVL(O.Final_SMA_Class, 0) <> NVL(T.Final_SMA_Class, 0)
     OR NVL(O.SMA_Dt, ' ') <> NVL(T.SMA_Dt, ' ') )) src
   ON ( T.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET T.IsChanged = 'C';
   --OR ISNULL(O.SMA_Change_Date,'')<>ISNULL(T.SMA_Change_Date,'')
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'U'
   FROM A ,tt_TempSMA_Class_2 A
          JOIN PRO_RBL_MISDB_PROD.SMA_Class_hist B   ON B.AccountEntityID = A.AccountEntityID 
    WHERE B.EffectiveFromTimeKey = v_TimeKey
     AND A.IsChanged = 'C') src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged = 'U';
   ----------For Changes Records
   MERGE INTO b 
   USING (SELECT b.ROWID row_id, v_VEFFECTIVETO
   FROM b ,tt_TempSMA_Class_2 A
          JOIN PRO_RBL_MISDB_PROD.SMA_Class_hist B   ON B.AccountEntityID = A.AccountEntityID
          AND B.EffectiveToTimeKey = 49999 
    WHERE B.EffectiveFromTimeKey < v_TimeKey
     AND A.IsChanged = 'C') src
   ON ( b.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET b.EffectiveToTimeKey = v_VEFFECTIVETO;
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, T.Initial_SMA_Class, T.Final_SMA_Class, T.SMA_Dt, T.SMA_Change_Date
   FROM O ,PRO_RBL_MISDB_PROD.SMA_Class_hist O
          JOIN tt_TempSMA_Class_2 T   ON O.AccountEntityID = T.AccountEntityID 
    WHERE O.EffectiveFromTimeKey = v_TimeKey
     AND T.IsChanged = 'U') src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.Initial_SMA_Class = src.Initial_SMA_Class,
                                O.Final_SMA_Class = src.Final_SMA_Class,
                                O.SMA_Dt = src.SMA_Dt,
                                O.SMA_Change_Date = src.SMA_Change_Date;
   ----------------------------------------------------------------------------------------------------------------------------------------------
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_VEFFECTIVETO
   FROM AA ,PRO_RBL_MISDB_PROD.SMA_Class_hist AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM tt_TempSMA_Class_2 BB
                       WHERE  AA.AccountEntityID = BB.AccountEntityID )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_VEFFECTIVETO;
   --/*  New Customers Ac Key ID Update  */
   --DECLARE @EntityKeyAc BIGINT=0 
   --SELECT @EntityKeyAc=MAX(EntityKey) FROM  tt_TempSMA_Class_2
   --IF @EntityKeyAc IS NULL  
   --BEGIN
   --	SET @EntityKeyAc=0
   --END
   --UPDATE TEMP 
   --SET TEMP.EntityKeyNew=ACCT.EntityKeyNew
   -- FROM PRO.ACCOUNTCAL TEMP
   --INNER JOIN (SELECT AccountEntityId,(@EntityKeyAc + ROW_NUMBER()OVER(ORDER BY (SELECT 1))) EntityKeyNew
   --			FROM PRO.ACCOUNTCAL Where IsChanged in ('C','N')
   --			)ACCT ON TEMP.AccountEntityId=ACCT.AccountEntityId
   --WHERE Temp.IsChanged in ('C','N')
   /***************************************************************************************************************/
   INSERT INTO PRO_RBL_MISDB_PROD.SMA_Class_hist
     ( AccountEntityID, Initial_SMA_Class, Final_SMA_Class, SMA_Dt, SMA_Change_Date, EffectiveFromTimeKey, EffectiveToTimeKey )
     ( SELECT AccountEntityID ,
              Initial_SMA_Class ,
              Final_SMA_Class ,
              SMA_Dt ,
              SMA_Change_Date ,
              v_Timekey EffectiveFromTimeKey  ,
              49999 EffectiveToTimeKey  
       FROM tt_TempSMA_Class_2 T
        WHERE  NVL(T.IsChanged, 'N') IN ( 'C','N' )
      );--SELECT * FROM PRO.ACCOUNTCAL
   --drop table pro.SMA_Class_hist
   --Create Table pro.SMA_Class_hist
   --(
   --AccountEntityID INT,
   --Initial_SMA_Class Varchar(20),
   --Final_SMA_Class Varchar(20),
   --SMA_Dt Date,
   --SMA_Change_Date Date,
   --EffectiveFromTimeKey int,
   --EffectiveToTimeKey int
   --)

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_CLASS_HISTORY_21082024" TO "ADF_CDR_RBL_STGDB";
