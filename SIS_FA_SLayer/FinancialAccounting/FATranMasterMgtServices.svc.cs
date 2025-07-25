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


namespace SIS_FA_SLayer.FinancialAccounting
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: If you change the class name "FATranMasterMgtServices" here, you must also update the reference to "FATranMasterMgtServices" in Web.config.
    public class FATranMasterMgtServices : IFATranMasterMgtServices
    {
        int intResult;
        byte[] bytesDataTable;
        #region IRuleCardMgtServices Authorization Rule Card

        public int FunPubCreateAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesObjAuthorizationRuleCardDataTable_SERLAY, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubAuthorizationRC ObjAuthorizationRuleCard = new FA_DALayer.FinancialAccounting.ClsPubAuthorizationRC(strConnectionName);
            intResult = ObjAuthorizationRuleCard.FunPubCreateAuthorizationRuleCard(SerMode, bytesObjAuthorizationRuleCardDataTable_SERLAY);
            return intResult;
        }

        public int FunPubModifyAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesObjAuthorizationRuleCardDataTable_SERLAY, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubAuthorizationRC ObjAuthorizationRuleCard = new FA_DALayer.FinancialAccounting.ClsPubAuthorizationRC(strConnectionName);
            intResult = ObjAuthorizationRuleCard.FunPubModifyAuthorizationRuleCard(SerMode, bytesObjAuthorizationRuleCardDataTable_SERLAY);
            return intResult;
        }

        //public byte[] FunPubQueryTransactionTypeMaster(FASerializationMode SerMode, byte[] bytesObjTransactionTypeMasterDataTable_SERLAY)
        //{
        //    S3GBusEntity.Origination.RuleCardMgtServices.S3G_Status_LookUPDataTable DtTransactionType;
        //    S3GDALayer.Origination.RuleCardMgtServices.ClsPubAuthorizationRuleCard ObjAuthorizationRuleCard = new S3GDALayer.Origination.RuleCardMgtServices.ClsPubAuthorizationRuleCard();
        //    DtTransactionType = ObjAuthorizationRuleCard.FunQueryTransactionTypeMaster(SerMode, bytesObjTransactionTypeMasterDataTable_SERLAY);
        //    bytesDataTable = FAClsPubSerialize.Serialize(DtTransactionType, FASerializationMode.Binary);
        //    return bytesDataTable;
        //}

        //public byte[] FunPubQueryConstitutionMaster(FASerializationMode SerMode, byte[] bytesObjConstitutionMasterDataTable_SERLAY)
        //{
        //    S3GBusEntity.Origination.RuleCardMgtServices.S3G_ORG_ConstitutionMasterDataTable DtConstitutionMaster;
        //    S3GDALayer.Origination.RuleCardMgtServices.ClsPubAuthorizationRuleCard ObjAuthorizationRuleCard = new S3GDALayer.Origination.RuleCardMgtServices.ClsPubAuthorizationRuleCard();
        //    DtConstitutionMaster = ObjAuthorizationRuleCard.FunQueryConstitutionMaster(SerMode, bytesObjConstitutionMasterDataTable_SERLAY);
        //    bytesDataTable = FAClsPubSerialize.Serialize(DtConstitutionMaster, FASerializationMode.Binary);
        //    return bytesDataTable;
        //}

        public byte[] FunPubQueryAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesObjAuthorizationRuleCardDataTable_SERLAY, string strConnectionName)
        {
            DataSet DsAuthorizationRuleCard = new DataSet();
            try
            {
                FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable DtAuthorizationRuleCard;
                FA_DALayer.FinancialAccounting.ClsPubAuthorizationRC ObjAuthorizationRuleCard = new FA_DALayer.FinancialAccounting.ClsPubAuthorizationRC(strConnectionName);
                DsAuthorizationRuleCard = ObjAuthorizationRuleCard.FunQueryAuthorizationRuleCard(SerMode, bytesObjAuthorizationRuleCardDataTable_SERLAY);
                bytesDataTable = FAClsPubSerialize.Serialize(DsAuthorizationRuleCard, FASerializationMode.Binary);
                return bytesDataTable;

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting AuthorizationRuleCard:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            finally
            {
                DsAuthorizationRuleCard.Dispose();
                DsAuthorizationRuleCard = null;
            }
        }

        #endregion

        #region Account Card
        /// <summary>
        /// created By Manikandan. R
        /// created date 04/02/2012
        /// For Insert and Update process for Account Card
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_AccountCard"></param>
        /// <returns></returns>
        public int FunPubInsertAccountCard(FASerializationMode SerMode, byte[] byteObjFA_AccountCard, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubAccountCard ObjAccountCard = new FA_DALayer.FinancialAccounting.ClsPubAccountCard(strConnectionName);
                return ObjAccountCard.FunPubInsertAccountCard(SerMode, byteObjFA_AccountCard);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Account Card : " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        # region Cashflow Master
        #region Create CFM
        public int FunPubCreateCashflowMaster(FASerializationMode SerMode, byte[] bytesObjCashflowDataTable_SERLAY, out string strCashflowNumber_Out, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubCashFlowMaster ObjCashflowMaster = new FA_DALayer.FinancialAccounting.ClsPubCashFlowMaster(strConnectionName);
                intResult = ObjCashflowMaster.FunPubCreateCashflow(SerMode, bytesObjCashflowDataTable_SERLAY, out strCashflowNumber_Out);
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

        #region Modify CFM

        public int FunPubModifyCashflowMaster(FASerializationMode SerMode, byte[] bytesObjCashflowDataTable_SERLAY, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubCashFlowMaster ObjCashflowMaster = new FA_DALayer.FinancialAccounting.ClsPubCashFlowMaster(strConnectionName);
                intResult = ObjCashflowMaster.FunPubModifyCashflow(SerMode, bytesObjCashflowDataTable_SERLAY);
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

        //#region Delete CFM

        //public int FunPubDeleteCashflowMaster(FASerializationMode SerMode, byte[] bytesObjDeleteCashflowDataTable_SERLAY)
        //{
        //    try
        //    {
        //        S3GDALayer.Origination.CashflowMgtServices.ClsPubCashflowMaster ObjDeleteCashflowMaster = new S3GDALayer.Origination.CashflowMgtServices.ClsPubCashflowMaster();
        //        intResult = ObjDeleteCashflowMaster.FunPubDeleteCashflow(SerMode, bytesObjDeleteCashflowDataTable_SERLAY);
        //    }
        //    catch (Exception objExp)
        //    {
        //        ClsPubFaultException objFault = new ClsPubFaultException();
        //        objFault.ProReasonRW = "Erro in Cashflow Delete :" + objExp.Message.ToString();
        //        throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
        //    }
        //    return intResult;
        //}


        //#endregion
        #endregion

        #region BudgetMaster
        public int FunPubCreateBudget(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List, out int int_budget_id, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubBudget objbudget = new FA_DALayer.FinancialAccounting.ClsPubBudget(strConnectionName);
                return objbudget.FunPubCreateBudget(SerMode, bytesobjBudgetMst_List, out  int_budget_id, strConnectionName);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Budget: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region Manual Journal
        public int FunPubInsertManualJournal(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName, out int intMJV_ID, out string strDocNo, out string strErrorMsg)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubManualJournal objMJV = new FA_DALayer.FinancialAccounting.ClsPubManualJournal(strConnectionName);
                return objMJV.FunPubInsertManualJournal(SerMode, bytesobjFATran_Header_DTB, strConnectionName, out  intMJV_ID, out strDocNo,out strErrorMsg);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Manual Journal: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        public int FunPubCancelMJV(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubManualJournal objMJV = new FA_DALayer.FinancialAccounting.ClsPubManualJournal(strConnectionName);
                return objMJV.FunPubCancelMJV(SerMode, bytesobjFATran_Header_DTB, strConnectionName);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Manual Journal: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region Prior Period JV
        public int FunPubInsertPriorPeriodJV(FASerializationMode SerMode, byte[] bytesobjFA_PPJV_HDR_DTB, string strConnectionName, out int intPP_JV_ID, out string strDocNo)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubPriorPeriodJV objPPJV = new FA_DALayer.FinancialAccounting.ClsPubPriorPeriodJV(strConnectionName);
                return objPPJV.FunPubInsertPriorPeriodJV(SerMode, bytesobjFA_PPJV_HDR_DTB, strConnectionName, out  intPP_JV_ID, out strDocNo);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prior Period JV: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        public int FunPubCancelPPJV(FASerializationMode SerMode, byte[] bytesobjFA_PPJV_HDR_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubPriorPeriodJV objPPJV = new FA_DALayer.FinancialAccounting.ClsPubPriorPeriodJV(strConnectionName);
                return objPPJV.FunPubCancelPPJV(SerMode, bytesobjFA_PPJV_HDR_DTB, strConnectionName);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Prior Period JV: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        #endregion


        #region Debit Credit Note
        public int FunPubInsertDebitCredit(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, out int intDebit_ID, string strConnectionName, out string strDocNo, out string strErrorMsg)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubDebitCreditNote objDCNote = new FA_DALayer.FinancialAccounting.ClsPubDebitCreditNote(strConnectionName);
                return objDCNote.FunPubInsertDebitCredit(SerMode, bytesobjFATran_Header_DTB, out  intDebit_ID, strConnectionName, out strDocNo, out strErrorMsg);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Debit Credit Note: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }


        public int FunPubDeleteDCNote(int TranHeaderId, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubDebitCreditNote objDCNote = new FA_DALayer.FinancialAccounting.ClsPubDebitCreditNote(strConnectionName);
                return objDCNote.FunPubDeleteDCNote(TranHeaderId, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Deleting Debit Credit Note Details :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion

        #region FunderInterestAccrual
        public int FunPubInsertFunderInterest(FASerializationMode SerMode, byte[] bytesobjFundInt_List, out int Fund_int_id, string strConnectionName, out string strDocNo)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubFunderInterest objFundint = new FA_DALayer.FinancialAccounting.ClsPubFunderInterest(strConnectionName);
                return objFundint.FunPubInsertFunderInterest(SerMode, bytesobjFundInt_List, out  Fund_int_id, strConnectionName, out  strDocNo);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Funder Interest: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region Multi Location Journal
        public int FunPubInsertMultiLocationJournal(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName, out int intMJV_ID, out string strDocNo)
        {
            try
            {
                FA_DALayer.FinancialAccounting.ClsPubMultiJournal objMJV = new FA_DALayer.FinancialAccounting.ClsPubMultiJournal(strConnectionName);
                return objMJV.FunPubInsertMultiLocationJournal(SerMode, bytesobjFATran_Header_DTB, strConnectionName, out  intMJV_ID, out strDocNo);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Manual Journal: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }




        #endregion
        #region Consortium Master
        public int FunPubConsortiumMaster(FASerializationMode SerMode, byte[] ObjConsortiumMasterDataTable, string strConnectionName)
        {
            try
            {
                FA_DALayer.FinancialAccounting.FinancialAccounting.ClsPubConsortiumMaster objCons = new FA_DALayer.FinancialAccounting.FinancialAccounting.ClsPubConsortiumMaster(strConnectionName);

                return objCons.FunPubConsortiumMaster(SerMode, ObjConsortiumMasterDataTable);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Consortium: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }
        #endregion

        #region Expenses Book
        public int FunPubInsertExpensesbook(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName, out int intExpBook_ID, out string strDocNo, out string strErrorMsg)
        {
            try
            {
                
                FA_DALayer.FinancialAccounting.ClsPubExpensesBooking objeb = new FA_DALayer.FinancialAccounting.ClsPubExpensesBooking(strConnectionName);
                return objeb.FunPubInsertExpensesbook(SerMode, bytesobjFATran_Header_DTB, strConnectionName, out  intExpBook_ID, out strDocNo, out  strErrorMsg);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Expenses Booking: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }


        public int FunPubCancelExpensesbooking(FASerializationMode SerMode, byte[] bytesobjexpensebookDataTable, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubExpensesBooking objAssetTransaction = new FA_DALayer.FinancialAccounting.ClsPubExpensesBooking(strConnectionName);
            return objAssetTransaction.FunPubCancelExpensesbooking(SerMode, bytesobjexpensebookDataTable);

        }




        #endregion
    }
}