using FA_BusEntity;
using SIS_FA_SLayer.SysAdmin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace SIS_FA_SLayer.Budget
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IBudgetMaster" in both code and config file together.
    [ServiceContract]
    public interface IBudgetMaster
    {
        #region Budget line item Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateLineItem(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName);
        #endregion

        #region Budget sub line item Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateSubLineItem(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName);
        #endregion

        #region Budget Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateBudget(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List, string strConnectionName);
        #endregion

        #region Budget  File Upload
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubBudgetUpload(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List, string strConnectionName,out Int32 intUploadID);
        #endregion

        #region Budget  File Upload Details
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubBudgetUploadDetails(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List, string strConnectionName, out Int32 intUploadID);
        #endregion


        #region Budget Formula Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFormulaMaster(FASerializationMode SerMode, byte[] bytesObjBudgetMasterDataTable_SERLAY, string strConnectionName);
        #endregion
    }
}
