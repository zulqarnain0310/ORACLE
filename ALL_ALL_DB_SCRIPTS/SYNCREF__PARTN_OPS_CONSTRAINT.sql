--------------------------------------------------------
--  Constraints for Table SYNCREF$_PARTN_OPS
--------------------------------------------------------

  ALTER TABLE "SYS"."SYNCREF$_PARTN_OPS" MODIFY ("TABLE_OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYNCREF$_PARTN_OPS" MODIFY ("PARTITION_OP" NOT NULL ENABLE);
  ALTER TABLE "SYS"."SYNCREF$_PARTN_OPS" MODIFY ("PARTITION_NAME" NOT NULL ENABLE);
