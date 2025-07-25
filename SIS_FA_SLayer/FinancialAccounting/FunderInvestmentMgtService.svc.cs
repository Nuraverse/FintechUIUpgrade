
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Funder Investment Management Services 
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
using System.Data;
using System.ServiceModel.Activation;
using SIS_FA_SLayer.SysAdmin;
#endregion

namespace SIS_FA_SLayer.FinancialAccounting
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: If you change the class name "FunderInvestmentMgtService" here, you must also update the reference to "FunderInvestmentMgtService" in Web.config.
    public class FunderInvestmentMgtService : IFunderInvestmentMgtService
    {
        int intErrorCode;
        byte[] bytesDataTable;

        #region Funder Master

        public int FunPubInsertFunderMaster(FASerializationMode SerMode, byte[] bytesobjFunderMaster_DTB, string strConnectionName, out int intFunder_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubFunderMaster objFunderMaster = new FA_DALayer.FinancialAccounting.ClsPubFunderMaster(strConnectionName);
            intErrorCode = objFunderMaster.FunPubInsertFunderMaster(SerMode, bytesobjFunderMaster_DTB, strConnectionName, out intFunder_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion

        #region Funder Transaction

        public int FunPubInsertFunderTransaction1(FASerializationMode SerMode, byte[] bytesobjFunderTransaction_DTB, string strConnectionName, out int intFund_Tran_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubFunderTransaction objFunderTransaction = new FA_DALayer.FinancialAccounting.ClsPubFunderTransaction(strConnectionName);
            intErrorCode = objFunderTransaction.FunPubInsertFunderTransaction(SerMode, bytesobjFunderTransaction_DTB, strConnectionName, out intFund_Tran_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion

        #region Funder Loading

        public int FunPubInsertFunderLoading(FASerializationMode SerMode, byte[] bytesobjFunderLoading_DTB, string strConnectionName, out int intFunder_Loading_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubFunderLoading objFunderLoading = new FA_DALayer.FinancialAccounting.ClsPubFunderLoading(strConnectionName);
            intErrorCode = objFunderLoading.FunPubInsertFunderLoading(SerMode, bytesobjFunderLoading_DTB, strConnectionName, out intFunder_Loading_ID, out  strDocNo);
            return intErrorCode;
        }
        #endregion



        #region [Investment master details process]
        /// <summary>
        /// Craeted by Tamilselvan.S
        /// created Date 04/02/2012
        /// Creted new Investment master or modified the exising master details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjInvestmentMasterDataTable"></param>
        /// <param name="strMode"></param>
        /// <param name="intUpdateOption"></param>
        /// <returns></returns>
        public int FunPubCreateModifyInvestmentMaster(FASerializationMode SerMode, byte[] bytesObjInvestmentMasterDataTable, string strMode, int intUpdateOption, string strGLCode, string strSLCode, string strConnectionName, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubInvestmentMaster objInvestmentMaster = new FA_DALayer.FinancialAccounting.ClsPubInvestmentMaster(strConnectionName);
            return objInvestmentMaster.FunPubInsertUpdateInvestmentMaster(SerMode, bytesObjInvestmentMasterDataTable, strMode, intUpdateOption, strGLCode, strSLCode, out strDocNo);
        }

        #endregion [Investment master details process]

        #region [Investment Transaction details process]

        /// <summary>
        /// Craeted by Tamilselvan.S
        /// created Date 10/02/2012
        /// Creted new Investment Transaction or modified the exising Transaction details     
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_InvestmentTransaction"></param>
        /// <param name="strMode"></param>
        /// <param name="intUpdateOption"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateInvestmentTransaction(FASerializationMode SerMode, byte[] byteObjFA_InvestmentTransaction, string strMode, int intUpdateOption, string strConnectionName, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubInvestmentTransaction objInvestmentMaster = new FA_DALayer.FinancialAccounting.ClsPubInvestmentTransaction(strConnectionName);
            return objInvestmentMaster.FunPubInsertUpdateInvestmentTransaction(SerMode, byteObjFA_InvestmentTransaction, strMode, intUpdateOption, out strDocNo);
        }

        /// <summary>
        /// Craeted by Tamilselvan.S
        /// created Date 25/06/2012
        /// for Investment Transaction Cancelling details 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_InvestmentTransaction"></param>
        /// <returns></returns>
        public int FunPubCancelingInvestmentTransaction(FASerializationMode SerMode, byte[] byteObjFA_InvestmentTransaction, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubInvestmentTransaction objInvestmentMaster = new FA_DALayer.FinancialAccounting.ClsPubInvestmentTransaction(strConnectionName);
            return objInvestmentMaster.FunPubCancelingInvestmentTransaction(SerMode, byteObjFA_InvestmentTransaction);
        }

        #endregion [Investment Transaction details process]


        #region Deal Master

        public int FunPubInsertDealMaster(FASerializationMode SerMode, byte[] bytesobjDealMaster_DTB, string strConnectionName, out int intDeal_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDealMaster objDealMaster = new FA_DALayer.FinancialAccounting.ClsPubDealMaster(strConnectionName);
            intErrorCode = objDealMaster.FunPubInsertDealMaster(SerMode, bytesobjDealMaster_DTB, strConnectionName, out intDeal_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion

        #region Treasury Bucket

        public int FunPubInsertTreasuryBucket(FASerializationMode SerMode, byte[] bytesobjDealMaster_DTB, string strConnectionName, out int intDeal_ID)
        {
            FA_DALayer.FinancialAccounting.Treasury_Bucket objDealMaster = new FA_DALayer.FinancialAccounting.Treasury_Bucket(strConnectionName);
            intErrorCode = objDealMaster.FunPubInsertTreasuryBucket(SerMode, bytesobjDealMaster_DTB, strConnectionName, out intDeal_ID);
            return intErrorCode;
        }
        #endregion

        #region ALM Parameter

        public int FunPubInsertALMParameter(FASerializationMode SerMode, byte[] bytesobjalm_DTB, string strConnectionName, out int intDeal_ID)
        {
            FA_DALayer.FinancialAccounting.Treasury_Bucket objDealMaster = new FA_DALayer.FinancialAccounting.Treasury_Bucket(strConnectionName);
            intErrorCode = objDealMaster.FunPubInsertALMParameter(SerMode, bytesobjalm_DTB, strConnectionName, out intDeal_ID);
            return intErrorCode;
        }
        #endregion

        #region Collateral Master

        public int FunPubCreateCollateralMaster(FASerializationMode SerMode, byte[] bytesobjCollateralMaster_DTB, string strConnectionName, out int intCLTMst_ID, out string strCollateralRefNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubCollateralMaster objCollateralMaster = new FA_DALayer.FinancialAccounting.ClsPubCollateralMaster(strConnectionName);
            intErrorCode = objCollateralMaster.FunPubCreateCollateralMaster(SerMode, bytesobjCollateralMaster_DTB, strConnectionName, out intCLTMst_ID, out strCollateralRefNo);
            return intErrorCode;
        }
        #endregion

        public int FunPubCreateCollateralCapture(FASerializationMode SerMode, byte[] bytesObjCollateralCaptureDataTable,string strConnectionName, out string strCollCap_No)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubCollateralCapture ObjCollateralCapture = new FA_DALayer.FinancialAccounting.ClsPubCollateralCapture(strConnectionName);
                return ObjCollateralCapture.FunPubCreateCollateralCapture(SerMode, bytesObjCollateralCaptureDataTable,strConnectionName, out strCollCap_No);
            }
            catch (Exception ex)
            {
                ClsPubFaultException objfaultex = new ClsPubFaultException();
                objfaultex.ProReasonRW = ex.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objfaultex, new FaultReason(objfaultex.ProReasonRW));
            }
        }
     

        #region "Funder Transaction"

        public int FunPubInsertFunderTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTran_DTB, string strConnectionName, out int intFunderTran_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDealMaster objFunderTransaction = new FA_DALayer.FinancialAccounting.ClsPubDealMaster(strConnectionName);
            intErrorCode = objFunderTransaction.FunPubInsertFunderTransaction(SerMode, bytesobjFunderTran_DTB, strConnectionName, out intFunderTran_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion

        #region "Actual Interest"

        public int FunPubInsertActualInterest(FASerializationMode SerMode, byte[] bytesobjActualInterest_DTB, string strConnectionName, out int intFundInt_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDealMaster objFunderTransaction = new FA_DALayer.FinancialAccounting.ClsPubDealMaster(strConnectionName);
            intErrorCode = objFunderTransaction.FunPubInsertActualInterest(SerMode, bytesobjActualInterest_DTB, strConnectionName, out intFundInt_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion


 #region "Option Processing"

        public int FunPubInsertCallPut(FASerializationMode SerMode, byte[] bytesobjCallPut_DTB, string strConnectionName, out int intCallPut_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDealMaster objFunderTransaction = new FA_DALayer.FinancialAccounting.ClsPubDealMaster(strConnectionName);
            intErrorCode = objFunderTransaction.FunPubInsertCallPut(SerMode, bytesobjCallPut_DTB, strConnectionName, out intCallPut_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion



        #region "Hedging"

        public int FunPubInsertHedging(FASerializationMode SerMode, byte[] bytesobjFA_HedgingDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubHedging objHedging = new FA_DALayer.FinancialAccounting.ClsPubHedging(strConnectionName);
            intErrorCode = objHedging.FunPubInsertHedging(SerMode, bytesobjFA_HedgingDataTable, strConnectionName, out intHT_ID, out strDocNo);
            return intErrorCode;
        }

        #endregion

  #region "Prov Interest"

        public int FunPubInsertProvProcess(FASerializationMode SerMode, byte[] bytesobjFA_Prov_ProcessDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubProvProcess objHedging = new FA_DALayer.FinancialAccounting.ClsPubProvProcess(strConnectionName);
            intErrorCode = objHedging.FunPubInsertProvProcess(SerMode, bytesobjFA_Prov_ProcessDataTable, strConnectionName, out intHT_ID, out strDocNo);
            return intErrorCode;
        }

        #endregion


        #region "NCD Closure"


        public int FunPubInsertNCDClosure(FASerializationMode SerMode, byte[] bytesobjNCDClosure_DTB, string strConnectionName, out int intClosure_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDealMaster objFunderTransaction = new FA_DALayer.FinancialAccounting.ClsPubDealMaster(strConnectionName);
            intErrorCode = objFunderTransaction.FunPubInsertNCDClosure(SerMode, bytesobjNCDClosure_DTB, strConnectionName, out intClosure_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion


        #region "IRS Transaction"
        public int FunPubInsertFunderIRSTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTran_DTB, string strConnectionName, out int intFunderTran_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubDealMaster objFunderTransaction = new FA_DALayer.FinancialAccounting.ClsPubDealMaster(strConnectionName);
            intErrorCode = objFunderTransaction.FunPubInsertFunderIRSTransaction(SerMode, bytesobjFunderTran_DTB, strConnectionName, out intFunderTran_ID, out strDocNo);
            return intErrorCode;
        }
        #endregion


    }
}
