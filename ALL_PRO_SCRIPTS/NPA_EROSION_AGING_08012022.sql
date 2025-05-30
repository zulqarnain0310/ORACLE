--------------------------------------------------------
--  DDL for Procedure NPA_EROSION_AGING_08012022
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."NPA_EROSION_AGING_08012022" /*=========================================
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
         /*  BELOW CODE COMMENTED AS PER DISCUSSIONS WITH Bank TEAM ASHISH SIR ON 31-12-2021 - TO AVOID EXECUTION OF EROSION ON 31-12-2021 -- NEED TO ENABLE WHNE DEC'2021 MOC PROCESS*/
         --IF (	 (MONTH(@PROCESSDATE) IN(3,12) AND DAY(@PROCESSDATE)=31)
         --	  OR (MONTH(@PROCESSDATE) IN(6,9)  AND DAY(@PROCESSDATE)=30)
         --	)
         ----- AS PER DISCUSSIONS AND DOCUMENT EORION WILL BE EXECUTING PN QTR END DATE
         --BEGIN
         --		--DECLARE @MoveToDB1 DECIMAL(5,2) =(SELECT cast(RefValue/100.00 as decimal(5,2))FROM PRO.refperiod where BusinessRule='MoveToDB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --		--DECLARE @MoveToLoss DECIMAL(5,2)=(SELECT cast(RefValue/100.00 as decimal(5,2)) FROM PRO.refperiod where BusinessRule='MoveToLoss' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --		DECLARE @MoveToDB1 DECIMAL(5,2) =(SELECT cast(RefValue/100.00 as decimal(5,2))FROM DIMSECURITYEROSIONMASTER where BusinessRule='Sub-Standard to Doubtful 1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --		DECLARE @MoveToLoss DECIMAL(5,2)=(SELECT cast(RefValue/100.00 as decimal(5,2)) FROM DIMSECURITYEROSIONMASTER where BusinessRule='Direct Loss' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --		IF OBJECT_ID('TEMPDB..#CTE_CustomerWiseBalance') IS NOT NULL
         --		   DROP TABLE #CTE_CustomerWiseBalance
         --		SELECT A.RefCustomerID,SUM(ISNULL(A.PrincOutStd,0)) NetBalance INTO #CTE_CustomerWiseBalance 
         --		FROM PRO.ACCOUNTCAL A INNER JOIN PRO.CUSTOMERCAL B ON A.RefCustomerID=B.RefCustomerID
         --		WHERE   ( b.SysAssetClassAlt_Key NOT IN (select AssetClassAlt_Key 
         --		from DimAssetClass where AssetClassShortName ='STD' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY )
         --		AND SecApp='S' --ADDED ON 23102021 AMAR - FOR RBL ONLY SECURED ACCOUNTS FILTER
         --		 --AND ISNULL(B.FlgDeg,'N')<>'Y'
         --		 )
         --		 AND (ISNULL(B.FlgProcessing,'N')='N') 
         --		 and ISNULL(A.PrincOutStd,0)>0
         --		GROUP BY A.RefCustomerID
         --			/*----INTIAL LEVEL LossDt FlgErosion,ErosionDt NULL ------*/
         --			UPDATE B SET   B.FlgErosion='N',B.ErosionDt=NULL  FROM PRO.CustomerCal B
         --			--B.LossDt=NULL,B.FlgErosion='N',B.ErosionDt=NULL
         --			--------UPDATE B SET B.FlgErosion='N',B.ErosionDt=NULL
         --			--------FROM  PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.RefCustomerID=B.RefCustomerID
         --			--------INNER JOIN #CTE_CustomerWiseBalance C ON C.RefCustomerID=B.RefCustomerID
         --			--------INNER JOIN DimAssetClass D ON D.AssetClassAlt_Key=B.SysAssetClassAlt_Key AND (D.EffectiveFromTimeKey<=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY)
         --			--------WHERE ISNULL(A.NetBalance,0)>0  AND D.AssetClassShortName<>'STD' AND (ISNULL(B.FlgProcessing,'N')='N')
         --			--------OPTION(RECOMPILE)
         ----------/*---UPDATING ASSET CLASS ON DUE TO EROSION OF SECURITY AND DBTDT AND LOSS DT DUE TO EROSION */
         ---------------------New Logic 
         --		UPDATE  B SET B.SysAssetClassAlt_Key=
         --							  (CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.NetBalance,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='LOS' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY)
         --								   WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.NetBalance,0)>= ISNULL(B.CurntQtrRv,0)) AND  D.AssetClassShortName IN('SUB')  THEN   (SELECT AssetClassAlt_Key FROM DimAssetClass WHERE AssetClassShortName='DB1' AND EffectiveFromTimeKey<=@TIMEKEY AND EffectiveToTimeKey>=@TIMEKEY) 
         --								   ELSE B.SysAssetClassAlt_Key
         --							   END)
         --						,B.LossDt=CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.NetBalance,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN @PROCESSDATE
         --									ELSE LossDt  END
         --						,B.DbtDt= CASE  WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.NetBalance,0)>= ISNULL(B.CurntQtrRv,0))AND 
         --									   D.AssetClassShortName IN('SUB')   THEN @PROCESSDATE ELSE DbtDt END -- Change 08/06/2018
         --						,B.FlgErosion=  CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.NetBalance,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN  'Y'
         --								   WHEN    ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.NetBalance,0)>= ISNULL(B.CurntQtrRv,0)) 
         --									AND  D.AssetClassShortName IN('SUB')  THEN  'Y'
         --								   ELSE 'N'
         --							   END
         --						,B.ErosionDt=CASE WHEN  ISNULL(B.CurntQtrRv,0)< (ISNULL(C.NetBalance,0) *@MoveToLoss) AND D.AssetClassShortName<>'LOS' THEN  @PROCESSDATE
         --											 WHEN  ISNULL(B.CurntQtrRv,0) <(ISNULL(B.PrvQtrRV,0) *@MoveToDB1) AND (ISNULL(C.NetBalance,0)>= ISNULL(B.CurntQtrRv,0)) 
         --												  AND  D.AssetClassShortName IN('SUB')  THEN  @PROCESSDATE
         --								   ELSE B.ErosionDt
         --							   END
         --		FROM  PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.RefCustomerID=B.RefCustomerID
         --		INNER JOIN #CTE_CustomerWiseBalance C ON C.RefCustomerID=B.RefCustomerID
         --		INNER JOIN DimAssetClass D ON D.AssetClassAlt_Key=B.SysAssetClassAlt_Key AND (D.EffectiveFromTimeKey<=@TIMEKEY AND D.EffectiveToTimeKey>=@TIMEKEY)
         --		WHERE ISNULL(A.PrincOutStd,0)>0  AND D.AssetClassShortName<>'STD'  AND (ISNULL(B.FlgProcessing,'N')='N')
         --		 --and ISNULL(B.CurntQtrRv,0)>0
         --		 /*----and ISNULL(B.PrvQtrRV,0)>0   -- amar commented on 23102021 for ignore this condition */
         -- END  -----END OF EROSION UPDATED=S
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

         FROM  PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.RefCustomerID=B.RefCustomerID
         INNER JOIN #CTE_CustomerWiseBalance C ON C.RefCustomerID=B.RefCustomerID
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
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
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
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
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
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
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'NPA_Erosion_Aging';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."NPA_EROSION_AGING_08012022" TO "ADF_CDR_RBL_STGDB";
