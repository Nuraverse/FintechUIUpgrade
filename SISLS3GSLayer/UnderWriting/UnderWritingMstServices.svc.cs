#region Page Header
/// © 2016 SUNDARAM INFOTECH SOLUTIONS. All rights reserved
/// <Program Summary>
/// Module Name			: Under Writing
/// Screen Name			: Under Writing Master
/// Created By			: Anbuvel T
/// Created Date		: 28-July-2016
/// Purpose	            : 
/// <Program Summary>
#endregion

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

namespace S3GServiceLayer.UnderWriting
{
    // To Implement Service Compatablity
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]

    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "UnderWritingMstServices" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select UnderWritingMstServices.svc or UnderWritingMstServices.svc.cs at the Solution Explorer and start debugging.
    public class UnderWritingMstServices : IUnderWritingMstServices
    {
        int intResult;
        byte[] bytesDataTable;
        S3GDALayer.UnderWriting.UnderWritingMgtServices.ClsUnderWriting ObjUnderWriting = new S3GDALayer.UnderWriting.UnderWritingMgtServices.ClsUnderWriting();


        public int FunPubUnderWritingMSTDetails(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_UW_MasterDataTable, out int outNoofYear, out int outCreditScoreID)
        {
            try
            {
                intResult = ObjUnderWriting.FunPubUnderWritingMSTDetails(SerMode, bytesObjS3G_UW_MasterDataTable, out outNoofYear, out outCreditScoreID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in under Wrting Master Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public int FunPubCreateUnderWritingAprovalMstDetails(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_UW_ApprovalMasterDataTable, out int outCreditScoreID)
        {
            try
            {
                intResult = ObjUnderWriting.FunPubCreateUnderWritingAprovalMstDetails(SerMode, bytesObjS3G_UW_ApprovalMasterDataTable, out outCreditScoreID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Under Writing Approval Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public byte[] FunPubQueryUnderWritingMstParameterDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_CreditScoreMasterDataTable)
        {
            DataSet dsCreditScore = null;
            try
            {
                dsCreditScore = ObjUnderWriting.FunPubQueryUnderWritingMstParameterDetails(SerMode, bytesObjS3G_ORG_CreditScoreMasterDataTable);
                bytesDataTable = ClsPubSerialize.Serialize(dsCreditScore, SerializationMode.Binary);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting CreditScore :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            finally
            {
                dsCreditScore.Dispose();
                dsCreditScore = null;
            }
            return bytesDataTable;

        }

        #region Under Writing Transaction

        public int FunPubCreateUnderWritingTransaction(SerializationMode SerMode, byte[] bytesObjS3G_UW_UnderWritingTrans_DataTable, out string strUWNumber_Out)
        {
            try
            {
                return ObjUnderWriting.FunPubCreateUnderWritingTransaction(SerMode, bytesObjS3G_UW_UnderWritingTrans_DataTable, out strUWNumber_Out);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubModifyUnderWritingTransaction(SerializationMode SerMode, byte[] bytesObjS3G_ORG_CreditGuideTrans_DataTable)
        {

            try
            {
                return ObjUnderWriting.FunPubModifyUnderWritingTransaction(SerMode, bytesObjS3G_ORG_CreditGuideTrans_DataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region Under Writing User Access Master
        public int FunPubCreateUnderWritingAccessMstDetails(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_UW_UserAccessMasterDataTable, out int outUserAccessID)
        {
            try
            {
                intResult = ObjUnderWriting.FunPubCreateUnderWritingAccessMstDetails(SerMode, bytesObjS3G_UW_UserAccessMasterDataTable, out outUserAccessID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Under Writing User Access Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion

        #region Under Writing Approval Transaction
        public int FunPubCreateUnderWritingAprTranDetails(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_UW_UserAprTransDataTable, out int outAprTransID)
        {
            try
            {
                intResult = ObjUnderWriting.FunPubCreateUnderWritingAprTranDetails(SerMode, bytesObjS3G_UW_UserAprTransDataTable, out outAprTransID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Under Writing Approval Transaction Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion
    }
}
