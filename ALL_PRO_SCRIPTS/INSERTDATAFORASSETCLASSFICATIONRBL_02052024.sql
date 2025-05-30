--------------------------------------------------------
--  DDL for Procedure INSERTDATAFORASSETCLASSFICATIONRBL_02052024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" /*=========================================  
  AUTHOR : TRILOKI KHANNA  
  CREATE DATE : 09-04-2021  
  MODIFY DATE : 09-04-2021  
  DESCRIPTION : Test Case Cover in This SP  

 RefCustomerID TestCase  
2 Degradation - Non Agri with Always STD = Y  
15 Degradation - CC/OD: Non Agri - Interest Servicing with Always STD = Y  
16 Degradation - CC/OD: Non Agri - Conti Excess Date with Always STD = Y  
17 Degradation - CC/OD: Non Agri - Last Credit Date with Always STD = Y  
18 Degradation - CC/OD: Non Agri - Stock Stmt Date with Always STD = Y  
19 Degradation - CC/OD: Non Agri - Last Review Due Date with Always STD = Y  
20 Degradation - CC/OD: Agri - Interest Servicing with Always STD = Y  
21 Degradation - CC/OD: Agri - Conti Excess Date with Always STD = Y  
22 Degradation - CC/OD: Agri - Last Credit Date with Always STD = Y  
23 Degradation - CC/OD: Agri - Last Review Due Date with Always STD = Y  
25 Degradation - Non Agri - Interest Servicing Conti Excess Date with Always STD =Y  
27 Degradation - Agri - Interest Servicing Conti Excess Date with Always STD =Y  
29 Degradation - Non Agri - Interest Servicing Conti Excess Date Last Credit Date with Always STD =Y  
31 Degradation - Agri - Interest Servicing Conti Excess Date Last Credit Date with Always STD =Y  
33 Degradation - Non Agri - Interest Servicing Conti Excess Date Last Credit Date Stock Stmt Date with Always STD =Y  
35 Degradation - Agri - Interest Servicing Conti Excess Date Last Credit Date Last Review Due Date with Always STD =Y  
37 Degradation - Non Agri -OverDue Interest Servicing Conti Excess Date Last Credit Date Stock Stmt Date Last Review Due Date with Always STD =Y  
46 NULL  
118 Identification of SMA-0 (Always_STD Ac)  
65 Security Valuation date validations - Current Asset Expired  
66 Security Valuation date validations - Current Asset Active  
67 Security Valuation date validations - Fixed Asset Expired  
68 Security Valuation date validations - Fixed Asset Active  
69 Security Valuation date validations - Permanent Asset Expired  
70 Security Valuation date validations - Permanent Asset Active  
76 Populaton of Secured Amount - FlgSecured = S  
77 Populaton of Secured Amount - FlgSecured = U  
78 Populaton of UnSecured Amount - FlgSecured = S  
79 Populaton of UnSecured Amount - FlgSecured = U  
92 Populaton of Secured Amount - FlgSecured = C  
93 Populaton of UnSecured Amount - FlgSecured = C  

=============================================*/
/*=========================================  
 AUTHER : TRILOKI SHNAKER KHANNA  
 CREATE DATE : 27-11-2019  
 MODIFY DATE : 27-11-2019  
 DESCRIPTION : INSERT DATA FOR PRO.CUSTOMER CAL AND PRO.ACCOUNT CAL TABLE AND UPDATE SOME OTHER COLUMN  
EXEC [PRO].[InsertDataforAssetClassficationRBL] @TIMEKEY=@26090,@BRANCHCODE=NULL,@ISMOC='N'  
=============================================*/
------select * from sysdaymatrix where date='2021-06-06'  
 ---exec  [PRO].[InsertDataforAssetClassficationRBL] 26857

(
  v_TIMEKEY IN NUMBER,
  v_BRANCHCODE IN VARCHAR2 DEFAULT NULL ,
  v_ISMOC IN CHAR DEFAULT 'N' 
)
AS

