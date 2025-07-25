
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Funder Investment Management Services Interface
/// Created By			: muni Kavitha
/// Created Date		: 1-Feb-2012
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
    // NOTE: If you change the interface name "IFunderInvestmentMgtService" here, you must also update the reference to "IFunderInvestmentMgtService" in Web.config.
    [ServiceContract]
    public interface IFunderInvestmentMgtService
    {
        #region Funder Master Interface
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertFunderMaster(FASerializationMode SerMode, byte[] bytesobjFunderMaster_DTB, string strConnectionName, out int intFunder_ID, out string strDocNo);
        #endregion

        #region Funder Transaction
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertFunderTransaction1(FASerializationMode SerMode, byte[] bytesobjFunderTransaction_DTB, string strConnectionName, out int intFund_Tran_ID, out string strDocNo);
        #endregion

        #region Funder Loading Interface
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertFunderLoading(FASerializationMode SerMode, byte[] bytesobjFunderLoading_DTB, string strConnectionName, out int intFunder_Loading_ID, out string strDocNo);
        #endregion

        #region [Investment master details process]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateModifyInvestmentMaster(FASerializationMode SerMode, byte[] bytesObjInvestmentMasterDataTable, string strMode, int intUpdateOption, string strGLCode, string strSLCode, string strConnectionName, out string strDocNo);

        #endregion [Investment master details process]

        #region [Investment Transaction details process]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertUpdateInvestmentTransaction(FASerializationMode SerMode, byte[] byteObjFA_InvestmentTransaction, string strMode, int intUpdateOption, string strConnectionName, out string strDocNo);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelingInvestmentTransaction(FASerializationMode SerMode, byte[] byteObjFA_InvestmentTransaction, string strConnectionName);
        #endregion [Investment Transaction details process]

        #region Deal Master Interface
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertDealMaster(FASerializationMode SerMode, byte[] bytesobjDealMaster_DTB, string strConnectionName, out int intDeal_ID, out string strDocNo);
        #endregion

        #region Treasury Bucket Interface
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertTreasuryBucket(FASerializationMode SerMode, byte[] bytesobjDealMaster_DTB, string strConnectionName, out int intDeal_ID);
        #endregion

        #region ALM Parameter
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertALMParameter(FASerializationMode SerMode, byte[] bytesobjalm_DTB, string strConnectionName, out int intDeal_ID);
        #endregion


        #region Collateral Master Interface
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateCollateralMaster(FASerializationMode SerMode, byte[] bytesobjCollateralMaster_DTB, string strConnectionName, out int intCLTMst_ID, out string strCollateralRefNo);
        #endregion

        #region Collateral Capture
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateCollateralCapture(FASerializationMode SerMode, byte[] bytesObjCollateralCaptureDataTable, string strConnectionName, out string strCollCapNo);
        #endregion

        #region Funder transaction
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertFunderTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTran_DTB, string strConnectionName, out int intFunderTran_ID, out string strDocNo);
        #endregion


        #region Actual Interest
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertActualInterest(FASerializationMode SerMode, byte[] bytesobjActualInterest_DTB, string strConnectionName, out int intFundInt_ID, out string strDocNo);
        #endregion

        #region Option Processing
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertCallPut(FASerializationMode SerMode, byte[] bytesobjCallPut_DTB, string strConnectionName, out int intCallPut_ID, out string strDocNo);
        #endregion

        #region Hedging
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertHedging(FASerializationMode SerMode, byte[] bytesobjFA_HedgingDataTable, string strConnectionName, out int intHT_ID, out string strDocNo);
        #endregion

        #region Prov Process
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertProvProcess(FASerializationMode SerMode, byte[] bytesobjFA_Prov_ProcessDataTable, string strConnectionName, out int intHT_ID, out string strDocNo);
        #endregion

        #region NCD Closure
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertNCDClosure(FASerializationMode SerMode, byte[] bytesobjNCDClosure_DTB, string strConnectionName, out int intClosure_ID, out string strDocNo);

        #endregion


        #region IRS Transaction
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertFunderIRSTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTran_DTB, string strConnectionName, out int intFunderTran_ID, out string strDocNo);
        #endregion
    }
}
