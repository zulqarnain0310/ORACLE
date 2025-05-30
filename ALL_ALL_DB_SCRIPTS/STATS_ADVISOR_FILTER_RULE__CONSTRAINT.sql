--------------------------------------------------------
--  Constraints for Table STATS_ADVISOR_FILTER_RULE$
--------------------------------------------------------

  ALTER TABLE "SYS"."STATS_ADVISOR_FILTER_RULE$" MODIFY ("RULE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYS"."STATS_ADVISOR_FILTER_RULE$" ADD PRIMARY KEY ("RULE_ID") ENABLE;
