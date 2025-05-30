--------------------------------------------------------
--  DDL for View QUERY_LOCKS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "QPI_RBL_MISDB_PROD"."QUERY_LOCKS" ("TEXT", "SESSION_ID", "REQUEST_OWNER_TYPE", "REQUEST_STATUS", "REQUEST_MODE", "REQUEST_TYPE", "LOCKED_OBJECT_ID", "LOCKED_OBJECT_SCHEMA", "LOCKED_OBJECT_NAME", "LOCKED_OBJECT_TYPE", "LOCKED_RESOURCE_TYPE", "LOCKED_RESOURCE_DB", "REQUEST_ID", "RESOURCE_ASSOCIATED_ENTITY_ID") AS 
  SELECT Q.TEXT TEXT  ,
          Q.session_id session_id  ,
          tl.request_owner_type ,
          tl.request_status ,
          tl.request_mode ,
          tl.request_type ,
          obj.OBJECT_ID locked_object_id  ,
          /*TODO:SQLDEV*/ SCHEMA_NAME(obj.schema_id) /*END:SQLDEV*/ locked_object_schema  ,
          obj.NAME locked_object_name  ,
          obj.type_desc locked_object_type  ,
          tl.resource_type locked_resource_type  ,
          SYS_CONTEXT('USERENV','') locked_resource_db  ,
          Q.request_id ,
          tl.resource_associated_entity_id 
     FROM qpi_RBL_MISDB_PROD.queries Q
            JOIN sys.dm_tran_locks tl   ON Q.session_id = tl.request_session_id
            AND Q.request_id = tl.request_request_id
            LEFT JOIN ( SELECT p.OBJECT_ID ,
                               p.hobt_id ,
                               au.allocation_unit_id 
                        FROM sys.partitions p
                               LEFT JOIN sys.allocation_units au   ON ( au.TYPE IN ( 1,3 )

                               AND au.container_id = p.hobt_id )
                               OR ( au.TYPE = 2
                               AND au.container_id = p.partition_id ) ) p   ON tl.resource_type IN ( 'PAGE','KEY','RID','HOBT' )

            AND p.hobt_id = tl.resource_associated_entity_id
            OR tl.resource_type = 'ALLOCATION_UNIT'
            AND p.allocation_unit_id = tl.resource_associated_entity_id
            LEFT JOIN sys.objects obj   ON p.OBJECT_ID = obj.OBJECT_ID
;
