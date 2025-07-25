
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
using System.Data;
using System.ServiceModel.Activation;
#endregion


namespace SIS_FA_SLayer.FinancialAccounting
{
    // NOTE: If you change the class name "AccountMgtService" here, you must also update the reference to "AccountMgtService" in Web.config.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class AccountMgtService : IAccountMgtService
    {
        int intErrorCode;
        byte[] bytesDataTable;
        #region Account Card

        public int FunPubInsertAccountCard(FASerializationMode SerMode, byte[] bytesobjAccountCardDataTable_DTB, string strConnectionName)
        {
            FA_DALayer.FinancialAccounting.ClsPubAccountCard objAccountCard = new FA_DALayer.FinancialAccounting.ClsPubAccountCard(strConnectionName);
            intErrorCode = objAccountCard.FunPubInsertAccountCard(SerMode, bytesobjAccountCardDataTable_DTB);
            return intErrorCode;
        }
        #endregion
    }
}
