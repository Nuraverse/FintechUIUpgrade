using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using FA_BusEntity;
using FA_DALayer;
using SIS_FA_SLayer.SysAdmin;

namespace SIS_FA_SLayer.FinancialAccounting
{
    // NOTE: If you change the interface name "IFATranMasterMgtServices" here, you must also update the reference to "IFATranMasterMgtServices" in Web.config.
    [ServiceContract]
    public interface IFATranMasterMgtServices
    {
        #region Authorization Rule Card
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesObjAuthorizationRuleCardDataTable_SERLAY, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesObjAuthorizationRuleCardDataTable_SERLAY, string strConnectionName);

        //[OperationContract]
        //[FaultContract(typeof(ClsPubFaultException))]
        //byte[] FunPubQueryTransactionTypeMaster(FASerializationMode SerMode, byte[] bytesObjTransactionTypeMasterDataTable_SERLAY);

        //[OperationContract]
        //[FaultContract(typeof(ClsPubFaultException))]
        //byte[] FunPubQueryConstitutionMaster(FASerializationMode SerMode, byte[] bytesObjConstitutionMasterDataTable_SERLAY);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubQueryAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesObjAuthorizationRuleCardDataTable_SERLAY, string strConnectionName);


        #endregion

        #region Account Card
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertAccountCard(FASerializationMode SerMode, byte[] byteObjFA_AccountCard, string strConnectionName);
        #endregion

        #region cashflow master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateCashflowMaster(FASerializationMode SerMode, byte[] bytesObjCashflowDataTable_SERLAY, out string strCashflowNumber_Out, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyCashflowMaster(FASerializationMode SerMode, byte[] bytesObjCashflowDataTable_SERLAY, string strConnectionName);

        #endregion

        #region Budget
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateBudget(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List, out int int_budget_id,string strConnectionName);
        #endregion

        #region Manual Journal
       
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertManualJournal(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName, out int intMJV_ID, out string strDocNo,out string strErrorMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelMJV(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName);
        
        #endregion 

        #region Prior Period JV
        
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertPriorPeriodJV(FASerializationMode SerMode, byte[] bytesobjFA_PPJV_HDR_DTB, string strConnectionName, out int intPP_JV_ID, out string strDocNo);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelPPJV(FASerializationMode SerMode, byte[] bytesobjFA_PPJV_HDR_DTB, string strConnectionName);
        
        #endregion 

     
       
        #region Debit Credit Note
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertDebitCredit(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, out int intDebit_ID, string strConnectionName, out string strDocNo, out string strErrorMsg);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubDeleteDCNote(int TranHeaderId, string strConnectionName);
        #endregion  

        #region Funder Interest
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertFunderInterest(FASerializationMode SerMode, byte[] bytesobjFundInt_List, out int Fund_int_id, string strConnectionName, out string strDocNo);
        #endregion

        #region Manual Journal

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertMultiLocationJournal(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName, out int intMJV_ID, out string strDocNo);

      

        #endregion 

        #region Consortium Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubConsortiumMaster(FASerializationMode SerMode, byte[] bytesobjFA_Consortium_List, string strConnectionName);
        #endregion
       
        #region Expense Booking
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertExpensesbook(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, string strConnectionName, out int intExpBook_ID, out string strDocNo, out string strErrorMsg);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCancelExpensesbooking(FASerializationMode SerMode, byte[] bytesobjexpensebookDataTable, string strConnectionName);
        
        #endregion



    }
}
