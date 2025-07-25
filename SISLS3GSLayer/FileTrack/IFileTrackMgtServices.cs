using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;

namespace S3GServiceLayer.FileTrack
{
    [ServiceContract]
    public interface IFileTrackMgtServices
    {
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFileGenerateMstInt(SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFileRequestInt(out string strReqNumber_Out, SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFileDashBoardInt(SerializationMode SerMode, byte[] bytesS3G_FILETR_DASHBOARD_ENTRYDataTable_SERLAY);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateFileInwardInt(SerializationMode SerMode, byte[] bytesS3G_FILETR_DASHBOARD_ENTRYDataTable_SERLAY);
    }
}
