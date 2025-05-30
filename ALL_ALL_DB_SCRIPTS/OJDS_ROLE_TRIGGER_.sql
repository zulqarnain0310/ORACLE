--------------------------------------------------------
--  DDL for Trigger OJDS$ROLE_TRIGGER$
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYS"."OJDS$ROLE_TRIGGER$" after drop on database  WHEN (ora_dict_obj_type='ROLE') begin
    ojds_context.role_dropped(ora_dict_obj_name);
  exception -- if not present then ignore
  when others then
  if sqlcode not in (-00604, -04063, -06508) then raise; end if;
  end;
/
ALTER TRIGGER "SYS"."OJDS$ROLE_TRIGGER$" ENABLE;
