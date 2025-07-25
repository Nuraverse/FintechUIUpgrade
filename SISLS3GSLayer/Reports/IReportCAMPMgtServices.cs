using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using S3GBusEntity;
using S3GBusEntity.Reports;

namespace S3GServiceLayer.Reports
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IReportCAMPMgtServices" in both code and config file together.
   [ServiceContract]
    public interface IReportCAMPMgtServices
    {
       [OperationContract]
       [FaultContract(typeof(ClsPubFaultException))]
       byte[] FunPubFillAutoList(string strProcName, Dictionary<string, string> dctProcParams);

       [OperationContract]
       [FaultContract(typeof(ClsPubFaultException))]
       byte[] FunPubFillDataset(string strProcName, Dictionary<string, string> dctProcParams);

       [OperationContract]
       [FaultContract(typeof(ClsPubFaultException))]
       byte[] FunPubFillGridPagingReports(string strProcName, Dictionary<string, string> dctProcParams, out int intTotalRecords, PagingValues ObjPaging);
    }
}
