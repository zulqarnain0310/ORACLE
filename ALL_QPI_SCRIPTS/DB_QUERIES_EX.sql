--------------------------------------------------------
--  DDL for View DB_QUERIES_EX
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."DB_QUERIES_EX" () AS 
  SELECT Q.TEXT ,
          Q.params ,
          Q.query_text_id ,
          query_id ,
          Q.context_settings_id ,
          Q.query_hash ,
          o.* 
     FROM qpi_RBL_MISDB_PROD.db_queries Q
            JOIN sys.query_context_settings ctx   ON Q.context_settings_id = ctx.context_settings_id
             /*TODO:SQLDEV*/ CROSS APPLY qpi.decode_options(ctx.set_options) o /*END:SQLDEV*/
;
