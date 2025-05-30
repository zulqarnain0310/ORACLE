--------------------------------------------------------
--  Constraints for Table IDNSEQ$
--------------------------------------------------------

  ALTER TABLE "SYS"."IDNSEQ$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."IDNSEQ$" MODIFY ("INTCOL#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."IDNSEQ$" MODIFY ("SEQOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."IDNSEQ$" MODIFY ("STARTWITH" NOT NULL ENABLE);
  ALTER TABLE "SYS"."IDNSEQ$" ADD SUPPLEMENTAL LOG GROUP "IDNSEQ$_LOG_GRP" ("OBJ#", "INTCOL#", "SEQOBJ#") ALWAYS;
