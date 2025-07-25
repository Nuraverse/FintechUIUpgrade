create or replace
PROCEDURE "S3G_OR_UPD_PRICGDET" 
(      
  p_Company_Id Number,
  P_CUSTOMER_ID NUMBER := NULL,
  p_Pricing_Id NUMBER := NULL,
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
  p_FacilityAmount Number,
  P_Tenure Number,
  P_TENURE_TYPE VARCHAR2,
  P_Seller_Name VARCHAR2,
  p_Seller_Code Varchar2,
  P_Proposal_Status Number,
  P_PDC_TYPE VARCHAR2,
  P_NO_OF_PDC NUMBER,
  P_PDC_Start_Date VARCHAR2 DEFAULT NULL,
  P_Proposal_Number VARCHAR2,
  P_ACCOUNT_NUMBER VARCHAR2,
  P_INSURAR VARCHAR2,
  p_Insurance_Policy_No  Varchar2,
  p_Insurance_By Varchar2,
  p_Insurance_Coverage Varchar2,
  P_INSURANCE_REMARKS VARCHAR2,
  P_CONSITUTION_ID NUMBER,
  P_XMLASSET CLOB := NULL,  
  p_XMLPDC clob := Null,  
  P_Xmlalerts clob,
  p_xml_pdd clob := null,
  P_XML_DOWNPAYMENT_DTLS clob := Null,
  P_Created_By Number,
  p_ErrorCode OUT Number
)       
as 
  p_document_type_code varchar2(20);
  p_hdoc sys.xmltype;
  p_offer_no varchar2(100);        
  p_progarm_id number;      
  p_followup_id number;   
  p_Location_Code VARCHAR2(30);      
  
  p_varindex number;      
  p_vardoccount number;      
  p_docid number;      
  p_collected number;      
  p_scanned number;       
  p_remarks varchar2(100);      
  p_value varchar2(100);      
  P_RECORDLOOP NUMBER;
  D_OFFERDATE varchar2(50);
  D_COUNT number;
  
BEGIN      

