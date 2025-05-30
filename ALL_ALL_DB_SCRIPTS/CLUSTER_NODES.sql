--------------------------------------------------------
--  DDL for Table CLUSTER_NODES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYS"."CLUSTER_NODES" SHARING=METADATA 
   (	"NODE_NAME" VARCHAR2(4000 BYTE), 
	"SPAREN1" NUMBER, 
	"SPAREN2" NUMBER, 
	"SPAREVC1" VARCHAR2(4000 BYTE), 
	"SPAREVC2" VARCHAR2(4000 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
