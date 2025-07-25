using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace S3GServiceLayer.LoanAdmin
{
    // NOTE: If you change the interface name "IApprovalMgtServices" here, you must also update the reference to "IApprovalMgtServices" in Web.config.
    [ServiceContract]
    public interface IApprovalMgtServices
    {
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateSubLimitApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubRevokeOrUpdateApprovedDetails(Dictionary<string, string> dicParam);
        /// <summary>
        /// Created By : Anbuvel.T Date : 25-MAY-2018, Description : Transaction Approval Method Call
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjApprovalDatatable_SERLAY"></param>
        /// <param name="strErrMsg"></param>
        /// <returns></returns>
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCommonCreateApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg);

        //Added on 27-Sep-2018 Starts Here
        //Common Transaction revoke

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCommonRevokeApprovals(S3GBusEntity.SerializationMode SerMode, byte[] bytesRevoke_Datatable, out string strExceptionMessage);

        //Added on 27-Sep-2018 Ends Here


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateScheduleJobForReport(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjApprovalDatatable_SERLAY, out string strErrMsg, out string strAppDetId);
    }
}
