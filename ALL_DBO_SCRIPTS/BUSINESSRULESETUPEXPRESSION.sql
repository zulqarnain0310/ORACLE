--------------------------------------------------------
--  DDL for Procedure BUSINESSRULESETUPEXPRESSION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" 
-- =============================================
 -- Author:		<Author  Triloki Kumar>
 -- Create date: <Create Date 26/03/2020>
 -- Description:	<Description Business setup rule  expression >
 -- =============================================

(
  v_XmlData IN CLOB,
  v_BusinessRule_Alt_key IN NUMBER,
  iv_Expression IN VARCHAR2,
  v_Userid IN VARCHAR2,
  v_ResultString OUT VARCHAR2,
  v_Result OUT NUMBER
)
AS
   v_Expression VARCHAR2(4000) := iv_Expression;

BEGIN

   IF utils.object_id('TEMPDB..tt_BusinessRuleSetupData') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BusinessRuleSetupData ';
   END IF;
   DELETE FROM tt_BusinessRuleSetupData;
   UTILS.IDENTITY_RESET('tt_BusinessRuleSetupData');

   INSERT INTO tt_BusinessRuleSetupData ( 
   	SELECT /*TODO:SQLDEV*/ c.value('./UniqueID[1]','int') /*END:SQLDEV*/ UniqueID  ,
           /*TODO:SQLDEV*/ c.value('./Businesscolalt_key[1]','int') /*END:SQLDEV*/ Businesscolalt_key  ,
           /*TODO:SQLDEV*/ c.value('./Scope[1]','varchar(MAX)') /*END:SQLDEV*/ Scope  ,
           /*TODO:SQLDEV*/ c.value('./ParameterName[1]','varchar(MAX)') /*END:SQLDEV*/ ParameterName  ,
           /*TODO:SQLDEV*/ c.value('./Businesscolvalues1[1]','varchar(MAX)') /*END:SQLDEV*/ Businesscolvalues1  ,
           /*TODO:SQLDEV*/ c.value('./Businesscolvalues[1]','varchar(MAX)') /*END:SQLDEV*/ Businesscolvalues2  
   	  FROM TABLE(/*TODO:SQLDEV*/ @XmlData.nodes('/DataSet/FinalExpData') AS t(c) /*END:SQLDEV*/)  );--/DataSet/GridData
   --SELECT * FROM tt_BusinessRuleSetupData
   IF utils.object_id('TEMPDB..tt_SplitValue_15') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_SplitValue_15 ';
   END IF;
   DELETE FROM tt_SplitValue_15;
   UTILS.IDENTITY_RESET('tt_SplitValue_15');

   INSERT INTO tt_SplitValue_15 ( 
   	SELECT UniqueID ,
           a_SPLIT.VALUE('.', 'VARCHAR(8000)') Businesscolvalues1  
   	  FROM ( SELECT UTILS.CONVERT_TO_CLOB('<M>' || REPLACE(Businesscolvalues1, ',', '</M><M>') || '</M>') Businesscolvalues1  ,
                    UniqueID 
             FROM tt_BusinessRuleSetupData  ) A
              /*TODO:SQLDEV*/ CROSS APPLY Businesscolvalues1.nodes ('/M') AS Split(a) /*END:SQLDEV*/  );
   IF utils.object_id('TEMPDB..tt_Temp23') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Temp23 ';
   END IF;
   DELETE FROM tt_Temp23;
   UTILS.IDENTITY_RESET('tt_Temp23');

   INSERT INTO tt_Temp23 ( 
   	SELECT UniqueID ,
           '''' || Businesscolvalues1 || '''' businesscolvalues1  
   	  FROM tt_SplitValue_15  );
   IF utils.object_id('TEMPDB..tt_FinalTable') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_FinalTable ';
   END IF;
   DELETE FROM tt_FinalTable;
   UTILS.IDENTITY_RESET('tt_FinalTable');

   INSERT INTO tt_FinalTable ( 
   	SELECT utils.stuff(( SELECT ',' || businesscolvalues1 
                         FROM tt_Temp23 a
                          WHERE  a.uniqueid = b.uniqueid ), 
                       --group by uniqueid
                       1, 1, ' ') businesscolvalues1  ,
           b.uniqueid 
   	  FROM tt_Temp23 b
   	  GROUP BY b.uniqueid );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.Businesscolvalues1
   FROM A ,tt_BusinessRuleSetupData A
          JOIN tt_FinalTable B   ON A.UniqueID = B.UniqueID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.Businesscolvalues1 = src.Businesscolvalues1;
   DELETE FROM tt_TEMP1_5;
   UTILS.IDENTITY_RESET('tt_TEMP1_5');

   INSERT INTO tt_TEMP1_5 SELECT A.UniqueID ,
                                 B.BusinessRuleColDesc || ' ' || CASE 
                                                                      WHEN DP.ParameterName = 'LESSTHAN' THEN ' LESSTHAN ' || A.Businesscolvalues1
                                                                      WHEN DP.ParameterName = 'GreaterThan' THEN ' GreaterThan ' || A.Businesscolvalues1
                                                                      WHEN DP.ParameterName = 'LessThanEqualTo' THEN ' LessThanEqualTo ' || A.Businesscolvalues1
                                                                      WHEN DP.ParameterName = 'GreaterThanEqualTo' THEN ' GreaterThanEqualTo ' || A.Businesscolvalues1
                                                                      WHEN DP.ParameterName = 'Between' THEN 'Between ' || A.Businesscolvalues1 || ' AND ''' || A.Businesscolvalues2 || ''''
                                                                      WHEN DP.ParameterName = 'In' THEN 'IN( ' || A.Businesscolvalues1 || ')'
                                                                      WHEN DP.ParameterName = 'EqualTo' THEN '= ' || A.Businesscolvalues1
                                                                      WHEN DP.ParameterName = 'Like' THEN '''%''' || A.Businesscolvalues1 || '''%'''   END FINALEXPRESSION  ,
                                 ROW_NUMBER() OVER ( ORDER BY ( SELECT 1 
                                                                  FROM DUAL  )  ) row1  
        FROM tt_BusinessRuleSetupData A
               JOIN DimBusinessRuleCol B   ON A.Businesscolalt_key = B.BusinessRuleColAlt_Key
               JOIN DimParameter DP   ON DP.ParameterName = A.ParameterName;
   v_Expression := REPLACE(v_Expression, '(', '( ') ;
   v_Expression := REPLACE(v_Expression, ')', ' )') ;
   IF utils.object_id('TEMPDB..tt_temp2') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_temp2 ';
   END IF;
   DELETE FROM tt_temp2;
   UTILS.IDENTITY_RESET('tt_temp2');

   INSERT INTO tt_temp2 ( 
   	SELECT * 
   	  FROM TABLE(SPLIT(v_EXPRESSION, ' '))  );
   IF utils.object_id('TEMPDB..tt_temp3') IS NOT NULL THEN
    EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_temp3 ';
   END IF;
   DELETE FROM tt_temp3;
   INSERT INTO tt_temp3
     ( SELECT utils.stuff(( SELECT ' ' || COALESCE(UTILS.CONVERT_TO_VARCHAR2(B.finalexpression,4000), A.Items) 
                            FROM tt_temp2 a
                                   LEFT JOIN tt_TEMP1_5 b   ON a.items = UTILS.CONVERT_TO_VARCHAR2(b.uniqueid,4000) ), 1, 1, ' ') finalexpression  
         FROM DUAL  );
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'LessThanEqualTo', '<=');
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'GreaterThanEqualTo', '>=');
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'LESSTHAN', '<');
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'GreaterThan', '>');
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'TypeOfAdvance', 'ADVTYPE');
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'Productcode', 'GLProductAlt_Key');
   UPDATE tt_temp3
      SET FinalExpression = REPLACE(FinalExpression, 'GLCODE', 'GL_CODE');
   SELECT FinalExpression 

     INTO v_ResultString
     FROM tt_temp3 ;
   v_Result := 1 ;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BUSINESSRULESETUPEXPRESSION" TO "ADF_CDR_RBL_STGDB";
