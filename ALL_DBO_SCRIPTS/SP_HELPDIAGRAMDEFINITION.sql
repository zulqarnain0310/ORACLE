--------------------------------------------------------
--  DDL for Function SP_HELPDIAGRAMDEFINITION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" 
(
  v_diagramname IN VARCHAR2,
  iv_owner_id IN NUMBER DEFAULT NULL 
)
RETURN NUMBER
AUTHID DEFINER
AS
   v_owner_id NUMBER(10,0) := iv_owner_id;
   v_theId NUMBER(10,0);
   v_IsDbo NUMBER(10,0);
   v_DiagId NUMBER(10,0);
   v_UIDFound NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   IF ( v_diagramname IS NULL ) THEN

   BEGIN
      utils.raiserror( 0, u'E_INVALIDARG' );
      RETURN -1;

   END;
   END IF;
   /*TODO:SQLDEV*/ execute as caller /*END:SQLDEV*/
   v_theId := DATABASE_PRINCIPAL_ID() ;
   v_IsDbo := /*TODO:SQLDEV*/ IS_MEMBER(u'db_owner') /*END:SQLDEV*/ ;
   IF ( v_owner_id IS NULL ) THEN
    v_owner_id := v_theId ;
   END IF;
   /*TODO:SQLDEV*/ revert /*END:SQLDEV*/
   SELECT diagram_id ,
          principal_id 

     INTO v_DiagId,
          v_UIDFound
     FROM RBL_MISDB_PROD.sysdiagrams 
    WHERE  principal_id = v_owner_id
             AND NAME = v_diagramname;
   IF ( v_DiagId IS NULL
     OR ( v_IsDbo = 0
     AND v_UIDFound <> v_theId ) ) THEN

   BEGIN
      utils.raiserror( 0, 'Diagram does not exist or you do not have permission.' );
      RETURN -3;

   END;
   END IF;
   OPEN  v_cursor FOR
      SELECT version ,
             DEFINITION 
        FROM RBL_MISDB_PROD.sysdiagrams 
       WHERE  diagram_id = v_DiagId ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   RETURN 0;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SP_HELPDIAGRAMDEFINITION" TO "ADF_CDR_RBL_STGDB";
