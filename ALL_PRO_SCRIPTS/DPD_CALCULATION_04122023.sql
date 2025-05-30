--------------------------------------------------------
--  DDL for Procedure DPD_CALCULATION_04122023
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."DPD_CALCULATION_04122023" /*=========================================
 AUTHER :TRILOKI KHANNA
 CREATE DATE : 27-11-2019
 MODIFY DATE : 27-11-2019
 DESCRIPTION : CALCULATION OF DPD
 --exec  [Pro].[DPD_Calculation]  @timekey=25140
=============================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_ProcessDate VARCHAR2(200) := ( SELECT Date_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );

      BEGIN
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET IntNotServicedDt = NULL
          WHERE  ( IntNotServicedDt = '1900-01-01'
           OR IntNotServicedDt = '01/01/1900' );
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET LastCrDate = NULL
          WHERE  ( LastCrDate = '1900-01-01'
           OR LastCrDate = '01/01/1900' );
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET ContiExcessDt = NULL
          WHERE  ( ContiExcessDt = '1900-01-01'
           OR ContiExcessDt = '01/01/1900' );
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET OverDueSinceDt = NULL
          WHERE  ( OverDueSinceDt = '1900-01-01'
           OR OverDueSinceDt = '01/01/1900' );
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET ReviewDueDt = NULL
          WHERE  ( ReviewDueDt = '1900-01-01'
           OR ReviewDueDt = '01/01/1900' );
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET StockStDt = NULL
          WHERE  ( StockStDt = '1900-01-01'
           OR StockStDt = '01/01/1900' );
         /*------------------INITIAL ALL DPD 0 FOR RE-PROCESSING------------------------------- */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0, 0, 0, 0, 0, 0, 0, 0, 0
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DPD_IntService = 0,
                                      A.DPD_NoCredit = 0,
                                      A.DPD_Overdrawn = 0,
                                      A.DPD_Overdue = 0,
                                      A.DPD_Renewal = 0,
                                      A.DPD_StockStmt = 0,
                                      DPD_PrincOverdue = 0,
                                      DPD_IntOverdueSince = 0,
                                      DPD_OtherOverdueSince = 0;
         /*---------- CALCULATED ALL DPD---------------------------------------------------------*/
         IF v_TIMEKEY > 26267 THEN

          ----IMPLEMENTED FROM 2021-12-01 
         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, CASE 
            WHEN v_TIMEKEY > 26384 THEN (CASE 
                                              WHEN A.IntNotServicedDt IS NOT NULL THEN utils.datediff('DAY', A.IntNotServicedDt, v_ProcessDate) + 2
            ELSE 0
               END)
            ELSE (CASE 
            WHEN A.IntNotServicedDt IS NOT NULL THEN utils.datediff('DAY', A.IntNotServicedDt, v_ProcessDate) + 1
            ELSE 0
               END)
               END AS pos_2, CASE 
            WHEN ( DebitSinceDt IS NULL
              OR utils.datediff('DAY', DebitSinceDt, v_ProcessDate) > 90 ) THEN (CASE 
                                                                                      WHEN A.LastCrDate IS NOT NULL THEN utils.datediff('DAY', A.LastCrDate, v_ProcessDate) + 1
            ELSE 0
               END)
            ELSE 0
               END AS pos_3, (CASE 
            WHEN A.ContiExcessDt IS NOT NULL THEN utils.datediff('DAY', A.ContiExcessDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_4, CASE 
            WHEN v_TIMEKEY > 26372 THEN (CASE 
                                              WHEN A.OverDueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.OverDueSinceDt, v_ProcessDate) + 1
            ELSE 0
               END)
            ELSE (CASE 
            WHEN A.OverDueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.OverDueSinceDt, v_ProcessDate) + (CASE 
                                                                                                                  WHEN SourceAlt_Key = 6 THEN 0
            ELSE 1
               END)
            ELSE 0
               END)
               END AS pos_5, (CASE 
            WHEN A.ReviewDueDt IS NOT NULL THEN utils.datediff('DAY', A.ReviewDueDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_6, (CASE 
            WHEN A.StockStDt IS NOT NULL THEN utils.datediff('DAY', A.StockStDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_7
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.DPD_IntService --28032022 amar - implemmented 90 days summation ccod credit and intt logic
                                          ---             ,A.DPD_NoCredit =  (CASE WHEN  A.LastCrDate IS NOT NULL      THEN DATEDIFF(DAY,A.LastCrDate,  @ProcessDate)       ELSE 0 END)
                                          = pos_2,
                                         A.DPD_NoCredit = pos_3,
                                         A.DPD_Overdrawn = pos_4,
                                         A.DPD_Overdue
                                         ------ AMAR - CHANGES ON 17032021 AS PER EMAIL BY ASHISH SIR DATED - 17-03-2021 1:59 PM - SUBJECT - Credit Card NPA Computation  -- 
                                          = pos_5,
                                         A.DPD_Renewal = pos_6,
                                         A.DPD_StockStmt = pos_7;

         END;
         ELSE

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, (CASE 
            WHEN A.IntNotServicedDt IS NOT NULL THEN utils.datediff('DAY', A.IntNotServicedDt, v_ProcessDate)
            ELSE 0
               END) AS pos_2, CASE 
            WHEN ( DebitSinceDt IS NULL
              OR utils.datediff('DAY', DebitSinceDt, v_ProcessDate) > 90 ) THEN (CASE 
                                                                                      WHEN A.LastCrDate IS NOT NULL THEN utils.datediff('DAY', A.LastCrDate, v_ProcessDate)
            ELSE 0
               END)
            ELSE 0
               END AS pos_3, (CASE 
            WHEN A.ContiExcessDt IS NOT NULL THEN utils.datediff('DAY', A.ContiExcessDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_4, (CASE 
            WHEN A.OverDueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.OverDueSinceDt, v_ProcessDate)
            ELSE 0
               END) AS pos_5, (CASE 
            WHEN A.ReviewDueDt IS NOT NULL THEN utils.datediff('DAY', A.ReviewDueDt, v_ProcessDate)
            ELSE 0
               END) AS pos_6, (CASE 
            WHEN A.StockStDt IS NOT NULL THEN utils.datediff('DAY', A.StockStDt, v_ProcessDate)
            ELSE 0
               END) AS pos_7
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.DPD_IntService
                                         ---             ,A.DPD_NoCredit =  (CASE WHEN  A.LastCrDate IS NOT NULL      THEN DATEDIFF(DAY,A.LastCrDate,  @ProcessDate)       ELSE 0 END)
                                          = pos_2,
                                         A.DPD_NoCredit = pos_3,
                                         A.DPD_Overdrawn = pos_4,
                                         A.DPD_Overdue = pos_5,
                                         A.DPD_Renewal = pos_6,
                                         A.DPD_StockStmt = pos_7;

         END;
         END IF;
         /* AMAR --DEBIT SINCE DATE DPD CALCULATION AND UPDATE IN DPD_Overdrawn AS DISCUSSED WITH SHARMA SIR AND  TRILOKI SIR ON 31082021 */
         /*   amar --commented as per call by Ashish Sir on 02092021

         UPDATE A SET A.DPD_Overdrawn= (CASE WHEN   A.DebitSinceDt IS NOT NULL    THEN DATEDIFF(DAY,A.DebitSinceDt,  @ProcessDate) + 1    ELSE 0 END) 
         FROM PRO.AccountCal A
         	INNER JOIN DimProduct B
         		ON (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY)
         		AND A.ProductAlt_Key=B.ProductAlt_Key
         	WHERE B.SchemeType='ODA'
         		AND ISNULL(A.CurrentLimit,0)=0 and ContiExcessDt IS 
         		*/
         --------
         IF v_TIMEKEY > 26267 THEN

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, (CASE 
            WHEN A.PrincOverdueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.PrincOverdueSinceDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_2, (CASE 
            WHEN A.IntOverdueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.IntOverdueSinceDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_3, (CASE 
            WHEN A.OtherOverdueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.OtherOverdueSinceDt, v_ProcessDate) + 1
            ELSE 0
               END) AS pos_4
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.DPD_PrincOverdue = pos_2,
                                         A.DPD_IntOverdueSince = pos_3,
                                         A.DPD_OtherOverdueSince = pos_4;

         END;
         ELSE

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, (CASE 
            WHEN A.PrincOverdueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.PrincOverdueSinceDt, v_ProcessDate)
            ELSE 0
               END) AS pos_2, (CASE 
            WHEN A.IntOverdueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.IntOverdueSinceDt, v_ProcessDate)
            ELSE 0
               END) AS pos_3, (CASE 
            WHEN A.OtherOverdueSinceDt IS NOT NULL THEN utils.datediff('DAY', A.OtherOverdueSinceDt, v_ProcessDate)
            ELSE 0
               END) AS pos_4
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.DPD_PrincOverdue = pos_2,
                                         A.DPD_IntOverdueSince = pos_3,
                                         A.DPD_OtherOverdueSince = pos_4;

         END;
         END IF;
         /*--------------IF ANY DPD IS NEGATIVE THEN ZERO---------------------------------*/
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_IntService = 0
          WHERE  NVL(DPD_IntService, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_NoCredit = 0
          WHERE  NVL(DPD_NoCredit, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_Overdrawn = 0
          WHERE  NVL(DPD_Overdrawn, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_Overdue = 0
          WHERE  NVL(DPD_Overdue, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_Renewal = 0
          WHERE  NVL(DPD_Renewal, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_StockStmt = 0
          WHERE  NVL(DPD_StockStmt, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_PrincOverdue = 0
          WHERE  NVL(DPD_PrincOverdue, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_IntOverdueSince = 0
          WHERE  NVL(DPD_IntOverdueSince, 0) < 0;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET DPD_OtherOverdueSince = 0
          WHERE  NVL(DPD_OtherOverdueSince, 0) < 0;
         /*------------DPD IS ZERO FOR ALL CC ACCOUNT DUE TO LASTCRDATE ------------------------------------*/
         --UPDATE A SET DPD_NoCredit=0
         --FROM PRO.AccountCal A INNER JOIN PRO.CustomerCal B ON A.RefCustomerID =B.RefCustomerID
         --WHERE isnull(B.FlgProcessing,'N')='N' 
         /* RESTR WORK */
         WITH CTE_FIN_DPD AS ( SELECT AccountEntityID ,
                                      DPD_IntService DPD  
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  NVL(DPD_IntService, 0) > 0
         UNION ALL 
         SELECT AccountEntityID ,
                DPD_NoCredit DPD  
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  NVL(DPD_NoCredit, 0) > 0
         UNION ALL 
         SELECT AccountEntityID ,
                DPD_Overdrawn DPD  
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  NVL(DPD_Overdrawn, 0) > 0
         UNION ALL 
         SELECT AccountEntityID ,
                DPD_Overdue DPD  
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  NVL(DPD_Overdue, 0) > 0 ) 
            MERGE INTO B 
            USING (SELECT B.ROWID row_id, A.DPD_MaxFin
            FROM B ,( SELECT AccountEntityID ,
                             MAX(DPD)  DPD_MaxFin  
                      FROM CTE_FIN_DPD 
                        GROUP BY AccountEntityID ) a
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId ) src
            ON ( B.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.DPD_MaxFin = src.DPD_MaxFin
            ;
         WITH CTE_NONFIN_DPD AS ( SELECT AccountEntityID ,
                                         DPD_StockStmt DPD  
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  NVL(DPD_StockStmt, 0) > 0
         UNION ALL 
         SELECT AccountEntityID ,
                DPD_Renewal DPD  
           FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
          WHERE  NVL(DPD_Renewal, 0) > 0 ) 
            MERGE INTO B 
            USING (SELECT B.ROWID row_id, A.DPD_MaxNonFin
            FROM B ,( SELECT AccountEntityID ,
                             MAX(DPD)  DPD_MaxNonFin  
                      FROM CTE_NONFIN_DPD 
                        GROUP BY AccountEntityID ) a
                   JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId ) src
            ON ( B.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.DPD_MaxNonFin = src.DPD_MaxNonFin
            ;
         UPDATE PRO_RBL_MISDB_PROD.AdvAcRestructureCal
            SET DPD_MaxNonFin = 0
          WHERE  DPD_MaxNonFin IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.AdvAcRestructureCal
            SET DPD_MaxFin = 0
          WHERE  DPD_MaxNonFin IS NULL;
         /* END OF RETR */
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'DPD_Calculation';

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
       WHERE  RUNNINGPROCESSNAME = 'DPD_Calculation';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."DPD_CALCULATION_04122023" TO "ADF_CDR_RBL_STGDB";
