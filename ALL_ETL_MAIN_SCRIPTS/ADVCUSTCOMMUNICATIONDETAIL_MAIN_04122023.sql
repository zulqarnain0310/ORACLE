--------------------------------------------------------
--  DDL for Procedure ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" 
-- =============================================
 -- Author:		<Author,,Name>
 -- Create date: <Create Date,,>
 -- Description:	<Description,,>
 -- =============================================

AS
   -- SET NOCOUNT ON added to prevent extra result sets from
   -- interfering with SELECT statements.
   v_VEFFECTIVETO NUMBER(10,0);
-- Add the parameters for the stored procedure here

BEGIN

   SELECT TIMEKEY - 1 

     INTO v_VEFFECTIVETO
     FROM RBL_MISDB.AUTOMATE_ADVANCES 
    WHERE  EXT_FLG = 'Y';
   ----------For New Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'N'
   FROM A ,RBL_TEMPDB.TempAdvCustCommunicationDetail A 
    WHERE NOT EXISTS ( SELECT 1 
                       FROM RBL_MISDB_PROD.AdvCustCommunicationDetail B
                        WHERE  B.EffectiveToTimeKey = 49999
                                 AND B.CustomerEntityId = A.CustomerEntityId )) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'N';
   MERGE INTO O 
   USING (SELECT O.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM O ,RBL_MISDB_PROD.AdvCustCommunicationDetail O
          JOIN RBL_TEMPDB.TempAdvCustCommunicationDetail T   ON O.CustomerEntityId = T.CustomerEntityId
          AND O.EffectiveToTimeKey = 49999
          AND T.EffectiveToTimeKey = 49999 
    WHERE ( NVL(O.CustomerEntityId, 0) <> NVL(T.CustomerEntityId, 0)
     OR NVL(O.RelationEntityId, 0) <> NVL(T.RelationEntityId, 0)
     OR NVL(O.RelationAddEntityId, 0) <> NVL(T.RelationAddEntityId, 0)
     OR NVL(O.AddressCategoryAlt_Key, 0) <> NVL(T.AddressCategoryAlt_Key, 0)
     OR NVL(O.AddressTypeAlt_Key, 0) <> NVL(T.AddressTypeAlt_Key, 0)
     OR NVL(O.Add1, 0) <> NVL(T.Add1, 0)
     OR NVL(O.Add3, 0) <> NVL(T.Add3, 0)
     OR NVL(O.Add2, 0) <> NVL(T.Add2, 0)
     OR NVL(O.CountryAlt_Key, 0) <> NVL(T.CountryAlt_Key, 0)
     OR NVL(O.DistrictAlt_Key, 0) <> NVL(T.DistrictAlt_Key, 0)
     OR NVL(O.CityAlt_Key, 0) <> NVL(T.CityAlt_Key, 0)
     OR NVL(O.PinCode, 0) <> NVL(T.PinCode, 0)
     OR NVL(O.CustLocationCode, 0) <> NVL(T.CustLocationCode, 0)
     OR NVL(O.STD_Code_Res, 0) <> NVL(T.STD_Code_Res, 0)
     OR NVL(O.PhoneNo_Res, 0) <> NVL(T.PhoneNo_Res, 0)
     OR NVL(O.STD_Code_Off, 0) <> NVL(T.STD_Code_Off, 0)
     OR NVL(O.PhoneNo_Off, 0) <> NVL(T.PhoneNo_Off, 0)
     OR NVL(O.FaxNo, 0) <> NVL(T.FaxNo, 0)
     OR NVL(O.ExtensionNo, 0) <> NVL(T.ExtensionNo, 0)
     OR NVL(O.ScrCrError, 0) <> NVL(T.ScrCrError, 0)
     OR NVL(O.RefCustomerId, 0) <> NVL(T.RefCustomerId, 0)
     OR NVL(O.IsMainAddress, 0) <> NVL(T.IsMainAddress, 0)
     OR NVL(O.DUNSNo, 0) <> NVL(T.DUNSNo, 0)
     OR NVL(O.CIBILPGId, 0) <> NVL(T.CIBILPGId, 0)
     OR NVL(O.CityName, 0) <> NVL(T.CityName, 0)
     OR NVL(O.ScrCrErrorSeq, 0) <> NVL(T.ScrCrErrorSeq, 0) )) src
   ON ( O.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET O.EffectiveToTimeKey = v_vEffectiveto,
                                O.DateModified = pos_3,
                                O.ModifiedBy = 'SSISUSER';
   ----------For Changes Records
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, 'C'
   FROM A ,RBL_TEMPDB.TempAdvCustCommunicationDetail A
          JOIN RBL_MISDB_PROD.AdvCustCommunicationDetail B   ON B.CustomerEntityId = A.CustomerEntityId 
    WHERE B.EffectiveToTimeKey = v_vEffectiveto) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.IsChanged
                                ----Select * 
                                 = 'C';
   -------Expire the records
   MERGE INTO AA 
   USING (SELECT AA.ROWID row_id, v_vEffectiveto, UTILS.CONVERT_TO_VARCHAR2(SYSDATE,200,p_style=>103) AS pos_3, 'SSISUSER'
   FROM AA ,RBL_MISDB_PROD.AdvCustCommunicationDetail AA 
    WHERE AA.EffectiveToTimeKey = 49999
     AND NOT EXISTS ( SELECT 1 
                      FROM RBL_TEMPDB.TempAdvCustCommunicationDetail BB
                       WHERE  AA.CustomerEntityId = BB.CustomerEntityId
                                AND BB.EffectiveToTimeKey = 49999 )) src
   ON ( AA.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto,
                                DateModified = pos_3,
                                ModifiedBy = 'SSISUSER';
   /********************************************************************************************************/
   INSERT INTO RBL_MISDB_PROD.AdvCustCommunicationDetail
     ( EntityKey, CustomerEntityId, RelationEntityId, RelationAddEntityId, AddressCategoryAlt_Key, AddressTypeAlt_Key, Add1, Add2, Add3, CountryAlt_Key, DistrictAlt_Key, CityAlt_Key, PinCode, CustLocationCode, STD_Code_Res, PhoneNo_Res, STD_Code_Off, PhoneNo_Off, FaxNo, ExtensionNo, ScrCrError, RefCustomerId, IsMainAddress, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, ModifiedBy, DateModified, ApprovedBy, DateApproved
   --,[D2Ktimestamp]
   , DUNSNo, CIBILPGId, CityName, ScrCrErrorSeq )
     ( SELECT EntityKey ,
              CustomerEntityId ,
              RelationEntityId ,
              RelationAddEntityId ,
              AddressCategoryAlt_Key ,
              AddressTypeAlt_Key ,
              Add1 ,
              Add2 ,
              Add3 ,
              CountryAlt_Key ,
              DistrictAlt_Key ,
              CityAlt_Key ,
              PinCode ,
              CustLocationCode ,
              STD_Code_Res ,
              PhoneNo_Res ,
              STD_Code_Off ,
              PhoneNo_Off ,
              FaxNo ,
              ExtensionNo ,
              ScrCrError ,
              RefCustomerId ,
              IsMainAddress ,
              AuthorisationStatus ,
              EffectiveFromTimeKey ,
              EffectiveToTimeKey ,
              CreatedBy ,
              DateCreated ,
              ModifiedBy ,
              DateModified ,
              ApprovedBy ,
              DateApproved ,
              --,D2Ktimestamp
              DUNSNo ,
              CIBILPGId ,
              CityName ,
              ScrCrErrorSeq 
       FROM RBL_TEMPDB.TempAdvCustCommunicationDetail T
        WHERE  NVL(T.IsChanged, 'U') IN ( 'N','C' )
      );
   MERGE INTO A 
   USING (SELECT A.ROWID row_id, B.UCIF_ID, B.UCIFEntityID
   FROM A ,RBL_MISDB_PROD.AdvCustCommunicationDetail A
          LEFT JOIN RBL_MISDB_PROD.CustomerBasicDetail B   ON A.CustomerEntityid = B.CustomerEntityID ) src
   ON ( A.ROWID = src.row_id )
   WHEN MATCHED THEN UPDATE SET A.UCIF_ID = src.UCIF_ID,
                                A.UCIFEntityID = src.UCIFEntityID;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "MAIN_PRO";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "MAIN_PRO";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "ETL_MAIN_RBL_MISDB_PROD"."ADVCUSTCOMMUNICATIONDETAIL_MAIN_04122023" TO "ADF_CDR_RBL_STGDB";
