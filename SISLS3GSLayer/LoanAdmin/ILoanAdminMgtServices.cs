#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: LoanAdmin
/// Screen Name			: InvoiceVendor Interface Class
/// Created By			: Kaliraj K
/// Created Date		: 17-Jul-2010
/// Purpose	            : WCF Interface class for defining Invoice vendor details methods

/// <Program Summary>
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;

namespace S3GServiceLayer.LoanAdmin
{
    // NOTE: If you change the interface name "ILoanAdminMgtServices" here, you must also update the reference to "ILoanAdminMgtServices" in Web.config.
    [ServiceContract]
    public interface ILoanAdminMgtServices
    {
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateInvoiceDetails(SerializationMode SerMode, byte[] bytesObjInvoiceDatatable_SERLAY, ClsSystemJournal ObjSysJournal, out string strErrMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDeliveryIns(SerializationMode SerMode, byte[] bytesObjDeliveryDatatable_SERLAY, out string strDeliveryNumber_Out);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunCancelDeliveryIns(int DeliveryInstruction_ID, string Flag, out int ErrorCode);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetAssetDetails(SerializationMode SerMode, byte[] bytesObjAssetDetailsDataTable_SERLAY);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetCustDetails(SerializationMode SerMode, byte[] bytesObjCustDetailsDataTable_SERLAY);


        //--------------Factoring Invoice Loading( Created By -Irsathameen K)---------------
        //Begin

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFactoringInvoiceDetails(SerializationMode SerMode, byte[] bytesObjFactoringInvoiceDatatable_SERLAY, out string strFILNo, out string strInvoiceNo, out string strPartyName);


        //--------------NOC Termination( Created By -Irsathameen K)---------------
        //Begin
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateNOCTerminationDetails(SerializationMode SerMode, byte[] bytesObjNOCTerminationDatatable_SERLAY, out string strNOCNo);

        //End
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateGlobalParameterDetails(SerializationMode SerMode, byte[] bytesObjGlobalParameterDatatable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetLOBDetails(SerializationMode SerMode, byte[] bytesObjLOBDetailsDataTable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetGPSDetails(SerializationMode SerMode, byte[] bytesObjGPSDetailsDataTable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyGPSDetails(SerializationMode SerMode, byte[] bytesObjGPSDetailsDataTable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateTLEWCIns(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY, out string strTLEWCNumber_Out);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyTLEWC(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateWCIns(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY, out string strTLEWCNumber_Out);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyWC(SerializationMode SerMode, byte[] bytesObjTLEWCDatatable_SERLAY);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelTopUpTLEWC(int intTLEWCID, int intCompanyId, int intUserId);  //Canceling Topup

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsMailDetails(SerializationMode SerMode, byte[] byteObjS3G_NOCTermination);



        #region Billing
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateBillingInt(BillingEntity objBillingEntity, out string strJournalMessage);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubGetPDF(BillingEntity objBillingEntity);


        #endregion

        #region Billing
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateCCInt(BillingEntity objBillingEntity, out string strJournalMessage);
        #endregion

        #region TA Delivery Instruction

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubTACreateDeliveryIns(SerializationMode SerMode, byte[] bytesObjDeliveryDatatable_SERLAY, out string strDeliveryNumber_Out);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunTACancelDeliveryIns(int DeliveryInstruction_ID, string Flag, out int ErrorCode);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubTAGetAssetDetails(SerializationMode SerMode, byte[] bytesObjAssetDetailsDataTable_SERLAY);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubTAGetCustDetails(SerializationMode SerMode, byte[] bytesObjCustDetailsDataTable_SERLAY);


        #endregion

        #region TA Income Process
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubTACreateIncomeCalculation(BillingEntity objBillingEntity, out string strJournalMessage);
        #endregion

        #region Factoring Retirement

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFactoringRetirement(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_FT_RetirementDataTable, out string strFILNo);

        #endregion

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFactoringFollowEntryDetails(SerializationMode SerMode, byte[] bytesObjFactoringInvoiceDatatable, out string strFILNo, out string strInvoiceNo, out string strPartyName);

        #region Insert Terror List
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertTerrorList(SerializationMode SerMode, byte[] bytesobjalm_DTB, string strConnectionName, out int intDeal_ID);
        #endregion

        #region To Get Data in DataTable
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubFillDropdownXML(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, string strXMLKey, string strXMLParm, out string strErrorMessage);
        #endregion
    }
}
