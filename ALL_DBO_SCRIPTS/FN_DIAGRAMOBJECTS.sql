--------------------------------------------------------
--  DDL for Function FN_DIAGRAMOBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" 
RETURN NUMBER
AUTHID DEFINER
AS
   v_id_upgraddiagrams NUMBER(10,0);
   v_id_sysdiagrams NUMBER(10,0);
   v_id_helpdiagrams NUMBER(10,0);
   v_id_helpdiagramdefinition NUMBER(10,0);
   v_id_creatediagram NUMBER(10,0);
   v_id_renamediagram NUMBER(10,0);
   v_id_alterdiagram NUMBER(10,0);
   v_id_dropdiagram NUMBER(10,0);
   v_InstalledObjects NUMBER(10,0);

BEGIN
   v_InstalledObjects := 0 ;
   v_id_upgraddiagrams := utils.object_id(u'dbo.sp_upgraddiagrams') ;
   v_id_sysdiagrams := utils.object_id(u'dbo.sysdiagrams') ;
   v_id_helpdiagrams := utils.object_id(u'dbo.sp_helpdiagrams') ;
   v_id_helpdiagramdefinition := utils.object_id(u'dbo.sp_helpdiagramdefinition') ;
   v_id_creatediagram := utils.object_id(u'dbo.sp_creatediagram') ;
   v_id_renamediagram := utils.object_id(u'dbo.sp_renamediagram') ;
   v_id_alterdiagram := utils.object_id(u'dbo.sp_alterdiagram') ;
   v_id_dropdiagram := utils.object_id(u'dbo.sp_dropdiagram') ;
   IF v_id_upgraddiagrams IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 1 ;
   END IF;
   IF v_id_sysdiagrams IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 2 ;
   END IF;
   IF v_id_helpdiagrams IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 4 ;
   END IF;
   IF v_id_helpdiagramdefinition IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 8 ;
   END IF;
   IF v_id_creatediagram IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 16 ;
   END IF;
   IF v_id_renamediagram IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 32 ;
   END IF;
   IF v_id_alterdiagram IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 64 ;
   END IF;
   IF v_id_dropdiagram IS NOT NULL THEN
    v_InstalledObjects := v_InstalledObjects + 128 ;
   END IF;
   RETURN v_InstalledObjects;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."FN_DIAGRAMOBJECTS" TO "ADF_CDR_RBL_STGDB";
