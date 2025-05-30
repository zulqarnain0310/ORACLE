--------------------------------------------------------
--  DDL for Procedure UPDATEDATAFOROWNERSHIPTYPESOLO_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

(
  v_CollateralID IN NUMBER,
  v_OperationFlag IN NUMBER
)
AS
   v_Timekey NUMBER(10,0);
   v_EffectiveFromTimeKey NUMBER(10,0);
   v_EffectiveToTimeKey NUMBER(10,0);
   v_CollateralOwnerShipTypeAlt_Key NUMBER(10,0);

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   v_EffectiveFromTimeKey := v_TimeKey ;
   v_EffectiveToTimeKey := 49999 ;
   IF ( v_OperationFlag IN ( 16 )
    ) THEN

   BEGIN
      SELECT CollateralOwnerShipTypeAlt_Key 

        INTO v_CollateralOwnerShipTypeAlt_Key
        FROM CollateralMgmt 
       WHERE  CollateralID = v_CollateralID
                AND EffectiveFromTimeKey = v_EffectiveFromTimeKey
                AND EffectiveToTimeKey = v_EffectiveToTimeKey;
      IF ( v_CollateralOwnerShipTypeAlt_Key = 1 ) THEN

      BEGIN
         UPDATE CollateralOtherOwner
            SET EffectiveToTimeKey = EffectiveFromTimeKey - 1
          WHERE  CollateralID = v_CollateralID
           AND EffectiveFromTimeKey = v_EffectiveFromTimeKey
           AND EffectiveToTimeKey = v_EffectiveToTimeKey;

      END;
      END IF;

   END;
   END IF;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."UPDATEDATAFOROWNERSHIPTYPESOLO_04122023" TO "ADF_CDR_RBL_STGDB";
