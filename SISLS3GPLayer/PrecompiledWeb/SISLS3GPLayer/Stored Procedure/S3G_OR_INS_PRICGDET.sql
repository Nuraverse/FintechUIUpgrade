create or replace
PROCEDURE "S3G_OR_INS_PRICGDET" 
(
  p_Company_Id Number,
  p_Customer_ID number := null,
  p_Product_ID Number,
  p_LOB_ID Number,
  P_LOCATION_ID NUMBER,
  P_SUB_LOCATION_ID NUMBER,
  P_CUSTOMER_TYPE NUMBER ,
  P_Appraisal_Type NUMBER ,
  P_Contract_Type NUMBER ,
  P_Deal_Type NUMBER ,
  P_DEALER_ID NUMBER ,
  P_DOB VARCHAR2 DEFAULT NULL ,
  P_SALES_PERSON_ID NUMBER ,
  P_DEALER_SALES_PERSON_ID NUMBER ,
  P_OFFER_DATE VARCHAR2 DEFAULT NULL ,
  p_FacilityAmount Number DEFAULT NULl,
  P_Tenure Number,
  P_TENURE_TYPE VARCHAR2,
  P_Seller_Name VARCHAR2,
  p_Seller_Code Varchar2,
  P_Proposal_Status Number,
  P_PDC_TYPE VARCHAR2,
  P_NO_OF_PDC NUMBER DEFAULT NULL,
  P_PDC_Start_Date VARCHAR2 DEFAULT NULL,
  P_Proposal_Number VARCHAR2,
  P_ACCOUNT_NUMBER VARCHAR2,
  P_INSURAR VARCHAR2,
  p_Insurance_Policy_No  Varchar2,
  p_Insurance_By Varchar2,
  p_Insurance_Coverage Varchar2,
  P_Insurance_Remarks Varchar2,
  p_Template_Language Varchar2,
  P_CONSITUTION_ID NUMBER,
  P_XMLASSET CLOB := NULL,  
  p_XMLPDC clob := Null,  
  P_Xmlalerts clob,
  P_XML_PDD CLOB := NULL,
  P_XML_DOWNPAYMENT_DTLS clob := Null,
  P_CREATED_BY NUMBER,
  p_Pricing_Id number,
  P_Offer_No  Out Varchar2,
  p_ErrorCode OUT number
)                 
AS
  P_Document_Type_Code Varchar(20);
  P_Hdoc Sys.Xmltype;
  P_Location_Code Varchar2(30);
  P_Pricingid Number;
  P_Progarm_Id Number;
  P_Recordcnt Number;
  P_Recordcnt1 Number;
  P_Recordloop Number;
  p_varIndex Number;
  p_varDocCount Number;
  p_DocId Number;
  P_Collected Number;
  p_Scanned Number;
  P_Remarks Varchar2(100);
  P_Value Varchar2(100);
  D_SysDate timestamp;
  D_Xml Varchar(1000);  
  D_VARASR VARCHAR2(8000);     
  P_CollateralCaptureID number ;    
  P_CustomerExists number;  
   
  d_proposal_number  varchar(50);  
  d_REVISION number;
Begin
                