BEGIN

   BEGIN
      DECLARE
         v_temp NUMBER(1, 0) := 0;
         -- DECLARE @TIMEKEY INT = (SELECT TIMEKEY FROM PRO.EXTDATE_MISDB WHERE FLG = 'Y')  
         --DECLARE @TimeKey  Int =(SELECT TimeKey FROM [dbo].Automate_Advances WHERE EXT_FLG='Y')  
         v_ProcessingDate VARCHAR2(200) := ( SELECT DATE_ 
           FROM SYSDAYMATRIX 
          WHERE  TIMEKEY = v_TIMEKEY );
         v_SETID NUMBER(10,0) := ( SELECT NVL(MAX(NVL(SETID, 0)) , 0) + 1 
           FROM PRO_RBL_MISDB_PROD.ProcessMonitor 
          WHERE  TIMEKEY = v_TIMEKEY );
         v_LastQtrDateKey NUMBER(10,0) := ( SELECT LastQtrDateKey 
           FROM sysdaymatrix 
          WHERE  timekey = v_TIMEKEY );
         v_LastMonthDateKey NUMBER(10,0) := ( SELECT LastMonthDateKey 
           FROM sysdaymatrix 
          WHERE  timekey = v_TIMEKEY );
         v_PrvDateKey NUMBER(10,0) := ( SELECT timekey - 1 
           FROM sysdaymatrix 
          WHERE  TimeKey = v_TIMEKEY );
         v_PROCESSMONTH VARCHAR2(200) := ( SELECT date_ 
           FROM SysDayMatrix 
          WHERE  TimeKey = v_TIMEKEY );
         v_PROCESSDAY VARCHAR2(10) := utils.datename('WEEKDAY', ( SELECT date_ 
                                     FROM SysDayMatrix 
                                      WHERE  TimeKey = v_TIMEKEY ));
         --DECLARE @PANCARDFLAG CHAR(1)=(SELECT REFVALUE FROM PRO.REFPERIOD WHERE BUSINESSRULE='PANCARDNO' AND EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND EFFECTIVETOTIMEKEY>=@TIMEKEY)  
         --DECLARE @AADHARCARDFLAG CHAR(1)=(SELECT REFVALUE FROM PRO.REFPERIOD WHERE BUSINESSRULE='AADHARCARD' AND EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND EFFECTIVETOTIMEKEY>=@TIMEKEY)  
         v_PANCARDFLAG CHAR(1) := ( SELECT 'Y' 
           FROM solutionglobalparameter 
          WHERE  ParameterName = 'PAN Aadhar Dedup Integration'
                   AND ParameterValueAlt_Key = 1
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_AADHARCARDFLAG CHAR(1) := ( SELECT 'Y' 
           FROM solutionglobalparameter 
          WHERE  ParameterName = 'PAN Aadhar Dedup Integration'
                   AND ParameterValueAlt_Key = 1
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_JOINTACCOUNTFLAG CHAR(1) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'JOINT ACCOUNT'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         v_UCFICFLAG CHAR(1) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'UCFIC'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         --DECLARE @QtrFlg char=(select (CASE WHEN Day(@ProcessingDate)=DAY(EOMONTH(@ProcessingDate)) AND MONTH(@ProcessingDate) IN(3,6,9,12)    THEN 'Y' END) QtrFlg)  
         v_6MnthBackTimeKey NUMBER(5,0);
         v_6MonthBackDate VARCHAR2(200);
         v_REFPERIODOVERDUEUPG NUMBER(5,0) := ( SELECT UTILS.CONVERT_TO_NUMBER(REFVALUE,10,0) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODOVERDUEUPG'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODOVERDRAWNUPG NUMBER(5,0) := ( SELECT UTILS.CONVERT_TO_NUMBER(REFVALUE,10,0) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODOVERDRAWNUPG'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODNOCREDITUPG NUMBER(5,0) := ( SELECT UTILS.CONVERT_TO_NUMBER(REFVALUE,10,0) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODNOCREDITUPG'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODINTSERVICEUPG NUMBER(5,0) := ( SELECT UTILS.CONVERT_TO_NUMBER(REFVALUE,10,0) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODINTSERVICEUPG'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODSTKSTATEMENTUPG NUMBER(5,0) := ( SELECT UTILS.CONVERT_TO_NUMBER(REFVALUE,10,0) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODSTKSTATEMENTUPG'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODREVIEWUPG NUMBER(5,0) := ( SELECT UTILS.CONVERT_TO_NUMBER(REFVALUE,10,0) 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODREVIEWUPG'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODOVERDUE NUMBER(5,0) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODOVERDUE'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODOVERDRAWN NUMBER(5,0) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODOVERDRAWN'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODNOCREDIT NUMBER(5,0) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODNOCREDIT'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODINTSERVICE NUMBER(5,0) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODINTSERVICE'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODSTKSTATEMENT NUMBER(5,0) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODSTKSTATEMENT'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_REFPERIODREVIEW NUMBER(5,0) := ( SELECT REFVALUE 
           FROM PRO_RBL_MISDB_PROD.RefPeriod 
          WHERE  BUSINESSRULE = 'REFPERIODREVIEW'
                   AND EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY >= v_TIMEKEY 
           FETCH FIRST 1 ROWS ONLY );
         v_HistTimeKey NUMBER(10,0) := 0;
         /* END OF ADHOC CHAMGE */
         /* AMAR - 20092021 - CHNAGES FOR MOC ACL MANUAL EFFECT IN NORMAL PROCESSING */
         /* MOC TYPE AUTO EFFECT REQUIRED ONLY ONCE FOR DAILY NORMAL PROCESS  */
         v_PrevQtrTimeKey UDT.INT??%TYPE := ( SELECT LastQtrDateKey 
           FROM SYSDAYMATRIX 
          WHERE  Timekey = v_TIMEKEY );

      BEGIN
         BEGIN
            SELECT 1 INTO v_temp
              FROM DUAL
             WHERE EXISTS ( SELECT 1 
                            FROM PRO_RBL_MISDB_PROD.AccountCal_Hist 
                             WHERE  EffectiveFromTimeKey > v_TIMEKEY );
         EXCEPTION
            WHEN OTHERS THEN
               NULL;
         END;

         IF v_temp = 1 THEN

         BEGIN
            utils.raiserror( 0, 'You are going to process for wrong date, Please check....' );

         END;
         END IF;
         v_6MonthBackDate := utils.dateadd('M', -6, v_ProcessingDate) ;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.CUSTOMERCAL ';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.ACCOUNTCAL ';
         DELETE PRO_RBL_MISDB_PROD.ProcessMonitor

          WHERE  TIMEKEY = v_TIMEKEY;
         -------------------- /* Added By Mandeep 11-09-2023  Query Optimization */  ------------------------------------------
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_ACCOUNTCAL_26  --SQLDEV: NOT RECOGNIZED
         tt_ACCOUNTCAL_26 TABLE IF  --SQLDEV: NOT RECOGNIZED
         IF tt_CUSTOMERCAL_23  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_ACCOUNTCAL_26;
         UTILS.IDENTITY_RESET('tt_ACCOUNTCAL_26');

         INSERT INTO tt_ACCOUNTCAL_26 ( 
         	SELECT * 
         	  FROM PRO_RBL_MISDB_PROD.ACCOUNTCAL 
         	 WHERE  1 = 2 );
         DELETE FROM tt_CUSTOMERCAL_23;
         UTILS.IDENTITY_RESET('tt_CUSTOMERCAL_23');

         INSERT INTO tt_CUSTOMERCAL_23 ( 
         	SELECT * 
         	  FROM PRO_RBL_MISDB_PROD.CUSTOMERCAL 
         	 WHERE  1 = 2 );
         ---------------------------------------------------------------------------------------------------------------------
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'N',
                COUNT = 0,
                ERRORDESCRIPTION = NULL,
                ERRORDATE = NULL;
         --ALTER INDEX INDEX_CUSTOMERENTITYID ON tt_CUSTOMERCAL_23 DISABLE  
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'INSERT DATA FOR PRO.CUSTOMERCAL CAL TABLE' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         /*--------------INSERT DATA FOR tt_CUSTOMERCAL_23 CAL TABLE--------------------------*/
         INSERT INTO tt_CUSTOMERCAL_23
           ( EffectiveFromTimeKey, EffectiveToTimeKey, BRANCHCODE, CUSTOMERENTITYID, RefCustomerID, CUSTOMERNAME, CONSTITUTIONALT_KEY, FlgDeg, FlgUpg, FlgMoc, FlgSMA, FlgProcessing, FlgErosion, FlgPNPA, FlgPercolation, FlgInMonth, FlgDirtyRow, SrcNPA_Dt, SysNPA_Dt, SplCatg1Alt_Key, SplCatg2Alt_Key, SplCatg3Alt_Key, SplCatg4Alt_Key, SourceSystemCustomerID, Asset_Norm, UCIF_ID, UcifEntityID, SourceAlt_Key, IsChanged )
           ( SELECT v_TIMEKEY EffectiveFromTimeKey  ,
                    v_TIMEKEY EffectiveToTimeKey  ,
                    ParentBranchCode BRANCHCODE  ,
                    CBD.CUSTOMERENTITYID ,
                    CBD.CUSTOMERID ,
                    CBD.CUSTOMERNAME ,
                    CBD.ConstitutionAlt_Key ,
                    'N' FlgDeg  ,
                    'N' FlgUpg  ,
                    'N' FlgMoc  ,
                    'N' FlgSMA  ,
                    'N' FlgProcessing  ,
                    'N' FlgErosion  ,
                    'N' FlgPNPA  ,
                    'N' FlgPercolation  ,
                    'N' FlgInMonth  ,
                    'N' FlgDirtyRow  ,
                    NULL SrcNPA_Dt  ,
                    NULL SysNPA_Dt  ,
                    0 SplCatg1Alt_Key  ,
                    0 SplCatg2Alt_Key  ,
                    0 SplCatg3Alt_Key  ,
                    0 SplCatg4Alt_Key  ,
                    CBD.CustomerId SourceSystemCustomerID  ,
                    'NORMAL' Asset_Norm  ,
                    UCIF_ID ,
                    UcifEntityID ,
                    CBD.SourceSystemAlt_Key ,
                    'N' IsChanged  
             FROM RBL_MISDB_PROD.CustomerBasicDetail CBD
                    JOIN RBL_MISDB_PROD.AdvAcBasicDetail ABD   ON CBD.CustomerEntityId = ABD.CustomerEntityId
              WHERE  ( CBD.EffectiveFromTimeKey <= v_TIMEKEY
                       AND CBD.EffectiveToTimeKey >= v_TIMEKEY )
                       AND ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                       AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                       AND (CASE 
                                 WHEN v_BRANCHCODE IS NULL
                                   AND v_ISMOC = 'N' THEN '0'
                                 WHEN v_BRANCHCODE IS NULL
                                   AND v_ISMOC = 'Y' THEN CBD.MocStatus
                                 WHEN v_BRANCHCODE IS NOT NULL
                                   AND v_ISMOC = 'N' THEN CBD.CustomerId   END) IN ( CASE 
                                                                                          WHEN v_BRANCHCODE IS NULL
                                                                                            AND v_ISMOC = 'N' THEN '0'
                                                                                          WHEN v_BRANCHCODE IS NULL
                                                                                            AND v_ISMOC = 'Y' THEN 'Y'
                                                                                          WHEN v_BRANCHCODE IS NOT NULL
                                                                                            AND v_ISMOC = 'N' THEN ( SELECT ACFD.REFCustomerId 
                                                                                                                     FROM CurDat_RBL_MISDB_PROD.ADVCUSTFINANCIALDETAIL ACFD
                                                                                                                      WHERE  ACFD.EffectiveFromTimeKey <= v_TIMEKEY
                                                                                                                               AND ACFD.EffectiveToTimeKey >= v_TIMEKEY
                                                                                                                               AND BranchCode = v_BRANCHCODE
                                                                                                                       GROUP BY ACFD.REFCustomerId )   END )

               GROUP BY ParentBranchCode,CBD.CUSTOMERENTITYID,CBD.CUSTOMERID,CBD.CUSTOMERNAME,CBD.ConstitutionAlt_Key,CBD.UCIF_ID,CBD.UcifEntityID,CBD.SourceSystemAlt_Key );
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'INSERT DATA FOR PRO.CUSTOMERCAL CAL TABLE';
         /*------------------ACCOUNT DATA INSERT------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'INSERT DATA IN ACCOUNTCAL TABLE' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         INSERT INTO tt_ACCOUNTCAL_26
           ( ACCOUNTENTITYID, CUSTOMERACID, FLGDEG, FLGDIRTYROW, FLGINMONTH, FLGSMA, FLGPNPA, FLGUPG, FLGFITL, FLGABINITIO, REFPERIODOVERDUEUPG, REFPERIODOVERDRAWNUPG, REFPERIODNOCREDITUPG, REFPERIODINTSERVICEUPG, REFPERIODSTKSTATEMENTUPG, REFPERIODREVIEWUPG, EFFECTIVEFROMTIMEKEY, EFFECTIVETOTIMEKEY, ASSET_NORM, SPLCATG1ALT_KEY, SPLCATG2ALT_KEY, SPLCATG3ALT_KEY, SPLCATG4ALT_KEY, BALANCE, BALANCEINCRNCY, NETBALANCE, CURRENCYALT_KEY, SOURCEALT_KEY, SECAPP, PROVCOVERGOVGUR, BANKPROVSECURED, BANKPROVUNSECURED, BANKTOTALPROVISION, RBIPROVSECURED, RBIPROVUNSECURED, RBITOTALPROVISION, APPGOVGUR, USEDRV, COMPUTEDCLAIM, PROVPERSECURED, PROVPERUNSECURED, REFPERIODOVERDUE, REFPERIODOVERDRAWN, REFPERIODNOCREDIT, REFPERIODINTSERVICE, REFPERIODSTKSTATEMENT, REFPERIODREVIEW, INITIALASSETCLASSALT_KEY, FINALASSETCLASSALT_KEY, RefCustomerID, SourceSystemCustomerID, CUSTOMERENTITYID, BranchCode, ProductAlt_Key, CURRENTLIMIT, CURRENTLIMITDT, SchemeAlt_Key, SubSectorAlt_Key, FacilityType, InttRate, AcOpenDt, FirstDtOfDisb, PrvAssetClassAlt_Key, FlgSecured, UCIF_ID, UcifEntityID, ActSegmentCode, IsChanged )
           ( SELECT ACCOUNTENTITYID ACCOUNTENTITYID  ,
                    CUSTOMERACID CUSTOMERACID  ,
                    'N' FLGDEG  ,
                    'N' FLGDIRTYROW  ,
                    'N' FLGINMONTH  ,
                    'N' FLGSMA  ,
                    'N' FLGPNPA  ,
                    'N' FLGUPG  ,
                    'N' FLGFITL  ,
                    'N' FLGABINITIO  ,
                    v_REFPERIODOVERDUEUPG 
                     REFPERIODOVERDUEUPG ,--ADDED BY MANDEEP

                    v_REFPERIODOVERDRAWNUPG 
                     REFPERIODOVERDRAWNUPG ,--ADDED BY MANDEEP

                    v_REFPERIODNOCREDITUPG 
                     REFPERIODNOCREDITUPG ,--ADDED BY MANDEEP

                    v_REFPERIODINTSERVICEUPG 
                     REFPERIODINTSERVICEUPG ,--ADDED BY MANDEEP

                    v_REFPERIODSTKSTATEMENTUPG 
                     REFPERIODSTKSTATEMENTUPG ,--ADDED BY MANDEEP

                    v_REFPERIODREVIEWUPG 
                     REFPERIODREVIEWUPG ,--ADDED BY MANDEEP

                    v_TIMEKEY EFFECTIVEFROMTIMEKEY  ,
                    v_TIMEKEY EFFECTIVETOTIMEKEY  ,
                    'NORMAL' ASSET_NORM  ,
                    0 SPLCATG1ALT_KEY  ,
                    0 SPLCATG2ALT_KEY  ,
                    0 SPLCATG3ALT_KEY  ,
                    0 SPLCATG4ALT_KEY  ,
                    0.00 BALANCE  ,
                    0.00 BALANCEINCRNCY  ,
                    0.00 NETBALANCE  ,
                    62 CURRENCYALT_KEY  ,
                    ABD.SOURCEALT_KEY SOURCEALT_KEY  ,
                    abd.FlgSecured SecApp  ,
                    0.00 PROVCOVERGOVGUR  ,
                    0.00 BANKPROVSECURED  ,
                    0.00 BANKPROVUNSECURED  ,
                    0.00 BANKTOTALPROVISION  ,
                    0.00 RBIPROVSECURED  ,
                    0.00 RBIPROVUNSECURED  ,
                    0.00 RBITOTALPROVISION  ,
                    0.00 APPGOVGUR  ,
                    0.00 USEDRV  ,
                    0.00 COMPUTEDCLAIM  ,
                    0.00 PROVPERSECURED  ,
                    0.00 PROVPERUNSECURED  ,
                    v_REFPERIODOVERDUE 
                     REFPERIODOVERDUE ,-- ADDED BY MANDEEP

                    v_REFPERIODOVERDRAWN 
                     REFPERIODOVERDRAWN ,-- ADDED BY MANDEEP

                    v_REFPERIODNOCREDIT 
                     REFPERIODNOCREDIT ,-- ADDED BY MANDEEP

                    v_REFPERIODINTSERVICE 
                     REFPERIODINTSERVICE ,-- ADDED BY MANDEEP

                    v_REFPERIODSTKSTATEMENT 
                     REFPERIODSTKSTATEMENT ,-- ADDED BY MANDEEP

                    v_REFPERIODREVIEW 
                     REFPERIODREVIEW ,-- ADDED BY MANDEEP

                    1 INITIALASSETCLASSALT_KEY  ,
                    1 FINALASSETCLASSALT_KEY  ,
                    ABD.RefCustomerID RefCustomerID  ,
                    ABD.RefCustomerID SourceSystemCustomerID  ,
                    CBD.CUSTOMERENTITYID ,
                    ABD.BRANCHCODE ,
                    ABD.ProductAlt_Key ,
                    ABD.CURRENTLIMIT ,
                    ABD.CURRENTLIMITDT ,
                    ABD.SchemeAlt_Key ,
                    ABD.SubSectorAlt_Key ,
                    ABD.FacilityType ,
                    ABD.Pref_InttRate InttRate  ,
                    ABD.AccountOpenDate AcOpenDt  ,
                    ABD.DtofFirstDisb FirstDtOfDisb  ,
                    1 PrvAssetClassAlt_Key  ,
                    'U' FlgSecured ,--ABD.FlgSecured AS FlgSecured  

                    CBD.UCIF_ID ,
                    CBD.UcifEntityID ,
                    abd.segmentcode ,
                    'N' IsChanged  
             FROM RBL_MISDB_PROD.AdvAcBasicDetail ABD
                    JOIN tt_CUSTOMERCAL_23 CBD   ON abd.CUSTOMERENTITYID = CBD.CUSTOMERENTITYID
                    LEFT JOIN DimGLProduct C   ON C.GLProductAlt_Key = ABD.GLProductAlt_Key
                    AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
                    AND C.EffectiveToTimeKey >= v_TIMEKEY )
              WHERE  ( ABD.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND ABD.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
               GROUP BY ABD.BRANCHCODE,ABD.CUSTOMERENTITYID,ABD.ACCOUNTENTITYID,ABD.SYSTEMACID,ABD.CUSTOMERACID,ABD.GLALT_KEY,ABD.GLPRODUCTALT_KEY,ABD.PRODUCTALT_KEY,ABD.SEGMENTCODE,ABD.ACCOUNTOPENDATE,ABD.FacilityType,ABD.DTOFFIRSTDISB,ABD.CURRENTLIMIT,ABD.CURRENTLIMITDT,ABD.CURRENCYALT_KEY,ABD.REFCUSTOMERID,ABD.SCHEMEALT_KEY,ABD.ACTIVITYALT_KEY,ABD.InttTypeAlt_Key,ABD.SubSectorAlt_Key,ABD.OriginalLimitDt,CBD.CUSTOMERENTITYID,ABD.Pref_InttRate,ABD.SOURCEALT_KEY,CBD.UCIF_ID,CBD.UcifEntityID,ABD.FlgSecured );
         /* starts of temporary updates*/
         --DELETE A  -- DELETE CHARGE OFF ACCOUNTS IN VISION PLUS  
         --FROM tt_ACCOUNTCAL_26 A  
         -- INNER JOIN RBL_STGDB.DBO.ACCOUNT_ALL_SOURCE_SYSTEM B  
         --  ON A.CustomerAcID=B.CustomerAcID   
         --  AND ChargeoffY_N ='Y'  
         /* delete chargeoff data */
         DELETE A
         --select count(1)  

          WHERE ROWID IN 
         ( SELECT A.ROWID
           FROM tt_ACCOUNTCAL_26 A
                  LEFT JOIN AdvFacCreditCardDetail B   ON A.AccountEntityId = B.AccountEntityId
                  AND b.EffectiveFromTimeKey <= v_TIMEKEY
                  AND b.EffectiveToTimeKey >= v_TIMEKEY,
                A
                --select count(1)  

          WHERE  a.SourceAlt_Key = 6
                   AND B.AccountEntityId IS NULL );
         DELETE A
         --select count(1)  

          WHERE ROWID IN 
         ( SELECT A.ROWID
           FROM tt_CUSTOMERCAL_23 A
                  LEFT JOIN tt_ACCOUNTCAL_26 B   ON A.CustomerEntityID = B.CustomerEntityID,
                A
                --select count(1)  

          WHERE  B.CustomerEntityID IS NULL );
         /* */
         --alter index all on tt_CUSTOMERCAL_23  rebuild  
         --alter index all on tt_ACCOUNTCAL_26   rebuild    
         /* update ucifentityid from  customerentityid in case of ucifeentity is not  present */
         ----update tt_ACCOUNTCAL_26 set UcifEntityID=CustomerEntityID  where isnull(ucifentityid,0)=0  
         ----update tt_CUSTOMERCAL_23 set UcifEntityID=CustomerEntityID where isnull(ucifentityid,0)=0  
         ----update tt_ACCOUNTCAL_26 set UCIF_ID=RefCustomerID  where UCIF_ID IS NULL  
         ----update tt_CUSTOMERCAL_23 set UCIF_ID=RefCustomerID where UCIF_ID IS NULL  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'INSERT DATA IN ACCOUNTCAL TABLE';
         /*------------------UPDATE PANNO IN CUSTOMER CAL------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE PANNO' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.PAN
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN RBL_MISDB_PROD.AdvCustRelationship B   ON A.CustomerEntityId = B.CustomerEntityId 
          WHERE ( REGEXP_LIKE(B.PAN, '%[A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][A-Z]%') )
           AND ( B.PAN NOT LIKE '%FORMO%'
           AND PAN NOT LIKE '%FORPM%'
           AND PAN NOT LIKE '%FORMF%' )
           AND ( B.PAN IS NOT NULL )
           AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PANNO = src.PAN;
         /*  COMMENTED BY MANDEEP  11-09-2023  QUERY OPTIMIZATION
         UPDATE tt_CUSTOMERCAL_23 SET  PANNO=NULL WHERE PANNO='FORMO6161O'  
         UPDATE tt_CUSTOMERCAL_23 SET  PANNO=NULL WHERE PANNO='FORPM6060F'  
         UPDATE tt_CUSTOMERCAL_23 SET  PANNO=NULL WHERE PANNO='FORPM6060P'  
         UPDATE tt_CUSTOMERCAL_23 SET  PANNO=NULL WHERE PANNO='FORMF6060F'  
         UPDATE tt_CUSTOMERCAL_23 SET  PANNO=NULL WHERE PANNO='AAAAA1111A'  
         */
         UPDATE tt_CUSTOMERCAL_23
            SET PANNO = NULL
          WHERE  PANNO IN ( 'FORMO6161O','FORPM6060F','FORPM6060P','FORMF6060F','AAAAA1111A' )
         ;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE PANNO';
         /*------------------UPDATE AADHAR NUMBER IN CUSTOMER CAL------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE AADHAR NUMBER IN CUSTOMER CAL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.AadhaarId
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN RBL_MISDB_PROD.AdvCustRelationship B   ON A.CustomerEntityId = B.CustomerEntityId 
          WHERE LENGTH(LTRIM(RTRIM(B.AadhaarId))) = 12
           AND REGEXP_LIKE(B.AadhaarId, '%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')
           AND ( B.AadhaarId IS NOT NULL )
           AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.AADHARCARDNO = src.AadhaarId;
         /*  COMMENTED BY MANDEEP  11-09-2023  QUERY OPTIMIZATION
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='000000000000'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='111111111111'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='222222222222'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='333333333333'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='444444444444'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='555555555555'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='666666666666'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='777777777777'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='888888888888'  
         UPDATE tt_CUSTOMERCAL_23 SET AADHARCARDNO=NULL  WHERE AADHARCARDNO='999999999999'  
         */
         UPDATE tt_CUSTOMERCAL_23
            SET AADHARCARDNO = NULL
          WHERE  AADHARCARDNO IN ( '000000000000','111111111111','222222222222','333333333333','444444444444','555555555555','666666666666','777777777777','888888888888','999999999999' )
         ;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE AADHAR NUMBER IN CUSTOMER CAL';
         ----/*------------------INSERT INVALID PANCARDNO|AADHARCARDNO------------------*/  
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'INSERT INVALID PANCARDNO|AADHARCARDNO' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         DELETE PRO_RBL_MISDB_PROD.InvalidPanAadhar

          WHERE  EFFECTIVEFROMTIMEKEY = v_TIMEKEY
                   AND EFFECTIVETOTIMEKEY = v_TIMEKEY;
         INSERT INTO PRO_RBL_MISDB_PROD.InvalidPanAadhar
           ( DATEOFDATA, CUSTOMERID, SOURCESYSTEMCUSTOMERID, CUSTOMERNAME, SOURCESYSTEMNAME, PANNO, AADHARCARD, EFFECTIVEFROMTIMEKEY, EFFECTIVETOTIMEKEY )
           ( SELECT v_PROCESSINGDATE ,
                    A.RefCustomerID ,
                    A.SOURCESYSTEMCUSTOMERID ,
                    A.CUSTOMERNAME ,
                    NULL SOURCESYSTEMNAME  ,
                    B.PAN ,
                    NULL ,
                    v_TIMEKEY ,
                    v_TIMEKEY 
             FROM tt_CUSTOMERCAL_23 A
                    JOIN RBL_MISDB_PROD.AdvCustRelationship B   ON A.CustomerEntityId = B.CustomerEntityId
              WHERE  ( REGEXP_LIKE(B.PAN, '%[A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][A-Z]%') )
                       AND ( B.PAN IS NOT NULL )
                       AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY
             UNION 
             SELECT v_PROCESSINGDATE ,
                    A.RefCustomerID ,
                    A.SOURCESYSTEMCUSTOMERID ,
                    A.CUSTOMERNAME ,
                    NULL SOURCESYSTEMNAME  ,
                    B.PAN ,
                    NULL ,
                    v_TIMEKEY ,
                    v_TIMEKEY 
             FROM tt_CUSTOMERCAL_23 A
                    JOIN RBL_MISDB_PROD.AdvCustRelationship B   ON A.CustomerEntityId = B.CustomerEntityId
              WHERE  ( B.PAN LIKE '%FORMO%'
                       OR B.PAN LIKE '%FORPM%'
                       OR B.PAN LIKE '%FORMF%' )
                       AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         INSERT INTO PRO_RBL_MISDB_PROD.InvalidPanAadhar
           ( DATEOFDATA, CUSTOMERID, SOURCESYSTEMCUSTOMERID, CUSTOMERNAME, SOURCESYSTEMNAME, PANNO, AADHARCARD, EFFECTIVEFROMTIMEKEY, EFFECTIVETOTIMEKEY )
           ( SELECT v_PROCESSINGDATE ,
                    A.RefCustomerID ,
                    A.SOURCESYSTEMCUSTOMERID ,
                    A.CUSTOMERNAME ,
                    NULL SOURCESYSTEMNAME  ,
                    NULL ,
                    B.AadhaarId ,
                    v_TIMEKEY ,
                    v_TIMEKEY 
             FROM tt_CUSTOMERCAL_23 A
                    JOIN RBL_MISDB_PROD.AdvCustRelationship B   ON A.CustomerEntityId = B.CustomerEntityId
              WHERE  REGEXP_LIKE(B.AadhaarId, '%[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%')
                       AND ( B.AadhaarId IS NOT NULL )
                       AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY );
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'INSERT INVALID PANCARDNO|AADHARCARDNO';
         /*-------------UPDATE ProductCode IN ACCOUNTCAL-------------------------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE ProductCode IN ACCOUNTCAL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required  Modification Done---   
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, C.ProductCode
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcBasicDetail B   ON A.AccountEntityID = B.AccountEntityID
                JOIN DimProduct C   ON B.ProductAlt_Key = C.ProductAlt_Key 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND ( C.EffectiveFromTimeKey <= v_TIMEKEY
           AND C.EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.ProductCode = src.ProductCode;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE ProductCode IN ACCOUNTCAL';
         ---Condition Change Required  Modification Done---   
         /*------------********UPDATE DRAWINGPOWER|REVIEWDUEDT FOR ALL ACCOUNT******--------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE DRAWINGPOWER|REVIEWDUEDT FOR ALL ACCOUNT' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.DRAWINGPOWER, 0) AS pos_2, B.Ac_NextReviewDueDt
         --,WriteOffAmount=ISNULL(B.WriteOffAmt_HO,0)  

         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcFinancialDetail B   ON ( B.EFFECTIVEFROMTIMEKEY <= v_TimeKey
                AND B.EFFECTIVETOTIMEKEY >= v_TimeKey )
                AND A.ACCOUNTENTITYID = B.ACCOUNTENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DRAWINGPOWER
                                      --A.ReviewDueDt= (case when FACILITYTYPE in('DL','TL','PC','BP','BD') then null else  B.Ac_NextReviewDueDt   end )  
                                       = pos_2,
                                      A.ReviewDueDt = src.Ac_NextReviewDueDt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE DRAWINGPOWER|REVIEWDUEDT FOR ALL ACCOUNT';
         /*------------********UPDATE FacilityType FOR TLDL ACCOUNT******--------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE Asset_Norm|FacilityType ISLAD  ACCOUNT' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required  Modification Done---   
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_STD'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcBasicDetail B   ON A.AccountEntityID = B.AccountEntityID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND NVL(B.ISLAD, 0) = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm --'CONDI_STD'  
                                       = 'ALWYS_STD';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_STD'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcBasicDetail B   ON A.AccountEntityID = B.AccountEntityID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND assetclass = '1') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_STD';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcBasicDetail B   ON A.AccountEntityID = B.AccountEntityID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND assetclass = '2') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA';
         ---Condition Change Required  Modification Done---    
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Asset_Norm|FacilityType ISLAD  ACCOUNT';
         /*-------------UPDATE BANK ASSET CLASSIFICATION IN ACCOUNTCALL------------------------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE BANK ASSET CLASSIFICATION IN ACCOUNTCAL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SourceAssetClass, C.AssetClassMappingAlt_Key
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdvAcBalanceDetail B   ON A.AccountEntityID = B.AccountEntityID
                AND B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveFromTimeKey > v_TIMEKEY
                LEFT JOIN DimAssetClassMapping C   ON C.SrcSysClassCode = A.AccountStatus
                AND A.SourceAlt_Key = C.SourceAlt_Key
                AND C.EffectiveFromTimeKey <= v_TIMEKEY
                AND C.EffectiveFromTimeKey > v_TIMEKEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.AccountStatus = src.SourceAssetClass,
                                      A.BankAssetClass = src.AssetClassMappingAlt_Key;
         ----------UPDATE  tt_ACCOUNTCAL_26  
         ----------SET tt_ACCOUNTCAL_26.BankAssetClass =C.AssetClassAlt_Key  
         ----------   FROM tt_ACCOUNTCAL_26 A  
         ----------  INNER JOIN AdvAcBalanceDetail B  
         ----------   ON A.AccountEntityID=B.AccountEntityID  
         ----------  Inner Join DimAssetClassMapping C ON C.SrcSysClassCode=A.AccountStatus  
         ----------   And C.EffectiveFromTimeKey<=@TIMEKEY AND C.EffectiveFromTimeKey>@TIMEKEY  
         ----------   WHERE B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveFromTimeKey>@TIMEKEY  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE BANK ASSET CLASSIFICATION IN ACCOUNTCAL';
         /*------------********UPDATE ContiExcessDt FOR CC ACCOUNT******--------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE ContiExcessDt FOR CC ACCOUNT' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required Modification Done ----   
         IF v_TIMEKEY > 26267 THEN

         BEGIN
            PRO_RBL_MISDB_PROD.ContExcsSinceDt() ;-- COMMENEDT BY AMAR ON 12-06-2021 BANK IS PROVIDING IN SOURCE DATA  

         END;
         END IF;
         IF v_TIMEKEY = 26418 THEN

         BEGIN
            INSERT INTO PRO_RBL_MISDB_PROD.ContExcsSinceDtAccountCal
              ( CustomerAcID, AccountEntityId, SanctionAmt, SanctionDt, Balance, DrawingPower, ContExcsSinceDt, EffectiveFromTimeKey, EffectiveToTimeKey )
              ( SELECT A.CustomerAcID ,
                       A.AccountEntityId ,
                       currentLimit SanctionAmt  ,
                       CurrentLimitDt SanctionDt  ,
                       c.Balance ,
                       DrawingPower ,
                       ContExcsSinceDt ,
                       26418 EffectiveFromTimeKey  ,
                       49999 
                FROM RBL_TEMPDB.TempAdvAcBasicDetail A
                       JOIN RBL_TEMPDB.TempAdvFacCCDetail B   ON A.AccountEntityId = B.AccountEntityId
                       JOIN RBL_TEMPDB.TempAdVAcBalanceDetail C   ON C.AccountEntityId = A.AccountEntityId
                       JOIN RBL_TEMPDB.TempAdVAcBalanceDetail D   ON D.AccountEntityId = A.AccountEntityId
                       JOIN RBL_TEMPDB.TempAdvAcFinancialDetail E   ON E.AccountEntityId = A.AccountEntityId
                 WHERE  ContExcsSinceDt IS NOT NULL
                          AND a.ProductAlt_Key = 358 );

         END;
         END IF;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.ContExcsSinceDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.ContExcsSinceDtAccountCal B   ON ( B.EffectiveFromTimeKey <= v_TimeKey
                AND B.EffectiveToTimeKey >= v_TimeKey )
                AND A.ACCOUNTENTITYID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.ContiExcessDt = src.ContExcsSinceDt;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.ContExcsSinceDebitDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.ContExcsSinceDtDebitAccountCal B   ON ( B.EffectiveFromTimeKey <= v_TimeKey
                AND B.EffectiveToTimeKey >= v_TimeKey )
                AND A.ACCOUNTENTITYID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DebitSinceDt = src.ContExcsSinceDebitDt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE ContiExcessDt FOR CC ACCOUNT';
         /*---------------******UPDATE Balance,OverdueAmt,OverDueSinceDt,BalanceInCrncy and LastCrDate  FROM AdvACBalanceDetail*******----------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE Balance,LastCrDate,CreditsinceDt FOR ALL ACCOUNT' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.Balance, CASE 
         WHEN NVL(DebitSinceDt, '1900-01-01') > NVL(LastCrDt, '1900-01-01') THEN NULL
         ELSE (CASE 
         WHEN FacilityType IN ( 'DL','TL','BP','BD','PC' )
          THEN NULL
         ELSE B.LastCrDt
            END)
            END AS pos_3, B.LastCrDt, B.MocTypeAlt_Key, B.MocStatus, B.MocDate, B.OverDueSinceDt, B.OverDue, B.OverduePrincipal, B.Overdueinterest, B.PrincipalBalance, B.AdvanceRecovery, B.NotionalInttAmt, B.DFVAmt, B.OverduePrincipalDt, B.OverdueIntDt, B.OverOtherdue, B.OverdueOtherDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcBalanceDetail B   ON ( B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                AND A.ACCOUNTENTITYID = B.ACCOUNTENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Balance = src.Balance,
                                      A.LastCrDate = pos_3,
                                      A.CreditsinceDt = src.LastCrDt,
                                      A.CommonMocTypeAlt_Key = src.MocTypeAlt_Key,
                                      A.FlgMoc = src.MocStatus,
                                      A.MOC_Dt = src.MocDate,
                                      A.OverDueSinceDt = src.OverDueSinceDt,
                                      A.OverdueAmt = src.OverDue,
                                      A.PrincOverdue = src.OverduePrincipal,
                                      A.IntOverdue = src.Overdueinterest,
                                      A.PrincOutStd = src.PrincipalBalance,
                                      A.AdvanceRecovery = src.AdvanceRecovery,
                                      A.NotionalInttAmt = src.NotionalInttAmt,
                                      A.DFVAmt = src.DFVAmt,
                                      A.PrincOverdueSinceDt = src.OverduePrincipalDt,
                                      A.IntOverdueSinceDt = src.OverdueIntDt,
                                      A.OtherOverdue = src.OverOtherdue,
                                      A.OtherOverdueSinceDt = src.OverdueOtherDt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Balance,LastCrDate,CreditsinceDt FOR ALL ACCOUNT';
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, b.CurQtrCredit, b.CurQtrInt
         FROM a ,tt_ACCOUNTCAL_26 a
                JOIN RBL_STGDB.ACCOUNT_ALL_SOURCE_SYSTEM b   ON a.customeracid = b.customeracid 
          WHERE ( NVL(b.CurQtrCredit, 0) > 0
           OR NVL(b.CurQtrInt, 0) > 0 )
           AND a.FacilityType IN ( 'CC','OD' )
         ) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET a.CurQtrCredit = src.CurQtrCredit,
                                      A.CurQtrInt = src.CurQtrInt;--28062021 added by amar for filter only for ccod  
         --update a  
         --        set  FacilityType='CC'  
         --from tt_ACCOUNTCAL_26 a WHERE FacilityType='CCOD'  
         ------  
         --UPDATE A SET A.OVERDUESINCEDT=DATEADD(DAY,-b.CD,@PROCESSINGDATE)  
         --FROM tt_ACCOUNTCAL_26 A INNER  JOIN RBL_STGDB.DBO.ACCOUNT_ALL_SOURCE_SYSTEM b on a.customeracid=b.CustomerAcID  
         --INNER JOIN DIMSOURCEDB c ON A.SourceAlt_Key=c.SourceAlt_Key  
         --where ISNULL(B.CD,0)>0 and SourceName='VISIONPLUS' AND c.EffectiveFromTimeKey<=@Timekey and c.EffectiveToTimeKey>=@Timekey  
         ----UPDATE A SET Liability=B.Liability,CD=B.CD,AccountStatus=b.AccountStatus,AccountBlkCode1=b.AccountBlkCode1,AccountBlkCode2=b.AccountBlkCode2  
         ----FROM tt_ACCOUNTCAL_26 A INNER  JOIN RBL_STGDB.DBO.ACCOUNT_ALL_SOURCE_SYSTEM b on a.customeracid=b.CustomerAcID  
         ----INNER JOIN DIMSOURCEDB c ON A.SourceAlt_Key=c.SourceAlt_Key  
         ----where  SourceName='VISIONPLUS' AND c.EffectiveFromTimeKey<=@Timekey and c.EffectiveToTimeKey>=@Timekey  
         /* end of temporary updates*/
         /*------------------UPDATE OVERDUE SINCE DATE DUE TO DPD MAX FOR VISION PLUS DATA ONLY------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE OVERDUE SINCE DATE DUE TO DPD MAX FOR VISION PLUS DATA ONLY' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         --UPDATE A SET A.OVERDUESINCEDT=DATEADD(DAY,-DPD,@PROCESSINGDATE)  
         --FROM tt_ACCOUNTCAL_26 A INNER  JOIN DBO.AdvFacCreditCardDetail B ON A.AccountEntityID=B.AccountEntityID  
         --WHERE  (B.EffectiveFromTimeKey<=@TIMEKEY and B.EffectiveToTimeKey>=@TIMEKEY) AND ISNULL(B.DPD,0)>0  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.Liability, B.CD, b.AccountStatus, b.AccountBlkCode1, b.AccountBlkCode2
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdvFacCreditCardDetail b   ON a.AccountEntityID = b.AccountEntityID
                AND B.EffectiveFromTimeKey <= v_Timekey
                AND B.EffectiveToTimeKey >= v_Timekey
                JOIN DIMSOURCEDB c   ON A.SourceAlt_Key = c.SourceAlt_Key 
          WHERE SourceName = 'VISIONPLUS'
           AND c.EffectiveFromTimeKey <= v_Timekey
           AND c.EffectiveToTimeKey >= v_Timekey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Liability = src.Liability,
                                      A.CD = src.CD,
                                      A.AccountStatus = src.AccountStatus,
                                      A.AccountBlkCode1 = src.AccountBlkCode1,
                                      A.AccountBlkCode2 = src.AccountBlkCode2;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.Liability, B.CD, b.AccountStatus, b.AccountBlkCode1, b.AccountBlkCode2
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvFacCreditCardDetail B   ON A.AccountEntityID = B.AccountEntityID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Liability = src.Liability,
                                      A.CD = src.CD,
                                      A.AccountStatus = src.AccountStatus,
                                      A.AccountBlkCode1 = src.AccountBlkCode1,
                                      A.AccountBlkCode2 = src.AccountBlkCode2;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE OVERDUE SINCE DATE DUE TO DPD MAX FOR VISION PLUS DATA ONLY';
         /*-----update SrcAssetClass_Key key|SysAssetClassAlt_Key in customer Cal table--------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'SrcAssetClass_Key key|SysAssetClassAlt_Key' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         v_HistTimeKey := v_TIMEKEY - 1 ;--max(EffectiveFromTimeKey) from PRO.ACCOUNTCAL_Hist where  EffectiveFromTimeKey <@TIMEKEY  
         IF NVL(v_HistTimeKey, 0) = 0 THEN

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, NVL(c.Cust_AssetClassAlt_Key, 1) AS pos_2, NVL(c.Cust_AssetClassAlt_Key, 1) AS pos_3, NVL(C.NPADt, NULL) AS pos_4, NVL(C.NPADt, NULL) AS pos_5, NVL(C.DbtDt, NULL) AS pos_6, NVL(C.LosDt, NULL) AS pos_7
            FROM A ,tt_CUSTOMERCAL_23 A
                   LEFT JOIN RBL_MISDB_PROD.AdvCustNPADetail C   ON C.CustomerEntityId = A.CustomerEntityId
                   AND ( C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY ) ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.SrcAssetClassAlt_Key = pos_2,
                                         A.SysAssetClassAlt_Key = pos_3,
                                         A.SrcNPA_Dt = pos_4,
                                         A.SysNPA_Dt = pos_5,
                                         A.DbtDt = pos_6,
                                         A.LossDt = pos_7;

         END;
         ELSE

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, NVL(c.SysAssetClassAlt_Key, 1) AS pos_2, NVL(c.SysAssetClassAlt_Key, 1) AS pos_3, NVL(C.SysNPA_Dt, NULL) AS pos_4, NVL(C.SysNPA_Dt, NULL) AS pos_5, NVL(C.DbtDt, NULL) AS pos_6, NVL(C.LossDt, NULL) AS pos_7
            FROM A ,tt_CUSTOMERCAL_23 A
                   LEFT JOIN PRO_RBL_MISDB_PROD.CustomerCal_Hist C   ON C.CustomerEntityId = A.CustomerEntityId
                   AND ( C.EFFECTIVEFROMTIMEKEY <= v_HistTimeKey
                   AND C.EFFECTIVETOTIMEKEY >= v_HistTimeKey ) ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.SrcAssetClassAlt_Key = pos_2,
                                         A.SysAssetClassAlt_Key = pos_3,
                                         A.SrcNPA_Dt = pos_4,
                                         A.SysNPA_Dt = pos_5,
                                         A.DbtDt = pos_6,
                                         A.LossDt = pos_7;

         END;
         END IF;
         /* START -- Added By Mandeep with discussion from AMAR Sir on 06-10-2023 to update uniform  asset class and Npa date at ucif level   */
         WITH CTE ( UCIFENTITYID,
                    SYSASSETCLASSALT_KEY,
                    SYSNPA_DT ) AS ( SELECT UCIFENTITYID ,
                                            MAX(SYSASSETCLASSALT_KEY)  SYSASSETCLASSALT_KEY  ,
                                            MIN(SYSNPA_DT)  SYSNPA_DT  
           FROM tt_CUSTOMERCAL_23 
           GROUP BY UCIFENTITYID ) 
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.SYSASSETCLASSALT_KEY, B.SYSNPA_DT
            FROM A ,tt_CUSTOMERCAL_23 A
                   JOIN CTE B   ON A.UcifEntityID = B.UCIFENTITYID ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.SYSASSETCLASSALT_KEY,
                                         A.SYSNPA_DT = src.SYSNPA_DT
            ;
         /* END -- Added By Mandeep with discussion from AMAR Sir on 06-10-2023 to update uniform  asset class and Npa date at ucif level   */
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'SrcAssetClass_Key key|SysAssetClassAlt_Key';
         ----IF OBJECT_ID('TEMPDB..#TEMPTABLE_VISIONPLUS_ASSETCLASS') IS NOT NULL  
         ----  DROP TABLE #TEMPTABLE_VISIONPLUS_ASSETCLASS  
         ----  SELECT  SOURCESYSTEMCUSTOMERID,  
         ----MAX(CASE WHEN CD IN(5,6,7,8,9) THEN 2 ELSE 1 END ) ASSETCLASS ---OR ISNULL(ACCOUNTSTATUS,'N')='Z'  
         ----INTO #TEMPTABLE_VISIONPLUS_ASSETCLASS  
         ----FROM tt_ACCOUNTCAL_26 A  
         ----INNER JOIN DIMSOURCEDB B  
         ----ON A.SourceAlt_Key=B.SourceAlt_Key  
         ----WHERE SourceName='VISIONPLUS' AND B.EffectiveFromTimeKey<=@Timekey and B.EffectiveToTimeKey>=@Timekey  
         ----and ( CD IN(5,6,7,8,9) )  
         ----GROUP BY SOURCESYSTEMCUSTOMERID  
         ----UPDATE A SET  A.SYSASSETCLASSALT_KEY=ISNULL(B.ASSETCLASS,1)  
         ----            ,A.SysNPA_Dt=@ProcessingDate  
         ----FROM tt_CUSTOMERCAL_23 A INNER JOIN #TEMPTABLE_VISIONPLUS_ASSETCLASS B  
         ----ON A.SOURCESYSTEMCUSTOMERID=B.SOURCESYSTEMCUSTOMERID  
         ----WHERE ASSETCLASS=2 AND SYSASSETCLASSALT_KEY=1  
         /*-----update SrcAssetClass_Key key|SysAssetClassAlt_Key in customer Cal table--------------*/
         /*------------------UPDATE SYSASSETCLASSALT_KEY|SYSNPA_DT BY PAN NO------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE SYSASSETCLASSALT_KEY|SYSNPA_DT BY PAN NO' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         IF NVL(v_PANCARDFLAG, 'N') = 'Y' THEN

         BEGIN
            IF utils.object_id('TEMPDB..tt_TEMPTABLEPANCARD_3') IS NOT NULL THEN
             EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLEPANCARD_3 ';
            END IF;
            DELETE FROM tt_TEMPTABLEPANCARD_3;
            UTILS.IDENTITY_RESET('tt_TEMPTABLEPANCARD_3');

            INSERT INTO tt_TEMPTABLEPANCARD_3 ( 
            	SELECT PANNO ,
                    MAX(NVL(SYSASSETCLASSALT_KEY, 1))  SYSASSETCLASSALT_KEY  ,
                    MIN(SYSNPA_DT)  SYSNPA_DT  
            	  FROM tt_CUSTOMERCAL_23 A
                      JOIN DIMSOURCEDB B   ON B.SOURCEALT_KEY = A.SOURCEALT_KEY
                      AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY
            	 WHERE  PANNO IS NOT NULL
                       AND NVL(SYSASSETCLASSALT_KEY, 1) <> 1
            	  GROUP BY PANNO );

            EXECUTE IMMEDIATE ' ALTER TABLE tt_TEMPTABLEPANCARD_3 
               ADD ( SOURCEDBNAME VARCHAR2(20)  ) ';
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, C.SOURCEDBNAME
            FROM A ,tt_TEMPTABLEPANCARD_3 A
                   JOIN tt_CUSTOMERCAL_23 B   ON A.PANNO = B.PANNO
                   JOIN DIMSOURCEDB C   ON B.SOURCEALT_KEY = C.SOURCEALT_KEY
                   AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
             WHERE A.SYSNPA_DT = B.SYSNPA_DT) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.SOURCEDBNAME = src.SOURCEDBNAME;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.SYSASSETCLASSALT_KEY, B.SYSNPA_DT
            FROM A ,tt_CUSTOMERCAL_23 A
                   JOIN tt_TEMPTABLEPANCARD_3 B   ON A.PANNO = B.PANNO ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.SYSASSETCLASSALT_KEY,
                                         A.SYSNPA_DT = src.SYSNPA_DT;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'PERCOLATION BY PAN CARD ' || ' ' || B.SOURCEDBNAME || '  ' || B.PANNO AS DEGREASON
            FROM A ,tt_CUSTOMERCAL_23 A
                   JOIN tt_TEMPTABLEPANCARD_3 B   ON A.PANNO = B.PANNO 
             WHERE A.SRCASSETCLASSALT_KEY = 1
              AND A.SYSASSETCLASSALT_KEY > 1
              AND A.DEGREASON IS NULL) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;

         END;
         END IF;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE SYSASSETCLASSALT_KEY|SYSNPA_DT BY PAN NO';
         /*------------------UPDATE SYSASSETCLASSALT_KEY|SYSNPA_DT BY AADHAR CARD NO------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE SYSASSETCLASSALT_KEY|SYSNPA_DT BY AADHARCARD NO' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         IF NVL(v_AADHARCARDFLAG, 'N') = 'Y' THEN

         BEGIN
            IF utils.object_id('TEMPDB..tt_TEMPTABLE_ADHARCARD_3') IS NOT NULL THEN
             EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPTABLE_ADHARCARD_3 ';
            END IF;
            DELETE FROM tt_TEMPTABLE_ADHARCARD_3;
            UTILS.IDENTITY_RESET('tt_TEMPTABLE_ADHARCARD_3');

            INSERT INTO tt_TEMPTABLE_ADHARCARD_3 ( 
            	SELECT AADHARCARDNO ,
                    MAX(NVL(SYSASSETCLASSALT_KEY, 1))  SYSASSETCLASSALT_KEY  ,
                    MIN(SYSNPA_DT)  SYSNPA_DT  ,
                    B.SOURCEDBNAME 
            	  FROM tt_CUSTOMERCAL_23 A
                      JOIN DIMSOURCEDB B   ON B.SOURCEALT_KEY = A.SOURCEALT_KEY
                      AND B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                      AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY
            	 WHERE  A.AADHARCARDNO IS NOT NULL
                       AND NVL(A.SYSASSETCLASSALT_KEY, 1) <> 1
            	  GROUP BY AADHARCARDNO,B.SOURCEDBNAME );
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, B.SYSASSETCLASSALT_KEY, B.SYSNPA_DT
            FROM A ,tt_CUSTOMERCAL_23 A
                   JOIN tt_TEMPTABLE_ADHARCARD_3 B   ON A.AADHARCARDNO = B.AADHARCARDNO ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.SYSASSETCLASSALT_KEY,
                                         A.SYSNPA_DT = src.SYSNPA_DT;
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'PERCOLATION BY AADHAR CARD ' || ' ' || B.SOURCEDBNAME || '  ' || B.AADHARCARDNO AS DEGREASON
            FROM A ,tt_CUSTOMERCAL_23 A
                   JOIN tt_TEMPTABLE_ADHARCARD_3 B   ON A.AADHARCARDNO = B.AADHARCARDNO 
             WHERE A.SRCASSETCLASSALT_KEY = 1
              AND A.SYSASSETCLASSALT_KEY > 1
              AND A.DEGREASON IS NULL) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET B.DEGREASON = src.DEGREASON;

         END;
         END IF;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE SYSASSETCLASSALT_KEY|SYSNPA_DT BY AADHARCARD NO';
         /*-----UPDATE SplCatg Alt_Key ACCOUNT LEVEL--------------- */
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'SplCatg Alt_Key ACCOUNT LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SplCatg1Alt_Key, 0) AS pos_2, NVL(B.SplCatg2Alt_Key, 0) AS pos_3, NVL(B.SplCatg3Alt_Key, 0) AS pos_4, NVL(B.SplCatg4Alt_Key, 0) AS pos_5
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcOtherDetail B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID
                AND B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SplCatg1Alt_Key = pos_2,
                                      A.SplCatg2Alt_Key = pos_3,
                                      A.SplCatg3Alt_Key = pos_4,
                                      A.SplCatg4Alt_Key = pos_5;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'SplCatg Alt_Key ACCOUNT LEVEL';
         /*-----UPDATE SplCatg Alt_Key CUSTOMER LEVEL--------------- */
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE SplCatg Alt_Key CUSTOMER LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SplCatg1Alt_Key, 0) AS pos_2, NVL(B.SplCatg2Alt_Key, 0) AS pos_3, NVL(B.SplCatg3Alt_Key, 0) AS pos_4, NVL(B.SplCatg4Alt_Key, 0) AS pos_5
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN RBL_MISDB_PROD.AdvCustOtherDetail B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID
                AND B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SplCatg1Alt_Key = pos_2,
                                      A.SplCatg2Alt_Key = pos_3,
                                      A.SplCatg3Alt_Key = pos_4,
                                      A.SplCatg4Alt_Key = pos_5;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE SplCatg Alt_Key CUSTOMER LEVEL';
         /*----MARKING OF ALWAYS STD Account LEVEL----------------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'MARKING OF ALWAYS STD Account LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_STD'
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                LEFT JOIN DimScheme DSE   ON DSE.EffectiveFromTimeKey <= v_TimeKey
                AND DSE.EffectiveToTimeKey >= v_TimeKey
                AND ACL.SchemeAlt_Key = DSE.SchemeAlt_Key
                LEFT JOIN DimAcSplCategory DAS1   ON DAS1.EffectiveFromTimeKey <= v_TimeKey
                AND DAS1.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg1Alt_Key, 0) = DAS1.SplCatAlt_Key
                AND NVL(DAS1.AssetClass, 'NORMAL') = 'ALWYS_STD'
                LEFT JOIN DimAcSplCategory DAS2   ON DAS2.EffectiveFromTimeKey <= v_TimeKey
                AND DAS2.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg2Alt_Key, 0) = DAS2.SplCatAlt_Key
                AND NVL(DAS2.AssetClass, 'NORMAL') = 'ALWYS_STD'
                LEFT JOIN DimAcSplCategory DAS3   ON DAS3.EffectiveFromTimeKey <= v_TimeKey
                AND DAS3.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg3Alt_Key, 0) = DAS3.SplCatAlt_Key
                AND NVL(DAS3.AssetClass, 'NORMAL') = 'ALWYS_STD'
                LEFT JOIN DimAcSplCategory DAS4   ON DAS4.EffectiveFromTimeKey <= v_TimeKey
                AND DAS4.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg4Alt_Key, 0) = DAS4.SplCatAlt_Key
                AND NVL(DAS4.AssetClass, 'NORMAL') = 'ALWYS_STD'
                LEFT JOIN DIMPRODUCT P   ON P.ProductAlt_Key = ACL.ProductAlt_Key
                AND P.EffectiveFromTimeKey <= v_TIMEKEY
                AND P.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE ( ( NVL(DSE.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS1.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS2.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS3.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS4.AssetClass, 'NORMAL') = 'ALWYS_STD' ) )
           OR ( NVL(P.AssetClass, 'NORMAL') = 'ALWYS_STD' )) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_STD';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'MARKING OF ALWAYS STD Account LEVEL';
         /*--------marking  always NPA account table level----------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'marking  always NPA account table level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA'
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                LEFT JOIN DimScheme DSE   ON DSE.EffectiveFromTimeKey <= v_TimeKey
                AND DSE.EffectiveToTimeKey >= v_TimeKey
                AND ACL.SchemeAlt_Key = DSE.SchemeAlt_Key
                LEFT JOIN DimAcSplCategory DAS1   ON DAS1.EffectiveFromTimeKey <= v_TimeKey
                AND DAS1.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg1Alt_Key, 0) = DAS1.SplCatAlt_Key
                AND NVL(DAS1.AssetClass, 'NORMAL') = 'ALWYS_NPA'
                LEFT JOIN DimAcSplCategory DAS2   ON DAS2.EffectiveFromTimeKey <= v_TimeKey
                AND DAS2.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg2Alt_Key, 0) = DAS2.SplCatAlt_Key
                AND NVL(DAS2.AssetClass, 'NORMAL') = 'ALWYS_NPA'
                LEFT JOIN DimAcSplCategory DAS3   ON DAS3.EffectiveFromTimeKey <= v_TimeKey
                AND DAS3.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg3Alt_Key, 0) = DAS3.SplCatAlt_Key
                AND NVL(DAS3.AssetClass, 'NORMAL') = 'ALWYS_NPA'
                LEFT JOIN DimAcSplCategory DAS4   ON DAS4.EffectiveFromTimeKey <= v_TimeKey
                AND DAS4.EffectiveToTimeKey >= v_TimeKey
                AND NVL(ACL.SplCatg4Alt_Key, 0) = DAS4.SplCatAlt_Key
                AND NVL(DAS4.AssetClass, 'NORMAL') = 'ALWYS_NPA' 
          WHERE ( ( NVL(DSE.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS1.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS2.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS3.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS4.AssetClass, 'NORMAL') = 'ALWYS_NPA' ) )) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'marking  always NPA account table level';
         /*-----------------marking  always STD CUSTOMER  level------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'marking  always STD CUSTOMER  level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_STD'
         FROM A ,tt_CUSTOMERCAL_23 A
                LEFT JOIN DimConstitution DCO   ON DCO.EffectiveFromTimeKey <= v_TimeKey
                AND DCO.EffectiveToTimeKey >= v_TimeKey
                AND A.ConstitutionAlt_Key = DCO.ConstitutionAlt_Key
                LEFT JOIN DimSplCategory DAS1   ON DAS1.EffectiveFromTimeKey <= v_TimeKey
                AND DAS1.EffectiveToTimeKey >= v_TimeKey
                AND A.SplCatg1Alt_Key = DAS1.SplCatAlt_Key
                LEFT JOIN DimSplCategory DAS2   ON DAS2.EffectiveFromTimeKey <= v_TimeKey
                AND DAS2.EffectiveToTimeKey >= v_TimeKey
                AND A.SplCatg2Alt_Key = DAS2.SplCatAlt_Key
                LEFT JOIN DimSplCategory DAS3   ON DAS3.EffectiveFromTimeKey <= v_TimeKey
                AND DAS3.EffectiveToTimeKey >= v_TimeKey
                AND A.SplCatg3Alt_Key = DAS3.SplCatAlt_Key
                LEFT JOIN DimSplCategory DAS4   ON DAS4.EffectiveFromTimeKey <= v_TimeKey
                AND DAS4.EffectiveToTimeKey >= v_TimeKey
                AND A.SplCatg4Alt_Key = DAS4.SplCatAlt_Key 
          WHERE ( ( NVL(DCO.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS1.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS2.AssetClass, 'NORMAL') = 'ALWYS_STD' )
           OR ( NVL(DAS3.AssetClass, 'NORMAL') = 'ALWYS_STD'
           OR NVL(DAS4.AssetClass, 'NORMAL') = 'ALWYS_STD' ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DAS3.Asset_Norm = 'ALWYS_STD';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'marking  always STD CUSTOMER  level';
         /*---marking  always NPA CUSTOMER table level------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'marking  always NPA CUSTOMER table level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
         FROM A ,tt_CUSTOMERCAL_23 A
                LEFT JOIN DimConstitution DCO   ON ( DCO.EffectiveFromTimeKey <= v_TimeKey
                AND DCO.EffectiveToTimeKey >= v_TimeKey )
                AND A.ConstitutionAlt_Key = DCO.ConstitutionAlt_Key
                LEFT JOIN DimSplCategory DAS1   ON ( DAS1.EffectiveFromTimeKey <= v_TimeKey
                AND DAS1.EffectiveToTimeKey >= v_TimeKey )
                AND A.SplCatg1Alt_Key = DAS1.SplCatAlt_Key
                LEFT JOIN DimSplCategory DAS2   ON ( DAS2.EffectiveFromTimeKey <= v_TimeKey
                AND DAS2.EffectiveToTimeKey >= v_TimeKey )
                AND A.SplCatg2Alt_Key = DAS2.SplCatAlt_Key
                LEFT JOIN DimSplCategory DAS3   ON ( DAS3.EffectiveFromTimeKey <= v_TimeKey
                AND DAS3.EffectiveToTimeKey >= v_TimeKey )
                AND A.SplCatg3Alt_Key = DAS3.SplCatAlt_Key
                LEFT JOIN DimSplCategory DAS4   ON ( DAS4.EffectiveFromTimeKey <= v_TimeKey
                AND DAS4.EffectiveToTimeKey >= v_TimeKey )
                AND A.SplCatg4Alt_Key = DAS4.SplCatAlt_Key 
          WHERE ( ( NVL(DCO.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS1.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS2.AssetClass, 'NORMAL') = 'ALWYS_NPA' )
           OR ( NVL(DAS3.AssetClass, 'NORMAL') = 'ALWYS_NPA'
           OR NVL(DAS4.AssetClass, 'NORMAL') = 'ALWYS_NPA' ) )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET DAS3.Asset_Norm = 'ALWYS_NPA';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'marking  always NPA CUSTOMER table level';
         /*----UPDATE ACCOUNTS WHOSE CUSTOMER IS IN ALWAYS STANDAED CATEGORY---------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE Accounts whose customer is in always standaed category' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO ABD 
         USING (SELECT ABD.ROWID row_id, 'ALWYS_STD'
         FROM ABD ,tt_ACCOUNTCAL_26 ABD
                JOIN tt_CUSTOMERCAL_23 CBD   ON ABD.CustomerEntityId = CBD.CustomerEntityID 
          WHERE CBD.Asset_Norm = 'ALWYS_STD') src
         ON ( ABD.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.Asset_Norm = 'ALWYS_STD';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Accounts whose customer is in always standaed category';
         /*----UPDATE ACCOUNTS WHOSE CUSTOMER IS IN ALWAYS NPA CATEGORY--------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE Accounts whose customer is in always NPA category' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO ABD 
         USING (SELECT ABD.ROWID row_id, 'ALWYS_NPA'
         FROM ABD ,tt_ACCOUNTCAL_26 ABD
                JOIN tt_CUSTOMERCAL_23 CBD   ON ABD.CustomerEntityId = CBD.CustomerEntityID 
          WHERE CBD.Asset_Norm = 'ALWYS_NPA'
           AND ABD.Asset_Norm <> 'ALWYS_STD') src
         ON ( ABD.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ABD.Asset_Norm = 'ALWYS_NPA';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Accounts whose customer is in always NPA category';
         /*-------CurrAssetClassAlt_Key update in Account Cal from customer Cal systemAssetclassalt_key--------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'CurrAssetClassAlt_Key update in Account Cal from customer Cal systemAssetclassalt_key' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ------UPDATE A  
         ------SET A.INITIALASSETCLASSALT_KEY=ISNULL(B.SysAssetClassAlt_Key,1)  
         ------   ,A.FinalAssetClassAlt_Key=ISNULL(B.SysAssetClassAlt_Key,1)  
         ------   ,A.PrvAssetClassAlt_Key=ISNULL(B.SysAssetClassAlt_Key,1)  
         ------FROM tt_ACCOUNTCAL_26 A LEFT  OUTER JOIN   tt_CUSTOMERCAL_23  B   
         ------ON   (B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND B.EFFECTIVETOTIMEKEY>=@TIMEKEY)   
         ------AND A.CustomerEntityID=B.CustomerEntityID  
         IF NVL(v_HistTimeKey, 0) = 0 THEN

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, NVL(c.Cust_AssetClassAlt_Key, 1) AS pos_2, NVL(C.Cust_AssetClassAlt_Key, 1) AS pos_3, NVL(C.NPADt, NULL) AS pos_4
            FROM A ,tt_ACCOUNTCAL_26 A
                   JOIN RBL_MISDB_PROD.AdvCustNPADetail C   ON C.CustomerEntityId = A.CustomerEntityId
                   AND ( C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY ) ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.INITIALASSETCLASSALT_KEY = pos_2,
                                         A.PrvAssetClassAlt_Key = pos_3,
                                         A.InitialNpaDt = pos_4;

         END;
         ELSE

         BEGIN
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, NVL(c.FinalAssetClassAlt_Key, 1) AS pos_2, NVL(C.FinalAssetClassAlt_Key, 1) AS pos_3, C.FinalNpaDt
            FROM A ,tt_ACCOUNTCAL_26 A
                   JOIN PRO_RBL_MISDB_PROD.AccountCal_Hist C   ON C.AccountEntityID = A.AccountEntityID
                   AND ( C.EFFECTIVEFROMTIMEKEY <= v_HistTimeKey
                   AND C.EFFECTIVETOTIMEKEY >= v_HistTimeKey ) ) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.INITIALASSETCLASSALT_KEY = pos_2,
                                         A.PrvAssetClassAlt_Key = pos_3,
                                         A.InitialNpaDt = src.FinalNpaDt;

         END;
         END IF;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS FinalAssetClassAlt_Key
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_CUSTOMERCAL_23 B   ON A.CustomerEntityID = B.CustomerEntityID
                AND ( B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY ) ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.SysAssetClassAlt_Key, 1) AS FinalAssetClassAlt_Key
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_CUSTOMERCAL_23 B   ON A.UcifEntityID = B.UcifEntityID
                AND ( B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY ) ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.FinalAssetClassAlt_Key;
         IF v_PANCARDFLAG = 'Y' THEN

         BEGIN
            MERGE INTO C 
            USING (SELECT C.ROWID row_id, A.SYSASSETCLASSALT_KEY
            FROM C ,tt_CUSTOMERCAL_23 A
                   JOIN tt_TEMPTABLEPANCARD_3 B   ON A.PANNO = B.PANNO
                   JOIN tt_ACCOUNTCAL_26 C   ON C.UcifEntityID = A.UcifEntityID ) src
            ON ( C.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET C.FinalAssetClassAlt_Key
                                         --,C.FinalNpaDt=A.SYSNPA_DT    
                                          = src.SYSASSETCLASSALT_KEY;

         END;
         END IF;
         --Added by Mandeep (24-03-2023) to stop update in finalassetclass of FDOD always standard account(if initial assetclass <> 1)  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'CONDI_STD'
         FROM A ,tt_ACCOUNTCAL_26 A
                LEFT JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key 
          WHERE A.InitialAssetClassAlt_Key <> 1
           AND C.ProductGroup = 'FDSEC'
           AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'CONDI_STD';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'CurrAssetClassAlt_Key update in Account Cal from customer Cal systemAssetclassalt_key';
         /*---------UPDATE INITIALNPADT AND FINALNPADT AT ACCOUNT  LEVEL FROM CUSTOMER TO ACCOUNT------------- */
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE InitialNpaDt AND FinalNpaDt AT Account  level from customer to account' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ------UPDATE A SET  A.InitialNpaDt=B.SrcNPA_Dt  
         ------             ,A.FinalNpaDt=B.SrcNPA_Dt  
         ------FROM tt_ACCOUNTCAL_26  A INNER  JOIN tt_CUSTOMERCAL_23 B ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID  
         ------WHERE A.INITIALASSETCLASSALT_KEY<>1  
         /* COMMENTED BELOQ CODE AND INITIAL NPA DATED INCLUDED IN AB OVE UPDATE WITH INITAIL ASSET CASS*/
         /*  
           IF ISNULL(@HistTimeKey ,0)=0  
           BEGIN  
            UPDATE A SET  A.InitialNpaDt=isnull(C.NPADt,null)  
                 FROM tt_ACCOUNTCAL_26 A  LEFT hash JOIN dbo.AdvCustNPAdetail C  
             ON C.CustomerEntityId=A.CustomerEntityId  
            AND (C.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND C.EFFECTIVETOTIMEKEY>=@TIMEKEY)  
           END  
           ELSE  
           BEGIN  
            UPDATE A SET  A.InitialNpaDt=isnull(C.FinalNpaDt,null)  
                 FROM tt_ACCOUNTCAL_26 A  LEFT hash JOIN PRO.ACCOUNTCAL_Hist C  
             ON C.AccountEntityID=A.AccountEntityID  
            AND (C.EFFECTIVEFROMTIMEKEY<=@HistTimeKey AND C.EFFECTIVETOTIMEKEY>=@HistTimeKey)  
           END  
         */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SysNPA_Dt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_CUSTOMERCAL_23 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalNpaDt = src.SysNPA_Dt;
         --WHERE A.INITIALASSETCLASSALT_KEY<>1  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.SysNPA_Dt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_CUSTOMERCAL_23 B   ON A.UcifEntityID = B.UcifEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalNpaDt = src.SysNPA_Dt;
         --WHERE A.INITIALASSETCLASSALT_KEY<>1  
         IF v_PANCARDFLAG = 'Y' THEN

         BEGIN
            MERGE INTO C 
            USING (SELECT C.ROWID row_id, A.SYSNPA_DT
            FROM C ,tt_CUSTOMERCAL_23 A
                   JOIN tt_TEMPTABLEPANCARD_3 B   ON A.PANNO = B.PANNO
                   JOIN tt_ACCOUNTCAL_26 C   ON C.UcifEntityID = A.UcifEntityID ) src
            ON ( C.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET C.FinalNpaDt = src.SYSNPA_DT;

         END;
         END IF;
         /* AMAR - 23032022 - COMMENTED AS PER DISCUSSIONS AND EMAIL BY ASHISH SIR DATED 23032022*/
         /*  
         UPDATE tt_ACCOUNTCAL_26 SET ASSET_NORM='ALWYS_NPA'  
         WHERE INITIALASSETCLASSALT_KEY=6  
         */
         /* AMAR - 06042022 0  SHIFTED THIS CODE TO BELOW (AFTER TWO AND SETTLEMENT WORK) - FOR MARKING THE 1ST PRIORITY OF TWO (ALWAYS NPA) */
         /*  
         --UPDATE tt_ACCOUNTCAL_26 SET INITIALASSETCLASSALT_KEY=1,INITIALNPADT=NULL,FINALNPADT=NULL,FINALASSETCLASSALT_KEY=1,PrvAssetClassAlt_Key=1  
         --WHERE ASSET_NORM='ALWYS_STD' AND INITIALASSETCLASSALT_KEY<>1   
         */
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE InitialNpaDt AND FinalNpaDt AT Account  level from customer to account';
         /*--------MARKING ALWAYS NPA ACCOUNT TABLE LEVEL FOR VISION PLUS ACCOUNT WHERE ACCOUNTBLOCK CODE 2 IS K----------------*/
         /* AMAR 17022022- CHANGES ACCOUNTBLOCKCODE2=K MARKED AS NPA*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'marking always NPA account table level where vision plus  AccountBlockcode2=K' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 2, v_ProcessingDate, 'NPA DUE TO CREDIT CARD SETTLEMENT - Always NPA' AS pos_5, 'NPA DUE TO CREDIT CARD SETTLEMENT - Always NPA' AS pos_6
         FROM ACL ,tt_ACCOUNTCAL_26 ACL 
          WHERE AccountBlkCode2 IN ( 'K','E','W' )

           AND FinalAssetClassAlt_Key = 1
           AND NOT EXISTS ( SELECT 1 
                            FROM ExceptionFinalStatusType A
                             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                                      AND acl.CustomerAcID = a.ACID
                                      AND A.StatusType = 'Charge Off' )) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET Asset_Norm = 'ALWYS_NPA',
                                      FinalAssetClassAlt_Key = 2,
                                      FinalNpaDt = v_ProcessingDate,
                                      NPA_Reason = pos_5,
                                      DegReason = pos_6;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO CREDIT CARD SETTLEMENT - Always NPA' AS pos_3
         FROM ACL ,tt_ACCOUNTCAL_26 ACL 
          WHERE AccountBlkCode2 IN ( 'K','E','W' )

           AND FinalAssetClassAlt_Key > 1
           AND NOT EXISTS ( SELECT 1 
                            FROM ExceptionFinalStatusType A
                             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                                      AND acl.CustomerAcID = a.ACID
                                      AND A.StatusType = 'Charge Off' )) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET Asset_Norm = 'ALWYS_NPA',
                                      NPA_Reason = pos_3;
         /* CUSTOMER WRITEOFF UPDATE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO CREDIT CARD SETTLEMENT - Always NPA' AS pos_3, 2, v_ProcessingDate
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 AC   ON AC.CustomerEntityID = A.CustomerEntityID 
          WHERE AccountBlkCode2 IN ( 'K','E','W' )

           AND SysAssetClassAlt_Key = 1
           AND NOT EXISTS ( SELECT 1 
                            FROM ExceptionFinalStatusType A
                             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                                      AND ac.CustomerAcID = a.ACID
                                      AND A.StatusType = 'Charge Off' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET Asset_Norm = 'ALWYS_NPA',
                                      DegReason = pos_3,
                                      A.SysAssetClassAlt_Key = 2,
                                      A.SysNPA_Dt = v_ProcessingDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO CREDIT CARD SETTLEMENT - Always NPA' AS pos_3
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 AC   ON AC.CustomerEntityID = A.CustomerEntityID 
          WHERE AccountBlkCode2 IN ( 'K','E','W' )

           AND SysAssetClassAlt_Key > 1
           AND NOT EXISTS ( SELECT 1 
                            FROM ExceptionFinalStatusType A
                             WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                                      AND A.EffectiveToTimeKey >= v_TIMEKEY
                                      AND ac.CustomerAcID = a.ACID
                                      AND A.StatusType = 'Charge Off' )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET Asset_Norm = 'ALWYS_NPA',
                                      DegReason = pos_3;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'marking always NPA account table level where vision plus  AccountBlockcode2=K';
         /* END OF AMAR 17022022- CHANGES ACCOUNTBLOCKCODE2=K MARKED AS NPA*/
         /*--------Added by mandeep marking always NPA account table level where WriteOffAmount>0----------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'marking always NPA account table level where WriteOffAmount>0' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         --------DROP TABLE IF EXISTS #ALWYS0
         --------SELECT DISTINCT A.UCIF_ID,C.StatusType,MIN(C.StatusDate)StatusDate INTO #ALWYS0
         --------FROM tt_CUSTOMERCAL_23 A
         --------INNER JOIN tt_ACCOUNTCAL_26 B
         --------ON A.RefCustomerID=B.RefCustomerID
         --------INNER JOIN  ExceptionFinalStatusType C  
         --------on B.CustomerAcID=C.ACID  
         --------AND C.EFFECTIVEFROMTIMEKEY<=@TIMEKEY and C.EffectiveToTimeKey>=@TIMEKEY  
         --------WHERE C.StatusType IN('TWO','WO','WriteOff')
         --------GROUP BY A.UCIF_ID,C.StatusType
         ------- /* addded by mandeep to copy write off amount from Exception table to accountcal table 04-10-2023 */-----------
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, C.Amount
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7 
          WHERE C.StatusType IN ( 'TWO','WO','WriteOff' )

           AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND C.EffectiveToTimeKey >= v_TIMEKEY) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.WriteOffAmount = src.Amount;
         ---------------------------------------------------------------------------------------
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', CONCAT(NPA_Reason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN StatusDate < FinalNpaDt THEN StatusDate
         ELSE FinalNpaDt
            END AS pos_4
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7 
          WHERE C.StatusType IN ( 'TWO','WO','WriteOff' )

           AND FinalAssetClassAlt_Key > 1
           AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND C.EffectiveToTimeKey >= v_TIMEKEY) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason
                                      --CASE WHEN (ISNULL(NPA_Reason,'')<>'' AND ISNULL(NPA_Reason,'') NOT LIKE '%'+NPA_reason+'%') 
                                       --                 THEN CONCAT(NPA_Reason,',','NPA DUE TO '+StatusType) 
                                       --		   ELSE NPA_Reason END
                                       = pos_3,
                                      ACL.FinalNpaDt = pos_4;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN StatusDate IS NOT NULL THEN StatusDate
         ELSE v_ProcessingDate
            END AS pos_4, 'NPA DUE TO ' || StatusType AS pos_5, 'NPA DUE TO ' || StatusType AS pos_6
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType IN ( 'TWO','WO','WriteOff' )

           AND FinalAssetClassAlt_Key = 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.FinalAssetClassAlt_Key = 2,
                                      ACL.FinalNpaDt = pos_4,
                                      ACL.NPA_Reason = pos_5,
                                      ACL.DegReason = pos_6;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', CONCAT(A.DegReason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN StatusDate < SysNPA_Dt THEN StatusDate
         ELSE SysNPA_Dt
            END AS pos_4
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType IN ( 'TWO','WO','WriteOff' )

           AND SysAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason
                                      --CASE WHEN (ISNULL(DegReason,'')<>'' AND ISNULL(DegReason,'') NOT LIKE '%'+DegReason+'%') 
                                       --                  THEN CONCAT(DegReason,',','NPA DUE TO '+StatusType) 
                                       --			   ELSE DegReason END
                                       = pos_3,
                                      A.SysNPA_Dt = pos_4;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO ' || StatusType AS pos_3, 2, CASE 
         WHEN StatusDate IS NOT NULL THEN StatusDate
         ELSE v_ProcessingDate
            END AS pos_5
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType IN ( 'TWO','WO','WriteOff' )

           AND SysAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason = pos_3,
                                      A.SysAssetClassAlt_Key = 2,
                                      A.SysNPA_Dt = pos_5;
         ----end of Write Off ------------------------------------------------------------------
         /* CHARGEOFF MARKING -- ADDED BY MANDEEP 06092023 */
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', CONCAT(NPA_Reason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN StatusDate < FinalNpaDt THEN StatusDate
         ELSE FinalNpaDt
            END AS pos_4
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType = 'Charge Off'
           AND FinalAssetClassAlt_Key > 1
           AND acl.Balance > 0) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason
                                      --CASE WHEN (ISNULL(NPA_Reason,'')<>'' AND ISNULL(NPA_Reason,'') NOT LIKE '%'+NPA_reason+'%') 
                                       --                 THEN CONCAT(NPA_Reason,',','NPA DUE TO '+StatusType) 
                                       --		   ELSE NPA_Reason END
                                       = pos_3,
                                      ACL.FinalNpaDt = pos_4;-- added by mandeep on 06112023 (Percolate NPA accounts only when Balance>0)
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN StatusDate IS NOT NULL THEN StatusDate
         ELSE v_ProcessingDate
            END AS pos_4, 'NPA DUE TO ' || StatusType AS pos_5, 'NPA DUE TO ' || StatusType AS pos_6
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType = 'Charge Off'
           AND FinalAssetClassAlt_Key = 1
           AND acl.Balance > 0) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.FinalAssetClassAlt_Key = 2,
                                      ACL.FinalNpaDt = pos_4,
                                      ACL.NPA_Reason = pos_5,
                                      ACL.DegReason = pos_6;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', CONCAT(A.DegReason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN StatusDate < SysNPA_Dt THEN StatusDate
         ELSE SysNPA_Dt
            END AS pos_4
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType = 'Charge Off'
           AND SysAssetClassAlt_Key > 1
           AND acl.Balance > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason
                                      --CASE WHEN (ISNULL(DegReason,'')<>'' AND ISNULL(DegReason,'') NOT LIKE '%'+DegReason+'%') 
                                       --                  THEN CONCAT(DegReason,',','NPA DUE TO '+StatusType) 
                                       --			   ELSE DegReason END
                                       = pos_3,
                                      A.SysNPA_Dt = pos_4;-- added by mandeep on 06112023 (Percolate NPA accounts only when Balance>0)
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO ' || StatusType AS pos_3, 2, CASE 
         WHEN StatusDate IS NOT NULL THEN StatusDate
         ELSE v_ProcessingDate
            END AS pos_5
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType = 'Charge Off'
           AND SysAssetClassAlt_Key = 1
           AND acl.Balance > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason = pos_3,
                                      A.SysAssetClassAlt_Key = 2,
                                      A.SysNPA_Dt = pos_5;
         -------End of Charge off code ------------------------------------------------------------
         /* LITIGATION  - AMAR ADDED ON 04022022 */
         ------DROP TABLE IF EXISTS #ALWYS2
         ------SELECT DISTINCT A.UCIF_ID,C.StatusType,MIN(C.StatusDate)StatusDate INTO #ALWYS2
         ------FROM tt_CUSTOMERCAL_23 A
         ------INNER JOIN tt_ACCOUNTCAL_26 B
         ------ON A.RefCustomerID=B.RefCustomerID
         ------INNER JOIN  ExceptionFinalStatusType C  
         ------on B.CustomerAcID=C.ACID  
         ------AND C.EFFECTIVEFROMTIMEKEY<=@TIMEKEY and C.EffectiveToTimeKey>=@TIMEKEY  
         ------WHERE C.StatusType ='Litigation'
         ------GROUP BY A.UCIF_ID,C.StatusType
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', CONCAT(NPA_Reason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN C.StatusDate < FinalNpaDt THEN C.StatusDate
         ELSE FinalNpaDt
            END AS pos_4
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType = 'Litigation'
           AND FinalAssetClassAlt_Key > 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason
                                      --CASE WHEN (ISNULL(NPA_Reason,'')<>'' AND ISNULL(NPA_Reason,'') NOT LIKE '%'+NPA_reason+'%') 
                                       --                 THEN CONCAT(NPA_Reason,',','NPA DUE TO '+StatusType) 
                                       --		   ELSE NPA_Reason END
                                       = pos_3,
                                      ACL.FinalNpaDt = pos_4;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN StatusDate IS NOT NULL THEN StatusDate
         ELSE v_ProcessingDate
            END AS pos_4, 'NPA DUE TO ' || StatusType AS pos_5, 'NPA DUE TO ' || StatusType AS pos_6
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType = 'Litigation'
           AND FinalAssetClassAlt_Key = 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.FinalAssetClassAlt_Key = 2,
                                      ACL.FinalNpaDt = pos_4,
                                      ACL.NPA_Reason = pos_5,
                                      ACL.DegReason = pos_6;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', CONCAT(A.DegReason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN StatusDate < SysNPA_Dt THEN StatusDate
         ELSE SysNPA_Dt
            END AS pos_4
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType = 'Litigation'
           AND SysAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason
                                      --CASE WHEN (ISNULL(DegReason,'')<>'' AND ISNULL(DegReason,'') NOT LIKE '%'+DegReason+'%') 
                                       --                  THEN CONCAT(DegReason,',','NPA DUE TO '+StatusType) 
                                       --			   ELSE DegReason END
                                       = pos_3,
                                      A.SysNPA_Dt -- Changed by mandeep on 06102023 
                                       = pos_4;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO ' || StatusType AS pos_3, 2, CASE 
         WHEN C.StatusDate IS NOT NULL THEN C.StatusDate
         ELSE v_ProcessingDate
            END AS pos_5
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType = 'Litigation'
           AND SysAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason = pos_3,
                                      A.SysAssetClassAlt_Key = 2,
                                      A.SysNPA_Dt = pos_5;
         /*END OF  LITIGATION - AMAR ADDED ON 04022022 */
         /* SETTLEMENT  - AMAR ADDED ON 04022022 */
         ----------DROP TABLE IF EXISTS #ALWYS3
         ----------SELECT DISTINCT A.UCIF_ID,C.StatusType,MIN(C.StatusDate)StatusDate INTO #ALWYS3
         ----------FROM tt_CUSTOMERCAL_23 A
         ----------INNER JOIN tt_ACCOUNTCAL_26 B
         ----------ON A.RefCustomerID=B.RefCustomerID
         ----------INNER JOIN  ExceptionFinalStatusType C  
         ----------on B.CustomerAcID=C.ACID  
         ----------AND C.EFFECTIVEFROMTIMEKEY<=@TIMEKEY and C.EffectiveToTimeKey>=@TIMEKEY  
         ----------WHERE C.StatusType ='Settlement'
         ----------GROUP BY A.UCIF_ID,C.StatusType
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', CONCAT(NPA_Reason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN C.StatusDate < FinalNpaDt THEN C.StatusDate
         ELSE FinalNpaDt
            END AS pos_4
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType = 'Settlement'
           AND FinalAssetClassAlt_Key > 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason
                                      --CASE WHEN (ISNULL(NPA_Reason,'')<>'' AND ISNULL(NPA_Reason,'') NOT LIKE '%'+NPA_reason+'%') 
                                       --                 THEN CONCAT(NPA_Reason,',','NPA DUE TO '+StatusType) 
                                       --		   ELSE NPA_Reason END
                                       = pos_3,
                                      ACL.FinalNpaDt = pos_4;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN C.StatusDate IS NOT NULL THEN C.StatusDate
         ELSE v_ProcessingDate
            END AS pos_4, 'NPA DUE TO ' || StatusType AS pos_5, 'NPA DUE TO ' || StatusType AS pos_6
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE C.StatusType = 'Settlement'
           AND FinalAssetClassAlt_Key = 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.FinalAssetClassAlt_Key = 2,
                                      ACL.FinalNpaDt = pos_4,
                                      ACL.NPA_Reason = pos_5,
                                      ACL.DegReason = pos_6;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', CONCAT(A.DegReason, ',', 'NPA DUE TO ' || StatusType) AS pos_3, CASE 
         WHEN C.StatusDate < SysNPA_Dt THEN C.StatusDate
         ELSE SysNPA_Dt
            END AS pos_4
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType = 'Settlement'
           AND SysAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason
                                      --CASE WHEN (ISNULL(DegReason,'')<>'' AND ISNULL(DegReason,'') NOT LIKE '%'+DegReason+'%') 
                                       --                  THEN CONCAT(DegReason,',','NPA DUE TO '+StatusType) 
                                       --			   ELSE DegReason END
                                       = pos_3,
                                      A.SysNPA_Dt = pos_4;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO ' || StatusType AS pos_3, 2, CASE 
         WHEN C.StatusDate IS NOT NULL THEN C.StatusDate
         ELSE v_ProcessingDate
            END AS pos_5
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 ACL   ON A.CustomerEntityID = ACL.CustomerEntityID
                JOIN ExceptionFinalStatusType C   ON ACL.CustomerAcID = C.ACID
                AND NVL(c.SourceAlt_Key, 0) <> 7
                AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND C.EffectiveToTimeKey >= v_TIMEKEY 
          WHERE c.StatusType = 'Settlement'
           AND SysAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.DegReason = pos_3,
                                      A.SysAssetClassAlt_Key = 2,
                                      A.SysNPA_Dt = pos_5;
         /*END OF -- SETTLEMENT - AMAR ADDED ON 04022022 */
         /* MARKING CHARGE OFF,WRITE OFF,SETTLEMENT ,LITIGATION ON THE BASIS OF YESTERDAY DATA */
         --SELECT A.UcifEntityID INTO #ExceptionData 
         --FROM 
         --PRO.ACCOUNTCAL_hist A
         --LEFT JOIN 
         --tt_ACCOUNTCAL_26 B
         --ON A.AccountEntityID=B.AccountEntityID
         --WHERE 
         --A.EffectiveFromTimeKey<=@TIMEKEY-1 AND A.EffectiveToTimeKey>=@TIMEKEY-1
         ----AND A.SourceAlt_Key  IN (1,3,2,6)
         --AND B.AccountEntityID IS NULL
         --AND (A.NPA_Reason LIKE '%Charge Off%' or
         --    A.NPA_Reason LIKE '%Settlement%' or 
         --    A.NPA_Reason LIKE '%Litigation%' or
         --    A.NPA_Reason LIKE '%WO%'         or
         --    A.NPA_Reason Like '%TWO%'        or
         --	A.NPA_Reason Like '%Write%'  
         --	)
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_excepdata_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_excepdata_2;
         UTILS.IDENTITY_RESET('tt_excepdata_2');

         INSERT INTO tt_excepdata_2 ( 
         	SELECT acid ,
                 MAX(Entity_Key)  entitykey  
         	  FROM ExceptionFinalStatusType 
         	 WHERE  StatusType IN ( 'TWO','WO','Charge Off','Settlement' )

                    AND NVL(SourceAlt_Key, 0) <> 7
         	  GROUP BY ACID );
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_EXPACID_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_EXPACID_2;
         UTILS.IDENTITY_RESET('tt_EXPACID_2');

         INSERT INTO tt_EXPACID_2 ( 
         	SELECT a.acid ,
                 StatusType ,
                 UTILS.CONVERT_TO_NUMBER(0,19,0) CUSTOMERENTITYID  ,
                 UTILS.CONVERT_TO_NUMBER(0,19,0) UCIFENTITYID  
         	  FROM ExceptionFinalStatusType a
                   JOIN tt_excepdata_2 b   ON a.acid = b.acid
                   AND a.Entity_Key = b.entitykey
                   AND A.EffectiveFromTimeKey <= v_TIMEKEY
                   AND A.EffectiveToTimeKey >= v_TIMEKEY
         	 WHERE  StatusType IN ( 'TWO','WO','Charge Off','Settlement' )
          );
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_ADVACID_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_ADVACID_2;
         UTILS.IDENTITY_RESET('tt_ADVACID_2');

         INSERT INTO tt_ADVACID_2 ( 
         	SELECT AccountEntityId ,
                 MAX(EffectiveFromTimeKey)  EffectiveFromTimeKey  
         	  FROM AdvAcBasicDetail A
                   JOIN tt_EXPACID_2 B   ON A.CustomerACID = B.ACID
         	  GROUP BY AccountEntityId );
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_EXPCUST_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_EXPCUST_2;
         UTILS.IDENTITY_RESET('tt_EXPCUST_2');

         INSERT INTO tt_EXPCUST_2 ( 
         	SELECT CustomerEntityId ,
                 CustomerACID 
         	  FROM AdvAcBasicDetail A
                   JOIN tt_ADVACID_2 B   ON A.AccountEntityId = B.AccountEntityId
                   AND a.EffectiveFromTimeKey = B.EffectiveFromTimeKey );
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_EXPCUST_2ID  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_EXPCUSTID_2;
         UTILS.IDENTITY_RESET('tt_EXPCUSTID_2');

         INSERT INTO tt_EXPCUSTID_2 ( 
         	SELECT A.CustomerEntityId ,
                 MAX(EffectiveFromTimeKey)  EffectiveFromTimeKey  
         	  FROM CustomerBasicDetail A
                   JOIN tt_EXPCUST_2 B   ON A.CustomerEntityId = B.CustomerEntityId
         	  GROUP BY A.CustomerEntityId );
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_EXPUCIC_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_EXPUCIC_2;
         UTILS.IDENTITY_RESET('tt_EXPUCIC_2');

         INSERT INTO tt_EXPUCIC_2 ( 
         	SELECT A.CustomerEntityId ,
                 UcifEntityID 
         	  FROM CustomerBasicDetail A
                   JOIN tt_EXPCUSTID_2 B   ON A.CustomerEntityId = B.CustomerEntityId
                   AND a.EffectiveFromTimeKey = B.EffectiveFromTimeKey );
         ---------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.CustomerEntityId
         FROM A ,tt_EXPACID_2 A
                JOIN tt_EXPCUST_2 B   ON A.ACID = B.CustomerACID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CUSTOMERENTITYID = src.CustomerEntityId;
         ---------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.UCIFENTITYID
         FROM A ,tt_EXPACID_2 A
                JOIN tt_EXPUCIC_2 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.UCIFENTITYID = src.UCIFENTITYID;
         DELETE tt_EXPACID_2

          WHERE  UCIFENTITYID = 0;
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_LINKACEXP_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_LINKACEXP_2;
         UTILS.IDENTITY_RESET('tt_LINKACEXP_2');

         INSERT INTO tt_LINKACEXP_2 ( 
         	SELECT a.UCIFENTITYID ,
                 STRING_AGG(ACID, '|') ACID  
         	  FROM tt_EXPACID_2 a
                   LEFT JOIN tt_ACCOUNTCAL_26 b   ON a.acid = b.CustomerAcID
         	 WHERE  b.CustomerAcID IS NULL
         	  GROUP BY a.UCIFENTITYID );
         --------------
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', NVL(NPA_Reason, ' ') || 'NPA DUE TO LINKED ' || StatusType || ' AC NO-' || B.ACID AS pos_3
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN tt_EXPACID_2 A   ON ACL.UcifEntityID = A.UcifEntityID
                JOIN tt_LINKACEXP_2 b   ON a.UCIFENTITYID = acl.UcifEntityID 
          WHERE A.StatusType = 'Settlement'
           AND FinalAssetClassAlt_Key > 1
           AND NPA_Reason IS NULL) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason = pos_3;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA'
         --,NPA_Reason=NPA_Reason+',NPA DUE TO LINKED '+StatusType   +' AC NO-'+B.ACID
         , NVL(NPA_Reason, ' ') || ',NPA DUE TO LINKED TWO AC NO-' || B.ACID AS pos_3
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN tt_EXPACID_2 A   ON ACL.UcifEntityID = A.UcifEntityID
                JOIN tt_LINKACEXP_2 b   ON a.UCIFENTITYID = B.UcifEntityID 
          WHERE A.StatusType IN ( 'WO','tWo' )

           AND FinalAssetClassAlt_Key > 1
           AND NPA_Reason IS NULL) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason = pos_3;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA', NVL(NPA_Reason, ' ') || ',NPA DUE TO LINKED ' || StatusType || ' AC NO' || B.ACID AS pos_3
         FROM ACL ,tt_ACCOUNTCAL_26 ACL
                JOIN tt_EXPACID_2 A   ON ACL.UcifEntityID = A.UcifEntityID
                JOIN tt_LINKACEXP_2 b   ON a.UCIFENTITYID = b.UcifEntityID 
          WHERE A.StatusType IN ( 'CHARGE OFF' )

           AND FinalAssetClassAlt_Key > 1
           AND NPA_Reason IS NULL) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA',
                                      ACL.NPA_Reason = pos_3;
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA'
         FROM ACL ,tt_CUSTOMERCAL_23 ACL
                JOIN tt_EXPACID_2 A   ON ACL.UcifEntityID = A.UcifEntityID 
          WHERE A.StatusType = 'Settlement'
           AND SysAssetClassAlt_Key > 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA';
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA'
         FROM ACL ,tt_CUSTOMERCAL_23 ACL
                JOIN tt_EXPACID_2 A   ON ACL.UcifEntityID = A.UcifEntityID 
          WHERE A.StatusType IN ( 'WO','tWo' )

           AND SysAssetClassAlt_Key > 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA';
         MERGE INTO ACL 
         USING (SELECT ACL.ROWID row_id, 'ALWYS_NPA'
         FROM ACL ,tt_CUSTOMERCAL_23 ACL
                JOIN tt_EXPACID_2 A   ON ACL.UcifEntityID = A.UcifEntityID 
          WHERE A.StatusType IN ( 'CHARGE OFF' )

           AND SysAssetClassAlt_Key > 1) src
         ON ( ACL.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ACL.Asset_Norm = 'ALWYS_NPA';
         --------------------
         /*END OF -- writeoff,chargeoff,settlement,litigation - Mandeep on 07092023 */
         /* AMAR - 06042022 0  SHIFTED THIS CODE FROM ABOVE (BEFORE TWO WORK) - FOR MARKING THE 1ST PRIORITY OF TWO (ALWAYS NPA) */
         UPDATE tt_ACCOUNTCAL_26
            SET FINALNPADT = NULL,
                FINALASSETCLASSALT_KEY = 1
          WHERE  ASSET_NORM = 'ALWYS_STD'
           AND INITIALASSETCLASSALT_KEY <> 1;
         --Update ACL   
         --set Asset_Norm='ALWYS_NPA'  
         --from tt_ACCOUNTCAL_26 ACL  
         --inner join curdat.AdvAcWODetail b  
         --on ACL.CustomerAcID=b.CustomerAcID  
         --where b.EFFECTIVEFROMTIMEKEY<=@TIMEKEY and b.EffectiveToTimeKey>=@TIMEKEY  
         --and  ACL.FinalAssetClassAlt_Key>1  
         --and b.WriteOffDt is not null  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'marking always NPA account table level where WriteOffAmount>0';
         /*--------marking always NPA account table level where WriteOffAmount>0----------------*/
         /*---------UPDATE PrvQtrRV  AT Customer level--------------------- */
         /*---TO BE REMOVE GET VALUE FROM FUNCTION*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE PrvQtrRV  AT Customer level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required  Modification Done---   
         /*  added below code - as discused with Ashish Sir on 29th MAr'2022 - added new column SecurityValueMain in security value detail table and will be used for Prev QTR RV  */
         --IF OBJECT_ID('TEMPDB..tt_PRVQTRRV_3') IS NOT NULL  
         --DROP TABLE tt_PRVQTRRV_3  
         -- SELECT CustomerEntityId,SUM(b.SecurityValueMain)  SecurityValueMain   
         --  into tt_PRVQTRRV_3  
         -- FROM AdvSecurityDetail A  
         -- INNER JOIN AdvSecurityValueDetail B  
         --  ON A.SecurityEntityID =B.SecurityEntityID  
         --  AND A.EffectiveFromTimeKey<=@TIMEKEY AND A.EffectiveToTimeKey>=@TIMEKEY  
         --  AND B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY  
         -- group by CustomerEntityId  
         --UPDATE A SET A.PRVQTRRV= SecurityValueMain  
         --FROM tt_CUSTOMERCAL_23 A INNER  JOIN tt_PRVQTRRV_3 B  
         --ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID   
         --    IF OBJECT_ID('TEMPDB..#CustPrevAtrAcl') IS NOT NULL  
         --DROP TABLE #CustPrevAtrAcl
         --SELECT CustomerEntityID,SysAssetClassAlt_Key
         --    INTO #CustPrevAtrAcl
         --FROM PRO.CUSTOMERCAL_Hist
         --WHERE EffectiveFromTimeKey<=@TIMEKEY-1 AND EffectiveToTimeKey>=@TIMEKEY-1                
         IF utils.object_id('TEMPDB..tt_PRVQTRRV_3') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_PRVQTRRV_3 ';
         END IF;
         DELETE FROM tt_PRVQTRRV_3;
         UTILS.IDENTITY_RESET('tt_PRVQTRRV_3');

         INSERT INTO tt_PRVQTRRV_3 ( 
         	SELECT A.CustomerEntityId ,
                 --SUM(CASE when c.SysAssetClassAlt_Key>1 THEN b.CurrentValue ELSE SecurityValueMain END) 
                 SUM(SecurityValueMain)  SecurityValueMain --  CHANGED BY MANDEEP (13-07-2023 MAIL DATE sudarshan) SUB Change Request #BRD Daily Security Erosion

         	  FROM AdvSecurityDetail A
                   JOIN AdvSecurityValueDetail B   ON A.SecurityEntityID = B.SecurityEntityID
                   AND A.EffectiveFromTimeKey <= (v_TIMEKEY - 1)
                   AND A.EffectiveToTimeKey >= (v_TIMEKEY - 1)
                   AND B.EffectiveFromTimeKey <= (v_TIMEKEY - 1)
                   AND B.EffectiveToTimeKey >= (v_TIMEKEY - 1)

         	--INNER JOIN #CustPrevAtrAcl C                

         	--    ON C.CustomerEntityID=A.CustomerEntityId                
         	GROUP BY A.CustomerEntityId );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, SecurityValueMain
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_PRVQTRRV_3 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PRVQTRRV = SecurityValueMain;
         /*  commented below code - as discused with Ashish Sir on 29th MAr'2022 - added new column SecurityValueMain in security value detail table and will be used for Prev QTR RV  */
         /*--DROP TABLE tt_PRVQTRRV_3                  

         --DECLARE @PRVQTRRV INT =(SELECT LastQtrDateKey FROM SYSDAYMATRIX WHERE TimeKey=@TIMEKEY)                  

         --SELECT *                    
         --INTO tt_PRVQTRRV_3                   
         --FROM dbo.AdvCustSecurityFunpre(@PRVQTRRV)                  

         --UPDATE A SET A.PRVQTRRV= ISNULL(B.Total_PriSec,0)+ISNULL(B.Total_CollSec,0)  FROM tt_CUSTOMERCAL_23 A INNER  JOIN tt_PRVQTRRV_3 B                  
         --ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID                  
         */
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE PrvQtrRV  AT Customer level';
         --/*---------UPDATE CurntQtrRv  AT Customer level--------------------- */                   
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE CurntQtrRv  AT Customer level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ----Condition Change Required -----                   
         IF utils.object_id('TEMPDB..tt_CurntQtrRv_3') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_CurntQtrRv_3 ';
         END IF;
         DELETE FROM tt_CurntQtrRv_3;
         UTILS.IDENTITY_RESET('tt_CurntQtrRv_3');

         INSERT INTO tt_CurntQtrRv_3 ( 
         	SELECT CustomerEntityId ,
                 SUM(b.CurrentValue)  CurrentValue  
         	  FROM AdvSecurityDetail A
                   JOIN AdvSecurityValueDetail B   ON A.SecurityEntityID = B.SecurityEntityID
                   AND A.EffectiveFromTimeKey <= v_TIMEKEY
                   AND A.EffectiveToTimeKey >= v_TIMEKEY
                   AND B.EffectiveFromTimeKey <= v_TIMEKEY
                   AND B.EffectiveToTimeKey >= v_TIMEKEY
         	  GROUP BY CustomerEntityId );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CurrentValue
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_CurntQtrRv_3 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID 
          WHERE A.SourceAlt_Key <> 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CurntQtrRv = CurrentValue;
         ------- ----Added By Mandeep (Security Perfection)
         DELETE FROM tt_CurntQtrRv_Finacle_2;
         UTILS.IDENTITY_RESET('tt_CurntQtrRv_Finacle_2');

         INSERT INTO tt_CurntQtrRv_Finacle_2 ( 
         	SELECT CustomerEntityId ,
                 SUM(b.CurrentValue)  CurrentValue  
         	  FROM AdvSecurityDetail A
                   JOIN AdvSecurityValueDetail B   ON A.SecurityEntityID = B.SecurityEntityID
                   AND A.EffectiveFromTimeKey <= v_TIMEKEY
                   AND A.EffectiveToTimeKey >= v_TIMEKEY
                   AND B.EffectiveFromTimeKey <= v_TIMEKEY
                   AND B.EffectiveToTimeKey >= v_TIMEKEY
         	 WHERE  A.Sec_Perf_Flg = 'P'
         	  GROUP BY CustomerEntityId );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.CurrentValue
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_CurntQtrRv_Finacle_2 B   ON A.CUSTOMERENTITYID = B.CUSTOMERENTITYID 
          WHERE A.SourceAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CurntQtrRv = src.CurrentValue;
         /*                  
         --IF OBJECT_ID('TEMPDB..tt_CurntQtrRv_3') IS NOT NULL                  
         --DROP TABLE tt_CurntQtrRv_3                  

         --SELECT *                    
         --INTO tt_CurntQtrRv_3                   
         --FROM dbo.AdvCustSecurityFun(@TIMEKEY)                  

         ------UPDATE A SET A.CurntQtrRv= ISNULL(B.Total_PriSec,0)+ISNULL(B.Total_CollSec,0)                   
         ------FROM tt_CUSTOMERCAL_23 A INNER  JOIN tt_CurntQtrRv_3 B                  
         ------ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID                  
         */
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE CurntQtrRv  AT Customer level';
         --/*----UPDATE SECURITY VALUE AT ACCOUNT LEVEL------------*/                  
         --INSERT INTO PRO.ProcessMonitor(UserID,Description,MODE,StartTime,EndTime,TimeKey,SetID)                  
         --SELECT ORIGINAL_LOGIN(),'UPDATE SECURITY VALUE AT ACCOUNT LEVEL','RUNNING',GETDATE(),NULL,@TIMEKEY,@SetID                  
         ---Condition Change Required  Modification Done---                   
         /*  commented below code - security will be sum at customer level and appropriate at account                  
         IF OBJECT_ID('TEMPDB..#TEMPSECURITY') IS NOT NULL                  
         DROP TABLE #TEMPSECURITY                  


         ----SELECT *                    
         ----INTO #TEMPSECURITY                  
         ----FROM dbo.AdvAcSecurityFun(@TIMEKEY,'0')                  

         ----UPDATE A SET A.SecurityValue= ISNULL(B.Total_PriSec,0)+ISNULL(B.Total_CollSec,0)  FROM tt_ACCOUNTCAL_26 A INNER  JOIN #TEMPSECURITY B                  
         ----ON A.AccountEntityID=B.AccountEntityID                  




         UPDATE PRO.PROCESSMONITOR SET ENDTIME=GETDATE() ,MODE='COMPLETE' WHERE IdentityKey = (SELECT IDENT_CURRENT('PRO.PROCESSMONITOR')) AND TIMEKEY=@TIMEKEY AND DESCRIPTION='update security value at account level'                  

            --------------------UPDATE FINAL CURNTQTRRV AT  CUSTOMER LEVEL--------------------                   

          INSERT INTO PRO.PROCESSMONITOR(USERID,DESCRIPTION,MODE,STARTTIME,ENDTIME,TIMEKEY,SETID)                   
         SELECT ORIGINAL_LOGIN(),'UPDATE FINAL CURNTQTRRV AT  CUSTOMER LEVEL','RUNNING',GETDATE(),NULL,@TIMEKEY,@SETID                  

         ----UPDATE A SET A.CURNTQTRRV=ISNULL(A.CURNTQTRRV,0) FROM tt_CUSTOMERCAL_23 A  INNER JOIN                   
         ----(                  
         ----SELECT A.CUSTOMERENTITYID,SUM(ISNULL(A.SecurityValue,0)) as CURNTQTRRV FROM tt_ACCOUNTCAL_26 A                   
         ----INNER JOIN tt_CUSTOMERCAL_23 B ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID                  
         ----WHERE  ISNULL(A.FLGABINITIO,'N')<>'Y'  AND A.FINALASSETCLASSALT_KEY NOT IN (6)                  
         ----and isnull(A.SecurityValue,0)>0                  
         ----GROUP BY A.CUSTOMERENTITYID                  
         ----) B ON A.CUSTOMERENTITYID=B.CUSTOMERENTITYID                  

         ----UPDATE PRO.PROCESSMONITOR SET ENDTIME=GETDATE() ,MODE='COMPLETE' WHERE IdentityKey = (SELECT IDENT_CURRENT('PRO.PROCESSMONITOR')) AND TIMEKEY=@TIMEKEY AND DESCRIPTION='UPDATE FINAL CURNTQTRRV AT  CUSTOMER LEVEL'                  


         ----   --------UPDATE SECURITY FLAG WHERE SECURITY AT CUSTOMER LEVEL BUT  SecApp UNSECURED AT ACCOUNT LEVEL--------------                  
             INSERT INTO PRO.ProcessMonitor(UserID,Description,MODE,StartTime,EndTime,TimeKey,SetID)                  
          SELECT ORIGINAL_LOGIN(),'UPDATE SECURITY FLAG WHERE SECURITY AT CUSTOMER LEVEL BUT  SecApp UNSECURED AT ACCOUNT LEVEL','RUNNING',GETDATE(),NULL,@TIMEKEY,@SetID                  

          ---Condition Change Required ---                   

         ------ UPDATE A SET FlgSecured='S'                  
         ------FROM tt_ACCOUNTCAL_26 A INNER  JOIN dbo.AdvAcBasicDetail B ON A.AccountEntityID=B.AccountEntityID                  
         ------WHERE  (B.EffectiveFromTimeKey<=@TIMEKEY and B.EffectiveToTimeKey>=@TIMEKEY)               
         ------AND B.FlgSecured='S'                  
         ------AND A.FlgSecured='U'                  

         --UPDATE B SET SecApp='S'                  
         --FROM  tt_ACCOUNTCAL_26 B                  
         --WHERE ISNULL(SecurityValue,0)>0                  
         --AND B.SecApp='U'                  
         --AND ISNULL(B.BALANCE,0)>0                   
         --AND (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY)                  

         --UPDATE B SET FlgSecured='D'                  
         --FROM  tt_ACCOUNTCAL_26 B                  
         --WHERE ISNULL(SecurityValue,0)>0                  
         --AND B.FlgSecured='U'                  
         --AND ISNULL(B.BALANCE,0)>0                   
         --AND (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY)                  
         */
         ---   --/*----UPDATE SECURITY FLAG WHERE SECURITY AT CUSTOMER LEVEL BUT  SecApp UNSECURED AT ACCOUNT LEVEL------------*/                  
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE SECURITY FLAG WHERE SECURITY AT CUSTOMER LEVEL BUT  SecApp UNSECURED AT ACCOUNT LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'D'
         FROM B ,tt_ACCOUNTCAL_26 B
                JOIN tt_CUSTOMERCAL_23 a   ON A.CustomerEntityID = B.CustomerEntityID 
          WHERE NVL(CurntQtrRv, 0) > 0
           AND B.SecApp = 'S'
           AND NVL(B.BALANCE, 0) > 0) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.FlgSecured = 'D';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE SECURITY FLAG WHERE SECURITY AT CUSTOMER LEVEL BUT  SecApp UNSECURED AT ACCOUNT
          LEVEL';
         /*----UPDATE FLGABINITIO MARK AT ACCOUNT LEVEL---------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'update FlgAbinitio MARK at account level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required ---   
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Ab-Initio'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FlgAbinitio = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'update FlgAbinitio MARK at account level';
         /*----UPDATE FLGFITL MARK AT ACCOUNT LEVEL------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'update FlgFITL MARK at account level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A 
          WHERE ( NVL(A.SplCatg1Alt_Key, 0) = 755
           OR NVL(A.SplCatg2Alt_Key, 0) = 755
           OR NVL(A.SplCatg3Alt_Key, 0) = 755
           OR NVL(A.SplCatg4Alt_Key, 0) = 755 )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FLGFITL = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'update FlgFITL MARK at account level';
         /*------------------UPDATE OVERDUESINCEDT FROM BILL DETAIL TABLE------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE OVERDUESINCEDT FROM BILL DETAIL TABLE ' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         ------------------/*------------------CALCULATE MINIMUMN BILL DUE DATE AND BillExtendedDueDt  DATE------------------*/  
         --IF OBJECT_ID('TEMPDB..#TEMPTABLEMINDATEEBill') IS NOT NULL  
         --    DROP TABLE #TEMPTABLEMINDATEEBill  
         --SELECT AccountEntityID,MIN(BILLDUEDT) BILLDUEDT,MIN(BillExtendedDueDt) BillExtendedDueDt   
         --INTO #TEMPTABLEMINDATEEBill  
         --FROM DBO.ADVFACBILLDETAIL   
         --WHERE EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND EFFECTIVETOTIMEKEY>=@TIMEKEY   
         --AND ISNULL(BALANCE,0)>0  
         --GROUP BY AccountEntityID  
         --/*------------------UPDATE MINIMUMN DATE IN ACCOUNT CAL TABLE------------------*/  
         --IF OBJECT_ID('TEMPDB..#TEMPTABLEMINOVERDUEDT') IS NOT NULL  
         --    DROP TABLE #TEMPTABLEMINOVERDUEDT  
         --SELECT AccountEntityID,PRO.GETMINIMUMDATE(BILLDUEDT,BillExtendedDueDt,NULL) AS MINOVERDUE   
         --INTO #TEMPTABLEMINOVERDUEDT  
         --FROM #TEMPTABLEMINDATEEBill   
         UPDATE tt_ACCOUNTCAL_26 A
            SET PrincOverdueSinceDt = NULL,
                IntOverdueSinceDt = NULL,
                ReviewDueDt = NULL,
                OverDueSinceDt = NULL,
                LastCrDate = NULL,
                OtherOverdueSinceDt = NULL,
                ContiExcessDt = NULL,
                StockStDt = NULL,
                DebitSinceDt = NULL,
                PrincOverdue = 0,
                IntOverdue = 0,
                OverdueAmt = 0,
                OtherOverdue = 0
          WHERE  FacilityType IN ( 'BILL','BP','BD' )
         ;
         IF utils.object_id('TEMPDB..tt_BILL_OVERDUE_3') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BILL_OVERDUE_3 ';
         END IF;
         DELETE FROM tt_BILL_OVERDUE_3;
         UTILS.IDENTITY_RESET('tt_BILL_OVERDUE_3');

         INSERT INTO tt_BILL_OVERDUE_3 ( 
         	SELECT AccountEntityID ,
                 BILLENTITYID ,
                 BALANCE ,
                 CASE 
                      WHEN NVL(BILLDUEDT, '1900-01-01') > NVL(BillExtendedDueDt, '1900-01-01') THEN BillDueDt
                 ELSE BillExtendedDueDt
                    END BILLDUEDT  

         	  ---MIN(BILLDUEDT) BILLDUEDT,MIN(BillExtendedDueDt) BillExtendedDueDt     
         	  FROM RBL_MISDB_PROD.AdvFacBillDetail 
         	 WHERE  EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                    AND EFFECTIVETOTIMEKEY >= v_TIMEKEY
                    AND BillNatureAlt_Key <> 9
                    AND NVL(BALANCE, 0) > 0
                    AND (CASE 
                              WHEN NVL(BILLDUEDT, '1900-01-01') > NVL(BillExtendedDueDt, '1900-01-01') THEN BillDueDt
                  ELSE BillExtendedDueDt
                     END) <= 
                  ----)<@PROCESSINGDATE  --  as discussed with Triloki Sir for SMA KIssue - Consider 1 dpd on due date    
                  v_PROCESSINGDATE );
         IF utils.object_id('TEMPDB..tt_BILL_OVERDUE_3_FINAL') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BILL_OVERDUE_FINAL_3 ';
         END IF;
         DELETE FROM tt_BILL_OVERDUE_FINAL_3;
         UTILS.IDENTITY_RESET('tt_BILL_OVERDUE_FINAL_3');

         INSERT INTO tt_BILL_OVERDUE_FINAL_3 ( 
         	SELECT AccountEntityId ,
                 SUM(BALANCE)  BILOVERDUE  ,
                 MIN(BILLDUEDT)  BILLOVERDUEDT  
         	  FROM tt_BILL_OVERDUE_3 
         	  GROUP BY AccountEntityId );
         MERGE INTO tt_ACCOUNTCAL_26 A
         USING (SELECT A.ROWID row_id, B.BILLOVERDUEDT, B.BILOVERDUE
         FROM tt_ACCOUNTCAL_26 A
                JOIN tt_BILL_OVERDUE_FINAL_3 B   ON A.AccountEntityID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET OVERDUESINCEDT = src.BILLOVERDUEDT,
                                      OverdueAmt = src.BILOVERDUE;
         --=====SCF SOURCE SYSTEM CHANGES==================================================================================================
         IF utils.object_id('TEMPDB..tt_BILL_OVERDUE_3_SCF') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BILL_OVERDUE_SCF_2 ';
         END IF;
         DELETE FROM tt_BILL_OVERDUE_SCF_2;
         UTILS.IDENTITY_RESET('tt_BILL_OVERDUE_SCF_2');

         INSERT INTO tt_BILL_OVERDUE_SCF_2 ( 
         	SELECT AccountEntityID ,
                 MIN(BillDueDt)  BillDueDt  ,
                 MIN(InterestOverdueDate)  InterestOverdueDate  ,
                 SUM(Balance)  Balance  ,
                 SUM(OverdueInterest)  OverdueInterest  
         	  FROM RBL_MISDB_PROD.AdvFacBillDetail 
         	 WHERE  EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                    AND EFFECTIVETOTIMEKEY >= v_TIMEKEY
                    AND BillNatureAlt_Key = 9
                    AND NVL(Balance, 0) > 0
                    AND ( BillDueDt <= v_ProcessingDate
                    OR InterestOverdueDate <= v_ProcessingDate )
         	  GROUP BY AccountEntityId );
         IF utils.object_id('TEMPDB..tt_BILL_OVERDUE_3_SCF_FINAL') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BILL_OVERDUE_SCF_FINAL_2 ';
         END IF;
         DELETE FROM tt_BILL_OVERDUE_SCF_FINAL_2;
         UTILS.IDENTITY_RESET('tt_BILL_OVERDUE_SCF_FINAL_2');

         INSERT INTO tt_BILL_OVERDUE_SCF_FINAL_2 ( 
         	SELECT AccountEntityId ,
                 Balance ,
                 overdueinterest ,
                 GETMINIMUMDATE(BillDueDt, InterestOverdueDate, NULL) OverDueSinceDt  ,
                 InterestOverdueDate ,
                 BillDueDt 
         	  FROM tt_BILL_OVERDUE_SCF_2  );
         MERGE INTO tt_ACCOUNTCAL_26 A
         USING (SELECT A.ROWID row_id, B.BillDueDt, B.InterestOverdueDate, B.OverDueSinceDt, NVL(B.Balance, 0) AS pos_5, NVL(B.Balance, 0) - NVL(B.OverdueInterest, 0) AS pos_6, NVL(B.OverdueInterest, 0) AS pos_7
         FROM tt_ACCOUNTCAL_26 A
                JOIN tt_BILL_OVERDUE_SCF_FINAL_2 B   ON A.AccountEntityID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET PrincOverdueSinceDt = src.BillDueDt,
                                      IntOverdueSinceDt = src.InterestOverdueDate,
                                      OverDueSinceDt = src.OverDueSinceDt,
                                      OverdueAmt --OverdueInterest may be add as per comfirmation by sitaram sir
                                       = pos_5,
                                      PrincOverdue = pos_6,
                                      IntOverdue = pos_7;
         IF utils.object_id('TEMPDB..tt_BILL_Min_ReviewDt_2') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_BILL_Min_ReviewDt_2 ';
         END IF;
         DELETE FROM tt_BILL_Min_ReviewDt_2;
         UTILS.IDENTITY_RESET('tt_BILL_Min_ReviewDt_2');

         INSERT INTO tt_BILL_Min_ReviewDt_2 ( 
         	SELECT AccountEntityId ,
                 MIN(ReviewDuedate)  ReviewDuedate  
         	  FROM RBL_MISDB_PROD.AdvFacBillDetail 
         	 WHERE  EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                    AND EFFECTIVETOTIMEKEY >= v_TIMEKEY
                    AND BillNatureAlt_Key = 9
         	  GROUP BY AccountEntityId );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, ReviewDuedate
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_BILL_Min_ReviewDt_2 B   ON A.AccountEntityID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.ReviewDueDt = ReviewDuedate;
         --=====================================================SCF BILL END===========================================================================
         --IF OBJECT_ID('TEMPDB..tt_BILL_OVERDUE_3_FINAL') IS NOT NULL  
         --    DROP TABLE tt_BILL_OVERDUE_3_FINAL  
         --SELECT AccountEntityId,SUM(BALANCE) BILOVERDUE,MIN(BILLDUEDT) BILLOVERDUEDT  
         -- INTO tt_BILL_OVERDUE_3_FINAL  
         --FROM tt_BILL_OVERDUE_3 GROUP BY AccountEntityId  
         --UPDATE tt_ACCOUNTCAL_26 SET OVERDUESINCEDT=B.BILLOVERDUEDT ,OverdueAmt  =B.BILOVERDUE  
         --FROM  tt_ACCOUNTCAL_26 A   
         --INNER JOIN tt_BILL_OVERDUE_3_FINAL B  
         -- ON A.AccountEntityID =B.AccountEntityId  
         --INNER JOIN #TEMPTABLEMINOVERDUEDT B ON A.AccountEntityID=B.AccountEntityID AND B.MINOVERDUE < = @PROCESSINGDATE  
         --IF OBJECT_ID('TEMPDB..#TEMPTABLEMINDATEPC') IS NOT NULL  
         --    DROP TABLE #TEMPTABLEMINDATEPC  
         --SELECT AccountEntityID,MIN(PCDueDt) PCDueDt,MIN(PCExtendedDueDt) PCExtendedDueDt   
         --INTO #TEMPTABLEMINDATEPC  
         --FROM DBO.ADVFACPCDETAIL   
         --WHERE EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND EFFECTIVETOTIMEKEY>=@TIMEKEY   
         --AND ISNULL(BALANCE,0)>0  
         --GROUP BY AccountEntityID  
         --/*------------------UPDATE MINIMUMN DATE IN ACCOUNT CAL TABLE------------------*/  
         --IF OBJECT_ID('TEMPDB..#TEMPTABLEMINOVERDUEDTPC') IS NOT NULL  
         --    DROP TABLE #TEMPTABLEMINOVERDUEDTPC  
         --SELECT AccountEntityID,PRO.GETMINIMUMDATE(PCDueDt,PCExtendedDueDt,NULL) AS MINOVERDUE   
         --INTO #TEMPTABLEMINOVERDUEDTPC  
         --FROM #TEMPTABLEMINDATEPC   
         IF utils.object_id('TEMPDB..tt_PC_OVERDUE_3') IS NOT NULL THEN
          --update a  
         --set a.InitialNpaDt =b.FinalNpaDt  
         --from tt_ACCOUNTCAL_26 A   
         --INNER JOIN PRO.ACCOUNTCAL_Hist B  
         -- ON A.AccountEntityID =B.AccountEntityID  
         --WHERE A.INITIALASSETCLASSALT_KEY>1  
         --AND A.InitialNpaDt  is NULL   
         --AND B.EffectiveFromTimeKey<=@HistTimeKey AND B.EffectiveToTimeKey>=@HistTimeKey  
         ----/*  UPDATE MOC STATUS  */  
         ---- DECLARE @PrevMonthTimeKey INT=(SELECT LastMonthDateKey FROM SysDayMatrix WHERE TimeKey =@TIMEKEY)  
         /* LOAN BUYOUT WORK */
         /* RESET BELOW FIELDS FOR LOANBUYOUT ACCOUNTS */
         /* END OF BUYOUT WORK */
         /*RESTRUCTURE UPDATES */
         --AND B.DPD_Breach_Date IS NOT NULL  
         /* END OF RESTRUCTURE WORK*/
         /* START OF PUI WORK*/
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_PC_OVERDUE_3 ';
         END IF;
         DELETE FROM tt_PC_OVERDUE_3;
         UTILS.IDENTITY_RESET('tt_PC_OVERDUE_3');

         INSERT INTO tt_PC_OVERDUE_3 ( 
         	SELECT AccountEntityID ,
                 PCRefNo ,
                 BALANCE ,
                 CASE 
                      WHEN NVL(PCDueDt, '1900-01-01') > NVL(PCExtendedDueDt, '1900-01-01') THEN PCDueDt
                 ELSE PCExtendedDueDt
                    END PCOVERDUEDUEDT  

         	  ---MIN(BILLDUEDT) BILLDUEDT,MIN(BillExtendedDueDt) BillExtendedDueDt   
         	  FROM RBL_MISDB_PROD.AdvFacPCDetail 
         	 WHERE  EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                    AND EFFECTIVETOTIMEKEY >= v_TIMEKEY
                    AND NVL(BALANCE, 0) > 0
                    AND (CASE 
                              WHEN NVL(PCDueDt, '1900-01-01') > NVL(PCExtendedDueDt, '1900-01-01') THEN PCDueDt
                  ELSE PCExtendedDueDt
                     END) <= 
                  ----- )<=@PROCESSINGDATE  --  as discussed with Triloki Sir for SMA KIssue - Consider 1 dpd on due date  
                  v_PROCESSINGDATE );
         IF utils.object_id('TEMPDB..tt_PC_OVERDUE_3_FINAL') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_PC_OVERDUE_FINAL_3 ';
         END IF;
         DELETE FROM tt_PC_OVERDUE_FINAL_3;
         UTILS.IDENTITY_RESET('tt_PC_OVERDUE_FINAL_3');

         INSERT INTO tt_PC_OVERDUE_FINAL_3 ( 
         	SELECT AccountEntityId ,
                 SUM(BALANCE)  PCOVERDUE  ,
                 MIN(PCOVERDUEDUEDT)  PCOVERDUEDUEDT  
         	  FROM tt_PC_OVERDUE_3 
         	  GROUP BY AccountEntityId );
         MERGE INTO tt_ACCOUNTCAL_26 A
         USING (SELECT A.ROWID row_id, B.PCOVERDUEDUEDT, B.PCOVERDUE
         FROM tt_ACCOUNTCAL_26 A
                JOIN tt_PC_OVERDUE_FINAL_3 B   ON A.AccountEntityID = B.AccountEntityId ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET OVERDUESINCEDT = src.PCOVERDUEDUEDT,
                                      OverdueAmt = src.PCOVERDUE;
         --INNER JOIN #TEMPTABLEMINOVERDUEDTPC B ON A.AccountEntityID=B.AccountEntityID AND B.MINOVERDUE < = @PROCESSINGDATE  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE OVERDUESINCEDT FROM BILL DETAIL TABLE';
         /*-----UPDATE COVERGOVGUR BILL AT ACCOUNT LEVEL-------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE CoverGovGur BILL AT ACCOUNT LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, C.COVERGOVGUR
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ( SELECT A.ACCOUNTENTITYID ,
                              SUM(NVL(NVL(CLAIMCOVERAMT, 0) + NVL(CLAIMRECEIVEDAMT, 0), 0))  COVERGOVGUR  
                       FROM RBL_MISDB_PROD.AdvFacBillDetail A
                              JOIN tt_ACCOUNTCAL_26 B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID
                        WHERE  ( A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                                 AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                         GROUP BY A.ACCOUNTENTITYID ) C   ON A.ACCOUNTENTITYID = C.ACCOUNTENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.COVERGOVGUR = src.COVERGOVGUR;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE CoverGovGur BILL AT ACCOUNT LEVEL';
         /*-----UPDATE COVERGOVGUR PC AT ACCOUNT LEVEL-------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE CoverGovGur PC AT ACCOUNT LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, C.COVERGOVGUR
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ( SELECT A.ACCOUNTENTITYID ,
                              SUM(NVL(NVL(CLAIMCOVERAMT, 0) + NVL(CLAIMRECEIVEDAMT, 0), 0))  COVERGOVGUR  
                       FROM RBL_MISDB_PROD.AdvFacPCDetail A
                              JOIN tt_ACCOUNTCAL_26 B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID
                        WHERE  ( A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                                 AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                         GROUP BY A.ACCOUNTENTITYID ) C   ON A.ACCOUNTENTITYID = C.ACCOUNTENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.COVERGOVGUR = src.COVERGOVGUR;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE CoverGovGur PC AT ACCOUNT LEVEL';
         /*-----UPDATE COVERGOVGUR DL AT ACCOUNT LEVEL-------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE CoverGovGur DL AT ACCOUNT LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(NVL(CLAIMCOVERAMT, 0) + NVL(CLAIMRECEIVEDAMT, 0), 0) AS CoverGovGur
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.ADVFACDLDETAIL B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID 
          WHERE NVL(NVL(CLAIMCOVERAMT, 0) + NVL(CLAIMRECEIVEDAMT, 0), 0) > 0
           AND ( B.EffectiveFromTimeKey <= v_timekey
           AND B.EffectiveToTimeKey >= v_timekey )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CoverGovGur = src.CoverGovGur;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE CoverGovGur DL AT ACCOUNT LEVEL';
         /*-----UPDATE COVERGOVGUR CC AT ACCOUNT LEVEL-------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE CoverGovGur CC AT ACCOUNT LEVEL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(NVL(CLAIMCOVERAMT, 0) + NVL(CLAIMRECEIVEDAMT, 0), 0) AS CoverGovGur
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.ADVFACCCDETAIL B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID 
          WHERE NVL(NVL(CLAIMCOVERAMT, 0) + NVL(CLAIMRECEIVEDAMT, 0), 0) > 0
           AND ( B.EffectiveFromTimeKey <= v_timekey
           AND B.EffectiveToTimeKey >= v_timekey )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CoverGovGur = src.CoverGovGur;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE CoverGovGur CC AT ACCOUNT LEVEL';
         /*---------UPDATE PRVQTRINT,CURQTRINT,CURQTRCREDIT,PREQTRCREDIT-------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE PrvQtrInt,CurQtrInt,CurQtrCredit,PreQtrCredit' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required  Modification Done---   
         /*------------------Update PRVQTRINT,CURQTRINT,CURQTRCREDIT,PREQTRCREDIT------------------*/
         ------------IF (@PROCESSMONTH = EOMONTH(@PROCESSMONTH))  
         ------------BEGIN  
         ------------EXEC [PRO].[UpdateCADCADURefBalRecovery] @TimeKey=@TimeKey  
         ------------END  
         ------------IF (@PROCESSMONTH <> EOMONTH(@PROCESSMONTH))  
         ------------BEGIN  
         ------------UPDATE a set CurQtrCredit=b.CurQtrCredit,CurQtrInt=b.CurQtrInt  
         ------------from tt_ACCOUNTCAL_26 a  
         ------------inner join PRO.ACCOUNTCAL_hist b  
         ------------on a.CustomerAcID=b.CustomerAcID  
         ------------where a.FinalAssetClassAlt_Key>1  
         ------------AND (B.EffectiveFromTimeKey<=@LastMonthDateKey and B.EffectiveToTimeKey>=@LastMonthDateKey)  
         ------------END  
         -----------------------------------------------------------------------------------------------------------------  
         --DROP TABLE IF EXISTS tt_CCOD_90DAYS_INTT_CR_AMT_2  
         --SELECT A.CustomerAcID,  
         --   SUM(CASE WHEN TXNTYPE='DEBIT' AND TXNSUBTYPE='INTEREST' THEN TXNAMOUNT ELSE 0 END)  InterestAmt  
         --  ,SUM(CASE WHEN TXNTYPE='CREDIT'  THEN TXNAMOUNT ELSE 0 END)  CreditAmt  
         -- INTO tt_CCOD_90DAYS_INTT_CR_AMT_2  
         -- --SELECT A.CustomerID,a.CustomerACID,TxnDate,TxnType,TxnSubType,TxnAmount,TxnAmountInCurrency,TxnRefNo,Particular  
         --FROM AcDailyTxnDetail a  
         -- INNER JOIN RBL_MISDB.DBO.AdvAcBasicDetail B  
         --  ON A.AccountEntityId =B.AccountEntityId  
         --  AND B.EffectiveFromTimeKey<=26372 AND B.EffectiveToTimeKey>=26372  
         --  AND B.FacilityType IN('CC','OD')  
         --  --AND A.CUSTOMERACID='609000855742'  
         --where txndate between DATEADD(DD,-89,@ProcessingDate) and @ProcessingDate  
         --GROUP BY A.CustomerAcID  
         ----ORDER BY TxnDate,B.CustomerACID,RefCustomerId  
         --------------------------------------------Added By prashant 08-04-2022 as per Ashish sir--------------------------------------------------------  
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_CCOD_90DAYS_INTT_CR_AMT_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_CCOD_90DAYS_INTT_CR_AMT_2;
         UTILS.IDENTITY_RESET('tt_CCOD_90DAYS_INTT_CR_AMT_2');

         INSERT INTO tt_CCOD_90DAYS_INTT_CR_AMT_2 ( 
         	SELECT A.CustomerAcID ,
                 SUM(CASE 
                          WHEN TXNTYPE = 'DEBIT' THEN TXNAMOUNT
                     ELSE 0
                        END)  InterestAmt  ,
                 SUM(CASE 
                          WHEN TXNTYPE = 'CREDIT' THEN TXNAMOUNT
                     ELSE 0
                        END)  CreditAmt  

         	  --SELECT A.CustomerID,a.CustomerACID,TxnDate,TxnType,TxnSubType,TxnAmount,TxnAmountInCurrency,TxnRefNo,Particular  
         	  FROM AcDailyTxnDetail a
                   JOIN RBL_MISDB_PROD.AdvAcBasicDetail B   ON A.AccountEntityId = B.AccountEntityId
                   AND B.EffectiveFromTimeKey <= v_TIMEKEY
                   AND B.EffectiveToTimeKey >= v_TIMEKEY
                   AND B.FacilityType IN ( 'CC','OD' )


         	--AND A.CUSTOMERACID='609000855742'  
         	WHERE  txndate BETWEEN utils.dateadd('DD', -89, v_ProcessingDate) AND v_ProcessingDate
         	  GROUP BY A.CustomerAcID );
         --ORDER BY TxnDate,B.CustomerACID,RefCustomerId  
         -------------------------------------------------------------------------------------------------------------------------------  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 0, 0, NULL, NULL
         FROM A ,tt_ACCOUNTCAL_26 A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CurQtrCredit = 0,
                                      A.CurQtrInt = 0,
                                      A.INTNOTSERVICEDDT = NULL,
                                      A.InttServiced = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CreditAmt, InterestAmt
         FROM A ,tt_ACCOUNTCAL_26 a
                LEFT JOIN tt_CCOD_90DAYS_INTT_CR_AMT_2 b   ON A.CustomerAcID = b.CustomerAcID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CurQtrCredit = CreditAmt,
                                      A.CurQtrInt = InterestAmt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE PrvQtrInt,CurQtrInt,CurQtrCredit,PreQtrCredit';
         /*------------------UPDATE INTSERVICESDT IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE INTNOTSERVICEDDT IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         /*amar 30102021 AS PER DISCUSSIONS with sharma sir and ahishi sir intereset services WILL BE EXECUTING PN QTR END DATE */
         --IF (  (MONTH(@ProcessingDate) IN(3,12) AND DAY(@ProcessingDate)=31)  
         --   OR (MONTH(@ProcessingDate) IN(6,9)  AND DAY(@ProcessingDate)=30)  
         -- )  
         -- BEGIN  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', utils.dateadd('DAY', -89, v_PROCESSINGDATE) AS pos_3
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                JOIN AdvAcBasicDetail ABD   ON ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.AccountEntityId = A.AccountEntityID 
          WHERE NVL(A.Balance, 0) > 0
           AND NVL(A.CurQtrCredit, 0) < NVL(A.CurQtrInt, 0)
           AND A.FacilityType IN ( 'CC','OD' )

            /* REMOVED CONDITION FOR FirstDtOfDisb AS DISCUSSED WITH SHARMA SIR ON 04102021*/
           AND ( Asset_Norm <> 'ALWYS_STD' )

           ----AND (DATEADD(DAY,90,A.FirstDtOfDisb)<@PROCESSINGDATE AND A.FirstDtOfDisb IS NOT NULL AND Asset_Norm<>'ALWYS_STD' )  
           AND C.EffectiveFromTimeKey <= v_timekey
           AND C.EffectiveToTimeKey >= v_timekey

           ----AND C.NPANorms='DPD91'  
           AND ABD.ReferencePeriod = 91) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.InttServiced = 'N',
                                      A.INTNOTSERVICEDDT = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', NULL
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                JOIN AdvAcBasicDetail ABD   ON ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.AccountEntityId = A.AccountEntityID 
          WHERE A.FacilityType IN ( 'CC','OD' )

           AND ( utils.dateadd('DAY', 89, A.DebitSinceDt) > v_PROCESSINGDATE
           AND A.DebitSinceDt IS NOT NULL
           AND Asset_Norm <> 'ALWYS_STD' )
           AND C.EffectiveFromTimeKey <= v_timekey
           AND C.EffectiveToTimeKey >= v_timekey

           --AND C.NPANorms='DPD91'  
           AND InttServiced = 'N'
           AND ABD.ReferencePeriod = 91) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.InttServiced = 'N',
                                      A.INTNOTSERVICEDDT = NULL;
         --END  
         --UPDATE A SET A.OVERDUEAMT=B.DEMANDAMT  
         --            ,A.INTNOTSERVICEDDT=B.DEMANDDATE  
         --FROM tt_ACCOUNTCAL_26 A  INNER JOIN DimProduct C   
         -- ON A.ProductAlt_Key=C.ProductAlt_Key   
         --INNER JOIN   
         --(  
         --SELECT  AccountEntityID ,SUM(BalanceDemand) DEMANDAMT,MIN(DemandOverDueDate) DEMANDDATE   
         --FROM CurDat.AdvAcDemandDetail  
         --where EffectiveFromTimeKey<=@timekey AND EffectiveToTimeKey>=@timekey  
         --and ISNULL(BalanceDemand,0) > 0  
         --GROUP BY AccountEntityID  
         --) B  ON A.AccountEntityID=B.AccountEntityID   
         --AND C.EffectiveFromTimeKey<=@timekey AND C.EffectiveToTimeKey>=@timekey  
         --AND C.NPANorms='DPD366'  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'N', OverdueIntDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN DimProduct C   ON A.ProductAlt_Key = C.ProductAlt_Key
                JOIN AdvAcBasicDetail ABD   ON ( ABD.EffectiveFromTimeKey <= v_TIMEKEY
                AND ABD.EffectiveToTimeKey >= v_TIMEKEY )
                AND ABD.AccountEntityId = A.AccountEntityID
                JOIN AdvAcBalanceDetail BAL   ON ( BAL.EffectiveFromTimeKey <= v_TIMEKEY
                AND BAL.EffectiveToTimeKey >= v_TIMEKEY )
                AND BAL.AccountEntityId = A.AccountEntityID 
          WHERE A.FacilityType IN ( 'CC','OD' )

           AND ( utils.dateadd('DAY', 90, A.DebitSinceDt) > v_PROCESSINGDATE
           AND A.DebitSinceDt IS NOT NULL
           AND Asset_Norm <> 'ALWYS_STD' )
           AND C.EffectiveFromTimeKey <= v_timekey
           AND C.EffectiveToTimeKey >= v_timekey

           --AND C.NPANorms='DPD91'  

           --AND InttServiced='N'  
           AND ABD.ReferencePeriod IN ( 366,181 )

           AND c.Agrischeme = 'Y') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.InttServiced = 'N',
                                      A.INTNOTSERVICEDDT = OverdueIntDt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE INTNOTSERVICEDDT IN tt_ACCOUNTCAL_26';
         /*------------OVERDUE SINCE DATE IS AVAILABLE BUT OVERDUE AMOUT IS ZERO-----------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'OVERDUE SINCE DATE IS AVAILABLE BUT OVERDUE AMOUT IS ZERO' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ------UPDATE A  SET A.OverDueSinceDt=(CASE WHEN isnull(A.OverdueAmt,0)<=0 THEN NULL ELSE A.OverDueSinceDt END)  
         ------FROM tt_ACCOUNTCAL_26 A  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'OVERDUE SINCE DATE IS AVAILABLE BUT OVERDUE AMOUT IS ZERO';
         ----/*-----Stock statement date Data Preperation----------------------------------------------------*/  
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'Stock statement date Data Preperation' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         IF utils.object_id('Tempdb..tt_Stock_3') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_Stock_3 ';
         END IF;
         DELETE FROM tt_Stock_3;
         UTILS.IDENTITY_RESET('tt_Stock_3');

         INSERT INTO tt_Stock_3 ( 
         	SELECT AccountEntityId ,
                 MIN(ValuationDt)  StkSmtDt  ,
                 'S' TYPE  
         	  FROM ( SELECT Advsec.AccountEntityId ,
                          SecurityShortNameEnum ,
                          NVL(MAX(SecDtl.ValuationDate) , '9999-01-01') ValuationDt  
                   FROM RBL_MISDB_PROD.AdvSecurityValueDetail SecDtl
                          JOIN RBL_MISDB_PROD.AdvSecurityDetail Advsec   ON Advsec.SecurityEntityID = SecDtl.SecurityEntityID
                          JOIN DimSecurity sec   ON SecDtl.EffectiveFromTimeKey <= v_TimeKey
                          AND SecDtl.EffectiveToTimeKey >= v_TimeKey
                          AND Sec.EffectiveFromTimeKey <= v_TimeKey
                          AND Sec.EffectiveToTimeKey >= v_TimeKey
                          AND Advsec.SecurityAlt_Key = Sec.SecurityAlt_Key
                          AND Advsec.EffectiveFromTimeKey <= v_TimeKey
                          AND Advsec.EffectiveToTimeKey >= v_TimeKey
                    WHERE  SecurityShortNameEnum IN ( 'HYP-STOCK','HYP-BDEBT' )

                             AND Advsec.SecurityType = 'P'
                             AND ValuationDate IS NOT NULL
                     GROUP BY Advsec.AccountEntityId,SecurityShortNameEnum ) ST
         	  GROUP BY AccountEntityId );
         ----CREATE CLUSTERED INDEX tt_Stock_3_IX ON tt_Stock_3(AccountEntityId)  
         ----CREATE NONCLUSTERED INDEX tt_Stock_3NON ON tt_Stock_3(AccountEntityId,StkSmtDt)  
         ----IF OBJECT_ID('Tempdb..tt_Stock_32') IS NOT NULL  
         ----DROP TABLE tt_Stock_32  
         ----SELECT  AccountEntityId,MIN(ValuationDt) StkSmtDt,'W' TYPE  
         ----INTO tt_Stock_32  
         ----FROM(SELECT SecDtl.AccountEntityId ,SecurityShortNameEnum,ISNULL(MAX(SecDtl.ValuationDt),'9999-01-01') ValuationDt   
         ----            FROM dbo.ADvSecurityValueDetail SecDtl  
         ----            INNER  JOIN DimSecurity sec ON SecDtl.EffectiveFromTimeKey < = @TimeKey  
         ----                                          AND SecDtl.EffectiveToTimeKey   >= @TimeKey  
         ----                        AND Sec.EffectiveFromTimeKey < = @TimeKey  
         ----                                          AND Sec.EffectiveToTimeKey > = @TimeKey  
         ----            AND SecDtl.SecurityAlt_Key = Sec.SecurityAlt_Key  
         ----   WHERE SecurityShortNameEnum IN('PLD- WAREC-GEN','PLD- WAREC-NBHC','PLD- WAREC-NCMSL','PLD- WAREC-CWC','CARNC','CSRNC','WHRDMAT'  
         ----            ,'WHRMSW','WHRNG','WHRSACML','WHRSSL')  
         ----   AND  SecDtl.SecurityType='P'   
         ----   GROUP BY SecDtl.AccountEntityId,SecurityShortNameEnum) ST  
         ----   GROUP BY AccountEntityId  
         ----CREATE CLUSTERED INDEX tt_Stock_32_IX ON tt_Stock_32(AccountEntityId)  
         ----CREATE NONCLUSTERED INDEX tt_Stock_32NON ON tt_Stock_32(AccountEntityId,StkSmtDt)  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'STOCK STATEMENT DATE DATA PREPERATION';
         /*-----UPDATE STOCK STATEMENT DATE IN tt_ACCOUNTCAL_26----------------------------------------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'update stock statement date in tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         /*  amar  - 12062021 commented temporary for use stock date as provided in excel data  as discussed with Sharma Sir*/
         --UPDATE A SET A.StockStDt=StkSmtDt  
         --FROM tt_ACCOUNTCAL_26 A   
         --INNER  JOIN tt_Stock_3 SD ON A.AccountEntityId=SD.AccountEntityId  
         --where A.FacilityType='CC'  
         /* Added by amar on 17062021 for  get the stock  */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, StockStmtDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ADVFACCCDETAIL SD   ON A.AccountEntityId = SD.AccountEntityId 
          WHERE A.FacilityType = 'CC'
           AND SD.EffectiveFromTimeKey <= v_TimeKey
           AND SD.EffectiveToTimeKey >= v_TimeKey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.StockStDt = StockStmtDt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'update stock statement date in tt_ACCOUNTCAL_26';
         /*------UPDATE DerecognisedInterest1 AMT IN tt_ACCOUNTCAL_26---------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE DerecognisedInterest1 AMT IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         IF utils.object_id('TEMPDB..tt_TEMPDerecognisedInterest_5') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPDerecognisedInterest_5 ';
         END IF;
         DELETE FROM tt_TEMPDerecognisedInterest_5;
         INSERT INTO tt_TEMPDerecognisedInterest_5
           ( AccountEntityId, DerecognisedInterest1 )
           ( SELECT A.ACCOUNTENTITYID ,
                    SUM(NVL(DerecognisedInterest1, 0))  DerecognisedInterest1  
             FROM RBL_MISDB_PROD.AdvFacBillDetail A
              WHERE  ( A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest1, 0) > 0
               GROUP BY A.ACCOUNTENTITYID
             UNION 
             SELECT A.ACCOUNTENTITYID ,
                    SUM(NVL(DerecognisedInterest1, 0))  DerecognisedInterest1  
             FROM RBL_MISDB_PROD.AdvFacPCDetail A
              WHERE  ( A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest1, 0) > 0
               GROUP BY A.ACCOUNTENTITYID
             UNION ALL 
             SELECT B.ACCOUNTENTITYID ,
                    SUM(NVL(B.DerecognisedInterest1, 0))  DerecognisedInterest1  
             FROM RBL_MISDB_PROD.ADVFACCCDETAIL B
              WHERE  ( B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest1, 0) > 0
               GROUP BY B.ACCOUNTENTITYID
             UNION ALL 
             SELECT C.ACCOUNTENTITYID ,
                    SUM(NVL(C.DerecognisedInterest1, 0))  DerecognisedInterest1  
             FROM RBL_MISDB_PROD.ADVFACDLDETAIL C
              WHERE  ( C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest1, 0) > 0
               GROUP BY C.ACCOUNTENTITYID );
         /*-----UPDATE DerecognisedInterest1 IN tt_ACCOUNTCAL_26 TABLE ----------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DerecognisedInterest1
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_TEMPDerecognisedInterest_5 B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DerecognisedInterest1 = src.DerecognisedInterest1;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE DerecognisedInterest1 AMT IN tt_ACCOUNTCAL_26';
         /*------UPDATE DerecognisedInterest2 AMT IN tt_ACCOUNTCAL_26---------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE DerecognisedInterest2 AMT IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         IF utils.object_id('TEMPDB..tt_TEMPDerecognisedInterest_6') IS NOT NULL THEN
          EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_TEMPDerecognisedInterest_6 ';
         END IF;
         DELETE FROM tt_TEMPDerecognisedInterest_6;
         INSERT INTO tt_TEMPDerecognisedInterest_6
           ( AccountEntityId, DerecognisedInterest2 )
           ( SELECT A.ACCOUNTENTITYID ,
                    SUM(NVL(DerecognisedInterest2, 0))  DerecognisedInterest2  
             FROM RBL_MISDB_PROD.AdvFacBillDetail A
              WHERE  ( A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest2, 0) > 0
               GROUP BY A.ACCOUNTENTITYID
             UNION 
             SELECT A.ACCOUNTENTITYID ,
                    SUM(NVL(DerecognisedInterest2, 0))  DerecognisedInterest2  
             FROM RBL_MISDB_PROD.AdvFacPCDetail A
              WHERE  ( A.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND A.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest2, 0) > 0
               GROUP BY A.ACCOUNTENTITYID
             UNION ALL 
             SELECT B.ACCOUNTENTITYID ,
                    SUM(NVL(B.DerecognisedInterest2, 0))  DerecognisedInterest2  
             FROM RBL_MISDB_PROD.ADVFACCCDETAIL B
              WHERE  ( B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest2, 0) > 0
               GROUP BY B.ACCOUNTENTITYID
             UNION ALL 
             SELECT C.ACCOUNTENTITYID ,
                    SUM(NVL(C.DerecognisedInterest2, 0))  DerecognisedInterest2  
             FROM RBL_MISDB_PROD.ADVFACDLDETAIL C
              WHERE  ( C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                       AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY )
                       AND NVL(DerecognisedInterest2, 0) > 0
               GROUP BY C.ACCOUNTENTITYID );
         /*-----UPDATE DerecognisedInterest2 IN tt_ACCOUNTCAL_26 TABLE ----------------------------*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.DerecognisedInterest2
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_TEMPDerecognisedInterest_6 B   ON A.ACCOUNTENTITYID = B.ACCOUNTENTITYID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.DerecognisedInterest2 = src.DerecognisedInterest2;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE DerecognisedInterest2 AMT IN tt_ACCOUNTCAL_26';
         /*-------------UPDATE GovGurAmt FROM ADVACOTHERDETAIL-------------------------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE GovGurAmt FROM ADVACOTHERDETAIL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NVL(B.GovGurAmt, 0) AS GovtGtyAmt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN RBL_MISDB_PROD.AdvAcOtherDetail B   ON A.AccountEntityID = B.AccountEntityId
                AND ( B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE NVL(B.GovGurAmt, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.GovtGtyAmt = src.GovtGtyAmt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE GovGurAmt FROM ADVACOTHERDETAIL';
         /*-------------UPDATE UnserviedInt FROM AdvAcFinancialDetail-------------------------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE UnserviedInt FROM AdvAcFinancialDetail' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         /*  as discussionsed with Mr.Ashish -RBL and Sharma Sir also Email from Mr. Assish on 27-07-2021 for remove Unapplied intte checking when upgrading account  */
         /*  
         --update A SET UnserviedInt=B.UnAppliedIntAmount  
         --FROM tt_ACCOUNTCAL_26  A  
         --inner join DBO.ADVACBALANCEDETAIL  B on (B.EffectiveFromTimeKey<=@TIMEKEY AND B.EffectiveToTimeKey>=@TIMEKEY )  
         --and a.AccountEntityID=B.AccountEntityId    
         --WHERE B.UnAppliedIntAmount>0  
         */
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE UnserviedInt FROM AdvAcFinancialDetail';
         /*------------------UPDATE FRAUD ACCOUNT MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE FRAUD ACCOUNT MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 870, 6
         --,A.FinalNpaDt=CASE WHEN StatusDate is NULL then @PROCESSINGDATE else  StatusDate end  
         , CASE 
         WHEN a.FinalNpaDt IS NOT NULL
           AND a.FinalNpaDt < NVL(b.StatusDate, v_ProcessingDate) THEN a.FinalNpaDt
         ELSE NVL(b.StatusDate, v_ProcessingDate)
            END AS pos_5, 'NPA DUE TO FRAUD MARKING' AS pos_6
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Fraud Committed'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.SplCatg4Alt_Key = 870,
                                      A.FinalAssetClassAlt_Key = 6,
                                      A.FinalNpaDt --Email date 16-06-2022---For Fraud cases date of NPA should be earlier of fraud date or NPA date before marking account as fraud.
                                       = pos_5,
                                      A.NPA_Reason = pos_6;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE FRAUD ACCOUNT MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE FRAUD ACCOUNT MARKING  IN tt_CUSTOMERCAL_23------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE FRAUD ACCOUNT MARKING  IN tt_CUSTOMERCAL_23' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, 'ALWYS_NPA', 870, 6
         --,C.SYSNPA_DT=CASE WHEN StatusDate is NULL then @PROCESSINGDATE else  StatusDate end  
         , CASE 
         WHEN C.SYSNPA_DT IS NOT NULL
           AND C.SYSNPA_DT < NVL(b.StatusDate, v_ProcessingDate) THEN C.SYSNPA_DT
         ELSE NVL(b.StatusDate, v_ProcessingDate)
            END AS pos_5, 'NPA DUE TO FRAUD MARKING' AS pos_6
         FROM C ,tt_CUSTOMERCAL_23 c
                JOIN ExceptionFinalStatusType b   ON c.RefCustomerID = b.CustomerID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Fraud Committed'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET C.Asset_Norm = 'ALWYS_NPA',
                                      C.SplCatg4Alt_Key = 870,
                                      C.SYSASSETCLASSALT_KEY = 6,
                                      C.SYSNPA_DT --Email date 16-06-2022---For Fraud cases date of NPA should be earlier of fraud date or NPA date before marking account as fraud.
                                       = pos_5,
                                      C.DEGREASON = pos_6;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE FRAUD ACCOUNT MARKING  IN tt_CUSTOMERCAL_23';
         /*------------------UPDATE IBPC MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE IBPC MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN IBPCFinalPoolDetail b   ON a.CustomerAcID = b.ACCOUNTID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.IsIBPC = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE IBPC MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE Securitised MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE Securitised MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN SecuritizedFinalACDetail b   ON a.CustomerAcID = b.ACCOUNTID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.IsSecuritised = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Securitised MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE PUI MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE PUI MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdvAcPUIDetailMain b   ON a.CustomerAcID = b.ACCOUNTID 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.PUI = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE PUI MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE RFA MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE RFA MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'RFA'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RFA = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE RFA MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE NonCooperative MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE NonCooperative MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Non-cooperative'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.IsNonCooperative = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE NonCooperative MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE Repossessed ACCOUNT MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE Repossessed ACCOUNT MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Repossesed'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RePossession = 'Y';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN REPOSSESSIONDATE IS NULL THEN v_PROCESSINGDATE
         ELSE REPOSSESSIONDATE
            END AS pos_4, 'NPA DUE TO Repossessed Account' AS pos_5, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Repossesed'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )
           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.FinalAssetClassAlt_Key = 2,
                                      A.FinalNpaDt --FinalNpaDt  
                                       = pos_4,
                                      A.NPA_Reason = pos_5,
                                      A.RePossession = 'Y';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO Repossessed Account' AS pos_3, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Repossesed'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )
           AND FinalAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.NPA_Reason = pos_3,
                                      A.RePossession = 'Y';
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
         FROM a ,tt_CUSTOMERCAL_23 a
                JOIN tt_ACCOUNTCAL_26 b   ON a.CustomerEntityID = b.CustomerEntityID 
          WHERE b.RePossession = 'Y') src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET b.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      b.SysNPA_Dt = src.FinalNpaDt,
                                      a.DegReason = src.NPA_Reason,
                                      a.Asset_Norm = src.Asset_Norm;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Repossessed ACCOUNT MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE Inherent Weakness  ACCOUNT MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE Inherent Weakness ACCOUNT MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
         ELSE FinalNpaDt
            END AS pos_4, 'NPA DUE TO Inherent Weakness Account' AS pos_5, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Inherent Weakness'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )
           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.FinalAssetClassAlt_Key = 2,
                                      A.FinalNpaDt = pos_4,
                                      A.NPA_Reason = pos_5,
                                      A.WeakAccount = 'Y';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO Inherent Weakness Account' AS pos_3, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'Inherent Weakness'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )
           AND FinalAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.NPA_Reason = pos_3,
                                      A.WeakAccount = 'Y';
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
         FROM a ,tt_CUSTOMERCAL_23 a
                JOIN tt_ACCOUNTCAL_26 b   ON a.CustomerEntityID = b.CustomerEntityID 
          WHERE b.WeakAccount = 'Y') src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET b.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      b.SysNPA_Dt = src.FinalNpaDt,
                                      a.DegReason = src.NPA_Reason,
                                      a.Asset_Norm = src.Asset_Norm;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Inherent Weakness ACCOUNT MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE SARFAESI ACCOUNT MARKING IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE SARFAESI ACCOUNT MARKING IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'SARFAESI'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Sarfaesi = 'Y';
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 2, CASE 
         WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
         ELSE FinalNpaDt
            END AS pos_4, 'NPA DUE TO SARFAESI  Account' AS pos_5
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'SARFAESI'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )
           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.FinalAssetClassAlt_Key = 2,
                                      A.FinalNpaDt = pos_4,
                                      A.NPA_Reason = pos_5;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 'NPA DUE TO Sarfaesi Account' AS pos_3, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'SARFAESI'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )
           AND FinalAssetClassAlt_Key > 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.NPA_Reason = pos_3,
                                      A.Sarfaesi = 'Y';
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, b.FinalAssetClassAlt_Key, b.FinalNpaDt, b.NPA_Reason, b.Asset_Norm
         FROM a ,tt_CUSTOMERCAL_23 a
                JOIN tt_ACCOUNTCAL_26 b   ON a.CustomerEntityID = b.CustomerEntityID 
          WHERE b.Sarfaesi = 'Y') src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET b.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      b.SysNPA_Dt = src.FinalNpaDt,
                                      a.DegReason = src.NPA_Reason,
                                      a.Asset_Norm = src.Asset_Norm;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE SARFAESI ACCOUNT MARKING IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE RC-Pending MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE RC-Pending MARKING  IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'Y'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN ExceptionFinalStatusType b   ON a.customeracid = b.acid 
          WHERE ( B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY )
           AND b.StatusType = ( SELECT ParameterShortNameEnum 
                                FROM dimparameter 
                                 WHERE  DimParameterName = 'UploadFLagType'
                                          AND ParameterShortNameEnum = 'RC Pending'
                                          AND EffectiveFromTimeKey <= v_TIMEKEY
                                          AND EffectiveToTimeKey >= v_TIMEKEY )) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.RCPending = 'Y';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE RC-Pending MARKING  IN tt_ACCOUNTCAL_26';
         /*------------------UPDATE Written-Off Accounts ACCOUNT MARKING  IN tt_ACCOUNTCAL_26------------------*/
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE Written-Off Accounts MARKING IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA', 860, 2, CASE 
         WHEN FinalNpaDt IS NULL THEN v_PROCESSINGDATE
         ELSE FinalNpaDt
            END AS pos_5, 'NPA DUE TO Written-Off Account' AS pos_6
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdvAcOtherDetail B   ON A.AccountEntityID = B.AccountEntityID
                AND ( B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY ) 
          WHERE 860 IN ( NVL(B.SplCatg1Alt_Key, 0),NVL(B.SplCatg2Alt_Key, 0),NVL(B.SplCatg3Alt_Key, 0),NVL(B.SplCatg4Alt_Key, 0) )

           AND FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'ALWYS_NPA',
                                      A.SplCatg4Alt_Key = 860,
                                      A.FinalAssetClassAlt_Key = 2,
                                      A.FinalNpaDt = pos_5,
                                      A.NPA_Reason = pos_6;
         ---------  Changed on 22-05-2021   
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, 'ALWYS_NPA'
         FROM B ,tt_ACCOUNTCAL_26 A
                JOIN tt_CUSTOMERCAL_23 B   ON A.UcifEntityID = B.UcifEntityID 
          WHERE A.Asset_Norm = 'ALWYS_NPA'
           AND B.UcifEntityID > 0) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.Asset_Norm = 'ALWYS_NPA';
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Written-Off Accounts MARKING IN tt_ACCOUNTCAL_26';
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( USERID, DESCRIPTION, MODE_, STARTTIME, ENDTIME, TIMEKEY, SETID )
           ( SELECT USER ,
                    'UPDATE CONDI_STD IN tt_ACCOUNTCAL_26' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SETID 
               FROM DUAL  );
         ---Condition Change Required  Modification Done---   
         /*  amar - changes on 12012023 - if security not availavle then consider as 0 current value */
         WITH CTE_FDOD_SEC AS ( SELECT C.AccountEntityID ,
                                       SUM(NVL(CurrentValue, 0))  CurrentValue  
           FROM tt_ACCOUNTCAL_26 C
                  LEFT JOIN RBL_MISDB_PROD.AdvSecurityDetail Advsec   ON Advsec.AccountEntityID = C.AccountEntityID
                  AND Advsec.EffectiveFromTimeKey <= v_TimeKey
                  AND Advsec.EffectiveToTimeKey >= v_TimeKey
                  LEFT JOIN RBL_MISDB_PROD.AdvSecurityValueDetail B   ON Advsec.SecurityEntityID = b.SecurityEntityID
                  AND B.SecurityEntityID = Advsec.SecurityEntityID
                  AND B.EffectiveFromTimeKey <= v_TimeKey
                  AND B.EffectiveToTimeKey >= v_TimeKey
                  JOIN DimProduct DP   ON c.ProductAlt_Key = dp.ProductAlt_Key
                  AND DP.ProductGroup = 'FDSEC'
                  AND DP.EffectiveFromTimeKey <= v_TimeKey
                  AND DP.EffectiveToTimeKey >= v_TimeKey
                  AND C.EffectiveFromTimeKey <= v_TimeKey
                  AND C.EffectiveToTimeKey >= v_TimeKey
           GROUP BY C.AccountEntityID ) 
            MERGE INTO A 
            USING (SELECT A.ROWID row_id, 'CONDI_STD'
            FROM A ,tt_ACCOUNTCAL_26 A
                   JOIN DimProduct DP   ON A.ProductAlt_Key = dp.ProductAlt_Key
                   AND DP.ProductGroup = 'FDSEC'
                   AND DP.EffectiveFromTimeKey <= v_TimeKey
                   AND DP.EffectiveToTimeKey >= v_TimeKey
                   LEFT JOIN CTE_FDOD_SEC E   ON A.AccountEntityID = E.AccountEntityID 
             WHERE NVL(A.Balance, 0) > 0
              AND NVL(A.Balance, 0) > NVL(E.CurrentValue, 0)) src
            ON ( A.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET A.Asset_Norm = 'CONDI_STD'
            ;
         -----------------------------------------------Added by Prashant 08-03-2023 for 2nd FDOD Issue----------------------------------------------
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, 'CONDI_STD'
         FROM C ,tt_ACCOUNTCAL_26 C
                JOIN DimProduct DP   ON c.ProductAlt_Key = dp.ProductAlt_Key
                AND DP.ProductGroup = 'FDSEC'
                AND DP.EffectiveFromTimeKey <= v_TimeKey
                AND DP.EffectiveToTimeKey >= v_TimeKey
                AND c.InitialAssetClassAlt_Key > 1 ) src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET c.Asset_Norm = 'CONDI_STD';
         --------------------------------------------------------------------------------------------------
         /*  
         ------UPDATE A SET A.Asset_Norm=(CASE WHEN A.Balance-ISNULL(e.CurrentValue,0) <=0 THEN 'ALWYS_STD'ELSE 'CONDI_STD' END)  
         UPDATE A SET A.Asset_Norm='CONDI_STD'   
            FROM tt_ACCOUNTCAL_26 A  
            INNER JOIN (  
               SELECT C.AccountEntityID,SUM(isnull(CurrentValue,0)) CurrentValue  
                     FROM dbo.AdvSecurityVAlueDetail B  
            INNER  JOIN dbo.AdvSecurityDetail Advsec on Advsec.SecurityEntityID=b.SecurityEntityID  
             INNER JOIN tt_ACCOUNTCAL_26 C ON Advsec.AccountEntityID=C.AccountEntityID    
              AND Advsec.SecurityAlt_Key = Advsec.SecurityAlt_Key  
                                         AND  Advsec.EffectiveFromTimeKey < = @TimeKey  
                                                 AND Advsec.EffectiveToTimeKey   >= @TimeKey  
            --INNER JOIN DimSecurity D ON D.EffectiveFromTimeKey<=@TIMEKEY  
            --          AND D.EffectiveToTimeKey>=@TIMEKEY  
            --          AND D.SecurityAlt_Key=Advsec.SecurityAlt_Key  
            inner join DimProduct DP
         	on         c.ProductAlt_Key=dp.ProductAlt_Key
         	and        DP.ProductGroup='FDSEC'
         	AND  DP.EffectiveFromTimeKey < = @TimeKey  
               AND DP.EffectiveToTimeKey   >= @TimeKey  
            --WHERE  Advsec.SecurityType='P'   
            ----AND ISNULL(D.SecurityShortNameEnum,'') IN('PLD-NSC','PLD-KVP','PLD-G SEC','ASGN-LIFE POL','LI-FDR','LI-FDRSUBSI','LI-NRE DEP'  
            --                                               --    ,'LI-NRNR DEP','LI-FCNR-DEP','LI-RD-DEP','DEPNFBR')   
            --AND D.SecurityCRM='Y'  
           --  and ISNULL(C.Asset_Norm,'NORMAL')='CONDI_STD'    

            GROUP BY C.AccountEntityID  
             ) E  ON A.AccountEntityID=E.AccountEntityID  
             and  ISNULL(A.Balance,0)>0   AND ISNULL(A.Balance,0)>ISNULL(E.CurrentValue,0)  
           */
         ---Condition Change Required  Modification Done---    
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, ContinousExcessSecDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.ContinousExcessSecDtAccountCal B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE B.EffectiveFromTimeKey <= v_TIMEKEY
           AND B.EffectiveToTimeKey >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.ContiExcessDt = ContinousExcessSecDt;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IDENTITYKEY = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE CONDI_STD IN tt_ACCOUNTCAL_26';
         --   /*------------********UPDATE Last Credit Date******--------------------*/   
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE Last Credit Date' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required Modification Done  ---   
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.LastCrDate
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.LastCreditDtAccountCal B   ON ( B.EffectiveFromTimeKey <= v_TIMEKEY
                AND B.EffectiveToTimeKey >= v_TIMEKEY )
                AND A.CustomerAcID = B.CustomerAcID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.LastCrDate = src.LastCrDate;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE Last Credit Date';
         /*---------UPDATE AddlProvisionAmount  AT Account level--------------------- */
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'UPDATE AddlProvisionAmount  AT Account level' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         ---Condition Change Required ---   
         --IF OBJECT_ID('TEMPDB..#AddlProvisionAmount') IS NOT NULL  
         --DROP TABLE #AddlProvisionAmount  
         --select AccountEntityID,CustomerAcID,AddlProvisionPer, AddlProvision,MOCTYPE  
         --into #AddlProvisionAmount  
         --from PRO.ACCOUNTCAL_hist   A  
         --where A.EffectiveFromTimeKey<=@LastQtrDateKey and A.EffectiveToTimeKey>=@LastQtrDateKey   
         --and AddlProvision>0   
         ----and MOCTYPE='Manual'  
         --UPDATE B SET ADDLPROVISIONPER=A.ADDLPROVISIONPER,ADDLPROVISION=A.ADDLPROVISION,MOCTYPE=A.MOCTYPE  
         --FROM #ADDLPROVISIONAMOUNT A  
         --INNER JOIN tt_ACCOUNTCAL_26 B  
         --ON A.CUSTOMERACID=B.CUSTOMERACID  
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'UPDATE AddlProvisionAmount  AT Account level';
         --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=B.NPADATE,A.FLGMOC='Y',A.ASSET_NORM='ALWYS_NPA',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE  
         --       FROM tt_CUSTOMERCAL_23 A  
         -- INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         --     INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME<>'STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --           DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999  
         --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=B.NPADATE,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE  
         --FROM tt_CUSTOMERCAL_23 A  
         --INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         --    INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME<>'STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=NULL,A.DBTDT =NULL,A.FLGMOC='Y',A.ASSET_NORM='ALWYS_STD',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE  
         -- FROM tt_CUSTOMERCAL_23 A  
         --INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         --  INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME='STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999  
         --UPDATE A SET A.SYSASSETCLASSALT_KEY=DA.ASSETCLASSALT_KEY,A.SYSNPA_DT=NULL,A.DBTDT =NULL,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED,A.MOCTYPE=B.MOCTYPE  
         -- FROM tt_CUSTOMERCAL_23 A  
         --INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         -- INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME='STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=B.NPADATE,A.FlgMoc='Y',A.ASSET_NORM='ALWYS_NPA',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED  
         --       FROM tt_ACCOUNTCAL_26 A  
         -- INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         --     INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME<>'STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999  
         --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=B.NPADATE,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='NPA DUE TO MOC',A.MOC_DT=B.DATECREATED  
         --FROM tt_ACCOUNTCAL_26 A  
         --INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         --    INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME<>'STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=NULL,A.FLGMOC='Y',A.ASSET_NORM='ALWYS_STD',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED  
         -- FROM tt_ACCOUNTCAL_26 A  
         --INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         --  INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME='STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='MANUAL' AND B.EFFECTIVETOTIMEKEY=49999  
         --UPDATE A SET A.FinalAssetClassAlt_Key=DA.ASSETCLASSALT_KEY,A.FinalNpaDt=NULL,A.FLGMOC='Y',A.ASSET_NORM='NORMAL',A.MOCREASON=B.MOCREASON,DEGREASON='STD DUE TO MOC',A.MOC_DT=B.DATECREATED  
         -- FROM tt_ACCOUNTCAL_26 A  
         --INNER JOIN DATAUPLOAD.MocCustomerDailyDataUpload B ON A.REFCUSTOMERID=B.CUSTOMERID  
         -- INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSSHORTNAME= B.ASSETCLASSIFICATION AND  
         --                           DA.ASSETCLASSSHORTNAME='STD' AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE B.MOCTYPE='AUTO' AND  B.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  B.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --UPDATE  A SET DBTDT=@PROCESSINGDATE FROM tt_CUSTOMERCAL_23 A    
         --INNER JOIN DIMASSETCLASS DA       ON  DA.ASSETCLASSALT_KEY= A.SYSASSETCLASSALT_KEY AND  
         --                           DA.ASSETCLASSSHORTNAME IN ('DB1','DB2','DB3') AND    
         --                           DA.EFFECTIVEFROMTIMEKEY<=@TIMEKEY AND  
         --                   DA.EFFECTIVETOTIMEKEY>=@TIMEKEY  
         --WHERE DBTDT IS NULL  
         ------update a  
         ------set a.InitialNpaDt =b.FinalNpaDt  
         ------ ,A.InitialAssetClassAlt_Key =B.FinalAssetClassAlt_Key  
         ------from tt_ACCOUNTCAL_26 A   
         ------INNER JOIN PRO.ACCOUNTCAL_Hist B  
         ------ ON A.AccountEntityID =B.AccountEntityID  
         ------WHERE B.EffectiveFromTimeKey<=26123 AND B.EffectiveToTimeKey>=26123  
         ------AND A.FinalAssetClassAlt_Key>1  
         ------AND (A.InitialAssetClassAlt_Key<>B.FinalAssetClassAlt_Key)  
         --UPDATE DATAUPLOAD.MocCustomerDailyDataUpload SET EFFECTIVETOTIMEKEY=EFFECTIVEFROMTIMEKEY WHERE MOCTYPE='AUTO'  
         /* ADDED ON 04072021 AS PER DISCUSSIONS WITH BANK ON 03072021 FOR UPGRADE some ACCOUNT AS PER LIST PROVIDED BY BANK TEAM*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_STD'
         ---INITIALASSETCLASSALT_KEY=1  
          --,INITIALNPADT=NULL  
         , NULL, 1, 1, 'N', 'N', ' ' AS pos_8, NULL
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN Manual_Upgrade B   ON A.CustomerAcID = B.Account_No 
          WHERE VALID_UPTO >= '2021-10-25'
           AND Account_No NOT IN ( SELECT Account_No 
                                   FROM Manual_NPA  )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET ASSET_NORM = 'ALWYS_STD',
                                      FINALNPADT = NULL,
                                      FINALASSETCLASSALT_KEY = 1,
                                      PrvAssetClassAlt_Key = 1,
                                      flgdeg = 'N',
                                      FlgUpg = 'N',
                                      NPA_Reason = pos_8,
                                      DegReason = NULL;
         /* ADDED ON 04072021 AS PER DISCUSSIONS WITH BANK ON 03072021 FOR UPGRADE some ACCOUNT AS PER LIST PROVIDED BY BANK TEAM*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN Manual_NPA B   ON A.CustomerAcID = B.Account_No 
          WHERE VALID_UPTO >= v_ProcessingDate) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.ASSET_NORM = 'ALWYS_NPA';
         /* THIS CODE IS ONLY FOR FORCEFULLY MARKED NPA FOE SEPECIFIC ACCOUNT (10 AC) AS PER BANK EAMIL DTD 28072021 */
         /*  
          UPDATE A  
          SET  A.FinalAssetClassAlt_Key=2  
           ,A.FinalNpaDt=B.NPA_dATE  
           ,A.Asset_Norm ='ALWYS_NPA'  
          --select CustomerAcID,Asset_Norm ,FinalAssetClassAlt_Key,FinalNpaDt  
          FROM [pro].accountcal A   
          INNER JOIN Manual_NPA_28072021 b   
           ON a.CustomerAcID = b.[Account No]  
           */
         ----UPDATE A SET    
         ----  ASSET_NORM='ALWYS_NPA'  
         ----  ,A.InitialAssetClassAlt_Key =ISNULL(C.FinalAssetClassAlt_Key,A.InitialAssetClassAlt_Key)  
         ----  ,A.InitialNpaDt=ISNULL(C.FinalNpaDt,A.InitialNpaDt)  
         ---- FROM tt_ACCOUNTCAL_26 A   
         ---- INNER JOIN Manual_NPA B  
         ---- ON A.CustomerAcID=B.[Account No]  
         ----  LEFT join PRO.ACCOUNTCAL_Hist  c  
         ----  on c.AccountEntityID=a.AccountEntityID  
         ----  AND (C.EFFECTIVEFROMTIMEKEY<=@HistTimeKey AND C.EFFECTIVETOTIMEKEY>=@HistTimeKey)  
         ----WHERE VALID_UPTO>=@ProcessingDate  
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,tt_ACCOUNTCAL_26 A 
          WHERE InitialAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.InitialNpaDt = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,tt_ACCOUNTCAL_26 A 
          WHERE FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalNpaDt = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,tt_CUSTOMERCAL_23 A 
          WHERE SrcAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET SrcNPA_Dt = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,tt_CUSTOMERCAL_23 A 
          WHERE SysAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET SysNPA_Dt = NULL;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal ';
         INSERT INTO PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal
           ( DateofData, ReportDate, CustomerAcID, AccountEntityID, SchemeCode, NPA_ClassSeller, NPA_DateSeller, DPD_Seller, PeakDPD, PeakDPD_Date, AuthorisationStatus, EffectiveFromTimeKey, EffectiveToTimeKey )
           ( SELECT A.DateofData ,
                    A.ReportDate ,
                    A.CustomerAcID ,
                    B.AccountEntityID ,
                    A.SchemeCode ,
                    A.NPA_ClassSeller ,
                    A.NPA_DateSeller ,
                    A.DPD_Seller ,
                    A.PeakDPD ,
                    A.PeakDPD_Date ,
                    A.AuthorisationStatus ,
                    v_TIMEKEY EffectiveFromTimeKey  ,
                    49999 EffectiveToTimeKey  
             FROM BuyoutUploadDetails A
                    JOIN tt_ACCOUNTCAL_26 B   ON A.CustomerAcID = B.CustomerAcID
              WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                       AND A.EffectiveToTimeKey >= v_TIMEkEY );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL, NULL, NULL
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.OverDueSinceDt = NULL,
                                      A.PrincOverdueSinceDt = NULL,
                                      A.IntOverdueSinceDt = NULL,
                                      A.OtherOverdueSinceDt = NULL;
         /*
           -- UPDATE NPA COLUMNS IN CASE OF NPA MARKED 'Y' IN SELLER BOOK --  
           UPDATE  A   
            SET  FinalAssetClassAlt_Key=CASE WHEN NPA_ClassSeller='Y' AND A.FinalAssetClassAlt_Key=1 THEN 2 ELSE  A.FinalAssetClassAlt_Key END  
             ,FinalNpaDt=CASE WHEN NPA_ClassSeller='Y' AND A.FinalAssetClassAlt_Key=1 THEN ISNULL(NPA_DateSeller,B.ReportDate) ELSE  A.FinalNpaDt END  
             ,Asset_Norm=CASE WHEN NPA_ClassSeller='Y' THEN 'ALWYS_NPA' ELSE A.Asset_Norm END  
             ,NPA_Reason=CASE WHEN NPA_ClassSeller='Y' THEN 'NPA with Seller' ELSE A.NPA_Reason END  
           FROM tt_ACCOUNTCAL_26 A  
            INNER JOIN PRO.BuyoutUploadDetailsCal B  
            ON A.CustomerAcID=B.CustomerAcID  

           UPDATE  C   
            SET  SysAssetClassAlt_Key=CASE WHEN NPA_ClassSeller='Y' AND C.SysAssetClassAlt_Key=1 THEN 2 ELSE  C.SysAssetClassAlt_Key END  
             ,C.SysNPA_Dt=CASE WHEN NPA_ClassSeller='Y' AND C.SysAssetClassAlt_Key=1 THEN ISNULL(NPA_DateSeller,B.ReportDate) ELSE  C.SysNPA_Dt END  
             ,Asset_Norm=CASE WHEN NPA_ClassSeller='Y' THEN 'ALWYS_NPA' ELSE A.Asset_Norm END  
             ,C.DegReason=CASE WHEN NPA_ClassSeller='Y' THEN 'NPA with Seller' ELSE C.DegReason END  
           FROM tt_ACCOUNTCAL_26 A  
            INNER JOIN PRO.BuyoutUploadDetailsCal B  
            ON A.CustomerAcID=B.CustomerAcID  
            inner join tt_CUSTOMERCAL_23 C  
            ON A.CustomerEntityID=C.CustomerEntityID  
           */
         /* UPDATE FLAG NPA_EffectedToMainAdv FROMHIST TABLE PREV. DAYE */
         -- UPDATE  A  
         -- SET A.NPA_EffectedToMainAdv=C.NPA_EffectedToMainAdv  
         --  ,A.NPA_Flag=c.NPA_Flag  
         --FROM  PRO.BuyoutUploadDetailsCal A  
         --  INNER JOIN PRO.BuyoutUploadDetailsCal_Hist C  
         --  ON A.AccountEntityID=C.AccountEntityID  
         --  AND C.EffectiveFromTimeKey<=@TIMEKEY-1 AND C.EffectiveToTimeKey>=@TIMEkEY-1  
         /* UPDATE OVERDUE SINCE DATE FROM DPD WITH SELLER AND DATE DOFF OF REPORT AND PROCESSDATE */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('DD', -(NVL(B.DPD_Seller, 0) - 1), ReportDate) AS OverDueSinceDt
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID 
          WHERE NVL(B.DPD_Seller, 0) > 0) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.OverDueSinceDt
                                      ---------,A.DPD_PrincOverdue  =DATEADD(DD,- (ISNULL(B.DPD_Seller,0)+DATEDIFF(DD,ReportDate,@ProcessingDate)),@ProcessingDate)  
                                       = src.OverDueSinceDt;
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.AdvAcRestructureCal ';
         ------------------------Insert Data for Base Columns   
         INSERT INTO PRO_RBL_MISDB_PROD.AdvAcRestructureCal
           ( AccountEntityId, AssetClassAlt_KeyOnInvocation, PreRestructureAssetClassAlt_Key, PreRestructureNPA_Date, ProvPerOnRestrucure, RestructureTypeAlt_Key, COVID_OTR_CatgAlt_Key, RestructureDt, SP_ExpiryDate, RestructurePOS, DPD_AsOnRestructure, RestructureFailureDate, DPD_Breach_Date, ZeroDPD_Date, SP_ExpiryExtendedDate, Res_POS_to_CurrentPOS_Per, CurrentDPD, TotalDPD, VDPD, AddlProvPer, ProvReleasePer, UpgradeDate, SurvPeriodEndDate, PreDegProvPer, NonFinDPD, InitialAssetClassAlt_Key, FinalAssetClassAlt_Key, RestructureProvision, SecuredProvision, UnSecuredProvision, FlgDeg, FlgUpg, DegDate, RestructureStage, EffectiveFromTimeKey, EffectiveToTimeKey, InvestmentGrade, POS_10PerPaidDate, FlgMorat, PreRestructureNPA_Prov, RestructureFacilityTypeAlt_Key )
           ( SELECT A.AccountEntityId ,
                    AssetClassAlt_KeyOnInvocation ,
                    PreRestructureAssetClassAlt_Key ,
                    PreRestructureNPA_Date ,
                    ProvPerOnRestrucure ,
                    RestructureTypeAlt_Key ,
                    COVID_OTR_CatgAlt_Key ,
                    RestructureDt ,
                    utils.dateadd('YY', 1, (CASE 
                                                 WHEN NVL(PrincRepayStartDate, '1900-01-01') >= NVL(InttRepayStartDate, '1900-01-01') THEN PrincRepayStartDate
                                  ELSE InttRepayStartDate
                                     END)) SP_ExpiryDate  ,
                    CASE 
                         WHEN NVL(RestructurePOS, 0) <= 0 THEN 0
                    ELSE NVL(RestructurePOS, 0)
                       END RestructurePOS  ,
                    DPD_AsOnRestructure ,
                    NULL RestructureFailureDate  ,
                    DPD_Breach_Date ,
                    ZeroDPD_Date ,
                    NULL SP_ExpiryExtendedDate  ,
                    0 Res_POS_to_CurrentPOS_Per  ,
                    0 CurrentDPD  ,
                    0 TotalDPD  ,
                    0 VDPD  ,
                    0 AddlProvPer  ,
                    0 ProvReleasePer  ,
                    UpgradeDate ,
                    SurvPeriodEndDate ,
                    PreDegProvPer ,
                    0 NonFinDPD  ,
                    1 InitialAssetClassAlt_Key  ,
                    1 FinalAssetClassAlt_Key  ,
                    0 RestructureProvision  ,
                    0 SecuredProvision  ,
                    0 UnSecuredProvision  ,
                    'N' FlgDeg  ,
                    'N' FlgUpg  ,
                    NULL DegDate  ,
                    RestructureStage ,
                    v_Timekey EffectiveFromTimeKey  ,
                    v_Timekey EffectiveToTimeKey  ,
                    InvestmentGrade ,
                    POS_10PerPaidDate ,
                    FlgMorat ,
                    PreRestructureNPA_Prov ,
                    RestructureFacilityTypeAlt_Key 
             FROM AdvAcRestructureDetail A
                    JOIN tt_ACCOUNTCAL_26 B   ON A.AccountEntityId = B.AccountEntityID
              WHERE  A.EffectiveFromTimeKey <= v_TimeKey
                       AND A.EffectiveToTimeKey >= v_Timekey );
         ----------------Update Total OS, Total POS,CrntQtrAssetClass----------------  
         --Select *   
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN NVL(PrincOutStd, 0) <= 0 THEN 0
         ELSE NVL(PrincOutStd, 0)
            END AS pos_2, Balance
         --,A.FinalAssetClassAlt_Key=b.FinalAssetClassAlt_Key  
          --,A.InitialAssetClassAlt_Key=B.InitialAssetClassAlt_Key  
         , CASE 
         WHEN B.FinalAssetClassAlt_Key = 1 THEN SP.ProvisionSecured
         ELSE B.FinalProvisionPer
            END AS pos_4, CASE 
         WHEN A.UpgradeDate IS NOT NULL THEN utils.dateadd('YY', 1, A.UpgradeDate)
         ELSE NULL
            END AS pos_5, B.DPD_Max
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN tt_ACCOUNTCAL_26 B   ON A.AccountEntityId = B.AccountEntityId
                LEFT JOIN DimProvision_SegStd SP   ON SP.EffectiveFromTimeKey <= v_TimeKey
                AND SP.EffectiveFromTimeKey >= v_TimeKey
                AND SP.ProvisionAlt_Key = B.ProvisionAlt_Key
                LEFT JOIN DimProvision_Seg NP   ON NP.EffectiveFromTimeKey <= v_TimeKey
                AND NP.EffectiveFromTimeKey >= v_TimeKey
                AND NP.ProvisionAlt_Key = B.ProvisionAlt_Key 
          WHERE A.EffectiveFromTimeKey <= v_TimeKey
           AND A.EffectiveToTimeKey >= v_TimeKey) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.CurrentPOS = pos_2,
                                      A.CurrentTOS = Balance,
                                      A.AppliedNormalProvPer
                                      --,A.FinalNpaDt=b.FinalNpaDt  
                                       --,A.UpgradeDate=b.UpgDate  
                                       = pos_4,
                                      A.SurvPeriodEndDate = pos_5,
                                      A.CurrentDPD = src.DPD_Max;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN (NVL(RestructurePOS, 0)) > 0 THEN CASE 
                                                     WHEN ((NVL(RestructurePOS, 0) - NVL(A.CurrentPOS, 0.00)) * 100) / (NVL(RestructurePOS, 0)) > 100
                                                       OR ((NVL(RestructurePOS, 0) - NVL(A.CurrentPOS, 0.00)) * 100) / (NVL(RestructurePOS, 0)) < 0 THEN 0
         ELSE UTILS.CONVERT_TO_NUMBER(utils.round_(((NVL(RestructurePOS, 0) - NVL(A.CurrentPOS, 0.00)) * 100) / (NVL(RestructurePOS, 0)), 2),5,2)
            END
         ELSE 0
            END AS Res_POS_to_CurrentPOS_Per
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Res_POS_to_CurrentPOS_Per -----CAST( (CAST((cast((ISNULL(a.RestructurePOS,0.00)-ISNULL(B.PrincOutStd,0.00)) as decimal(22,2))  /ISNULL(A.RestructurePOS,1)) AS DECIMAL(20,2)))*100 AS DECIMAL(5,2))  
                                       = src.Res_POS_to_CurrentPOS_Per;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('YY', 1, RestructureDt) AS SP_ExpiryDate
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE SP_ExpiryDate IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SP_ExpiryDate = src.SP_ExpiryDate;
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, CASE 
         WHEN NVL(Res_POS_to_CurrentPOS_Per, 0) < 0 THEN 0
         ELSE Res_POS_to_CurrentPOS_Per
            END AS Res_POS_to_CurrentPOS_Per
         FROM a ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A ) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Res_POS_to_CurrentPOS_Per = src.Res_POS_to_CurrentPOS_Per;
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, v_ProcessingDate
         FROM a ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE POS_10PerPaidDate IS NULL
           AND NVL(Res_POS_to_CurrentPOS_Per, 0) >= 10) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.POS_10PerPaidDate = v_ProcessingDate;
         MERGE INTO a 
         USING (SELECT a.ROWID row_id, CASE 
         WHEN A.POS_10PerPaidDate > SP_ExpiryDate THEN A.POS_10PerPaidDate
         ELSE SP_ExpiryDate
            END AS SP_ExpiryDate
         FROM a ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN ADVACRESTRUCTUREDETAIL b   ON a.AccountEntityId = b.AccountEntityId
                AND ( b.EffectiveFromTimeKey <= v_TIMEKEY
                AND b.EffectiveToTimeKey >= v_TIMEKEY )
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = B.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring'
                AND D.ParameterShortNameEnum = 'PRUDENTIAL' 
          WHERE A.POS_10PerPaidDate IS NOT NULL) src
         ON ( a.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SP_ExpiryDate = src.SP_ExpiryDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('YY', 1, ZeroDPD_Date) AS SP_ExpiryExtendedDate
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE ZeroDPD_Date IS NOT NULL
           AND SP_ExpiryExtendedDate IS NULL) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate;
         ----Email Date 16-06-2022 ---For restructure we need some change to be done in pre-existing logic. This will be discuss separately by Ashish/Anirudha.
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, utils.dateadd('YY', 1, DPD_Breach_Date) AS SP_ExpiryExtendedDate
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = A.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE DPD_Breach_Date IS NOT NULL
           AND ZeroDPD_Date IS NULL
           AND SP_ExpiryExtendedDate IS NULL
           AND D.ParameterShortNameEnum IN ( 'MSME_OLD','MSME_COVID','MSME_COVID_RF2' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SP_ExpiryExtendedDate = src.SP_ExpiryExtendedDate;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL
         FROM A ,PRO_RBL_MISDB_PROD.AdvAcRestructureCal A 
          WHERE SP_ExpiryDate > SP_ExpiryExtendedDate) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SP_ExpiryExtendedDate = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 'ALWYS_NPA'
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.AdvAcRestructureCal B   ON A.AccountEntityID = B.AccountEntityId
                JOIN DimParameter D   ON D.EffectiveFromTimeKey <= v_timekey
                AND D.EffectiveToTimeKey >= v_timekey
                AND D.ParameterAlt_Key = B.RestructureTypeAlt_Key
                AND D.DimParameterName = 'TypeofRestructuring' 
          WHERE D.ParameterShortNameEnum = 'PRUDENTIAL') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.ASSET_NORM = 'ALWYS_NPA';
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.PUI_CAL ';
         INSERT INTO PRO_RBL_MISDB_PROD.PUI_CAL
           ( CustomerEntityID, AccountEntityId, ProjectCategoryAlt_Key, ProjectSubCategoryAlt_key, DelayReasonChangeinOwnership, ProjectAuthorityAlt_key, OriginalDCCO, OriginalProjectCost, OriginalDebt, Debt_EquityRatio, ChangeinProjectScope, FreshOriginalDCCO, RevisedDCCO, CourtCaseArbitration, CIOReferenceDate, CIODCCO, TakeOutFinance, AssetClassSellerBookAlt_key, NPADateSellerBook, Restructuring, InitialExtension, BeyonControlofPromoters, DelayReasonOther, FLG_UPG, FLG_DEG, DEFAULT_REASON, ProjCategory, NPA_DATE, PUI_ProvPer, RestructureDate, ActualDCCO, ActualDCCO_Date, UpgradeDate, FinalAssetClassAlt_Key, DPD_Max, EffectiveFromTimeKey, EffectiveToTimeKey, RevisedDebt, CostOverrun, CostOverRunPer, RevisedProjectCost, ProjectOwnerShipAlt_Key )
           ( SELECT A.CustomerEntityID ,
                    B.AccountEntityId ,
                    B.ProjectCategoryAlt_Key ,
                    B.ProjectSubCategoryAlt_key ,
                    c.ChangeinOwnerShip ,
                    B.ProjectAuthorityAlt_key ,
                    B.OriginalDCCO ,
                    B.OriginalProjectCost ,
                    B.OriginalDebt ,
                    B.Debt_EquityRatio ,
                    C.ChangeinProjectScope ,
                    C.FreshOriginalDCCO ,
                    C.RevisedDCCO ,
                    C.CourtCaseArbitration ,
                    C.CIOReferenceDate ,
                    C.CIODCCO ,
                    --,C.CostOverRun,C.RevisedProjectCost,C.RevisedDebt,C.RevisedDebt_EquityRatio,C.AuthorisationStatus  
                    C.TakeOutFinance ,
                    C.AssetClassSellerBookAlt_key ,
                    C.NPADateSellerBook ,
                    C.Restructuring ,
                    --,((C.RevisedProjectCost-B.OriginalProjectCost)*100)/B.OriginalProjectCost OverRunPer   
                    InitialExtenstion ,-- InitialExtension  

                    ExtnReason_BCP ,-- BeyonControlofPromoters  

                    ---,'Y' ChangeInManagement  
                    NULL DelayReasonOther  ,
                    'N' FLG_UPG  ,
                    'N' FLG_DEG  ,
                    UTILS.CONVERT_TO_VARCHAR2(' ',50) DEFAULT_REASON  ,
                    D.ParameterShortNameEnum ProjCategory  ,
                    UTILS.CONVERT_TO_VARCHAR2('',200) NPA_DATE  ,
                    0.00 PUI_ProvPer  ,
                    UTILS.CONVERT_TO_VARCHAR2('',200) RestructureDate  ,
                    ActualDCCO_Achieved ,-- ActualDCCO  

                    ActualDCCO_Date ,
                    UTILS.CONVERT_TO_VARCHAR2('',200) UpgradeDate  ,
                    A.FinalAssetClassAlt_Key ,
                    A.DPD_Max ,
                    v_TimeKey EffectiveFromTimeKey  ,
                    v_TimeKey EffectiveToTimeKey  ,
                    RevisedDebt ,
                    CostOverrun ,
                    UTILS.CONVERT_TO_NUMBER((UTILS.CONVERT_TO_NUMBER((UTILS.CONVERT_TO_NUMBER((NVL(c.RevisedProjectCost, 0.00) - NVL(B.OriginalProjectCost, 0.00)),22,2) / NVL(B.OriginalProjectCost, 1)),20,2)) * 100,5,2) CostOverRunPer  ,
                    RevisedProjectCost ,
                    ProjectOwnerShipAlt_Key 
             FROM tt_ACCOUNTCAL_26 A
                    JOIN RBL_MISDB_PROD.AdvAcPUIDetailMain B   ON A.AccountEntityID = B.AccountEntityId
                    AND ( b.EffectiveFromTimeKey <= v_TimeKey
                    AND b.EffectiveToTimeKey >= v_TimeKey )
                    JOIN RBL_MISDB_PROD.AdvAcPUIDetailSub c   ON A.AccountEntityID = c.AccountEntityID
                    AND ( c.EffectiveFromTimeKey <= v_TimeKey
                    AND c.EffectiveToTimeKey >= v_TimeKey )
                    JOIN DimParameter D   ON ParameterAlt_Key = b.ProjectCategoryAlt_Key
                    AND ( D.EffectiveFromTimeKey <= v_TimeKey
                    AND D.EffectiveToTimeKey >= v_TimeKey )
                    AND DimParameterName = 'ProjectCategory' );
         UPDATE PRO_RBL_MISDB_PROD.PUI_CAL
            SET CostOverRunPer = 0
          WHERE  CostOverRunPer < 0;
         UPDATE PRO_RBL_MISDB_PROD.PUI_CAL
            SET FinnalDCCO_Date = CASE 
                                       WHEN NVL(OriginalDCCO, '1900-01-01') > NVL(CIODCCO, '1900-01-01')
                                         AND NVL(OriginalDCCO, '1900-01-01') > NVL(FreshOriginalDCCO, '1900-01-01') THEN OriginalDCCO
                                       WHEN NVL(CIODCCO, '1900-01-01') > NVL(OriginalDCCO, '1900-01-01')
                                         AND NVL(CIODCCO, '1900-01-01') > NVL(FreshOriginalDCCO, '1900-01-01') THEN CIODCCO
                                       WHEN NVL(FreshOriginalDCCO, '1900-01-01') > NVL(CIODCCO, '1900-01-01')
                                         AND NVL(FreshOriginalDCCO, '1900-01-01') > NVL(OriginalDCCO, '1900-01-01') THEN FreshOriginalDCCO
                ELSE '1900-01-01'
                   END;
         /* END OF PUI WORK*/
         ---case when NPA_DateSeller>=FinalNpaDt then FinalNpaDt else NPA_DateSeller end
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN NPA_DateSeller IS NOT NULL
           AND A.FinalAssetClassAlt_Key = 1 THEN 2
         ELSE A.FinalAssetClassAlt_Key
            END AS pos_2, CASE 
         WHEN NPA_DateSeller IS NOT NULL
           AND A.FinalAssetClassAlt_Key = 1 THEN NVL(NPA_DateSeller, b.DateofData)
         ELSE (CASE 
         WHEN NPA_DateSeller IS NOT NULL
           AND NVL(NPA_DateSeller, B.DateofData) < FinalNpaDt THEN NPA_DateSeller
         ELSE FinalNpaDt
            END)
            END AS pos_3, CASE 
         WHEN NPA_DateSeller IS NOT NULL THEN 'ALWYS_NPA'
         ELSE A.Asset_Norm
            END AS pos_4, CASE 
         WHEN NPA_DateSeller IS NOT NULL THEN 'NPA with Seller'
         ELSE A.NPA_Reason
            END AS pos_5
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = pos_2,
                                      A.FinalNpaDt = pos_3,
                                      A.Asset_Norm = pos_4,
                                      A.NPA_Reason = pos_5;
         MERGE INTO C 
         USING (SELECT C.ROWID row_id, CASE 
         WHEN NPA_DateSeller IS NOT NULL
           AND C.SysAssetClassAlt_Key = 1 THEN 2
         ELSE C.SysAssetClassAlt_Key
            END AS pos_2, CASE 
         WHEN NPA_DateSeller IS NOT NULL
           AND C.SysAssetClassAlt_Key = 1 THEN NVL(NPA_DateSeller, b.DateofData)
         ELSE (CASE 
         WHEN NPA_DateSeller IS NOT NULL
           AND NVL(NPA_DateSeller, B.DateofData) < SysNPA_Dt THEN NPA_DateSeller
         ELSE SysNPA_Dt
            END)
            END AS pos_3, CASE 
         WHEN NPA_DateSeller IS NOT NULL THEN 'ALWYS_NPA'
         ELSE A.Asset_Norm
            END AS pos_4, CASE 
         WHEN NPA_DateSeller IS NOT NULL THEN 'NPA with Seller'
         ELSE C.DegReason
            END AS pos_5
         FROM C ,tt_ACCOUNTCAL_26 A
                JOIN PRO_RBL_MISDB_PROD.BuyoutUploadDetailsCal B   ON A.CustomerAcID = B.CustomerAcID
                JOIN tt_CUSTOMERCAL_23 C   ON A.CustomerEntityID = C.CustomerEntityID ) src
         ON ( C.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = pos_2,
                                      C.SysNPA_Dt = pos_3,
                                      A.Asset_Norm = pos_4,
                                      C.DegReason = pos_5;
         /*  UPDATE MOC AND ADHOC CHANGES */
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'MOC UPDATES AUTO AND MANUAL' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         /* ADHOC CHANGE WORK */
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPA_Date, 'ALWYS_NPA', B.Reason, 'NPA DUE TO Adhoc' AS pos_6, B.DATECREATED
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN AdhocACL_ChangeDetails B   ON A.CustomerEntityId = B.CustomerEntityId
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME <> 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                      A.SYSNPA_DT = src.NPA_Date,
                                      A.ASSET_NORM = 'ALWYS_NPA',
                                      A.MOCREASON = src.Reason,
                                      DA.DEGREASON = pos_6,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPA_Date, 'ALWYS_NPA', B.Reason, 'NPA DUE TO Adhoc' AS pos_6, B.DATECREATED
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN AdhocACL_ChangeDetails B   ON A.UcifEntityID = B.UcifEntityID
                AND NVL(A.UcifEntityID, 0) <> 0
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME <> 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                      A.SYSNPA_DT = src.NPA_Date,
                                      A.ASSET_NORM = 'ALWYS_NPA',
                                      A.MOCREASON = src.Reason,
                                      DA.DEGREASON = pos_6,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, NULL, 'ALWYS_STD', B.REASON, 'STD DUE TO Adhoc' AS pos_7, B.DATECREATED
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN AdhocACL_ChangeDetails B   ON A.CustomerEntityId = B.CustomerEntityId
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME = 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                      A.SYSNPA_DT = NULL,
                                      A.DBTDT = NULL,
                                      A.ASSET_NORM = 'ALWYS_STD',
                                      A.MOCREASON = src.REASON,
                                      DA.DEGREASON = pos_7,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, NULL, 'ALWYS_STD', B.REASON, 'STD DUE TO Adhoc' AS pos_7, B.DATECREATED
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN AdhocACL_ChangeDetails B   ON A.UcifEntityID = B.UcifEntityID
                AND NVL(A.UcifEntityID, 0) <> 0
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME = 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SYSASSETCLASSALT_KEY = src.ASSETCLASSALT_KEY,
                                      A.SYSNPA_DT = NULL,
                                      A.DBTDT = NULL,
                                      A.ASSET_NORM = 'ALWYS_STD',
                                      A.MOCREASON = src.REASON,
                                      DA.DEGREASON = pos_7,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPA_Date, 'ALWYS_NPA', B.REASON, 'NPA DUE TO Adhoc' AS pos_6, B.DATECREATED
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdhocACL_ChangeDetails B   ON A.CustomerEntityId = B.CustomerEntityId
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME <> 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                      A.FinalNpaDt = src.NPA_Date,
                                      A.ASSET_NORM = 'ALWYS_NPA',
                                      A.MOCREASON = src.REASON,
                                      A.DEGREASON = pos_6,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, B.NPA_Date, 'ALWYS_NPA', B.REASON, 'NPA DUE TO Adhoc' AS pos_6, B.DATECREATED
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdhocACL_ChangeDetails B   ON A.UcifEntityID = B.UcifEntityID
                AND NVL(A.UcifEntityID, 0) <> 0
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME <> 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                      A.FinalNpaDt = src.NPA_Date,
                                      A.ASSET_NORM = 'ALWYS_NPA',
                                      A.MOCREASON = src.REASON,
                                      A.DEGREASON = pos_6,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, 'ALWYS_STD', B.REASON, 'STD DUE TO Adhoc' AS pos_6, B.DATECREATED
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdhocACL_ChangeDetails B   ON A.CustomerEntityId = B.CustomerEntityId
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME = 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                      A.FinalNpaDt = NULL,
                                      A.ASSET_NORM = 'ALWYS_STD',
                                      A.MOCREASON = src.REASON,
                                      A.DEGREASON = pos_6,
                                      A.MOC_DT = src.DATECREATED;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, DA.ASSETCLASSALT_KEY, NULL, 'ALWYS_STD', B.REASON, 'STD DUE TO Adhoc' AS pos_6, B.DATECREATED
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN AdhocACL_ChangeDetails B   ON A.UcifEntityID = B.UcifEntityID
                AND NVL(A.UcifEntityID, 0) <> 0
                JOIN DIMASSETCLASS DA   ON DA.AssetClassAlt_Key = B.AssetClassAlt_Key
                AND DA.ASSETCLASSSHORTNAME = 'STD'
                AND DA.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                AND DA.EFFECTIVETOTIMEKEY >= v_TIMEKEY 
          WHERE B.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND B.EFFECTIVETOTIMEKEY >= v_TIMEKEY) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = src.ASSETCLASSALT_KEY,
                                      A.FinalNpaDt = NULL,
                                      A.ASSET_NORM = 'ALWYS_STD',
                                      A.MOCREASON = src.REASON,
                                      A.DEGREASON = pos_6,
                                      A.MOC_DT = src.DATECREATED;
         /* AMAR 20092023 CHANGES FOR ACCOUNT UPGRADE FROM ADHOC -- EXCEPTION DETAIL DATA FOR WOR/TE */
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_ADHOC_UcifEntityID_STD_2  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_ADHOC_UcifEntityID_STD_2;
         UTILS.IDENTITY_RESET('tt_ADHOC_UcifEntityID_STD_2');

         INSERT INTO tt_ADHOC_UcifEntityID_STD_2 ( 
         	SELECT UcifEntityID 
         	  FROM AdhocACL_ChangeDetails 
         	 WHERE  EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                    AND EFFECTIVETOTIMEKEY >= v_TIMEKEY
                    AND AssetClassAlt_Key = 1 );
         WITH CTE_A AS ( SELECT CUSTOMERENTITYID 
           FROM tt_ADHOC_UcifEntityID_STD_2 A
                  JOIN CUSTOMERBASICDETAIL B   ON A.UcifEntityID = B.UcifEntityID
           GROUP BY CUSTOMERENTITYID ),
         CTE_B AS ( SELECT CUSTOMERACID 
           FROM CTE_A A
                  JOIN AdvAcBasicDetail B   ON A.CustomerEntityId = B.CustomerEntityId
           GROUP BY CUSTOMERACID ) 
            MERGE INTO C 
            USING (SELECT C.ROWID row_id, v_TIMEKEY
            FROM C ,CTE_B A
                   JOIN ExceptionFinalStatusType C   ON A.CustomerAcID = C.ACID
                   AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                   AND C.StatusType IN ( 'Settlement','TWO','Charge Off','WO' )
                  ) src
            ON ( C.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET C.EFFECTIVETOTIMEKEY = v_TIMEKEY
            ;
         /*END EXCEPTION DATA EXPIRE - BY ADHOC CHANGE UPGRADE*/
         UPDATE AdhocACL_ChangeDetails
            SET EFFECTIVETOTIMEKEY = v_TIMEKEY
          WHERE  EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
           AND EFFECTIVETOTIMEKEY >= v_TIMEKEY;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, v_TIMEKEY
         FROM A ,MOC_ChangeDetails A 
          WHERE A.EffectiveFromTimeKey <= v_TIMEKEY
           AND a.EffectiveToTimeKey >= v_TIMEKEY
           AND A.MOCTYPE = 'AUTO') src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.EffectiveToTimeKey = v_TIMEKEY;
         IF  --SQLDEV: NOT RECOGNIZED
         IF tt_MOC_DATA_3  --SQLDEV: NOT RECOGNIZED
         DELETE FROM tt_MOC_DATA_3;
         UTILS.IDENTITY_RESET('tt_MOC_DATA_3');

         INSERT INTO tt_MOC_DATA_3 ( 
         	SELECT UcifEntityID ,
                 MAX(AssetClassAlt_Key)  SysAssetClassAlt_Key  ,
                 MIN(Npa_date)  SysNPA_Dt  ,
                 'Manual' MOCTYPE  ,
                 A.EffectiveFromTimeKey 
         	  FROM MOC_ChangeDetails A
                   JOIN tt_ACCOUNTCAL_26 B   ON A.CustomerEntityID = b.CustomerEntityID
         	 WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                    AND a.EffectiveToTimeKey >= v_TIMEKEY
                    AND ( MOC_ExpireDate >= v_ProcessingDate )

                    -- AND A.EffectiveFromTimeKey >= @PrevQtrTimeKey  -------------- Commented by Sudesh 17032023 ------ MOC Manual Carry forward issue fix--------
                    AND MOCType_Flag = 'CUST'

                    ----AND ISNULL(AssetClassAlt_Key,0)>0  
                    AND a.MOCTYPE = 'Manual'
         	  GROUP BY UcifEntityID,A.EffectiveFromTimeKey );
         INSERT INTO tt_MOC_DATA_3
           ( SELECT UcifEntityID ,
                    MAX(AssetClassAlt_Key)  SysAssetClassAlt_Key  ,
                    MIN(Npa_date)  SysNPA_Dt  ,
                    'Auto' MOCTYPE  ,
                    A.EffectiveFromTimeKey 
             FROM MOC_ChangeDetails A
                    JOIN tt_ACCOUNTCAL_26 B   ON A.CustomerEntityID = b.CustomerEntityID
              WHERE  A.EffectiveFromTimeKey <= v_TIMEKEY
                       AND a.EffectiveToTimeKey >= v_TIMEKEY
                       AND MOCType_Flag = 'CUST'

                       ----AND ISNULL(AssetClassAlt_Key,0)>0  
                       AND a.MOCTYPE = 'Auto'
                       AND b.UcifEntityID NOT IN ( SELECT UcifEntityID 
                                                   FROM tt_MOC_DATA_3  )

               GROUP BY UcifEntityID,A.EffectiveFromTimeKey );
         /* AMAR 20092023 CHANGES FOR ACCOUNT UPGRADE FROM ADHOC -- EXCEPTION DETAIL DATA FOR WOR/TE */
         WITH CTE_A AS ( SELECT CUSTOMERENTITYID 
           FROM tt_MOC_DATA_3 A
                  JOIN CUSTOMERBASICDETAIL B   ON A.UcifEntityID = B.UcifEntityID
          WHERE  A.SysAssetClassAlt_Key = 1
           GROUP BY CUSTOMERENTITYID ),
         CTE_B AS ( SELECT CUSTOMERACID 
           FROM CTE_A A
                  JOIN AdvAcBasicDetail B   ON A.CustomerEntityId = B.CustomerEntityId
           GROUP BY CUSTOMERACID ) 
            MERGE INTO C 
            USING (SELECT C.ROWID row_id, v_TIMEKEY
            FROM C ,CTE_B A
                   JOIN ExceptionFinalStatusType C   ON A.CustomerAcID = C.ACID
                   AND C.EFFECTIVEFROMTIMEKEY <= v_TIMEKEY
                   AND C.EFFECTIVETOTIMEKEY >= v_TIMEKEY
                   AND C.StatusType IN ( 'Settlement','TWO','Charge Off','WO' )
                  ) src
            ON ( C.ROWID = src.row_id )
            WHEN MATCHED THEN UPDATE SET C.EFFECTIVETOTIMEKEY = v_TIMEKEY
            ;
         /*END EXCEPTION DATA EXPIRE-- BY MOC UPGRADE*/
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN B.SysAssetClassAlt_Key = 1 THEN 'ALWYS_STD'
         ELSE 'ALWYS_NPA'
            END AS pos_2, b.MOCTYPE
         -- ,SysAssetClassAlt_Key=isnull(B.SysAssetClassAlt_Key,a.SysAssetClassAlt_Key)  
          -- ,SysNPA_Dt=case when  b.SysNPA_Dt <a.SysNPA_Dt then b.SysNPA_Dt else  isnull(A.SysNPA_Dt,B.SysNPA_Dt)  end ---email Dated 16-06-2022--For some cases there is change in NPA date from 31 March 2022 QTR v/s 31 May 2022 output
          -- Change date 01/03/2023 - referance mail from sunita maity mail date -  06/02/2023 05.55PM
         , NVL(B.SysNPA_Dt, A.SysNPA_Dt) AS pos_4
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_MOC_DATA_3 B   ON A.UcifEntityID = B.UcifEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = pos_2,
                                      MOCTYPE = src.MOCTYPE,
                                      SysNPA_Dt = pos_4;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN B.SysAssetClassAlt_Key = 1 THEN 'ALWYS_STD'
         ELSE 'ALWYS_NPA'
            END AS pos_2, b.MOCTYPE
         -- ,FinalAssetClassAlt_Key=isnull(B.SysAssetClassAlt_Key,a.FinalAssetClassAlt_Key)  
          --,FinalNpaDt=case when  b.SysNPA_Dt <a.FinalNpaDt then b.SysNPA_Dt else isnull(a.FinalNpaDt,b.SysNPA_Dt) end ---email Dated 16-06-2022--For some cases there is change in NPA date from 31 March 2022 QTR v/s 31 May 2022 output
         , b.SysNPA_Dt --AddedBy mandeep/Sudesh (Mail Date-(18-02-2023) Subject-#Prod Issue: Moc Issue)

         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_MOC_DATA_3 B   ON A.UcifEntityID = B.UcifEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm = pos_2,
                                      A.MOCTYPE = src.MOCTYPE,
                                      A.FinalNpaDt = src.SysNPA_Dt;
         ----------------------------ADDED BY PRASHANT AS PER SUNITA---- DATED MAIL 22-09-2022 ------------------------------------------------------------------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN B.SysAssetClassAlt_Key = 1 THEN 'ALWYS_STD'
         ELSE 'ALWYS_NPA'
            END AS pos_2, NVL(B.SysAssetClassAlt_Key, a.SysAssetClassAlt_Key) AS pos_3
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_MOC_DATA_3 B   ON A.UcifEntityID = B.UcifEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm
                                      -- ,MOCTYPE=b.MOCTYPE  
                                       /* ---commented by mandeep to carry forward Asset Class of MOC --
                                          ,SysAssetClassAlt_Key=case when  b.effectivefromtimekey >= @PrevQtrTimeKey then  isnull(B.SysAssetClassAlt_Key,a.SysAssetClassAlt_Key)
                                      						  else isnull(a.SysAssetClassAlt_Key,b.SysAssetClassAlt_Key) end
                                      	  */ = pos_2,
                                      SysAssetClassAlt_Key
                                      -- ,SysNPA_Dt=case when  b.SysNPA_Dt <a.SysNPA_Dt then b.SysNPA_Dt else  isnull(A.SysNPA_Dt,B.SysNPA_Dt)  end ---email Dated 16-06-2022--For some cases there is change in NPA date from 31 March 2022 QTR v/s 31 May 2022 output
                                       = pos_3;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, CASE 
         WHEN B.SysAssetClassAlt_Key = 1 THEN 'ALWYS_STD'
         ELSE 'ALWYS_NPA'
            END AS pos_2, NVL(B.SysAssetClassAlt_Key, a.FinalAssetClassAlt_Key) AS pos_3
         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_MOC_DATA_3 B   ON A.UcifEntityID = B.UcifEntityID ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.Asset_Norm
                                      --,MOCTYPE=b.MOCTYPE  
                                       /* ---commented by mandeep to carry forward Asset Class of MOC --
                                          ,FinalAssetClassAlt_Key=case when  b.effectivefromtimekey >= @PrevQtrTimeKey then  isnull(B.SysAssetClassAlt_Key,a.FinalAssetClassAlt_Key) 
                                      								else isnull(a.FinalAssetClassAlt_Key,b.SysAssetClassAlt_Key) end
                                      	*/ = pos_2,
                                      A.FinalAssetClassAlt_Key = pos_3;
         -------------------------------------------------------------------------------------------------------
         /*ADDED BY AMAR ON 21-06-2022 REMOVE FLAG ALWYS_STD AND ALWYS_NPA FOR BUYOUT ACCOUNT AS PER EMAIL DATED 20-06-2022 AT 3:39PM BY ASHISH SIR  AND ALSO CONFIRMATION BY SITARAM SIR EMAIL DATED 20-06-2022 AT 4:30*/
         --commented by mandeep with approval of jaydev sir (logic removed for buyout moc carry forward--20/03/2023)
         /*	  UPDATE A
         		SET  A.Asset_Norm='NORMAL'
         			,A.FinalAssetClassAlt_Key =A.InitialAssetClassAlt_Key
         			,A.FinalNpaDt =A.InitialNpaDt
         	  FROM tt_ACCOUNTCAL_26 A  
         	  INNER JOIN PRO.BuyoutUploadDetailsCal B  
         			ON A.AccountEntityID=B.AccountEntityID
         		WHERE isnull(A.Asset_Norm,'')<>'NORMAL'


         				  UPDATE C
         		SET  c.Asset_Norm='NORMAL'
         			,c.SysAssetClassAlt_Key =c.SrcAssetClassAlt_Key
         			,c.SysNPA_Dt =c.SrcNPA_Dt
         	  FROM tt_CUSTOMERCAL_23 c
         	  inner join tt_ACCOUNTCAL_26 A  
         	  on         a.CustomerEntityID=c.CustomerEntityID
         	  INNER JOIN PRO.BuyoutUploadDetailsCal B  
         			ON A.AccountEntityID=B.AccountEntityID
         		WHERE isnull(C.Asset_Norm,'')<>'NORMAL' */
         /*END OF BUYOUT CHANGES */
         /* UPDATE NPA COLUMNS IN CASE OF NPA MARKED 'Y' IN SELLER BOOK */
         /*END OF BUYOUT CHANGES */
         --------------------------Added by Prashant under guidence of Amar sir and Ashish Sir--------29-10-2022-------------------------------
         --IF OBJECT_ID('TEMPDB..tt_UpdateTempAssetclassAsse_2') IS NOT NULL  
         -- DROP TABLE  tt_UpdateTempAssetclassAsse_2  
         --select a.CustomerEntityID, count(a.CustomerAcID) CNT
         --into          tt_UpdateTempAssetclassAsse_2
         --from		  tt_ACCOUNTCAL_26 a
         --inner join    tt_CUSTOMERCAL_23 b
         --on            a.CustomerEntityID=b.CustomerEntityID
         --group by      a.CustomerEntityID
         --having    count(a.CustomerAcID)=1
         --UPDATE         A
         --SET			   A.SysAssetClassAlt_Key=B.FinalAssetClassAlt_Key,A.SysNPA_Dt=B.FinalNpaDt ,a.Asset_Norm=b.Asset_Norm
         --from           tt_CUSTOMERCAL_23 A
         --INNER JOIN	   tt_ACCOUNTCAL_26  B
         --ON             A.CustomerEntityID=B.CustomerEntityID
         --INNER JOIN     tt_UpdateTempAssetclassAsse_2 C
         --ON             A.CustomerEntityID=C.CustomerEntityID
         --where          a.SysAssetClassAlt_Key<>b.FinalAssetClassAlt_Key
         ---------------------------------------------------END-------------------------------------------------------------------------------
         ------------------------Added by Prashant under guidence of Amar sir and Ashish Sir--------29102022-------------------------------
         IF utils.object_id('TEMPDB..tt_UpdateTempAssetclassAsse_2') IS NOT NULL THEN
          --------------------------COBORROWER WORK ADDED BY MANDEEP -------------------------------------------------------------------------
         EXECUTE IMMEDIATE ' TRUNCATE TABLE tt_UpdateTempAssetclassAsse_2 ';
         END IF;
         DELETE FROM tt_UpdateTempAssetclassAsse_2;
         UTILS.IDENTITY_RESET('tt_UpdateTempAssetclassAsse_2');

         INSERT INTO tt_UpdateTempAssetclassAsse_2 ( 
         	SELECT a.CustomerEntityID ,
                 COUNT(a.CustomerAcID)  CNT  
         	  FROM tt_ACCOUNTCAL_26 a
                   JOIN tt_CUSTOMERCAL_23 b   ON a.CustomerEntityID = b.CustomerEntityID
         	  GROUP BY a.CustomerEntityID

         	   HAVING COUNT(a.CustomerAcID)  = 1 );
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, 1, NULL
         --SELECT *

         FROM A ,tt_ACCOUNTCAL_26 A
                JOIN tt_UpdateTempAssetclassAsse_2 C   ON A.CustomerEntityID = C.CustomerEntityID 
          WHERE A.Asset_Norm = 'ALWYS_STD'
           AND a.ProductCode IN ( SELECT ProductCode 
                                  FROM DimProduct 
                                   WHERE  ProductGroup = 'FDSEC'
                                            AND EffectiveToTimeKey = 49999 )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalAssetClassAlt_Key = 1,
                                      A.FinalNpaDt = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, B.FinalAssetClassAlt_Key, B.FinalNpaDt, b.Asset_Norm
         FROM A ,tt_CUSTOMERCAL_23 A
                JOIN tt_ACCOUNTCAL_26 B   ON A.CustomerEntityID = B.CustomerEntityID
                JOIN tt_UpdateTempAssetclassAsse_2 C   ON A.CustomerEntityID = C.CustomerEntityID 
          WHERE a.SysAssetClassAlt_Key <> b.FinalAssetClassAlt_Key) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysAssetClassAlt_Key = src.FinalAssetClassAlt_Key,
                                      A.SysNPA_Dt = src.FinalNpaDt,
                                      a.Asset_Norm = src.Asset_Norm;
         -------------------------------------------------END-------------------------------------------------------------------------------
         ----Added By Mandeep 10-07-2023 to remove NPA reason of STD account---------------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL
         FROM A ,tt_ACCOUNTCAL_26 A 
          WHERE A.FinalAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.FinalNpaDt = NULL,
                                      A.NPA_Reason = NULL;
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, NULL, NULL
         FROM A ,tt_CUSTOMERCAL_23 A 
          WHERE A.SysAssetClassAlt_Key = 1) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.SysNPA_Dt = NULL,
                                      A.DegReason = NULL;
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'MOC UPDATES AUTO AND MANUAL';
         -------------------------------------------------END-------------------------------------------------------------------------------
         INSERT INTO PRO_RBL_MISDB_PROD.ProcessMonitor
           ( UserID, DESCRIPTION, MODE_, StartTime, EndTime, TimeKey, SetID )
           ( SELECT USER ,
                    'CoBorrower' ,
                    'RUNNING' ,
                    SYSDATE ,
                    NULL ,
                    v_TIMEKEY ,
                    v_SetID 
               FROM DUAL  );
         EXECUTE IMMEDIATE ' TRUNCATE TABLE PRO_RBL_MISDB_PROD.CoBorrowerCal ';
         INSERT INTO PRO_RBL_MISDB_PROD.CoBorrowerCal
           ( CustomerACID, CustomerID, UCIC, CustomerType, Cohort_No, TIMEKEY )
           ( SELECT CustomerACID ,
                    CustomerID ,
                    UCIC ,
                    CustomerType ,
                    Cohort_No ,
                    TimeKey 
             FROM RBL_MISDB_PROD.CoBorrowerData 
              WHERE  TIMEKEY = v_TIMEKEY );
         --Update main cust id for main customertype-------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, A.CustomerID
         FROM A ,PRO_RBL_MISDB_PROD.CoBorrowerCal A 
          WHERE A.CustomerType IN ( 'MAIN','Link','BORROWER' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.MainCUSTID = src.CustomerID;
         --IF CustomerAcid is same for two records and one is coborrower and other is main then update coborrower maincustid=custid of main
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.CustomerID
         FROM B ,PRO_RBL_MISDB_PROD.CoBorrowerCal A
                JOIN PRO_RBL_MISDB_PROD.CoBorrowerCal B   ON A.CustomerACID = B.CustomerACID
                AND B.CustomerType IN ( 'COBORROWER','CO_OBLIGANT' )

          WHERE A.CustomerType IN ( 'MAIN','Link','BORROWER' )
         ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.MainCUSTID = src.CustomerID;
         --Update main UCIC id for main customertype-------------
         MERGE INTO A 
         USING (SELECT A.ROWID row_id, A.UCIC
         FROM A ,PRO_RBL_MISDB_PROD.CoBorrowerCal A 
          WHERE A.CustomerType IN ( 'MAIN','Link','BORROWER' )
         ) src
         ON ( A.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET A.NPA_UCIC_ID = src.UCIC;
         --IF CustomerAcid is same for two records and one is coborrower and other is main then update coborrower NPAUCIC=UCIC of main
         MERGE INTO B 
         USING (SELECT B.ROWID row_id, A.UCIC
         FROM B ,PRO_RBL_MISDB_PROD.CoBorrowerCal A
                JOIN PRO_RBL_MISDB_PROD.CoBorrowerCal B   ON A.CustomerACID = B.CustomerACID
                AND B.CustomerType IN ( 'COBORROWER','CO_OBLIGANT' )

          WHERE A.CustomerType IN ( 'MAIN','Link','BORROWER' )
         ) src
         ON ( B.ROWID = src.row_id )
         WHEN MATCHED THEN UPDATE SET B.NPA_UCIC_ID = src.UCIC;
         -------------------------------------------------END-------------------------------------------------------------------------------
         UPDATE PRO_RBL_MISDB_PROD.ProcessMonitor
            SET ENDTIME = SYSDATE,
                MODE_ = 'COMPLETE'
          WHERE  IdentityKey = ( SELECT /*TODO:SQLDEV*/ IDENT_CURRENT('PRO.PROCESSMONITOR') /*END:SQLDEV*/ 
                                   FROM DUAL  )
           AND TIMEKEY = v_TIMEKEY
           AND DESCRIPTION = 'CoBorrower';
         UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
            SET COMPLETED = 'Y',
                ERRORDATE = NULL,
                ERRORDESCRIPTION = NULL,
                COUNT = NVL(COUNT, 0) + 1
          WHERE  RUNNINGPROCESSNAME = 'InsertDataforAssetClassficationRBL';

      END;
   EXCEPTION
      WHEN OTHERS THEN

   BEGIN
      UPDATE PRO_RBL_MISDB_PROD.AclRunningProcessStatus
         SET COMPLETED = 'N',
             ERRORDATE = SYSDATE,
             ERRORDESCRIPTION = SQLERRM,
             COUNT = NVL(COUNT, 0) + 1
       WHERE  RUNNINGPROCESSNAME = 'InsertDataforAssetClassficationRBL';

   END;END;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ROLE_LOCAL_RBL_MISDB_PROD_ORACLE";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "MAIN_PRO"."INSERTDATAFORASSETCLASSFICATIONRBL_02052024" TO "ADF_CDR_RBL_STGDB";
