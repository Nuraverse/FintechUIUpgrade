using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;
using S3GDALayer;
using System.ServiceModel.Activation;

namespace S3GServiceLayer.LoanAdmin
{
    // To Implement Service Compatablity
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    // NOTE: If you change the class name "ApplicationMgtServices" here, you must also update the reference to "ApplicationMgtServices" in Web.config.
    public class LoanAdminMgtServices : ILoanAdminMgtServices
    {
        int intResult;
        byte[] bytesDataTable;
        byte[] bytesDataSet;
        #region Invoice

        public int FunPubCreateInvoiceDetails(SerializationMode SerMode, byte[] bytesObjInvoiceDatatable_SERLAY, ClsSystemJournal ObjSysJournal, out string strErrMsg)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubInvoiceVendor ObjInvoice = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubInvoiceVendor();
                return ObjInvoice.FunPubCreateInvoiceDetails(SerMode, bytesObjInvoiceDatatable_SERLAY, ObjSysJournal, out strErrMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        #endregion

        #region DeliveryInstruction

        public int FunPubCreateDeliveryIns(SerializationMode SerMode, byte[] bytesObjDeliveryDatatable_SERLAY, out string strDeliveryNumber_Out)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjDeliveryIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                return ObjDeliveryIns.FunPubCreateDeliveryIns(SerMode,bytesObjDeliveryDatatable_SERLAY, out strDeliveryNumber_Out); 
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        // To cancel Delivery Instruction
        // Added by Manikandan. R (15-FEB-2011)
        public int FunCancelDeliveryIns(int DeliveryInstruction_ID, string Flag,out int ErrorCode)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjDeliveryIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                return ObjDeliveryIns.FunCancelDeliveryIns(DeliveryInstruction_ID,Flag, out ErrorCode);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Cancel DI :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetAssetDetails(SerializationMode SerMode, byte[] bytesObjAssetDetailsDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_GetAssetDetailsDataTable dtAssetDetails;
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjAssetDetailsDetails = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                dtAssetDetails = ObjAssetDetailsDetails.FunPubAssetMaster(SerMode, bytesObjAssetDetailsDataTable_SERLAY);
                byte[] bytesAssetDetails = ClsPubSerialize.Serialize(dtAssetDetails, SerializationMode.Binary);
                return bytesAssetDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Get Asset Look Up :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetCustDetails(SerializationMode SerMode, byte[] bytesObjCustDetailsDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_GetDICustomerDetailsDataTable dtCustDetails;
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjAssetDetailsDetails = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                dtCustDetails = ObjAssetDetailsDetails.FunPubCustMaster(SerMode, bytesObjCustDetailsDataTable_SERLAY);
                byte[] bytesAssetDetails = ClsPubSerialize.Serialize(dtCustDetails, SerializationMode.Binary);
                return bytesAssetDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Get Asset Look Up :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion
        
        #region Factoring Invoice
        // ----Factoring Invoice Loading (Created By- Irsathameen K)-------
        //Begin

        public int FunPubCreateFactoringInvoiceDetails(SerializationMode SerMode, byte[] bytesObjFactoringInvoiceDatatable_SERLAY, out string strFILNo, out string strInvoiceNo,out string strPartyName)
        {
            try
            {
                
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubFactoringInvoice ObjFactoringInvoice = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubFactoringInvoice();
                return ObjFactoringInvoice.FunPubCreateFactoringInvoiceDetails(SerMode, bytesObjFactoringInvoiceDatatable_SERLAY, out strFILNo, out strInvoiceNo, out strPartyName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        //End
        #endregion
      
        #region GPS
        public int FunPubCreateGlobalParameterDetails(SerializationMode SerMode, byte[] bytesObjGlobalParameterDatatable_SERLAY)
        {
            try
            {

                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup ObjGlobalParameter = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup();
                return ObjGlobalParameter.FunPubCreateGlobalParameter(SerMode, bytesObjGlobalParameterDatatable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetLOBDetails(SerializationMode SerMode, byte[] bytesObjLOBDetailsDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_GetLOBDetailsDataTable dtLOBDetails;
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup ObjLOBDetailsDetails = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup();
                dtLOBDetails = ObjLOBDetailsDetails.FunPubGetGlobalLOBName(SerMode, bytesObjLOBDetailsDataTable_SERLAY);
                byte[] bytesLOBDetails = ClsPubSerialize.Serialize(dtLOBDetails, SerializationMode.Binary);
                return bytesLOBDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Get Asset Look Up :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetGPSDetails(SerializationMode SerMode, byte[] bytesObjGPSDetailsDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_GetGlobalParameterSetupDataTable dtGPSDetails;
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup ObjGPSDetailsDetails = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup();
                dtGPSDetails = ObjGPSDetailsDetails.FunPubGetGlobalParam(SerMode, bytesObjGPSDetailsDataTable_SERLAY);
                byte[] bytesGPSDetails = ClsPubSerialize.Serialize(dtGPSDetails, SerializationMode.Binary);
                return bytesGPSDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Get Asset Look Up :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubModifyGPSDetails(SerializationMode SerMode, byte[] bytesObjGPSDetailsDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup ObjGpsIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubGlobalParameterSetup();
                intResult = ObjGpsIns.FunPubModifyGlobalParameter(SerMode, bytesObjGPSDetailsDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        #endregion

        #region TLEWC
        public int FunPubCreateTLEWCIns(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY, out string strTLEWCNumber_Out)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC ObjDeliveryIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC();
                return ObjDeliveryIns.FunPubCreateTLEWC(SerMode, bytesObjTLEWCDatatable_SERLAY, out strTLEWCNumber_Out);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        public int FunPubModifyTLEWC(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC ObjDeliveryIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC();
                intResult = ObjDeliveryIns.FunPubUpdateTLEWC(SerMode, bytesObjTLEWCDatatable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }




        public int FunPubCreateWCIns(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY, out string strTLEWCNumber_Out)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC ObjDeliveryIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC();
                return ObjDeliveryIns.FunPubCreateWC(SerMode, bytesObjTLEWCDatatable_SERLAY, out strTLEWCNumber_Out);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        public int FunPubModifyWC(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC ObjDeliveryIns = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC();
                intResult = ObjDeliveryIns.FunPubUpdateWC(SerMode, bytesObjTLEWCDatatable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public int FunPubCancelTopUpTLEWC(int intTLEWCID, int intCompanyId, int intUserId)
        {
            try
            {
                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC ObjTopup = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubTLEWC();
                intResult = ObjTopup.FunPubCancelTopupTLEWC(intTLEWCID, intCompanyId, intUserId);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        #endregion

        #region Noc Termination
        // ----Noc Termination  (Created By- Irsathameen K)-------
        //Begin

        public int FunPubCreateNOCTerminationDetails(SerializationMode SerMode, byte[] bytesObjNOCTerminationDatatable_SERLAY, out string strNOCNo)
        {
            try
            {

                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubNOCTermination ObjNOCTermination  = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubNOCTermination();
                return ObjNOCTermination.FunPubCreateNocTerminationDetails(SerMode, bytesObjNOCTerminationDatatable_SERLAY,out strNOCNo);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        //End
        #endregion

        #region Bill Generation

        public int FunPubCreateBillingInt(BillingEntity objBillingEntity, out string strJournalMessage)
        {
            S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubBilling objBilling = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubBilling();
            return objBilling.FunPubCreateBillingInt(objBillingEntity, out strJournalMessage);
        }
        // ADDED BY R. Manikandan 31 - JAN - 2012 To fetch Get Bill PDF
        public int FunPubGetPDF(BillingEntity objBillingEntity)
        {
            S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubBilling objBilling = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubBilling();
            return objBilling.FunPubGetPDF(objBillingEntity);
        }
        // ADDED BY R. Manikandan End 

        #endregion

        #region CC Generation

        public int FunPubCreateCCInt(BillingEntity objBillingEntity, out string strJournalMessage)
        {
            S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubCompensation objCC = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubCompensation();
            return objCC.FunPubCreateCCInt(objBillingEntity, out strJournalMessage);
        }
        #endregion

        #region TA Delivery Instruction

        public int FunPubTACreateDeliveryIns(SerializationMode SerMode, byte[] bytesObjDeliveryDatatable_SERLAY, out string strDeliveryNumber_Out)
        {
            try
            {
                S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjDeliveryIns = new S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                return ObjDeliveryIns.FunPubCreateDeliveryIns(SerMode, bytesObjDeliveryDatatable_SERLAY, out strDeliveryNumber_Out);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Cashflow Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        // To cancel Delivery Instruction
        // Added by Manikandan. R (15-FEB-2011)
        public int FunTACancelDeliveryIns(int DeliveryInstruction_ID, string Flag, out int ErrorCode)
        {
            try
            {
                S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjDeliveryIns = new S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                return ObjDeliveryIns.FunCancelDeliveryIns(DeliveryInstruction_ID, Flag, out ErrorCode);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Cancel DI :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubTAGetAssetDetails(SerializationMode SerMode, byte[] bytesObjAssetDetailsDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_GetAssetDetailsDataTable dtAssetDetails;
                S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjAssetDetailsDetails = new S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                dtAssetDetails = ObjAssetDetailsDetails.FunPubAssetMaster(SerMode, bytesObjAssetDetailsDataTable_SERLAY);
                byte[] bytesAssetDetails = ClsPubSerialize.Serialize(dtAssetDetails, SerializationMode.Binary);
                return bytesAssetDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Get Asset Look Up :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubTAGetCustDetails(SerializationMode SerMode, byte[] bytesObjCustDetailsDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_GetDICustomerDetailsDataTable dtCustDetails;
                S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction ObjAssetDetailsDetails = new S3GDALayer.TradeAdvance.LoanAdminMgtServices.ClsPubDeliveryInstruction();
                dtCustDetails = ObjAssetDetailsDetails.FunPubCustMaster(SerMode, bytesObjCustDetailsDataTable_SERLAY);
                byte[] bytesAssetDetails = ClsPubSerialize.Serialize(dtCustDetails, SerializationMode.Binary);
                return bytesAssetDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Get Asset Look Up :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region TA Income Process

        public int FunPubTACreateIncomeCalculation(BillingEntity objBillingEntity, out string strJournalMessage)
        {
            S3GDALayer.TradeAdvance.TradeAdvanceMgtServices.ClsPubIncomeCalculation objIncome = new S3GDALayer.TradeAdvance.TradeAdvanceMgtServices.ClsPubIncomeCalculation();
            return objIncome.FunPubCreateIncomeCalculation(objBillingEntity, out strJournalMessage);
        }

        #endregion

        #region Factoring Retirement

        public int FunPubCreateFactoringRetirement(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_FT_RetirementDataTable, out string strFILNo)
        {
            try
            {

                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubFactoringInvoice ObjFactoringInvoice = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubFactoringInvoice();
                return ObjFactoringInvoice.FunPubCreateFactoringRetirement(SerMode, bytesObjS3G_LOANAD_FT_RetirementDataTable, out strFILNo);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }        
        #endregion
        #region Factoring Invoice
        // ----Factoring Invoice Follow Entry
        //Begin

        public int FunPubCreateFactoringFollowEntryDetails(SerializationMode SerMode, byte[] bytesObjFactoringInvoiceDatatable, out string strFILNo, out string strInvoiceNo, out string strPartyName)
        {
            try
            {

                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubFactoringInvoiceEntry ObjFactoringInvoice = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubFactoringInvoiceEntry();
                return ObjFactoringInvoice.FunPubCreateFactoringFollowEntryDetails(SerMode, bytesObjFactoringInvoiceDatatable, out strFILNo, out strInvoiceNo, out strPartyName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubInsMailDetails(S3GBusEntity.SerializationMode SerMode, byte[] byteObjS3G_NOCTermination)
        {
            try
            {

                S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubNOCTermination objClsPubNOCTermination = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubNOCTermination();
                return objClsPubNOCTermination.FunPubInsMailDetails(SerMode, byteObjS3G_NOCTermination);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        //End
        #endregion

        #region Insert Terror List
        public int FunPubInsertTerrorList(SerializationMode SerMode, byte[] bytesobjalm_DTB, string strConnectionName, out int intDeal_ID)
        {
            try
            {
                S3GDALayer.LoanAdmin.Treasury_Bucket objDealMaster = new S3GDALayer.LoanAdmin.Treasury_Bucket(strConnectionName);
                intResult = objDealMaster.FunPubInsertTerrorList(SerMode, bytesobjalm_DTB, strConnectionName, out intDeal_ID);
                return intResult;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion
        public byte[] FunPubFillDropdownXML(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, string strXMLKey, string strXMLParm, out string strErrorMessage)
        {
            try
            {
                S3GDALayer.LoanAdmin.Treasury_Bucket objFAAdmin = new S3GDALayer.LoanAdmin.Treasury_Bucket(strConnectionName);
                DataTable dtDropDown = objFAAdmin.FunPubFillDropdownUpload(strProcName, strConnectionName, dctProcParams, strXMLKey, strXMLParm, out strErrorMessage);
                if (dtDropDown != null)
                    bytesDataTable = ClsPubSerialize.Serialize(dtDropDown, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }
    }
}
