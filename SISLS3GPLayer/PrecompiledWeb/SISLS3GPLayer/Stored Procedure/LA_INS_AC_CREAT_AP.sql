create or replace
PROCEDURE "LA_INS_AC_CREAT_AP" (
    P_COMPANY_ID             IN NUMBER,
    P_APPLICATION_PROCESS_ID IN NUMBER,
    P_ERRORCODE OUT NUMBER 
    , P_ACCOUNT_NO OUT varchar
    )
AS
  p_hdoc sys.xmltype;
  P_Xmldocid                   NUMBER;
  P_Sanumber                   VARCHAR2(50);
  P_Sa_Status_Code             NUMBER;
  P_Isbasemla                  NUMBER;
  P_Progarm_Id                 NUMBER;
  P_Program_Pk_Id              NUMBER;
  P_Frequency                  NUMBER;
  P_Flag                       NUMBER;
  P_Location_Code              VARCHAR2(30);
  P_Issla_Applicable           NUMBER;
  P_Remainingapplicationamount NUMBER;
  P_Isbasemlaapplicable        NUMBER;
  P_Existingapplicationamount  NUMBER;
  P_Followup_Id                NUMBER;
  P_Followupheaderid           NUMBER;
  P_Recrdcount                 NUMBER;
  P_Pa_Sa_Ref_Id               NUMBER;
  P_Lobname                    VARCHAR2(100);
  P_Varcustomercreditcount     NUMBER;
  P_Varutilizedamount          NUMBER;
  D_Panum                      VARCHAR2(50);
  D_Pa_Status_Code             NUMBER;
  P_Recdcount                  NUMBER;
  D_finyear                    VARCHAR (50);
  P_ACTIVATION_DATE            VARCHAR (50);
  P_ACCOUNTING_DATE            VARCHAR (50);
  P_MLASTATUS                  NUMBER;
  P_IS_MODIFY                  NUMBER;
  --------Base Parameters Start
  p_LOB_ID                      NUMBER;
  P_LOCATION_ID                 NUMBER;
  p_PANum                       VARCHAR(50);
  p_Product_ID                  NUMBER;
  p_Creation_Date               VARCHAR(50);
  p_Customer_ID                 NUMBER;
  p_Sales_Person_ID             NUMBER;
  p_Finance_Amount              NUMBER;
  p_Refinance_Contract          NUMBER;
  p_Constitution_ID             NUMBER;
  p_Lease_Type                  NUMBER ;
  p_PA_Statustype_Code          NUMBER;
  p_PA_Status_Code              NUMBER;
  p_Txn_id                      NUMBER;
  p_Created_By                  NUMBER;
  p_Modified_By                 NUMBER;
  p_Offer_Residual_Value        NUMBER;
  p_Offer_Residual_Value_Amount NUMBER;
  p_Offer_Margin                NUMBER;
  p_Offer_Margin_Amount         NUMBER;
  p_ROIRuleId                   NUMBER ;
  p_PaymentRuleCardId           NUMBER ;
  p_LoanAmount                  NUMBER;
  p_TenureTypeCode              NUMBER ;
  p_TenureCode                  NUMBER ;
  p_Tenure                      NUMBER ;
  p_RepaymentTypecode           NUMBER ;
  p_Repaymentcode               NUMBER ;
  p_RepaymentTimeTypeCode       NUMBER ;
  p_RepaymentTimeCode           NUMBER ;
  p_FBDate                      NUMBER ;
  p_AdvanceInstallments         NUMBER ;
  p_IsDORequired                NUMBER ;
  p_LastODICalcDate             VARCHAR(50) ;
  p_BusinessIRR                 NUMBER;
  p_CompanyIRR                  NUMBER;
  P_ACCOUNTINGIRR               NUMBER;
  P_Xmlalertdetails             VARCHAR(50) ;
  p_XmlGuarantorDetails         VARCHAR(50) ;
  P_Xmlmoratoriumdetails        VARCHAR(50) ;
  P_Xmlfollowupdetail           VARCHAR(50) ;
  P_Xmlrepaymentdetails         VARCHAR(50) ;
  P_Xmlinflowdetails            VARCHAR(50) ;
  P_Xmloutflowdetails           VARCHAR(50) ;
  P_Xmlassetdetails             VARCHAR(50) ;
  P_Xmlroidetails               VARCHAR(50) ;
  P_Xmlconstitutiondocdetails   VARCHAR(50) ;
  p_XmlInvoiceDetails           VARCHAR(50) ;
  P_XML_REPAYMENTSTRUCTURE      VARCHAR(50) ;
  p_SA_Internal_code_Ref        VARCHAR(50) ;
  p_SA_User_Name                VARCHAR(50) ;
  p_SA_User_Address1            VARCHAR(50) ;
  p_SA_User_Address2            VARCHAR(50) ;
  p_SA_User_City                VARCHAR(50) ;
  p_SA_User_State               VARCHAR(50) ;
  p_SA_User_Country             VARCHAR(50) ;
  p_SA_User_Pincode             VARCHAR(50) ;
  p_SA_User_Phone               VARCHAR(50) ;
  p_SA_User_Mobile              VARCHAR(50) ;
  p_Sa_User_Email               VARCHAR(50) ;
  P_Sa_User_Website             VARCHAR(50) ;
  p_DocumentNo                  VARCHAR(50) ;
  P_SPLIT_REFNO                 VARCHAR(50) ;
  P_XMLREPAYDETAILSOTHERS CLOB ;
  --------Base Parameters End
  p_AccountNumber      VARCHAR(50);
  P_ERROR_MESSEGE      VARCHAR(50);
  P_APPLICATION_NUMBER VARCHAR(50) ;
  d_LOB_CODE           VARCHAR(20) ;
  --MFC CUST
  P_FIRST_INSTALMENT_DATE DATE ;
  P_INCOME_BOOKING_START_DATE DATE ;
  P_DELAY_CHARGES_APPLI     NUMBER;
  P_CHARGEABLE_DELAY_DAYS   NUMBER;
  P_DELAY_CHARGE_GRACE_DAYS NUMBER;
  P_DELAY_CHARGE_RATE       NUMBER;
  P_DELAY_CHARGE_AMOUNT     NUMBER;
  P_OVERDUE_CHARGES         NUMBER;
  P_EX_FIRST_CHARGES        NUMBER;
  P_EX_SECOND_CHARGES       NUMBER;
  P_PAYMENT_DUE_DATE DATE ;
  P_DEALER_CREDIT_PERIOD     NUMBER;
  P_COVENANTS                NUMBER;
  P_COVENANTS_CONDI          NUMBER;
  P_EMPLOYER_BANK_NAME       NUMBER;
  P_INSURANCE_AMOUNT         NUMBER;
  P_LIFE_INSURANCE_APPLI     NUMBER;
  P_LIFE_INSURANCE_ENTITY    NUMBER;
  P_INSURANCE_COVERAGE_DAY   NUMBER;
  P_INSURANCE_CUST_RATE      NUMBER;
  P_INSURANCE_COMPANY_RATE   NUMBER;
  P_INSURANCE_PREM_AMOUNT    NUMBER;
  P_INSURANCE_PAYABLE_AMOUNT NUMBER;
  P_DEALER_COMM_APPLI        NUMBER;
  P_RISK_RATING              NUMBER;
  P_RISK_REMARKS             VARCHAR(200) ;
  P_RISK_SCORE               NUMBER;
  P_RISK_DOC_NO              VARCHAR(200) ;
  P_RISK_QUALITY_VALUE       NUMBER;
  P_RISK_AML_CLASS           VARCHAR(200) ;
  P_DEBT_PURCHASE_LIMIT      NUMBER;
  P_EVALUATOR                VARCHAR(200) ;
  P_AUDITOR                  VARCHAR(200) ;
  P_INVOICE_CAP_VALUE        NUMBER;
  P_DISCOUNT_RATE_LOC        NUMBER;
  P_PENAL_RATE               NUMBER;
  P_CREDIT_PERIOD_DAYS       NUMBER;
  P_GRACE_PERIOD_DAYS        NUMBER;
  P_DISP_PERIOD_DAYS         NUMBER;
  P_RESUL_PERIOD_DAYS        NUMBER;
  p_factoring_remarks        varchar(200) ;
  d_documentation_type varchar(10);
  
