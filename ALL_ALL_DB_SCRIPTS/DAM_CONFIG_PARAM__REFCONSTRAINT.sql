--------------------------------------------------------
--  Ref Constraints for Table DAM_CONFIG_PARAM$
--------------------------------------------------------

  ALTER TABLE "SYS"."DAM_CONFIG_PARAM$" ADD CONSTRAINT "DAM_CONFIG_PARAM_FK1" FOREIGN KEY ("PARAM_ID")
	  REFERENCES "SYS"."DAM_PARAM_TAB$" ("PARAMETER#") DISABLE;
