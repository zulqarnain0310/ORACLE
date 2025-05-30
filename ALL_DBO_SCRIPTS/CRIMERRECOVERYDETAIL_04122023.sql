--------------------------------------------------------
--  DDL for Procedure CRIMERRECOVERYDETAIL_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" 
-- =============================================
 -- Author:		<HAMID>
 -- Create date: <09 MAR 2018>
 -- Description:	<TO GET A Crime Recovery Details>
 -- =============================================
 --EXEC CrimerRecoveryDetail 49999, 1
 CREATE PROC "dbo" . "CrimerRecoveryDetail_04122023" @TimeKey INT , @Mode TINYINT AS DROP TABLE IF  --SQLDEV: NOT RECOGNIZED
(
  v_TimeKey IN NUMBER,
  v_Mode IN NUMBER
)
AS
   v_cursor SYS_REFCURSOR;

BEGIN

   --DECLARE @TimeKey INT = 49999, @Mode TINYINT =1 
   IF tt_CrimerRecoveryDetails_2  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_CrimerRecoveryDetails_2;
   UTILS.IDENTITY_RESET('tt_CrimerRecoveryDetails_2');

   INSERT INTO tt_CrimerRecoveryDetails_2 ( 
   	SELECT A.CrimeEntityId ,
           A.CrimeRecEntityId ,
           ParameterName StatusAlt_Key  ,
           UTILS.CONVERT_TO_VARCHAR2(StatusDate,10,p_style=>103) StatusDate  ,
           RecoverAmt ,
           Remarks ,
           'N' IsMainTable  
   	  FROM CrimerRecoveryDetails_MOD A
             JOIN ( SELECT CrimeEntityId ,
                           CrimeRecEntityId ,
                           MAX(Entitykey)  Entitykey  
                    FROM CrimerRecoveryDetails_MOD 
                     WHERE  ( EffectiveFromTimeKey <= v_TimeKey
                              AND EffectiveToTimeKey >= v_TimeKey )
                              AND AuthorisationStatus IN ( 'NP','MP','DP','RM' )

                      GROUP BY CrimeEntityId,CrimeRecEntityId ) B   ON A.Entitykey = B.Entitykey
             LEFT JOIN DimParameter P   ON ( P.EffectiveFromTimeKey <= v_TimeKey
             AND P.EffectiveToTimeKey >= v_TimeKey )
             AND DimParameterName = 'DimCrimeStatus'
             AND P.ParameterAlt_Key = A.StatusAlt_Key );
   IF v_Mode <> 16 THEN

   BEGIN
      INSERT INTO tt_CrimerRecoveryDetails_2
        ( SELECT CrimeEntityId ,
                 CrimeRecEntityId ,
                 ParameterName StatusAlt_Key  ,
                 UTILS.CONVERT_TO_VARCHAR2(StatusDate,10,p_style=>103) StatusDate  ,
                 RecoverAmt ,
                 Remarks ,
                 'Y' IsMainTable  
          FROM CrimerRecoveryDetails A
                 LEFT JOIN DimParameter P   ON ( P.EffectiveFromTimeKey <= v_TimeKey
                 AND P.EffectiveToTimeKey >= v_TimeKey )
                 AND ( A.EffectiveFromTimeKey <= v_TimeKey
                 AND A.EffectiveToTimeKey >= v_TimeKey )
                 AND DimParameterName = 'DimCrimeStatus'
                 AND NVL(A.AuthorisationStatus, 'A') = 'A'
                 AND P.ParameterAlt_Key = A.StatusAlt_Key );

   END;
   END IF;
   --WHERE (EffectiveFromTimeKey <= @TimeKey AND EffectiveToTimeKey >= @TimeKey)
   --AND ISNULL(AuthorisationStatus,'A')='A'
   IF v_Mode = 16 THEN

   BEGIN
      OPEN  v_cursor FOR
         SELECT * 
           FROM tt_CrimerRecoveryDetails_2 
          WHERE  IsMainTable = 'N' ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   ELSE

   BEGIN
      OPEN  v_cursor FOR
         SELECT * 
           FROM tt_CrimerRecoveryDetails_2  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."CRIMERRECOVERYDETAIL_04122023" TO "ADF_CDR_RBL_STGDB";
