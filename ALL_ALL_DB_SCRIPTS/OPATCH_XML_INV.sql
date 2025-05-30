--------------------------------------------------------
--  DDL for Table OPATCH_XML_INV
--------------------------------------------------------

  CREATE TABLE "SYS"."OPATCH_XML_INV" SHARING=METADATA 
   (	"XML_INVENTORY" CLOB
   ) 
   ORGANIZATION EXTERNAL 
    ( TYPE ORACLE_LOADER
      DEFAULT DIRECTORY "OPATCH_SCRIPT_DIR"
      ACCESS PARAMETERS
      ( RECORDS DELIMITED BY NEWLINE CHARACTERSET UTF8
      DISABLE_DIRECTORY_LINK_CHECK
      READSIZE 8388608
      preprocessor opatch_script_dir:'qopiprep.bat'
      BADFILE opatch_script_dir:'qopatch_bad.bad'
      LOGFILE opatch_log_dir:'qopatch_log.log'
      FIELDS TERMINATED BY 'UIJSVTBOEIZBEFFQBL'
      MISSING FIELD VALUES ARE NULL
      REJECT ROWS WITH ALL NULL FIELDS
      (
        xml_inventory    CHAR(100000000)
      )
    )
      LOCATION
       ( "OPATCH_SCRIPT_DIR":'qopiprep.bat'
       )
    )
   REJECT LIMIT UNLIMITED ;
