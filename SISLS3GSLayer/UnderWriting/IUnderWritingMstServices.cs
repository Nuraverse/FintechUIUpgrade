#region Page Header
/// © 2016 SUNDARAM INFOTECH SOLUTIONS  . All rights reserved
/// <Program Summary>
/// Module Name			: Under Writing
/// Screen Name			: under Writing Master
/// Created By			: Anbuvel T
/// Created Date		: 01-Jun-2016
/// Purpose	            : 
/// <Program Summary>
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;

namespace S3GServiceLayer.UnderWriting
{
    [ServiceContract]
    public interface IUnderWritingMstServices
    {
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubUnderWritingMSTDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_MasterDataTable, out int outNoofYear, out int outCreditScoreID);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateUnderWritingAprovalMstDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_ApprovalMasterDataTable, out int outCreditScoreID);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubQueryUnderWritingMstParameterDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_MasterDataTable);

        #region Under Writing Transaction
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateUnderWritingTransaction(SerializationMode SerMode, byte[] bytesObjS3G_UW_UnderWritingTrans_DataTable, out string strUWNumber_Out);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyUnderWritingTransaction(SerializationMode SerMode, byte[] bytesObjS3G_UW_UnderWritingTrans_DataTable);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateUnderWritingAccessMstDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_UserAccessMasterDataTable, out int outUserAccessID);
        #endregion

        #region Under Writing Approval Transaction
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateUnderWritingAprTranDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_UserAprTransDataTable, out int outAprTransID);
        #endregion
    }
}
