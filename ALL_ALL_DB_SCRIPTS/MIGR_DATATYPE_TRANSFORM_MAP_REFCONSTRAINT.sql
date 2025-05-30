--------------------------------------------------------
--  Ref Constraints for Table MIGR_DATATYPE_TRANSFORM_MAP
--------------------------------------------------------

  ALTER TABLE "SYS"."MIGR_DATATYPE_TRANSFORM_MAP" ADD CONSTRAINT "MIGR_DATATYPE_TRANSFORM_M_FK1" FOREIGN KEY ("PROJECT_ID_FK")
	  REFERENCES "SYS"."MD_PROJECTS" ("ID") ON DELETE CASCADE ENABLE;
