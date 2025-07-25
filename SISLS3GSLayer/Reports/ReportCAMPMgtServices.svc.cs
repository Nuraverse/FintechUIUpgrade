#region Page Header
/// © 2015 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Orignation
/// Screen Name			: Report CAMP Services ( Currency Creation Service Class)
/// Created By			: Anbuvel.T
/// Created Date		: 26-FEB-2015
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
using S3GBusEntity.Reports;
using S3GDALayer.Reports;
using S3GBusEntity;
using System.ServiceModel.Activation;
using System.Data;
#endregion

namespace S3GServiceLayer.Reports
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "ReportCAMPMgtServices" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select ReportCAMPMgtServices.svc or ReportCAMPMgtServices.svc.cs at the Solution Explorer and start debugging.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.Single, ConcurrencyMode = ConcurrencyMode.Multiple, UseSynchronizationContext = false)]
    public class ReportCAMPMgtServices : IReportCAMPMgtServices
    {
        byte[] bytesDataTable;
        #region FunPubFillAutoList
        /// <summary>
        /// To Get List Of Values using Datatable
        /// </summary>
        /// <param name="strProcName">string strProcName</param>
        /// <param name="dctProcParams">dctProcParams</param>
        /// <returns></returns>
        public byte[] FunPubFillAutoList(string strProcName, Dictionary<string, string> dctProcParams)
        {
            try
            {
                S3GDALayer.Reports.CAMPMgtServices.clsPupCAMPReport ObjCAMPflow = new S3GDALayer.Reports.CAMPMgtServices.clsPupCAMPReport();
                DataTable dtDropDown = ObjCAMPflow.FunPubFillAutoList(strProcName, dctProcParams);
                if (dtDropDown != null)
                    bytesDataTable = ClsPubSerialize.Serialize(dtDropDown, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }
        #endregion

        #region FunPubFillAutoList
        /// <summary>
        /// To Get List Of Values using Datatable
        /// </summary>
        /// <param name="strProcName">string strProcName</param>
        /// <param name="dctProcParams">dctProcParams</param>
        /// <returns></returns>
        public byte[] FunPubFillDataset(string strProcName, Dictionary<string, string> dctProcParams)
        {
            try
            {
                S3GDALayer.Reports.CAMPMgtServices.clsPupCAMPReport ObjCAMPflow = new S3GDALayer.Reports.CAMPMgtServices.clsPupCAMPReport();
                DataSet dtDropDown = ObjCAMPflow.FunPubFillDataset(strProcName, dctProcParams);
                if (dtDropDown != null)
                    bytesDataTable = ClsPubSerialize.Serialize(dtDropDown, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }
        #endregion

        public byte[] FunPubFillGridPagingReports(string strProcName, Dictionary<string, string> dctProcParams, out int intTotalRecords, PagingValues ObjPaging)
        {
            try
            {
                S3GDALayer.Reports.CAMPMgtServices.clsPupCAMPReport ObjCAMPflow = new S3GDALayer.Reports.CAMPMgtServices.clsPupCAMPReport();
                DataTable dtGridPaging = ObjCAMPflow.FunPubFillGridPagingReports(strProcName, dctProcParams, out intTotalRecords, ObjPaging);
                bytesDataTable = ClsPubSerialize.Serialize(dtGridPaging, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Filling Grid :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }
    }
}
