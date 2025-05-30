REM INSERTING into RBL_MISDB_PROD.MD_CODE_REGEX
SET DEFINE OFF;
Insert into RBL_MISDB_PROD.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (1,'\#[A-Z1-9\@\#\_]','Temporary tables');
Insert into RBL_MISDB_PROD.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (2,'INSERT','Insert statements');
Insert into RBL_MISDB_PROD.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (3,'SELECT','Select statements');
Insert into RBL_MISDB_PROD.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (4,'UPDATE','Update Statements');
Insert into RBL_MISDB_PROD.MD_CODE_REGEX (ID,REGEX,DESCRIPTION) values (5,'DELETE','Delete Statements');
