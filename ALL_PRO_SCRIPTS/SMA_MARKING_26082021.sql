--------------------------------------------------------
--  DDL for Procedure SMA_MARKING_26082021
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."SMA_MARKING_26082021" /*=====================================
AUTHER : TRILOKI KHANNA
CREATE DATE : 27-11-2019
MODIFY DATE : 27-11-2019
DESCRIPTION : SMA MARKING
EXEC PRO.SMA_MARKING  @TIMEKEY=25140
====================================*/
(
  v_TIMEKEY IN NUMBER
)
AS

BEGIN

   BEGIN
      DECLARE
         v_ProcessDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TIMEKEY = v_TIMEKEY );
         v_vEffectiveto NUMBER(10,0);
         v_temp NUMBER(1, 0) := 0;

      BEGIN
         SELECT Timekey - 1 

           INTO v_vEffectiveto
           FROM RBL_MISDB_PROD.Automate_Advances 
          WHERE  EXT_FLG = 'Y';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS = NULL,
                                      A.SMA_REASON = NULL,
                                      A.SMA_DT = NULL,
                                      A.FLGSMA = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN DPD_MAX BETWEEN 1 AND 30 THEN 'SMA_0'
         WHEN DPD_MAX BETWEEN 31 AND 60 THEN 'SMA_1'
         WHEN DPD_MAX BETWEEN 61 AND 90 THEN 'SMA_2'
         WHEN DPD_MAX > 90 THEN 'SMA_2'
         ELSE NULL
            END) AS pos_2, (CASE 
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_INTSERVICE, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY INT NOT SERVICED'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_NOCREDIT, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY NO CREDIT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_OVERDRAWN, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY CONTI EXCESS'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_STOCKSTMT, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY STOCK STATEMENT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_RENEWAL, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY REVIEW DUE DATE'
         WHEN A.FacilityType IN ( 'TL','DL','BP','BD','PC' )

           AND NVL(DPD_OVERDUE, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY OVERDUE'
         ELSE 'OTHER'
            END) AS pos_3, utils.dateadd('DAY', -DPD_MAX, v_ProcessDate) AS pos_4, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 91
              --LEFT JOIN DIMPRODUCT C ON C.PRODUCTALT_KEY=A.PRODUCTALT_KEY   
               --AND ISNULL(C.PRODUCTGROUP,'N')<>'KCC'  
               --AND isnull(C.ProductSubGroup,'N') NOT in('KCC')
               --and c.NPANorms='DPD91'
               --AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)

          WHERE NVL(B.FlgProcessing, 'N') = 'N'
           AND NVL(FINALASSETCLASSALT_KEY, 1) = 1
           AND NVL(DPD_MAX, 0) > 0
           AND NVL(A.Balance, 0) > 0
           AND A.Asset_Norm <> 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS = pos_2,
                                      A.SMA_REASON = pos_3,
                                      A.SMA_DT = pos_4,
                                      A.FLGSMA = 'Y';
         --UPDATE A SET A.SMA_CLASS= (
         --                              CASE WHEN A.FACILITYTYPE IN('CC','OD') THEN ( CASE WHEN  REFPERIODOVERDRAWN-60>=DPD_MAX
         --							                                                       THEN 'SMA_0'
         --							                                                  WHEN REFPERIODOVERDRAWN-30>=DPD_MAX  THEN 'SMA_1'
         --																			    ELSE 'SMA_2' END) 
         --                              ELSE ( CASE WHEN  REFPERIODOVERDUE-60>=DPD_MAX
         --							                                                       THEN 'SMA_0'
         --							                                                  WHEN REFPERIODOVERDUE-30>=DPD_MAX  THEN 'SMA_1'
         --																			    ELSE 'SMA_2' END)
         --							  END)
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, (CASE 
         WHEN DPD_MAX BETWEEN 276 AND 305 THEN 'SMA_0'
         WHEN DPD_MAX BETWEEN 306 AND 335 THEN 'SMA_1'
         WHEN DPD_MAX BETWEEN 336 AND 365 THEN 'SMA_2'
         WHEN DPD_MAX > 366 THEN 'SMA_2'
         ELSE NULL
            END) AS pos_2, (CASE 
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_INTSERVICE, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY INT NOT SERVICED'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_NOCREDIT, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY NO CREDIT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_OVERDRAWN, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY CONTI EXCESS'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_STOCKSTMT, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY STOCK STATEMENT'
         WHEN A.FacilityType IN ( 'CC','OD' )

           AND NVL(DPD_RENEWAL, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY REVIEW DUE DATE'
         WHEN A.FacilityType IN ( 'TL','DL','BP','BD','PC' )

           AND NVL(DPD_OVERDUE, 0) = NVL(DPD_MAX, 0) THEN 'DEGRADE BY OVERDUE'
         ELSE 'OTHER'
            END) AS pos_3, utils.dateadd('DAY', -DPD_MAX, v_PROCESSDATE) AS pos_4, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
                JOIN AdvAcBasicDetail ABD   ON A.AccountEntityID = ABD.AccountEntityId
                AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.ReferencePeriod = 366
              --INNER JOIN DIMPRODUCT C ON C.PRODUCTALT_KEY=A.PRODUCTALT_KEY 
               -- --AND ISNULL(C.PRODUCTGROUP,'N')='KCC'  
               -- --AND isnull(C.ProductSubGroup,'N')  in('KCC')
               --  and C.NPANorms='DPD366'
               --AND (C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveToTimeKey>=@TIMEKEY)

          WHERE NVL(B.FlgProcessing, 'N') = 'N'
           AND NVL(FINALASSETCLASSALT_KEY, 1) = 1
           AND NVL(DPD_MAX, 0) > 0
           AND NVL(A.Balance, 0) > 0
           AND A.Asset_Norm <> 'ALWYS_STD') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS = pos_2,
                                      A.SMA_REASON = pos_3,
                                      A.SMA_DT = pos_4,
                                      A.FLGSMA = 'Y';
         /*------SMA MARKING FOR CUSTOMER LEVEL-------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL, NULL
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGSMA = NULL,
                                      A.SMA_CLASS_KEY = NULL,
                                      A.SMA_DT = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN PRO_RBL_MISDB_PROD.ACCOUNTCAL B   ON A.RefCustomerID = B.RefCustomerID 
          WHERE B.FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGSMA = 'Y';
         IF utils.object_id('TEMPDB..tt_TEMPTABLE_SMACLASS_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_SMACLASS_6 ';
         END IF;
         DELETE FROM tt_TEMPTABLE_SMACLASS_6;
         UTILS.IDENTITY_RESET('tt_TEMPTABLE_SMACLASS_6');

         INSERT INTO tt_TEMPTABLE_SMACLASS_6 ( 
         	SELECT A.RefCustomerID ,
                 MAX(CASE 
                          WHEN SMA_CLASS = 'SMA_0' THEN 1
                          WHEN SMA_CLASS = 'SMA_1' THEN 2
                          WHEN SMA_CLASS = 'SMA_2' THEN 3
                     ELSE 0
                        END)  MAXSMA_CLASS  ,
                 MIN(A.SMA_Dt)  SMA_Dt  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
                   AND B.FlgSMA = 'Y'
         	  GROUP BY A.RefCustomerID );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.MAXSMA_CLASS, B.SMA_Dt
         FROM A ,PRO_RBL_MISDB_PROD.CUSTOMERCAL A
                JOIN tt_TEMPTABLE_SMACLASS_6 B   ON A.RefCustomerID = B.REFCUSTOMERID 
          WHERE A.FlgSMA = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SMA_CLASS_KEY = src.MAXSMA_CLASS,
                                      A.SMA_DT = src.SMA_Dt;
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.SMA_MOVEMENT_HISTORY 
                             WHERE  TIMEKEY = v_TIMEKEY );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            DELETE PRO_RBL_MISDB_PROD.SMA_MOVEMENT_HISTORY

             WHERE  TIMEKEY = v_TIMEKEY;

         END;
         END IF;
         IF utils.object_id('TEMPDB..tt_SMACLASS_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_SMACLASS_6 ';
         END IF;
         DELETE FROM tt_SMACLASS_6;
         UTILS.IDENTITY_RESET('tt_SMACLASS_6');

         INSERT INTO tt_SMACLASS_6 ( 
         	SELECT A.CustomerAcID ,
                 NVL(A.SMA_Class, CHOOSE(B.SMA_Class_Key, 'SMA_0', 'SMA_1', 'SMA_2')) SMA_CLASS  
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL A
                   JOIN PRO_RBL_MISDB_PROD.CUSTOMERCAL B   ON A.RefCustomerID = B.RefCustomerID
                   AND A.CustomerEntityID = B.CustomerEntityID
                   AND A.FlgSMA = 'Y'
         	 WHERE  B.FlgSMA = 'Y'
                    AND NVL(A.Balance, 0) > 0
                    AND NVL(B.SysAssetClassAlt_Key, 1) = 1 );
         UPDATE tt_SMACLASS_6
            SET SMA_CLASS = (CASE 
                                  WHEN SMA_CLASS = 'SMA_0' THEN 1
                                  WHEN SMA_CLASS = 'SMA_1' THEN 2
                                  WHEN SMA_CLASS = 'SMA_2' THEN 3
                ELSE SMA_CLASS
                   END);
         INSERT INTO PRO_RBL_MISDB_PROD.SMA_MOVEMENT_HISTORY
           ( TIMEKEY, CustomerAcID, PREVSTATUS, CURRENTSTATUS )
           ( SELECT v_TIMEKEY ,
                    B.CustomerAcID ,
                    A.SMA_Class ,
                    B.SMA_CLASS 
             FROM PRO_RBL_MISDB_PROD.PrevSMAStatus A
                    RIGHT JOIN tt_SMACLASS_6 B   ON A.CustomerAcID = B.CustomerAcID
              WHERE  B.SMA_CLASS IS NOT NULL
                       AND NVL(A.SMA_Class, ' ') <> NVL(B.SMA_CLASS, ' ') );
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.PREVSMASTATUS ';
         INSERT INTO PRO_RBL_MISDB_PROD.PrevSMAStatus
           ( SELECT v_TIMEKEY ,
                    CustomerAcID ,
                    SMA_CLASS 
             FROM tt_SMACLASS_6  );
         --INSERT INTO PRO.ACCOUNT_MOVEMENT_HISTORY (CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,EffectiveFromTimeKey,EffectiveToTimeKeY)
         --SELECT A.CustomerAcID,A.FinalAssetClassAlt_Key,A.FinalNpaDt,@TIMEKEY,49999 
         --FROM PRO.AccountCal A  LEFT OUTER JOIN  Pro.ACCOUNT_MOVEMENT_HISTORY B
         --ON A.CustomerAcID=B.CustomerAcID
         --WHERE  ISNULL(A.FinalAssetClassAlt_Key,'')<>ISNULL(B.FinalAssetClassAlt_Key,'') AND B.EffectiveToTimeKeY=49999
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'STD'
          WHERE  SYSASSETCLASSALT_KEY = 1;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'SUB'
          WHERE  SYSASSETCLASSALT_KEY = 2;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'DB1'
          WHERE  SYSASSETCLASSALT_KEY = 3;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'DB2'
          WHERE  SYSASSETCLASSALT_KEY = 4;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'DB3'
          WHERE  SYSASSETCLASSALT_KEY = 5;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'LOS'
          WHERE  SYSASSETCLASSALT_KEY = 6;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'SMA_0'
          WHERE  SMA_CLASS_KEY = 1;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'SMA_1'
          WHERE  SMA_CLASS_KEY = 2;
         UPDATE PRO_RBL_MISDB_PROD.CUSTOMERCAL
            SET CustMoveDescription = 'SMA_2 '
          WHERE  SMA_CLASS_KEY = 3;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET SMA_CLASS = 'STD'
          WHERE  FinalAssetClassAlt_Key = 1
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET SMA_CLASS = 'SUB'
          WHERE  FinalAssetClassAlt_Key = 2
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET SMA_CLASS = 'DB1'
          WHERE  FinalAssetClassAlt_Key = 3
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET SMA_CLASS = 'DB2'
          WHERE  FinalAssetClassAlt_Key = 4
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET SMA_CLASS = 'DB3'
          WHERE  FinalAssetClassAlt_Key = 5
           AND SMA_CLASS IS NULL;
         UPDATE PRO_RBL_MISDB_PROD.ACCOUNTCAL
            SET SMA_CLASS = 'LOS'
          WHERE  FinalAssetClassAlt_Key = 6
           AND SMA_CLASS IS NULL;
         --IF OBJECT_ID('TEMPDB..tt_ACCOUNT_MOVEMENT_HISTORY_6') IS NOT NULL
         --  DROP TABLE tt_ACCOUNT_MOVEMENT_HISTORY_6
         --  SELECT CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,EffectiveFromTimeKey,EffectiveToTimeKeY  INTO tt_ACCOUNT_MOVEMENT_HISTORY_6
         --  FROM  PRO.AccountCal 
         --  ALTER TABLE tt_ACCOUNT_MOVEMENT_HISTORY_6 ADD MATCH CHAR(1)
         --  UPDATE tt_ACCOUNT_MOVEMENT_HISTORY_6 SET MATCH='N'
         --	UPDATE A SET MATCH='Y'
         --		FROM  tt_ACCOUNT_MOVEMENT_HISTORY_6 A
         --		INNER JOIN PRO.ACCOUNT_MOVEMENT_HISTORY B   ON A.CustomerAcID=B.CustomerAcID
         --		AND A.FinalAssetClassAlt_Key=B.FinalAssetClassAlt_Key
         --		WHERE B.EffectiveToTimeKey=49999
         --	 UPDATE A SET MATCH='D'
         --			FROM  tt_ACCOUNT_MOVEMENT_HISTORY_6 A
         --			INNER JOIN PRO.ACCOUNT_MOVEMENT_HISTORY B	   ON A.CustomerAcID=B.CustomerAcID
         --			AND A.FinalAssetClassAlt_Key<>B.FinalAssetClassAlt_Key
         --	 WHERE B.EffectiveToTimeKey=49999
         --	 UPDATE B  SET EffectiveToTimeKey=@TIMEKEY-1
         --		FROM tt_ACCOUNT_MOVEMENT_HISTORY_6 A   INNER JOIN PRO.ACCOUNT_MOVEMENT_HISTORY B
         --		ON A.CustomerAcID=B.CustomerAcID 
         --		WHERE A.MATCH='D' AND B.EffectiveToTimeKey=49999
         --	INSERT INTO PRO.ACCOUNT_MOVEMENT_HISTORY (CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,EffectiveFromTimeKey,EffectiveToTimeKeY)
         --	select CustomerAcID,FinalAssetClassAlt_Key,FinalNpaDt,@TIMEKEY,49999
         --	from tt_ACCOUNT_MOVEMENT_HISTORY_6 where MATCH  in ('N','D')
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY 
                             WHERE  EffectiveFromTimeKey = v_Timekey );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            DBMS_OUTPUT.PUT_LINE('NO NEDD TO INSERT DATA');

         END;
         ELSE

         BEGIN
            IF utils.object_id('TEMPDB..tt_ACCOUNT_MOVEMENT_HISTORY_6') IS NOT NULL THEN
             -----------------Added for DashBoard 04-03-2021
            --Update BANDAUDITSTATUS set CompletedCount=CompletedCount+1 where BandName='ASSET CLASSIFICATION'
            EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ACCOUNT_MOVEMENT_HISTORY_6 ';
            END IF;
            DELETE FROM tt_ACCOUNT_MOVEMENT_HISTORY_6;
            INSERT INTO tt_ACCOUNT_MOVEMENT_HISTORY_6
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerAcID, FinalAssetClassAlt_Key, FinalNpaDt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, TotOsAcc )
              ( SELECT UCIF_ID ,
                       RefCustomerID ,
                       SourceSystemCustomerID ,
                       CustomerAcID ,
                       FinalAssetClassAlt_Key ,
                       FinalNpaDt ,
                       EffectiveFromTimeKey ,
                       49999 EffectiveToTimeKey  ,
                       SMA_CLASS MovementFromStatus  ,
                       SMA_CLASS MovementToStatus  ,
                       NVL(Balance, 0) TotOsAcc  
                FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL  );
            INSERT INTO PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerAcID, FinalAssetClassAlt_Key, FinalNpaDt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, TotOsAcc )
              ( SELECT A.UCIF_ID ,
                       A.RefCustomerID ,
                       A.SourceSystemCustomerID ,
                       A.CustomerAcID ,
                       A.FinalAssetClassAlt_Key ,
                       A.FinalNpaDt ,
                       A.EffectiveFromTimeKey ,
                       A.EffectiveToTimeKey ,
                       NVL(B.MovementToStatus, A.MovementFromStatus) ,
                       A.MovementToStatus ,
                       NVL(A.TotOsAcc, 0) TotOsAcc  
                FROM tt_ACCOUNT_MOVEMENT_HISTORY_6 A
                       LEFT JOIN PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY B   ON A.CustomerAcID = B.CustomerAcID
                       AND B.EffectiveToTimeKey = 49999
                 WHERE  (CASE 
                              WHEN B.CustomerAcID IS NULL THEN 1
                              WHEN B.CustomerAcID IS NOT NULL
                                AND A.MOVEMENTFROMSTATUS <> B.MovementToStatus THEN 1   END) = 1 );
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto
            FROM AA ,PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY AA
                   LEFT JOIN tt_ACCOUNT_MOVEMENT_HISTORY_6 B   ON AA.CustomerAcID = B.CustomerAcID
                   AND B.EffectiveToTimeKey = 49999 
             WHERE AA.EffectiveToTimeKey = 49999
              AND B.CustomerAcID IS NULL) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET AA.EffectiveToTimeKey = v_vEffectiveto;
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto
            FROM AA ,PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND AA.EffectiveFromTimeKey < v_TIMEKEY
              AND EXISTS ( SELECT 1 
                           FROM tt_ACCOUNT_MOVEMENT_HISTORY_6 BB
                            WHERE  AA.CustomerAcID = BB.CustomerAcID
                                     AND BB.EffectiveToTimeKey = 49999

                                     --AND AA.MOVEMENTFROMSTATUS<>BB.MOVEMENTTOSTATUS
                                     AND AA.MovementToStatus <> BB.MOVEMENTTOSTATUS )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.DATE_
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY A
                   JOIN sysdaymatrix B   ON A.EffectiveFromTimeKey = B.TimeKey ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.MovementFromDate = src.DATE_;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.DATE_
            FROM A ,PRO_RBL_MISDB_PROD.ACCOUNT_MOVEMENT_HISTORY A
                   JOIN sysdaymatrix B   ON A.EffectiveToTimeKey = B.TimeKey ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.MovementToDate = src.DATE_;

         END;
         END IF;
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY 
                             WHERE  EffectiveFromTimeKey = v_Timekey );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            DBMS_OUTPUT.PUT_LINE('NO NEDD TO INSERT DATA');

         END;
         ELSE

         BEGIN
            IF utils.object_id('TEMPDB..tt_Customer_MOVEMENT_HISTOR_6') IS NOT NULL THEN
             EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Customer_MOVEMENT_HISTOR_6 ';
            END IF;
            DELETE FROM tt_Customer_MOVEMENT_HISTOR_6;
            INSERT INTO tt_Customer_MOVEMENT_HISTOR_6
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerName, SysAssetClassAlt_Key, SysNPA_Dt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, totOsCust )
              ( SELECT UCIF_ID ,
                       RefCustomerID ,
                       SourceSystemCustomerID ,
                       CustomerName ,
                       SysAssetClassAlt_Key ,
                       SysNPA_Dt ,
                       EffectiveFromTimeKey ,
                       49999 EffectiveToTimeKey  ,
                       CustMoveDescription MovementFromStatus  ,
                       CustMoveDescription MovementToStatus  ,
                       NVL(TotOsCust, 0) TotOsCust  
                FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL  );
            INSERT INTO PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY
              ( UCIF_ID, RefCustomerID, SourceSystemCustomerID, CustomerName, SysAssetClassAlt_Key, SysNPA_Dt, EffectiveFromTimeKey, EffectiveToTimeKey, MovementFromStatus, MovementToStatus, TotOsCust )
              ( SELECT A.UCIF_ID ,
                       A.RefCustomerID ,
                       A.SourceSystemCustomerID ,
                       A.CustomerName ,
                       A.SysAssetClassAlt_Key ,
                       A.SysNPA_Dt ,
                       A.EffectiveFromTimeKey ,
                       A.EffectiveToTimeKey ,
                       NVL(B.MovementToStatus, A.MovementFromStatus) ,
                       A.MovementToStatus ,
                       NVL(A.TotOsCust, 0) TotOsCust  
                FROM tt_Customer_MOVEMENT_HISTOR_6 A
                       LEFT JOIN PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY B   ON A.SourceSystemCustomerID = B.SourceSystemCustomerID
                       AND B.EffectiveToTimeKey = 49999
                 WHERE  (CASE 
                              WHEN B.SourceSystemCustomerID IS NULL THEN 1
                              WHEN B.SourceSystemCustomerID IS NOT NULL
                                AND A.MOVEMENTFROMSTATUS <> B.MovementToStatus THEN 1   END) = 1 );
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto
            FROM AA ,PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY AA
                   LEFT JOIN tt_Customer_MOVEMENT_HISTOR_6 B   ON AA.SourceSystemCustomerID = B.SourceSystemCustomerID
                   AND B.EffectiveToTimeKey = 49999 
             WHERE AA.EffectiveToTimeKey = 49999
              AND B.SourceSystemCustomerID IS NULL) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto;
            MERGE INTO AA 
            USING (SELECT AA.ROWID row_id, v_vEffectiveto
            FROM AA ,PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY AA 
             WHERE AA.EffectiveToTimeKey = 49999
              AND AA.EffectiveFromTimeKey < v_TIMEKEY
              AND EXISTS ( SELECT 1 
                           FROM tt_Customer_MOVEMENT_HISTOR_6 BB
                            WHERE  AA.SourceSystemCustomerID = BB.SourceSystemCustomerID
                                     AND BB.EffectiveToTimeKey = 49999

                                     --AND AA.MOVEMENTFROMSTATUS<>BB.MOVEMENTTOSTATUS
                                     AND AA.MovementToStatus <> BB.MOVEMENTTOSTATUS )) src
            ON ( AA.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET EffectiveToTimeKey = v_vEffectiveto;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.DATE_
            FROM A ,PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY A
                   JOIN sysdaymatrix B   ON A.EffectiveFromTimeKey = B.TimeKey ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.MovementFromDate = src.DATE_;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.DATE_
            FROM A ,PRO_RBL_MISDB_PROD.CUSTOMER_MOVEMENT_HISTORY A
                   JOIN sysdaymatrix B   ON A.EffectiveToTimeKey = B.TimeKey ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.MovementToDate = src.DATE_;

         END;
         END IF;
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'SMA_MARKING';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_SMACLASS_6 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_SMACLASS_6 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_ACCOUNT_MOVEMENT_HISTORY_6 ';
      EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Customer_MOVEMENT_HISTOR_6 ';
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'SMA_MARKING';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."SMA_MARKING_26082021" TO "ADF_CDR_RBL_STGDB";