-- =============================================
-- Author:  Sathish R
-- Create Date: 28-05-2018
-- Description: To Update CheckList For Deal Processing Details
-- =============================================
      

  delete from tmp_tblprngdocdtls;
  Delete From tmp_tblprngfollowupdtls;
  delete from TMP_TBLPRNGALERTSDTLS;
  --delete from TMP_TBLPRNGREPAYMENTDTLS1;
  --delete from TMP_TBLPRNGREPAYMENTDTLSAMORT;
  --delete from TMP_TBLPRNGCASHINFLOWDTLS;
  --delete from TMP_TBLPRNGCASHOUTFLOWDTLS;
  --delete from TMP_TBLPRNGROIRULEDTLS;
  --delete from tmp_tblprngAssetDtls;
  
  p_errorcode :=0;      
  p_Document_Type_Code :='PRI';      
      
  ---UserMgtLoc New Code               
  if (p_location_id is not null) then
    begin
      p_location_code := fn_get_locationcode(p_location_id);                              
    End;
  End IF;
  ---UserMgtLoc Code End      
  
  
  
 --Alerts Table Insert      
  p_hdoc := SYS.XMLTYPE.createXML(p_XMLAlerts);

  FOR Alrt IN
  (
    select 
      EXTRACTVALUE(VALUE(X),'/Details/@TypeId') AS TypeId,
      extractvalue(value(x),'/Details/@UserContactId') as UserContactId,
      extractvalue(value(x),'/Details/@EMail') as EMail,
      extractvalue(value(x),'/Details/@SMS') as SMS
    FROM
      TABLE (XMLSEQUENCE (p_hdoc.EXTRACT ('//Root/Details'))) X
  )
  loop
    insert into tmp_tblprngalertsdtls (typeid,usercontactid,email,sms)
      values (Alrt.TypeId,Alrt.UserContactId,Alrt.EMail,Alrt.SMS);
  END LOOP;  

 
  

  
  If (p_Pricing_Id !=0 or p_Pricing_Id is not null) Then    
    Begin     
     
       Update S3g_Org_Pricing 
        SET 
              CUSTOMER_ID=P_CUSTOMER_ID,
              BUSINESS_OFFER_NUMBER=P_PROPOSAL_NUMBER,
              OFFER_DATE=FN_TODATE(P_OFFER_DATE),
              FACILITY_AMOUNT=P_FACILITYAMOUNT,
              LOB_ID=P_LOB_ID,
              LOCATION_CODE=P_LOCATION_CODE,
              PRODUCT_ID=P_PRODUCT_ID,
              CONSTITUTION_ID=P_CONSITUTION_ID,
              TENURE=P_TENURE,
              TENURE_TYPE=TO_NUMBER(P_TENURE_TYPE),
              STATUS_ID=P_PROPOSAL_STATUS,--,
              MODIFIED_BY= P_CREATED_BY,
              MODIFIED_ON=SYSDATE,
              CUSTOMER_TYPE=P_CUSTOMER_TYPE,
              LOCATION_ID=P_LOCATION_ID,
              SUB_LOCATION_ID=P_SUB_LOCATION_ID,
              OLD_PRICING_ID=0,
              CONTRACT_TYPE=P_CONTRACT_TYPE,
              DEAL_TYPE=P_DEAL_TYPE,
              DEALER_ID=P_DEALER_ID,
              DEALER_SALESPERSON_ID=P_DEALER_SALES_PERSON_ID,
              NO_OF_PDC=P_NO_OF_PDC,
              PDC_STARTDATE=FN_TODATE(P_PDC_START_DATE),
              INSURER=P_INSURAR ,
              INSURANCE_POLICYNO=P_INSURANCE_POLICY_NO  ,
              INSURANCE_BY=P_INSURANCE_BY ,
              INSURANCE_COVERAGE=P_INSURANCE_COVERAGE ,
              INSURANCE_REMARKS=P_INSURANCE_REMARKS ,
              SALES_PERSON_ID=P_SALES_PERSON_ID,
              SELLER_NAME=P_SELLER_NAME,
              SELLER_ID=P_Seller_Code
        WHERE Pricing_ID = p_Pricing_Id;
        
        
     --By Sathish Transaction History   
     --d('-------Added by Sathish For TO Insert Transaction History------------');
     S3G_SYSAD_TRANS_HISTORY_UPD(42,P_PRICING_ID,P_OFFER_NO,D_OFFERDATE,P_CREATED_BY,2); 
     -- d('-------Added by Sathish For TO Insert Transaction History------------');  
        
    
        
    delete from S3G_ORG_PRICINGASSETDET where PRICING_ID=P_PRICING_ID;
        
         BEGIN--Asset Details Insert   
                   
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
        P_PRICING_ID,
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
        
        from TMP_S3G_ORG_PRICINGASSETDET where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42;
        --delete from TMP_S3G_ORG_PRICINGASSETDET where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42;
        END;  
        
       
       
       merge into S3G_ORG_PRICINGALERTDET TARGET
       using 
       (
       select 
       TYPEID,
       USERCONTACTID,
       EMAIL,
       SMS 
       from TMP_TBLPRNGALERTSDTLS
       )TBL on (TBL.TYPEID=TARGET.ALERTS_TYPE and PRICING_ID=p_Pricing_Id)
       when matched then
       update set 
       ALERTS_USERCONTACT=TBL.USERCONTACTID, ALERTS_EMAIL=TBL.EMAIL,ALERTS_SMS=TBL.SMS
       
      when not matched then
      insert (
      PRICING_ID,
      PRICING_ALERT_ID,
      ALERTS_TYPE,
      ALERTS_USERCONTACT,
      ALERTS_SMS,
      ALERTS_EMAIL
       )
       values
       (
       P_PRICING_ID,
       seq_org_pricingassetdet.nextval,
       TBL.TYPEID,
       TBL.USERCONTACTID,
       TBL.EMAIL,
       TBL.SMS
       )
       
       ;
       
       
       
     BEGIN--PDC DEATILS UPDATION START
     
     MERGE INTO S3G_ORG_PRICINGPDC TARGET
     using
     (
     
      SELECT 
       EXTRACTVALUE(value(X),'/Details/@Total_Amount') PDC_AMOUNT,
       EXTRACTVALUE(VALUE(X),'/Details/@PDC_Type_Id') PDC_Type_Id,
       EXTRACTVALUE(VALUE(X),'/Details/@Ins_Start') INSTALLMENT_FROM,
       EXTRACTVALUE(VALUE(X),'/Details/@Ins_End') INS_END,
       EXTRACTVALUE(VALUE(X),'/Details/@BankId') BANKID,
       EXTRACTVALUE(value(X),'/Details/@BankPlace_Id') BANKPLACE_ID
      from
     table  (XMLSEQUENCE ((xmltype.CREATEXML(P_XMLPDC)).extract ('//Root/Details'))) X
     )
     TBL on 
     (TBL.PDC_TYPE_ID=TARGET.IS_SECURITY and TARGET.DRAWEEBANKMASTER_ID=TBL.BANKID and TARGET.DRAWEEBANKBRANCH_ID=TBL.BANKPLACE_ID)
     
     when matched then 
     update 
     set 
     TARGET.IS_SECURITY=TBL.PDC_TYPE_ID,
     TARGET.DRAWEEBANKMASTER_ID=TBL.BANKID,
     TARGET.DRAWEEBANKBRANCH_ID=TBL.BANKPLACE_ID,
     TARGET.INSTALLMENT_FROM=TBL.INSTALLMENT_FROM,
     TARGET.INSTALLMENT_TO=TBL.INS_END,
     TARGET.PDC_AMOUNT=TBL.PDC_AMOUNT
     
     when not matched then 
     insert  
     (
        PRICINGPDC_ID,
        PRICING_ID,
        DRAWEEBANKMASTER_ID,
        DRAWEEBANKBRANCH_ID,
        IS_SECURITY,
        INSTALLMENT_FROM,
        INSTALLMENT_TO,
        PDC_AMOUNT
     
     )
     values 
     (
      SEQ_S3G_ORG_PRICINGPDC.NEXTVAL,
      P_PRICING_ID,
      TBL.BANKID,
      TBL.BANKPLACE_ID,
      TBL.PDC_TYPE_ID,
      TBL.INSTALLMENT_FROM,
      TBL.INS_END,
      TBL.PDC_AMOUNT
     )
     ;
     END;--PDC DEATILS UPDATION END
     
     
     
     
        
        BEGIN--Document Updation Start

        begin--Document Updation Update and Insert Is Additional=0
       FOR DOC in(select      PRICING_DOC_ID
                              PRICING_ID,
                              CONSTITUTIONDOCCATEGORY_ID,
                              IS_MANDATORY,
                              IS_NEED_IMAGE_COPY,
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
                              ADD_DOC_DESC,
                              IS_ADDITIONAL,
                              SESSION_ID_DOT_NET,
                              SESSION_USER_ID,
                              COMPANY_ID,
                              PROGRAM_ID,
                              PAGE_SNO,
                              PRIORITY_TYPE,
                              CADVERIFIEDBY,
                              CADRECEIVEDBY,
                              COLLECTEDBY,
                              PRDDC_DOC_DESCRIPTION,
                              FILENAME,
                              DISPLAY_ORDER 
                              from TMP_S3G_ORG_PRICINGDOCDET  where SESSION_USER_ID=P_CREATED_BY 
                              and PROGRAM_ID=42 
                              AND IS_ADDITIONAL=0 order by PRDDC_DOC_CAT_ID
              )
       LOOP 
         begin
         
         --Updation 
         select COUNT(1)  into D_COUNT from S3G_ORG_PRICINGDOCDET 
         where PRDDC_DOC_CAT_ID=DOC.PRDDC_DOC_CAT_ID 
         and PRICING_ID=P_PRICING_ID   and IS_ADDITIONAL=0 ;
         
         if(D_COUNT>0)then
           begin
           update S3G_ORG_PRICINGDOCDET  set 
            IS_MANDATORY=DOC.IS_MANDATORY,
            IS_NEED_IMAGE_COPY=DOC.IS_NEED_IMAGE_COPY,
            REMARK=DOC.REMARK,
            IS_COLLECTED=DOC.IS_COLLECTED,
            IS_SCANNED=DOC.IS_SCANNED,
            value=DOC.value,
            PRDDC_DOC_CAT_ID=DOC.PRDDC_DOC_CAT_ID,
            IS_REQUIRED=DOC.IS_REQUIRED,
            RECEIVED_STATUS=DOC.RECEIVED_STATUS,
            COLLECTED_BY=DOC.COLLECTED_BY_ID,
            COLLECTED_ON=DOC.COLLECTED_ON,
            CAD_RECEIVED_BY=DOC.CAD_RECEIVED_BY,
            CAD_RECEIVED_ON=DOC.CAD_RECEIVED_ON,
            CAD_RECEIVER_REMARK=DOC.CAD_RECEIVER_REMARK,
            CAD_VERIFIED_BY=DOC.CAD_VERIFIED_BY,
            CAD_VERIFIED_ON=DOC.CAD_VERIFIED_ON,
            CAD_VERIFIER_REMARK=DOC.CAD_VERIFIER_REMARK,
            DOC_REF_PATH=DOC.DOC_REF_PATH,
            ID_ADDITIONAL=DOC.IS_ADDITIONAL;
           end;
           
           else--Insert 
           
           INSERT INTO S3G_ORG_PRICINGDOCDET
            (
                PRICING_DOC_ID,
                PRICING_ID,
                CONSTITUTIONDOCCATEGORY_ID,
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
              P_PRICING_ID,
              DOC.CONSTITUTIONDOCCATEGORY_ID,
              DOC.REMARK,
              DOC.IS_COLLECTED,
              DOC.IS_SCANNED,
              DOC.value,
              DOC.PRDDC_DOC_CAT_ID,
              DOC.IS_REQUIRED,
              DOC.RECEIVED_STATUS,
              DOC.COLLECTED_BY_ID,
              DOC.COLLECTED_ON,
              DOC.CAD_RECEIVED_BY,
              DOC.CAD_RECEIVED_ON,
              DOC.CAD_RECEIVER_REMARK,
              DOC.CAD_VERIFIED_BY,
              DOC.CAD_VERIFIED_ON,
              DOC.CAD_VERIFIER_REMARK,
              DOC.DOC_REF_PATH,
              0
              from dual;
           
         end if;
         END;
       end LOOP;
      end; 
        begin--Document Updattion Update and Insert Is Additional=1
       FOR DOC in(select      PRICING_DOC_ID
                              PRICING_ID,
                              CONSTITUTIONDOCCATEGORY_ID,
                              IS_MANDATORY,
                              IS_NEED_IMAGE_COPY,
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
                              ADD_DOC_DESC,
                              IS_ADDITIONAL,
                              SESSION_ID_DOT_NET,
                              SESSION_USER_ID,
                              COMPANY_ID,
                              PROGRAM_ID,
                              PAGE_SNO,
                              PRIORITY_TYPE,
                              CADVERIFIEDBY,
                              CADRECEIVEDBY,
                              COLLECTEDBY,
                              PRDDC_DOC_DESCRIPTION,
                              FILENAME,
                              DISPLAY_ORDER 
                              from TMP_S3G_ORG_PRICINGDOCDET  where SESSION_USER_ID=P_CREATED_BY 
                              and PROGRAM_ID=42 
                              AND IS_ADDITIONAL=1 order by PRDDC_DOC_CAT_ID
              )
       LOOP 
         begin
         
         --Updation 
         select COUNT(1)  into D_COUNT from S3G_ORG_PRICINGDOCDET 
         where ADD_DOC_DESC=DOC.PRDDC_DOC_DESCRIPTION 
         and PRICING_ID=P_PRICING_ID   and IS_ADDITIONAL=1 ;
         
         if(D_COUNT>0)then
           begin
           update S3G_ORG_PRICINGDOCDET  set 
            IS_MANDATORY=DOC.IS_MANDATORY,
            IS_NEED_IMAGE_COPY=DOC.IS_NEED_IMAGE_COPY,
            REMARK=DOC.REMARK,
            IS_COLLECTED=DOC.IS_COLLECTED,
            IS_SCANNED=DOC.IS_SCANNED,
            value=DOC.value,
            PRDDC_DOC_CAT_ID=DOC.PRDDC_DOC_CAT_ID,
            IS_REQUIRED=DOC.IS_REQUIRED,
            RECEIVED_STATUS=DOC.RECEIVED_STATUS,
            COLLECTED_BY=DOC.COLLECTED_BY_ID,
            COLLECTED_ON=DOC.COLLECTED_ON,
            CAD_RECEIVED_BY=DOC.CAD_RECEIVED_BY,
            CAD_RECEIVED_ON=DOC.CAD_RECEIVED_ON,
            CAD_RECEIVER_REMARK=DOC.CAD_RECEIVER_REMARK,
            CAD_VERIFIED_BY=DOC.CAD_VERIFIED_BY,
            CAD_VERIFIED_ON=DOC.CAD_VERIFIED_ON,
            CAD_VERIFIER_REMARK=DOC.CAD_VERIFIER_REMARK,
            DOC_REF_PATH=DOC.DOC_REF_PATH,
            ID_ADDITIONAL=DOC.IS_ADDITIONAL,
            ADD_DOC_DESC=DOC.PRDDC_DOC_DESCRIPTION
            ;
           end;
           
           else--Insert
           
           INSERT INTO S3G_ORG_PRICINGDOCDET
            (
                PRICING_DOC_ID,
                PRICING_ID,
                CONSTITUTIONDOCCATEGORY_ID,
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
                IS_ADDITIONAL,
                ADD_DOC_DESC
            )
            select 
              SEQ_S3G_ORG_PRICINGDOCDET.NEXTVAL,
              P_PRICING_ID,
              DOC.CONSTITUTIONDOCCATEGORY_ID,
              DOC.REMARK,
              DOC.IS_COLLECTED,
              DOC.IS_SCANNED,
              DOC.value,
              DOC.PRDDC_DOC_CAT_ID,
              DOC.IS_REQUIRED,
              DOC.RECEIVED_STATUS,
              DOC.COLLECTED_BY_ID,
              DOC.COLLECTED_ON,
              DOC.CAD_RECEIVED_BY,
              DOC.CAD_RECEIVED_ON,
              DOC.CAD_RECEIVER_REMARK,
              DOC.CAD_VERIFIED_BY,
              DOC.CAD_VERIFIED_ON,
              DOC.CAD_VERIFIER_REMARK,
              DOC.DOC_REF_PATH,
              1,
              DOC.PRDDC_DOC_DESCRIPTION
              from dual;
           
         end if;
         END;
       end LOOP;
      end; 
        DELETE   from TMP_S3G_ORG_PRICINGDOCDET  where SESSION_USER_ID=P_CREATED_BY and PROGRAM_ID=42;  
        
         End;--Document Updation Start
        
            BEGIN--DownPayment Rceipt Updation Star
                merge into S3G_ORG_PRICINGDPRCPT TARGET
                using(
                SELECT 
                EXTRACTVALUE(VALUE(X),'/Details/@DownPayAmount') DOWN_PAY_AMOUNT,
                EXTRACTVALUE(value(X),'/Details/@DownPayReceipt') RECEIPT_NO
                from table (XMLSEQUENCE ((xmltype.CREATEXML(P_XML_DOWNPAYMENT_DTLS)).extract ('//Root/Details'))) X
                 )TBL on (TBL.RECEIPT_NO=TARGET.RECEIPT_NO AND TARGET.PRICING_ID=P_PRICING_ID)
                 when matched then 
                 update set DOWN_PAY_AMOUNT=TBL.DOWN_PAY_AMOUNT,RECEIPT_NO=TBL.RECEIPT_NO ; 
             END;--DownPayment Rceipt Updation End
             
      p_errorcode := 0;     
    end; 
    
  ELSE    
    begin    
      p_errorcode := 2;     
      return;    
    end;    
  End IF;
   
End S3G_OR_Upd_PricgDet;