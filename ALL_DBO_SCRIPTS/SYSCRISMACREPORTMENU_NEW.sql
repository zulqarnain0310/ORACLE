--------------------------------------------------------
--  DDL for Procedure SYSCRISMACREPORTMENU_NEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" 
-- Created by-Maniraj

(
  v_UserLoginID IN VARCHAR2 DEFAULT ' ' ,
  v_TimeKey IN NUMBER DEFAULT 4017 
)
AS
   v_UserType VARCHAR2(10);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT WFR.WorkFlowUserRoleShortName 

     INTO v_UserType
     FROM DimWorkFlowUserRole WFR
            JOIN DimUserInfo DU   ON WFR.WorkFlowUserRoleAlt_Key = DU.WorkFlowUserRoleAlt_Key
    WHERE  DU.UserLoginID = v_UserLoginID;
   DBMS_OUTPUT.PUT_LINE(v_UserType);
   OPEN  v_cursor FOR
      SELECT M.EntityKey ,
             M.MenuTitleId ,
             M.DataSeq ,
             NVL(M.MenuId, 0) MenuId  ,
             NVL(M.ParentId, 0) ParentId  ,
             M.MenuCaption MenuCaption  ,
             NVL(UTILS.CONVERT_TO_VARCHAR2(M.ActionName,4000), ReportUrl) ActionName  ,
             M.Viewpath ,
             M.ngController ,
             R.ReportMenuId ,
             R.ReportType ,
             R.ReportUrl ,
             R.ReportID ,
             M.BusFld ,
             M.EnableMakerChecker ,
             M.NonAllowOperation ,
             NVL(M.AccessLevel, 'VIEWER') AccessLevel  ,
             --,SC.MenuCaption ParentMenuCaption
             'ReportMenu' TableName  
        FROM SysCRisMacMenu M
               JOIN SysReportDirectory R   ON M.MenuId = R.ReportMenuId

      --INNER JOIN SysCRisMacMenu SC

      --ON M.ParentId=SC.MenuId

      --WHERE  M.visible=1  and ISNULL(M.MenuId,0)<>0 AND M.ParentId=10700
      WHERE  M.Visible = 1 --and ISNULL(M.MenuId,0)<>0 AND M.ParentId=24624

        ORDER BY MenuTitleID,
                 DataSeq ;
      DBMS_SQL.RETURN_RESULT(v_cursor);
   OPEN  v_cursor FOR
      SELECT MenuId ,
             MenuCaption ParentMenuCaption  ,
             'ParentReportMenu' TableName  
        FROM SysCRisMacMenu 
       WHERE  ParentId = 144 ;
      DBMS_SQL.RETURN_RESULT(v_cursor);--(select MenuId from SysCRisMacMenu where MenuCaption='Reports')
   --------- ADD LOGIC TO CHECK THE ACL PROCESS IS RUNNING OR NOT BY SATWAJI AS ON 28/08/2023 ------------------
   ------IF (@OperationFlag IN(1,2,3,16,17,20))
   ------BEGIN
   DBMS_OUTPUT.PUT_LINE('ACL Process Status Check');
   ACLProcessStatusCheck() ;-----END

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."SYSCRISMACREPORTMENU_NEW" TO "ADF_CDR_RBL_STGDB";
