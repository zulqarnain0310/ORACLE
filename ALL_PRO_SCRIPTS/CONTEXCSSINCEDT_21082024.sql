--------------------------------------------------------
--  DDL for Procedure CONTEXCSSINCEDT_21082024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."CONTEXCSSINCEDT_21082024" /*==============================================
 AUTHER : TRILOKI SHANKER KHANNA
 CREATE DATE : 22-02-2021
 MODIFY DATE : 22-02-2021
 DESCRIPTION : INSERT DATA PRO.ContExcsSinceDt
 --EXEC PRO.ContExcsSinceDt
 -- truncate table  Pro.ContExcsSinceDtAccountCal
 ================================================*/
AS
   v_vEffectivefrom NUMBER(10,0);
   v_TimeKey NUMBER(10,0);
   v_DATE VARCHAR2(200) := ( SELECT Date_ 
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT TimeKey 

     INTO v_vEffectiveFrom
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   SELECT TimeKey 

     INTO v_TimeKey
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   IF v_TimeKey = 26267 THEN

   BEGIN
      OPEN  v_cursor FOR
         SELECT 'cont.excess skipped' 
           FROM DUAL  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   ELSE

   BEGIN
      IF utils.object_id('TEMPDB..tt_ContExcsSinceDtAccountCa_5') IS NOT NULL THEN
       EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ContExcsSinceDtAccountCa_5 ';
      END IF;
      DELETE FROM tt_ContExcsSinceDtAccountCa_5;
      UTILS.IDENTITY_RESET('tt_ContExcsSinceDtAccountCa_5');

      INSERT INTO tt_ContExcsSinceDtAccountCa_5 ( 
      	SELECT CustomerAcID 
      	  FROM DIMBRANCH DB
                JOIN RBL_MISDB_PROD.AdvAcBasicDetail ACBD   ON ( ACBD.EffectiveFromTimeKey <= v_TimeKey
                AND ACBD.EffectiveToTimeKey >= v_TimeKey )
                AND DB.EffectiveFromTimeKey <= v_Timekey
                AND DB.EffectiveToTimeKey >= v_Timekey
                AND DB.BranchCode = ACBD.BranchCode
                JOIN RBL_MISDB_PROD.AdvAcBalanceDetail AB   ON ( AB.EffectiveFromTimeKey <= v_TimeKey
                AND AB.EffectiveToTimeKey >= v_TimeKey )
                AND AB.AccountEntityId = ACBD.AccountEntityId
                JOIN RBL_MISDB_PROD.ADVFACCCDETAIL CC   ON ( CC.EffectiveFromTimeKey <= v_TimeKey
                AND CC.EffectiveToTimeKey >= v_TimeKey )
                AND CC.AccountEntityId = ACBD.AccountEntityId
                JOIN RBL_MISDB_PROD.AdvAcFinancialDetail AFD   ON ( AFD.EffectiveFromTimeKey <= v_TimeKey
                AND AFD.EffectiveToTimeKey >= v_TimeKey )
                AND AFD.AccountEntityId = ACBD.AccountEntityId

      	------WHERE  ISNULL(Balance,0)>ISNULL(DrawingPower,0) AND ISNULL(DrawingPower,0)>=0
      	WHERE  NVL(Balance, 0) > (CASE 
                                      WHEN NVL(DrawingPower, 0) < NVL(ACBD.CurrentLimit, 0) THEN NVL(DrawingPower, 0)
              ELSE NVL(ACBD.CurrentLimit, 0)
                 END)
                AND ACBD.SourceAlt_Key = 1 --- ONLY FOR FINALCE TO CHECK CC ACCOUNT CONT EXCESS DATE

      	MINUS 
      	SELECT CustomerAcID 
      	  FROM PRO_RBL_MISDB_PROD.ContExcsSinceDtAccountCal 
      	 WHERE  Effectivetotimekey = 49999 );
      INSERT INTO PRO_RBL_MISDB_PROD.ContExcsSinceDtAccountCal
        ( CustomerAcID, AccountEntityId, SanctionAmt, SanctionDt, Balance, DrawingPower, ContExcsSinceDt, EffectiveFromTimeKey, EffectiveToTimeKey )
        ( SELECT ACBD.CustomerAcID CustomerAcID  ,
                 ACBD.AccountEntityId AccountEntityId  ,
                 ACBD.CurrentLimit SanctionAmt  ,
                 ACBD.CurrentLimitDt SanctionDt  ,
                 AB.Balance Balance  ,
                 AFD.DrawingPower DrawingPower  ,
                 v_DATE ContExcsSinceDt  ,
                 v_TimeKey EffectiveFromTimeKey  ,
                 49999 EffectiveToTimeKey  
          FROM tt_ContExcsSinceDtAccountCa_5 D
                 JOIN RBL_MISDB_PROD.AdvAcBasicDetail ACBD   ON ( ACBD.EffectiveFromTimeKey <= v_TimeKey
                 AND ACBD.EffectiveToTimeKey >= v_TimeKey )
                 AND D.CustomerAcID = ACBD.CustomerAcID
                 JOIN RBL_MISDB_PROD.AdvAcBalanceDetail AB   ON ( AB.EffectiveFromTimeKey <= v_TimeKey
                 AND AB.EffectiveToTimeKey >= v_TimeKey )
                 AND AB.AccountEntityId = ACBD.AccountEntityId
                 JOIN RBL_MISDB_PROD.ADVFACCCDETAIL CC   ON ( CC.EffectiveFromTimeKey <= v_TimeKey
                 AND CC.EffectiveToTimeKey >= v_TimeKey )
                 AND CC.AccountEntityId = ACBD.AccountEntityId
                 JOIN RBL_MISDB_PROD.AdvAcFinancialDetail AFD   ON ( AFD.EffectiveFromTimeKey <= v_TimeKey
                 AND AFD.EffectiveToTimeKey >= v_TimeKey )
                 AND AFD.AccountEntityId = ACBD.AccountEntityId

          --WHERE  ISNULL(Balance,0)>(ISNULL(DrawingPower,0) AND ISNULL(DrawingPower,0)>=0)	
          WHERE  NVL(Balance, 0) > (CASE 
                                         WHEN NVL(DrawingPower, 0) < NVL(ACBD.CurrentLimit, 0) THEN NVL(DrawingPower, 0)
                 ELSE NVL(ACBD.CurrentLimit, 0)
                    END)
                   AND ACBD.SourceAlt_Key = 1 );--- ONLY FOR FINALCE TO CHECK CC ACCOUNT CONT EXCESS DATE
      IF utils.object_id('TEMPDB..tt_ContExcsSinceDtAccountCa_5EXP') IS NOT NULL THEN
       EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ContExcsSinceDtAccountCa_6 ';
      END IF;
      DELETE FROM tt_ContExcsSinceDtAccountCa_6;
      UTILS.IDENTITY_RESET('tt_ContExcsSinceDtAccountCa_6');

      INSERT INTO tt_ContExcsSinceDtAccountCa_6 ( 
      	SELECT CustomerAcID 
      	  FROM DIMBRANCH DB
                JOIN RBL_MISDB_PROD.AdvAcBasicDetail ACBD   ON ( ACBD.EffectiveFromTimeKey <= v_TimeKey
                AND ACBD.EffectiveToTimeKey >= v_TimeKey )
                AND DB.EffectiveFromTimeKey <= v_Timekey
                AND DB.EffectiveToTimeKey >= v_Timekey
                AND DB.BranchCode = ACBD.BranchCode
                JOIN RBL_MISDB_PROD.AdvAcBalanceDetail AB   ON ( AB.EffectiveFromTimeKey <= v_TimeKey
                AND AB.EffectiveToTimeKey >= v_TimeKey )
                AND AB.AccountEntityId = ACBD.AccountEntityId
                JOIN RBL_MISDB_PROD.ADVFACCCDETAIL CC   ON ( CC.EffectiveFromTimeKey <= v_TimeKey
                AND CC.EffectiveToTimeKey >= v_TimeKey )
                AND CC.AccountEntityId = ACBD.AccountEntityId
                JOIN RBL_MISDB_PROD.AdvAcFinancialDetail AFD   ON ( AFD.EffectiveFromTimeKey <= v_TimeKey
                AND AFD.EffectiveToTimeKey >= v_TimeKey )
                AND AFD.AccountEntityId = ACBD.AccountEntityId

      	----WHERE  ISNULL(Balance,0)>ISNULL(DrawingPower,0) AND ISNULL(DrawingPower,0)>=0
      	WHERE  NVL(Balance, 0) > (CASE 
                                      WHEN NVL(DrawingPower, 0) < NVL(ACBD.CurrentLimit, 0) THEN NVL(DrawingPower, 0)
              ELSE NVL(ACBD.CurrentLimit, 0)
                 END)
                AND ACBD.SourceAlt_Key = 1 );--- ONLY FOR FINALCE TO CHECK CC ACCOUNT CONT EXCESS DATE
      --/*------EXPIRE DATA FOR ---------------------*/
      MERGE INTO A 
      USING (SELECT A.ROWID row_id, v_TimeKey - 1 AS EffectiveToTimekey
      FROM A ,PRO_RBL_MISDB_PROD.ContExcsSinceDtAccountCal A
             LEFT JOIN ( SELECT A.CustomerAcID 
                         FROM PRO_RBL_MISDB_PROD.ContExcsSinceDtAccountCal a
                                JOIN tt_ContExcsSinceDtAccountCa_6 b   ON a.CustomerAcID = b.CustomerAcID ) C   ON A.CustomerAcID = C.CustomerAcID 
       WHERE C.CustomerAcID IS NULL
        AND A.EffectiveToTimeKey = 49999) src
      ON ( A.ROWID = src.row_id )
      WHEN MATCHED THEN UPDATE SET A.EffectiveToTimekey = src.EffectiveToTimekey;
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ContExcsSinceDtAccountCa_5 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ContExcsSinceDtAccountCa_6 ';------SELECT * FROM Automate_Advances  WHERE EXT_FLG='Y'
      ------SELECT MAX(EFFECTIVEFROMTIMEKEY)
      ------DELETE FROM Pro.ContExcsSinceDtAccountCalBKUP WHERE EFFECTIVEFROMTIMEKEY=26135
      ------UPDATE   Pro.ContExcsSinceDtAccountCalBKUP SET EffectiveToTimeKey=49999 WHERE EffectiveToTimeKey=26134

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."CONTEXCSSINCEDT_21082024" TO "ADF_CDR_RBL_STGDB";
