--------------------------------------------------------
--  DDL for Index I3_OLAP_METADATA_PROPERTIES
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS"."I3_OLAP_METADATA_PROPERTIES" ON "SYS"."OLAP_METADATA_PROPERTIES$" ("PROPERTY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" ;
