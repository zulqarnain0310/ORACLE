REM INSERTING into SYS.WRI$_ADV_DIRECTIVE_DEFS
SET DEFINE OFF;
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (1,1,'ADDM','Finding Filter','limit a specific finding based on impact',2,3,2);
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (2,1,'ADDM','SQL Filter','limit recommendations for a specific SQL',2,3,2);
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (3,1,'ADDM','Segment Filter','limit recommendations for specific segments',2,3,2);
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (4,1,'ADDM','Parameter Filter','limit recommendations to change a specific system parameter',2,3,2);
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (5,12,'Statistics Advisor','Rule Filter','filter Stats Advisor checks for rules',2,2,2);
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (6,12,'Statistics Advisor','Operation Filter','filter Stats Advisor checks for statistics operations',2,2,2);
Insert into SYS.WRI$_ADV_DIRECTIVE_DEFS (ID,ADVISOR_ID,DOMAIN,NAME,DESCRIPTION,TYPE#,FLAGS,METADATA_ID) values (7,12,'Statistics Advisor','Object Filter','filter Stats Advisor checks for database objects',2,2,2);
