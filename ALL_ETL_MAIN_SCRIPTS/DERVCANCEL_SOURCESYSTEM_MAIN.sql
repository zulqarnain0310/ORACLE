--------------------------------------------------------
--  DDL for Procedure DERVCANCEL_SOURCESYSTEM_MAIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" 
AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
-- Add the parameters for the stored procedure here

BEGIN

   SELECT TIMEKEY - 1 

     INTO v_VEFFECTIVETO
     FROM RBL_MISDB_PROD.Automate_Advances 
    WHERE  EXT_FLG = 'Y';
   ------------For New Records
   --UPDATE A SET A.IsChanged='N'
   ------Select * 
   --from RBL_TEMPDB.DBO.TEMPDERVCANCEL_SOURCESYSTEM A
   --Where Not Exists(Select 1 from cURDAT.DerivativeDetail B Where B.EffectiveToTimeKey=49999
   --And A.DerivativeRefNo=B.DerivativeRefNo) -- And A.SourceAlt_Key=B.SourceAlt_Key)
   --UPDATE O SET O.EffectiveToTimeKey=@vEffectiveto,
   -- O.DateModified=CONVERT(DATE,GETDATE(),103),
   -- O.ModifiedBy='SSISUSER'
   --FROM CurDat.DerivativeDetail AS O
   --INNER JOIN RBL_TEMPDB.DBO.TEMPDERVCANCEL_SOURCESYSTEM AS T
   --ON O.DerivativeRefNo=T.DerivativeRefNo
   --and O.EffectiveToTimeKey=49999
   --AND T.EffectiveToTimeKey=49999
   --WHERE
   --( 
   -- isnull(O.CustomerACID,0) <> isnull(T.[AcID],0) 
   --OR isnull(O.CustomerID,0) <> isnull(T.[CustID] ,0)
   --OR isnull(O.CustomerName,0) <> isnull(T.CustomerName,0) 
   --OR isnull(O.DerivativeRefNo,0) <> isnull(T.DerivativeRefNo,0) 
   --OR isnull(O.Duedate,'1990-01-01') <> isnull(T.Duedate,'1990-01-01') 
   --OR isnull(O.DueAmt,0) <> isnull(T.DueAmt,0) 
   --OR isnull(O.OsAmt,0) <> isnull(T.[Os_Amt],0) 
   --OR isnull(O.POS,0) <> isnull(T.POS,0) 
   --)
   ------------For Changes Records
   --UPDATE A SET A.IsChanged='C'
   ------Select * 
   --from RBL_TEMPDB.DBO.TEMPDERVCANCEL_SOURCESYSTEM A
   --INNER JOIN CurDat.DerivativeDetail B 
   --ON  A.DerivativeRefNo=B.DerivativeRefNo
   --Where B.EffectiveToTimeKey= @vEffectiveto
   ---------------------------------------------------------------------------------------------------------------
   ---------Expire the records
   --UPDATE AA
   --SET 
   -- EffectiveToTimeKey = @vEffectiveto,
   -- DateModified=CONVERT(DATE,GETDATE(),103),
   -- ModifiedBy='SSISUSER' 
   --FROM CurDat.DerivativeDetail AA
   --WHERE AA.EffectiveToTimeKey = 49999
   --AND NOT EXISTS (SELECT 1 FROM RBL_TEMPDB.DBO.TEMPDERVCANCEL_SOURCESYSTEM BB
   --    WHERE  AA.DerivativeRefNo=BB.DerivativeRefNo
   --    AND BB.EffectiveToTimeKey =49999
   --    )
   MERGE INTO CurDat_RBL_MISDB_PROD.DerivativeDetail O
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM CurDat_RBL_MISDB_PROD.DerivativeDetail O
        --INNER JOIN RBL_TEMPDB.DBO.TempInvestmentFinancialDetail AS T
         --ON O.InvEntityId=T.InvEntityId

    WHERE O.EffectiveToTimeKey = 49999) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   INSERT INTO CurDat_RBL_MISDB_PROD.DerivativeDetail
     ( DateofData, SourceSystem, BranchCode, UCIC_ID, CustomerID, CustomerName, CustomerACID, DerivativeRefNo, Duedate, DueAmt, OsAmt, POS, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved, DerivativeEntityID )
     ( SELECT DateofData ,
              SourceSystem ,
              BranchCode ,
              UCIC_ID ,
              CustID ,
              CustomerName ,
              AcID ,
              DerivativeRefNo ,
              Duedate ,
              DueAmt ,
              Os_Amt ,
              POS ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CreatedBy ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              DerivativeEntityID 
       FROM RBL_TEMPDB.TEMPDERVCANCEL_SOURCESYSTEM T
        WHERE  DerivativeEntityID IS NOT NULL );

EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
            WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."DERVCANCEL_SOURCESYSTEM_MAIN" TO "ADF_CDR_RBL_STGDB";