-- =============================================
-- Author:  Sathish R
-- Create Date: 28-05-2018
-- Description: To Insert CheckList For Deal Processing Details
-- =============================================

 
  DELETE FROM TMP_TBLPRNGDOCDTLS;
  Delete From tmp_tblprngalertsdtls;
  DELETE FROM TMP_TBLPRNGASSETDTLS;
  d_PROPOSAL_NUMBER:=P_PROPOSAL_NUMBER ;             
  p_offer_no :='';                
  p_errorcode := 0;                
  p_document_type_code :='PRI';    
  
  ---UserMgtLoc New Code               
  if (p_location_id is not null) then
    begin
      p_location_code := fn_get_locationcode(p_location_id);                              
    End;
  end if;
  
 --Alerts Table Insert      
  p_hdoc := SYS.XMLTYPE.createXML(p_XMLAlerts);

  FOR Alrt IN
  (
    Select 
      EXTRACTVALUE(VALUE(X),'/Details/@TypeId') AS TypeId,
      Extractvalue(Value(X),'/Details/@UserContactId') As Usercontactid,
      Extractvalue(Value(X),'/Details/@EMail') As Email,
      extractvalue(value(x),'/Details/@SMS') as SMS
    FROM
      TABLE (XMLSEQUENCE (p_hdoc.EXTRACT ('//Root/Details'))) X
  )
  loop
    insert into tmp_tblprngalertsdtls (typeid,usercontactid,email,sms)
      values (Alrt.TypeId,Alrt.UserContactId,Alrt.EMail,Alrt.SMS);
  END LOOP;  

 
 --Asset table insert                
  /**
  p_hdoc := SYS.XMLTYPE.createXML(p_XMLAsset);
  
  FOR ASAT IN
  (
    Select 
      Extractvalue(Value(X),'/Details/@AssetCode') As AssetId,
      Extractvalue(Value(X),'/Details/@RequiredFromDate') As Requiredfrom,
      Extractvalue(Value(X),'/Details/@UnitCount') As Unitcount,
      Extractvalue(Value(X),'/Details/@UnitValue') As Unitvalue,
      Extractvalue(Value(X),'/Details/@MarginPercentage') As Marginpercentage,
      Extractvalue(Value(X),'/Details/@DownPaymentAmount') As Marginamount,
      Extractvalue(Value(X),'/Details/@BookDepreciationPercentage') As Bookdepreciationpercentage,
      Extractvalue(Value(X),'/Details/@BlockDepreciationPercentage') As Blockdepreciationpercentage,
      Extractvalue(Value(X),'/Details/@IsOwnAsset') As Isownasset,
      Extractvalue(Value(X),'/Details/@StatusCode') As Statuscode,
      Extractvalue(Value(X),'/Details/@Status') As Status,
      Extractvalue(Value(X),'/Details/@PayTo') As pay_to,
      Extractvalue(Value(X),'/Details/@PayType') As paytype,
      Extractvalue(Value(X),'/Details/@Payid') As pay_id,
      EXTRACTVALUE(VALUE(X),'/Details/@DealerName') AS PAYNAME,
      EXTRACTVALUE(VALUE(X),'/Details/@MargintoDealer') AS MARGINTODEALER,
      extractvalue(value(x),'/Details/@MargintoMFC') as margintomfc,
      extractvalue(value(x),'/Details/@TradeIn') as tradein,
       Extractvalue(Value(X),'/Details/@LPOAmount') As LPOAmount
      
    FROM
      TABLE (XMLSEQUENCE (p_hdoc.EXTRACT ('//Root/Details'))) X
  )
  loop
    insert into tmp_tblprngAssetDtls(AssetCode,RequiredFrom,UnitCount,
      UNITVALUE,MARGINPERCENTAGE,MARGINAMOUNT,BOOKDEPRECIATIONPERCENTAGE,
      blockdepreciationpercentage,isownasset,statuscode,status,pay_to,pay_type,entity_id,pay_name,margin_to_dealer,
      MARGIN_TO_COMPANY,TRADE_IN,LPOAmount)
      values (ASAT.AssetId,Fn_Todate(ASAT.RequiredFrom),ASAT.UnitCount,ASAT.UnitValue,
      Asat.Marginpercentage,Asat.Marginamount,Asat.Bookdepreciationpercentage,
      ASAT.BlockDepreciationPercentage,ASAT.ISOwnAsset,Asat.Statuscode
      ,asat.status,asat.pay_to,asat.paytype,asat.pay_id,asat.payname
      ,ASAT.MARGINTODEALER,ASAT.MargintoMFC,ASAT.TradeIn,ASAT.LPOAmount
      );
  END LOOP;  

**/
 
 

 
 --Offer Number Generation   
  if(d_PROPOSAL_NUMBER is null)then
  S3G_OR_GET_DOCCTRLNO(P_COMPANY_ID ,P_DOCUMENT_TYPE_CODE,1,P_LOB_ID,P_LOCATION_ID,P_OFFER_NO);
  d_PROPOSAL_NUMBER:=P_OFFER_NO;
  end if;
               
  If (p_Offer_No !='-1' and p_Offer_No !='-2') Then              
    Begin               
      
       BEGIN
          SELECT MAX(revision)
          INTO d_revision
          FROM s3g_sysad_templatemaster temphdr
          WHERE template_type_code=9
          And Lob_Id              =P_Lob_Id
          And Temphdr.Location_Code=P_Location_Code
          and temphdr.TEMPLATE_LANGUAGE=decode(p_Template_Language,0,'en')
          ;
          IF(d_revision          IS NULL)THEN
            p_errorcode          :=2;
            RETURN;
          END IF;
        END;
      
      Select SEQ_S3G_ORG_PRICING.NextVal into p_PricingId from dual;
      
      INSERT INTO S3G_ORG_PRICING(
            PRICING_ID,
            COMPANY_ID,
            CUSTOMER_ID,
            BUSINESS_OFFER_NUMBER,
            OFFER_DATE,
            FACILITY_AMOUNT,
            LOB_ID,
            LOCATION_CODE,
            PRODUCT_ID,
            CONSTITUTION_ID,
            TENURE,
            TENURE_TYPE,
            STATUS_ID,
            CREATED_BY,
            CREATED_ON,
            CUSTOMER_TYPE,
            LOCATION_ID,
            SUB_LOCATION_ID,
            OLD_PRICING_ID,
            CONTRACT_TYPE,
            DEAL_TYPE,
            DEALER_ID,
            DEALER_SALESPERSON_ID,
            NO_OF_PDC,
            PDC_STARTDATE,
            INSURER,
            INSURANCE_POLICYNO,
            INSURANCE_BY,
            INSURANCE_COVERAGE,
            INSURANCE_REMARKS,
            OFFER_VALID_TILL,
            ROUND_NO,
            SALES_PERSON_ID,
            SELLER_NAME,
            seller_id,
            TEMPLATE_VERSION

            ) VALUES 
              (
               p_PricingId,
               P_COMPANY_ID,
               P_CUSTOMER_ID,
               d_PROPOSAL_NUMBER,
               FN_TODATE(p_Offer_Date),
               P_FACILITYAMOUNT,
               P_LOB_ID,
               P_LOCATION_CODE,
               P_PRODUCT_ID,
               P_CONSITUTION_ID,
               P_TENURE,
               TO_NUMBER(P_TENURE_TYPE),
               P_Proposal_Status,--Status Id
               P_CREATED_BY,
               SYSDATE,
               P_CUSTOMER_TYPE,
               P_LOCATION_ID,
               P_SUB_LOCATION_ID,
               0,--Old Pricing Id,
               P_CONTRACT_TYPE,
               P_DEAL_TYPE,
               P_DEALER_ID,
               P_DEALER_SALES_PERSON_ID,
               P_NO_OF_PDC,
               FN_TODATE(P_PDC_START_DATE),
               P_INSURAR ,
               P_INSURANCE_POLICY_NO  ,
               P_INSURANCE_BY ,
               P_INSURANCE_COVERAGE ,
               P_INSURANCE_REMARKS ,
               SYSDATE,
               1,
               P_SALES_PERSON_ID,
               P_SELLER_NAME,
               p_seller_code,
               d_REVISION
               

              );
        
        --By Sathish Transaction History   
        S3G_SYSAD_TRANS_HISTORY(42,p_PricingId,P_Offer_No,P_OFFER_DATE,P_Created_By,1); 
      
      
      
      
      INSERT INTO S3G_ORG_PRICINGPDC
        (PRICING_ID,
        PRICINGPDC_ID,
        PDC_AMOUNT,
        IS_SECURITY,
        INSTALLMENT_FROM,
        INSTALLMENT_TO,
        DRAWEEBANKMASTER_ID,
        DRAWEEBANKBRANCH_ID
        )
       SELECT 
       P_PRICINGID ,
       SEQ_S3G_ORG_PRICINGPDC.NEXTVAL,
       EXTRACTVALUE(VALUE(X),'/Details/@Total_Amount') PDC_AMOUNT,
       EXTRACTVALUE(VALUE(X),'/Details/@PDC_Type_Id') PDC_Type_Id,
       EXTRACTVALUE(VALUE(X),'/Details/@Ins_Start') INSTALLMENT_FROM,
       EXTRACTVALUE(VALUE(X),'/Details/@Ins_End') INS_END,
       EXTRACTVALUE(VALUE(X),'/Details/@BankId') BANKID,
       EXTRACTVALUE(VALUE(X),'/Details/@BankPlace_Id') BankPlace_Id
    
    
     FROM
     TABLE  (XMLSEQUENCE ((XMLTYPE.CREATEXML(p_XMLPDC)).EXTRACT ('//Root/Details'))) X;
      
      
      
      --Alert Details Insert
      insert into S3G_ORG_PricingAlertDet (PRICING_ALERT_ID,pricing_id,
        alerts_type,alerts_usercontact,alerts_sms,alerts_email) 
        select seq_org_pricing_alert_id.nextval,p_PricingId,typeid,
        UserContactId,EMail,SMS from tmp_tblprngalertsdtls;      

    
      
      --Asset Details Insert                
      INSERT INTO S3G_ORG_PRICINGASSETDET(
        PRICING_ASSET_ID,
        Pricing_Id,
        ASSET_CODE,
        REQUIRED_FROM,
        NO_OF_UNITS,
        UNIT_VALUE,
        Margin_Percentage,
        MARGIN_AMOUNT,
        BOOK_DEPRECIATION_PERCENTAGE,
        BLOCK_DEPRECIATION_PERCENTAGE,
        ISOWNASSET,
        STATUS_CODE,
        Status,
        FINANCE_AMOUNT,
        PAY_TO,
        PAY_TYPE,
        ENTITY_ID,
        PAY_NAME,
        MARGIN_TO_COMPANY,
        MARGIN_TO_DEALER,
        TRADE_IN
        
        )
       
       
       
       
        SELECT 
        SEQ_ORG_PRICINGASSETDET.NEXTVAL,
        P_PRICINGID,
        ASSET_CODE as ASSETCODE,
        '' REQUIREDFROM,
        NO_OF_UNITS as UNITCOUNT,
        UNIT_VALUE as UNITVALUE,
        MARGIN_PERCENTAGE as MARGINPERCENTAGE,
        MARGIN_AMOUNT as MARGINAMOUNT,
        '' BOOKDEPRECIATIONPERCENTAGE,
        '' BLOCKDEPRECIATIONPERCENTAGE,
        '' ISOWNASSET,
        '' STATUSCODE,
        '' STATUS,
        FINANCE_AMOUNT as LPOAMOUNT ,
        PAY_TO,
        PAY_TYPE,
        ENTITY_ID,
        PAY_NAME,
        MARGIN_TO_COMPANY,
        margin_to_dealer,
        trade_in
        
        From TMP_S3G_ORG_PRICINGASSETDET where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42;
        DELETE From TMP_S3G_ORG_PRICINGASSETDET where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42;
          
          
           INSERT INTO S3G_ORG_PRICINGDOCDET
            (
                PRICING_DOC_ID,
                PRICING_ID,
                CONSTITUTIONDOCCATEGORY_ID,
                --IS_MANDATORY,
                REMARK,
                IS_COLLECTED,
                IS_SCANNED,
                VALUE,
                PRDDC_DOC_CAT_ID,
                IS_REQUIRED,
                RECEIVED_STATUS,
                COLLECTED_BY,
                COLLECTED_ON,
                CAD_RECEIVED_BY,
                CAD_RECEIVED_ON,
                CAD_RECEIVER_REMARK,
                CAD_VERIFIED_BY,
                CAD_VERIFIED_ON,
                cad_verifier_remark,
                doc_ref_path,
                is_additional
            )

      select
              SEQ_S3G_ORG_PRICINGDOCDET.NEXTVAL,
              P_PRICINGID,
              CONSTITUTIONDOCCATEGORY_ID,
              REMARK,
              IS_COLLECTED,
              IS_SCANNED,
              value,
              PRDDC_DOC_CAT_ID,
              IS_REQUIRED,
              RECEIVED_STATUS,
              COLLECTED_BY_ID,
              COLLECTED_ON,
              CAD_RECEIVED_BY,
              CAD_RECEIVED_ON,
              CAD_RECEIVER_REMARK,
              CAD_VERIFIED_BY,
              CAD_VERIFIED_ON,
              CAD_VERIFIER_REMARK,
              DOC_REF_PATH,
              0
              from TMP_S3G_ORG_PRICINGDOCDET  where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42 AND IS_ADDITIONAL=1;
 
      
     
     
     
      INSERT INTO S3G_ORG_PRICINGDOCDET
            (
                PRICING_DOC_ID,
                pricing_id,
                --CONSTITUTIONDOCCATEGORY_ID,
                --IS_MANDATORY,
                REMARK,
                IS_COLLECTED,
                IS_SCANNED,
                value,
               -- PRDDC_DOC_CAT_ID,
                IS_REQUIRED,
                RECEIVED_STATUS,
                COLLECTED_BY,
                COLLECTED_ON,
                CAD_RECEIVED_BY,
                CAD_RECEIVED_ON,
                CAD_RECEIVER_REMARK,
                CAD_VERIFIED_BY,
                CAD_VERIFIED_ON,
                cad_verifier_remark,
                doc_ref_path,
                add_doc_desc,
                is_additional
            )

      select
              SEQ_S3G_ORG_PRICINGDOCDET.NEXTVAL,
              P_PRICINGID,
              --CONSTITUTIONDOCCATEGORY_ID,
              REMARK,
              IS_COLLECTED,
              IS_SCANNED,
              value,
              --PRDDC_DOC_CAT_ID,
              IS_REQUIRED,
              RECEIVED_STATUS,
              COLLECTED_BY_ID,
              COLLECTED_ON,
              CAD_RECEIVED_BY,
              CAD_RECEIVED_ON,
              CAD_RECEIVER_REMARK,
              CAD_VERIFIED_BY,
              CAD_VERIFIED_ON,
              CAD_VERIFIER_REMARK,
              DOC_REF_PATH,
              PRDDC_DOC_DESCRIPTION,
              1
              from TMP_S3G_ORG_PRICINGDOCDET  where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42 AND IS_ADDITIONAL=1;
     
        DELETE   from TMP_S3G_ORG_PRICINGDOCDET  where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42;  
        
        
        
        
      INSERT INTO S3G_ORG_PRICINGDPRCPT
        (
            PRICINGDPREC_ID,
            PRICING_ID,
            DOWN_PAY_AMOUNT,
            RECEIPT_NO
        )

      SELECT
       SEQ_S3G_ORG_PRICINGDPRCPT.NEXTVAL,
       p_pricingid,
       EXTRACTVALUE(VALUE(X),'/Details/@DownPayAmount') DOWN_PAY_AMOUNT,
       EXTRACTVALUE(VALUE(X),'/Details/@DownPayReceipt') RECEIPT_NO
      FROM
     TABLE  (XMLSEQUENCE ((XMLTYPE.CREATEXML(P_XML_DOWNPAYMENT_DTLS)).EXTRACT ('//Root/Details'))) X; 
          
        
          
          
                  
      END ;
    END IF;
       
  
p_ErrorCode := 0;
  
  
End S3G_OR_Ins_PricgDet;