using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using FA_BusEntity;
using System.ServiceModel.Activation;
using FA_DALayer;

namespace SIS_FA_SLayer.SysAdmin
{
    // To Implement Service Compatablity
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: If you change the class name "ScheduledJobMgtServices" here, you must also update the reference to "ScheduledJobMgtServices" in Web.config.
    public class ScheduledJobMgtServices : IScheduledJobMgtServices
    {
        #region Scheduled Jobs

        public int FunPubCreateScheduledJobs(FASerializationMode SerMode, byte[] bytesObjScheduledJobsDatatable, string strConnectionName, out string strScheduleJobID)
        {

            try
            {
                FA_DALayer.SysAdmin.ScheduledJobs.ClsPubScheduledJobs objScheduledJobs = new FA_DALayer.SysAdmin.ScheduledJobs.ClsPubScheduledJobs(strConnectionName);
                return objScheduledJobs.FunPubCreateScheduledJobs(SerMode, bytesObjScheduledJobsDatatable, out strScheduleJobID,strConnectionName);

            }
            catch (Exception ex)
            {
                ClsPubFaultException objfaultex = new ClsPubFaultException();
                objfaultex.ProReasonRW = ex.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objfaultex, new FaultReason(objfaultex.ProReasonRW));
            }
        }


        #endregion
    }
}
