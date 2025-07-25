using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SIS_FA_SLayer.SysAdmin;
using FA_DALayer;
using FA_BusEntity;
using System.ServiceModel.Activation;

namespace SIS_FA_SLayer.FinancialAccounting
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: If you change the class name "CommonMail" here, you must also update the reference to "CommonMail" in Web.config.
    public class CommonMail : ICommonMail
    {
        public void FunSendMail(FAClsPubCommMail ObjCOM_Mail_SERLAY)
        {
            try
            {
                ClsPubMail ObjMail = new ClsPubMail();
                ObjMail.FunSendMail(ObjCOM_Mail_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        //public string[] GetSuggestion(string prefixText, int count)
        //{
        //    try
        //    {
        //        ClsPubMail ObjMail = new ClsPubMail();
        //        string[] strReturn = ObjMail.GetData(prefixText, count);
        //        return strReturn;
        //    }
        //    catch (Exception objExp)
        //    {
        //        ClsPubFaultException objFault = new ClsPubFaultException();
        //        objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
        //        throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
        //    }
        //}

    }
}
