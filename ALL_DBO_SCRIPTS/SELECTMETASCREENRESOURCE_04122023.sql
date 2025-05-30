--------------------------------------------------------
--  DDL for Procedure SELECTMETASCREENRESOURCE_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" 
---[dbo].[SelectMetaScreenResource] 'AddLegalHeirDetail'

(
  v_ScreenName IN VARCHAR2 DEFAULT 'Professionals' 
)
AS
   v_MenuId NUMBER(10,0);
   v_LoopCount NUMBER(3,0) := 1;
   v_LangName VARCHAR2(20);
   v_temp NUMBER(1, 0) := 0;
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT MenuId 

     INTO v_MenuId
     FROM SysCRisMacMenu 
    WHERE  REPLACE(MenuCaption, ' ', ' ') = v_ScreenName;
   --select @MenuId
   IF utils.object_id('tempdb..tt_LanguageTmp_2') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_LanguageTmp_2 ';
   END IF;
   DBMS_OUTPUT.PUT_LINE('@MenuId');
   DBMS_OUTPUT.PUT_LINE(v_MenuId);
   --SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) RowId,ParameterName 
   --INTO tt_LanguageTmp_2 
   --FROM DimParameter 
   --WHERE DimParameterName = 'Language'
   DELETE FROM tt_LanguageTmp_2;
   UTILS.IDENTITY_RESET('tt_LanguageTmp_2');

   INSERT INTO tt_LanguageTmp_2 SELECT ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                        FROM DUAL  )  ) RowId_  ,
                                       RC.LanguageKey ParameterName  
        FROM MetaScreenLableResource RC
               JOIN MetaDynamicScreenField MSF   ON RC.ControlID = MSF.ControlID --AND MSF.MenuID = RC.MenuID

       WHERE  RC.MenuID = v_MenuId
        GROUP BY RC.LanguageKey;
   LOOP
      BEGIN
         SELECT 1 INTO v_temp
           FROM DUAL
          WHERE v_LoopCount <= ( SELECT COUNT(1)  
                                 FROM tt_LanguageTmp_2  );
      EXCEPTION
         WHEN OTHERS THEN
            NULL;
      END;

      IF v_temp != 1 THEN
         EXIT;
      END IF;

      DECLARE
         v_ColName NVARCHAR2(2000);
         v_ColData NVARCHAR2(2000);
         v_SQL NVARCHAR2(2000);

      BEGIN
         SELECT ParameterName 

           INTO v_LangName
           FROM tt_LanguageTmp_2 
          WHERE  RowId_ = v_LoopCount;
         IF utils.object_id('Tempdb..tt_TmmpResource_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TmmpResource_2 ';
         END IF;
         DELETE FROM tt_TmmpResource_2;
         UTILS.IDENTITY_RESET('tt_TmmpResource_2');

         INSERT INTO tt_TmmpResource_2 ( 
         	SELECT RC.ControlID ,
                 RC.Lable ,
                 RC.LanguageKey TableName  
         	  FROM MetaScreenLableResource RC
                   JOIN MetaDynamicScreenField MSF   ON RC.ControlID = MSF.ControlID --AND MSF.MenuID = RC.MenuID

         	 WHERE  RC.MenuID = v_MenuId
                    AND RC.LanguageKey = v_LangName
         	  GROUP BY RC.ControlID,RC.Lable,RC.LanguageKey );
         SELECT utils.stuff(( SELECT ', [' || UTILS.CONVERT_TO_VARCHAR2(ControlID,10) || '] NVARCHAR(2000)' 
                              FROM tt_TmmpResource_2 M1 ), 1, 1, ' ') 

           INTO v_ColName
           FROM tt_TmmpResource_2 M2;
         SELECT utils.stuff(( SELECT ', N''' || Lable || '''' 
                              FROM tt_TmmpResource_2 M1 ), 1, 1, ' ') 

           INTO v_ColData
           FROM tt_TmmpResource_2 M2;
         DBMS_OUTPUT.PUT_LINE('@ColName	');
         DBMS_OUTPUT.PUT_LINE(v_ColName);
         --IF  OBJECT_ID('Tempdb..#TmmpResSelect') IS NOT NULL
         --	DROP TABLE #TmmpResSelect
         v_ColName := SUBSTR(v_ColName, -LENGTH(v_ColName) - 1, LENGTH(v_ColName) - 1) ;
         v_ColData := '''' || SUBSTR(v_ColData, -LENGTH(v_ColData) - 1, LENGTH(v_ColData) - 1) ;
         v_ColData := ' ' || SUBSTR(v_ColData, -LENGTH(v_ColData) - 1, LENGTH(v_ColData) - 1) ;
         IF utils.object_id('Tempdb..tt_ResSelect_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ResSelect_2 ';
         END IF;
         DELETE FROM tt_ResSelect_2;
         --PRINT @ColName
         --print @ColData
         v_SQL := REPLACE(v_SQL, '&amp;', '&') ;
         v_SQL := 'ALTER TABLE tt_ResSelect_2 ADD ' || v_ColName ;
         DBMS_OUTPUT.PUT_LINE(v_SQL);
         EXECUTE IMMEDIATE v_SQL;

         EXECUTE IMMEDIATE ' ALTER TABLE tt_ResSelect_2 
            DROP (EntityKey) CASCADE CONSTRAINTS ';
         v_SQL := 'INSERT INTO tt_ResSelect_2 ' ;
         v_SQL := v_SQL || 'SELECT ' || v_ColData ;
         v_SQL := REPLACE(v_SQL, '&amp;', '&') ;
         EXECUTE IMMEDIATE v_SQL;
         OPEN  v_cursor FOR
            SELECT v_LangName TableName  ,
                   * 
              FROM tt_ResSelect_2  ;
            DBMS_SQL.RETURN_RESULT(v_cursor);
         v_LoopCount := v_LoopCount + 1 ;

      END;
   END LOOP;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SELECTMETASCREENRESOURCE_04122023" TO "ADF_CDR_RBL_STGDB";
