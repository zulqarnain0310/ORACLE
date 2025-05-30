--------------------------------------------------------
--  DDL for Procedure LASTLOGINBRANCHSELECTUPDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" 
(
  v_BranchCode IN VARCHAR2,
  v_Type IN VARCHAR2,
  v_userLoginId IN VARCHAR2
)
AS
   v_Maxkey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   IF v_Type = 'Login' THEN

   BEGIN
      SELECT MAX(EntityKey)  

        INTO v_Maxkey
        FROM UserLoginHistory 
       WHERE  UserID = v_userLoginId
                AND BranchCode IS NOT NULL;
      OPEN  v_cursor FOR
         SELECT BranchCode 
           FROM UserLoginHistory 
          WHERE  EntityKey = v_Maxkey ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   ELSE
      IF v_Type = 'Logout' THEN
       DECLARE
         v_TimeKeyCurrent NUMBER(10,0);

      BEGIN
         SELECT MAX(EntityKey)  

           INTO v_Maxkey
           FROM UserLoginHistory 
          WHERE  UserID = v_userLoginId;
         UPDATE UserLoginHistory
            SET BranchCode = v_BranchCode,
                LogoutTime = SYSDATE
          WHERE  UserID = v_userLoginId
           AND EntityKey = v_Maxkey;
         UPDATE UserLoginHistory
            SET DurationMin = utils.datediff('MINUTE', loginTime, LogoutTime)
          WHERE  UserID = v_userLoginId
           AND EntityKey = v_Maxkey;
         OPEN  v_cursor FOR
            SELECT BranchCode 
              FROM UserLoginHistory 
             WHERE  EntityKey = v_Maxkey ;
            DBMS_SQL.RETURN_RESULT(v_cursor);
         SELECT TimeKey 

           INTO v_TimeKeyCurrent
           FROM SysDayMatrix 
          WHERE  date_ = UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103);
         UPDATE DimUserInfo
            SET UserLogged = 0
          WHERE  ( EffectiveFromTimeKey <= v_TimeKeyCurrent
           AND EffectiveToTimeKey >= v_TimeKeyCurrent )
           AND UserLoginID = v_userLoginId;

      END;
      END IF;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."LASTLOGINBRANCHSELECTUPDATE" TO "ADF_CDR_RBL_STGDB";
