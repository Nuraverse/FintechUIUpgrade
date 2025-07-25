using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;
using System.Data;
using S3GDALayer.Collection;
using System.ServiceModel.Activation;

namespace S3GServiceLayer.Collection
{
    // To Implement Service Compatablity
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    // NOTE: If you change the class name "ClnDataMgtServices" here, you must also update the reference to "ClnDataMgtServices" in Web.config.
    public class ClnDataMgtServices : IClnDataMgtServices
    {
        byte[] bytesDataTable;
        int intResult;

        #region "Follow Up Process"
        /// <summary>
        /// Inserting records in Follow Up details table
        /// </summary>
        /// <param name="SMode">Pass SerializationMode</param>
        /// <param name="byteEnquiryService">Pass bype object</param>
        public int FunPubCreateFollowUpProcess(SerializationMode SMode, byte[] byteFollowUpService, out int intFollowUpID, out string strDocNo)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateFollowUp(SMode, byteFollowUpService, out intFollowUpID, out strDocNo);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Follow Up Process Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region "CRM"
        /// <summary>
        /// Inserting records in Follow Up details table
        /// </summary>
        /// <param name="SMode">Pass SerializationMode</param>
        /// <param name="byteEnquiryService">Pass bype object</param>
        public int FunPubCreateCRM(SerializationMode SMode, byte[] byteCRMService, out int intCRMID, out string strDocNo, out int intCustomerID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateCRM(SMode, byteCRMService, out intCRMID, out strDocNo, out intCustomerID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Follow Up Process Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region "ENQUIRY"
        /// <summary>
        /// Inserting records in Enquiry table
        /// </summary>
        /// <param name="SMode">Pass SerializationMode</param>
        /// <param name="byteEnquiryService">Pass bype object</param>
        public int FunPubCreateEnquiry(SerializationMode SerMode, byte[] bytesObjS3G_Colection_CRM_DataTable, out int intErrorCode, out string strDocNo)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateEnquiry(SerMode, bytesObjS3G_Colection_CRM_DataTable, out intErrorCode, out strDocNo);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Enquiry Process Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region CRM Customiztion"

        #region"Create/Update Prospect"

        public int FunPubCreateProspect(SerializationMode SerMode, byte[] bytesPspct_Data, out Int64 intCRMID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateProspect(SerMode, bytesPspct_Data, out intCRMID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prospect Creation/Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion


        #region"Create/Update Lead"

        public int FunPubCreateLead(SerializationMode SerMode, byte[] bytesObjS3G_Colection_Customer_DataTable, out string strDocNo, out Int64 intLeadID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateLead(SerMode, bytesObjS3G_Colection_Customer_DataTable, out strDocNo, out intLeadID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prospect Creation/Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region"Create Track"

        public int FunPubCreateTrackDetails(SerializationMode SerMode, byte[] bytesTrack_Data, out Int64 intTrackID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateTrackDetails(SerMode, bytesTrack_Data, out intTrackID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prospect Creation/Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region"Create Document"

        public int FunPubCreateDocumentDetails(SerializationMode SerMode, byte[] bytesDoc_Data, out Int64 intDocID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateDocumentDetails(SerMode, bytesDoc_Data, out intDocID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prospect Creation/Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region"Create Sales Campaign"

        public int FunPubCreateSalesCampaign(SerializationMode SerMode, byte[] bytesSales_Data,out string strDocNo, out Int64 intSalesID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateSalesCampaign(SerMode, bytesSales_Data, out strDocNo, out intSalesID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prospect Creation/Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region"Create DC"

        public int FunPubCreateDC(SerializationMode SerMode, byte[] bytesDC_Data, out string strDocNo, out Int64 intDCID)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess objClsPubFollowUpProcess = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubFollowUpProcess();
                return objClsPubFollowUpProcess.FunPubCreateDC(SerMode, bytesDC_Data, out strDocNo, out intDCID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in DC Creation/Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #endregion

        //Added By Suseela for Drawee Bank Master - code starts
        #region Drawee Bank Master
        public int FunPubCreateDraweeBankMaster(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_CLN_DRAWEEBANKMASTERDataTable)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubDraweeBankMaster ObjDraweeBankMaster = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubDraweeBankMaster();
                intResult = ObjDraweeBankMaster.FunPubCreateDraweeBankMaster(SerMode, bytesObjS3G_CLN_DRAWEEBANKMASTERDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Drawee Bank Master Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion
        //Added By Suseela for Drawee Bank Master - code ends

        #region DC Follow UP Detail
        /// <summary>
        /// Inserting records in DC Follow Up details table
        /// </summary>
        /// <param name="SMode">Pass SerializationMode</param>
        /// <param name="byteEnquiryService">Pass bype object</param>
        public int FunPubCreateDCFollowUp(SerializationMode SMode, byte[] bytesObjS3G_CLN_DCFollowUp, out int intFollowUpID, out string strErrorMsg)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubDCFollowUp objClsPubDCFollowUp = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubDCFollowUp();
                return objClsPubDCFollowUp.FunPubCreateDCFollowUp(SMode, bytesObjS3G_CLN_DCFollowUp, out intFollowUpID, out strErrorMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in DC Follow Up Process Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        #endregion


        #region DC Follow UP Remarks Detail
        /// <summary>
        /// Inserting records in DC Follow Up Remarks details table
        /// </summary>
        /// <param name="SMode">Pass SerializationMode</param>
        /// <param name="byteEnquiryService">Pass bype object</param>
        public int FunPubCreateDCFollwUpRemarks(SerializationMode SMode, byte[] bytesObjS3G_CLN_DCFlwUpRemarks, out string strTicketNO, out string strErrorMsg)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubDCFollowUp objClsPubDCFollowUp = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubDCFollowUp();
                return objClsPubDCFollowUp.FunPubCreateDCFollwUpRemarks(SMode, bytesObjS3G_CLN_DCFlwUpRemarks, out strTicketNO, out strErrorMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in DC Follow Up Remarks Insert :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        #endregion

        #region Marketing Incentive Proces

        public int FunPubCreateUpdateMarketing_Inc_Proc(SerializationMode SMode, byte[] bytesobjMarketing_Inc_Proc_DataTable, out int intIncProcessID, out string strDocCode_Out)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubMarketingIncentiveProc objClsPubNMark_Inc_Proc = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubMarketingIncentiveProc();
                return objClsPubNMark_Inc_Proc.FunPubCreateUpdateMarketing_Inc_Proc(SMode, bytesobjMarketing_Inc_Proc_DataTable, out intIncProcessID, out strDocCode_Out);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Marketing Incentive Process Insert :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region "NFB Exposure Entry"

        public int FunPubInsertNFBExposureEntry(SerializationMode SerMode, byte[] bytesobjNFB_Exposure_EntryDataTable, string strConnectionName, out string strDocNumber)
        {
            S3GDALayer.Collection.Legal objClsPubNFB_Exposure_Entry = new S3GDALayer.Collection.Legal(strConnectionName);
            return objClsPubNFB_Exposure_Entry.FunPubInsertNFBExposureEntry(SerMode, bytesobjNFB_Exposure_EntryDataTable, strConnectionName, out strDocNumber);
        }
        #endregion

        #region DC Follow UP Header Level Reamrks
        /// <summary>
        /// Inserting records in DC Follow Up Header Level details table
        /// </summary>
        /// <param name="SMode">Pass SerializationMode</param>
        /// <param name="byteEnquiryService">Pass bype object</param>
        public int FunPubINSUpdateDCFollowUp(SerializationMode SMode, byte[] bytesObjS3G_CLN_DCFlwUpRemarks, out int intDCFollowUpID, out string strErrorMsg)
        {
            try
            {
                S3GDALayer.Collection.ClnDataMgtServices.ClsPubDCFollowUp objClsPubDCFollowUp = new S3GDALayer.Collection.ClnDataMgtServices.ClsPubDCFollowUp();
                return objClsPubDCFollowUp.FunPubINSUpdateDCFollowUp(SMode, bytesObjS3G_CLN_DCFlwUpRemarks, out intDCFollowUpID, out strErrorMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in DC Follow Up Remarks Insert :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        #endregion
    }
}
