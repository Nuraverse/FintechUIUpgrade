using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;

namespace S3GServiceLayer.ScheduledJobs
{
    // NOTE: If you change the interface name "IScheduledJobMgtServices" here, you must also update the reference to "IScheduledJobMgtServices" in Web.config.
    [ServiceContract]
    public interface IScheduledJobMgtServices
    {
        [OperationContract]
        int FunPubCreateScheduledJobs(SerializationMode SerMode, byte[] bytesObjScheduledJobsDatatable, out string strScheduleJobID);

        [OperationContract]
        int FunPubUpdateScheduleJobStatus(int intSchedule_Job_StatusID, int intReRun_StatusID, out int intErrorCode);

    }
}
