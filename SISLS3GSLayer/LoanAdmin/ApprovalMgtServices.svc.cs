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
    // NOTE: If you change the class name "ApprovalMgtServices" here, you must also update the reference to "ApprovalMgtServices" in Web.config.
    public class ApprovalMgtServices : IApprovalMgtServices
    {
        int intResult;
        SerializationMode SerMode = SerializationMode.Binary;
        byte[] bytesDataTable;
        #region IApprovalMgtServices Members

        public int FunPubCreateApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg)
        {
            try
            {
                S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals ObjApproval = new S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals();
                return ObjApproval.FunPubCreateApprovals(SerMode, bytesObjApprovalDatatable_SERLAY, out strErrMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        public int FunPubCreateSubLimitApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg)
        {
            try
            {
                S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals ObjApproval = new S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals();
              
                return ObjApproval.FunPubCreateSubLimitApprovals(SerMode, bytesObjApprovalDatatable_SERLAY, out strErrMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubRevokeOrUpdateApprovedDetails(Dictionary<string, string> dicParam)
        {
            try
            {
                S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals ObjApproval = new S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals();
                return ObjApproval.FunPubRevokeOrUpdateApprovedDetails(dicParam);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion
        /// <summary>
        /// Transaction Approval Method
        /// Created By:Anbuvel.T,Date : 25-05-2018
        /// Description : To Create Trnsaciton Approval Mthod
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjApprovalDatatable_SERLAY"></param>
        /// <param name="strErrMsg"></param>
        /// <returns></returns>
        #region "Transaction Approval"
        public int FunPubCommonCreateApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg)
        {
            try
            {
                S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals ObjApproval = new S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals();
                return ObjApproval.FunPubCommonCreateApprovals(SerMode, bytesObjApprovalDatatable_SERLAY, out strErrMsg);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        //Added on 27-Sep-2018 Starts Here
        //Common Transaction revoke

        public int FunPubCommonRevokeApprovals(SerializationMode SerMode, byte[] bytesRevoke_Datatable, out string strExceptionMessage)
        {
            try
            {
                S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals ObjApproval = new S3GDALayer.LoanAdmin.ApprovalMgtServices.ClsPubApprovals();
                return ObjApproval.FunPubCommonRevokeApprovals(SerMode, bytesRevoke_Datatable, out strExceptionMessage);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        public int FunPubCreateScheduleJobForReport(S3GBusEntity.SerializationMode SerMode, byte[] bytesApproval_Datatable, out string strErrMsg, out string strAppDetId)
        {
            try
            {
                S3GDALayer.LoanAdmin.AssetMgtServices.ClsPubAssetIdentification objSheduleJob = new S3GDALayer.LoanAdmin.AssetMgtServices.ClsPubAssetIdentification();
                return objSheduleJob.FunPubCreateScheduleJobForReport(SerMode, bytesApproval_Datatable, out strErrMsg, out strAppDetId);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        //Added on 27-Sep-2018 Ends Here

        #endregion

    }
}
