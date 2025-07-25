using FA_BusEntity;
using SIS_FA_SLayer.SysAdmin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;

namespace SIS_FA_SLayer.Budget
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "BudgetMaster" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select BudgetMaster.svc or BudgetMaster.svc.cs at the Solution Explorer and start debugging.
    public class BudgetMaster : IBudgetMaster
    {
        
        public int FunPubCreateLineItem(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY,string strConnectionName)
        {
            try
            {
                FA_DALayer.Budget.ClsPubBudgetItemMaster ObjBudgetItemMaster = new FA_DALayer.Budget.ClsPubBudgetItemMaster(strConnectionName);
                return ObjBudgetItemMaster.FunPubCreateLineItem(SerMode, bytesObjBudgetMasterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Budget Line Item Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        public int FunPubCreateSubLineItem(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName)
        {
            try
            {
                FA_DALayer.Budget.ClsPubBudgetItemMaster ObjBudgetItemMaster = new FA_DALayer.Budget.ClsPubBudgetItemMaster(strConnectionName);
                return ObjBudgetItemMaster.FunPubCreateSubLineItem(SerMode, bytesObjBudgetMasterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Budget Line Item Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        public int FunPubCreateBudget(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName)
        {
            try
            {
                FA_DALayer.Budget.ClsPubBudgetMaster ObjBudgetMaster = new FA_DALayer.Budget.ClsPubBudgetMaster(strConnectionName);
                return ObjBudgetMaster.FunPubCreateBudget(SerMode, bytesObjBudgetMasterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Budget Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubBudgetUpload(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName,out Int32 intUploadID)
        {
            try
            {
                FA_DALayer.Budget.ClsPubBudgetFileUpload ObjBudgetFileUpload = new FA_DALayer.Budget.ClsPubBudgetFileUpload(strConnectionName);
                return ObjBudgetFileUpload.FunPubFileUpload(SerMode, bytesObjBudgetMasterDataTable_SERLAY, out intUploadID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Budget Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubBudgetUploadDetails(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName, out Int32 intUploadID)
        {
            try
            {
                FA_DALayer.Budget.ClsPubBudgetFileUpload ObjBudgetFileUpload = new FA_DALayer.Budget.ClsPubBudgetFileUpload(strConnectionName);
                return ObjBudgetFileUpload.FunPubCreateBudgetFileUploadDetails(SerMode, bytesObjBudgetMasterDataTable_SERLAY, out intUploadID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Budget Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        public int FunPubCreateFormulaMaster(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName)
        {
            try
            {
                FA_DALayer.Budget.ClsPubBudgetItemMaster ObjBudgetMaster = new FA_DALayer.Budget.ClsPubBudgetItemMaster(strConnectionName);
                return ObjBudgetMaster.FunPubCreateFormulaMaster(SerMode, bytesObjBudgetMasterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Formula Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

       
    }
}
