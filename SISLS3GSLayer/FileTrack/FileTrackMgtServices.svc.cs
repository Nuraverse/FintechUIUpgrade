//------------------------------------------------------------------------------
// <copyright file="WebDataService.svc.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;
using S3GDALayer;
using System.ServiceModel.Activation;

namespace S3GServiceLayer.FileTrack
{
      // To Implement Service Compatablity
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    public class FileTrackMgtServices : IFileTrackMgtServices
    {
        #region IFileTrackMgtServices Members

        public int FunPubCreateFileGenerateMstInt(SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking ObjFileTrack = new S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking();
                return ObjFileTrack.FunPubCreateFileGenerateMstInt(SerMode, bytesObjFILETR_GEN_MSTDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        public int FunPubCreateFileRequestInt(out string strReqNumber_Out, SerializationMode SerMode, byte[] bytesObjFILETR_REQ_MSTDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking ObjFileTrack = new S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking();
                return ObjFileTrack.FunPubCreateFileRequestInt(out strReqNumber_Out, SerMode, bytesObjFILETR_REQ_MSTDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }


        public int FunPubCreateFileDashBoardInt(SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking ObjFileTrack = new S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking();
                return ObjFileTrack.FunPubCreateFileDashBoardInt(SerMode, bytesObjFILETR_GEN_MSTDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubCreateFileInwardInt(SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking ObjFileTrack = new S3GDALayer.FileTrack.FileTrackMgtServices.clsPupFileTracking();
                return ObjFileTrack.FunPubCreateFileInwardInt(SerMode, bytesObjFILETR_GEN_MSTDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion
    }
}
