using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using FA_BusEntity;
using FA_DALayer.SysAdmin;

namespace SIS_FA_SLayer.SysAdmin
{
    // NOTE: If you change the interface name "IScheduledJobMgtServices" here, you must also update the reference to "IScheduledJobMgtServices" in Web.config.
    [ServiceContract]
    public interface IScheduledJobMgtServices
    {
        [OperationContract]
        int FunPubCreateScheduledJobs(FASerializationMode SerMode, byte[] bytesObjScheduledJobsDatatable, string strConnectionName, out string strScheduleJobID);
    }
}
