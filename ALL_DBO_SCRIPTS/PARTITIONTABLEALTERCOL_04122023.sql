--------------------------------------------------------
--  DDL for Procedure PARTITIONTABLEALTERCOL_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" /* This SP is usedfor in case column alter/add in a table that should be add/alter in all partition ab/tables*/
(
  v_ObjectName IN VARCHAR2 DEFAULT 'AdvAcBasicDetail' ,
  iv_TSQLCommand IN VARCHAR2 DEFAULT 'Alter Table Curdat.AdvAcBasicDetail ADD customeracid varchar(30)' 
)
AS
   v_TSQLCommand VARCHAR2(4000) := iv_TSQLCommand;
   v_SQL VARCHAR2(4000) := ' ';
   v_PartitionFreq VARCHAR2(3);
   v_DB_Name VARCHAR2(50);
   v_TableSuffix VARCHAR2(100);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT SYS_CONTEXT('USERENV','') 

     INTO v_DB_Name
     FROM DUAL ;
   v_TSQLCommand := REPLACE(v_TSQLCommand, 'Alter Table', ' ') ;
   v_TSQLCommand := REPLACE(v_TSQLCommand, 'CURdAT.' || v_ObjectName, ' ') ;
   SELECT PartitionFreq 

     INTO v_PartitionFreq
     FROM DimPartitionTable 
    WHERE  PartitionTbaleName = v_ObjectName;
   IF v_PartitionFreq = 'MLY' THEN
    v_TableSuffix := 'Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec' ;
   END IF;
   IF v_PartitionFreq = 'QLY' THEN
    v_TableSuffix := 'Q1,Q2,Q3,Q4' ;
   END IF;
   DELETE FROM tt_DB_LIST_2;
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_DB_LIST_2  --SQLDEV: NOT RECOGNIZED
   DBMS_OUTPUT.PUT_LINE(11);
   INSERT INTO tt_DB_LIST_2
     ( SELECT NAME ,
              1 iD  
       FROM SYS.databases 
        WHERE  NAME LIKE v_DB_NAME || '%'
                 AND utils.isnumeric(SUBSTR(NAME, -4, 4)) = 1
                 AND SUBSTR(NAME, -4, 4) BETWEEN 2020 AND 2099
                 AND LENGTH(NAME) = LENGTH(v_DB_NAME) || 5 );
   DBMS_OUTPUT.PUT_LINE(12);
   OPEN  v_cursor FOR
      SELECT * 
        FROM tt_DB_LIST_2  ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   v_SQL := ' USE ' || v_DB_Name || CHR(13) || ' ' ;
   SELECT CHR(13) || STRING_AGG(QRY, ' ') 

     INTO v_SQL
     FROM ( SELECT ' ALTER TABLE ' || DbName || '.DBO.' || v_ObjectName || '_' || SUBSTR(DbName, -4, 4) || '_' || VALUE || v_TSQLCommand QRY  
            FROM tt_DB_LIST_2 A
                   JOIN ( SELECT 1 ID  ,
                                 VALUE 
                          FROM TABLE(STRING_SPLIT(v_TableSuffix, ','))  ) B   ON A.ID = B.ID ) A;
   --SELECT @SQL
   --print 2
   ---print @SQL
   EXECUTE IMMEDIATE v_SQL;
   v_SQL := 'exec sp_refreshview ''' || v_ObjectName || '''' ;
   DBMS_OUTPUT.PUT_LINE(v_SQL);
   EXECUTE IMMEDIATE v_SQL;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."PARTITIONTABLEALTERCOL_04122023" TO "ADF_CDR_RBL_STGDB";
