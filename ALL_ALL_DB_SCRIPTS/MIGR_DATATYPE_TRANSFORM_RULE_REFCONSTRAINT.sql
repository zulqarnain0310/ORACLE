--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_RULE
--------------------------------------------------------

  ALTER TABLE "SYS"."MIGR_DATATYPE_TRANSFORM_RULE" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_R_FK1" FOREIGN KEY ("MAP_ID_FK")
	  REFERENCES "SYS"."MIGR_DATATYPE_TRANSFORM_MAP" ("ID") ON DELETE CASCADE ENABLE;
