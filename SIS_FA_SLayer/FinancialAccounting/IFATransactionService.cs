
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: All Transaction Services Interface
/// Created By			: Tamilselvan.S
/// Created Date		: 20-Mar-2012
/// Purpose	            : 
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using FA_BusEntity;
using FA_DALayer;

using SIS_FA_SLayer.SysAdmin;
#endregion


namespace SIS_FA_SLayer.FinancialAccounting
{
    // NOTE: If you change the interface name "IFATransactionService" here, you must also update the reference to "IFATransactionService" in Web.config.
    [ServiceContract]
    public interface IFATransactionService
    {
        #region [Receipt Processing details]
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertUpdateReceiptProcessing(FASerializationMode SerMode, byte[] byteObjFA_ReceiptProcessing, string strMode, int intUpdateOption, out string Receiptno, string strConnectionName, out string strErrorMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelReceiptProcessing(FASerializationMode SerMode, byte[] byteObjFA_ReceiptProcessing, string strConnectionName);

        #endregion [Receipt Processing details]

        #region Payment Reqest
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertPaymentRequest(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, out string PayReqNo, out int request_No, string strConnectionName, out string strErrorMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelPaymentRequest(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName);

        #endregion

        #region [Cheque Return Processing details]
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertUpdateChequeReturnProcessing(FASerializationMode SerMode, byte[] byteObjFA_ChequeReturn, string strMode, int intUpdateOption, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelChequeReturnProcessing(FASerializationMode SerMode, byte[] byteObjFA_ChequeReturn, string strConnectionName);

        #endregion [Cheque Return Processing details]


        #region Approvals
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertApproval(FASerializationMode SerMode, byte[] bytesobjFATran_AUTH_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubRevokeOrUpdateApprovedDetails(FASerializationMode SerMode, byte[] bytesobjFATran_AUTH_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCommonCreateApprovals(FASerializationMode SerMode, byte[] bytesobjFATran_AUTH_DTB,string strConnectionName, out string strErrMsg,out string strErrorMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCommonRevokeApprovals(FASerializationMode SerMode, byte[] bytesRevoke_Datatable, string strConnectionName, out string strErrMsg);


        #endregion


        #region "Challan Generation"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertChallanGeneration(FASerializationMode SerMode, byte[] bytesobjFA_ChallanGenerationDataTable, out string ChallanDocNo,out string strErrorMsg, string strConnectionName);
        #endregion

        #region "PPJV Approval"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertPPJVApproval(FASerializationMode SerMode, byte[] bytesobjFATran_Auth_DTB, string strConnectionName, out string strDocNo);
        #endregion

        #region [Investment Interest Accrued]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubPostInvestmentInterestAccrued(FASerializationMode SerMode, byte[] byteObjInvst_Accrued, out int Inv_int_id, string strConnectionName, out string strDocNo);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelInterestAccrued(FASerializationMode SerMode, byte[] byteObjInvst_Accrued, string strConnectionName);

        #endregion [Investment Interest Accrued]


        #region [NCD Upload]
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertNCDUpload(FASerializationMode SerMode, byte[] bytesobjNCDUploadDataTable, string strConnectionName, out int intRec, out int intProc);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        string FunPubGetConStringNCDUpload(string strConnectionName);

        #endregion


        #region "Asset Master"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertAssetMaster(FASerializationMode SerMode, byte[] bytesobjFA_Asset_MstDataTable, string strConnectionName);

        #endregion

        #region "Asset Transaction"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertAssetTran(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Tran_HdrDataTable, string strConnectionName, out int intHT_ID, out string strDocNo, out string strErrorMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelAssetTran(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Tran_HdrDataTable, string strConnectionName);
        
        #endregion

        #region "Asset Depreciation"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertAssetDep(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Dep_HdrDataTable, string strConnectionName, out int intHT_ID, out string strDocNo);
        #endregion

        #region "BRS"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertBRS(FASerializationMode SerMode, byte[] bytesobjFA_BRSDataTable, string strConnectionName, out int intHT_ID, out string strDocNo);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertRatingDetails(FASerializationMode SerMode, byte[] bytesobjFA_RatingDataTable, string strConnectionName);
        #endregion

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertBRSFileFormat(FASerializationMode SerMode, byte[] bytesobjFA_BRSDataTable, string strConnectionName, out string strDocNo);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertBRSValidation(FASerializationMode SerMode, byte[] byteobjFA_BRSValiddatable, string strConnectionName, out string strDocNo);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateLPO(FASerializationMode SerMode, byte[] bytesobjLPO_List, string strConnectionName, out string strDocNo);

    }
}
