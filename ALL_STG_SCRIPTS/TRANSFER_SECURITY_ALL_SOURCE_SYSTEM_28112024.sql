--------------------------------------------------------
--  DDL for Procedure TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" 
AS
   v_DATE VARCHAR2(200) := ( SELECT DISTINCT UTILS.CONVERT_TO_VARCHAR2(DateofData,200) 
     FROM ACCOUNT_ALL_SOURCE_SYSTEM  );

BEGIN

   /*TODO:SQLDEV*/ SET DATEFORMAT DMY /*END:SQLDEV*/
   /*TODO:SQLDEV*/ SET DATEFORMAT DMY /*END:SQLDEV*/
   EXECUTE IMMEDIATE ' TRUNCATE TABLE RBL_STGDB.Security_All_Source_System ';
   INSERT INTO RBL_STGDB.Security_All_Source_System
     ( DateofData, SourceSystem, AccountID, CollateralID, SecurityCode, SecurityValue, Valuationdate, SecurityChargeStatus, ValuationExpiryDate, CustomerID, CaratValue, GoldWeightNetGms, Security_ID, Charge_Type_Code, Valuation_Source, Collateral_Type )
     ( 
       -------------    MIFIN  ---------  
       SELECT A.DateofData ,
              SourceSystem ,
              AccountID ,
              NULL CollateralID  ,
              NULL SecurityCode  ,
              (GoldWeightNetGms * RATE) SecurityValue  ,
              NULL Valuationdate  ,
              NULL SecurityChargeStatus  ,
              NULL ValuationExpiryDate  ,
              CustomerID ,
              CaratValue ,
              GoldWeightNetGms ,
              NULL Security_ID  ,
              NULL Charge_Type_Code  ,
              NULL Valuation_Source  ,
              NULL Collateral_Type  
       FROM RBL_STGDB.SECURITY_SOURCESYSTEM04_STG a
              JOIN dwh_dwh_stg.MIFINGOLDMASTER b   ON a.CaratValue = b.CaratMarket );
   --=========Added by Prashant 01-10-2022 as per Ashish sir under guidence of Amar sir=========================================
   -----------------------------------------------------------------------------------------------------------------------------------------
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_temp123_5  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_temp123_5;
   UTILS.IDENTITY_RESET('tt_temp123_5');

   INSERT INTO tt_temp123_5 SELECT DISTINCT Customer_ID ,
                                            apportioned_value Totalapportioned_value  ,
                                            CollateralID ,
                                            CustomerAcID ,
                                            Scheme_ProductCode ,
                                            SecurityCode ,
                                            SecurityValue ,
                                            ValuationExpiryDate ,
                                            Collateral_Type ,
                                            b.BalanceOutstandingINR ,
                                            POSBalance ,
                                            c.BalanceOutstandingINR TotalBalanceOutstandingINR  ,
                                            (b.BalanceOutstandingINR * 100) / c.BalanceOutstandingINR BalanceOutstandingINR_  ,
                                            (apportioned_value * ((b.BalanceOutstandingINR * 100) / c.BalanceOutstandingINR)) / 100 security  ,
                                            Valuationdate ,
                                            Type_Of_Currency 
        FROM ( SELECT Customer_ID ,
                      CollateralID ,
                      SecurityCode ,
                      SecurityValue ,
                      ValuationExpiryDate ,
                      Collateral_Type ,
                      SUM(apportioned_value)  apportioned_value  ,
                      Valuationdate ,
                      Type_Of_Currency 
               FROM SECURITY_SOURCESYSTEM01_STG 
                WHERE  Collateral_Type = 'Deposits'
                         AND SecurityCode <> 'DSRA'
                         AND NVL(AccountID, ' ') = ' '
                 GROUP BY Customer_ID,CollateralID,SecurityCode,SecurityValue,ValuationExpiryDate,Collateral_Type,Valuationdate,Type_Of_Currency ) a
               JOIN ( SELECT CustomerID ,
                             CustomerAcID ,
                             Scheme_ProductCode ,
                             BalanceOutstandingINR ,
                             POSBalance 
                      FROM ACCOUNT_SOURCESYSTEM01_STG 
                       WHERE  Scheme_ProductCode IN ( SELECT ProductCode 
                                                      FROM RBL_MISDB_PROD.DimProduct 
                                                       WHERE  ProductGroup = 'FDSEC' )

                                AND NVL(BalanceOutstandingINR, 0) > 0 ) B   ON A.Customer_ID = B.CustomerID
               JOIN ( SELECT CustomerID ,
                             SUM(BalanceOutstandingINR)  BalanceOutstandingINR  
                      FROM ACCOUNT_SOURCESYSTEM01_STG 
                       WHERE  Scheme_ProductCode IN ( SELECT ProductCode 
                                                      FROM RBL_MISDB_PROD.DimProduct 
                                                       WHERE  ProductGroup = 'FDSEC' )

                                AND NVL(BalanceOutstandingINR, 0) > 0
                        GROUP BY CustomerID ) c   ON C.CustomerID = B.CustomerID
        ORDER BY 
                 --where c.CustomerID='20103947'

                 --group by Customer_ID
                 1;
   -------------------------------------------------------------------------------------------------------------------------
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_temp456_5  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_temp456_5;
   UTILS.IDENTITY_RESET('tt_temp456_5');

   INSERT INTO tt_temp456_5 SELECT CustomerID ,
                                   CustomerAcID ,
                                   Scheme_ProductCode ,
                                   BalanceOutstandingINR ,
                                   POSBalance ,
                                   CollateralID ,
                                   SecurityCode ,
                                   SecurityValue ,
                                   ValuationExpiryDate ,
                                   Collateral_Type ,
                                   apportioned_value ,
                                   Valuationdate ,
                                   Sec_Perf_Flg ,
                                   Type_Of_Currency 
        FROM ( SELECT CustomerID ,
                      CustomerAcID ,
                      Scheme_ProductCode ,
                      BalanceOutstandingINR ,
                      POSBalance 
               FROM ACCOUNT_SOURCESYSTEM01_STG 
                WHERE  Scheme_ProductCode IN ( SELECT DISTINCT ProductCode 
                                               FROM RBL_MISDB_PROD.DimProduct 
                                                WHERE  ProductGroup = 'FDSEC'
                                                         AND EffectiveToTimeKey = 49999 )

                         AND NVL(BalanceOutstandingINR, 0) > 0 ) A
               LEFT JOIN ( SELECT ACCOUNTID ,
                                  Customer_ID ,
                                  CollateralID ,
                                  SecurityCode ,
                                  SecurityValue ,
                                  ValuationExpiryDate ,
                                  Collateral_Type ,
                                  apportioned_value ,
                                  Valuationdate ,
                                  Sec_Perf_Flg ,
                                  Type_Of_Currency 
                           FROM SECURITY_SOURCESYSTEM01_STG 
                            WHERE  Collateral_Type = 'Deposits'
                                     AND SecurityCode <> 'DSRA'
                                     AND NVL(AccountID, ' ') <> ' ' ) B   ON A.CustomerAcID = B.AccountID
        ORDER BY 6;
   ------------------------------------------------------------------------------------------------------------------------
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_tempwer12_5  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_tempwer12_5;
   UTILS.IDENTITY_RESET('tt_tempwer12_5');

   INSERT INTO tt_tempwer12_5 ( 
   	SELECT * 
   	  FROM ( SELECT DISTINCT A.CustomerID ,
                             A.CustomerAcID ,
                             A.Scheme_ProductCode ,
                             A.BalanceOutstandingINR ,
                             A.POSBalance ,
                             CASE 
                                  WHEN A.CollateralID IS NULL THEN B.CollateralID
                             ELSE A.CollateralID
                                END CollateralID  ,
                             CASE 
                                  WHEN A.SecurityCode IS NULL THEN B.SecurityCode
                             ELSE A.SecurityCode
                                END SecurityCode  ,
                             CASE 
                                  WHEN A.SecurityValue IS NULL THEN B.SecurityValue
                             ELSE A.SecurityValue
                                END SecurityValue  ,
                             CASE 
                                  WHEN A.ValuationExpiryDate IS NULL THEN B.ValuationExpiryDate
                             ELSE A.ValuationExpiryDate
                                END ValuationExpiryDate  ,
                             CASE 
                                  WHEN A.Collateral_Type IS NULL THEN B.Collateral_Type
                             ELSE A.Collateral_Type
                                END Collateral_Type  ,
                             CASE 
                                  WHEN A.apportioned_value IS NULL THEN B.security
                             ELSE A.apportioned_value
                                END apportioned_value  ,
                             CASE 
                                  WHEN A.Valuationdate IS NULL THEN B.Valuationdate
                             ELSE A.Valuationdate
                                END Valuationdate  ,
                             A.Sec_Perf_Flg ,
                             NVL(b.Type_Of_Currency, a.Type_Of_Currency) Currency_Code  

             --,case when a.SecurityCode='FCNROD' THEN 'USD' ELSE 'INR' END Currency_Code
             FROM tt_temp456_5 a
                    LEFT JOIN tt_temp123_5 b   ON a.CustomerID = b.Customer_ID
                    AND a.CustomerAcID = b.CustomerAcID
              WHERE  ( A.CollateralID IS NULL
                       OR B.CollateralID IS NULL )
             UNION 
             SELECT A.CustomerID ,
                    A.CustomerAcID ,
                    A.Scheme_ProductCode ,
                    A.BalanceOutstandingINR ,
                    A.POSBalance ,
                    A.CollateralID ,
                    A.SecurityCode ,
                    A.SecurityValue ,
                    A.ValuationExpiryDate ,
                    A.Collateral_Type ,
                    A.apportioned_value ,
                    A.Valuationdate ,
                    A.Sec_Perf_Flg ,
                    --,case when a.SecurityCode='FCNROD' THEN 'USD' ELSE 'INR' END Currency_Code
                    NVL(b.Type_Of_Currency, a.Type_Of_Currency) Currency_Code  
             FROM tt_temp456_5 a
                    LEFT JOIN tt_temp123_5 b   ON a.CustomerID = b.Customer_ID
                    AND a.CustomerAcID = b.CustomerAcID
              WHERE  A.CollateralID IS NOT NULL
                       AND B.CollateralID IS NOT NULL
             UNION 
             SELECT A.CustomerID ,
                    A.CustomerAcID ,
                    A.Scheme_ProductCode ,
                    A.BalanceOutstandingINR ,
                    A.POSBalance ,
                    B.CollateralID ,
                    B.SecurityCode ,
                    B.SecurityValue ,
                    B.ValuationExpiryDate ,
                    B.Collateral_Type ,
                    B.security ,
                    B.Valuationdate ,
                    A.Sec_Perf_Flg ,
                    --,case when a.SecurityCode='FCNROD' THEN 'USD' ELSE 'INR' END Currency_Code
                    NVL(b.Type_Of_Currency, a.Type_Of_Currency) Currency_Code  
             FROM tt_temp456_5 a
                    LEFT JOIN tt_temp123_5 b   ON a.CustomerID = b.Customer_ID
                    AND a.CustomerAcID = b.CustomerAcID
              WHERE  A.CollateralID IS NOT NULL
                       AND B.CollateralID IS NOT NULL ) a );
   -------------------------------------------------------------------------------------------------------------------
   IF  --SQLDEV: NOT RECOGNIZED
   IF tt_TempCurrency_2  --SQLDEV: NOT RECOGNIZED
   tt_TempCurrency_2 TABLE IF  --SQLDEV: NOT RECOGNIZED
   IF tt_TempCurrency_21  --SQLDEV: NOT RECOGNIZED
   DELETE FROM tt_TempCurrency_2;
   UTILS.IDENTITY_RESET('tt_TempCurrency_2');

   INSERT INTO tt_TempCurrency_2 ( 
   	SELECT currency ,
           MAX(date_)  Date_  
   	  FROM RBL_MISDB_PROD.DimCurrencyRateDaily 
   	  GROUP BY currency );
   DELETE FROM tt_TempCurrency1_2;
   UTILS.IDENTITY_RESET('tt_TempCurrency1_2');

   INSERT INTO tt_TempCurrency1_2 ( 
   	SELECT a.* 
   	  FROM RBL_MISDB_PROD.DimCurrencyRateDaily a
             JOIN tt_TempCurrency_2 b   ON a.currency = b.currency
             AND a.Date_ = b.Date_ );
   --select * from tt_TempCurrency_21
   --Declare @CurrencyRate Decimal(8,2)= (select Rate from tt_TempCurrency_21 where currency='USD')
   -- Added By Mandeep By Confirmation of Anirudh sir Date 05-03-2024 Issue subject: ODTDR - why account is NPA ----------------
   --IF (@CurrencyRate IS NULL OR @CurrencyRate='')
   --BEGIN
   --    SET @CurrencyRate=(select TOP 1 USD from [RBL_MISDB_PROD].dbo.DimCurrencyFinacle ORDER BY DateOfData Desc )
   --END
   EXECUTE IMMEDIATE ' TRUNCATE TABLE Finacle_ODFD_DATA ';
   INSERT INTO Finacle_ODFD_DATA
     ( SELECT CustomerID ,
              CustomerAcID ,
              Scheme_ProductCode ,
              BalanceOutstandingINR ,
              POSBalance ,
              CollateralID ,
              SecurityCode ,
              SecurityValue ,
              ValuationExpiryDate ,
              Collateral_Type ,
              --case when SecurityCode in ('FCNROD','FDOWN') then apportioned_value * isnull(b.Rate,1) 
              --else apportioned_value end apportioned_value,
              apportioned_value * NVL(b.Rate, 1) apportioned_value  ,
              Valuationdate ,
              Sec_Perf_Flg ,
              Currency_Code 
       FROM tt_tempwer12_5 a
              LEFT JOIN tt_TempCurrency1_2 b   ON a.Currency_Code = b.currency );--SELECT TOP 1 * FROM Finacle_ODFD_DATA
   --SELECT TOP 1 * FROM RBL_MISDB_PROD.DBO.DIMSECURITY
   --SELECT TOP 1 * FROM RBL_MISDB_PROD.DBO.DimCollateralSubType
   --SELECT TOP 1 * FROM RBL_MISDB_PROD.DBO.DimCurrency WHERE CurrencyCode='USD'
   --SELECT DISTINCT Scheme_ProductCode,SecurityCode FROM Finacle_ODFD_DATA
   --WHERE Scheme_ProductCode='ODTDR'
   --SELECT DISTINCT Scheme_ProductCode,SecurityCode FROM Finacle_ODFD_DATA
   --WHERE SecurityCode='FCNROD'
   --SELECT TOP 1 * FROM Finacle_ODFD_DATA
   --SELECT TOP 1 * FROM tt_TempCurrency_21
   --======================================================================================================================================================

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."TRANSFER_SECURITY_ALL_SOURCE_SYSTEM_28112024" TO "ADF_CDR_RBL_STGDB";
