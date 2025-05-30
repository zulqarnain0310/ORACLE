REM INSERTING into SYS.RULE_SET_IEUAC$
SET DEFINE OFF;
Insert into SYS.RULE_SET_IEUAC$ (CLIENT_NAME,EXPORT_FUNCTION,CLI_COMMENT) values ('streams_it','sys.dbms_logrep_exp.internal_transform_export',null);
