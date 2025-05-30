REM INSERTING into SYS.TRIGGER$
SET DEFINE OFF;
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (15962,2,0,0,0,0,'OLD','NEW','SYSLSBY_EDS_DDL_TRIG
  AFTER CREATE OR ALTER ON DATABASE
  ',null,'DECLARE
   DGL_STATUS_EDS_EVOLVING     EXCEPTION;
   PRAGMA               EXCEPTION_INIT(DGL_STATUS_EDS_EVOLVING, -16310);
   sql_text             ora_name_list_t;
   t_stmt               CLOB;
   stmt                 CLOB;
   n                    NUMBER;
   dummy                NUMBER;
   pos		        NUMBER;
   evolve               BOOLEAN := FALSE;
   table_owner          VARCHAR2(140);
   table_ownerQ         VARCHAR2(140);
   table_name           VARCHAR2(140);
   table_nameQ          VARCHAR2(140);
   dbrole               VARCHAR2(80);
   state                VARCHAR2(255);
   job_stmt             CLOB;
   l_xid_str            VARCHAR2(22);
BEGIN
   -- only applicable on primary
   SELECT database_role INTO dbrole FROM v$database;
   IF dbrole != ''PRIMARY'' THEN
      RETURN;
   END IF;

   -- put SQL into single buffer
   dummy := ora_sql_txt(sql_text);
   t_stmt := NULL;
   FOR i IN 1..dummy LOOP
      t_stmt := t_stmt || sql_text(i);
   END LOOP;

   -- handle CREATE UNIQUE INDEX which requires digging out table and owner
   IF ora_sysevent = ''CREATE'' THEN
      IF ora_dict_obj_type = ''INDEX'' THEN
	 SELECT INSTR(UPPER(t_stmt), '' UNIQUE '') INTO pos FROM dual;
	 IF pos = 0 THEN
	    RETURN;
	 END IF;

         -- only interested in user cursors
         dbms_internal_logstdby.eds_user_cursor(evolve,
                                                table_owner,
                                                table_name);

      END IF;

   -- otherwise anything other than ALTER TABLE is uninteresting
   ELSE
      IF ora_sysevent != ''ALTER'' OR ora_dict_obj_type != ''TABLE'' THEN
         RETURN;
      END IF;

      -- look for RENAME token to eliminate DROP TABLE lacking a PURGE which
      -- comes in as an ALTER TABLE RENAME TO
      SELECT INSTR(UPPER(t_stmt), '' RENAME TO '') INTO pos FROM dual;
      IF pos != 0 THEN
         RETURN;
      END IF;

      evolve := TRUE;
      table_owner := ora_dict_obj_owner;
      table_name :=  ora_dict_obj_name;
   END IF;

   -- if its an EDS table and evolve not already started then start one
   IF evolve THEN
      stmt := ''select state from system.logstdby$eds_tables where owner=:1'' ||
              '' and table_name=:2'';
      BEGIN
	 EXECUTE IMMEDIATE stmt INTO state USING table_owner, table_name;
      EXCEPTION
         WHEN others THEN state := NULL;
      END;
      IF state IS NOT NULL THEN
	 IF state = ''EVOLVING'' THEN
	    RAISE DGL_STATUS_EDS_EVOLVING;
	 END IF;
	 table_ownerQ := DBMS_ASSERT.ENQUOTE_NAME(table_owner,FALSE);
	 table_nameQ := DBMS_ASSERT.ENQUOTE_NAME(table_name,FALSE);

          -- start the evolve
	 DBMS_LOGSTDBY.EDS_EVOLVE_MANUAL(
                options => ''START'',
 	        table_owner => table_ownerQ,
		table_name => table_nameQ
                );

         -- schedule the evolve finish
         SELECT syslsby_eds_ddl_seq.NEXTVAL INTO n FROM DUAL;
         l_xid_str := dbms_transaction.local_transaction_id();
         job_stmt := ''BEGIN DBMS_INTERNAL_LOGSTDBY.EDS_EVOLVE('' ||
                DBMS_ASSERT.ENQUOTE_LITERAL(replace(table_ownerQ,'''''''',''''''''''''))
                 || '','' ||
                DBMS_ASSERT.ENQUOTE_LITERAL(replace(table_nameQ,'''''''',''''''''''''))
                 || '','' ||
                DBMS_ASSERT.ENQUOTE_LITERAL(l_xid_str) ||
                ''); END;'';
         dbms_system.ksdwrt(dbms_system.alert_file,
                ''LOGSTDBY: performing an EDS evolve in response to DDL'');
         DBMS_SCHEDULER.CREATE_JOB(
              job_name => ''SYSLSBY_EDS_DDL_JOB_'' || n,
              job_type => ''PLSQL_BLOCK'',
              job_action => job_stmt,
              enabled => TRUE
              );
      END IF;
   END IF;
END;',3673,0,1048712,96,0,0,null,4,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (18966,0,0,0,0,0,'OLD','NEW','SYS.LOGMNRGGC_TRIGGER
BEFORE ddl ON DATABASE
',null,'logmnr_ddl_trigger_proc;',24,0,1048714,805830624,0,0,null,5,2,5,4,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (20687,1,1,1,0,20684,'OLD','NEW','VNCR_INSERT
BEFORE INSERT OR UPDATE
ON VNCR
FOR EACH ROW
',null,'BEGIN
  IF :new.hostid IS NULL THEN
    :new.hostid := VNCR_SEQUENCE.NEXTVAL;
  END IF;
END;',92,1,128,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21642,0,0,0,0,0,'OLD','NEW','sys.xdb_pi_trig
BEFORE DROP OR TRUNCATE on DATABASE
',null,'BEGIN
  BEGIN
    IF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_CONTENTS)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_truncate(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    ELSIF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_RESMETADATA)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_dropmetadata(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
     null;
  END;
END;',515,1,1048712,4224,0,0,null,3,1,13,4,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21790,4,1,1,1,21786,'OLD','NEW','xdb.xdb_rv_trig INSTEAD OF insert or delete or update
on xdb.resource_view for each row
',null,'begin
  if inserting then
    xdb_rvtrig_pkg.rvtrig_ins(:new.res, :new.any_path);


  end if;

  if deleting then
     xdb_rvtrig_pkg.rvtrig_del(:old.res, :old.any_path);


  end if;

  if updating then
     xdb_rvtrig_pkg.rvtrig_upd(:old.res,    :new.res,
                               :old.any_path,   :new.any_path );
  end if;
end;',336,1,1,0,0,0,null,3,1,13,4,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21814,3,1,0,1,21810,'OLD','NEW','"XDB"."XDB$ACL$xd"              after delete or update on "XDB"."XDB$ACL" for each row ',null,'BEGIN  IF (deleting) THEN xdb.xdb_pitrig_pkg.pitrig_del(''XDB'',''XDB$ACL'', :old.sys_nc_oid$, ''5845103193FF42C68ACB28C26E212FD0'' ); END IF;   IF (updating) THEN xdb.xdb_pitrig_pkg.pitrig_upd(''XDB'',''XDB$ACL'', :old.sys_nc_oid$, ''5845103193FF42C68ACB28C26E212FD0'', user ); END IF; END;',279,1,128,0,0,0,null,1,1,16,6,95);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21848,4,1,1,1,21844,'OLD','NEW','xdb.xdb_pv_trig INSTEAD OF insert or delete or update
on xdb.path_view for each row
',null,'begin
  if inserting then
    xdb.xdb_pvtrig_pkg.pvtrig_ins(:new.res, :new.link, :new.path);

    /* check that either the REF or the BLOB columns are filled, not both */
  end if;

  if deleting then
     xdb.xdb_pvtrig_pkg.pvtrig_del(:old.res, :old.link, :old.path);

    /* check if we get the correct values from two tables in a view */
  end if;

  if updating then
     xdb.xdb_pvtrig_pkg.pvtrig_upd(:old.res,    :new.res,
                               :old.link,   :new.link,
                               :old.path,   :new.path );
  end if;
end;',555,1,1,0,0,0,null,3,1,13,4,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21826,3,1,0,1,21822,'OLD','NEW','"XDB"."XDB$RESCONFIG$xd"              after delete or update on "XDB"."XDB$RESCONFIG" for each row ',null,'BEGIN  IF (deleting) THEN xdb.xdb_pitrig_pkg.pitrig_del(''XDB'',''XDB$RESCONFIG'', :old.sys_nc_oid$, ''37C8A437B4AE489896DAF9FE4BD9F327'' ); END IF;   IF (updating) THEN xdb.xdb_pitrig_pkg.pitrig_upd(''XDB'',''XDB$RESCONFIG'', :old.sys_nc_oid$, ''37C8A437B4AE489896DAF9FE4BD9F327'', user ); END IF; END;',291,1,128,0,0,0,null,1,1,16,6,107);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21917,3,1,0,1,21908,'OLD','NEW','"XDB"."XDB$STATS$xd"              after delete or update on "XDB"."XDB$STATS" for each row ',null,'BEGIN  IF (deleting) THEN xdb.xdb_pitrig_pkg.pitrig_del(''XDB'',''XDB$STATS'', :old.sys_nc_oid$, ''57127F2F1D8641E78393BAEC5CA90BDC'' ); END IF;   IF (updating) THEN xdb.xdb_pitrig_pkg.pitrig_upd(''XDB'',''XDB$STATS'', :old.sys_nc_oid$, ''57127F2F1D8641E78393BAEC5CA90BDC'', user ); END IF; END;',283,1,128,0,0,0,null,1,1,16,6,99);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21926,3,1,0,1,21922,'OLD','NEW','"XDB"."XDB$CONFIG$xd"              after delete or update on "XDB"."XDB$CONFIG" for each row ',null,'BEGIN  IF (deleting) THEN xdb.xdb_pitrig_pkg.pitrig_del(''XDB'',''XDB$CONFIG'', :old.sys_nc_oid$, ''28893153503047F486DCC9E085B95338'' ); END IF;   IF (updating) THEN xdb.xdb_pitrig_pkg.pitrig_upd(''XDB'',''XDB$CONFIG'', :old.sys_nc_oid$, ''28893153503047F486DCC9E085B95338'', user ); END IF; END;',285,1,128,0,0,0,null,1,1,16,6,101);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (21928,1,1,1,0,21922,'OLD','NEW','xdb.xdbconfig_validate before insert or update
on xdb.XDB$CONFIG for each row
',null,'declare
  xdoc xmltype;
begin
  xdoc := :new.sys_nc_rowinfo$;
  xmltype.schemaValidate(xdoc);
end;',98,1,128,0,0,0,null,3,1,13,4,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22263,3,1,0,0,20742,'OLD','NEW','cat_rollback_trigger AFTER UPDATE OF status
    ON gsm_requests FOR EACH ROW ','new.status = ''A''','dbms_gsm_pooladmin.catRollback(:new.request, :new.old_instances);',65,1,130,0,0,0,null,3,1,9,0,4);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22264,3,0,0,1,20742,'OLD','NEW','request_delete_trigger AFTER DELETE ON gsm_requests
   FOR EACH ROW ',null,'dbms_gsm_pooladmin.requestDelete(:old.change_seq#, :old.request, :old.status);',78,1,130,0,0,0,null,2,1,9,0,16);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22265,3,1,0,0,20742,'OLD','NEW','done_trigger AFTER UPDATE OF status
    ON gsm_requests FOR EACH ROW ','new.status = ''D''','dbms_gsm_pooladmin.requestDone(:old.request, :new.status);',58,1,130,0,0,0,null,3,1,9,0,4);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22266,0,0,0,0,62,'OLD','NEW','GSMlogoff
                   BEFORE LOGOFF  ON gsmcatuser.schema
                   ',null,'dbms_gsm_cloudadmin.checkGSMDown;',33,1,18,16,0,0,null,3,1,9,0,19);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22816,4,0,1,0,22678,'OLD','NEW','wmsys.wm$bct_i_trig instead of insert on wmsys.wm$batch_compressible_tables for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  vtid   integer := wmsys.ltUtil.getVtid(substr(upper(:new.table_name), 1, instr(:new.table_name, ''.'')-1),
                                         substr(upper(:new.table_name), instr(:new.table_name, ''.'')+1)) ;
begin
  insert into wmsys.wm$batch_compressible_tables$(workspace#, vtid#, begin_version, end_version, where_clause)
  values (ws#, vtid, :new.begin_version, :new.end_version, :new.where_clause) ;
end;',515,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22817,4,0,1,0,22679,'OLD','NEW','wmsys.wm$cp_i_trig instead of insert on wmsys.wm$column_props for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$column_props$f(:new.identity_type) ;

  update wmsys.wm$versioned_tables$
  set wm$flag = wmsys.ltUtil.bitor(wmsys.ltUtil.bitclear(wm$flag, 98304), flag_v)
  where vtid# = vtid ;
end;',325,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22818,4,1,0,0,22679,'OLD','NEW','wmsys.wm$cp_u_trig instead of update on wmsys.wm$column_props for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  if (updating(''IDENTITY_TYPE'')) then
    flag_v := wmsys.owm_dml_pkg.wm$column_props$f(:new.identity_type) ;
    sqlstr := sqlstr || '' wm$flag=wmsys.ltUtil.bitor(wmsys.ltUtil.bitclear(wm$flag, 98304), :1)'' ;
  end if ;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null)) then
           null ;
         end if;

         update wmsys.wm$versioned_tables$
         set '' || substr(sqlstr, 2) || ''
         where vtid#=:2 ;
       end;'' using flag_v, vtid ;
  end if ;
end;',673,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22819,4,0,0,1,22679,'OLD','NEW','wmsys.wm$cp_d_trig instead of delete on wmsys.wm$column_props for each row
',null,'declare
  vtid integer := wmsys.ltUtil.getVtid(:old.owner, :old.table_name) ;
begin
  update wmsys.wm$versioned_tables$
  set wm$flag = wmsys.ltUtil.bitclear(wm$flag, 98304)
  where vtid# = vtid ;