BEGIN
  -- *********************************************
  -- Author        : Sathish R
  -- Create Date   : 24-Aug-2018
  -- Description   : Insert Account Creation Details for MFC Customization
  -- *********************************************
  EXECUTE Immediate ('Alter session set NLS_COMP = LINGUISTIC');
  EXECUTE Immediate ('Alter session set NLS_SORT = BINARY_CI');
  D_Pa_Status_Code := P_Pa_Status_Code;
  P_Errorcode      := 0;
  p_flag           := 0;
  p_location_Code  := FN_Get_LocationCode(p_location_id);
  BEGIN--Fetch Application Start
    SELECT LOB_ID,
      LOCATION_CODE,
      PRODUCT_ID,
      CONSTITUTION_ID,
      CUSTOMER_ID,
      FINANCE_AMOUNT,
      APPLICATION_NUMBER,
      LOCATION_ID,
      SALES_PERSON_ID,
      FINANCE_AMOUNT,
      REFINANCE_CONTRACT,
      LEASE_TYPE,
      OFFER_RESIDUAL_VALUE,
      OFFER_RESIDUAL_VALUE_AMOUNT,
      OFFER_MARGIN,
      OFFER_MARGIN_AMOUNT,
      PAYMENT_RULE_CARD_ID,
      TENURE_TYPE,
      TENURE,
      RECEIPT_TYPE,--Repayment Mode
      FBDATE,
      ACCOUNTING_IRR,
      BUSINESS_IRR,
      COMPANY_IRR,
      TO_CHAR(APPLICAION_PROCESS_DATE,'MM/DD/YYYY')
      ||' 12:00:00 AM',
      CREATED_BY,
      --MFC
      FIRST_INSTALMENT_DATE ,
      INCOME_BOOKING_START_DATE ,
      DELAY_CHARGES_APPLI ,
      CHARGEABLE_DELAY_DAYS ,
      DELAY_CHARGE_GRACE_DAYS ,
      DELAY_CHARGE_RATE ,
      DELAY_CHARGE_AMOUNT ,
      OVERDUE_CHARGES ,
      EX_FIRST_CHARGES ,
      EX_SECOND_CHARGES ,
      PAYMENT_DUE_DATE ,
      DEALER_CREDIT_PERIOD ,
      COVENANTS ,
      --COVENANTS_CONDI ,
      EMPLOYER_BANK_NAME ,
      INSURANCE_AMOUNT ,
      LIFE_INSURANCE_APPLI ,
      LIFE_INSURANCE_ENTITY ,
      INSURANCE_COVERAGE_DAY ,
      INSURANCE_CUST_RATE ,
      INSURANCE_COMPANY_RATE ,
      INSURANCE_PREM_AMOUNT ,
      INSURANCE_PAYABLE_AMOUNT ,
      DEALER_COMM_APPLI ,
      RISK_RATING ,
      RISK_REMARKS ,
      RISK_SCORE,
      RISK_DOC_NO ,
      RISK_QUALITY_VALUE ,
      RISK_AML_CLASS ,
      DEBT_PURCHASE_LIMIT ,
      EVALUATOR ,
      AUDITOR ,
      INVOICE_CAP_VALUE ,
      DISCOUNT_RATE_LOC ,
      PENAL_RATE ,
      CREDIT_PERIOD_DAYS ,
      GRACE_PERIOD_DAYS ,
      DISP_PERIOD_DAYS ,
      RESUL_PERIOD_DAYS ,
      FACTORING_REMARKS
    INTO P_LOB_ID,
      P_LOCATION_CODE,
      P_PRODUCT_ID,
      P_CONSTITUTION_ID,
      P_CUSTOMER_ID,
      p_Finance_Amount,
      P_APPLICATION_NUMBER,
      P_LOCATION_ID,
      P_SALES_PERSON_ID,
      P_FINANCE_AMOUNT,
      P_REFINANCE_CONTRACT,
      P_LEASE_TYPE,
      P_OFFER_RESIDUAL_VALUE,
      P_OFFER_RESIDUAL_VALUE_AMOUNT,
      P_OFFER_MARGIN,
      P_OFFER_MARGIN_AMOUNT,
      p_PaymentRuleCardId,
      p_TenureCode,
      P_TENURE,
      p_RepaymentTypecode,
      P_FBDATE,
      P_ACCOUNTINGIRR,
      P_BUSINESSIRR,
      P_COMPANYIRR,
      P_CREATION_DATE,
      P_CREATED_BY,
      --MFC
      P_FIRST_INSTALMENT_DATE ,
      P_INCOME_BOOKING_START_DATE,
      P_DELAY_CHARGES_APPLI ,
      P_CHARGEABLE_DELAY_DAYS ,
      P_DELAY_CHARGE_GRACE_DAYS ,
      P_DELAY_CHARGE_RATE ,
      P_DELAY_CHARGE_AMOUNT ,
      P_OVERDUE_CHARGES ,
      P_EX_FIRST_CHARGES ,
      P_EX_SECOND_CHARGES ,
      P_PAYMENT_DUE_DATE,
      P_DEALER_CREDIT_PERIOD ,
      P_COVENANTS ,
      --P_COVENANTS_CONDI ,
      P_EMPLOYER_BANK_NAME ,
      P_INSURANCE_AMOUNT ,
      P_LIFE_INSURANCE_APPLI ,
      P_LIFE_INSURANCE_ENTITY ,
      P_INSURANCE_COVERAGE_DAY ,
      P_INSURANCE_CUST_RATE ,
      P_INSURANCE_COMPANY_RATE ,
      P_INSURANCE_PREM_AMOUNT ,
      P_INSURANCE_PAYABLE_AMOUNT ,
      P_DEALER_COMM_APPLI,
      P_RISK_RATING ,
      P_RISK_REMARKS ,
      P_RISK_SCORE ,
      P_RISK_DOC_NO ,
      P_RISK_QUALITY_VALUE ,
      P_RISK_AML_CLASS ,
      P_DEBT_PURCHASE_LIMIT ,
      P_EVALUATOR ,
      P_AUDITOR ,
      P_INVOICE_CAP_VALUE ,
      P_DISCOUNT_RATE_LOC ,
      P_PENAL_RATE ,
      P_CREDIT_PERIOD_DAYS ,
      P_GRACE_PERIOD_DAYS ,
      P_DISP_PERIOD_DAYS ,
      P_RESUL_PERIOD_DAYS ,
      P_FACTORING_REMARKS
    FROM S3G_ORG_AppProc
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
    P_PA_STATUSTYPE_CODE       :=25;
    P_SA_STATUS_CODE           :=2;
  END;--Fetch Application End
  --DP_AUTO_TRAN('Line-LA_INS_AC_CREAT_AP-Check-1-'||p_Creation_Date);
  BEGIN--Check Fin Year Start
    d_finyear     := S3G_GetFinyear(p_Creation_Date);
    IF(d_finyear   ='0') THEN
      P_Errorcode :=8;
      RETURN;
    END IF;
  END;--Check Fin Year end
  -- DP_AUTO_TRAN('Line-LA_INS_AC_CREAT_AP-Check-2-');
   --DP_AUTO_TRAN('Line-D_PANum==>'||D_PANum||'d_finyear=>'||d_finyear||'P_LOB_ID==>'||P_LOB_ID);
  BEGIN--Document Number Validation Start
  
  
  select LOB_CODE   into D_LOB_CODE  from  s3g_sysad_lobmaster where LOB_ID=P_LOB_ID;
  
    if(D_LOB_CODE='HP') then
      BEGIN
      d_documentation_type:='MLA';
      END;
    else
      begin
      D_DOCUMENTATION_TYPE:='FACT';
      p_RepaymentTypecode:=null;
      END;
    END IF;
  
  
    IF(D_PANum IS NULL OR NVL(D_PANum,' ') = ' ' OR D_PANum = '0') THEN
      BEGIN
        S3g_Or_Get_Docctrlno(P_Company_Id ,d_documentation_type,1,P_Lob_Id,P_Location_Id ,D_PANum,d_finyear);
        IF (D_PANum = '-1') THEN
          BEGIN
            P_Errorcode := -1;
            RETURN;
          END;
        END IF;
        IF (D_PANum = '-2') THEN
          BEGIN
            P_Errorcode := -2;
            RETURN;
          END;
        END IF;
        p_flag     := 1;
      
       d_panum:=substr(fn_get_locationcode(p_location_id),4,5)||d_panum;
      -- DP_AUTO_TRAN('Line-LA_INS_AC_CREAT_AP-Check-4-'||d_panum);
        P_Sanumber := D_PANum || 'DUMMY';
        --P_Sa_Status_Code := D_Pa_Status_Code;
        P_ACCOUNTNUMBER := D_PANUM;
        P_ACCOUNT_NO:=D_PANUM;
      END;
    END IF;
  END; --Document Number Validation Start
  --DP_AUTO_TRAN('Line-LA_INS_AC_CREAT_AP-Check-4-');
  BEGIN --Insert Account Creation Header Table Start
    SELECT Seq_Lad_Acccreation.Nextval INTO p_Program_PK_ID FROM dual;
    INSERT
    INTO S3G_LAD_ACCCREATION
      (
        ACCOUNT_CREATION_ID,
        COMPANY_ID,
        LOB_ID,
        LOCATION_CODE,
        LOCATION_ID,
        Panum,
        Product_Id,
        Application_Process_Id,
        Creation_Date,
        Customer_Id,
        Sales_Person_Id,
        Finance_Amount,
        Refinance_Contract,
        Constitution_Id,
        Lease_Type,
        Pa_Statustype_Code,
        Pa_Status_Code,
        Txn_Id,
        Offer_Residual_Value,
        Offer_Residual_Value_Amount,
        Offer_Margin,
        Offer_Margin_Amount,
        Created_By,
        Created_On,
        Modified_By,
        Modified_On,
        Remainin_Application_Amount
      )
      VALUES
      (
        p_Program_PK_ID,
        P_Company_Id,
        P_Lob_Id,
        P_LOCATION_CODE,
        P_LOCATION_ID,
        D_PANum,
        P_Product_Id,
        P_Application_Process_Id,
        fn_todate(P_Creation_Date),
        P_Customer_Id,
        P_Sales_Person_Id,
        P_Finance_Amount,
        P_REFINANCE_CONTRACT,
        P_Constitution_Id,
        P_LEASE_TYPE,
        25,--P_PA_STATUSTYPE_CODE,
        3, --D_PA_Status_Code,
        1, --P_Txn_Id,
        P_Offer_Residual_Value,
        P_Offer_Residual_Value_Amount,
        P_Offer_Margin,
        P_Offer_Margin_Amount,
        P_Created_By,
        Sysdate,
        P_MODIFIED_BY,
        sysdate,
        P_REMAININGAPPLICATIONAMOUNT
      );
    S3G_SYSAD_TRANS_HISTORY(80,p_Program_PK_ID,D_PANum,TO_CHAR(SYSTIMESTAMP,'MM/DD/YYYY'),P_CREATED_BY,1);
    --DP_AUTO_TRAN('Line-LA_INS_AC_CREAT_AP-Check-5-');
  END;--Insert Account Creation Header Table End
  BEGIN
    SELECT ROI.Roi_Rules_Id
    INTO P_Roiruleid
    FROM S3G_ORG_APPPROCOFFERROIDET ROI
    WHERE APPLICATION_PROCESS_ID=p_Application_Process_ID;
  END;
  BEGIN--P_Followup_Id START
    SELECT MAX(Followup_Id) INTO P_Followup_Id FROM S3G_LAD_ACCPASADET;
    IF (P_Followup_Id IS NULL) THEN
      BEGIN
        P_Followup_Id := 1;
      END;
    ELSE
      BEGIN
        P_Followup_Id := P_Followup_Id + 1;
      END;
    END IF;
    SELECT Program_id
    INTO p_Progarm_id
    FROM S3g_Sysad_Programmaster
    WHERE PROGRAM_Code='ACR';
    SELECT Seq_ORG_FollowUp.Nextval INTO P_Followupheaderid FROM dual;
    INSERT
    INTO S3g_Org_Followup
      (
        FOLLOW_UP_ID,
        Program_Id,
        Program_Pk_Id,
        Lob_Id,
        Location_Code,
        Company_Id,
        Panum,
        Sanum,
        Followup_Date,
        Created_By,
        Created_On,
        Modified_By,
        Modofied_On
      )
      VALUES
      (
        P_Followupheaderid,
        P_Progarm_Id,
        P_Program_Pk_Id,
        P_Lob_Id,
        P_LOCATION_CODE,
        P_COMPANY_ID,
        D_PANUM,
        P_SANUMBER,
        sysdate,
        P_Created_By,
        Sysdate,
        p_Created_By,
        Sysdate
      );
    ----------------Clarification Temp Commented
    --            INSERT
    --            INTO S3g_Org_Followupdetail
    --              (
    --                FOLLOW_UP_DETAIL_ID,
    --                follow_up_id,
    --                from_userid,
    --                to_userid,
    --                action,
    --                Followup_Date,
    --                Action_Date,
    --                Customer_Response,
    --                Remarks,
    --                Created_By,
    --                Created_On,
    --                Modified_By,
    --                Modified_On
    --              )
    --            SELECT seq_org_followupdetail.nextval,
    --              P_Followupheaderid,
    --              doc.fromuserid,
    --              doc.touserid,
    --              doc.action,
    --              fn_todate(doc.dates),
    --              FN_TODATE(DOC.ACTIONDATE),
    --              DOC.CUSTOMERRESPONSE,
    --              Doc.Remarks,
    --              P_Created_By,
    --              Sysdate,
    --              P_Created_By,
    --              sysdate
    --              FROM s3g_org_followupdetail WHERE
    --              ;
  END; --P_Followup_Id END
  BEGIN--INSERT S3g_Lad_Accpasadet START
    --  Select Max(Pa_Sa_Ref_Id) Into P_Pa_Sa_Ref_Id
    --    From S3g_Lad_Accpasadet;
    --
    --  if (p_PA_SA_REF_ID is null) Then
    --    Begin
    --      P_Pa_Sa_Ref_Id := 1;
    --    end;
    --  else
    --    Begin
    --      P_Pa_Sa_Ref_Id := P_Pa_Sa_Ref_Id + 1;
    --    End;
    --  End IF;
    SELECT SEQ_S3g_Lad_Accpasadet.NEXTVAL
    INTO P_Pa_Sa_Ref_Id
    FROM dual;
    INSERT
    INTO S3g_Lad_Accpasadet
      (
        ACCOUNT_PA_SA_DETAILS_ID,
        Panum,
        Sanum,
        Company_Id,
        Pa_Sa_Ref_Id,
        Loan_Amount,
        Tenure_Type_Code,
        Tenure_Code,
        Tenure,
        Roi_Rule_Type,
        Roi_Rule_Id,
        Payment_Rule_Card_Id,
        Followup_Id,
        Repayment_Type_Code,
        Repayment_Code,
        Repayment_Time_Type_Code,
        Repayment_Time_Code,
        Fb_Date,
        Advance_Installments,
        Is_Delivery_Order_Require,
        Last_Odi_Date,
        Sa_Internal_Code_Ref,
        Created_Date,
        Created_By,
        Modified_Date,
        Modified_By,
        Sa_Statustype_Code,
        SA_STATUS_CODE,
        BUSINESS_IRR,
        COMPANY_IRR,
        ACCOUNTING_IRR,
        CREATION_DATE,
        FINANCE_AMOUNT,
        ACCOUNT_CREATION_ID,
        First_Instalment_Date,
        INCOME_BOOKING_START_DATE,
        delay_charges_appli,
        CHARGEABLE_DELAY_DAYS,
        delay_charge_Grace_Days,
        DELAY_CHARGE_RATE,
        delay_charge_Amount,
        OVERDUE_CHARGES,
        EX_FIRST_CHARGES,
        Ex_Second_charges,
        PAYMENT_DUE_DATE,
        Dealer_Credit_Period,
        COVENANTS,
        COVENANTS_CONDI,
        Employer_Bank_Name,
        INSURANCE_AMOUNT,
        LIFE_INSURANCE_APPLI,
        LIFE_Insurance_Entity,
        INSURANCE_COVERAGE_DAY,
        INSURANCE_CUST_RATE,
        Insurance_Company_Rate,
        INSURANCE_PREM_AMOUNT,
        INSURANCE_PAYABLE_AMOUNT,
        DEALER_COMM_APPLI,
        Risk_Rating,
        RISK_REMARKS,
        Risk_Score,
        RISK_DOC_NO,
        Risk_Quality_Value,
        RISK_AML_CLASS,
        DEBT_PURCHASE_LIMIT,
        Evaluator,
        AUDITOR,
        INVOICE_CAP_VALUE,
        DISCOUNT_RATE_LOC,
        Penal_rate,
        CREDIT_PERIOD_DAYS,
        GRACE_PERIOD_DAYS,
        DISP_PERIOD_DAYS,
        Resul_Period_Days,
        FACTORING_REMARKS
      )
      VALUES
      (
        Seq_Lad_Accpasadet.Nextval,
        D_PANum,
        P_Sanumber,
        P_Company_Id,
        P_Pa_Sa_Ref_Id,
        P_Loanamount,
        P_Tenuretypecode,
        P_Tenurecode,
        P_Tenure,
        50,
        P_Roiruleid,
        P_Paymentrulecardid,
        P_Followup_Id,
        P_Repaymenttypecode,
        P_Repaymentcode,
        P_Repaymenttimetypecode,
        P_REPAYMENTTIMECODE,
        P_FBDATE,
        P_ADVANCEINSTALLMENTS,
        P_ISDOREQUIRED,
        fn_todate(P_Lastodicalcdate),
        P_Sa_Internal_Code_Ref,
        Sysdate,
        P_Created_By,
        SYSDATE,
        P_MODIFIED_BY,
        P_PA_STATUSTYPE_CODE ,
        P_SA_STATUS_CODE,
        P_BUSINESSIRR,
        P_COMPANYIRR,
        P_ACCOUNTINGIRR,
        FN_TODATE(P_CREATION_DATE),
        P_FINANCE_AMOUNT,
        P_PROGRAM_PK_ID,
        P_FIRST_INSTALMENT_DATE,
        P_INCOME_BOOKING_START_DATE,
        P_delay_charges_appli,
        P_CHARGEABLE_DELAY_DAYS,
        P_DELAY_CHARGE_GRACE_DAYS,
        P_DELAY_CHARGE_RATE,
        P_DELAY_CHARGE_AMOUNT,
        P_OVERDUE_CHARGES,
        P_EX_FIRST_CHARGES,
        P_EX_SECOND_CHARGES,
        P_PAYMENT_DUE_DATE,
        P_Dealer_Credit_Period,
        P_COVENANTS,
        P_COVENANTS_CONDI,
        P_EMPLOYER_BANK_NAME,
        P_INSURANCE_AMOUNT,
        P_LIFE_INSURANCE_APPLI,
        P_LIFE_INSURANCE_ENTITY,
        P_INSURANCE_COVERAGE_DAY,
        P_INSURANCE_CUST_RATE,
        P_INSURANCE_COMPANY_RATE,
        P_INSURANCE_PREM_AMOUNT,
        P_INSURANCE_PAYABLE_AMOUNT,
        P_DEALER_COMM_APPLI,
        P_RISK_RATING,
        P_RISK_REMARKS,
        P_RISK_SCORE,
        P_RISK_DOC_NO,
        P_RISK_QUALITY_VALUE,
        P_RISK_AML_CLASS,
        P_DEBT_PURCHASE_LIMIT,
        P_Evaluator,
        P_AUDITOR,
        P_INVOICE_CAP_VALUE,
        P_DISCOUNT_RATE_LOC,
        P_Penal_rate,
        P_CREDIT_PERIOD_DAYS,
        P_GRACE_PERIOD_DAYS,
        P_DISP_PERIOD_DAYS,
        P_RESUL_PERIOD_DAYS,
        P_FACTORING_REMARKS
      );
  END; --INSERT S3g_Lad_Accpasadet END
  BEGIN--INSERT S3g_Lad_Accofferroidet START--ROI
    INSERT
    INTO S3g_Lad_Accofferroidet
      (
        Account_Offer_Roi_Details_Id,
        Panum,
        Sanum,
        Company_Id,
        Rate_Type_Code,
        Repayment_Modetype_Code,
        Roi_Rules_Id,
        Model_Description,
        Roi_Rule_Number,
        Return_Pattern,
        Time_Value,
        Frequency,
        Rate,
        Irr_Rest,
        Interest_Calculation,
        Interest_Levy,
        Recovery_Pattern_Year1,
        Recovery_Pattern_Year2,
        Recovery_Pattern_Year3,
        Recovery_Pattern_Rest,
        Insurance,
        Residual_Value,
        Margin,
        Margin_Percentage,
        Rate_Type,
        Repayment_Mode_Code,
        IRR_RATE,
        PA_SA_REF_ID
      )
    SELECT SEQ_LAD_ACCOFFERROIDET.NEXTVAL,
      D_PANUM,
      P_Sanumber,
      P_COMPANY_ID,
      50,
      51,
      Roi.Roi_Rules_Id,
      ROI.MODEL_DESCRIPTION,
      ROI.ROI_RULE_NUMBER,
      Roi.Return_Pattern,
      ROI.TIME_VALUE,
      ROI.FREQUENCY,
      ROI.RATE,
      Roi.Irr_Rest,
      ROI.INTEREST_CALCULATION,
      Roi.Interest_Levy,
      ROI.RECOVERY_PATTERN_YEAR1,
      Roi.Recovery_Pattern_Year2,
      ROI.RECOVERY_PATTERN_YEAR3,
      ROI.RECOVERY_PATTERN_REST,
      Roi.Insurance,
      ROI.RESIDUAL_VALUE,
      ROI.MARGIN,
      ROI.MARGIN_PERCENTAGE,
      ROI.RATE_TYPE,
      ROI.REPAYMENT_MODE,
      ROI.IRR_RATE,
      P_Pa_Sa_Ref_Id
    FROM S3G_ORG_APPPROCOFFERROIDET ROI
    WHERE APPLICATION_PROCESS_ID=p_Application_Process_ID;
  END; --INSERT S3g_Lad_Accofferroidet END--ROI
  BEGIN--INSERT S3g_Lad_Accalertdet START
    INSERT
    INTO S3g_Lad_Accalertdet
      (
        Account_Alert_Details_Id,
        Company_Id,
        Panum,
        Sanum,
        Alerts_Type,
        User_Id,
        Alerts_Sms,
        Alerts_Email,
        PA_SA_REF_ID
      )
    SELECT SEQ_LAD_ACCALERTDET.NEXTVAL,
      P_COMPANY_ID ,
      D_PANUM,
      P_SANUMBER,
      ALERTS_TYPE,
      ALERTS_USERCONTACT,
      CASE
        WHEN UPPER(ALERTS_SMS) = 'TRUE'
        THEN 1
        ELSE 0
      END,
      CASE
        WHEN UPPER(ALERTS_EMAIL) = 'TRUE'
        THEN 1
        ELSE 0
      End,
      P_PA_SA_REF_ID
    FROM S3G_ORG_APPPROCALERTDET
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END; --INSERT S3g_Lad_Accalertdet END
  BEGIN--INSERT S3g_Lad_Acccashflowdet INFLOW START
    INSERT
    INTO S3g_Lad_Acccashflowdet
      (
        ACCOUNTCASHFLOW_DETAILS_ID,
        COMPANY_ID,
        PANUM,
        SANUM,
        COMPONENT_CODE,
        CASHFLOW_DATE,
        Cashflow_Type,
        CASHFLOW_AMOUNT,
        Cashflow_Entity_Type,
        Cashflow_Entity_Code,
        PA_SA_REF_ID
      )
    SELECT Seq_Lad_Acccashflowdet.NEXTVAL,
      P_COMPANY_ID,
      D_PANUM,
      P_SANUMBER,
      Offer.Cashflow_Id,
      OFFER.APPDATE,
      53,
      OFFER.AMOUNT,
      OFFER.INFLOW_PAYTO,
      Offer.Entity,
      P_PA_SA_REF_ID
    FROM S3g_Org_Appprocofferdet Offer
    INNER JOIN S3g_Org_Cashflowmaster Cashflow
    ON Cashflow.Cashflow_Id = Offer.Cashflow_Id
    LEFT JOIN S3g_Org_Entitymaster Entity
    ON Entity.Entity_Id = Offer.Entity
    LEFT JOIN S3g_Org_Custmaster Customer
    ON Customer.Customer_Id = Offer.Entity
    INNER JOIN S3g_Status_Lookup Status
    ON Status.Id               = Offer.Inflow_Payto
    WHERE Cashflow.Flow_Type  IN ('Inflow','Both')
    AND Status.Type            ='CASH_FLOW_FROM'
    AND APPLICATION_PROCESS_ID = P_APPLICATION_PROCESS_ID
      --ORDER BY OFFER.APPDATE
      ;
  END; --INSERT S3g_Lad_Acccashflowdet INFLOW END
  BEGIN--INSERT S3g_Lad_Acccashflowdet OUTFLOW START
    INSERT
    INTO S3g_Lad_Acccashflowdet
      (
        ACCOUNTCASHFLOW_DETAILS_ID,
        Company_Id,
        Panum,
        Sanum,
        Component_Code,
        Cashflow_Date,
        Cashflow_Type,
        Cashflow_Amount,
        Cashflow_Entity_Type,
        Cashflow_Entity_Code,
        PA_SA_REF_ID
      )
    SELECT SEQ_LAD_ACCCASHFLOWDET.NEXTVAL,
      P_COMPANY_ID,
      D_PANUM,
      P_SANUMBER,
      Offer.Cashflow_Id,
      OFFER.APPDATE,
      55,
      OFFER.AMOUNT,
      OFFER.INFLOW_PAYTO,
      Offer.Entity,
      P_PA_SA_REF_ID
    FROM S3g_Org_Appprocofferdet Offer
    INNER JOIN S3g_Org_Cashflowmaster Cashflow
    ON Cashflow.Cashflow_Id = Offer.Cashflow_Id
    LEFT JOIN S3g_Org_Entitymaster Entity
    ON Entity.Entity_Id = Offer.Entity
    LEFT JOIN S3g_Org_Custmaster Customer
    ON Customer.Customer_Id = Offer.Entity
    INNER JOIN S3g_Status_Lookup Status
    ON Status.Id               = Offer.Inflow_Payto
    WHERE Cashflow.Flow_Type  IN ('Outflow','Both')
    AND Status.Type            ='CASH_FLOW_FROM'
    AND APPLICATION_PROCESS_ID = P_APPLICATION_PROCESS_ID
      --ORDER BY OFFER.APPDATE
      ;
  END;  --INSERT S3g_Lad_Acccashflowdet OUTFLOW END
  BEGIN---INSERT S3G_LAD_ACCGUARANTRDET START
    INSERT
    INTO S3G_LAD_ACCGUARANTRDET
      (
        ACCOUNT_GUARANTOR_DETAILS_ID,
        COMPANY_ID,
        PANUM,
        GUARANTEE_TYPE_CODE,
        GUARANTEE_TYPE,
        GUARANTEE_AMOUNT,
        CHARGE_SEQUENCE,
        Guarantee_Id,
        PA_SA_REF_ID
      )
    SELECT SEQ_LAD_ACCGUARANTRDET.NEXTVAL,
      P_COMPANY_ID,
      D_PANUM,
      62,
      GUARANTEE_TYPE_ID,
      GUARANTEE_AMOUNT,
      CHARGE_SEQUENCE,
      Cum.Customer_Id,
      P_PA_SA_REF_ID
    FROM S3g_Org_Appprocguarantordet Apgd
    INNER JOIN S3g_Org_Custmaster CUM
    ON CUM.Customer_Id = APGD.Guarantee_Id
    INNER JOIN S3g_Status_Lookup Status
    ON Status.Id = Apgd.Guarantee_Type_Id
    INNER JOIN S3g_Status_Lookup Slup
    ON Slup.Id                   = Apgd.Charge_Sequence
    WHERE APPLICATION_PROCESS_ID = P_APPLICATION_PROCESS_ID;
  END;---INSERT S3G_LAD_ACCGUARANTRDET END
  BEGIN--INSERT S3g_Lad_Accrepaymntdet START
    INSERT
    INTO S3g_Lad_Accrepaymntdet
      (
        Account_Repay_Id,
        Panum,
        Sanum,
        Repayment_Cashflow,
        Amount,
        Per_Instalment_Amount,
        Breakup_Percentage,
        From_Instalment,
        To_Instalment,
        From_Date,
        To_Date,
        PA_SA_REF_ID
      )
    SELECT SEQ_LAD_ACCREPAYMNTDET.NEXTVAL,
      T.*
    FROM
      (SELECT D_PANUM,
        P_SANUMBER,
        Repayment_Cashflow,
        AMOUNT,
        PER_INSTALMENT_AMOUNT,
        NVL(Breakup_Percentage,0),
        From_Instalment,
        To_Instalment,
        TO_TIMESTAMP(REPAY.FROM_DATE,'MM-DD-RRRR HH12:MI:SS AM'),
        To_Timestamp(Repay.To_Date,'MM-DD-RRRR HH12:MI:SS AM'),
        P_PA_SA_REF_ID
      FROM S3G_ORG_APPPROCREPAYDET REPAY
      INNER JOIN S3G_ORG_CASHFLOWMASTER CASHFLOW
      ON REPAY.REPAYMENT_CASHFLOW = CASHFLOW.CASHFLOW_ID
      INNER JOIN S3G_ORG_CASHFLOWMASTERPGMMAP CPM
      ON CASHFLOW.CASHFLOW_ID=CPM.CASHFLOW_ID
      AND CPM.PROGRAM_ID     =75--Account Activation
      INNER JOIN S3G_ORG_CASHFLOWMASTERCREDIT CFC
      ON CASHFLOW.CASHFLOW_ID=CFC.CASHFLOW_ID
      INNER JOIN S3G_ORG_CashFlowMasterDebit CFD
      ON Cashflow.Cashflow_Id      =CFD.CashFlow_ID
      WHERE APPLICATION_PROCESS_ID = P_APPLICATION_PROCESS_ID
      ORDER BY APPLICATION_PROCESS_REPAY_ID
      )T ;
  END; --INSERT S3g_Lad_Accrepaymntdet END
  BEGIN--INSERT  S3g_Lad_AccrepaymntdetAmort START
    INSERT
    INTO S3g_Lad_AccrepaymntdetAmort
      (
        ACCOUNT_REPAY_ID,
        PANUM,
        SANUM,
        REPAYMENT_CASHFLOW,
        AMOUNT,
        Per_Instalment_Amount,
        BREAKUP_PERCENTAGE,
        FROM_INSTALMENT,
        TO_INSTALMENT,
        FROM_DATE,
        To_Date,
        PA_SA_REF_ID
      )
    SELECT SEQ_LAD_ACCREPAYMNTDETAMORT.NEXTVAL,
      T.*
    FROM
      (SELECT D_PANUM,
        P_Sanumber,
        Repay.REPAYMENT_CASHFLOW,
        Repay.Amount,
        Repay.PER_INSTALMENT_AMOUNT,
        Repay.BREAKUP_PERCENTAGE,
        Repay.FROM_INSTALMENT,
        Repay.TO_INSTALMENT,
        TO_TIMESTAMP(Repay.FROM_DATE,'MM-DD-RRRR HH12:MI:SS AM'),
        To_Timestamp(Repay.To_Date,'MM-DD-RRRR HH12:MI:SS AM'),
        P_PA_SA_REF_ID
      FROM S3g_Org_AppprocrepaydetAmort Repay
      INNER JOIN S3g_Org_Cashflowmaster Cashflow
      ON Repay.Repayment_Cashflow = Cashflow.Cashflow_Id
      INNER JOIN S3G_ORG_CASHFLOWMASTERPGMMAP CPM
      ON CASHFLOW.CASHFLOW_ID=CPM.CASHFLOW_ID
      AND CPM.PROGRAM_ID     =75--Account Activation
      INNER JOIN S3G_ORG_CASHFLOWMASTERCREDIT CFC
      ON CASHFLOW.CASHFLOW_ID=CFC.CASHFLOW_ID
      INNER JOIN S3G_ORG_CASHFLOWMASTERDEBIT CFD
      ON CASHFLOW.CASHFLOW_ID      =CFD.CASHFLOW_ID
      WHERE APPLICATION_PROCESS_ID = P_APPLICATION_PROCESS_ID
      ORDER BY APPLICATION_PROCESS_REPAY_ID
      )T;
  END; --INSERT  S3g_Lad_AccrepaymntdetAmort END
  BEGIN--INSERT S3g_Lad_Accastdet START
    INSERT
    INTO S3g_Lad_Accastdet
      (
        ASSET_NUMBER,
        Company_Id,
        Pa_Sa_Ref_Id,
        Ref_Slno,
        Asset_Id,
        Asset_Code,
        Asset_Cost,
        Amount_Financed,
        Down_Payment,
        Amount_Paid,
        Block_Depreciation_Percentage,
        Book_Depreciation_Percentage,
        Txn_Id,
        Lob_Id,
        Location_Code,
        Pay_To_Entity_Type,
        Pay_To_Entity_Id,
        Payment_Percentage,
        MARGIN_PERCENTAGE,
        MARGIN_AMOUNT,
        ASSET_DISCOUNT,
        UNIT_COUNT
      )
    SELECT SEQ_LAD_ACCASTDET.NEXTVAL,
      T.*
    FROM
      (SELECT p_Company_Id,
        P_PA_SA_REF_ID,
        NVL(APD.SERIAL_NUMBER,1),
        Am.ASSET_ID,
        APD.ASSET_CODE,
        APD.NO_OF_UNITS * APD.UNIT_VALUE,
        APD.FINANCE_AMOUNT,
        Apd.MARGIN_AMOUNT AS Down_Payment,-- Down_Payment,
        FINANCE_AMOUNT              AS Amount_Paid,
        Apd.BLOCK_DEPRECIATION_PERCENTAGE,
        APD.BOOK_DEPRECIATION_PERCENTAGE,
        1 AS Txn_Id,
        p_LOB_ID,
        p_location_Code,
        Apd.PAY_TO,
        Apd.ENTITY_ID,
        Apd.PAYMENT_PERCENTAGE,
        Apd.MARGIN_PERCENTAGE,
        Apd.MARGIN_AMOUNT,
        Apd.DISCOUNT_AMOUNT,
        Apd.NO_OF_UNITS
      FROM S3g_Org_Appprocassetdet Apd
      LEFT JOIN S3g_Org_Assetmaster Am
      ON Am.ASSET_ID = Apd.ASSET_ID
      LEFT JOIN S3g_Org_Proforma Pro
      ON Pro.Ref_Doc_No    = Apd.Application_Process_Id
      AND Pro.Ref_Doc_Type = 3
      LEFT JOIN S3g_Lad_Leaseastreg Lar
      ON Lar.Lease_Asset_No = Apd.Lease_Asset_No
      LEFT OUTER JOIN S3g_Org_Entitymaster Em
      ON Apd.Entity_Id = Em.Entity_Id
      LEFT OUTER JOIN S3G_ORG_CUSTMASTER CUM
      ON APD.ENTITY_ID=CUM.CUSTOMER_ID
      LEFT JOIN S3G_STATUS_LOOKUP SLUP
      ON SLUP.ID                       = APD.PAY_TO
      AND SLUP.TYPE                    ='PAY_TO'
      WHERE Apd.APPLICATION_PROCESS_ID = P_APPLICATION_PROCESS_ID
      ORDER BY Apd.Application_Process_Asset_ID ASC
      )T;
  END;--INSERT S3g_Lad_Accastdet END
  -- d('P_SANumber=>'||P_SANumber);
  BEGIN--INSERT  S3G_LAD_ACCREPAYSTRUCT START
    INSERT
    INTO S3G_LAD_ACCREPAYSTRUCT
      (
        PANUM,
        SANUM,
        NOOFDAYS,
        INSTALLMENT_NO,
        FROMDATE,
        TODATE,
        INSTALLMENTDATE,
        INSTALLMENTAMOUNT,
        INTEREST,
        INSURANCEAMOUNT,
        OTHERS,
        FINANCECHARGES,
        TAX,
        TAXSETOFF,
        BILLSTATUS,
        PRINCIPALAMOUNT,
        ACCOUNT_REPAYSTRUCTURE_ID,
        PA_SA_REF_ID
      )
    SELECT D_PANUM,
      P_SANumber,
      NOOFDAYS,
      INSTALLMENT_NO,
      FROMDATE,
      TODATE,
      INSTALLMENTDATE,
      INSTALLMENTAMOUNT,
      INTEREST,
      INSURANCEAMOUNT,
      OTHERS,
      FINANCECHARGES,
      TAX,
      TAXSETOFF,
      BILLSTATUS,
      PRINCIPALAMOUNT,
      SEQ_LAD_ACCREPAYSTRUCT.NEXTVAL,
      P_PA_SA_REF_ID
    FROM S3G_ORG_APPREPAYSTRUCT
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END;----INSERT  S3G_LAD_ACCREPAYSTRUCT  END
  BEGIN --S3G_LAD_ACCREPAYSTRUCT_EXTN INSERT START
    INSERT
    INTO S3G_LAD_ACCREPAYSTRUCT_EXTN
      (
        ACCREPAYSTRUCT_EXTN_ID,
        APPLICATION_PROCESS_ID,
        CASHFLOW_FLAG_ID,
        INSTALMENT_AMOUNT,
        INSTALMENT_DATE,
        INSTALMENT_NO,
        PA_SA_REF_ID
      )
    SELECT SQ_S3G_LAD_ACCREPAYSTRUCT_EXN.NEXTVAL,
      APPLICATION_PROCESS_ID,
      CASHFLOW_FLAG_ID,
      INSTALMENT_AMOUNT,
      INSTALMENT_DATE,
      INSTALMENT_NO,
      P_Pa_Sa_Ref_Id
    FROM S3G_ORG_APPREPAYSTRUCT_EXTN
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END; --S3G_LAD_ACCREPAYSTRUCT_EXTN INSERT END
  BEGIN--S3G_LAD_ACC_DEAL_TRAN INSERT START
    INSERT
    INTO S3G_LAD_ACC_DEAL_TRAN
      (
        ACC_DEAL_TRAN_ID,
        FINANCE_AMOUNT,
        OLD_PA_SA_REF_ID,
        PA_SA_REF_ID
      )
    SELECT SQ_S3G_ORG_APP_DEAL_TRAN.NEXTVAL,
      FINANCE_AMOUNT,
      PA_SA_REF_ID,
      P_Pa_Sa_Ref_Id
    FROM S3G_ORG_APP_DEAL_TRAN
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END; --S3G_LAD_ACC_DEAL_TRAN INSERT END
  BEGIN--S3G_LAD_ACC_DIS_UTIL INSERT START
    INSERT
    INTO S3G_LAD_ACC_DIS_UTIL
      (
        ACC_DIS_UTIL_ID,
        DISC_RATE,
        END_SLAB,
        PA_SA_REF_ID,
        START_SLAB
      )
    SELECT SQ_ACC_DIS_UTIL_ID.NEXTVAL,
      DISC_RATE,
      END_SLAB,
      P_Pa_Sa_Ref_Id,
      START_SLAB
    FROM S3G_ORG_APP_DIS_UTIL
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END; --S3G_LAD_ACC_DIS_UTIL INSERT END
  BEGIN--INSERT S3G_ORG_APP_FACT_CHARGE START
    INSERT
    INTO S3G_LAD_ACC_FACT_CHARGE
      (
        ACC_FACT_CHARGE_ID,
        CASHFLOW_FLAG_ID,
        CHARGE_AMOUNT,
        CHARGE_FREQUENCY,
        CHARGE_TYPE,
        IS_ACTIVE,
        PA_SA_REF_ID
      )
    SELECT SQ_ACC_FACT_CHARGE_ID.NEXTVAL,
      CASHFLOW_FLAG_ID,
      CHARGE_AMOUNT,
      CHARGE_FREQUENCY,
      CHARGE_TYPE,
      IS_ACTIVE,
      P_Pa_Sa_Ref_Id
    FROM S3G_ORG_APP_FACT_CHARGE
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END; --INSERT S3G_ORG_APP_FACT_CHARGE START
  BEGIN--S3G_LAD_ACC_Sublimit INSERT START
    INSERT
    INTO S3G_LAD_ACC_SUBLIMIT
      (
        ACC_FACT_SUBLIMIT_ID,
        CUTOFF_DATE,
        ENTITY_ID,
        LIMIT_VAL,
        PA_SA_REF_ID
      )
    SELECT APPLICATION_PROCESS_ID,
      CUTOFF_DATE,
      ENTITY_ID,
      LIMIT_VAL,
      P_Pa_Sa_Ref_Id
    FROM S3G_ORG_APP_SUBLIMIT
    WHERE APPLICATION_PROCESS_ID=P_APPLICATION_PROCESS_ID;
  END;--S3G_LAD_ACC_Sublimit INSERT END
  -- Asset Details Begin --
  IF (p_DocumentNo IS NOT NULL) THEN
    BEGIN
      IF (p_Split_RefNo IS NULL) THEN
        BEGIN
          La_Upd_Ac_Sts_Split_Conso(P_Documentno,p_AccountNumber,P_Company_Id,'1');
        END;
      ELSE
        BEGIN
          La_Upd_Ac_Sts_Split_Conso(P_Documentno,p_AccountNumber,P_Company_Id,'5',P_Split_Refno);
        END;
      END IF;
    END;
  END IF;
  IF (p_SANumber = D_PANum || 'DUMMY') THEN
    BEGIN
      p_AccountNumber := D_PANum;
    END;
  ELSE
    BEGIN
      p_AccountNumber := P_Sanumber;
    END;
  END IF;
  IF (p_IsBaseMLA = 0) THEN
    BEGIN
      SELECT COUNT(customer_id)
      INTO p_varCustomerCreditCount
      FROM S3g_Org_Custcrdtdet
      WHERE Lob_Id                 = P_Lob_Id
      AND product_id               = p_Product_Id
      AND Customer_Id              = p_Customer_ID;
      IF (p_varCustomerCreditCount = 0) THEN
        BEGIN
          INSERT
          INTO S3g_Org_Custcrdtdet
            (
              CUSTOMER_CREDIT_DETAIL_ID,
              Customer_Id,
              Lob_Id,
              Product_Id,
              Utilized_Amount,
              Sanctioned_Amount,
              Valid_Upto,
              Facitlity_Type
            )
            VALUES
            (
              Seq_Org_Custcrdtdet.Nextval,
              P_Customer_Id,
              P_Lob_Id,
              P_Product_Id,
              P_Finance_Amount,
              --Modified By Ganapathy
              Fn_S3g_Get_Sanctionedamt(P_Lob_Id,P_Product_Id,P_Customer_Id)
              --END
              ,
              NULL,
              1
            );
        END;
      ELSE
        BEGIN
          SELECT SUM(Utilized_Amount)
          INTO p_varUtilizedAmount
          FROM S3g_Org_Custcrdtdet
          WHERE Lob_Id    = P_Lob_Id
          AND Product_Id  = P_Product_Id
          AND Customer_Id = P_Customer_Id
          GROUP BY Customer_Id,
            Lob_Id,
            Product_Id;
          P_Varutilizedamount := P_Varutilizedamount + P_Finance_Amount;
          UPDATE S3g_Org_Custcrdtdet
          SET Utilized_Amount = P_Varutilizedamount,
            --Modified By Ganapathy Begin
            Sanctioned_Amount=Fn_S3g_Get_Sanctionedamt(P_Lob_Id,P_Product_Id,P_Customer_Id)
            -- END
          WHERE Lob_Id    = P_Lob_Id
          AND Product_Id  = P_Product_Id
          AND Customer_Id = P_Customer_Id;
        END;
      END IF;
    END;
  END IF;
  /*P_Xml := Null;
  Select Count(1) into P_Recdcount
  From S3g_Xml_Repos Where Sess_Id = P_Sess_Id
  And upper(Xml_Name) ='XMLINVOICEDETAILS';
  IF ( P_Recdcount > 0 ) Then
  Begin
  Select Xml_Data Into P_Xml
  From S3g_Xml_Repos Where Sess_Id = P_Sess_Id
  And Upper(Xml_Name) ='XMLINVOICEDETAILS';
  p_hdoc := sys.xmltype.createxml(P_Xml);*/
  IF ( p_XmlInvoiceDetails IS NOT NULL ) THEN
    BEGIN
      p_hdoc  := SYS.XMLTYPE.createXML(p_XmlInvoiceDetails);
      FOR Inv IN
      (SELECT Extractvalue(Value(X),'/Details/@INVOICETRANSACTIONREFERENCE') Invoicetransactionreference
      FROM TABLE (Xmlsequence (P_Hdoc.Extract ('//Root/Details'))) X
      )
      LOOP
        INSERT
        INTO S3g_Lad_Accinvdet
          (
            ACCOUNT_INVOICE_DETAILS_ID,
            Company_Id,
            Panum,
            Sanum,
            INVOICE_REFERENCE_ID,
            PA_SA_DETAILS_ID
          )
          VALUES
          (
            SEQ_LAD_ACCINVDET.NEXTVAL,
            P_Company_Id,
            D_PANum,
            P_Sanumber,
            Inv.INVOICETRANSACTIONREFERENCE,
            p_PA_SA_REF_ID
          );
      END LOOP;
    END;
  END IF;
  SELECT LOB_CODE
  INTO d_LOB_CODE
  FROM S3G_SYSAD_LOBMASTER
  where lob_id        =p_lob_id;
  IF(upper(d_LOB_CODE)='HP' or upper(d_LOB_CODE)='TL')THEN--LOB CODE HP START
    BEGIN                       --INSERT ACCOUNT ACTIVATION START
      IF(P_ERRORCODE=0)THEN
        BEGIN
          P_ACTIVATION_DATE :=P_CREATION_DATE;
          P_ACCOUNTING_DATE :=P_CREATION_DATE;
          P_MLASTATUS       :=0;
          P_IS_MODIFY       :=0;
          --DP_AUTO_TRAN('Line-LA_INS_AC_CREAT_AP==>LA_INS_AC_ACTV_AP-Check-6-');
          LA_INS_AC_ACTV_AP( P_COMPANY_ID, P_LOB_ID, P_LOCATION_ID, D_PANum, P_PANUM||'DUMMY', P_SANUMBER, P_CREATED_BY,p_PA_SA_REF_ID, P_ACTIVATION_DATE, P_ACCOUNTING_DATE, P_MLASTATUS, P_IS_MODIFY, 0,--IS REVOKE
          P_XML_REPAYMENTSTRUCTURE, P_XMLREPAYMENTDETAILS, P_XMLOUTFLOWDETAILS, P_XMLINFLOWDETAILS, P_ACCOUNTINGIRR, P_BUSINESSIRR, P_COMPANYIRR, P_XMLREPAYDETAILSOTHERS, P_ACCOUNTNUMBER, P_ERRORCODE, P_ERROR_MESSEGE );
        END;
      END IF;
    END; --INSERT ACCOUNT ACTIVATION END
  end if;--LOB CODE HP END
END LA_INS_AC_CREAT_AP;