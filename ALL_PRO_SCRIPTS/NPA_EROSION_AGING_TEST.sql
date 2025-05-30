--------------------------------------------------------
--  DDL for Procedure NPA_EROSION_AGING_TEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."NPA_EROSION_AGING_TEST" /*=========================================
 AUTHER : TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : UPDATE  SysAssetClassAlt_Key  NPA Erosion Aging
 --EXEC [PRO].[NPA_Erosion_Aging] @TIMEKEY=24910
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS
--WITH RECOMPILE

BEGIN

   BEGIN
      DECLARE
         v_PROCESSDATE VARCHAR2(200) := ( SELECT DATE_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );
         --and ISNULL(B.CurntQtrRv,0)>0
         /*----and ISNULL(B.PrvQtrRV,0)>0   -- amar commented on 23102021 for ignore this condition */
         -----END OF EROSION UPDATED=S
         /* Old Logic Commented by Sunil on 30/11/2020

         UPDATE  B SET B.SysAssetClassAlt_Key=

           (CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.BALANCE,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='LOS' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
                WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.BALANCE,0)<= ISNULL(B.CurntQtrRv,0)) AND  D.AssetClassShortName IN('SUB')  THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='DB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY) 
         	   ELSE B.SysAssetClassAlt_Key
            END)

         ,B.LossDt=CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.BALANCE,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN @PROCESSDATE
                 ELSE LossDt  END

         ,B.DbtDt= CASE  WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.BALANCE,0)<= ISNULL(B.CurntQtrRv,0))AND 
                    D.AssetClassShortName IN('SUB')   THEN @PROCESSDATE ELSE DbtDt END -- Change 08/06/2018

         ,B.FlgErosion=  CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.BALANCE,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN  'Y'
                WHEN    ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.BALANCE,0)<= ISNULL(B.CurntQtrRv,0)) 
         	    AND  D.AssetClassShortName IN('SUB')  THEN  'Y'
         	   ELSE 'N'
            END

         ,B.ErosionDt=CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.BALANCE,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN  @PROCESSDATE

                          WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.BALANCE,0)<= ISNULL(B.CurntQtrRv,0)) 
         				      AND  D.AssetClassShortName IN('SUB')  THEN  @PROCESSDATE
         	   ELSE B.ErosionDt
            END

         FROM  PRO.ACCOUNTCAL_test A INNER JOIN PRO.CUSTOMERCAL_test B ON A.RefCustomerID=B.RefCustomerID
         INNER JOIN tt_CTE_CustomerWiseBalance_4 C ON C.RefCustomerID=B.RefCustomerID
         INNER JOIN DimAssetClass D ON D.AssetClassAlt_Key=B.SysAssetClassAlt_Key AND (D.EffectiveFromTimeKey<=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY)
         WHERE ISNULL(A.Balance,0)>0  AND D.AssetClassShortName<>'STD'  AND (ISNULL(B.FlgProcessing,'N')='N') and ISNULL(B.CurntQtrRv,0)>0

         */
         --OPTION(RECOMPILE)
         /*-------------------UPDATING ASSET CLASS DUE TO AGING--------*/
         --DECLARE @SUB_Days INT =(SELECT RefValue FROM PRO.refperiod WHERE BusinessRule='SUB_Days')
         --DECLARE @DB1_Days INT =(SELECT RefValue FROM PRO.refperiod WHERE BusinessRule='DB1_Days')
         --DECLARE @DB2_Days INT =(SELECT RefValue FROM PRO.refperiod WHERE BusinessRule='DB2_Days')
         v_SUB_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM DIMNPAAGEINGMASTER 
          WHERE  BusinessRule = 'Sub-Standard to Doubtful 1'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_DB1_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM DIMNPAAGEINGMASTER 
          WHERE  BusinessRule = 'Doubtful 1 to Doubtful 2'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );
         v_DB2_Days NUMBER(10,0) := ( SELECT RefValue 
           FROM DIMNPAAGEINGMASTER 
          WHERE  BusinessRule = 'Doubtful 2 to Doubtful 3'
                   AND EffectiveFromTimeKey <= v_TIMEKEY
                   AND EffectiveToTimeKey >= v_TIMEKEY );

      BEGIN
         /*  BELOW CODE COMMENTED AS PER DISCUSSIONS WITH SHARMA SIR - TO AVOID EXECUTION OF EROSION ON 30-09-2021 -- NEED TO ENABLE AND DISCUSS AFTER 30TH SEP  */
         IF ( ( utils.month_(v_PROCESSDATE) IN ( 3,12 )

           AND utils.day_(v_PROCESSDATE) = 31 )
           OR ( utils.month_(v_PROCESSDATE) IN ( 6,9 )

           AND utils.day_(v_PROCESSDATE) = 30 ) ) THEN
          DECLARE
            --DECLARE @MoveToDB1 DECIMAL(5,2) =(SELECT cast(RefValue/100.00 as decimal(5,2))FROM PRO.refperiod where BusinessRule='MoveToDB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
            --DECLARE @MoveToLoss DECIMAL(5,2)=(SELECT cast(RefValue/100.00 as decimal(5,2)) FROM PRO.refperiod where BusinessRule='MoveToLoss' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
            v_MoveToDB1 NUMBER(5,2) := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue / 100.00,5,2) 
              FROM DIMSECURITYEROSIONMASTER 
             WHERE  BusinessRule = 'Sub-Standard to Doubtful 1'
                      AND EffectiveFromTimeKey <= v_TIMEKEY
                      AND EffectiveToTimeKey >= v_TIMEKEY );
            v_MoveToLoss NUMBER(5,2) := ( SELECT UTILS.CONVERT_TO_NUMBER(RefValue / 100.00,5,2) 
              FROM DIMSECURITYEROSIONMASTER 
             WHERE  BusinessRule = 'Direct Loss'
                      AND EffectiveFromTimeKey <= v_TIMEKEY
                      AND EffectiveToTimeKey >= v_TIMEKEY );


         --- AS PER DISCUSSIONS AND DOCUMENT EORION WILL BE EXECUTING PN QTR END DATE
         BEGIN
            IF utils.object_id('TEMPDB..tt_CTE_CustomerWiseBalance_4') IS NOT NULL THEN
             EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CTE_CustomerWiseBalance_4 ';
            END IF;
            DELETE FROM tt_CTE_CustomerWiseBalance_4;
            UTILS.IDENTITY_RESET('tt_CTE_CustomerWiseBalance_4');

            INSERT INTO tt_CTE_CustomerWiseBalance_4 ( 
            	SELECT A.RefCustomerID ,
                    SUM(NVL(A.PrincOutStd, 0))  NetBalance  
            	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                      JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID
            	 WHERE  ( b.SysAssetClassAlt_Key NOT IN ( SELECT AssetClassAlt_Key 
                                                       FROM DimAssetClass 
                                                        WHERE  AssetClassShortName = 'STD'
                                                                 AND EffectiveFromTimeKey <= v_TIMEKEY
                                                                 AND EffectiveToTimeKey >= v_TIMEKEY )

                       AND SecApp = 'S' --ADDED ON 23102021 AMAR - FOR RBL ONLY SECURED ACCOUNTS FILTER
                      )

                       --AND ISNULL(B.FlgDeg,'N')<>'Y'
                       AND ( NVL(B.FlgProcessing, 'N') = 'N' )
                       AND NVL(A.PrincOutStd, 0) > 0
            	  GROUP BY A.RefCustomerID );
            /*----INTIAL LEVEL LossDt FlgErosion,ErosionDt NULL ------*/
            MERGE INTO B 
            USING (SELECT B.ROWID row_id, 'N', NULL
            FROM B ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B ) src
            ON ( B.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.FlgErosion = 'N',
                                         B.ErosionDt = NULL;
            --B.LossDt=NULL,B.FlgErosion='N',B.ErosionDt=NULL
            --------UPDATE B SET B.FlgErosion='N',B.ErosionDt=NULL
            --------FROM  PRO.ACCOUNTCAL_test A INNER JOIN PRO.CUSTOMERCAL_test B ON A.RefCustomerID=B.RefCustomerID
            --------INNER JOIN tt_CTE_CustomerWiseBalance_4 C ON C.RefCustomerID=B.RefCustomerID
            --------INNER JOIN DimAssetClass D ON D.AssetClassAlt_Key=B.SysAssetClassAlt_Key AND (D.EffectiveFromTimeKey<=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY)
            --------WHERE ISNULL(A.NetBalance,0)>0  AND D.AssetClassShortName<>'STD' AND (ISNULL(B.FlgProcessing,'N')='N')
            --------OPTION(RECOMPILE)
            --------/*---UPDATING ASSET CLASS ON DUE TO EROSION OF SECURITY AND DBTDT AND LOSS DT DUE TO EROSION */
            -------------------New Logic 
            MERGE INTO B 
            USING (SELECT B.ROWID row_id, (CASE 
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(C.NetBalance, 0) * v_MoveToLoss)
              AND D.AssetClassShortName <> 'LOS' THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                        FROM DimAssetClass 
                                                         WHERE  DIMASSETCLASS.AssetClassShortName = 'LOS'
                                                                  AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                  AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(B.PrvQtrRV, 0) * v_MoveToDB1)
              AND ( NVL(C.NetBalance, 0) >= NVL(B.CurntQtrRv, 0) )
              AND D.AssetClassShortName IN ( 'SUB' )
             THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                    FROM DimAssetClass 
                     WHERE  DIMASSETCLASS.AssetClassShortName = 'DB1'
                              AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                              AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
            ELSE B.SysAssetClassAlt_Key
               END) AS pos_2, CASE 
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(C.NetBalance, 0) * v_MoveToLoss)
              AND D.AssetClassShortName <> 'LOS' THEN v_PROCESSDATE
            ELSE LossDt
               END AS pos_3, CASE 
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(B.PrvQtrRV, 0) * v_MoveToDB1)
              AND ( NVL(C.NetBalance, 0) >= NVL(B.CurntQtrRv, 0) )
              AND D.AssetClassShortName IN ( 'SUB' )
             THEN v_PROCESSDATE
            ELSE DbtDt
               END AS pos_4, CASE 
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(C.NetBalance, 0) * v_MoveToLoss)
              AND D.AssetClassShortName <> 'LOS' THEN 'Y'
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(B.PrvQtrRV, 0) * v_MoveToDB1)
              AND ( NVL(C.NetBalance, 0) >= NVL(B.CurntQtrRv, 0) )
              AND D.AssetClassShortName IN ( 'SUB' )
             THEN 'Y'
            ELSE 'N'
               END AS pos_5, CASE 
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(C.NetBalance, 0) * v_MoveToLoss)
              AND D.AssetClassShortName <> 'LOS' THEN v_PROCESSDATE
            WHEN NVL(B.CurntQtrRv, 0) < (NVL(B.PrvQtrRV, 0) * v_MoveToDB1)
              AND ( NVL(C.NetBalance, 0) >= NVL(B.CurntQtrRv, 0) )
              AND D.AssetClassShortName IN ( 'SUB' )
             THEN v_PROCESSDATE
            ELSE B.ErosionDt
               END AS pos_6
            FROM B ,PRO_RBL_MISDB_PROD.ACCOUNTCAL_TEST A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL_test B   ON A.RefCustomerID = B.RefCustomerID
                   JOIN tt_CTE_CustomerWiseBalance_4 C   ON C.RefCustomerID = B.RefCustomerID
                   JOIN DimAssetClass D   ON D.AssetClassAlt_Key = B.SysAssetClassAlt_Key
                   AND ( D.EffectiveFromTimeKey <= v_TIMEKEY
                   AND D.EffectiveToTimeKey >= v_TIMEKEY ) 
             WHERE NVL(A.PrincOutStd, 0) > 0
              AND D.AssetClassShortName <> 'STD'
              AND ( NVL(B.FlgProcessing, 'N') = 'N' )) src
            ON ( B.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.SysAssetClassAlt_Key = pos_2,
                                         B.LossDt = pos_3,
                                         B.DbtDt -- Change 08/06/2018
                                          = pos_4,
                                         B.FlgErosion = pos_5,
                                         B.ErosionDt = pos_6;

         END;
         END IF;
         /*------INTIAL LEVEL  DBTDT IS SET TO NULL------*/
         /*---CALCULATE SysAssetClassAlt_Key,DbtDt ------------------ */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN utils.dateadd('MONTH', v_SUB_Days, A.SysNPA_Dt) > v_PROCESSDATE THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                     FROM DimAssetClass 
                                                                                      WHERE  DIMASSETCLASS.AssetClassShortName = 'SUB'
                                                                                               AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                               AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('MONTH', v_SUB_Days, A.SysNPA_Dt) <= v_PROCESSDATE
           AND utils.dateadd('MONTH', v_SUB_Days + v_DB1_Days, A.SysNPA_Dt) > v_PROCESSDATE THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                   FROM DimAssetClass 
                                                                                                    WHERE  DIMASSETCLASS.AssetClassShortName = 'DB1'
                                                                                                             AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                             AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('MONTH', v_SUB_Days + v_DB1_Days, A.SysNPA_Dt) <= v_PROCESSDATE
           AND utils.dateadd('MONTH', v_SUB_Days + v_DB1_Days + v_DB2_Days, A.SysNPA_Dt) > v_PROCESSDATE THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                                FROM DimAssetClass 
                                                                                                                 WHERE  DIMASSETCLASS.AssetClassShortName = 'DB2'
                                                                                                                          AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                          AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )
         WHEN utils.dateadd('MONTH', (v_DB1_Days + v_SUB_Days + v_DB2_Days), A.SysNPA_Dt) <= v_PROCESSDATE THEN ( SELECT DIMASSETCLASS.AssetClassAlt_Key 
                                                                                                                  FROM DimAssetClass 
                                                                                                                   WHERE  DIMASSETCLASS.AssetClassShortName = 'DB3'
                                                                                                                            AND DIMASSETCLASS.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                            AND DIMASSETCLASS.EffectiveToTimeKey >= v_TIMEKEY )   END) AS pos_2, (CASE 
         WHEN utils.dateadd('MONTH', v_SUB_Days, A.SysNPA_Dt) <= v_PROCESSDATE
           AND utils.dateadd('MONTH', v_SUB_Days + v_DB1_Days, A.SysNPA_Dt) > v_PROCESSDATE THEN utils.dateadd('MONTH', v_SUB_Days, A.SysNPA_Dt)
         WHEN utils.dateadd('MONTH', v_SUB_Days + v_DB1_Days, A.SysNPA_Dt) <= v_PROCESSDATE
           AND utils.dateadd('MONTH', v_SUB_Days + v_DB1_Days + v_DB2_Days, A.SysNPA_Dt) > v_PROCESSDATE THEN utils.dateadd('MONTH', v_SUB_Days, A.SysNPA_Dt)
         WHEN utils.dateadd('MONTH', (v_DB1_Days + v_SUB_Days + v_DB2_Days), A.SysNPA_Dt) <= v_PROCESSDATE THEN utils.dateadd('MONTH', (v_SUB_Days), A.SysNPA_Dt)
         ELSE DBTDT
            END) AS pos_3
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN DimAssetClass B   ON A.SysAssetClassAlt_Key = B.AssetClassAlt_Key
                AND B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE B.AssetClassShortName NOT IN ( 'STD','LOS' )

           AND NVL(A.FlgDeg, 'N') <> 'Y'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND A.SYSNPA_DT IS NOT NULL
           AND NVL(A.FlgErosion, 'N') <> 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = pos_2,
                                      A.DBTDT = pos_3;
         ---HANDLE ASSET CLASS FROM SOURCE DOUBT FUL BUT ON THE BASES OF NPA SUB SO CONDITION MODIFY---
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, SrcAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN DimAssetClass B   ON A.SrcAssetClassAlt_Key = B.AssetClassAlt_Key 
          WHERE B.AssetClassShortName IN ( 'DB1','DB2','DB3' )

           AND NVL(A.FlgDeg, 'N') <> 'Y'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND A.SysNPA_Dt IS NOT NULL
           AND SysAssetClassAlt_Key = 2
           AND NVL(FlgMoc, 'N') <> 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = SrcAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, SrcAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN DimAssetClass B   ON A.SrcAssetClassAlt_Key = B.AssetClassAlt_Key 
          WHERE B.AssetClassShortName IN ( 'DB2' )

           AND NVL(A.FlgDeg, 'N') <> 'Y'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND A.SysNPA_Dt IS NOT NULL
           AND SysAssetClassAlt_Key IN ( 2,3 )

           AND NVL(FlgMoc, 'N') <> 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = SrcAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, SrcAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN DimAssetClass B   ON A.SrcAssetClassAlt_Key = B.AssetClassAlt_Key 
          WHERE B.AssetClassShortName IN ( 'DB3' )

           AND NVL(A.FlgDeg, 'N') <> 'Y'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND A.SysNPA_Dt IS NOT NULL
           AND SysAssetClassAlt_Key IN ( 2,3,4 )

           AND NVL(FlgMoc, 'N') <> 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = SrcAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, SrcAssetClassAlt_Key
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL_test A
                JOIN DimAssetClass B   ON A.SrcAssetClassAlt_Key = B.AssetClassAlt_Key 
          WHERE B.AssetClassShortName IN ( 'LOS' )

           AND NVL(A.FlgDeg, 'N') <> 'Y'
           AND ( NVL(A.FlgProcessing, 'N') = 'N' )
           AND A.SysNPA_Dt IS NOT NULL
           AND SysAssetClassAlt_Key IN ( 2,3,4,5 )

           AND NVL(FlgMoc, 'N') <> 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = SrcAssetClassAlt_Key;
         ------------------------------------
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'NPA_Erosion_Aging';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      -----------------Added for DashBoard 04-03-2021
      --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus_TEST
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'NPA_Erosion_Aging';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_TEST" TO "ADF_CDR_RBL_STGDB";
