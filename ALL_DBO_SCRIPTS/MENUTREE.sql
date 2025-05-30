--------------------------------------------------------
--  DDL for Procedure MENUTREE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."MENUTREE" 
AS
   v_Count NUMBER(10,0);
   v_I NUMBER(10,0);
   v_MenuId NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   IF utils.object_id('Tempdb..tt_Detail') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Detail ';
   END IF;
   DELETE FROM tt_Detail;
   IF utils.object_id('Tempdb..tt_ParentID') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ParentID ';
   END IF;
   DELETE FROM tt_ParentID;
   INSERT INTO tt_ParentID
     SELECT MenuId 
       FROM SysCRisMacMenu 
      WHERE  ParentId IN ( 0,9999 )

       ORDER BY MenuId ASC;
   v_I := 1 ;
   SELECT COUNT(*)  

     INTO v_Count
     FROM tt_ParentID ;
   WHILE ( v_I <= v_Count ) 
   LOOP 

      BEGIN
         SELECT MenuId 

           INTO v_MenuId
           FROM tt_ParentID 
          WHERE  ID = v_I;
         INSERT INTO tt_Detail
           ( SELECT MenuId ,
                    ParentId ,
                    MenuCaption ,
                    1 
             FROM SysCRisMacMenu 
              WHERE  MenuId = v_MenuId );
         INSERT INTO tt_Detail
           ( SELECT MenuId ,
                    ParentId ,
                    MenuCaption ,
                    0 
             FROM SysCRisMacMenu 
              WHERE  ParentId = v_MenuId );
         v_I := v_I + 1 ;

      END;
   END LOOP;
   OPEN  v_cursor FOR
      SELECT * 
        FROM tt_Detail  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."MENUTREE" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."MENUTREE" TO "ADF_CDR_RBL_STGDB";
