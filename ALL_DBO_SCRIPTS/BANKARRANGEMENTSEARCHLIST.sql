--------------------------------------------------------
--  DDL for Procedure BANKARRANGEMENTSEARCHLIST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" 
(
  v_ArrangementDescription IN VARCHAR2 DEFAULT ' ' ,
  --@PageNo         INT         = 1, --@PageSize       INT         = 10, 
  v_OperationFlag IN NUMBER DEFAULT 1 
)
AS
   v_TimeKey NUMBER(10,0);
   v_cursor SYS_REFCURSOR;

BEGIN

   SELECT Timekey 

     INTO v_Timekey
     FROM SysDataMatrix 
    WHERE  CurrentStatus = 'C';
   BEGIN

      BEGIN
         /*  IT IS Used FOR GRID Search which are not Pending for Authorization And also used for Re-Edit    */
         --------- ADD LOGIC TO CHECK THE ACL PROCESS IS RUNNING OR NOT BY SATWAJI AS ON 28/08/2023 ------------------
         IF ( v_OperationFlag IN ( 1,2,3,16,17,20 )
          ) THEN

         BEGIN
            DBMS_OUTPUT.PUT_LINE('ACL Process Status Check');
            ACLProcessStatusCheck() ;

         END;
         END IF;
         IF ( v_OperationFlag NOT IN ( 16,17,20 )
          ) THEN

         BEGIN
            IF utils.object_id('TempDB..tt_temp_14') IS NOT NULL THEN
             EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_temp_14 ';
            END IF;
            DELETE FROM tt_temp_14;
            UTILS.IDENTITY_RESET('tt_temp_14');

            INSERT INTO tt_temp_14 ( 
            	SELECT A.BankingArrangementAlt_Key ,
                    A.ArrangementDescription ,
                    A.AuthorisationStatus ,
                    A.EffectiveFromTimeKey ,
                    A.EffectiveToTimeKey ,
                    A.CreatedBy ,
                    A.DateCreated ,
                    A.ApprovedBy ,
                    A.DateApproved ,
                    A.ModifiedBy ,
                    A.DateModified ,
                    A.CrModBy ,
                    A.CrModDate ,
                    A.CrAppBy ,
                    A.CrAppDate ,
                    A.ModAppBy ,
                    A.ModAppDate 
            	  FROM ( SELECT A.BankingArrangementAlt_Key ,
                             A.ArrangementDescription ,
                             NVL(A.AuthorisationStatus, 'A') AuthorisationStatus  ,
                             A.EffectiveFromTimeKey ,
                             A.EffectiveToTimeKey ,
                             A.CreatedBy ,
                             A.DateCreated ,
                             A.ApprovedBy ,
                             A.DateApproved ,
                             A.ModifiedBy ,
                             A.DateModified ,
                             NVL(A.ModifiedBy, A.CreatedBy) CrModBy  ,
                             NVL(A.DateModified, A.DateCreated) CrModDate  ,
                             NVL(A.ApprovedBy, A.CreatedBy) CrAppBy  ,
                             NVL(A.DateApproved, A.DateCreated) CrAppDate  ,
                             NVL(A.ApprovedBy, A.ModifiedBy) ModAppBy  ,
                             NVL(A.DateApproved, A.DateModified) ModAppDate  
                      FROM DimBankingArrangement A
                       WHERE  A.EffectiveFromTimeKey <= v_TimeKey
                                AND A.EffectiveToTimeKey >= v_TimeKey
                                AND NVL(A.AuthorisationStatus, 'A') = 'A'
                      UNION 
                      SELECT A.BankingArrangementAlt_Key ,
                             A.ArrangementDescription ,
                             NVL(A.AuthorisationStatus, 'A') AuthorisationStatus  ,
                             A.EffectiveFromTimeKey ,
                             A.EffectiveToTimeKey ,
                             A.CreatedBy ,
                             A.DateCreated ,
                             A.ApprovedBy ,
                             A.DateApproved ,
                             A.ModifiedBy ,
                             A.DateModified ,
                             NVL(A.ModifiedBy, A.CreatedBy) CrModBy  ,
                             NVL(A.DateModified, A.DateCreated) CrModDate  ,
                             NVL(A.ApprovedBy, A.CreatedBy) CrAppBy  ,
                             NVL(A.DateApproved, A.DateCreated) CrAppDate  ,
                             NVL(A.ApprovedBy, A.ModifiedBy) ModAppBy  ,
                             NVL(A.DateApproved, A.DateModified) ModAppDate  
                      FROM DimBankingArrangement_Mod A
                       WHERE  A.EffectiveFromTimeKey <= v_TimeKey
                                AND A.EffectiveToTimeKey >= v_TimeKey

                                --AND ISNULL(AuthorisationStatus, 'A') IN('NP', 'MP', 'DP')
                                AND A.EntityKey IN ( SELECT MAX(EntityKey)  
                                                     FROM DimBankingArrangement_Mod 
                                                      WHERE  EffectiveFromTimeKey <= v_TimeKey
                                                               AND EffectiveToTimeKey >= v_TimeKey
                                                               AND NVL(AuthorisationStatus, 'A') IN ( 'NP','MP','DP','RM','1A' )

                                                       GROUP BY BankingArrangementAlt_Key )
                     ) A
            	  GROUP BY A.BankingArrangementAlt_Key,A.ArrangementDescription,A.AuthorisationStatus,A.EffectiveFromTimeKey,A.EffectiveToTimeKey,A.CreatedBy,A.DateCreated,A.ApprovedBy,A.DateApproved,A.ModifiedBy,A.DateModified,A.CrModBy,A.CrModDate,A.CrAppBy,A.CrAppDate,A.ModAppBy,A.ModAppDate );
            OPEN  v_cursor FOR
               SELECT * 
                 FROM ( SELECT ROW_NUMBER() OVER ( ORDER BY BankingArrangementAlt_Key  ) RowNumber  ,
                               COUNT(*) OVER ( ) TotalCount  ,
                               'BankingArrangementMaster' TableName  ,
                               * 
                        FROM ( SELECT * 
                               FROM tt_temp_14 A
                                WHERE  NVL(ArrangementDescription, ' ') LIKE '%' || v_ArrangementDescription || '%' ) DataPointOwner ) DataPointOwner ;
               DBMS_SQL.RETURN_RESULT(v_cursor);

         END;

         --WHERE RowNumber >= ((@PageNo - 1) * @PageSize) + 1

         --      AND RowNumber <= (@PageNo * @PageSize);
         ELSE
            /*  IT IS Used For GRID Search which are Pending for Authorization    */
            IF ( v_OperationFlag IN ( 16,17 )
             ) THEN

            BEGIN
               IF utils.object_id('TempDB..tt_temp_1416') IS NOT NULL THEN
                EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_temp16_7 ';
               END IF;
               DELETE FROM tt_temp16_7;
               UTILS.IDENTITY_RESET('tt_temp16_7');

               INSERT INTO tt_temp16_7 ( 
               	SELECT A.BankingArrangementAlt_Key ,
                       A.ArrangementDescription ,
                       A.AuthorisationStatus ,
                       A.EffectiveFromTimeKey ,
                       A.EffectiveToTimeKey ,
                       A.CreatedBy ,
                       A.DateCreated ,
                       A.ApprovedBy ,
                       A.DateApproved ,
                       A.ModifiedBy ,
                       A.DateModified ,
                       A.CrModBy ,
                       A.CrModDate ,
                       A.CrAppBy ,
                       A.CrAppDate ,
                       A.ModAppBy ,
                       A.ModAppDate 
               	  FROM ( SELECT A.BankingArrangementAlt_Key ,
                                A.ArrangementDescription ,
                                NVL(A.AuthorisationStatus, 'A') AuthorisationStatus  ,
                                A.EffectiveFromTimeKey ,
                                A.EffectiveToTimeKey ,
                                A.CreatedBy ,
                                A.DateCreated ,
                                A.ApprovedBy ,
                                A.DateApproved ,
                                A.ModifiedBy ,
                                A.DateModified ,
                                NVL(A.ModifiedBy, A.CreatedBy) CrModBy  ,
                                NVL(A.DateModified, A.DateCreated) CrModDate  ,
                                NVL(A.ApprovedBy, A.CreatedBy) CrAppBy  ,
                                NVL(A.DateApproved, A.DateCreated) CrAppDate  ,
                                NVL(A.ApprovedBy, A.ModifiedBy) ModAppBy  ,
                                NVL(A.DateApproved, A.DateModified) ModAppDate  
                         FROM DimBankingArrangement_Mod A
                          WHERE  A.EffectiveFromTimeKey <= v_TimeKey
                                   AND A.EffectiveToTimeKey >= v_TimeKey

                                   --AND ISNULL(AuthorisationStatus, 'A') IN('NP', 'MP', 'DP')
                                   AND A.EntityKey IN ( SELECT MAX(EntityKey)  
                                                        FROM DimBankingArrangement_Mod 
                                                         WHERE  EffectiveFromTimeKey <= v_TimeKey
                                                                  AND EffectiveToTimeKey >= v_TimeKey
                                                                  AND NVL(AuthorisationStatus, 'A') IN ( 'NP','MP','DP','RM' )

                                                          GROUP BY BankingArrangementAlt_Key )
                        ) A
               	  GROUP BY A.BankingArrangementAlt_Key,A.ArrangementDescription,A.AuthorisationStatus,A.EffectiveFromTimeKey,A.EffectiveToTimeKey,A.CreatedBy,A.DateCreated,A.ApprovedBy,A.DateApproved,A.ModifiedBy,A.DateModified,A.CrModBy,A.CrModDate,A.CrAppBy,A.CrAppDate,A.ModAppBy,A.ModAppDate );
               OPEN  v_cursor FOR
                  SELECT * 
                    FROM ( SELECT ROW_NUMBER() OVER ( ORDER BY BankingArrangementAlt_Key  ) RowNumber  ,
                                  COUNT(*) OVER ( ) TotalCount  ,
                                  'BankingArrangementMaster' TableName  ,
                                  * 
                           FROM ( SELECT * 
                                  FROM tt_temp16_7 A
                                   WHERE  NVL(ArrangementDescription, ' ') LIKE '%' || v_ArrangementDescription || '%' ) DataPointOwner ) DataPointOwner ;
                  DBMS_SQL.RETURN_RESULT(v_cursor);

            END;

            --WHERE RowNumber >= ((@PageNo - 1) * @PageSize) + 1

            --      AND RowNumber <= (@PageNo * @PageSize)
            ELSE
               IF ( v_OperationFlag = 20 ) THEN

               BEGIN
                  IF utils.object_id('TempDB..tt_temp_1420') IS NOT NULL THEN
                   EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_temp20_7 ';
                  END IF;
                  DELETE FROM tt_temp20_7;
                  UTILS.IDENTITY_RESET('tt_temp20_7');

                  INSERT INTO tt_temp20_7 ( 
                  	SELECT A.BankingArrangementAlt_Key ,
                          A.ArrangementDescription ,
                          A.AuthorisationStatus ,
                          A.EffectiveFromTimeKey ,
                          A.EffectiveToTimeKey ,
                          A.CreatedBy ,
                          A.DateCreated ,
                          A.ApprovedBy ,
                          A.DateApproved ,
                          A.ModifiedBy ,
                          A.DateModified ,
                          A.CrModBy ,
                          A.CrModDate ,
                          A.CrAppBy ,
                          A.CrAppDate ,
                          A.ModAppBy ,
                          A.ModAppDate 
                  	  FROM ( SELECT A.BankingArrangementAlt_Key ,
                                   A.ArrangementDescription ,
                                   --isnull(A.AuthorisationStatus, 'A') 
                                   A.AuthorisationStatus ,
                                   A.EffectiveFromTimeKey ,
                                   A.EffectiveToTimeKey ,
                                   A.CreatedBy ,
                                   A.DateCreated ,
                                   A.ApprovedBy ,
                                   A.DateApproved ,
                                   A.ModifiedBy ,
                                   A.DateModified ,
                                   NVL(A.ModifiedBy, A.CreatedBy) CrModBy  ,
                                   NVL(A.DateModified, A.DateCreated) CrModDate  ,
                                   NVL(A.ApprovedBy, A.CreatedBy) CrAppBy  ,
                                   NVL(A.DateApproved, A.DateCreated) CrAppDate  ,
                                   NVL(A.ApprovedBy, A.ModifiedBy) ModAppBy  ,
                                   NVL(A.DateApproved, A.DateModified) ModAppDate  
                            FROM DimBankingArrangement_Mod A
                             WHERE  A.EffectiveFromTimeKey <= v_TimeKey
                                      AND A.EffectiveToTimeKey >= v_TimeKey
                                      AND NVL(AuthorisationStatus, 'A') IN ( '1A' )

                                      AND A.EntityKey IN ( SELECT MAX(EntityKey)  
                                                           FROM DimBankingArrangement_Mod 
                                                            WHERE  EffectiveFromTimeKey <= v_TimeKey
                                                                     AND EffectiveToTimeKey >= v_TimeKey
                                                                     AND AuthorisationStatus IN ( '1A' )

                                                             GROUP BY BankingArrangementAlt_Key )
                           ) A
                  	  GROUP BY A.BankingArrangementAlt_Key,A.ArrangementDescription,A.AuthorisationStatus,A.EffectiveFromTimeKey,A.EffectiveToTimeKey,A.CreatedBy,A.DateCreated,A.ApprovedBy,A.DateApproved,A.ModifiedBy,A.DateModified,A.CrModBy,A.CrModDate,A.CrAppBy,A.CrAppDate,A.ModAppBy,A.ModAppDate );
                  OPEN  v_cursor FOR
                     SELECT * 
                       FROM ( SELECT ROW_NUMBER() OVER ( ORDER BY BankingArrangementAlt_Key  ) RowNumber  ,
                                     COUNT(*) OVER ( ) TotalCount  ,
                                     'BankingArrangementMaster' TableName  ,
                                     * 
                              FROM ( SELECT * 
                                     FROM tt_temp20_7 A
                                      WHERE  NVL(ArrangementDescription, ' ') LIKE '%' || v_ArrangementDescription || '%' ) DataPointOwner ) DataPointOwner ;
                     DBMS_SQL.RETURN_RESULT(v_cursor);

               END;
               END IF;
            END IF;
         END IF;

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      --WHERE RowNumber >= ((@PageNo - 1) * @PageSize) + 1
      --      AND RowNumber <= (@PageNo * @PageSize)
      INSERT INTO RBL_MISDB_PROD.Error_Log
        ( SELECT utils.error_line ErrorLine  ,
                 SQLERRM ErrorMessage  ,
                 SQLCODE ErrorNumber  ,
                 utils.error_procedure ErrorProcedure  ,
                 utils.error_severity ErrorSeverity  ,
                 utils.error_state ErrorState  ,
                 SYSDATE 
            FROM DUAL  );
      OPEN  v_cursor FOR
         SELECT SQLERRM 
           FROM DUAL  ;
         DBMS_SQL.RETURN_RESULT(v_cursor);--RETURN -1

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_MISDB_PROD"."BANKARRANGEMENTSEARCHLIST" TO "ADF_CDR_RBL_STGDB";
