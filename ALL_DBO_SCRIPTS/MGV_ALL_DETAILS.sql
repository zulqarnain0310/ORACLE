--------------------------------------------------------
--  DDL for View MGV_ALL_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "RBL_MISDB_PROD"."MGV_ALL_DETAILS" ("OBJTYPE", "OBJNAME", "OBJID", "MAINOBJTYPE", "MAINOBJNAME", "MAINOBJID", "SCHEMANAME", "SCHEMAID", "CATALOGNAME", "CATALOGID", "CONNNAME", "CONNID", "PROJECTNAME", "PROJECTID", "CAPTUREDORCONVERTED", "QUALIFIEDNAME") AS 
  SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CATALOG_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_SCHEMA_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TABLES_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_COLUMN_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_CONSTRAINTS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_INDEX_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_TRIGGER_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_VIEW_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PROGRAMS_DETAILS
UNION ALL
SELECT "OBJTYPE","OBJNAME","OBJID","MAINOBJTYPE","MAINOBJNAME","MAINOBJID","SCHEMANAME","SCHEMAID","CATALOGNAME","CATALOGID","CONNNAME","CONNID","PROJECTNAME","PROJECTID","CAPTUREDORCONVERTED","QUALIFIEDNAME" FROM MGV_ALL_PARTITIONS_DETAILS
;
