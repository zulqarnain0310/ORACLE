--------------------------------------------------------
--  DDL for View DBA_CONTAINER_DATA
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYS"."DBA_CONTAINER_DATA" ("USERNAME", "DEFAULT_ATTR", "OWNER", "OBJECT_NAME", "ALL_CONTAINERS", "CONTAINER_NAME") AS 
  select attr_u.name, 'N', owner_u.name, obj_o.name,
       decode(cd.con#, 0, 'Y', 'N'), con_o.name
  from sys.condata$ cd, sys."_BASE_USER" attr_u,
       sys."_CURRENT_EDITION_OBJ" obj_o, sys.int$container_obj$ con_o,
       sys."_BASE_USER" owner_u
  where cd.user# = attr_u.user#
    and cd.obj# != 0
    and cd.obj# = obj_o.obj#
    and obj_o.owner# = owner_u.user#
    and cd.con# = con_o.con_id (+)
    and (cd.con# = 0 or con_o.con_id is not NULL)
union all
select attr_u.name, 'N', 'SYS', obj_o.name,
       decode(cd.con#, 0, 'Y', 'N'), con_o.name
  from sys.condata$ cd, sys."_BASE_USER" attr_u,
       sys.v$fixed_table obj_o, sys.int$container_obj$ con_o
  where cd.user# = attr_u.user#
    and cd.obj# != 0
    and cd.obj# = obj_o.object_id
    and cd.con# = con_o.con_id (+)
    and (cd.con# = 0 or con_o.con_id is not NULL)
union all
select attr_u.name, 'Y', NULL, NULL,
       decode(cd.con#, 0, 'Y', 'N'), con_o.name
  from sys.condata$ cd, sys."_BASE_USER" attr_u,
       sys.int$container_obj$ con_o
  where cd.user# = attr_u.user#
    and cd.obj# = 0
    and cd.con# = con_o.con_id (+)
    and (cd.con# = 0 or con_o.con_id is not NULL)
union all
  select 'SYS', 'Y', NULL, NULL, 'Y', NULL from dual
    where sys_context('userenv', 'con_id') = 1
       or sys_context('userenv', 'is_application_root') = 'YES'
union all
  select 'SYSBACKUP', 'Y', NULL, NULL, 'Y', NULL from dual
    where sys_context('userenv', 'con_id') = 1
       or sys_context('userenv', 'is_application_root') = 'YES'
union all
  select 'SYSDG', 'Y', NULL, NULL, 'Y', NULL from dual
    where sys_context('userenv', 'con_id') = 1
       or sys_context('userenv', 'is_application_root') = 'YES'
union all
  select 'SYSRAC', 'Y', NULL, NULL, 'Y', NULL from dual
    where sys_context('userenv', 'con_id') = 1
       or sys_context('userenv', 'is_application_root') = 'YES';

   COMMENT ON COLUMN "SYS"."DBA_CONTAINER_DATA"."USERNAME" IS 'Name of the user whose attribute is described by this row';
   COMMENT ON COLUMN "SYS"."DBA_CONTAINER_DATA"."DEFAULT_ATTR" IS 'An indicator of whether the attribute is a default attribute';
   COMMENT ON COLUMN "SYS"."DBA_CONTAINER_DATA"."OWNER" IS 'Name of the object owner if the attribute is object-specific';
   COMMENT ON COLUMN "SYS"."DBA_CONTAINER_DATA"."OBJECT_NAME" IS 'Name of the object if the attribute is object-specific';
   COMMENT ON COLUMN "SYS"."DBA_CONTAINER_DATA"."ALL_CONTAINERS" IS 'An indicator of whether this attribute applies to all Containers';
   COMMENT ON COLUMN "SYS"."DBA_CONTAINER_DATA"."CONTAINER_NAME" IS 'Name of a Container included in this attribute if it does not apply to all Containers';
   COMMENT ON TABLE "SYS"."DBA_CONTAINER_DATA"  IS 'Describes default and object-specific CONTAINER_DATA attributes'
;
  GRANT SELECT ON "SYS"."DBA_CONTAINER_DATA" TO "SELECT_CATALOG_ROLE";
