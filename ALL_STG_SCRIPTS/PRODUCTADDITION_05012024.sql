--------------------------------------------------------
--  DDL for Procedure PRODUCTADDITION_05012024
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "RBL_STGDB"."PRODUCTADDITION_05012024" 
AS
   v_TIMEKEY NUMBER(10,0) := ( SELECT TIMEKEY 
     FROM RBL_MISDB.Automate_Advances 
    WHERE  EXT_FLG = 'Y' );
   v_Counter NUMBER(10,0);
   v_FinalCounter NUMBER(10,0) := ( SELECT COUNT(*)  
     FROM ( SELECT DISTINCT Scheme_ProductCode 
            FROM ACCOUNT_ALL_SOURCE_SYSTEM 
            MINUS 
            SELECT DISTINCT productcode 
            FROM RBL_MISDB.DimProduct  ) A );

BEGIN

   v_Counter := 1 ;
   WHILE ( v_Counter <= v_FinalCounter ) 
   LOOP 
      DECLARE
         v_Productcode VARCHAR2(20) := ( SELECT * 
           FROM ( SELECT DISTINCT Scheme_ProductCode 
                  FROM ACCOUNT_ALL_SOURCE_SYSTEM 
                  MINUS 
                  SELECT DISTINCT productcode 
                  FROM RBL_MISDB.DimProduct  ) A 
           FETCH FIRST 1 ROWS ONLY );
         v_SecuredStatus VARCHAR2(30) := ( SELECT DISTINCT (CASE 
                                 WHEN SecuredStatus = 'U' THEN 'UNSECURED'
                           ELSE 'SECURED'
                              END) 
           FROM ACCOUNT_ALL_SOURCE_SYSTEM 
          WHERE  Scheme_ProductCode = v_Productcode );
         v_ProductGroup VARCHAR2(30) := ( SELECT DISTINCT SchemeType 
           FROM ACCOUNT_ALL_SOURCE_SYSTEM 
          WHERE  Scheme_ProductCode = v_Productcode );
         -------------------------------------------------------------------------------------------------------------
         v_SourceAlt_Key NUMBER(10,0) := ( SELECT DISTINCT SourceAlt_Key 
           FROM ACCOUNT_ALL_SOURCE_SYSTEM a
                  JOIN RBL_MISDB.DIMSOURCEDB b   ON a.SourceSystem = b.SourceName
          WHERE  Scheme_ProductCode = v_Productcode 
           FETCH FIRST 1 ROWS ONLY );
         v_ProductName VARCHAR2(100) := ' ';
         v_SchemeType VARCHAR2(200) := ( SELECT DISTINCT SchemeType 
           FROM ACCOUNT_ALL_SOURCE_SYSTEM a
          WHERE  Scheme_ProductCode = v_Productcode 
           FETCH FIRST 1 ROWS ONLY );
         v_FacilityType VARCHAR2(100) := ( SELECT DISTINCT FacilityType 
           FROM ACCOUNT_ALL_SOURCE_SYSTEM a
          WHERE  Scheme_ProductCode = v_Productcode 
           FETCH FIRST 1 ROWS ONLY );

      BEGIN
         SELECT schm_desc 

           INTO v_ProductName
           FROM dwh_DWH_STG.product_code_master_finacle 
          WHERE  schm_code = v_Productcode;
         IF ( NVL(v_ProductName, ' ') = ' ' ) THEN

         BEGIN
            SELECT scheme_description 

              INTO v_ProductName
              FROM dwh_DWH_STG.product_code_master 
             WHERE  product_code = v_Productcode;

         END;
         END IF;
         --Set @ProductName=(select schm_desc from DWH_STG.dwh.product_code_master_finacle	
         --									where schm_code=@Productcode)
         IF ( NVL(v_ProductName, ' ') = ' ' ) THEN

         BEGIN
            SELECT product_description 

              INTO v_ProductName
              FROM dwh_DWH_STG.product_code_master_mifin 
             WHERE  product_code = v_Productcode;

         END;
         END IF;
         IF ( NVL(v_ProductName, ' ') = ' ' ) THEN

         BEGIN
            SELECT scheme_Desc 

              INTO v_ProductName
              FROM dwh_DWH_STG.product_code_master_FIS 
             WHERE  scheme_code = v_Productcode;

         END;
         END IF;
         IF ( NVL(v_ProductName, ' ') = ' ' ) THEN

         BEGIN
            SELECT Product_Name 

              INTO v_ProductName
              FROM dwh_DWH_STG.product_code_master_visionplus 
             WHERE  logo = v_Productcode;

         END;
         END IF;
         ----------------- Product Description Added By Satwaji as on 02/08/2023 for ECBF ---------------
         IF ( NVL(v_ProductName, ' ') = ' ' ) THEN

         BEGIN
            SELECT product_description 

              INTO v_ProductName
              FROM dwh_DWH_STG.product_master_ecbf 
             WHERE  product_code = v_Productcode;

         END;
         END IF;
         IF ( NVL(v_ProductName, ' ') = ' ' ) THEN

         BEGIN
            v_ProductName := v_Productcode ;

         END;
         END IF;
         --Declare @NPA_Norms varchar(100)=(select  distinct top 1 isnull(AssetClassNorm,'90') from ACCOUNT_ALL_SOURCE_SYSTEM a
         --							      where           Scheme_ProductCode = @Productcode)
         --Declare @Agrischeme varchar(100)=(select  case when @NPA_Norms='365.000000' then 'Y' else 'N' end
         --								  from    ACCOUNT_ALL_SOURCE_SYSTEM a
         --							      where           Scheme_ProductCode = @Productcode)
         --------------------------------------------------------------------------------------------------------------------
         INSERT INTO RBL_MISDB.DimProduct
           ( ProductAlt_Key, ProductCode, ProductName, ProductGroup, ProductSubGroup, EffectiveFromTimeKey, EffectiveToTimeKey, CreatedBy, DateCreated, SourceAlt_Key, RBL_ProductGroup, SchemeType, FacilityType --,NPANorms,Agrischeme)
          )
           ( SELECT MAX(ProductAlt_key)  + 1 ,
                    v_Productcode ,
                    v_ProductName ,
                    v_ProductGroup ,
                    v_SecuredStatus ,
                    v_TIMEKEY ,
                    49999 ,
                    'D2K' ,
                    SYSDATE ,
                    v_SourceAlt_Key ,
                    v_ProductGroup ,
                    v_SchemeType ,
                    v_FacilityType --,@NPA_Norms,@Agrischeme

             FROM RBL_MISDB.DimProduct  );
         v_Counter := v_Counter + 1 ;

      END;
   END LOOP;

EXCEPTION WHEN OTHERS THEN utils.handleerror(SQLCODE,SQLERRM);
END;

/

  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ROLE_ALL_DB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "CC_CDR_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "MAIN_PRO";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "RBL_BI_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ALERT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ACL_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "QPI_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "BSG_READ_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "STD_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "BS_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "DWH_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "RBL_TEMPDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "STG_FIN_RBL_STGDB";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT EXECUTE ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ADF_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ROLE_ALL_DB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "CC_CDR_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "MAIN_PRO";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "RBL_BI_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ALERT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ACL_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "D2KMNTR_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "QPI_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "CURDAT_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "PREMOC_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "BSG_READ_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "STD_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "BS_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "DWH_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ETL_TEMP_RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "RBL_TEMPDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ETL_MAIN_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "STG_FIN_RBL_STGDB";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "DATAUPLOAD_RBL_MISDB_PROD";
  GRANT DEBUG ON "RBL_STGDB"."PRODUCTADDITION_05012024" TO "ADF_CDR_RBL_STGDB";
