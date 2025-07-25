
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Account Management Services 
/// Created By			: M.Saran
/// Created Date		: 18-Feb-2012
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
    // NOTE: If you change the interface name "IAccountMgtService" here, you must also update the reference to "IAccountMgtService" in Web.config.
   
      [ServiceContract]
    public interface IAccountMgtService
    {  
        #region Account Card Interface
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
          int FunPubInsertAccountCard(FASerializationMode SerMode, byte[] bytesobjAccountCardDataTable_DTB, string strConnectionName);
        #endregion

    }
}
