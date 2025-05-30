--------------------------------------------------------
--  DDL for Table MD_PROJECTS
--------------------------------------------------------

  CREATE TABLE "ACL_RBL_MISDB_PROD"."MD_PROJECTS" 
   (	"ID" NUMBER, 
	"PROJECT_NAME" VARCHAR2(4000 BYTE), 
	"COMMENTS" VARCHAR2(4000 BYTE), 
	"SECURITY_GROUP_ID" NUMBER DEFAULT 0, 
	"CREATED_ON" DATE DEFAULT sysdate, 
	"CREATED_BY" VARCHAR2(255 BYTE), 
	"LAST_UPDATED_ON" DATE, 
	"LAST_UPDATED_BY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ACL_RBL_MISDB_PROD"."MD_PROJECTS"."ID" IS 'Primary key';
   COMMENT ON COLUMN "ACL_RBL_MISDB_PROD"."MD_PROJECTS"."PROJECT_NAME" IS 'Name of the project //OBJECTNAME';
   COMMENT ON TABLE "ACL_RBL_MISDB_PROD"."MD_PROJECTS"  IS 'This is a top level container for a set of connections.';
