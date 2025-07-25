using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SIS_FA_SLayer.SysAdmin;
using FA_BusEntity;

namespace SIS_FA_SLayer.FinancialAccounting
{
    // NOTE: If you change the interface name "ICommonMail" here, you must also update the reference to "ICommonMail" in Web.config.
    [ServiceContract]

    public interface ICommonMail
    {
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        void FunSendMail(FAClsPubCommMail ObjCOM_Mail_SERLAY);

        //[OperationContract]
        //[FaultContract(typeof(ClsPubFaultException))]
        //string[] GetSuggestion(string prefixText, int count);

    }
}
