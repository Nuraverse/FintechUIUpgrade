
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Receipt Processing Services 
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
using System.Data;
using SIS_FA_SLayer.SysAdmin;
using System.ServiceModel.Activation;

#endregion

namespace SIS_FA_SLayer.FinancialAccounting
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]

    // NOTE: If you change the class name "FATransactionService" here, you must also update the reference to "FATransactionService" in Web.config.
    public class FATransactionService : IFATransactionService
    {
        #region [Receipt Processing details]

        /// <summary>
        /// Craeted by Tamilselvan.S
        /// created Date 20/03/2012
        /// Creted new Receipt Processing Create or modified the exising Transaction details     
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_ReceiptProcessing"></param>
        /// <param name="strMode"></param>
        /// <param name="intUpdateOption"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateReceiptProcessing(FASerializationMode SerMode, byte[] byteObjFA_ReceiptProcessing, string strMode, int intUpdateOption, out string Receiptno, string strConnectionName, out string strErrorMsg)
        {
            FA_DALayer.FinancialAccounting.ClsPubReceiptProcessing objReceiptProcessing = new FA_DALayer.FinancialAccounting.ClsPubReceiptProcessing(strConnectionName);
            return objReceiptProcessing.FunPubInsertUpdateReceiptProcessing(SerMode, byteObjFA_ReceiptProcessing, strMode, intUpdateOption, out Receiptno, out strErrorMsg);
        }

        /// <summary>
        /// For Receipt cancelling 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_ReceiptProcessing"></param>
        /// <returns></returns>
        public int FunPubCancelReceiptProcessing(FASerializationMode SerMode, byte[] byteObjFA_ReceiptProcessing, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubReceiptProcessing objReceiptProcessing = new FA_DALayer.FinancialAccounting.ClsPubReceiptProcessing(strConnectionName);
            return objReceiptProcessing.FunPubCancelReceiptProcessing(SerMode, byteObjFA_ReceiptProcessing);
        }

        #endregion [Receipt Processing details]

        #region Payment Request
        public int FunPubInsertPaymentRequest(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, out string PayReqNo, out int request_No, string strConnectionName, out string strErrorMsg)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubPaymentRequest objPR = new FA_DALayer.FinancialAccounting.ClsPubPaymentRequest(strConnectionName);
                return objPR.FunPubInsertPaymentRequest(SerMode, bytesobjFATran_Header_DTB, out PayReqNo, out request_No, out strErrorMsg);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Payment Request: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }


        public int FunPubCancelPaymentRequest(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubPaymentRequest objPR = new FA_DALayer.FinancialAccounting.ClsPubPaymentRequest(strConnectionName);
                return objPR.FunPubCancelPaymentRequest(SerMode, bytesobjFATran_Header_DTB);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Payment Request: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region [Cheque Return Processing details]

        /// <summary>
        /// Craeted by Tamilselvan.S
        /// created Date 03/04/2012
        /// Creted new Cheque Return Create or modified the exising Transaction details     
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_ChequeReturn"></param>
        /// <param name="strMode"></param>
        /// <param name="intUpdateOption"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateChequeReturnProcessing(FASerializationMode SerMode, byte[] byteObjFA_ChequeReturn, string strMode, int intUpdateOption, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubChequeReturnProcessing objCHRProcessing = new FA_DALayer.FinancialAccounting.ClsPubChequeReturnProcessing(strConnectionName);
            return objCHRProcessing.FunPubInsertUpdateChequeReturnProcessing(SerMode, byteObjFA_ChequeReturn, strMode, intUpdateOption);
        }

        /// <summary>
        /// For Cheque Return cancelling 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_ChequeReturn"></param>
        /// <returns></returns>
        public int FunPubCancelChequeReturnProcessing(FASerializationMode SerMode, byte[] byteObjFA_ChequeReturn, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubChequeReturnProcessing objCHRProcessing = new FA_DALayer.FinancialAccounting.ClsPubChequeReturnProcessing(strConnectionName);
            return objCHRProcessing.FunPubCancelChequeReturnProcessing(SerMode, byteObjFA_ChequeReturn);
        }

        #endregion [Cheque Return Processing details]

        #region "Approvals"
        public int FunPubInsertApproval(FASerializationMode SerMode, byte[] bytesobjFATran_Auth_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubApproval objAPPVL = new FA_DALayer.FinancialAccounting.ClsPubApproval(strConnectionName);
                return objAPPVL.FunPubInsertApproval(SerMode, bytesobjFATran_Auth_DTB);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Approval: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        public int FunPubRevokeOrUpdateApprovedDetails(FASerializationMode SerMode, byte[] bytesobjFATran_Auth_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubApproval objAPPVL = new FA_DALayer.FinancialAccounting.ClsPubApproval(strConnectionName);
                return objAPPVL.FunPubRevokeOrUpdateApprovedDetails(SerMode, bytesobjFATran_Auth_DTB);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Approval: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        public int FunPubCommonCreateApprovals(FASerializationMode SerMode, byte[] bytesobjFATran_Auth_DTB, string strConnectionName,out string strErrMsg,out string strErrorMsg)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubApproval objAPPVL = new FA_DALayer.FinancialAccounting.ClsPubApproval(strConnectionName);
                return objAPPVL.FunPubCommonCreateApprovals(SerMode, bytesobjFATran_Auth_DTB, out strErrMsg, out strErrorMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        public int FunPubCommonRevokeApprovals(FASerializationMode SerMode, byte[] bytesRevoke_Datatable, string strConnectionName, out string strExceptionMessage)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubApproval objAPPVL = new FA_DALayer.FinancialAccounting.ClsPubApproval(strConnectionName);
                return objAPPVL.FunPubCommonRevokeApprovals(SerMode, bytesRevoke_Datatable, out strExceptionMessage);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        #endregion

        #region "Challan Generation"
        public int FunPubInsertChallanGeneration(FASerializationMode SerMode, byte[] bytesobjFA_ChallanGenerationDataTable, out string ChallanDocNo,out string strErrorMsg, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubChallanGeneration objChallanGeneration = new FA_DALayer.FinancialAccounting.ClsPubChallanGeneration(strConnectionName);
                return objChallanGeneration.FunPubInsertChallanGeneration(SerMode, bytesobjFA_ChallanGenerationDataTable, out ChallanDocNo, out strErrorMsg);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Challan Generation: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region "PPJV Approval"
        public int FunPubInsertPPJVApproval(FASerializationMode SerMode, byte[] bytesobjFATran_Auth_DTB, string strConnectionName, out string strDocNo)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubPriorPeriodJV objPPJVApproval = new FA_DALayer.FinancialAccounting.ClsPubPriorPeriodJV(strConnectionName );
                return objPPJVApproval.FunPubInsertPPJVApproval(SerMode, bytesobjFATran_Auth_DTB,strConnectionName,out strDocNo );
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prior Period JV Approval: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region [Investment Interest Accrued]

        /// <summary>
        /// Cretaed By Tamilselvan.S
        /// Created Date 24/04/2012
        /// To Post(Insert / Update) the Investment interest Accrued Details.
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjInvst_Accrued"></param>
        /// <param name="strMode"></param>
        /// <param name="intUpdateOption"></param>
        /// <returns></returns>
        public int FunPubPostInvestmentInterestAccrued(FASerializationMode SerMode, byte[] byteObjInvst_Accrued, out int Fund_int_id, string strConnectionName, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubInvestmentInterestAccrued objInvstAccrued = new FA_DALayer.FinancialAccounting.ClsPubInvestmentInterestAccrued(strConnectionName);
            return objInvstAccrued.FunPubPostInvestmentInterestAccrued(SerMode, byteObjInvst_Accrued, out  Fund_int_id, strConnectionName, out  strDocNo);
        }

        /// <summary>
        /// Cretaed By Tamilselvan.S
        /// Created Date 24/04/2012
        /// To Cancel the Investment Interest Accrued Details.
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjInvst_Accrued"></param>
        /// <returns></returns>
        public int FunPubCancelInterestAccrued(FASerializationMode SerMode, byte[] byteObjInvst_Accrued, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubInvestmentInterestAccrued objInvstAccrued = new FA_DALayer.FinancialAccounting.ClsPubInvestmentInterestAccrued(strConnectionName);
            return objInvstAccrued.FunPubCancelInterestAccrued(SerMode, byteObjInvst_Accrued);
        }

        #endregion [Investment Interest Accrued]

        #region [NCD Upload]

        /// <summary>
        /// Cretaed By Thangam M.
        /// Created Date 05/mar/2013
        /// To insert NCD upload details.
        /// </summary>

        public int FunPubInsertNCDUpload(FASerializationMode SerMode, byte[] bytesobjNCDUploadDataTable, string strConnectionName, out int intRec, out int intProc)
        {
            FA_DALayer.FinancialAccounting.ClsPubNCDUpload objNCDUpload = new FA_DALayer.FinancialAccounting.ClsPubNCDUpload(strConnectionName);
            return objNCDUpload.FunPubInsertNCDUpload(SerMode, bytesobjNCDUploadDataTable, out intRec, out intProc);
        }



        public string FunPubGetConStringNCDUpload(string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubNCDUpload objNCDUpload = new FA_DALayer.FinancialAccounting.ClsPubNCDUpload(strConnectionName);
            return objNCDUpload.FunPubGetConStringNCDUpload();
        }


        #endregion


        #region "Asset Master"

        /// <summary>
        ///
        /// To insert Asset Master details.
        /// </summary>

        public int FunPubInsertAssetMaster(FASerializationMode SerMode, byte[] bytesobjFA_Asset_MstDataTable, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubAssetMst objAssetMst = new FA_DALayer.FinancialAccounting.ClsPubAssetMst(strConnectionName);
            return objAssetMst.FunPubInsertAssetMaster(SerMode, bytesobjFA_Asset_MstDataTable);
        }

        #endregion

        #region "Asset Trtansaction"

        public int FunPubInsertAssetTran(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Tran_HdrDataTable, string strConnectionName, out int intHT_ID, out string strDocNo,out string strErrorMsg)
        {
            FA_DALayer.FinancialAccounting.ClsPubAssetTransaction objAssetTransaction = new FA_DALayer.FinancialAccounting.ClsPubAssetTransaction(strConnectionName);
            return objAssetTransaction.FunPubInsertAssetTran(SerMode, bytesobjFA_Asset_Tran_HdrDataTable, strConnectionName, out intHT_ID, out strDocNo, out strErrorMsg);
        }

        public int FunPubCancelAssetTran(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Tran_HdrDataTable, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubAssetTransaction objAssetTransaction = new FA_DALayer.FinancialAccounting.ClsPubAssetTransaction(strConnectionName);
            return objAssetTransaction.FunPubCancelAssetTran(SerMode, bytesobjFA_Asset_Tran_HdrDataTable);

        }

        #endregion


        #region "Asset Depreciation"
        public int FunPubInsertAssetDep(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Dep_HdrDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubAssetDepreciation objAssetDepreciation = new FA_DALayer.FinancialAccounting.ClsPubAssetDepreciation(strConnectionName);
            return objAssetDepreciation.FunPubInsertAssetDep(SerMode, bytesobjFA_Asset_Dep_HdrDataTable, strConnectionName, out intHT_ID, out strDocNo);

        }
        #endregion

        #region "BRS"

        public int FunPubInsertBRS(FASerializationMode SerMode, byte[] bytesobjFA_BRSDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubBRS objClsPubBRS = new FA_DALayer.FinancialAccounting.ClsPubBRS(strConnectionName);
            return objClsPubBRS.FunPubInsertBRS(SerMode, bytesobjFA_BRSDataTable, strConnectionName, out intHT_ID, out strDocNo);

        }
        public int FunPubInsertRatingDetails(FASerializationMode SerMode, byte[] bytesobjFA_RatingDataTable, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubRatingDetails ObjClPubRat = new FA_DALayer.FinancialAccounting.ClsPubRatingDetails(strConnectionName);
            return ObjClPubRat.FunPubInsertRatingDetails(SerMode, bytesobjFA_RatingDataTable);
        }
        #endregion

        public int FunPubInsertBRSFileFormat(FASerializationMode SerMode, byte[] bytesobjFA_BRSDataTable, string strConnectionName, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubBRSFileFormat objClsPubBRSFileFormat = new FA_DALayer.FinancialAccounting.ClsPubBRSFileFormat(strConnectionName);
            return objClsPubBRSFileFormat.FunPubInsertBRSFileFormat(SerMode, bytesobjFA_BRSDataTable, strConnectionName, out strDocNo);

        }

        public int FunPubInsertBRSValidation(FASerializationMode SerMode, byte[] byteobjFA_BRSValiddatable, string strConnectionName, out string strDocNo)
        {

            FA_DALayer.FinancialAccounting.ClsPubBRSFileFormat objBRSDataValidation = new FA_DALayer.FinancialAccounting.ClsPubBRSFileFormat(strConnectionName);
            return objBRSDataValidation.FunPubInsertBRSValidation(SerMode, byteobjFA_BRSValiddatable, strConnectionName, out strDocNo);

        }

        public int FunPubCreateLPO(FASerializationMode SerMode, byte[] bytesobjLPO_List, string strConnectionName, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDeliveryInstruction objClsPubLPO = new FA_DALayer.FinancialAccounting.ClsPubDeliveryInstruction(strConnectionName);
            return objClsPubLPO.FunPubCreateLPO(SerMode, bytesobjLPO_List, strConnectionName, out strDocNo);

        }

    }
}