end;',201,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22820,4,0,1,0,22681,'OLD','NEW','wmsys.wm$ct_i_trig instead of insert on wmsys.wm$constraints_table for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$constraints_table$f(:new.constraint_type, :new.status, :new.index_type) ;

  insert into wmsys.wm$constraints_table$(vtid#, constraint_name, search_condition, index_owner, index_name, aliasedcolumns, numindexcols, wm$flag, owner)
  values (vtid, :new.constraint_name, :new.search_condition, :new.index_owner, :new.index_name, :new.aliasedcolumns, :new.numindexcols, flag_v, :new.owner) ;
end;',534,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22821,4,1,0,0,22681,'OLD','NEW','wmsys.wm$ct_u_trig instead of update on wmsys.wm$constraints_table for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  vtid    integer := wmsys.ltUtil.getVtid(:old.owner, :old.table_name) ;
begin
  if (updating(''STATUS'')) then
    flag_v := wmsys.owm_dml_pkg.wm$constraints_table$f(:new.constraint_type, :new.status, :new.index_type) ;
    sqlstr := sqlstr || '' wm$flag=:1'' ;
  end if ;

  if (updating(''CONSTRAINT_NAME'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' constraint_name=:2'' ;
  end if;

  if (updating(''INDEX_NAME'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' index_name=:3'' ;
  end if;

  if (updating(''ALIASEDCOLUMNS'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' aliasedcolumns=:4'' ;
  end if;

  if (updating(''NUMINDEXCOLS'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' numindexcols=:5'' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null or :6 is null or :7 is null or :8 is null)) then
           null ;
         end if;

         update wmsys.wm$constraints_table$
         set '' || substr(sqlstr, 2) || ''
         where vtid#=:6 and constraint_name=:7 and bitand(wm$flag, 8)=decode(:8, ''''DISABLED'''', 0, ''''ENABLED'''', 8);
       end;'' using flag_v, :new.constraint_name, :new.index_name, :new.aliasedcolumns, :new.numindexcols,
                   vtid, :old.constraint_name, :old.status ;
  end if ;
end;',1559,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22822,4,0,1,0,22680,'OLD','NEW','wmsys.wm$cc_i_trig instead of insert on wmsys.wm$cons_columns for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  insert into wmsys.wm$cons_columns$(vtid#, constraint_name, column_name, position)
  values (vtid, :new.constraint_name, :new.column_name, :new.position) ;
end;',270,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22823,4,0,1,0,22683,'OLD','NEW','wmsys.wm$ev_i_trig instead of insert on wmsys.wm$env_vars for each row
',null,'declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$env_vars$f(:new.hidden) ;

  insert into wmsys.wm$env_vars$(name, value, wm$flag)
  values (:new.name, :new.value, flag_v) ;
end;',199,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22824,4,0,1,0,22684,'OLD','NEW','wmsys.wm$ei_i_trig instead of insert on wmsys.wm$events_info for each row
',null,'declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$events_info$f(:new.capture) ;

  insert into wmsys.wm$events_info$(event_name, wm$flag)
  values (:new.event_name, flag_v) ;
end;',199,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22825,4,1,0,0,22684,'OLD','NEW','wmsys.wm$ei_u_trig instead of update on wmsys.wm$events_info for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  if (updating(''CAPTURE'')) then
    flag_v := wmsys.owm_dml_pkg.wm$events_info$f(:new.capture) ;
    sqlstr := sqlstr || '' wm$flag=:1'' ;
  end if ;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null)) then
           null ;
         end if;

         update wmsys.wm$events_info$
         set '' || substr(sqlstr, 2) || ''
         where event_name=:2;
       end;'' using flag_v, :old.event_name ;
  end if ;
end;',540,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22826,4,0,1,0,22686,'OLD','NEW','wmsys.wm$ht_i_trig instead of insert on wmsys.wm$hint_table for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$hint_table$f(:new.isdefault) ;

  insert into wmsys.wm$hint_table$(hint_id, vtid#, hint_text, wm$flag)
  values (:new.hint_id, vtid, :new.hint_text, flag_v) ;
end;',305,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22827,4,0,1,0,22688,'OLD','NEW','wmsys.wm$li_i_trig instead of insert on wmsys.wm$lockrows_info for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  insert into wmsys.wm$lockrows_info$(workspace#, vtid#, where_clause)
  values (ws#, vtid, :new.where_clause) ;
end;',296,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22828,4,0,1,0,22689,'OLD','NEW','wmsys.wm$mt_i_trig instead of insert on wmsys.wm$modified_tables for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  vtid   integer := wmsys.ltUtil.getVtid(substr(upper(:new.table_name), 1, instr(:new.table_name, ''.'')-1),
                                         substr(upper(:new.table_name), instr(:new.table_name, ''.'')+1)) ;
begin
  insert into wmsys.wm$modified_tables$(vtid#, version, workspace#)
  values (vtid, :new.version, ws#) ;
end;',429,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22829,4,0,1,0,22690,'OLD','NEW','wmsys.wm$mgwt_i_trig instead of insert on wmsys.wm$mp_graph_workspaces_table for each row
',null,'declare
  flag_v integer := 0;
  ws#1   integer := wmsys.ltUtil.getWorkspaceLockId(:new.mp_leaf_workspace) ;
  ws#2   integer := wmsys.ltUtil.getWorkspaceLockId(:new.mp_graph_workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$mp_graph_workspaces_table$f(:new.mp_graph_flag) ;

  insert into wmsys.wm$mp_graph_workspaces_table$(mp_leaf_workspace#, mp_graph_workspace#, anc_version, wm$flag)
  values (ws#1, ws#2, :new.anc_version, flag_v) ;
end;',445,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22830,4,0,1,0,22691,'OLD','NEW','wmsys.wm$mpwt_i_trig instead of insert on wmsys.wm$mp_parent_workspaces_table for each row
',null,'declare
  flag_v integer := 0;
  ws#1   integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  ws#2   integer := wmsys.ltUtil.getWorkspaceLockId(:new.parent_workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$mp_parent_workspaces_t$f(:new.isrefreshed, :new.parent_flag) ;

  insert into wmsys.wm$mp_parent_workspaces_table$(workspace#, parent_workspace#, parent_version, creator, createtime, wm$flag)
  values (ws#1, ws#2, :new.parent_version, :new.creator, :new.createtime, flag_v) ;
end;',497,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22831,4,0,1,0,22692,'OLD','NEW','wmsys.wm$mw_i_trig instead of insert on wmsys.wm$mw_table for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  insert into wmsys.wm$mw_table$(workspace#)
  values (ws#) ;
end;',173,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22832,4,0,1,0,22693,'OLD','NEW','wmsys.wm$nct_i_trig instead of insert on wmsys.wm$nested_columns_table for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  insert into wmsys.wm$nested_columns_table$(vtid#, column_name, position, type_owner, type_name, nt_owner, nt_name, nt_store)
  values (vtid, :new.column_name, :new.position, :new.type_owner, :new.type_name, :new.nt_owner, :new.nt_name, :new.nt_store) ;
end;',368,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22833,4,0,1,0,22694,'OLD','NEW','wmsys.wm$nt_i_trig instead of insert on wmsys.wm$nextver_table for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  insert into wmsys.wm$nextver_table$(version, workspace#, next_vers, split)
  values (:new.version, ws#, :new.next_vers, :new.split) ;
end;',247,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22834,4,0,1,0,22696,'OLD','NEW','wmsys.wm$rwt_i_trig instead of insert on wmsys.wm$resolve_workspaces_table for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$resolve_workspaces_table$f(:new.oldfreezemode) ;

  insert into wmsys.wm$resolve_workspaces_table$(workspace#, resolve_user, undo_sp#, oldfreezewriter, wm$flag)
  values (ws#, :new.resolve_user, :new.undo_sp_ver, :new.oldfreezewriter, flag_v) ;
end;',389,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22835,4,0,1,0,22697,'OLD','NEW','wmsys.wm$rlt_i_trig instead of insert on wmsys.wm$ric_locking_table for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.pt_owner, :new.pt_name) ;
begin
  insert into wmsys.wm$ric_locking_table$(pt_vtid#, slockno, elockno)
  values (vtid, :new.slockno, :new.elockno) ;
end;',229,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22836,4,0,1,0,22698,'OLD','NEW','wmsys.wm$rt_i_trig instead of insert on wmsys.wm$ric_table for each row
',null,'declare
  flag_v integer := 0;
  vtid1  integer := wmsys.ltUtil.getVtid(:new.ct_owner, :new.ct_name) ;
  vtid2  integer := wmsys.ltUtil.getVtid(:new.pt_owner, :new.pt_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$ric_table$f(:new.my_mode, :new.status) ;

  insert into wmsys.wm$ric_table$(ct_vtid#, pt_vtid#, ric_name, ct_cols, pt_cols, pt_unique_const_name, wm$flag)
  values (vtid1, vtid2, :new.ric_name, :new.ct_cols, :new.pt_cols, :new.pt_unique_const_name, flag_v) ;

  flag_v := wmsys.owm_dml_pkg.wm$constraints_table$f(''R'', :new.status, null) ;

  insert into wmsys.wm$constraints_table$(vtid#, constraint_name, wm$flag, owner) values(vtid1, :new.ric_name, flag_v, :new.ct_owner) ;
end;',694,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22837,4,0,0,1,22698,'OLD','NEW','wmsys.wm$rt_d_trig instead of delete on wmsys.wm$ric_table for each row
',null,'declare
  vtid   integer := wmsys.ltUtil.getVtid(:old.ct_owner, :old.ct_name) ;
begin
  delete wmsys.wm$ric_table$
  where ct_vtid# = vtid and
        ric_name = :old.ric_name ;

  delete wmsys.wm$constraints_table$
  where vtid# = vtid and
        constraint_name = :old.ric_name ;
end ;',288,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22838,4,0,1,0,22699,'OLD','NEW','wmsys.wm$rtt_i_trig instead of insert on wmsys.wm$ric_triggers_table for each row
',null,'declare
  flag_v integer := 0;
  vtid1  integer := wmsys.ltUtil.getVtid(:new.pt_owner, :new.pt_name) ;
  vtid2  integer := wmsys.ltUtil.getVtid(:new.ct_owner, :new.ct_name) ;
begin
  insert into wmsys.wm$ric_triggers_table$(pt_vtid#, ct_vtid#, trig#)
  values (vtid1, vtid2, regexp_substr(:new.update_trigger_name, ''[[:digit:]]+$'')) ;
end;',339,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22839,4,0,1,0,22700,'OLD','NEW','wmsys.wm$sav_i_trig instead of insert on wmsys.wm$sysparam_all_values for each row
',null,'declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$sysparam_all_values$f(:new.isdefault, :new.hidden) ;

  insert into wmsys.wm$sysparam_all_values$(name, value, wm$flag)
  values (:new.name, :new.value, flag_v) ;
end;',237,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22840,4,0,1,0,22701,'OLD','NEW','wmsys.wm$udp_i_trig instead of insert on wmsys.wm$udtrig_dispatch_procs for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.table_owner_name, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$udtrig_dispatch_procs$f(:new.trig_flag) ;

  insert into wmsys.wm$udtrig_dispatch_procs$(vtid#, proc#, wm$flag)
  values (vtid, regexp_substr(:new.dispatcher_name, ''[[:digit:]]+$''), flag_v) ;
end;',349,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22841,4,0,1,0,22702,'OLD','NEW','wmsys.wm$ui_i_trig instead of insert on wmsys.wm$udtrig_info for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.table_owner_name, :new.table_name) ;
  trig_t integer ;
  u_flag boolean ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$udtrig_info$f(:new.trig_flag, :new.status, :new.internal_type, :new.event_flag) ;

  insert into wmsys.wm$udtrig_info$(trig_owner_name, trig_name, vtid#, proc#, when_clause, description, trig_code, wm$flag)
  values (:new.trig_owner_name, :new.trig_name, vtid, regexp_substr(:new.trig_procedure, ''[[:digit:]]+$''),
          :new.when_clause, :new.description, :new.trig_code, flag_v) ;
end;',581,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22842,4,1,0,0,22702,'OLD','NEW','wmsys.wm$ud_u_trig instead of update on wmsys.wm$udtrig_info for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  vtid    integer := wmsys.ltUtil.getVtid(:new.table_owner_name, :new.table_name) ;
  trig_t  integer ;
  u_flag  boolean ;
begin
  if (updating(''TRIG_FLAG'') or updating(''EVENT_FLAG'')) then
    flag_v := wmsys.owm_dml_pkg.wm$udtrig_info$f(:new.trig_flag, :new.status, :new.internal_type, :new.event_flag) ;
    sqlstr := sqlstr || '' wm$flag=:1'' ;
  end if ;

  if (updating(''TRIG_PROCEDURE'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' proc#=:2'' ;
  end if;

  if (updating(''DESCRIPTION'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' description=:3'' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null)) then
           null ;
         end if;

         update wmsys.wm$udtrig_info$
         set '' || substr(sqlstr, 2) || ''
         where trig_owner_name=:4 and trig_name=:5;
       end;'' using flag_v, regexp_substr(:new.trig_procedure, ''[[:digit:]]+$''), :new.description, :old.trig_owner_name, :old.trig_name ;
  end if ;
end;',1193,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22843,4,0,1,0,22676,'OLD','NEW','wmsys.wm$vth_i_trig instead of insert on wmsys.wm$versioned_tables$h for each row
',null,'declare
  flag_v integer := 0;
begin
  flag_v := wmsys.owm_dml_pkg.wm$versioned_tables$f(:new.disabling_ver, :new.hist, :new.validtime, :new.bl_savepoint,
                                                    :new.bl_check_for_duplicates, :new.bl_single_transaction, null) ;

  insert into wmsys.wm$versioned_tables$(vtid#, table_name, owner, ricweight, pkey_cols, undo_code, bl_version, wm$flag)
  values (:new.vtid, :new.table_name, :new.owner, :new.ricweight, :new.pkey_cols, :new.undo_code, :new.bl_version, flag_v) ;
end;',524,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22844,4,1,0,0,22676,'OLD','NEW','wmsys.wm$vth_u_trig instead of update on wmsys.wm$versioned_tables$h for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  if (updating(''DISABLING_VER'') or updating(''HIST'') or updating(''VALIDTIME'') or
      updating(''BL_SAVEPOINT'') or updating(''BL_CHECK_FOR_DUPLICATES'') or updating(''BL_SINGLE_TRANSACTION'')) then
    flag_v := wmsys.owm_dml_pkg.wm$versioned_tables$f(:new.disabling_ver, :new.hist, :new.validtime, :new.bl_savepoint,
                                                      :new.bl_check_for_duplicates, :new.bl_single_transaction, :new.identity_type) ;

    sqlstr := sqlstr || '' wm$flag=:1'' ;
  end if ;

  if (updating(''RICWEIGHT'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' ricweight=:2'' ;
  end if;

  if (updating(''PKEY_COLS'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' pkey_cols=:3'' ;
  end if;

  if (updating(''UNDO_CODE'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' undo_code=:4'' ;
  end if;

  if (updating(''BL_VERSION'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' bl_version=:5'' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null or :6 is null or :7 is null)) then
           null ;
         end if;

         update wmsys.wm$versioned_tables$
         set '' || substr(sqlstr, 2) || ''
         where owner=:6 and table_name=:7;
       end;'' using flag_v, :new.ricweight, :new.pkey_cols, :new.undo_code, :new.bl_version, :old.owner, :old.table_name ;
  end if ;
end;',1634,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22845,4,0,0,1,22676,'OLD','NEW','wmsys.wm$vth_d_trig instead of delete on wmsys.wm$versioned_tables$h for each row
',null,'begin
  delete wmsys.wm$batch_compressible_tables$
  where vtid#=:old.vtid ;

  delete wmsys.wm$constraints_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$cons_columns$
  where vtid#=:old.vtid ;

  delete wmsys.wm$hint_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$lockrows_info$
  where vtid#=:old.vtid ;

  delete wmsys.wm$modified_tables$
  where vtid#=:old.vtid ;

  delete wmsys.wm$nested_columns_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$ric_table$
  where ct_vtid#=:old.vtid ;

  delete wmsys.wm$ric_triggers_table$
  where ct_vtid#=:old.vtid ;

  delete wmsys.wm$udtrig_dispatch_procs$
  where vtid#=:old.vtid ;

  delete wmsys.wm$udtrig_info$
  where vtid#=:old.vtid ;

  delete wmsys.wm$vt_errors_table$
  where vtid#=:old.vtid ;

  delete wmsys.wm$versioned_tables$
  where vtid#=:old.vtid ;
end;',828,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22846,4,0,1,0,22676,'OLD','NEW','wmsys.wm$vth_nt_i_trig instead of insert on nested table undo_code of wmsys.wm$versioned_tables$h for each row
',null,'begin
  insert into table(select undo_code from wmsys.wm$versioned_tables$ where owner=:parent.owner and table_name=:parent.table_name)
  values(:new.index_type, :new.index_field, :new.sql_str) ;
end;',200,1,33,0,12,0,'PARENT',2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22847,4,0,0,1,22676,'OLD','NEW','wmsys.wm$vth_nt_d_trig instead of delete on nested table undo_code of wmsys.wm$versioned_tables$h for each row
',null,'begin
  delete table (select undo_code from wmsys.wm$versioned_tables$ where owner=:parent.owner and table_name=:parent.table_name)
  where index_type  = :old.index_type and
        index_field = :old.index_field ;
end;',219,1,33,0,12,0,'PARENT',2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22848,4,0,1,0,22703,'OLD','NEW','wmsys.wm$vht_i_trig instead of insert on wmsys.wm$version_hierarchy_table for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  insert into wmsys.wm$version_hierarchy_table$(version, parent_version, workspace#)
  values (:new.version, :new.parent_version, ws#) ;
end;',248,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22849,4,0,1,0,22704,'OLD','NEW','wmsys.wm$vt_i_trig instead of insert on wmsys.wm$version_table for each row
',null,'declare
  flag_v integer := 0;
  ws#1   integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
  ws#2   integer := wmsys.ltUtil.getWorkspaceLockId(:new.anc_workspace) ;


  refcount integer := :new.refcount ;
begin
  if (refcount is null) then
    refcount := 0 ;
  end if ;

  insert into wmsys.wm$version_table$(workspace#, anc_workspace#, anc_version, anc_depth, refcount)
  values (ws#1, ws#2, :new.anc_version, :new.anc_depth, refcount) ;
end;',454,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22850,4,0,1,0,22705,'OLD','NEW','wmsys.wm$vet_i_trig instead of insert on wmsys.wm$vt_errors_table for each row
',null,'declare
  flag_v integer := 0;
  vtid   integer := wmsys.ltUtil.getVtid(:new.owner, :new.table_name) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$vt_errors_table$f(:new.status) ;

  insert into wmsys.wm$vt_errors_table$(vtid#, index_type, index_field, error_msg, wm$flag)
  values (vtid, :new.index_type, :new.index_field, :new.error_msg, flag_v) ;
end;',349,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22851,4,1,0,0,22705,'OLD','NEW','wmsys.wm$vet_u_trig instead of update on wmsys.wm$vt_errors_table for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  vtid    integer := wmsys.ltUtil.getVtid(:old.owner, :old.table_name) ;
begin
  if (updating(''STATUS'')) then
    flag_v := wmsys.owm_dml_pkg.wm$vt_errors_table$f(:new.status) ;
    sqlstr := sqlstr || '' wm$flag=:1'' ;
  end if ;

  if (updating(''ERROR_MSG'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' error_msg=:2'' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null or :3 is null)) then
           null ;
         end if;

         update wmsys.wm$vt_errors_table$
         set '' || substr(sqlstr, 2) || ''
         where vtid#=:3;
       end;'' using flag_v, :new.error_msg, vtid ;
  end if ;
end;',777,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22852,4,0,1,0,22672,'OLD','NEW','wmsys.wm$wt_i_trig instead of insert on wmsys.wm$workspaces_table$d for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.parent_workspace) ;


  last_change     timestamp with time zone := :new.last_change ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$workspaces_table$f(:new.freeze_status, :new.freeze_mode, :new.wm_lockmode,
                                                    :new.isrefreshed, :new.session_duration, :new.cr_status, :new.keep) ;

  if (last_change is null) then
    last_change := systimestamp ;
  end if ;

  insert into wmsys.wm$workspaces_table$(workspace, parent_workspace#, current_version, parent_version, post_version,
                                         owner, createtime, description, workspace_lock_id, freeze_writer, freeze_owner,
                                         sync_parver, last_change, depth, mp_root, wm$flag)
  values (:new.workspace, ws#, :new.current_version, :new.parent_version, :new.post_version, :new.owner, :new.createtime,
          :new.description, :new.workspace_lock_id, :new.freeze_writer, :new.freeze_owner,
          :new.sync_parver, last_change, :new.depth, :new.mp_root, flag_v) ;
end;',1115,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22853,4,1,0,0,22672,'OLD','NEW','wmsys.wm$wt_u_trig instead of update on wmsys.wm$workspaces_table$d for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
begin
  if (updating(''FREEZE_STATUS'') or updating(''FREEZE_MODE'') or updating(''WM_LOCKMODE'') or
      updating(''ISREFRESHED'') or updating(''SESSION_DURATION'') or updating(''CR_STATUS'') or updating(''KEEP'')) then
    flag_v := wmsys.owm_dml_pkg.wm$workspaces_table$f(:new.freeze_status, :new.freeze_mode, :new.wm_lockmode,
                                                      :new.isrefreshed, :new.session_duration, :new.cr_status, :new.keep) ;
    sqlstr := sqlstr || '' wm$flag=:1'' ;
  end if ;

  if (updating(''WORKSPACE'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' workspace=:2'' ;
  end if;

  if (updating(''CURRENT_VERSION'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' current_version=:3'' ;
  end if;

  if (updating(''PARENT_VERSION'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' parent_version=:4'' ;
  end if;

  if (updating(''POST_VERSION'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' post_version=:5'' ;
  end if;

  if (updating(''DESCRIPTION'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' description=:6'' ;
  end if;

  if (updating(''FREEZE_WRITER'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' freeze_writer=:7'' ;
  end if;

  if (updating(''FREEZE_OWNER'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' freeze_owner=:8'' ;
  end if;

  if (updating(''SYNC_PARVER'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' sync_parver=:9'' ;
  end if;

  if (updating(''LAST_CHANGE'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' last_change=:10'' ;
  end if;

  if (updating(''DEPTH'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' depth=:11'' ;
  end if;

  if (updating(''MP_ROOT'')) then
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' mp_root=:12'' ;
  end if;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null or :5 is null or :6 is null or
                      :7 is null or :8 is null or :9 is null or :10 is null or :11 is null or :12 is null or :13 is null)) then
           null ;
         end if;

         update wmsys.wm$workspaces_table$
         set '' || substr(sqlstr, 2) || ''
         where workspace_lock_id=:13;
       end;'' using flag_v, :new.workspace, :new.current_version, :new.parent_version, :new.post_version, :new.description, :new.freeze_writer,
                   :new.freeze_owner, :new.sync_parver, :new.last_change, :new.depth, :new.mp_root, :old.workspace_lock_id ;
  end if ;
end;',2924,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22854,4,0,0,1,22672,'OLD','NEW','wmsys.wm$wt_d_trig instead of delete on wmsys.wm$workspaces_table$d for each row
',null,'begin
  delete wmsys.wm$batch_compressible_tables$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$lockrows_info$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_graph_workspaces_table$
  where mp_leaf_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_graph_workspaces_table$
  where mp_graph_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_parent_workspaces_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mp_parent_workspaces_table$
  where parent_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$mw_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$resolve_workspaces_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$version_hierarchy_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$version_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$version_table$
  where anc_workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$workspace_priv_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$workspace_savepoints_table$
  where workspace#=:old.workspace_lock_id ;

  delete wmsys.wm$workspaces_table$
  where workspace_lock_id=:old.workspace_lock_id ;
end;',1237,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22855,4,0,1,0,22706,'OLD','NEW','wmsys.wm$wpt_i_trig instead of insert on wmsys.wm$workspace_priv_table for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$workspace_priv_table$f(:new.priv, :new.admin) ;

  insert into wmsys.wm$workspace_priv_table$(grantee, workspace#, grantor, wm$flag)
  values (:new.grantee, ws#, :new.grantor, flag_v) ;
end;',330,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22856,4,1,0,0,22706,'OLD','NEW','wmsys.wm$wpt_u_trig instead of update on wmsys.wm$workspace_priv_table for each row
',null,'declare
  sqlstr  varchar2(32000) ;
  flag_v  integer := 0;
  ws#     integer := wmsys.ltUtil.getWorkspaceLockId(:old.workspace) ;
begin
  if (updating(''ADMIN'')) then
    flag_v := wmsys.owm_dml_pkg.wm$workspace_priv_table$f(:new.priv, :new.admin) ;
    sqlstr := sqlstr || (case when sqlstr is not null then '','' else null end) || '' wm$flag=:1'' ;
  end if ;

  if (sqlstr is not null) then
    execute immediate
      ''begin
         if (1=2 and (:1 is null or :2 is null or :3 is null or :4 is null)) then
           null ;
         end if;

         if (:3 is not null) then
           update wmsys.wm$workspace_priv_table$
           set '' || substr(sqlstr, 2) || ''
           where grantee = :2 and
                 workspace# = :3 and
                 bitand(wm$flag, 31) = decode(:4, null, 0, ''''U'''', 0,
                                                  ''''A'''', 1, ''''M'''', 2, ''''R'''', 3, ''''D'''', 4, ''''C'''', 5, ''''F'''', 6, ''''G'''', 13,
                                                  ''''AA'''', 7, ''''MA'''', 8, ''''RA'''', 9, ''''DA'''', 10, ''''CA'''', 11, ''''FA'''', 12, ''''GA'''', 14,
                                                  ''''W'''', 15) ;
         else
           update wmsys.wm$workspace_priv_table$
           set '' || substr(sqlstr, 2) || ''
           where grantee = :2 and
                 workspace# is null and
                 bitand(wm$flag, 31) = decode(:4, null, 0, ''''U'''', 0,
                                                  ''''A'''', 1, ''''M'''', 2, ''''R'''', 3, ''''D'''', 4, ''''C'''', 5, ''''F'''', 6, ''''G'''', 13,
                                                  ''''AA'''', 7, ''''MA'''', 8, ''''RA'''', 9, ''''DA'''', 10, ''''CA'''', 11, ''''FA'''', 12, ''''GA'''', 14,
                                                  ''''W'''', 15) ;
         end if ;
       end;'' using flag_v, :old.grantee, ws#, :old.priv ;
  end if ;
end;',1779,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22857,4,0,0,1,22706,'OLD','NEW','wmsys.wm$wpt_d_trig instead of delete on wmsys.wm$workspace_priv_table for each row
',null,'declare
  ws#     integer := wmsys.ltUtil.getWorkspaceLockId(:old.workspace) ;
  flag_v  integer := wmsys.owm_dml_pkg.wm$workspace_priv_table$f(:old.priv, null) ;
begin
  if (ws# is not null) then
    delete wmsys.wm$workspace_priv_table$ where grantee=:old.grantee and workspace#=ws# and bitand(wm$flag, 31) = flag_v ;
  else
    delete wmsys.wm$workspace_priv_table$ where grantee=:old.grantee and workspace# is null and bitand(wm$flag, 31) = flag_v ;
  end if ;
end;',469,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22858,4,0,1,0,22707,'OLD','NEW','wmsys.wm$wst_i_trig instead of insert on wmsys.wm$workspace_savepoints_table for each row
',null,'declare
  flag_v integer := 0;
  ws#    integer := wmsys.ltUtil.getWorkspaceLockId(:new.workspace) ;
begin
  flag_v := wmsys.owm_dml_pkg.wm$workspace_savepoints_t$f(:new.is_implicit) ;

  insert into wmsys.wm$workspace_savepoints_table$(workspace#, savepoint, version, owner, createtime, description, wm$flag)
  values (ws#, :new.savepoint, :new.version, :new.owner, :new.createtime, :new.description, flag_v) ;
end;',416,1,1,0,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22951,0,0,0,0,0,'OLD','NEW','wmsys.no_vm_ddl before alter or create or drop or rename or truncate on database
  ','(ora_sysevent in (''ALTER'', ''RENAME'', ''TRUNCATE'') and ora_dict_obj_type in (''INDEX'',''TABLE'')) or
        (ora_sysevent = ''CREATE'' and ora_dict_obj_type in (''INDEX'', ''PROCEDURE'', ''TRIGGER'', ''VIEW'')) or
        (ora_sysevent = ''DROP'' and ora_dict_obj_type in (''INDEX'', ''PROCEDURE'', ''ROLE'', ''TABLE'', ''TRIGGER'', ''TYPE'', ''USER'', ''VIEW''))','declare
  validStack  integer ;
begin
  if (sys_context(''lt_ctx'', ''allowDDLOperation'')=''true'') then
    return ;
  end if ;

  if (sys_context(''lt_ctx'', ''validStack'') is null or sys_context(''lt_ctx'', ''validStack'') != ''YES'') then
    validStack := 0 ;
  else
    validStack := 1 ;
  end if ;

  if (ora_sysevent=''CREATE'') then
    wmsys.owm_dynsql_access.no_vm_create_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner, validStack) ;
  elsif (ora_sysevent=''DROP'') then
    wmsys.owm_dynsql_access.no_vm_drop_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner, validStack) ;
  elsif (ora_sysevent in (''ALTER'', ''RENAME'', ''TRUNCATE'')) then
    wmsys.owm_dynsql_access.no_vm_alter_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner, validStack) ;
  end if ;
end;',790,0,1048712,12512,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22952,2,0,0,0,0,'OLD','NEW','wmsys.no_vm_drop_a after drop on database ','ora_dict_obj_type in (''USER'')','begin
  wmsys.owm_dynsql_access.allowDDLOperation(''false'') ;



end;',68,0,1048712,128,0,0,null,2,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (22975,2,0,0,0,0,'OLD','NEW','DELETE_ENTRIES
AFTER DROP ON DATABASE
',null,'BEGIN
  IF (ORA_DICT_OBJ_TYPE = ''USER'') THEN
    DELETE FROM SYSTEM.SQLPLUS_PRODUCT_PROFILE
    WHERE USERID = ORA_DICT_OBJ_NAME;
  END IF;

 EXCEPTION WHEN OTHERS THEN
  IF (SQLCODE = -4043) OR (SQLCODE = -1031) THEN
     NULL;
  ELSE
     RAISE;
  END IF;
END;',262,1,1048712,128,0,0,null,3,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (59300,2,0,0,0,0,'OLD','NEW','OJDS$ROLE_TRIGGER$ after drop on database ','ora_dict_obj_type=''ROLE''','begin
    ojds_context.role_dropped(ora_dict_obj_name);
  exception -- if not present then ignore
  when others then
  if sqlcode not in (-00604, -04063, -06508) then raise; end if;
  end;',188,1,1048712,128,0,0,null,2,1,9,0,2);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63770,2,0,0,0,0,'OLD','NEW','mdsys.sdo_drop_user
after drop on DATABASE
',null,'declare
   stmt varchar2(200);
   cnt number;
   is_active number;
   table_not_found exception;
   pragma exception_init(table_not_found, -00942);
   package_not_found exception;
   pragma exception_init(package_not_found, -04042);
   object_not_found exception;
   pragma exception_init(object_not_found, -04043);
   package_invalidated exception;
   pragma exception_init(package_invalidated, -04061);
BEGIN

   stmt := ''select mdsys.sdo_util.SpatialActive from dual'';
   begin
     execute immediate stmt into is_active;
     exception
       when package_invalidated then
         is_active := 0;
       when package_not_found then
         is_active := 0;
       when object_not_found then
         is_active := 0;
       when others then
         is_active := 0;
         SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')3]: '' || SQLERRM);
   end;
   if ( is_active = 0 ) then
     return;
   end if;

   if sys.dbms_standard.dictionary_obj_type = ''USER'' THEN
     begin
       stmt := ''DELETE FROM MDSYS.SDO_GEOM_METADATA_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')4]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_MAPS_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')5]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_CACHED_MAPS_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')6]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_STYLES_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')7]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_THEMES_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')8]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_LRS_METADATA_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')9]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_TOPO_METADATA_TABLE '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')10]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.SDO_ANNOTATION_TEXT_METADATA '' ||
               ''WHERE F_TABLE_SCHEMA = :owner '';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
       exception
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')11]: '' || SQLERRM); RAISE;
     end;

     begin
       stmt := ''DELETE FROM MDSYS.CSW_SERVICE_INFO '' ||
               ''WHERE SDO_OWNER = :owner '';
       EXCEPTION
         when table_not_found then NULL;
         when others then
           SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')12]: '' || SQLERRM); RAISE;
    end;
  end if;
end;',5070,1,1048712,128,0,0,null,3,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63772,3,1,0,1,63762,'OLD','NEW','MDSYS.SDO_GEOM_METADATA_UPDATE
AFTER UPDATE OR DELETE ON MDSYS.SDO_GEOM_METADATA_TABLE
FOR EACH ROW
',null,'BEGIN
  mdsys.mdprvt_gmd.invalidate_geom_metadata(:old.sdo_owner,
                                            :old.sdo_table_name,
                                            :old.sdo_column_name);
END;',202,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (67133,0,0,0,0,0,'OLD','NEW','MDSYS.sdo_topo_drop_ftbl
  BEFORE DROP ON DATABASE
  ',null,'DECLARE
    cnt        NUMBER;
    stmt       VARCHAR(500);
    topology   VARCHAR(100);
    REG_TBL    EXCEPTION;
   is_active number;
   package_not_found exception;
   pragma exception_init(package_not_found, -04043);
  BEGIN

   stmt := ''select mdsys.sdo_util.SpatialActive from dual'';
   begin
     execute immediate stmt into is_active;
     exception
       when package_not_found then
         is_active := 0;
       when others then
         is_active := 0;
         SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[prvtgmd.sql('' || $$PLSQL_LINE || '')3]: '' || SQLERRM);
   end;
   if ( is_active = 0 ) then
     return;
   end if;


    if(sys.dbms_standard.dictionary_obj_type != ''TABLE'')
    then
      return;
    end if;
    stmt := ''SELECT topology '' ||
     ''FROM MDSYS.SDO_TOPO_METADATA_TABLE a, TABLE(a.Topo_Geometry_Layers) b '' ||
     ''WHERE b.owner = :owner AND b.table_name = :tab '';
    EXECUTE IMMEDIATE stmt into topology
      USING sys.dbms_standard.DICTIONARY_OBJ_OWNER,
            sys.dbms_standard.DICTIONARY_OBJ_NAME;
    RAISE REG_TBL;

    EXCEPTION
      WHEN REG_TBL THEN
        MDSYS.MDERR.raise_md_error(
         ''MD'', ''SDO'', -13199,
         ''Need to use delete_topo_geometry_layer() to deregister table ''
       || sys.dbms_standard.DICTIONARY_OBJ_NAME ||
             '' from topology '' || topology ||
         '' before dropping it'');
      WHEN OTHERS THEN
        RETURN;
  END;',1468,0,1048712,128,0,0,null,3,1,15,6,2);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70378,3,1,0,1,70370,'OLD','NEW','MDSYS.SDO_GEOR_TRIG_DEL2
AFTER UPDATE OR DELETE ON MDSYS.SDO_GEOR_SYSDATA_TABLE
FOR EACH ROW
',null,'BEGIN

  SDO_GEOR_INT.sdo_invalidate_sysdata_cache(:old.rdt_table_name,
                                            :old.raster_id);
END;',137,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70379,4,0,1,0,70377,'OLD','NEW','MDSYS.SDO_GEOR_TRIG_INS1
INSTEAD OF INSERT ON mdsys.user_sdo_geor_sysdata
FOR EACH ROW
',null,'DECLARE
  owner   VARCHAR2(130);
  valid   VARCHAR2(32);
BEGIN
  owner:=user;

  valid:=SDO_GEOR_DEF.isValidEntry2(owner,nls_upper(:new.table_name),nls_upper(:new.column_name),nls_upper(:new.rdt_table_name),:new.raster_id);

  if(valid=''FALSE'')
  then
     mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The inserted entry is not valid.'');
  end if;
  SDO_GEOR_INT.insertUserSysEntry(user, :new.table_name, :new.column_name,
      :new.metadata_column_name, :new.rdt_table_name, :new.raster_id,
      :new.other_table_names);
END;',526,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70380,4,0,0,1,70377,'OLD','NEW','MDSYS.SDO_GEOR_TRIG_DEL1
INSTEAD OF DELETE ON mdsys.user_sdo_geor_sysdata
FOR EACH ROW
',null,'DECLARE
  owner   VARCHAR2(130);
  valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry2(owner,nls_upper(:old.table_name),nls_upper(:old.column_name),nls_upper(:old.rdt_table_name),:old.raster_id);
  if(valid=''TRUE'')
  then
     mderr.raise_md_error(''MD'', ''SDO'', -13391, ''A valid entry cannot be deleted directly.'');
  end if;
  SDO_GEOR_DEF.deleteMetaEntry(user, :old.rdt_table_name, :old.raster_id);
END;',431,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70381,4,1,0,0,70377,'OLD','NEW','MDSYS.SDO_GEOR_TRIG_UPD1
INSTEAD OF UPDATE ON mdsys.user_sdo_geor_sysdata
FOR EACH ROW
',null,'DECLARE
 owner VARCHAR2(130);
 valid   VARCHAR2(32);
BEGIN
  owner:=user;
  valid:=SDO_GEOR_DEF.isValidEntry2(owner,nls_upper(:old.table_name),nls_upper(:old.column_name),nls_upper(:old.rdt_table_name),:old.raster_id);
  if(valid=''TRUE'')
  then
     mderr.raise_md_error(''MD'', ''SDO'', -13391, ''A valid entry cannot be updated directly.'');
  end if;
  valid:=SDO_GEOR_DEF.isValidEntry2(owner,nls_upper(:new.table_name),nls_upper(:new.column_name),nls_upper(:new.rdt_table_name),:new.raster_id);
  if(valid=''FALSE'')
  then
     mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The updated entry is not valid.'');
  end if;


  SDO_GEOR_DEF.deleteMetaEntry(user, :old.rdt_table_name, :old.raster_id);


  SDO_GEOR_INT.insertUserSysEntry(user, :new.table_name, :new.column_name,
      :new.metadata_column_name, :new.rdt_table_name, :new.raster_id,
      :new.other_table_names);
END;',872,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70527,2,0,0,0,0,'OLD','NEW','SDO_NETWORK_DROP_USER
AFTER DROP ON DATABASE
',null,'DECLARE
  stmt    VARCHAR2(256);
  package_not_found exception;
  pragma exception_init(package_not_found, -04043);
  is_active number;
BEGIN

  -- Make sure "Spatial Data and Graph" is installed/active
   stmt := ''select mdsys.sdo_util.SpatialActive from dual'';
   begin
     execute immediate stmt into is_active;
     exception
       when package_not_found then
         is_active := 0;
       when others then
         is_active := 0;
         SYS.DBMS_SYSTEM.KSDWRT(SYS.DBMS_SYSTEM.TRACE_FILE,
                                  ''EXCEPTION[sdonetmd.sql('' || $$PLSQL_LINE || '')1]: '' || SQLERRM);
   end;
   if ( is_active = 0 ) then
     return;
   end if;


  IF  sys.dbms_standard.dictionary_obj_type = ''USER''  THEN
    stmt := ''DELETE FROM SDO_NETWORK_METADATA_TABLE WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NETWORK_CONSTRAINTS WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NETWORK_LOCKS_WM WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NETWORK_USER_DATA WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    --lrg-3417773
    stmt := ''DELETE FROM SDO_NETWORK_HISTORIES WHERE OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NETWORK_TIMESTAMPS WHERE OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NETWORK_FEATURE WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt using sys.dbms_standard.dictionary_obj_name;

    -- nfe
    stmt := ''DELETE FROM SDO_NFE_MODEL_METADATA_TABLE WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NFE_MODEL_FTLAYER_REL WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

    stmt := ''DELETE FROM SDO_NFE_MODEL_WORKSPACE WHERE SDO_OWNER = sdo_util.get_quoted_name(:name)'';
    EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

  END IF;
END ;',2496,1,1048712,128,0,0,null,3,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64656,4,1,1,1,64654,'O','N','SDO_ANNOT_TRIG_INS1
INSTEAD OF INSERT OR DELETE OR UPDATE ON MDSYS.USER_ANNOTATION_TEXT_METADATA
REFERENCING NEW AS n OLD as o
FOR EACH ROW
',null,'declare
 tname varchar2(130);
begin

  IF INSERTING THEN
 EXECUTE IMMEDIATE
  ''SELECT user FROM SYS.DUAL'' into tname;
      INSERT INTO SDO_ANNOTATION_TEXT_METADATA values(null,tname,
            nls_upper(:n.table_name), nls_upper(:n.column_name), :n.MAP_BASE_SCALE,
                 :n.TEXT_EXPRESSION,
             :n.TEXT_ATTRIBUTES);
  ELSIF UPDATING THEN
 EXECUTE IMMEDIATE
  ''SELECT user FROM SYS.DUAL'' into tname;
  UPDATE SDO_ANNOTATION_TEXT_METADATA SET(F_TABLE_SCHEMA,
             F_TABLE_NAME,F_TEXT_COLUMN, MAP_BASE_SCALE, TEXT_DEFAULT_EXPRESSION,
                    TEXT_DEFAULT_ATTRIBUTES) =
   (SELECT tname, :n.table_name, :n.column_name, :n.MAP_BASE_SCALE,
                    :n.TEXT_EXPRESSION,
           :n.TEXT_ATTRIBUTES FROM SYS.DUAL)
  WHERE F_TABLE_SCHEMA =  tname AND
     F_TABLE_NAME = :o.table_name AND F_TEXT_COLUMN = :o.column_name;
  ELSE
 EXECUTE IMMEDIATE
  ''SELECT user FROM SYS.DUAL'' into tname;
   DELETE FROM SDO_ANNOTATION_TEXT_METADATA
    WHERE  F_TABLE_SCHEMA =  tname AND
     F_TABLE_NAME = :o.table_name AND F_TEXT_COLUMN = :o.column_name;
  END IF;
end;',1103,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64662,3,1,0,1,66851,'OLD','NEW','MDSYS.SDO_FEATURE_USAGE_UPDATE
AFTER UPDATE OR DELETE ON MDSYS.SDO_FEATURE_USAGE
FOR EACH ROW
',null,'BEGIN
  mdsys.mdprvt_feature.sdo_invalidate_feature(:old.feature_name);
END;',76,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64267,0,0,0,0,0,'OLD','NEW','mdsys.sdo_st_syn_create
  BEFORE CREATE ON DATABASE
 ',null,'declare
 error boolean;
  st_syn_detected EXCEPTION;
   PRAGMA EXCEPTION_INIT(st_syn_detected, -995);
 BEGIN
   if((sys.dbms_standard.dictionary_obj_type!=''SYNONYM'')or(sys.dbms_standard.dictionary_obj_owner!=''PUBLIC''))
   then
     return;
   end if;
   error :=
      CASE sys.dbms_standard.dictionary_obj_name
         WHEN ''ST_GEOMETRY'' THEN TRUE
         WHEN ''ST_SURFACE'' THEN TRUE
         WHEN ''ST_POLYGON'' THEN TRUE
         WHEN ''ST_POINT'' THEN TRUE
         WHEN ''ST_MULTISURFACE'' THEN TRUE
         WHEN ''ST_MULTIPOINT'' THEN TRUE
         WHEN ''ST_MULTILINESTRING'' THEN TRUE
         WHEN ''ST_MULTICURVE'' THEN TRUE
         WHEN ''ST_LINESTRING'' THEN TRUE
         WHEN ''ST_GEOMCOLLECTION'' THEN TRUE
         WHEN ''ST_CURVE'' THEN TRUE
         WHEN ''ST_CURVEPOLYGON'' THEN TRUE
         WHEN ''ST_COMPOUNDCURVE'' THEN TRUE
         WHEN ''ST_CIRCULARSTRING'' THEN TRUE
         WHEN ''ST_INTERSECTS'' THEN TRUE
         WHEN ''ST_RELATE'' THEN TRUE
         WHEN ''ST_TOUCH'' THEN TRUE
         WHEN ''ST_CONTAINS'' THEN TRUE
         WHEN ''ST_COVERS'' THEN TRUE
         WHEN ''ST_COVEREDBY'' THEN TRUE
         WHEN ''ST_INSIDE'' THEN TRUE
         WHEN ''ST_OVERLAP'' THEN TRUE
         WHEN ''ST_OVERLAPS'' THEN TRUE
         WHEN ''ST_EQUAL'' THEN TRUE
         WHEN ''ST_OVERLAPBDYDISJOINT'' THEN TRUE
         WHEN ''ST_OVERLAPBDYINTERSECT'' THEN TRUE
         WHEN ''ST_GEOMETRY_ARRAY'' THEN TRUE
         WHEN ''ST_POINT_ARRAY'' THEN TRUE
         WHEN ''ST_CURVE_ARRAY'' THEN TRUE
         WHEN ''ST_SURFACE_ARRAY'' THEN TRUE
         WHEN ''ST_LINESTRING_ARRAY'' THEN TRUE
         WHEN ''ST_POLYGON_ARRAY'' THEN TRUE
         ELSE FALSE
      END;

   if(error) then
     raise st_syn_detected;

   end if;
 END;',1694,1,1048712,32,0,0,null,3,1,15,6,1);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (66151,1,0,1,0,64171,'OLD','NEW','MDSYS.OGIS_CRS_INSERT_TRIGGER
BEFORE
  INSERT
ON
  MDSYS.ogis_spatial_reference_systems
FOR EACH ROW
',null,'BEGIN
  IF(nls_upper(TRIM(:new.srtext)) like ''GEOGCS%'') THEN
    insert into MDSYS.sdo_coord_ref_system (
      SRID,
      COORD_REF_SYS_NAME,
      COORD_REF_SYS_KIND,
      COORD_SYS_ID,
      DATUM_ID,
      GEOG_CRS_DATUM_ID,
      SOURCE_GEOG_SRID,
      PROJECTION_CONV_ID,
      CMPD_HORIZ_SRID,
      CMPD_VERT_SRID,
      INFORMATION_SOURCE,
      DATA_SOURCE,
      IS_LEGACY,
      LEGACY_CODE,
      LEGACY_WKTEXT,
      LEGACY_CS_BOUNDS,
      IS_VALID,
      SUPPORTS_SDO_GEOMETRY)
    VALUES (
      :new.SRID,
      ''OGIS '' || :new.SRID,
      ''GEOGRAPHIC2D'',
      NULL,
      1000000123,
      1000000123,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      ''TRUE'',
      NULL,
      :new.SRTEXT,
      NULL,
      ''TRUE'',
      ''TRUE'');
  ELSE
    insert into MDSYS.sdo_coord_ref_system (
      SRID,
      COORD_REF_SYS_NAME,
      COORD_REF_SYS_KIND,
      COORD_SYS_ID,
      DATUM_ID,
      GEOG_CRS_DATUM_ID,
      SOURCE_GEOG_SRID,
      PROJECTION_CONV_ID,
      CMPD_HORIZ_SRID,
      CMPD_VERT_SRID,
      INFORMATION_SOURCE,
      DATA_SOURCE,
      IS_LEGACY,
      LEGACY_CODE,
      LEGACY_WKTEXT,
      LEGACY_CS_BOUNDS,
      IS_VALID,
      SUPPORTS_SDO_GEOMETRY)
    VALUES (
      :new.SRID,
      ''OGIS '' || :new.SRID,
      ''PROJECTED'',
      NULL,
      NULL,
      1000000123,
      1000000123,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      ''TRUE'',
      NULL,
      :new.SRTEXT,
      NULL,
      ''TRUE'',
      ''TRUE'');
  END IF;
END;',1523,1,128,0,0,0,null,8,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (66152,1,0,0,1,64171,'OLD','NEW','MDSYS.OGIS_CRS_DELETE_TRIGGER
BEFORE
  DELETE
ON
  MDSYS.ogis_spatial_reference_systems
FOR EACH ROW
',null,'BEGIN
  DELETE FROM MDSYS.sdo_coord_ref_system WHERE SRID = :old.srid;
END;',75,1,128,0,0,0,null,8,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (67106,4,0,1,0,67105,'OLD','NEW','MDSYS.SDO_CSW_TRIGGER_INS1
INSTEAD OF INSERT ON MDSYS.USER_SDO_CSW_SERVICE_INFO
FOR EACH ROW
',null,'DECLARE
   owner VARCHAR2(130);
   --valid VARCHAR2(32);
BEGIN
   owner := user;
   INSERT INTO MDSYS.CSW_SERVICE_INFO VALUES(owner, :new.CSW_VERSION, :new.XSD_ID, :new.TABLE_NAME);
END;',186,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (67107,4,0,0,1,67105,'OLD','NEW','MDSYS.SDO_CSW_TRIGGER_DEL1
INSTEAD OF DELETE ON MDSYS.USER_SDO_CSW_SERVICE_INFO
FOR EACH ROW
',null,'DECLARE
   owner VARCHAR2(130);
   --valid VARCHAR2(32);
BEGIN
   owner := user;
   DELETE FROM MDSYS.CSW_SERVICE_INFO
       WHERE SDO_OWNER = owner AND
             CSW_XSD_ID = :old.XSD_ID;

END;',198,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (67108,4,1,0,0,67105,'OLD','NEW','MDSYS.SDO_CSW_TRIGGER_UPD1
INSTEAD OF UPDATE ON MDSYS.USER_SDO_CSW_SERVICE_INFO
FOR EACH ROW
',null,'DECLARE
   owner VARCHAR2(130);
   --valid VARCHAR2(32);
BEGIN
   owner := user;
   -- First delete the old entry
   DELETE FROM MDSYS.CSW_SERVICE_INFO
       WHERE SDO_OWNER = owner AND
             CSW_XSD_ID = :old.XSD_ID;

  -- insert the new entry
  INSERT INTO MDSYS.CSW_SERVICE_INFO VALUES(owner, :new.CSW_VERSION, :new.XSD_ID, :new.TABLE_NAME);

END;',358,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63963,4,0,1,0,63819,'OLD','NEW','MDSYS.SDO_CRS_INSERT_TRIGGER
INSTEAD OF
  INSERT
ON
  MDSYS.SDO_COORD_REF_SYSTEM
FOR EACH ROW
',null,'DECLARE
  already_exists  NUMBER;
BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  INSERT INTO MDSYS.SDO_COORD_REF_SYS (
    SRID,
    COORD_REF_SYS_NAME,
    COORD_REF_SYS_KIND,
    COORD_SYS_ID,
    DATUM_ID,
    GEOG_CRS_DATUM_ID,
    SOURCE_GEOG_SRID,
    PROJECTION_CONV_ID,
    CMPD_HORIZ_SRID,
    CMPD_VERT_SRID,
    INFORMATION_SOURCE,
    DATA_SOURCE,
    IS_LEGACY,
    LEGACY_CODE,
    LEGACY_WKTEXT,
    LEGACY_CS_BOUNDS,
    IS_VALID,
    SUPPORTS_SDO_GEOMETRY)
  VALUES (
    :new.SRID,
    :new.COORD_REF_SYS_NAME,
    :new.COORD_REF_SYS_KIND,
    :new.COORD_SYS_ID,
    :new.DATUM_ID,
    :new.GEOG_CRS_DATUM_ID,
    :new.SOURCE_GEOG_SRID,
    :new.PROJECTION_CONV_ID,
    :new.CMPD_HORIZ_SRID,
    :new.CMPD_VERT_SRID,
    :new.INFORMATION_SOURCE,
    :new.DATA_SOURCE,
    :new.IS_LEGACY,
    :new.LEGACY_CODE,
    :new.LEGACY_WKTEXT,
    :new.LEGACY_CS_BOUNDS,
    :new.IS_VALID,
    :new.SUPPORTS_SDO_GEOMETRY);

  INSERT INTO MDSYS.SDO_CS_SRS (
    CS_NAME,
    SRID,
    AUTH_SRID,
    AUTH_NAME,
    WKTEXT,
    wktext3d,
    CS_BOUNDS
    )
  VALUES (
    :new.COORD_REF_SYS_NAME,
    :new.SRID,
    :new.SRID,
    :new.INFORMATION_SOURCE,
    NVL(
      :new.LEGACY_WKTEXT,
      MDSYS.MDPRVT_SRID.det_srid_wkt(:new.srid)),
    MDSYS.MDPRVT_SRID.get_3d_wkt(:new.srid),
    :new.LEGACY_CS_BOUNDS);

    if(:new.COORD_REF_SYS_KIND = ''GEOGRAPHIC3D'') then
      insert into mdsys.sdo_crs_geographic_plus_height values (:new.srid);
    elsif(:new.COORD_REF_SYS_KIND = ''COMPOUND'') then
      insert into mdsys.sdo_crs_geographic_plus_height (
        select :new.srid from mdsys.sdo_crs_geographic2d g2d
        where g2d.srid = :new.CMPD_HORIZ_SRID);
    end if;

END;',1691,1,1,0,0,0,null,8,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63965,3,1,1,1,63832,'OLD','NEW','MDSYS.SDO_coord_op_param_val_TRIGGER
AFTER
  INSERT OR
  UPDATE or
  delete
ON
  MDSYS.SDO_coord_op_param_vals
for each row
',null,'BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  update
    mdsys.sdo_cs_srs
  set
    wktext = ''Getting updated''
  where
    srid in (
      select
        crs.srid
      from
        mdsys.sdo_coord_ref_sys crs
      where
        crs.projection_conv_id = :new.coord_op_id);
end;',283,1,128,0,0,0,null,10,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63964,4,0,0,1,63819,'OLD','NEW','MDSYS.SDO_CRS_DELETE_TRIGGER
INSTEAD OF
  DELETE
ON
  MDSYS.SDO_COORD_REF_SYSTEM
FOR EACH ROW
',null,'DECLARE
  already_exists  NUMBER;
BEGIN
  DELETE FROM MDSYS.SDO_CS_SRS WHERE SRID = :old.SRID;
  DELETE FROM MDSYS.SDO_COORD_REF_SYS WHERE SRID = :old.SRID;
  DELETE FROM mdsys.sdo_crs_geographic_plus_height WHERE srid = :old.srid;
END;',236,1,1,0,0,0,null,8,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63966,2,1,1,1,63832,'OLD','NEW','MDSYS.SDO_coord_op_param_val_TRIGG2
AFTER
  INSERT OR
  UPDATE or
  delete
ON
  MDSYS.SDO_coord_op_param_vals
',null,'BEGIN
  update
    mdsys.sdo_cs_srs
  set
    wktext = MDSYS.MDPRVT_SRID.det_srid_wkt(srid),
    wktext3d = MDSYS.MDPRVT_SRID.get_3d_wkt(srid)
  where
    wktext = ''Getting updated'';
end;',187,1,128,0,0,0,null,9,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64100,4,0,0,1,64094,'N','NEW','MDSYS.SDO_LRS_TRIG_DEL
INSTEAD OF DELETE ON mdsys.user_sdo_lrs_metadata
REFERENCING OLD AS n
FOR EACH ROW
',null,'declare
 user_name      varchar2(130);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
    DELETE FROM  MDSYS.sdo_lrs_metadata_table
    WHERE SDO_OWNER   = user_name
      AND SDO_TABLE_NAME  = nls_upper(:n.table_name)
      AND SDO_COLUMN_NAME = nls_upper(:n.column_name);
END;',351,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64131,4,0,1,0,64122,'OLD','N','MDSYS.SDO_TOPO_TRIG_INS1
INSTEAD OF INSERT ON MDSYS.SDO_TOPO_TRANSACT_DATA$
REFERENCING NEW AS n
FOR EACH ROW
',null,'declare
begin

   INSERT INTO MDSYS.SDO_TOPO_TRANSACT_DATA
      values(MDSYS.SDO_TOPO_TRANSACT_SUBSEQ.nextval, :n.topology_id, :n.topo_id,
                :n.topo_type, :n.topo_op, :n.parent_id);

end;',202,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64141,3,1,0,1,64042,'OLD','NEW','MDSYS.SDO_INDEX_METADATA_UPDATE
AFTER UPDATE OR DELETE ON MDSYS.SDO_INDEX_METADATA_TABLE
FOR EACH ROW
',null,'BEGIN


  mdsys.mdprvt_idx.invalidate_cache(:old.sdo_index_owner,
                                    :old.sdo_index_name,
                                    :old.sdo_index_partition,
                                    :old.sdo_index_table);
END;',248,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70580,4,0,1,0,70576,'OLD','N','mdsys.sdo_network_his_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_histories
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
 user_name         VARCHAR2(130);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  INSERT INTO mdsys.sdo_network_histories(
     owner, network, node_history_table, link_history_table, node_trigger,
     link_trigger)
  VALUES(
     sdo_util.get_quoted_name(user_name),:n.network,:n.node_history_table,
     :n.link_history_table,:n.node_trigger,:n.link_trigger);

  EXCEPTION
    WHEN OTHERS THEN RAISE;
END;',433,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70581,4,1,0,0,70576,'O','N','mdsys.sdo_network_his_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_histories
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  UPDATE mdsys.sdo_network_histories
   SET(network,node_history_table,link_history_table,node_trigger,link_trigger)
      =
   (SELECT
      :n.network,:n.node_history_table,:n.link_history_table,:n.node_trigger,
      :n.link_trigger
    FROM SYS.DUAL)
    WHERE  sdo_util.get_quoted_name(owner) = sdo_util.get_quoted_name(user_name)
      AND  network = :o.network;
END;',474,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70582,4,0,0,1,70576,'O','NEW','mdsys.sdo_network_his_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_histories
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  DELETE
    FROM  mdsys.sdo_network_histories
    WHERE sdo_util.get_quoted_name(OWNER) = sdo_util.get_quoted_name(user_name)
      AND network = :o.network;

END;',265,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70529,4,0,0,1,70523,'O','NEW','SDO_NETWORK_TRIG_DEL
INSTEAD OF DELETE ON mdsys.user_sdo_network_metadata
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  DELETE FROM SDO_NETWORK_METADATA_TABLE WHERE sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
  AND NLS_UPPER(network) = NLS_UPPER(:o.network);

END;',277,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70592,4,0,1,0,70588,'OLD','N','mdsys.sdo_network_time_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_timestamps
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
 user_name         VARCHAR2(130);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  INSERT INTO sdo_network_timestamps(
     owner, network, table_name, last_dml_time)
  VALUES(sdo_util.get_quoted_name(user_name),:n.network,:n.table_name, :n.last_dml_time);

  EXCEPTION
    WHEN OTHERS THEN RAISE;
END;',326,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70593,4,1,0,0,70588,'O','N','sdo_network_time_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_timestamps
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  UPDATE sdo_network_timestamps
   SET(network,table_name,last_dml_time)
      =
   (SELECT
      :n.network,:n.table_name,:n.last_dml_time
    FROM SYS.DUAL)
    WHERE  owner = sdo_util.get_quoted_name(user_name)
      AND  NLS_UPPER(network) = NLS_UPPER(:o.network)
      AND  NLS_UPPER(table_name) = NLS_UPPER(:o.table_name);
END;',434,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70594,4,0,0,1,70588,'O','NEW','mdsys.sdo_network_time_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_timestamps
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  DELETE
    FROM  sdo_network_timestamps
    WHERE owner = sdo_util.get_quoted_name(user_name)
      AND network = :o.network
      AND table_name = :o.table_name;
END;',270,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70672,4,0,0,1,70667,'O','NEW','MDSYS.SDO_NFE_MODEL_TRIG_DEL
INSTEAD OF DELETE ON MDSYS.USER_SDO_NFE_MODEL_METADATA
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN
  EXECUTE IMMEDIATE ''SELECT USER FROM SYS.DUAL'' INTO user_name;
  DELETE FROM MDSYS.SDO_NFE_MODEL_METADATA_TABLE WHERE sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name) AND id = :o.id;

END;',258,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70673,4,1,0,0,70667,'O','N','MDSYS.SDO_NFE_MODEL_TRIG_UPD
INSTEAD OF UPDATE ON MDSYS.USER_SDO_NFE_MODEL_METADATA
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name     VARCHAR2(256);
  edition_mode  NUMBER := 1;
  versionable   VARCHAR2(1) := ''N'';
BEGIN
  EXECUTE IMMEDIATE ''SELECT USER FROM SYS.DUAL'' INTO user_name;

  IF ( edition_mode != :n.edition_mode ) THEN
    edition_mode := 2;
  END IF;

  IF ( :n.versionable_ind IS NOT NULL  AND  :n.versionable_ind = ''Y'' ) THEN
    versionable := ''Y'';
  END IF;

  UPDATE MDSYS.SDO_NFE_MODEL_METADATA_TABLE
    SET ( NAME,
          EDITION_MODE,
          VERSIONABLE_IND,
          TABLE_REG_TAB,
          SEQUENCE_REG_TAB,
          NETWORK_NAME  )
        =
        ( SELECT
          NLS_UPPER(:n.name),
          edition_mode,
          versionable,
          NLS_UPPER(:n.table_reg_tab),
          NLS_UPPER(:n.sequence_reg_tab),
          NLS_UPPER(:n.network_name)
          FROM SYS.DUAL )
  WHERE  sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
     AND id = :o.id;
END;',912,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70681,4,0,0,1,70676,'O','NEW','MDSYS.sdo_model_ftlayer_trig_del
INSTEAD OF DELETE on mdsys.user_sdo_nfe_model_ftlayer_rel
REFERENCING OLD AS o
',null,'DECLARE
  user_name   VARCHAR2(256);
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;

  DELETE FROM MDSYS.SDO_NFE_MODEL_FTLAYER_REL
  WHERE sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name)
    AND model_id = :o.model_id AND feature_layer_id = :o.feature_layer_id;
END;',315,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70682,4,1,0,0,70676,'O','N','MDSYS.sdo_model_ftlayer_trig_upd
INSTEAD OF UPDATE ON mdsys.user_sdo_nfe_model_ftlayer_rel
REFERENCING NEW AS n OLD AS o
',null,'DECLARE
  user_name   VARCHAR2(256);
  path_layer VARCHAR2(1) := ''Y'';
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;

  IF ( :n.path_layer IS NULL OR :n.path_layer != ''Y'' ) THEN
    path_layer := ''N'';
  END IF;

  UPDATE MDSYS.SDO_NFE_MODEL_FTLAYER_REL
    SET ( HIERARCHY_LEVEL,
          Z_ORDER,
          PATH_LAYER  )
        =
        ( SELECT
          :n.hierarchy_level,
          :n.z_order,
          path_layer
          FROM SYS.DUAL )
  WHERE  sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
     AND model_id = :o.model_id AND feature_layer_id = :o.feature_layer_id;
END;',635,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70691,4,0,0,1,70686,'O','NEW','MDSYS.SDO_NFE_WORKSPACE_TRIG_DEL
INSTEAD OF DELETE ON MDSYS.USER_SDO_NFE_MODEL_WORKSPACE
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name   VARCHAR2(256);
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;

  DELETE FROM MDSYS.SDO_NFE_MODEL_WORKSPACE WHERE sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name) AND id = :o.id;

END;',253,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70552,4,1,0,0,70546,'O','N','sdo_network_java_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_java_objects
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  UPDATE sdo_network_constraints
    SET
            (constraint,
       description,
       class_name,
       class,
       java_interface)
      =
            (SELECT
               :n.name,
         :n.description,
         :n.class_name,
         :n.class,
         :n.java_interface
       FROM SYS.DUAL)
    WHERE  sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name)
      AND  constraint = :o.name;
END;',534,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70544,4,0,0,1,70539,'OLD','NEW','mdsys.sdo_network_cons_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_constraints
FOR EACH ROW
',null,'DECLARE
  err_msg      VARCHAR2(200);
  num          NUMBER := -1;
  stmt         VARCHAR2(200);
BEGIN

  stmt := ''select count(*) from sys.dba_java_classes where owner = :owner ''||
   '' and name = :name'';
  execute immediate stmt into num using user, :old.class_name;

  if (num=1) then
    err_msg := ''Java class schema object: ''||:old.class_name||'' exists. Please ''||
      ''drop it first.'';
    mdsys.mderr.raise_md_error(''MD'', ''SDO'', ''13385'', err_msg);
  else
    stmt := ''delete from sdo_network_constraints where sdo_owner = :owner ''||
      '' and class_name = :name'';
    execute immediate stmt using user, :old.class_name;
  end if;

  EXCEPTION
    when others then raise;
END sdo_network_cons_del_trig;',713,1,1,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (71871,2,0,0,0,0,'OLD','NEW','LBACSYS.lbac$after_drop
  AFTER DROP ON DATABASE
  ',null,'BEGIN
   LBACSYS.lbac_events.after_drop(dbms_standard.dictionary_obj_type,
                          dbms_standard.dictionary_obj_name,
                          dbms_standard.dictionary_obj_owner);
  END;',205,0,1048712,128,0,0,null,3,1,17,8,2);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (71872,0,0,0,0,0,'OLD','NEW','LBACSYS.lbac$before_alter
  BEFORE ALTER ON DATABASE
  ',null,'BEGIN
    LBACSYS.lbac_events.before_alter(dbms_standard.dictionary_obj_type,
                             dbms_standard.dictionary_obj_name,
                             dbms_standard.dictionary_obj_owner);
  END;',214,0,1048712,64,0,0,null,3,1,17,8,2);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (71873,2,0,0,0,0,'OLD','NEW','LBACSYS.lbac$after_create
  AFTER CREATE ON DATABASE
  ',null,'BEGIN
  LBACSYS.lbac_events.after_create(dbms_standard.dictionary_obj_type,
                            dbms_standard.dictionary_obj_name,
                            dbms_standard.dictionary_obj_owner);
  END;',210,0,1048712,32,0,0,null,3,1,17,8,2);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63765,1,1,1,0,63762,'OLD','NEW','mdsys.chk_sdo_dimname
  BEFORE INSERT OR UPDATE ON MDSYS.SDO_GEOM_METADATA_TABLE
  FOR EACH ROW
',null,'DECLARE
  cnt   NUMBER;
  res   NUMBER;
BEGIN
  FOR cnt IN 1 .. :NEW.sdo_diminfo.COUNT LOOP



    SELECT REGEXP_INSTR(:NEW.sdo_diminfo(cnt).sdo_dimname, ''[^[:alnum:]_]'')
      INTO res FROM SYS.DUAL;
    IF (res > 0) THEN
      mderr.raise_md_error(''MD'', ''SDO_GEOM_METADATA_TABLE'',-13249,
      ''Only alphanumeric characters and "_" are allowed in SDO_DIMNAME'');
    END IF;

  END LOOP;


  mdsys.mdprvt_gmd.invalidate_geom_metadata(:new.sdo_owner,
                                            :new.sdo_table_name,
                                            :new.sdo_column_name);
END;',587,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (72899,0,1,1,1,72880,'OLD','NEW','secure_employees
  BEFORE INSERT OR UPDATE OR DELETE ON employees
',null,'BEGIN
  secure_dml;
END secure_employees;',41,0,128,0,0,0,null,3,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (72901,3,1,0,0,72880,'OLD','NEW','update_job_history
  AFTER UPDATE OF job_id, department_id ON employees
  FOR EACH ROW
',null,'BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;',123,1,128,0,0,0,null,4,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73074,1,1,1,0,72967,'OLD','NEW','"MD_ADDITIONAL_PROPERTY_TRG" BEFORE INSERT OR UPDATE ON MD_ADDITIONAL_PROPERTIES 
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73075,1,1,1,0,72923,'OLD','NEW','"MD_CATALOGS_TRG" BEFORE INSERT OR UPDATE ON MD_CATALOGS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73076,1,1,1,0,72931,'OLD','NEW','"MD_COLUMNS_TRG" BEFORE INSERT OR UPDATE ON MD_COLUMNS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73077,1,1,1,0,72935,'OLD','NEW','"MD_PARTITIONS_TRG" BEFORE INSERT OR UPDATE ON MD_PARTITIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73078,1,1,1,0,72939,'OLD','NEW','"MD_CONNECTIONS_TRG" BEFORE INSERT OR UPDATE ON MD_CONNECTIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73079,1,1,1,0,73020,'OLD','NEW','"MD_CONSTRAINT_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINT_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73080,1,1,1,0,72953,'OLD','NEW','"MD_CONSTRAINTS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73081,1,1,1,0,72999,'OLD','NEW','"MD_DERIVATIVES_TRG" BEFORE INSERT OR UPDATE ON MD_DERIVATIVES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73082,1,1,1,0,72921,'OLD','NEW','"MD_GROUP_MEMBERS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_MEMBERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73083,1,1,1,0,72963,'OLD','NEW','"MD_GROUPS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUPS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73084,1,1,1,0,72947,'OLD','NEW','"MD_INDEX_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_INDEX_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73085,1,1,1,0,72987,'OLD','NEW','"MD_INDEXES_TRG" BEFORE INSERT OR UPDATE ON MD_INDEXES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73086,1,1,1,0,72949,'OLD','NEW','"MD_OTHER_OBJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_OTHER_OBJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73087,1,1,1,0,72975,'OLD','NEW','"MD_PACKAGES_TRG" BEFORE INSERT OR UPDATE ON MD_PACKAGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63771,4,0,1,0,63766,'OLD','N','MDSYS.SDO_GEOM_TRIG_INS1
INSTEAD OF INSERT ON mdsys.user_sdo_geom_metadata
REFERENCING NEW AS n
FOR EACH ROW
',null,'declare
 tname varchar2(130);
 stmt  varchar2(2048);
 vcount INTEGER;
 dimcount INTEGER;
 tolerance NUMBER;
 dimelement MDSYS.SDO_DIM_ELEMENT;
 idx  number;
 colname  varchar2(1024);
 jsoncol  varchar2(1024);
 jsonpath varchar2(1024);
 nextPos  pls_integer;
BEGIN
  tname := sys_context(''userenv'', ''session_user'');
  colname := nls_upper(:n.column_name);

  if ( (instr(:n.table_name, '' '') > 0 ) OR
       (instr(:n.table_name, '''''''') > 0 ) )  then
   mderr.raise_md_error(''MD'', ''SDO'', -13199,
               ''wrong table name: '' || :n.table_name);
   end if;

  if ((instrb(colname, ''JSON_VALUE'') > 0) and
      (instrb(colname, ''('') > 0) and
      (instrb(colname, '')'') > 0) and
      (instrb(colname, '','') > 0) and
      (instrb(colname, ''RETURNING'') > 0)) then
    colname := mdsys.mdprvt_gmd.get_json_geom_col(colname);
  elsif ( (instr(colname, '' '') > 0 ) OR
          (instr(colname, '''''''') > 0 ) ) then
   mderr.raise_md_error(''MD'', ''SDO'', -13199,
               ''wrong column name: '' || :n.column_name);
   end if;

  stmt :=  ''SELECT count(*) FROM MDSYS.SDO_GEOM_METADATA_TABLE '' ||
  ''WHERE sdo_owner = :tname  AND sdo_table_name = :table_name  ''||
  ''  AND  sdo_column_name = :column_name  '';

EXECUTE IMMEDIATE stmt INTO vcount
   USING tname, nls_upper(:n.table_name), colname;


  IF vcount = 0 THEN
    dimcount :=  :n.diminfo.count;
    FOR idx in 1 .. dimcount LOOP
      dimelement := :n.diminfo(idx);
      tolerance := dimelement.SDO_TOLERANCE;
      if ( (tolerance is NULL) OR (tolerance <= 0) ) then
          mderr.raise_md_error(''MD'', ''SDO'', -13224,
                :n.table_name||''.''||:n.column_name);
      end if;
    END LOOP;

    mdsys.sdo_meta.insert_all_sdo_geom_metadata(tname,
                                                :n.table_name,
                                                colname,
                                                :n.diminfo,
                                                :n.srid);
  ELSE
   mderr.raise_md_error(''MD'', ''SDO'', -13223,
               :n.table_name||''.''||:n.column_name);
 END IF;
END;',2066,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63773,4,0,0,1,63766,'N','NEW','MDSYS.SDO_GEOM_TRIG_DEL1
INSTEAD OF DELETE ON mdsys.user_sdo_geom_metadata
REFERENCING OLD AS n
FOR EACH ROW
',null,'declare
BEGIN

  mdsys.sdo_meta.delete_all_sdo_geom_metadata(sys_context(''userenv'', ''session_user''),
                                              :n.table_name,
                                              :n.column_name);

END;',230,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63774,4,1,0,0,63766,'OLD','N','MDSYS.SDO_GEOM_TRIG_UPD1
INSTEAD OF UPDATE ON mdsys.user_sdo_geom_metadata
REFERENCING OLD AS old NEW AS n
FOR EACH ROW
',null,'declare
BEGIN

  mdsys.sdo_meta.change_all_sdo_geom_metadata(sys_context(''userenv'', ''session_user''),
                                              :old.table_name,
                                              :old.column_name,
                                              :n.table_name,
                                              :n.column_name,
                                              :n.diminfo,
                                              :n.srid);

END;',470,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63801,2,1,1,0,63800,'OLD','NEW','MDSYS.SDO_UNITS_OF_MEASURE_TRIGGER
AFTER
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_UNITS_OF_MEASURE
',null,'DECLARE
  c NUMBER;
BEGIN
  select
    count(*)
  into
    c
  from (
    select
      name
    from
      (
        select unit_of_meas_name name, factor_b, factor_c from mdsys.sdo_units_of_measure
        union
        select short_name        name, factor_b, factor_c from mdsys.sdo_units_of_measure where not short_name is null
      )
    group by
      name
    having
      count(*) > 1
      and
      min(factor_b/factor_c) < max(factor_b/factor_c));

  if(c > 0) then
    MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, ''This unit name/short name has already been defined with another factor or base unit.'');
  end if;

  ------------------------------------------

  select
    count(*)
  into
    c
  from
    mdsys.sdo_units_of_measure uom1,
    mdsys.sdo_units_of_measure uom2
  where
    uom1.target_uom_id = uom2.uom_id and
    not(nls_lower(uom1.unit_of_meas_type) = nls_lower(uom2.unit_of_meas_type));

  if(c > 0) then
    MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, ''Unit and base unit have different types.'');
  end if;

END;',1050,1,128,0,0,0,null,8,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63824,1,1,1,1,63823,'OLD','NEW','MDSYS.SDO_PREFERRED_OPS_SYSTEM_TRIG
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  MDSYS.SDO_PREFERRED_OPS_SYSTEM
FOR EACH ROW
',null,'BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;
END;',52,1,128,0,0,0,null,10,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63856,1,0,1,0,66769,'OLD','NEW','MDSYS.SDO_CS_SRS_SRID_INSERT
BEFORE INSERT ON MDSYS.SDO_CS_SRS
FOR EACH ROW
',null,'BEGIN

  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:new.srid);
END;',72,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63857,3,1,0,1,66769,'OLD','NEW','MDSYS.SDO_CS_SRS_SRID_UPDATE
AFTER UPDATE OR DELETE ON MDSYS.SDO_CS_SRS
FOR EACH ROW
',null,'BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:old.srid);
END;',71,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63858,1,0,1,0,63813,'OLD','NEW','MDSYS.SDO_COORD_REF_SRID_INSERT
BEFORE INSERT ON MDSYS.SDO_COORD_REF_SYS
FOR EACH ROW
',null,'BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:new.srid,
                                                 :new.coord_ref_sys_kind);
END;',145,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63859,3,1,0,1,63813,'OLD','NEW','MDSYS.SDO_COORD_REF_SRID_UPDATE
AFTER UPDATE OR DELETE ON MDSYS.SDO_COORD_REF_SYS
FOR EACH ROW
',null,'BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:old.srid,
                                                 :old.coord_ref_sys_kind);
END;',145,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63883,1,1,1,1,63820,'OLD','NEW','MDSYS.SDO_COORD_OP_METHODS_TRIGGER
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  MDSYS.SDO_COORD_OP_METHODS
FOR EACH ROW
',null,'BEGIN
  MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, ''This cannot change the actual implementation status of a method.'');
END;',129,1,128,0,0,0,null,10,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63884,1,1,1,1,63821,'OLD','NEW','MDSYS.SDO_COORD_OPS_TRIGGER
BEFORE
  INSERT OR
  UPDATE OR
  DELETE
ON
  MDSYS.SDO_COORD_OPS
FOR EACH ROW
',null,'BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;
END;',52,1,128,0,0,0,null,10,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63888,1,1,1,0,63823,'OLD','NEW','MDSYS.SDO_PREFERRED_OPS_SYS_TRIGGER
BEFORE
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_PREFERRED_OPS_SYSTEM
FOR EACH ROW
',null,'DECLARE
  c NUMBER;
BEGIN

  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c < 1) THEN
    IF(:new.COORD_OP_ID > 0) THEN
      MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.COORD_OP_ID || '' does not exist.''));
    ELSE
      SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
      IF(c < 1) THEN
        MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.COORD_OP_ID || '' does not exist, neither does its forward version '' || -:new.COORD_OP_ID || ''.''));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Elementary operation '' || -:new.COORD_OP_ID || '' is not reversible.''));
        ELSE
          dbms_output.put_line(''Concatenated operation '' || -:new.COORD_OP_ID || '' is not reversible, because of its following elementary component(s):'');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                MDSYS.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.COORD_OP_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                MDSYS.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line(''Elementary operation '' || (-CULPRIT.COORD_OP_ID) || '' is not reversible.'');
            END LOOP;
          END FIND_CULPRITS;

          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Concatenated operation '' || -:new.COORD_OP_ID || '' is not reversible.''));
        END IF;
      END IF;
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c = 0) THEN
    MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.COORD_OP_ID || '' is not implemented.''));
  END IF;
END;',2225,1,128,0,0,0,null,9,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63890,1,1,1,0,63825,'OLD','NEW','MDSYS.SDO_PREFERRED_OPS_USER_TRIGGER
BEFORE
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_PREFERRED_OPS_USER
FOR EACH ROW
',null,'DECLARE
  c NUMBER;
BEGIN

  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c < 1) THEN
    IF(:new.COORD_OP_ID > 0) THEN
      MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.COORD_OP_ID || '' does not exist.''));
    ELSE
      SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
      IF(c < 1) THEN
        MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.COORD_OP_ID || '' does not exist, neither does its forward version '' || -:new.COORD_OP_ID || ''.''));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.COORD_OP_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Elementary operation '' || -:new.COORD_OP_ID || '' is not reversible.''));
        ELSE
          dbms_output.put_line(''Concatenated operation '' || -:new.COORD_OP_ID || '' is not reversible, because of its following elementary component(s):'');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                MDSYS.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.COORD_OP_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                MDSYS.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line(''Elementary operation '' || (-CULPRIT.COORD_OP_ID) || '' is not reversible.'');
            END LOOP;
          END FIND_CULPRITS;

          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Concatenated operation '' || -:new.COORD_OP_ID || '' is not reversible''));
        END IF;
      END IF;
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO c FROM MDSYS.SDO_AVAILABLE_OPS WHERE COORD_OP_ID = :new.COORD_OP_ID;
  IF(c = 0) THEN
    MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.COORD_OP_ID || '' is not implemented.''));
  END IF;
END;',2224,1,128,0,0,0,null,9,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63891,1,1,1,0,63826,'OLD','NEW','MDSYS.SDO_COORD_OP_PATHS_TRIGGER
BEFORE
  INSERT OR
  UPDATE
ON
  MDSYS.SDO_COORD_OP_PATHS
FOR EACH ROW
',null,'DECLARE
  c NUMBER;
  is_impl_single NUMBER;
  is_impl_concat NUMBER;
BEGIN

  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
  IF(c < 1) THEN
    SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
    IF(c < 1) THEN
      IF(:new.CONCAT_OPERATION_ID > 0) THEN
        MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.CONCAT_OPERATION_ID || '' does not exist.''));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = -:new.CONCAT_OPERATION_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.CONCAT_OPERATION_ID || '' does not exist, neither does its forward version '' || -:new.CONCAT_OPERATION_ID || ''.''));
        ELSE
          dbms_output.put_line(''Concatenated operation '' || -:new.CONCAT_OPERATION_ID || '' is not reversible, because of its following elementary component(s):'');

          <<FIND_CULPRITS>>
          DECLARE
            CURSOR CULPRITS IS
              SELECT
                -PATHS.SINGLE_OPERATION_ID "COORD_OP_ID"
              FROM
                MDSYS.SDO_COORD_OP_PATHS PATHS
              WHERE
                PATHS.CONCAT_OPERATION_ID = -:new.CONCAT_OPERATION_ID
              MINUS
              SELECT
                COORD_OP_ID
              FROM
                MDSYS.SDO_AVAILABLE_OPS;
            CULPRIT CULPRITS%ROWTYPE;
          BEGIN
            FOR CULPRIT IN CULPRITS LOOP
              dbms_output.put_line(''Elementary operation '' || (-CULPRIT.COORD_OP_ID) || '' is not reversible.'');
            END LOOP;
          END FIND_CULPRITS;

          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Concatenated operation '' || -:new.CONCAT_OPERATION_ID || '' is not reversible''));
        END IF;
      END IF;
    ELSE
      MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.CONCAT_OPERATION_ID || '' is an elementary operation, not a concatenated one.''));
    END IF;
  END IF;

  SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
  IF(c < 1) THEN
    SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
    IF(c < 1) THEN
      IF(:new.SINGLE_OPERATION_ID > 0) THEN
        MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.SINGLE_OPERATION_ID || '' does not exist.''));
      ELSE
        SELECT COUNT(COORD_OP_ID) INTO c FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = -:new.SINGLE_OPERATION_ID;
        IF(c < 1) THEN
          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.SINGLE_OPERATION_ID || '' does not exist, neither does its forward version '' || -:new.SINGLE_OPERATION_ID || ''.''));
        ELSE
          MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || -:new.SINGLE_OPERATION_ID || '' is not reversible.''));
        END IF;
      END IF;
    ELSE
      MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (''Operation '' || :new.SINGLE_OPERATION_ID || '' is a concatenated operation, not an elementary one.''));
    END IF;
  END IF;

  SELECT IS_IMPLEMENTED INTO is_impl_single FROM MDSYS.SDO_AVAILABLE_ELEM_OPS WHERE COORD_OP_ID = :new.SINGLE_OPERATION_ID;
  IF(is_impl_single = 0) THEN
    SELECT IS_IMPLEMENTED INTO is_impl_concat FROM MDSYS.SDO_AVAILABLE_NON_ELEM_OPS WHERE COORD_OP_ID = :new.CONCAT_OPERATION_ID;
    IF(is_impl_concat = 1) THEN
      MDSYS.MDERR.RAISE_MD_ERROR(''MD'', ''SDO'', -13199, (
        ''Single operation '' || :new.SINGLE_OPERATION_ID ||
        '' is not implemented. Then concatenated operation '' || :new.CONCAT_OPERATION_ID ||
        '' cannot be, neither.''));
    END IF;
  END IF;
END;',3883,1,128,0,0,0,null,9,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63961,3,1,0,1,63960,'OLD','NEW','MDSYS.SDO_CRS_GEOG_SRID_UPDATE
AFTER UPDATE OR DELETE ON MDSYS.SDO_CRS_GEOGRAPHIC_PLUS_HEIGHT
FOR EACH ROW
',null,'BEGIN
  mdsys.mdprvt_srid.sdo_invalidate_srid_metadata(:old.srid);
END;',71,1,128,0,0,0,null,4,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (63962,4,1,1,1,63843,'OLD','NEW','MDSYS.CS_SRS_TRIGGER
INSTEAD OF
  UPDATE OR
  INSERT OR
  DELETE
ON
  MDSYS.CS_SRS
FOR EACH ROW
',null,'BEGIN
  MDSYS.sdo_cs.sdo_cs_context_invalidate;

  if(not(:old.srid is null)) then
    delete from mdsys.sdo_coord_ref_system crs where crs.srid = :old.srid;
  end if;
  if(not(:new.srid is null)) then
    if(nls_upper(trim(:new.wktext)) like ''GEOGCS%'') then
      declare
        datum_id2 number := sdo_cs.find_datum_id(:new.WKTEXT, null);
      begin
        insert into mdsys.sdo_coord_ref_system (
          SRID,
          COORD_REF_SYS_NAME,
          COORD_REF_SYS_KIND,
          COORD_SYS_ID,
          DATUM_ID,
          GEOG_CRS_DATUM_ID,
          SOURCE_GEOG_SRID,
          PROJECTION_CONV_ID,
          CMPD_HORIZ_SRID,
          CMPD_VERT_SRID,
          INFORMATION_SOURCE,
          DATA_SOURCE,
          IS_LEGACY,
          LEGACY_CODE,
          LEGACY_WKTEXT,
          LEGACY_CS_BOUNDS,
          IS_VALID,
          SUPPORTS_SDO_GEOMETRY)
        values(
          :new.SRID,
          :new.CS_NAME,
          ''GEOGRAPHIC2D'',
          null,
          datum_id2, --1000000123,
          datum_id2, --1000000123,
          null,
          null,
          null,
          null,
          :new.AUTH_NAME,
          null,
          ''TRUE'',
          null,
          :new.WKTEXT,
          :new.CS_BOUNDS,
          ''TRUE'',
          ''TRUE'');
      end;
    else
      insert into mdsys.sdo_coord_ref_system (
        SRID,
        COORD_REF_SYS_NAME,
        COORD_REF_SYS_KIND,
        COORD_SYS_ID,
        DATUM_ID,
        GEOG_CRS_DATUM_ID,
        SOURCE_GEOG_SRID,
        PROJECTION_CONV_ID,
        CMPD_HORIZ_SRID,
        CMPD_VERT_SRID,
        INFORMATION_SOURCE,
        DATA_SOURCE,
        IS_LEGACY,
        LEGACY_CODE,
        LEGACY_WKTEXT,
        LEGACY_CS_BOUNDS,
        IS_VALID,
        SUPPORTS_SDO_GEOMETRY)
      values(
        :new.SRID,
        :new.CS_NAME,
        ''PROJECTED'',
        null,
        null,
        sdo_cs.find_datum_id(:new.WKTEXT, null), --1000000123,
        1000000123,
        null,
        null,
        null,
        :new.AUTH_NAME,
        null,
        ''TRUE'',
        null,
        :new.WKTEXT,
        :new.CS_BOUNDS,
        ''TRUE'',
        ''TRUE'');
    end if;
  end if;
END;',2160,1,1,0,0,0,null,10,2,9,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70571,4,1,0,0,70565,'O','N','mdsys.sdo_network_ud_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_user_data
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
  no           number ;
  table_name       VARCHAR2(130);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  -- check if network already exists in the networkwork metadata
  EXECUTE IMMEDIATE
        ''SELECT COUNT(*) FROM sdo_network_metadata_table '' ||
        ''  where sdo_owner = :owner AND NLS_UPPER(network) = :net '' into no using sdo_util.get_quoted_name(user_name), NLS_UPPER(:n.network);

  IF ( no = 0 ) THEN
   mderr.raise_md_error(''MD'', ''SDO'', -13385,
           user_name||''.''||:n.network || '' NOT IN NETWORK METADATA!'');
  END IF;

  UPDATE sdo_network_user_data
    SET
      (
       network,
       table_type,
       data_name,
       data_type,
       data_length,
       category_id)
      =
      (SELECT
         NLS_UPPER(:n.network),
         NLS_UPPER(:n.table_type),
         NLS_UPPER(:n.data_name),
         NLS_UPPER(:n.data_type),
         :n.data_length,
         :n.category_id
       FROM SYS.DUAL)
    WHERE  sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name)
      AND  NLS_UPPER(network)    = NLS_UPPER(:o.network)
      AND  NLS_UPPER(table_type) = NLS_UPPER(:o.table_type)
      AND  NLS_UPPER(data_name)  = NLS_UPPER(:o.data_name);
END;',1249,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73088,1,1,1,0,73011,'OLD','NEW','"MD_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73089,1,1,1,0,72943,'OLD','NEW','"MD_PROJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_PROJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73090,1,1,1,0,72993,'OLD','NEW','"MD_SCHEMAS_TRG" BEFORE INSERT OR UPDATE ON MD_SCHEMAS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73091,1,1,1,0,72927,'OLD','NEW','"MD_SEQUENCES_TRG" BEFORE INSERT OR UPDATE ON MD_SEQUENCES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73092,1,1,1,0,73024,'OLD','NEW','"MD_STORED_PROGRAMS_TRG" BEFORE INSERT OR UPDATE ON MD_STORED_PROGRAMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73093,1,1,1,0,73001,'OLD','NEW','"MD_SYNONYMS_TRG" BEFORE INSERT OR UPDATE ON MD_SYNONYMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73094,1,1,1,0,72971,'OLD','NEW','"MD_TABLES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73095,1,1,1,0,72910,'OLD','NEW','"MD_TABLESPACES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLESPACES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73096,1,1,1,0,73005,'OLD','NEW','"MD_TRIGGERS_TRG" BEFORE INSERT OR UPDATE ON MD_TRIGGERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73097,1,1,1,0,72957,'OLD','NEW','"MD_USER_DEFINED_DATA_TYPES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_DEFINED_DATA_TYPES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73098,1,1,1,0,72917,'OLD','NEW','"MD_USERS_TRG" BEFORE INSERT OR UPDATE ON MD_USERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73099,1,1,1,0,72983,'OLD','NEW','"MD_VIEWS_TRG" BEFORE INSERT OR UPDATE ON MD_VIEWS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73100,1,1,1,0,72981,'OLD','NEW','"MD_GROUP_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73101,1,1,1,0,72914,'OLD','NEW','"MD_USER_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73102,3,0,0,1,72971,'OLD','NEW','"DEL_MD_TRIGGERS_T_TRG" AFTER DELETE ON MD_TABLES 
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''T'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73103,3,0,0,1,72983,'OLD','NEW','"DEL_MD_TRIGGERS_V_TRG" AFTER DELETE ON MD_VIEWS
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''V'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73104,1,1,1,0,72902,'OLD','NEW','"INS_APPLICATION_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73105,1,1,1,0,72904,'OLD','NEW','"INS_APPLICATIONFILE_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONFILES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73106,1,1,1,0,72908,'OLD','NEW','"INS_FILE_ARTIFACT_TRG" BEFORE INSERT OR UPDATE ON MD_FILE_ARTIFACTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73107,1,1,1,0,72969,'OLD','NEW','"MIGRLOG_TRG" BEFORE INSERT OR UPDATE ON MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73108,1,1,1,0,72961,'OLD','NEW','"MIGR_DATATYPE_MAP_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_MAP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73109,1,1,1,0,72991,'OLD','NEW','"MIGR_DATATYPE_RULE_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_RULE
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73110,1,1,1,0,72945,'OLD','NEW','"MD_MIGR_PARAMETER_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_PARAMETER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70690,4,0,1,0,70686,'OLD','N','MDSYS.SDO_NFE_WORKSPACE_TRIG_INS
INSTEAD OF INSERT ON MDSYS.USER_SDO_NFE_MODEL_WORKSPACE
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name   VARCHAR2(256);
  ws_id       NUMBER;
  mbr_ind     CHAR(1) := ''Y'';
  lock_ind    CHAR(1) := ''Y'';
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;
  -- find out the workspace ID from WS ID sequence
  EXECUTE IMMEDIATE ''SELECT SDO_NFE_WORKSPACE_ID_SEQ.nextval FROM SYS.DUAL'' INTO ws_id;

  IF ( :n.mbr_ind IS NULL OR ''Y'' != NLS_UPPER(:n.mbr_ind) ) THEN
    mbr_ind := ''N'';
  END IF;

  IF ( :n.lock_ind IS NULL OR ''Y'' != NLS_UPPER(:n.lock_ind) ) THEN
    lock_ind := ''N'';
  END IF;

  INSERT INTO MDSYS.SDO_NFE_MODEL_WORKSPACE
        (
         SDO_OWNER,
         id,
         model_id,
         workspace,
         mbr_ind,
         lower_x,
         upper_x,
         lower_y,
         upper_y,
         lock_ind
        )
  VALUES
        (
         sdo_util.get_quoted_name(user_name),
         ws_id,
         :n.model_id,
         NLS_UPPER(:n.workspace),
         mbr_ind,
         :n.lower_x,
         :n.upper_x,
         :n.lower_y,
         :n.upper_y,
         lock_ind
        );
END;',1040,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70671,4,0,1,0,70667,'OLD','N','MDSYS.SDO_NFE_MODEL_TRIG_INS
INSTEAD OF INSERT ON MDSYS.USER_SDO_NFE_MODEL_METADATA
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name     VARCHAR2(256);
  model_id      NUMBER;
  edition_mode  NUMBER := 1;
  versionable   VARCHAR2(1) := ''N'';
  tabs_tab_name VARCHAR2(32) := ''TABLE_REGISTRY_'';
  seqs_tab_name VARCHAR2(35) := ''SEQUENCE_REGISTRY_'';
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;
  -- find out the model ID from model ID sequence
  EXECUTE IMMEDIATE ''SELECT SDO_NFE_MODEL_ID_SEQ.nextval FROM SYS.DUAL'' INTO model_id;

  -- Allow just two types of edition mode (1-From Scratch, 2-From Existing Network)
  IF ( edition_mode != :n.edition_mode ) THEN
    edition_mode := 2;
  END IF;

  IF ( :n.versionable_ind IS NOT NULL  AND  :n.versionable_ind = ''Y'' ) THEN
    versionable := ''Y'';
  END IF;

  IF ( :n.table_reg_tab IS NOT NULL ) THEN
    tabs_tab_name := :n.table_reg_tab;
  ELSE
    tabs_tab_name := tabs_tab_name || model_id;
  END IF;

  IF ( :n.sequence_reg_tab IS NOT NULL ) THEN
    seqs_tab_name := :n.sequence_reg_tab;
  ELSE
    seqs_tab_name := seqs_tab_name || model_id;
  END IF;

  -- insert model metadata and model id into SDO_NFE_MODEL_METADATA_TABLE
  INSERT INTO MDSYS.SDO_NFE_MODEL_METADATA_TABLE
        (
         SDO_OWNER,
         ID,
         NAME,
         EDITION_MODE,
         VERSIONABLE_IND,
         TABLE_REG_TAB,
         SEQUENCE_REG_TAB,
         NETWORK_NAME
        )
        values
        (
          user_name,
          model_id,
          NLS_UPPER(:n.name),
          edition_mode,
          versionable,
          NLS_UPPER(tabs_tab_name),
          NLS_UPPER(seqs_tab_name),
          NLS_UPPER(:n.network_name)
        );
END;',1598,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73111,1,1,1,0,73009,'OLD','NEW','"MD_MIGR_DEPENDENCY_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_DEPENDENCY
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73112,1,1,1,0,73018,'OLD','NEW','"MD_MIGR_WEAKDEP_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_WEAKDEP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70680,4,0,1,0,70676,'OLD','N','MDSYS.sdo_model_ftlayer_trig_ins
INSTEAD OF INSERT ON mdsys.user_sdo_nfe_model_ftlayer_rel
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name VARCHAR2(256);
  path_layer VARCHAR2(1) := ''Y'';
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;

  IF ( :n.path_layer IS NULL OR :n.path_layer != ''Y'' ) THEN
    path_layer := ''N'';
  END IF;

  INSERT INTO MDSYS.SDO_NFE_MODEL_FTLAYER_REL
        (
         SDO_OWNER,
         MODEL_ID,
         feature_layer_id,
         hierarchy_level,
         z_order,
         path_layer
        )
        values
        (
          user_name,
          :n.model_id,
          :n.feature_layer_id,
          :n.hierarchy_level,
          :n.z_order,
          path_layer
        );
END;',617,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73113,1,1,1,0,73015,'OLD','NEW','"MIGR_GENERATION_ORDER_TRG" BEFORE INSERT OR UPDATE ON MIGR_GENERATION_ORDER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73114,1,1,1,0,73039,'OLD','NEW','"STAGE_MIGRLOG_ID_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73115,1,1,1,0,73039,'OLD','NEW','"STAGE_MIGRLOG_LOG_DATE_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.log_date is null then
        :new.log_date := systimestamp;
    end if;
END;
',108,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73140,1,0,1,0,73139,'OLD','NEW','"GENCONNKEYTRIG" 
					BEFORE INSERT ON stage_serverdetail 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.project_id is null THEN
					     :new.project_id := MD_META.get_next_id;
					  END IF;
					  IF :new.svrid is null THEN
					     :new.svrid := MD_META.get_next_id;     
					  END IF;    
					END GenConnKeyTrig;
',238,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73163,1,0,1,0,73141,'OLD','NEW','"GENDBKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysdatabases 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.dbid_gen is null THEN
					     :new.dbid_gen := MD_META.get_next_id;
					  END IF;
					END GenDbKeyTrig;
',129,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73164,1,0,1,0,73143,'OLD','NEW','"GENOBJECTKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysobjects
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.objid_gen is null THEN
					     :new.objid_gen := MD_META.get_next_id;
					  END IF;
					END GenObjectKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73165,1,0,1,0,73142,'OLD','NEW','"GENSCHEMAKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysusers
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.suid_gen is null THEN
					     :new.suid_gen := MD_META.get_next_id;
					  END IF;
					END GenSchemaKeyTrig;
',133,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73166,1,0,1,0,73144,'OLD','NEW','"GENCOLUMNKEYTRIG" 
					BEFORE INSERT ON stage_syb12_syscolumns
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.colid_gen is null THEN
					     :new.colid_gen := MD_META.get_next_id;
					  END IF;
					END GenColumnKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73167,1,0,1,0,73147,'OLD','NEW','GenIndexKeyTrig 
					BEFORE INSERT ON stage_syb12_sysindexes
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.indid_gen is null THEN
					     :new.indid_gen := MD_META.get_next_id;
					  END IF;
                    END GenIndexKeyTrig;
',149,1,128,0,0,0,null,4,1,9,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73321,1,0,1,0,73178,'OLD','NEW','"GENSS2K5FORKEYRIG" BEFORE
  INSERT ON STAGE_SS2K5_FN_KEYS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5ForKeyTrig;
',116,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73323,1,0,1,0,73181,'OLD','NEW','"GENSS2K5INDEXTRIG" BEFORE
  INSERT ON STAGE_SS2K5_INDEXES FOR EACH ROW ',null,'BEGIN IF :new.object_id_gen IS NULL THEN :new.object_id_gen := MD_META.get_next_id;
END IF;
END Genss2k5IndexTrig;
',115,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73324,1,0,1,0,73183,'OLD','NEW','"GENSS2K5SQLMODTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlModTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64099,4,0,1,0,64094,'OLD','N','MDSYS.SDO_LRS_TRIG_INS
INSTEAD OF INSERT ON mdsys.user_sdo_lrs_metadata
REFERENCING NEW AS n
FOR EACH ROW
',null,'declare
 user_name      varchar2(130);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  if ( (instr(:n.table_name, '' '') > 0) OR
       (instr(:n.table_name, '''''''') > 0)  ) then
   mderr.raise_md_error(''MD'', ''SDO'', -13223,
               :n.table_name||''.''||:n.column_name);
   end if;

  if ( (instr(:n.column_name, '' '') > 0) OR
   (instr(:n.column_name, '''''''') > 0)  ) then
   mderr.raise_md_error(''MD'', ''SDO'', -13223,
               :n.table_name||''.''||:n.column_name);
   end if;

/*
  stmt :=  ''SELECT count(*) FROM MDSYS.SDO_LRS_METADATA_TABLE '' ||
  '' WHERE sdo_owner = ''''''   || sdo_util.get_quoted_name(user_name) || ''''''  '' ||
  ''  AND  sdo_table_name = ''''''  || nls_upper(replace(:n.table_name,'''''''',''''))
   || '''''' '' ||
 '' AND  sdo_column_name = '''''' || nls_upper(replace(:n.column_name,'''''''',''''))|| '''''' '';
  */

  stmt :=  ''SELECT count(*) FROM MDSYS.SDO_LRS_METADATA_TABLE '' ||
  '' WHERE sdo_owner = :owner  AND  sdo_table_name =  :tab '' ||
  '' AND  sdo_column_name = :col '';

 EXECUTE IMMEDIATE stmt INTO vcount
    USING  sdo_util.get_quoted_name(user_name), nls_upper(:n.table_name), nls_upper(:n.column_name) ;

  IF vcount = 0 THEN
    INSERT INTO MDSYS.sdo_lrs_metadata_table values
             (sdo_util.get_quoted_name(user_name), nls_upper(:n.table_name), nls_upper(:n.column_name), :n.dim_pos, nls_upper(:n.dim_unit));
  ELSE
   mderr.raise_md_error(''MD'', ''SDO'', -13223,
           user_name||''.''||:n.table_name);
 END IF;
END;',1515,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (64101,4,1,0,0,64094,'OLD','N','MDSYS.SDO_LRS_TRIG_UPD
INSTEAD OF UPDATE ON mdsys.user_sdo_lrs_metadata
REFERENCING OLD AS old NEW AS n
FOR EACH ROW
',null,'declare
 user_name      varchar2(130);
 stmt           varchar2(2048);
 vcount         INTEGER;
BEGIN


   user_name := sys_context(''userenv'', ''session_user'');
    UPDATE MDSYS.sdo_lrs_metadata_table
    SET (SDO_TABLE_NAME, SDO_COLUMN_NAME, SDO_DIM_POS, SDO_DIM_UNIT)  =
     (SELECT nls_upper(:n.table_name), nls_upper(:n.column_name),:n.dim_pos, nls_upper(:n.dim_unit) FROM SYS.DUAL)
    WHERE SDO_OWNER       = sdo_util.get_quoted_name(user_name)
      AND SDO_TABLE_NAME  = nls_upper(:old.table_name)
      AND SDO_COLUMN_NAME = nls_upper(:old.column_name);
END;',567,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70692,4,1,0,0,70686,'O','N','MDSYS.SDO_NFE_WORKSPACE_TRIG_UPD
INSTEAD OF UPDATE ON MDSYS.USER_SDO_NFE_MODEL_WORKSPACE
REFERENCING NEW AS n OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name   VARCHAR2(256);
  mbr_ind     CHAR(1) := ''Y'';
  lock_ind    CHAR(1) := ''Y'';
BEGIN
  EXECUTE IMMEDIATE ''SELECT user FROM SYS.DUAL'' INTO user_name;

  IF ( :n.mbr_ind IS NULL OR ''Y'' != NLS_UPPER(:n.mbr_ind) ) THEN
    mbr_ind := ''N'';
  END IF;

  IF ( :n.lock_ind IS NULL OR ''Y'' != NLS_UPPER(:n.lock_ind) ) THEN
    lock_ind := ''N'';
  END IF;

  UPDATE MDSYS.SDO_NFE_MODEL_WORKSPACE
    SET (
         model_id,
         workspace,
         mbr_ind,
         lower_x,
         upper_x,
         lower_y,
         upper_y,
         lock_ind
        ) =
        ( SELECT
         :n.model_id,
         NLS_UPPER(:n.workspace),
         mbr_ind,
         :n.lower_x,
         :n.upper_x,
         :n.lower_y,
         :n.upper_y,
         lock_ind
         FROM SYS.DUAL)
  WHERE  sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name)
     AND id = :o.id;
END;',896,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73322,1,0,1,0,73179,'OLD','NEW','"GENSS2K5IDENTCOLRIG" BEFORE
  INSERT ON STAGE_SS2K5_IDENTITY_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5IdentColTrig;
',118,1,128,0,0,0,null,2,1,10,0,54);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73325,1,0,1,0,73183,'OLD','NEW','"GENSS2K5SQLTABTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlTabTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73326,1,0,1,0,73188,'OLD','NEW','"GENSS2K5DEFCONSTTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DT_CONSTRAINTS FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5DefConstTrig;
',110,1,128,0,0,0,null,2,1,10,0,52);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73327,1,0,1,0,73170,'OLD','NEW','"GENSS2K5DB2KEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DATABASES FOR EACH ROW ',null,'BEGIN IF :new.dbid_gen IS NULL THEN :new.dbid_gen := MD_META.get_next_id;
END IF;
END Genss2k5Db2KeyTrig;
',106,1,128,0,0,0,null,2,1,10,0,47);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73328,1,0,1,0,73174,'OLD','NEW','"GENSS2K5OBJECTKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_OBJECTS FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ObjectKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73329,1,0,1,0,73171,'OLD','NEW','"GENSS2K5SCHEMATAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMATA FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemayaKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,46);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73330,1,0,1,0,73175,'OLD','NEW','"GENSS2K5SCHEMAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMAS FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemaKeyTrig;
',109,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73331,1,0,1,0,73172,'OLD','NEW','"GENSS2K5COLUMNKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.colid_gen IS NULL THEN :new.colid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ColumnKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73332,1,0,1,0,73173,'OLD','NEW','Genss2k5DatabasePrincipalTrig BEFORE
  INSERT ON STAGE_SS2K5_DB_PRINCIPALS FOR EACH ROW ',null,'BEGIN IF :new.prinid_gen IS NULL THEN :new.prinid_gen := MD_META.get_next_id;
END IF;
END Genss2k5DatabasePrincipalTrig;
',121,1,128,0,0,0,null,2,1,9,0,51);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73333,1,0,1,0,73186,'OLD','NEW','Genss2k5ChkConstTrig BEFORE
  INSERT ON STAGE_SS2K5_TABLES FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ChkConstTrig;
',110,1,128,0,0,0,null,2,1,9,0,44);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73386,1,0,1,0,73337,'OLD','NEW','"TDATA_GENSCHEMAKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_DATABASES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENSCHEMAKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70528,4,0,1,0,70523,'OLD','N','SDO_NETWORK_TRIG_INS
INSTEAD OF INSERT ON MDSYS.USER_SDO_NETWORK_METADATA
REFERENCING NEW AS n
FOR EACH ROW
',null,'declare
 user_name varchar2(130);
 net_id number;
 no_of_partitions number := 0;
 no_of_hierarchy_levels number := 1;
 direction    VARCHAR2(12);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  -- find out the network ID from network ID sequence
  EXECUTE IMMEDIATE ''SELECT sdo_ndm_network_id_seq.nextval FROM SYS.DUAL'' INTO net_id;

  -- insert network metadata and network ID into SDO_NETWORK_METADATA_TABLE

  IF ( :n.no_of_partitions is NOT null ) THEN
        no_of_partitions :=  :n.no_of_partitions;
  END IF;

  IF ( :n.no_of_hierarchy_levels is NOT null ) THEN
        no_of_hierarchy_levels :=  :n.no_of_hierarchy_levels;
  END IF;

  -- change bidirected to undirected
  direction := :n.link_direction ;

  IF ( NLS_UPPER(direction) = ''BIDIRECTED'' ) THEN
    direction := ''UNDIRECTED'';
  END IF ;

  insert into SDO_NETWORK_METADATA_TABLE
        (
         SDO_OWNER,
         NETWORK,
         NETWORK_ID,
         NETWORK_CATEGORY,
         GEOMETRY_TYPE,
         NETWORK_TYPE,
         NO_OF_HIERARCHY_LEVELS,
         NO_OF_PARTITIONS,
         LRS_TABLE_NAME,
         LRS_GEOM_COLUMN,
         NODE_TABLE_NAME,
         NODE_GEOM_COLUMN,
         NODE_COST_COLUMN,
         NODE_PARTITION_COLUMN,
         NODE_DURATION_COLUMN,
         LINK_TABLE_NAME,
         LINK_GEOM_COLUMN,
         LINK_DIRECTION,
         LINK_COST_COLUMN,
         LINK_PARTITION_COLUMN,
         LINK_DURATION_COLUMN,
         PATH_TABLE_NAME,
         PATH_GEOM_COLUMN,
         PATH_LINK_TABLE_NAME,
         SUBPATH_TABLE_NAME,
         SUBPATH_GEOM_COLUMN,
         PARTITION_TABLE_NAME,
         PARTITION_BLOB_TABLE_NAME,
         COMPONENT_TABLE_NAME,
         NODE_LEVEL_TABLE_NAME,
         TOPOLOGY,
         USER_DEFINED_DATA,
         EXTERNAL_REFERENCES,
         CHILD_NETWORK,
         HIERARCHY_TABLE_NAME
        )
        values
        (
         sdo_util.get_quoted_name(user_name),
         NLS_UPPER(:n.network),
         net_id,
         NLS_UPPER(:n.network_category),
         NLS_UPPER(:n.geometry_type),
         NLS_UPPER(:n.network_type),
         no_of_hierarchy_levels,
         no_of_partitions,
         NLS_UPPER(:n.lrs_table_name),
         NLS_UPPER(:n.lrs_geom_column),
         NLS_UPPER(:n.node_table_name),
         NLS_UPPER(:n.node_geom_column),
         NLS_UPPER(:n.node_cost_column),
         NLS_UPPER(:n.node_partition_column),
         NLS_UPPER(:n.node_duration_column),
         NLS_UPPER(:n.link_table_name),
         NLS_UPPER(:n.link_geom_column),
         NLS_UPPER(direction),
         NLS_UPPER(:n.link_cost_column),
         NLS_UPPER(:n.link_partition_column),
         NLS_UPPER(:n.link_duration_column),
         NLS_UPPER(:n.path_table_name),
         NLS_UPPER(:n.path_geom_column),
         NLS_UPPER(:n.path_link_table_name),
         NLS_UPPER(:n.subpath_table_name),
         NLS_UPPER(:n.subpath_geom_column),
         NLS_UPPER(:n.partition_table_name),
         NLS_UPPER(:n.partition_blob_table_name),
         NLS_UPPER(:n.component_table_name),
         NLS_UPPER(:n.node_level_table_name),
         NLS_UPPER(:n.topology),
         NLS_UPPER(:n.user_defined_data),
         NLS_UPPER(:n.external_references),
         NLS_UPPER(:n.child_network),
         NLS_UPPER(:n.hierarchy_table_name)
        );
   -- register NDM feature usage when inserting a NDM network metadata in 12c and beyond
         IF ( to_number(substr(sdo_version,1, instr(sdo_version,''.'')-1)) >= 12 ) then
           execute immediate ''BEGIN mdsys.mdprvt_feature.sdo_register_feature(''''NDM'''',''''YES''''); END;'';
         END IF;

END;',3589,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70530,4,1,0,0,70523,'O','N','SDO_NETWORK_TRIG_UPD
INSTEAD OF UPDATE ON mdsys.user_sdo_network_metadata
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
  direction    VARCHAR2(12);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  direction := :n.link_direction ;
  IF ( nls_upper(direction) = ''BIDIRECTED'' ) THEN
    direction := ''UNDIRECTED'';
  END IF;


  UPDATE sdo_network_metadata_table
    SET (NETWORK,
         NETWORK_CATEGORY,
         GEOMETRY_TYPE,
         NETWORK_TYPE,
         NO_OF_HIERARCHY_LEVELS,
         NO_OF_PARTITIONS,
         LRS_TABLE_NAME,
         LRS_GEOM_COLUMN,
         NODE_TABLE_NAME,
         NODE_GEOM_COLUMN,
         NODE_COST_COLUMN,
         NODE_PARTITION_COLUMN,
         NODE_DURATION_COLUMN,
         LINK_TABLE_NAME,
         LINK_GEOM_COLUMN,
         LINK_DIRECTION,
         LINK_COST_COLUMN,
         LINK_PARTITION_COLUMN,
         LINK_DURATION_COLUMN,
         PATH_TABLE_NAME,
         PATH_GEOM_COLUMN,
         PATH_LINK_TABLE_NAME,
         SUBPATH_TABLE_NAME,
         SUBPATH_GEOM_COLUMN,
         PARTITION_TABLE_NAME,
         PARTITION_BLOB_TABLE_NAME,
         COMPONENT_TABLE_NAME,
         NODE_LEVEL_TABLE_NAME,
         TOPOLOGY,
         USER_DEFINED_DATA,
         EXTERNAL_REFERENCES,
         CHILD_NETWORK,
         HIERARCHY_TABLE_NAME
        ) =
        ( SELECT
         NLS_UPPER(:n.network),
         NLS_UPPER(:n.network_category),
         NLS_UPPER(:n.geometry_type),
         NLS_UPPER(:n.network_type),
         :n.no_of_hierarchy_levels,
         :n.no_of_partitions,
         NLS_UPPER(:n.lrs_table_name),
         NLS_UPPER(:n.lrs_geom_column),
         NLS_UPPER(:n.node_table_name),
         NLS_UPPER(:n.node_geom_column),
         NLS_UPPER(:n.node_cost_column),
         NLS_UPPER(:n.node_partition_column),
         NLS_UPPER(:n.node_duration_column),
         NLS_UPPER(:n.link_table_name),
         NLS_UPPER(:n.link_geom_column),
         NLS_UPPER(direction),
         NLS_UPPER(:n.link_cost_column),
         NLS_UPPER(:n.link_partition_column),
         NLS_UPPER(:n.link_duration_column),
         NLS_UPPER(:n.path_table_name),
         NLS_UPPER(:n.path_geom_column),
         NLS_UPPER(:n.path_link_table_name),
         NLS_UPPER(:n.subpath_table_name),
         NLS_UPPER(:n.subpath_geom_column),
         NLS_UPPER(:n.partition_table_name),
         NLS_UPPER(:n.partition_blob_table_name),
         NLS_UPPER(:n.component_table_name),
         NLS_UPPER(:n.node_level_table_name),
         NLS_UPPER(:n.topology),
         NLS_UPPER(:n.user_defined_data),
         NLS_UPPER(:n.external_references),
         NLS_UPPER(:n.child_network),
         NLS_UPPER(:n.hierarchy_table_name)
         FROM SYS.DUAL )
  WHERE  sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
     AND NLS_UPPER(NETWORK)    = NLS_UPPER(:o.network);

END;',2760,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70543,4,0,1,0,70539,'OLD','N','sdo_network_cons_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_constraints
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
  err_msg         VARCHAR2(200);
  num             NUMBER := -1;
  stmt            VARCHAR2(200);
BEGIN

  --stmt := ''select count(*) from sys.dba_java_classes where owner = :owner ''||
  -- '' and name = :name'';
  --execute immediate stmt into num using user, :n.class_name;

  --if (num<>1) then
  --  err_msg := ''Could not find Java class schema object: '' || :n.class_name ||
  --      ''. Did not load Java class properly.'';
  --  mdsys.mderr.raise_md_error(''MD'', ''SDO'',''13385'', err_msg);
  --else
    stmt := ''insert into sdo_network_constraints(sdo_owner, constraint, '' ||
     ''description, class_name, class) values (:owner, :constraint, ''||
     '':description, :class_name, :class)'';
    execute immediate stmt using sdo_util.get_quoted_name(user),:n.constraint,
     :n.description, :n.class_name,:n.class;
  --end if;

--EXCEPTION
  --when others then raise;
END sdo_network_cons_ins_trig;',905,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70545,4,1,0,0,70539,'O','N','mdsys.sdo_network_cons_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_constraints
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  UPDATE sdo_network_constraints
    SET
            (constraint,
       description,
       class_name,
       class)
      =
            (SELECT
               :n.constraint,
         :n.description,
         :n.class_name,
         :n.class
       FROM SYS.DUAL)
    WHERE  sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name)
      AND  constraint = :o.constraint;
END;',495,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70550,4,0,1,0,70546,'OLD','N','sdo_network_java_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_java_objects
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
 user_name         VARCHAR2(130);
 dir_name          VARCHAR2(400);
 file_name         VARCHAR2(130);
 class_file_name   VARCHAR2(130);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  INSERT INTO
    sdo_network_constraints
          (sdo_owner,
     constraint,
     description,
     class_name,
     class,
     java_interface)
  VALUES
          (
           sdo_util.get_quoted_name(user_name),
           :n.name,
     :n.description,
     :n.class_name,
     :n.class,
     :n.java_interface
          );
END;',541,1,1,0,0,0,null,5,1,9,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70551,4,0,0,1,70546,'O','NEW','mdsys.sdo_network_java_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_java_objects
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  DELETE
    FROM  sdo_network_constraints
    WHERE sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
      AND constraint = :o.name;

END;',265,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70559,4,0,1,0,70555,'OLD','N','mdsys.sdo_network_locks_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_locks_wm
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
 user_name         VARCHAR2(130);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  INSERT INTO
    sdo_network_locks_wm(sdo_owner, lock_id, network, workspace,
     original_node_filter, original_link_filter, original_path_filter,
     adjusted_node_filter, adjusted_link_filter, adjusted_path_filter)
  VALUES (sdo_util.get_quoted_name(user_name), :n.lock_id, :n.network, :n.workspace,
     :n.original_node_filter,:n.original_link_filter,:n.original_path_filter,
     :n.adjusted_node_filter,:n.adjusted_link_filter,:n.adjusted_path_filter);
END;',572,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70560,4,0,0,1,70555,'O','NEW','mdsys.sdo_network_locks_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_locks_wm
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  DELETE
    FROM  sdo_network_locks_wm
    WHERE sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
      AND lock_id = :o.lock_id;

END;',262,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70561,4,1,0,0,70555,'O','N','mdsys.sdo_network_locks_upd_trig
INSTEAD OF UPDATE ON mdsys.user_sdo_network_locks_wm
REFERENCING OLD AS o NEW AS n
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  UPDATE sdo_network_locks_wm
    SET  (lock_id, network, workspace,
          original_node_filter, original_link_filter, original_path_filter,
          adjusted_node_filter, adjusted_link_filter, adjusted_path_filter)
      = (SELECT :n.lock_id, :n.network, :n.workspace,
          :n.original_node_filter, :n.original_link_filter,
          :n.original_path_filter,
          :n.adjusted_node_filter, :n.adjusted_link_filter,
          :n.adjusted_path_filter
       FROM SYS.DUAL)
    WHERE  sdo_util.get_quoted_name(sdo_owner) = sdo_util.get_quoted_name(user_name)
      AND  lock_id = :o.lock_id;
END;',709,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70569,4,0,1,0,70565,'OLD','N','mdsys.sdo_network_ud_ins_trig
INSTEAD OF INSERT ON mdsys.user_sdo_network_user_data
REFERENCING NEW AS n
FOR EACH ROW
',null,'DECLARE
 user_name         VARCHAR2(130);
 no                number ;
 table_name        VARCHAR2(130);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  -- check if network already exists in the networkwork metadata
  EXECUTE IMMEDIATE
        ''SELECT COUNT(*) FROM sdo_network_metadata_table '' ||
        ''  where sdo_owner = :owner AND NLS_UPPER(network) = :net '' into no using sdo_util.get_quoted_name(user_name), NLS_UPPER(:n.network);
  IF ( no = 0 ) THEN
   mderr.raise_md_error(''MD'', ''SDO'', -13385, user_name||''.''||:n.network || '' NOT IN NETWORK METADATA!'');
  END IF;


  INSERT INTO
    sdo_network_user_data
    (
     sdo_owner,
     network,
     table_type,
     data_name,
     data_type,
     data_length,
     category_id
     )
  VALUES
     (
      sdo_util.get_quoted_name(user_name),
      NLS_UPPER(:n.network),
      NLS_UPPER(:n.table_type),
      NLS_UPPER(:n.data_name),
      NLS_UPPER(:n.data_type),
      :n.data_length,
      :n.category_id
     );
END;',998,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (70570,4,0,0,1,70565,'O','NEW','mdsys.sdo_network_ud_del_trig
INSTEAD OF DELETE ON mdsys.user_sdo_network_user_data
REFERENCING OLD AS o
FOR EACH ROW
',null,'DECLARE
  user_name    VARCHAR2(256);
BEGIN


  user_name := sys_context(''userenv'', ''session_user'');
  DELETE
    FROM  sdo_network_user_data
    WHERE sdo_util.get_quoted_name(SDO_OWNER) = sdo_util.get_quoted_name(user_name)
      AND network    = NLS_UPPER(:o.network)
      AND table_type = NLS_UPPER(:o.table_type)
      AND data_name  = NLS_UPPER(:o.data_name);

END;',372,1,1,0,0,0,null,5,1,15,6,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73387,1,0,1,0,73139,'OLD','NEW','"TDATA_GENCONNKEYTRIG" 
                    BEFORE INSERT ON STAGE_SERVERDETAIL 
                    FOR EACH ROW 
                    ',null,'BEGIN
                      IF :new.project_id IS NULL THEN
                         :new.project_id := MD_META.get_next_id;
                      END IF;
                      IF :new.svrid IS NULL THEN
                         :new.svrid := MD_META.get_next_id;     
                      END IF;    
                    END TDATA_GENCONNKEYTRIG;
',349,1,128,0,0,0,null,4,1,10,0,20);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73388,1,0,1,0,73338,'OLD','NEW','"TDATA_GENTABLEKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TABLES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTABLEKEYTRIG;
',253,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73389,1,0,1,0,73341,'OLD','NEW','"TDATA_GENCOLUMNKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_COLUMNS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCOLUMNKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73390,1,0,1,0,73349,'OLD','NEW','"TDATA_GENTRIGGERKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TRIGGERS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTRIGGERKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73391,1,0,1,0,73352,'OLD','NEW','"TDATA_GENUDTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_UDTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENUDTKEYTRIG;
',251,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73392,1,0,1,0,73353,'OLD','NEW','"TDATA_GENINDICESKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_INDICES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENINDICESKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73393,1,0,1,0,73354,'OLD','NEW','"TDATA_GENFKEYKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_FKEYS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID1 IS NULL OR :new.MDID1=0 THEN
                                     :new.MDID1 := MD_META.get_next_id;
                                  END IF;
                                  IF :new.MDID2 IS NULL OR :new.MDID2=0 THEN
                                     :new.MDID2 := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENFKEYKEYTRIG;
',446,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73394,1,0,1,0,73355,'OLD','NEW','"TDATA_GENIDXCONSTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_IDXCONSTRAINTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENIDXCONSTKEYTRIG;
',256,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73395,1,0,1,0,73359,'OLD','NEW','"TDATA_GENPROCSTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_PROCEDURES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENPROCSTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (73396,1,0,1,0,73362,'OLD','NEW','"TDATA_GENCHECKTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_SHOWTBLCHECKS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCHECKTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84972,1,1,1,0,84865,'OLD','NEW','"MD_ADDITIONAL_PROPERTY_TRG" BEFORE INSERT OR UPDATE ON MD_ADDITIONAL_PROPERTIES 
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84973,1,1,1,0,84821,'OLD','NEW','"MD_CATALOGS_TRG" BEFORE INSERT OR UPDATE ON MD_CATALOGS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84974,1,1,1,0,84829,'OLD','NEW','"MD_COLUMNS_TRG" BEFORE INSERT OR UPDATE ON MD_COLUMNS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84975,1,1,1,0,84833,'OLD','NEW','"MD_PARTITIONS_TRG" BEFORE INSERT OR UPDATE ON MD_PARTITIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84976,1,1,1,0,84837,'OLD','NEW','"MD_CONNECTIONS_TRG" BEFORE INSERT OR UPDATE ON MD_CONNECTIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84977,1,1,1,0,84918,'OLD','NEW','"MD_CONSTRAINT_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINT_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84978,1,1,1,0,84851,'OLD','NEW','"MD_CONSTRAINTS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84979,1,1,1,0,84897,'OLD','NEW','"MD_DERIVATIVES_TRG" BEFORE INSERT OR UPDATE ON MD_DERIVATIVES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84980,1,1,1,0,84819,'OLD','NEW','"MD_GROUP_MEMBERS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_MEMBERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84981,1,1,1,0,84861,'OLD','NEW','"MD_GROUPS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUPS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84982,1,1,1,0,84845,'OLD','NEW','"MD_INDEX_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_INDEX_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84983,1,1,1,0,84885,'OLD','NEW','"MD_INDEXES_TRG" BEFORE INSERT OR UPDATE ON MD_INDEXES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84984,1,1,1,0,84847,'OLD','NEW','"MD_OTHER_OBJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_OTHER_OBJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84985,1,1,1,0,84873,'OLD','NEW','"MD_PACKAGES_TRG" BEFORE INSERT OR UPDATE ON MD_PACKAGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84986,1,1,1,0,84909,'OLD','NEW','"MD_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84987,1,1,1,0,84841,'OLD','NEW','"MD_PROJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_PROJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84988,1,1,1,0,84891,'OLD','NEW','"MD_SCHEMAS_TRG" BEFORE INSERT OR UPDATE ON MD_SCHEMAS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84989,1,1,1,0,84825,'OLD','NEW','"MD_SEQUENCES_TRG" BEFORE INSERT OR UPDATE ON MD_SEQUENCES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84990,1,1,1,0,84922,'OLD','NEW','"MD_STORED_PROGRAMS_TRG" BEFORE INSERT OR UPDATE ON MD_STORED_PROGRAMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84991,1,1,1,0,84899,'OLD','NEW','"MD_SYNONYMS_TRG" BEFORE INSERT OR UPDATE ON MD_SYNONYMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84992,1,1,1,0,84869,'OLD','NEW','"MD_TABLES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84993,1,1,1,0,84808,'OLD','NEW','"MD_TABLESPACES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLESPACES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84994,1,1,1,0,84903,'OLD','NEW','"MD_TRIGGERS_TRG" BEFORE INSERT OR UPDATE ON MD_TRIGGERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84995,1,1,1,0,84855,'OLD','NEW','"MD_USER_DEFINED_DATA_TYPES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_DEFINED_DATA_TYPES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84996,1,1,1,0,84815,'OLD','NEW','"MD_USERS_TRG" BEFORE INSERT OR UPDATE ON MD_USERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84997,1,1,1,0,84881,'OLD','NEW','"MD_VIEWS_TRG" BEFORE INSERT OR UPDATE ON MD_VIEWS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84998,1,1,1,0,84879,'OLD','NEW','"MD_GROUP_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84999,1,1,1,0,84812,'OLD','NEW','"MD_USER_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85000,3,0,0,1,84869,'OLD','NEW','"DEL_MD_TRIGGERS_T_TRG" AFTER DELETE ON MD_TABLES 
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''T'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85001,3,0,0,1,84881,'OLD','NEW','"DEL_MD_TRIGGERS_V_TRG" AFTER DELETE ON MD_VIEWS
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''V'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85002,1,1,1,0,84800,'OLD','NEW','"INS_APPLICATION_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85003,1,1,1,0,84802,'OLD','NEW','"INS_APPLICATIONFILE_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONFILES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85004,1,1,1,0,84806,'OLD','NEW','"INS_FILE_ARTIFACT_TRG" BEFORE INSERT OR UPDATE ON MD_FILE_ARTIFACTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85005,1,1,1,0,84867,'OLD','NEW','"MIGRLOG_TRG" BEFORE INSERT OR UPDATE ON MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85006,1,1,1,0,84859,'OLD','NEW','"MIGR_DATATYPE_MAP_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_MAP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85007,1,1,1,0,84889,'OLD','NEW','"MIGR_DATATYPE_RULE_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_RULE
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85008,1,1,1,0,84843,'OLD','NEW','"MD_MIGR_PARAMETER_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_PARAMETER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85009,1,1,1,0,84907,'OLD','NEW','"MD_MIGR_DEPENDENCY_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_DEPENDENCY
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85010,1,1,1,0,84916,'OLD','NEW','"MD_MIGR_WEAKDEP_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_WEAKDEP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85011,1,1,1,0,84913,'OLD','NEW','"MIGR_GENERATION_ORDER_TRG" BEFORE INSERT OR UPDATE ON MIGR_GENERATION_ORDER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85012,1,1,1,0,84937,'OLD','NEW','"STAGE_MIGRLOG_ID_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85013,1,1,1,0,84937,'OLD','NEW','"STAGE_MIGRLOG_LOG_DATE_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.log_date is null then
        :new.log_date := systimestamp;
    end if;
END;
',108,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85038,1,0,1,0,85037,'OLD','NEW','"GENCONNKEYTRIG" 
					BEFORE INSERT ON stage_serverdetail 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.project_id is null THEN
					     :new.project_id := MD_META.get_next_id;
					  END IF;
					  IF :new.svrid is null THEN
					     :new.svrid := MD_META.get_next_id;     
					  END IF;    
					END GenConnKeyTrig;
',238,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85061,1,0,1,0,85039,'OLD','NEW','"GENDBKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysdatabases 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.dbid_gen is null THEN
					     :new.dbid_gen := MD_META.get_next_id;
					  END IF;
					END GenDbKeyTrig;
',129,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85062,1,0,1,0,85041,'OLD','NEW','"GENOBJECTKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysobjects
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.objid_gen is null THEN
					     :new.objid_gen := MD_META.get_next_id;
					  END IF;
					END GenObjectKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85063,1,0,1,0,85040,'OLD','NEW','"GENSCHEMAKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysusers
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.suid_gen is null THEN
					     :new.suid_gen := MD_META.get_next_id;
					  END IF;
					END GenSchemaKeyTrig;
',133,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85064,1,0,1,0,85042,'OLD','NEW','"GENCOLUMNKEYTRIG" 
					BEFORE INSERT ON stage_syb12_syscolumns
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.colid_gen is null THEN
					     :new.colid_gen := MD_META.get_next_id;
					  END IF;
					END GenColumnKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85065,1,0,1,0,85045,'OLD','NEW','GenIndexKeyTrig 
					BEFORE INSERT ON stage_syb12_sysindexes
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.indid_gen is null THEN
					     :new.indid_gen := MD_META.get_next_id;
					  END IF;
                    END GenIndexKeyTrig;
',149,1,128,0,0,0,null,4,1,9,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85219,1,0,1,0,85076,'OLD','NEW','"GENSS2K5FORKEYRIG" BEFORE
  INSERT ON STAGE_SS2K5_FN_KEYS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5ForKeyTrig;
',116,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85220,1,0,1,0,85077,'OLD','NEW','"GENSS2K5IDENTCOLRIG" BEFORE
  INSERT ON STAGE_SS2K5_IDENTITY_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5IdentColTrig;
',118,1,128,0,0,0,null,2,1,10,0,54);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85221,1,0,1,0,85079,'OLD','NEW','"GENSS2K5INDEXTRIG" BEFORE
  INSERT ON STAGE_SS2K5_INDEXES FOR EACH ROW ',null,'BEGIN IF :new.object_id_gen IS NULL THEN :new.object_id_gen := MD_META.get_next_id;
END IF;
END Genss2k5IndexTrig;
',115,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85222,1,0,1,0,85081,'OLD','NEW','"GENSS2K5SQLMODTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlModTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85223,1,0,1,0,85081,'OLD','NEW','"GENSS2K5SQLTABTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlTabTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85224,1,0,1,0,85086,'OLD','NEW','"GENSS2K5DEFCONSTTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DT_CONSTRAINTS FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5DefConstTrig;
',110,1,128,0,0,0,null,2,1,10,0,52);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85225,1,0,1,0,85068,'OLD','NEW','"GENSS2K5DB2KEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DATABASES FOR EACH ROW ',null,'BEGIN IF :new.dbid_gen IS NULL THEN :new.dbid_gen := MD_META.get_next_id;
END IF;
END Genss2k5Db2KeyTrig;
',106,1,128,0,0,0,null,2,1,10,0,47);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85226,1,0,1,0,85072,'OLD','NEW','"GENSS2K5OBJECTKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_OBJECTS FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ObjectKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85227,1,0,1,0,85069,'OLD','NEW','"GENSS2K5SCHEMATAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMATA FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemayaKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,46);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85228,1,0,1,0,85073,'OLD','NEW','"GENSS2K5SCHEMAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMAS FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemaKeyTrig;
',109,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85229,1,0,1,0,85070,'OLD','NEW','"GENSS2K5COLUMNKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.colid_gen IS NULL THEN :new.colid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ColumnKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85230,1,0,1,0,85071,'OLD','NEW','Genss2k5DatabasePrincipalTrig BEFORE
  INSERT ON STAGE_SS2K5_DB_PRINCIPALS FOR EACH ROW ',null,'BEGIN IF :new.prinid_gen IS NULL THEN :new.prinid_gen := MD_META.get_next_id;
END IF;
END Genss2k5DatabasePrincipalTrig;
',121,1,128,0,0,0,null,2,1,9,0,51);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85231,1,0,1,0,85084,'OLD','NEW','Genss2k5ChkConstTrig BEFORE
  INSERT ON STAGE_SS2K5_TABLES FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ChkConstTrig;
',110,1,128,0,0,0,null,2,1,9,0,44);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85284,1,0,1,0,85235,'OLD','NEW','"TDATA_GENSCHEMAKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_DATABASES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENSCHEMAKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85285,1,0,1,0,85037,'OLD','NEW','"TDATA_GENCONNKEYTRIG" 
                    BEFORE INSERT ON STAGE_SERVERDETAIL 
                    FOR EACH ROW 
                    ',null,'BEGIN
                      IF :new.project_id IS NULL THEN
                         :new.project_id := MD_META.get_next_id;
                      END IF;
                      IF :new.svrid IS NULL THEN
                         :new.svrid := MD_META.get_next_id;     
                      END IF;    
                    END TDATA_GENCONNKEYTRIG;
',349,1,128,0,0,0,null,4,1,10,0,20);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85286,1,0,1,0,85236,'OLD','NEW','"TDATA_GENTABLEKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TABLES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTABLEKEYTRIG;
',253,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85287,1,0,1,0,85239,'OLD','NEW','"TDATA_GENCOLUMNKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_COLUMNS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCOLUMNKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85288,1,0,1,0,85247,'OLD','NEW','"TDATA_GENTRIGGERKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TRIGGERS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTRIGGERKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85289,1,0,1,0,85250,'OLD','NEW','"TDATA_GENUDTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_UDTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENUDTKEYTRIG;
',251,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85290,1,0,1,0,85251,'OLD','NEW','"TDATA_GENINDICESKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_INDICES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENINDICESKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85291,1,0,1,0,85252,'OLD','NEW','"TDATA_GENFKEYKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_FKEYS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID1 IS NULL OR :new.MDID1=0 THEN
                                     :new.MDID1 := MD_META.get_next_id;
                                  END IF;
                                  IF :new.MDID2 IS NULL OR :new.MDID2=0 THEN
                                     :new.MDID2 := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENFKEYKEYTRIG;
',446,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85292,1,0,1,0,85253,'OLD','NEW','"TDATA_GENIDXCONSTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_IDXCONSTRAINTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENIDXCONSTKEYTRIG;
',256,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85293,1,0,1,0,85257,'OLD','NEW','"TDATA_GENPROCSTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_PROCEDURES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENPROCSTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (85294,1,0,1,0,85260,'OLD','NEW','"TDATA_GENCHECKTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_SHOWTBLCHECKS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCHECKTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (82058,1,0,1,0,82056,'OLD','NEW','tt_TR_Detail_SrNo    BEFORE INSERT 
   ON tt_Detail
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_Detail_SrNo.NEXTVAL INTO :NEW.SrNo
        FROM DUAL;
   END;
',87,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (82061,1,0,1,0,82059,'OLD','NEW','tt_TR_ParentID_ID    BEFORE INSERT 
   ON tt_ParentID
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_ParentID_ID.NEXTVAL INTO :NEW.ID
        FROM DUAL;
   END;
',85,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (82065,1,0,1,0,82063,'OLD','NEW','tt_TR_Detail_2_SrNo    BEFORE INSERT 
   ON tt_Detail_2
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_Detail_2_SrNo.NEXTVAL INTO :NEW.SrNo
        FROM DUAL;
   END;
',89,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (82068,1,0,1,0,82066,'OLD','NEW','tt_TR_ParentID_2_ID    BEFORE INSERT 
   ON tt_ParentID_2
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_ParentID_2_ID.NEXTVAL INTO :NEW.ID
        FROM DUAL;
   END;
',87,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84392,1,0,1,0,84390,'OLD','NEW','tt_TR_OAOLMasterUploadData_    BEFORE INSERT 
   ON tt_OAOLMasterUploadData
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData_.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',101,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84396,1,0,1,0,84394,'OLD','NEW','tt_TR_OAOLMasterUploadData__2    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_2
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__2.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84400,1,0,1,0,84398,'OLD','NEW','tt_TR_OAOLMasterUploadData__3    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_3
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__3.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84404,1,0,1,0,84402,'OLD','NEW','tt_TR_OAOLMasterUploadData__4    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_4
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__4.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84408,1,0,1,0,84406,'OLD','NEW','tt_TR_OAOLMasterUploadData__5    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_5
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__5.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84412,1,0,1,0,84410,'OLD','NEW','tt_TR_OAOLMasterUploadData__6    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_6
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__6.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84416,1,0,1,0,84414,'OLD','NEW','tt_TR_OAOLMasterUploadData__7    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_7
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__7.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (84420,1,0,1,0,84418,'OLD','NEW','tt_TR_OAOLMasterUploadData__8    BEFORE INSERT 
   ON tt_OAOLMasterUploadData_8
   FOR EACH ROW
   ',null,'BEGIN
      SELECT tt_SQ_OAOLMasterUploadData__8.NEXTVAL INTO :NEW.EntityId
        FROM DUAL;
   END;
',103,1,128,0,0,0,null,5,2,2,0,3);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86626,1,1,1,0,86519,'OLD','NEW','"MD_ADDITIONAL_PROPERTY_TRG" BEFORE INSERT OR UPDATE ON MD_ADDITIONAL_PROPERTIES 
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86627,1,1,1,0,86475,'OLD','NEW','"MD_CATALOGS_TRG" BEFORE INSERT OR UPDATE ON MD_CATALOGS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86628,1,1,1,0,86483,'OLD','NEW','"MD_COLUMNS_TRG" BEFORE INSERT OR UPDATE ON MD_COLUMNS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86629,1,1,1,0,86487,'OLD','NEW','"MD_PARTITIONS_TRG" BEFORE INSERT OR UPDATE ON MD_PARTITIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86630,1,1,1,0,86491,'OLD','NEW','"MD_CONNECTIONS_TRG" BEFORE INSERT OR UPDATE ON MD_CONNECTIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86631,1,1,1,0,86572,'OLD','NEW','"MD_CONSTRAINT_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINT_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86632,1,1,1,0,86505,'OLD','NEW','"MD_CONSTRAINTS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86633,1,1,1,0,86551,'OLD','NEW','"MD_DERIVATIVES_TRG" BEFORE INSERT OR UPDATE ON MD_DERIVATIVES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86634,1,1,1,0,86473,'OLD','NEW','"MD_GROUP_MEMBERS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_MEMBERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86635,1,1,1,0,86515,'OLD','NEW','"MD_GROUPS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUPS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86636,1,1,1,0,86499,'OLD','NEW','"MD_INDEX_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_INDEX_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86637,1,1,1,0,86539,'OLD','NEW','"MD_INDEXES_TRG" BEFORE INSERT OR UPDATE ON MD_INDEXES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86638,1,1,1,0,86501,'OLD','NEW','"MD_OTHER_OBJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_OTHER_OBJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86639,1,1,1,0,86527,'OLD','NEW','"MD_PACKAGES_TRG" BEFORE INSERT OR UPDATE ON MD_PACKAGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86640,1,1,1,0,86563,'OLD','NEW','"MD_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86641,1,1,1,0,86495,'OLD','NEW','"MD_PROJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_PROJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86642,1,1,1,0,86545,'OLD','NEW','"MD_SCHEMAS_TRG" BEFORE INSERT OR UPDATE ON MD_SCHEMAS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86643,1,1,1,0,86479,'OLD','NEW','"MD_SEQUENCES_TRG" BEFORE INSERT OR UPDATE ON MD_SEQUENCES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86644,1,1,1,0,86576,'OLD','NEW','"MD_STORED_PROGRAMS_TRG" BEFORE INSERT OR UPDATE ON MD_STORED_PROGRAMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86645,1,1,1,0,86553,'OLD','NEW','"MD_SYNONYMS_TRG" BEFORE INSERT OR UPDATE ON MD_SYNONYMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86646,1,1,1,0,86523,'OLD','NEW','"MD_TABLES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86647,1,1,1,0,86462,'OLD','NEW','"MD_TABLESPACES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLESPACES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86648,1,1,1,0,86557,'OLD','NEW','"MD_TRIGGERS_TRG" BEFORE INSERT OR UPDATE ON MD_TRIGGERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86649,1,1,1,0,86509,'OLD','NEW','"MD_USER_DEFINED_DATA_TYPES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_DEFINED_DATA_TYPES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86650,1,1,1,0,86469,'OLD','NEW','"MD_USERS_TRG" BEFORE INSERT OR UPDATE ON MD_USERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86651,1,1,1,0,86535,'OLD','NEW','"MD_VIEWS_TRG" BEFORE INSERT OR UPDATE ON MD_VIEWS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86652,1,1,1,0,86533,'OLD','NEW','"MD_GROUP_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86653,1,1,1,0,86466,'OLD','NEW','"MD_USER_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86654,3,0,0,1,86523,'OLD','NEW','"DEL_MD_TRIGGERS_T_TRG" AFTER DELETE ON MD_TABLES 
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''T'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86655,3,0,0,1,86535,'OLD','NEW','"DEL_MD_TRIGGERS_V_TRG" AFTER DELETE ON MD_VIEWS
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''V'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86656,1,1,1,0,86454,'OLD','NEW','"INS_APPLICATION_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86657,1,1,1,0,86456,'OLD','NEW','"INS_APPLICATIONFILE_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONFILES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86658,1,1,1,0,86460,'OLD','NEW','"INS_FILE_ARTIFACT_TRG" BEFORE INSERT OR UPDATE ON MD_FILE_ARTIFACTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86659,1,1,1,0,86521,'OLD','NEW','"MIGRLOG_TRG" BEFORE INSERT OR UPDATE ON MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86660,1,1,1,0,86513,'OLD','NEW','"MIGR_DATATYPE_MAP_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_MAP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86661,1,1,1,0,86543,'OLD','NEW','"MIGR_DATATYPE_RULE_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_RULE
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86662,1,1,1,0,86497,'OLD','NEW','"MD_MIGR_PARAMETER_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_PARAMETER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86663,1,1,1,0,86561,'OLD','NEW','"MD_MIGR_DEPENDENCY_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_DEPENDENCY
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86664,1,1,1,0,86570,'OLD','NEW','"MD_MIGR_WEAKDEP_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_WEAKDEP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86665,1,1,1,0,86567,'OLD','NEW','"MIGR_GENERATION_ORDER_TRG" BEFORE INSERT OR UPDATE ON MIGR_GENERATION_ORDER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86666,1,1,1,0,86591,'OLD','NEW','"STAGE_MIGRLOG_ID_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86667,1,1,1,0,86591,'OLD','NEW','"STAGE_MIGRLOG_LOG_DATE_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.log_date is null then
        :new.log_date := systimestamp;
    end if;
END;
',108,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86692,1,0,1,0,86691,'OLD','NEW','"GENCONNKEYTRIG" 
					BEFORE INSERT ON stage_serverdetail 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.project_id is null THEN
					     :new.project_id := MD_META.get_next_id;
					  END IF;
					  IF :new.svrid is null THEN
					     :new.svrid := MD_META.get_next_id;     
					  END IF;    
					END GenConnKeyTrig;
',238,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86715,1,0,1,0,86693,'OLD','NEW','"GENDBKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysdatabases 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.dbid_gen is null THEN
					     :new.dbid_gen := MD_META.get_next_id;
					  END IF;
					END GenDbKeyTrig;
',129,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86716,1,0,1,0,86695,'OLD','NEW','"GENOBJECTKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysobjects
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.objid_gen is null THEN
					     :new.objid_gen := MD_META.get_next_id;
					  END IF;
					END GenObjectKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86717,1,0,1,0,86694,'OLD','NEW','"GENSCHEMAKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysusers
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.suid_gen is null THEN
					     :new.suid_gen := MD_META.get_next_id;
					  END IF;
					END GenSchemaKeyTrig;
',133,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86718,1,0,1,0,86696,'OLD','NEW','"GENCOLUMNKEYTRIG" 
					BEFORE INSERT ON stage_syb12_syscolumns
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.colid_gen is null THEN
					     :new.colid_gen := MD_META.get_next_id;
					  END IF;
					END GenColumnKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86719,1,0,1,0,86699,'OLD','NEW','GenIndexKeyTrig 
					BEFORE INSERT ON stage_syb12_sysindexes
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.indid_gen is null THEN
					     :new.indid_gen := MD_META.get_next_id;
					  END IF;
                    END GenIndexKeyTrig;
',149,1,128,0,0,0,null,4,1,9,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86873,1,0,1,0,86730,'OLD','NEW','"GENSS2K5FORKEYRIG" BEFORE
  INSERT ON STAGE_SS2K5_FN_KEYS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5ForKeyTrig;
',116,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86874,1,0,1,0,86731,'OLD','NEW','"GENSS2K5IDENTCOLRIG" BEFORE
  INSERT ON STAGE_SS2K5_IDENTITY_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5IdentColTrig;
',118,1,128,0,0,0,null,2,1,10,0,54);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86875,1,0,1,0,86733,'OLD','NEW','"GENSS2K5INDEXTRIG" BEFORE
  INSERT ON STAGE_SS2K5_INDEXES FOR EACH ROW ',null,'BEGIN IF :new.object_id_gen IS NULL THEN :new.object_id_gen := MD_META.get_next_id;
END IF;
END Genss2k5IndexTrig;
',115,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86876,1,0,1,0,86735,'OLD','NEW','"GENSS2K5SQLMODTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlModTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86877,1,0,1,0,86735,'OLD','NEW','"GENSS2K5SQLTABTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlTabTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86878,1,0,1,0,86740,'OLD','NEW','"GENSS2K5DEFCONSTTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DT_CONSTRAINTS FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5DefConstTrig;
',110,1,128,0,0,0,null,2,1,10,0,52);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86879,1,0,1,0,86722,'OLD','NEW','"GENSS2K5DB2KEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DATABASES FOR EACH ROW ',null,'BEGIN IF :new.dbid_gen IS NULL THEN :new.dbid_gen := MD_META.get_next_id;
END IF;
END Genss2k5Db2KeyTrig;
',106,1,128,0,0,0,null,2,1,10,0,47);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86880,1,0,1,0,86726,'OLD','NEW','"GENSS2K5OBJECTKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_OBJECTS FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ObjectKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86881,1,0,1,0,86723,'OLD','NEW','"GENSS2K5SCHEMATAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMATA FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemayaKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,46);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86882,1,0,1,0,86727,'OLD','NEW','"GENSS2K5SCHEMAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMAS FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemaKeyTrig;
',109,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86883,1,0,1,0,86724,'OLD','NEW','"GENSS2K5COLUMNKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.colid_gen IS NULL THEN :new.colid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ColumnKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86884,1,0,1,0,86725,'OLD','NEW','Genss2k5DatabasePrincipalTrig BEFORE
  INSERT ON STAGE_SS2K5_DB_PRINCIPALS FOR EACH ROW ',null,'BEGIN IF :new.prinid_gen IS NULL THEN :new.prinid_gen := MD_META.get_next_id;
END IF;
END Genss2k5DatabasePrincipalTrig;
',121,1,128,0,0,0,null,2,1,9,0,51);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86885,1,0,1,0,86738,'OLD','NEW','Genss2k5ChkConstTrig BEFORE
  INSERT ON STAGE_SS2K5_TABLES FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ChkConstTrig;
',110,1,128,0,0,0,null,2,1,9,0,44);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86938,1,0,1,0,86889,'OLD','NEW','"TDATA_GENSCHEMAKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_DATABASES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENSCHEMAKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86939,1,0,1,0,86691,'OLD','NEW','"TDATA_GENCONNKEYTRIG" 
                    BEFORE INSERT ON STAGE_SERVERDETAIL 
                    FOR EACH ROW 
                    ',null,'BEGIN
                      IF :new.project_id IS NULL THEN
                         :new.project_id := MD_META.get_next_id;
                      END IF;
                      IF :new.svrid IS NULL THEN
                         :new.svrid := MD_META.get_next_id;     
                      END IF;    
                    END TDATA_GENCONNKEYTRIG;
',349,1,128,0,0,0,null,4,1,10,0,20);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86940,1,0,1,0,86890,'OLD','NEW','"TDATA_GENTABLEKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TABLES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTABLEKEYTRIG;
',253,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86941,1,0,1,0,86893,'OLD','NEW','"TDATA_GENCOLUMNKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_COLUMNS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCOLUMNKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86942,1,0,1,0,86901,'OLD','NEW','"TDATA_GENTRIGGERKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TRIGGERS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTRIGGERKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86943,1,0,1,0,86904,'OLD','NEW','"TDATA_GENUDTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_UDTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENUDTKEYTRIG;
',251,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86944,1,0,1,0,86905,'OLD','NEW','"TDATA_GENINDICESKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_INDICES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENINDICESKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86945,1,0,1,0,86906,'OLD','NEW','"TDATA_GENFKEYKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_FKEYS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID1 IS NULL OR :new.MDID1=0 THEN
                                     :new.MDID1 := MD_META.get_next_id;
                                  END IF;
                                  IF :new.MDID2 IS NULL OR :new.MDID2=0 THEN
                                     :new.MDID2 := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENFKEYKEYTRIG;
',446,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86946,1,0,1,0,86907,'OLD','NEW','"TDATA_GENIDXCONSTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_IDXCONSTRAINTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENIDXCONSTKEYTRIG;
',256,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86947,1,0,1,0,86911,'OLD','NEW','"TDATA_GENPROCSTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_PROCEDURES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENPROCSTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (86948,1,0,1,0,86914,'OLD','NEW','"TDATA_GENCHECKTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_SHOWTBLCHECKS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCHECKTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87263,1,1,1,0,87156,'OLD','NEW','"MD_ADDITIONAL_PROPERTY_TRG" BEFORE INSERT OR UPDATE ON MD_ADDITIONAL_PROPERTIES 
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87264,1,1,1,0,87112,'OLD','NEW','"MD_CATALOGS_TRG" BEFORE INSERT OR UPDATE ON MD_CATALOGS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87265,1,1,1,0,87120,'OLD','NEW','"MD_COLUMNS_TRG" BEFORE INSERT OR UPDATE ON MD_COLUMNS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87266,1,1,1,0,87124,'OLD','NEW','"MD_PARTITIONS_TRG" BEFORE INSERT OR UPDATE ON MD_PARTITIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87267,1,1,1,0,87128,'OLD','NEW','"MD_CONNECTIONS_TRG" BEFORE INSERT OR UPDATE ON MD_CONNECTIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87268,1,1,1,0,87209,'OLD','NEW','"MD_CONSTRAINT_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINT_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87269,1,1,1,0,87142,'OLD','NEW','"MD_CONSTRAINTS_TRG" BEFORE INSERT OR UPDATE ON MD_CONSTRAINTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87270,1,1,1,0,87188,'OLD','NEW','"MD_DERIVATIVES_TRG" BEFORE INSERT OR UPDATE ON MD_DERIVATIVES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87271,1,1,1,0,87110,'OLD','NEW','"MD_GROUP_MEMBERS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_MEMBERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87272,1,1,1,0,87152,'OLD','NEW','"MD_GROUPS_TRG" BEFORE INSERT OR UPDATE ON MD_GROUPS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87273,1,1,1,0,87136,'OLD','NEW','"MD_INDEX_DETAILS_TRG" BEFORE INSERT OR UPDATE ON MD_INDEX_DETAILS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87274,1,1,1,0,87176,'OLD','NEW','"MD_INDEXES_TRG" BEFORE INSERT OR UPDATE ON MD_INDEXES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87275,1,1,1,0,87138,'OLD','NEW','"MD_OTHER_OBJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_OTHER_OBJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87276,1,1,1,0,87164,'OLD','NEW','"MD_PACKAGES_TRG" BEFORE INSERT OR UPDATE ON MD_PACKAGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87277,1,1,1,0,87200,'OLD','NEW','"MD_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87278,1,1,1,0,87132,'OLD','NEW','"MD_PROJECTS_TRG" BEFORE INSERT OR UPDATE ON MD_PROJECTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87279,1,1,1,0,87182,'OLD','NEW','"MD_SCHEMAS_TRG" BEFORE INSERT OR UPDATE ON MD_SCHEMAS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87280,1,1,1,0,87116,'OLD','NEW','"MD_SEQUENCES_TRG" BEFORE INSERT OR UPDATE ON MD_SEQUENCES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87281,1,1,1,0,87213,'OLD','NEW','"MD_STORED_PROGRAMS_TRG" BEFORE INSERT OR UPDATE ON MD_STORED_PROGRAMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87282,1,1,1,0,87190,'OLD','NEW','"MD_SYNONYMS_TRG" BEFORE INSERT OR UPDATE ON MD_SYNONYMS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87283,1,1,1,0,87160,'OLD','NEW','"MD_TABLES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87284,1,1,1,0,87099,'OLD','NEW','"MD_TABLESPACES_TRG" BEFORE INSERT OR UPDATE ON MD_TABLESPACES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87285,1,1,1,0,87194,'OLD','NEW','"MD_TRIGGERS_TRG" BEFORE INSERT OR UPDATE ON MD_TRIGGERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87286,1,1,1,0,87146,'OLD','NEW','"MD_USER_DEFINED_DATA_TYPES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_DEFINED_DATA_TYPES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87287,1,1,1,0,87106,'OLD','NEW','"MD_USERS_TRG" BEFORE INSERT OR UPDATE ON MD_USERS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87288,1,1,1,0,87172,'OLD','NEW','"MD_VIEWS_TRG" BEFORE INSERT OR UPDATE ON MD_VIEWS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87289,1,1,1,0,87170,'OLD','NEW','"MD_GROUP_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_GROUP_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87290,1,1,1,0,87103,'OLD','NEW','"MD_USER_PRIVILEGES_TRG" BEFORE INSERT OR UPDATE ON MD_USER_PRIVILEGES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87291,3,0,0,1,87160,'OLD','NEW','"DEL_MD_TRIGGERS_T_TRG" AFTER DELETE ON MD_TABLES 
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''T'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87292,3,0,0,1,87172,'OLD','NEW','"DEL_MD_TRIGGERS_V_TRG" AFTER DELETE ON MD_VIEWS
FOR EACH ROW 
',null,'BEGIN
  DELETE FROM MD_TRIGGERS WHERE MD_TRIGGERS.TABLE_OR_VIEW_ID_FK = :OLD.ID AND MD_TRIGGERS.TRIGGER_ON_FLAG = ''V'';
END;
',124,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87293,1,1,1,0,87091,'OLD','NEW','"INS_APPLICATION_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87294,1,1,1,0,87093,'OLD','NEW','"INS_APPLICATIONFILE_TRG" BEFORE INSERT OR UPDATE ON MD_APPLICATIONFILES
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87295,1,1,1,0,87097,'OLD','NEW','"INS_FILE_ARTIFACT_TRG" BEFORE INSERT OR UPDATE ON MD_FILE_ARTIFACTS
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87296,1,1,1,0,87158,'OLD','NEW','"MIGRLOG_TRG" BEFORE INSERT OR UPDATE ON MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87297,1,1,1,0,87150,'OLD','NEW','"MIGR_DATATYPE_MAP_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_MAP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87298,1,1,1,0,87180,'OLD','NEW','"MIGR_DATATYPE_RULE_TRG" BEFORE INSERT OR UPDATE ON MIGR_DATATYPE_TRANSFORM_RULE
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87299,1,1,1,0,87134,'OLD','NEW','"MD_MIGR_PARAMETER_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_PARAMETER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87300,1,1,1,0,87198,'OLD','NEW','"MD_MIGR_DEPENDENCY_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_DEPENDENCY
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87301,1,1,1,0,87207,'OLD','NEW','"MD_MIGR_WEAKDEP_TRG" BEFORE INSERT OR UPDATE ON MD_MIGR_WEAKDEP
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87302,1,1,1,0,87204,'OLD','NEW','"MIGR_GENERATION_ORDER_TRG" BEFORE INSERT OR UPDATE ON MIGR_GENERATION_ORDER
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87303,1,1,1,0,87228,'OLD','NEW','"STAGE_MIGRLOG_ID_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.id is null then
        :new.id := MD_META.get_next_id;
    end if;
END;
',103,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87304,1,1,1,0,87228,'OLD','NEW','"STAGE_MIGRLOG_LOG_DATE_TRG" BEFORE INSERT OR UPDATE ON STAGE_MIGRLOG
FOR EACH ROW
',null,'BEGIN
  if inserting and :new.log_date is null then
        :new.log_date := systimestamp;
    end if;
END;
',108,1,128,0,0,0,null,3,1,10,0,0);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87329,1,0,1,0,87328,'OLD','NEW','"GENCONNKEYTRIG" 
					BEFORE INSERT ON stage_serverdetail 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.project_id is null THEN
					     :new.project_id := MD_META.get_next_id;
					  END IF;
					  IF :new.svrid is null THEN
					     :new.svrid := MD_META.get_next_id;     
					  END IF;    
					END GenConnKeyTrig;
',238,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87352,1,0,1,0,87330,'OLD','NEW','"GENDBKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysdatabases 
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.dbid_gen is null THEN
					     :new.dbid_gen := MD_META.get_next_id;
					  END IF;
					END GenDbKeyTrig;
',129,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87353,1,0,1,0,87332,'OLD','NEW','"GENOBJECTKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysobjects
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.objid_gen is null THEN
					     :new.objid_gen := MD_META.get_next_id;
					  END IF;
					END GenObjectKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87354,1,0,1,0,87331,'OLD','NEW','"GENSCHEMAKEYTRIG" 
					BEFORE INSERT ON stage_syb12_sysusers
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.suid_gen is null THEN
					     :new.suid_gen := MD_META.get_next_id;
					  END IF;
					END GenSchemaKeyTrig;
',133,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87355,1,0,1,0,87333,'OLD','NEW','"GENCOLUMNKEYTRIG" 
					BEFORE INSERT ON stage_syb12_syscolumns
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.colid_gen is null THEN
					     :new.colid_gen := MD_META.get_next_id;
					  END IF;
					END GenColumnKeyTrig;
',135,1,128,0,0,0,null,4,1,10,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87356,1,0,1,0,87336,'OLD','NEW','GenIndexKeyTrig 
					BEFORE INSERT ON stage_syb12_sysindexes
					FOR EACH ROW 
					',null,'BEGIN
					  IF :new.indid_gen is null THEN
					     :new.indid_gen := MD_META.get_next_id;
					  END IF;
                    END GenIndexKeyTrig;
',149,1,128,0,0,0,null,4,1,9,0,5);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87510,1,0,1,0,87367,'OLD','NEW','"GENSS2K5FORKEYRIG" BEFORE
  INSERT ON STAGE_SS2K5_FN_KEYS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5ForKeyTrig;
',116,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87511,1,0,1,0,87368,'OLD','NEW','"GENSS2K5IDENTCOLRIG" BEFORE
  INSERT ON STAGE_SS2K5_IDENTITY_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.OBJECT_ID_gen IS NULL THEN :new.OBJECT_ID_gen := MD_META.get_next_id;
END IF;
END Genss2k5IdentColTrig;
',118,1,128,0,0,0,null,2,1,10,0,54);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87512,1,0,1,0,87370,'OLD','NEW','"GENSS2K5INDEXTRIG" BEFORE
  INSERT ON STAGE_SS2K5_INDEXES FOR EACH ROW ',null,'BEGIN IF :new.object_id_gen IS NULL THEN :new.object_id_gen := MD_META.get_next_id;
END IF;
END Genss2k5IndexTrig;
',115,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87513,1,0,1,0,87372,'OLD','NEW','"GENSS2K5SQLMODTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlModTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87514,1,0,1,0,87372,'OLD','NEW','"GENSS2K5SQLTABTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SQL_MODULES FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5SqlTabTrig;
',108,1,128,0,0,0,null,2,1,10,0,49);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87515,1,0,1,0,87377,'OLD','NEW','"GENSS2K5DEFCONSTTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DT_CONSTRAINTS FOR EACH ROW ',null,'BEGIN IF :new.OBJID_GEN IS NULL THEN :new.OBJID_GEN := MD_META.get_next_id;
END IF;
END Genss2k5DefConstTrig;
',110,1,128,0,0,0,null,2,1,10,0,52);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87516,1,0,1,0,87359,'OLD','NEW','"GENSS2K5DB2KEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_DATABASES FOR EACH ROW ',null,'BEGIN IF :new.dbid_gen IS NULL THEN :new.dbid_gen := MD_META.get_next_id;
END IF;
END Genss2k5Db2KeyTrig;
',106,1,128,0,0,0,null,2,1,10,0,47);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87517,1,0,1,0,87363,'OLD','NEW','"GENSS2K5OBJECTKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_OBJECTS FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ObjectKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87518,1,0,1,0,87360,'OLD','NEW','"GENSS2K5SCHEMATAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMATA FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemayaKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,46);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87519,1,0,1,0,87364,'OLD','NEW','"GENSS2K5SCHEMAKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_SCHEMAS FOR EACH ROW ',null,'BEGIN IF :new.suid_gen IS NULL THEN :new.suid_gen := MD_META.get_next_id;
END IF;
END Genss2k5SchemaKeyTrig;
',109,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87520,1,0,1,0,87361,'OLD','NEW','"GENSS2K5COLUMNKEYTRIG" BEFORE
  INSERT ON STAGE_SS2K5_COLUMNS FOR EACH ROW ',null,'BEGIN IF :new.colid_gen IS NULL THEN :new.colid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ColumnKeyTrig;
',111,1,128,0,0,0,null,2,1,10,0,45);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87521,1,0,1,0,87362,'OLD','NEW','Genss2k5DatabasePrincipalTrig BEFORE
  INSERT ON STAGE_SS2K5_DB_PRINCIPALS FOR EACH ROW ',null,'BEGIN IF :new.prinid_gen IS NULL THEN :new.prinid_gen := MD_META.get_next_id;
END IF;
END Genss2k5DatabasePrincipalTrig;
',121,1,128,0,0,0,null,2,1,9,0,51);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87522,1,0,1,0,87375,'OLD','NEW','Genss2k5ChkConstTrig BEFORE
  INSERT ON STAGE_SS2K5_TABLES FOR EACH ROW ',null,'BEGIN IF :new.objid_gen IS NULL THEN :new.objid_gen := MD_META.get_next_id;
END IF;
END Genss2k5ChkConstTrig;
',110,1,128,0,0,0,null,2,1,9,0,44);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87575,1,0,1,0,87526,'OLD','NEW','"TDATA_GENSCHEMAKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_DATABASES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENSCHEMAKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87576,1,0,1,0,87328,'OLD','NEW','"TDATA_GENCONNKEYTRIG" 
                    BEFORE INSERT ON STAGE_SERVERDETAIL 
                    FOR EACH ROW 
                    ',null,'BEGIN
                      IF :new.project_id IS NULL THEN
                         :new.project_id := MD_META.get_next_id;
                      END IF;
                      IF :new.svrid IS NULL THEN
                         :new.svrid := MD_META.get_next_id;     
                      END IF;    
                    END TDATA_GENCONNKEYTRIG;
',349,1,128,0,0,0,null,4,1,10,0,20);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87577,1,0,1,0,87527,'OLD','NEW','"TDATA_GENTABLEKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TABLES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTABLEKEYTRIG;
',253,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87578,1,0,1,0,87530,'OLD','NEW','"TDATA_GENCOLUMNKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_COLUMNS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCOLUMNKEYTRIG;
',254,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87579,1,0,1,0,87538,'OLD','NEW','"TDATA_GENTRIGGERKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_TRIGGERS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENTRIGGERKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87580,1,0,1,0,87541,'OLD','NEW','"TDATA_GENUDTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_UDTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENUDTKEYTRIG;
',251,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87581,1,0,1,0,87542,'OLD','NEW','"TDATA_GENINDICESKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_INDICES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENINDICESKEYTRIG;
',255,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87582,1,0,1,0,87543,'OLD','NEW','"TDATA_GENFKEYKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_FKEYS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID1 IS NULL OR :new.MDID1=0 THEN
                                     :new.MDID1 := MD_META.get_next_id;
                                  END IF;
                                  IF :new.MDID2 IS NULL OR :new.MDID2=0 THEN
                                     :new.MDID2 := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENFKEYKEYTRIG;
',446,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87583,1,0,1,0,87544,'OLD','NEW','"TDATA_GENIDXCONSTKEYTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_IDXCONSTRAINTS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENIDXCONSTKEYTRIG;
',256,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87584,1,0,1,0,87548,'OLD','NEW','"TDATA_GENPROCSTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_PROCEDURES
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENPROCSTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
Insert into SYS.TRIGGER$ (OBJ#,TYPE#,UPDATE$,INSERT$,DELETE$,BASEOBJECT,REFOLDNAME,REFNEWNAME,DEFINITION,WHENCLAUSE,ACTION#,ACTIONSIZE,ENABLED,PROPERTY,SYS_EVTS,NTTRIGCOL,NTTRIGATT,REFPRTNAME,ACTIONLINENO,TRIGNAMELINE,TRIGNAMECOL,TRIGNAMECOLOFS,ACTIONCOLNO) values (87585,1,0,1,0,87551,'OLD','NEW','"TDATA_GENCHECKTRIG" 
                                BEFORE INSERT ON STAGE_TERADATA_SHOWTBLCHECKS
                                FOR EACH ROW 
                                ',null,'BEGIN
                                  IF :new.MDID IS NULL OR :new.MDID=0 THEN
                                     :new.MDID := MD_META.get_next_id;
                                  END IF;
                                END TDATA_GENCHECKTRIG;
',250,1,128,0,0,0,null,4,1,10,0,32);
