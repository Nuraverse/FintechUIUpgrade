using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;

namespace S3GServiceLayer.Collection
{
    // NOTE: If you change the interface name "IClnDataMgtServices" here, you must also update the reference to "IClnDataMgtServices" in Web.config.
    [ServiceContract]
    public interface IClnDataMgtServices
    {
        #region Appropriation Logic

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFollowUpProcess(SerializationMode SerMode, byte[] bytesFollowUpDAL_SERLAY, out int intFollowUpID, out string strDocNo);

        #endregion

        #region CRM

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateCRM(SerializationMode SerMode, byte[] byteCRMService, out int intCRMID, out string strDocNo, out int intCustomerID);

        #region "Create/Update Prospect"

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateProspect(SerializationMode SerMode, byte[] bytesPspct_Data, out Int64 intCRMID);

        #endregion

        #region "Create/Update Lead Details"

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateLead(SerializationMode SerMode, byte[] bytesObjS3G_Colection_Customer_DataTable, out string strDocNo, out Int64 intLeadID);

        #endregion

        #region "Create Track Details"

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateTrackDetails(SerializationMode SerMode, byte[] bytesTrack_Data, out Int64 intTrackID);

        #endregion

        #region "Create Document Details"

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDocumentDetails(SerializationMode SerMode, byte[] bytesDoc_Data, out Int64 intDocID);

        #endregion

        #region "Create SalesCampaign Details"

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateSalesCampaign(SerializationMode SerMode, byte[] bytesSales_Data, out string strDocNo, out Int64 intSalesID);

        #endregion

        #endregion

        #region Enquiry

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateEnquiry(SerializationMode SerMode, byte[] bytesObjS3G_Colection_CRM_DataTable, out int intErrorCode, out string strDocNo);

        #endregion

        #region "Create DC"

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDC(SerializationMode SerMode, byte[] bytesDC_Data, out string strDocNo, out Int64 intDCID);

        #endregion

        //Added By Suseela for Drawee Bank Master - code statrs
        #region DraweeBankMaster
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDraweeBankMaster(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DRAWEEBANKMASTERDataTable);

        #endregion

        //Added By Suseela for Drawee Bank Master - code ends

        #region DC Follow UP Detail

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDCFollowUp(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DCFollowUp, out int intFollowUpID, out string strErrorMsg);

        #endregion

        #region DC Follow UP Remarks Detail

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDCFollwUpRemarks(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DCFlwUpRemarks, out string strTicketNO, out string strErrorMsg);

        #endregion

        //#region Marketing Incentive Proces

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateUpdateMarketing_Inc_Proc(SerializationMode SerMode, byte[] bytesobjMarketing_Inc_Proc_DataTable, out int intIncProcessIDc, out string strDocCode_Out);

        //#endregion

        #region "NFB Exposure Entry"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertNFBExposureEntry(SerializationMode SerMode, byte[] bytesobjNFB_Exposure_EntryDataTable, string strConnectionName, out string strDocNumber);
        #endregion

        #region DC Follow UP Header Level Reamrks

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubINSUpdateDCFollowUp(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DCFlwUpRemarks, out int intDCFollowUpID, out string strErrorMsg);

        #endregion
    }
}
