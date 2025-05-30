--------------------------------------------------------
--  DDL for Trigger XDB_PI_TRIG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."XDB_PI_TRIG" 
BEFORE DROP OR TRUNCATE on DATABASE
BEGIN
  BEGIN
    IF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_CONTENTS)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_truncate(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    ELSIF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_RESMETADATA)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_dropmetadata(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
     null;
  END;
END;
/
ALTER TRIGGER "SYS"."XDB_PI_TRIG" ENABLE;
