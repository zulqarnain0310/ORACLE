--------------------------------------------------------
--  DDL for Trigger DEL_MD_TRIGGERS_T_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ACL_RBL_MISDB_PROD"."DEL_MD_TRIGGERS_T_TRG" AFTER DELETE ON MD_TABLES 
FOR EACH ROW 
BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = 'T';
END;

/
ALTER TRIGGER "ACL_RBL_MISDB_PROD"."DEL_MD_TRIGGERS_T_TRG" ENABLE;
