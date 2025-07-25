using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace S3GBusEntity.Reports
{
    [Serializable]
    [DataContract]
    public class ClsPubCollectionHeader
    {
        [DataMember]
        public int LOBID { get; set; }
        [DataMember]
        public int AccountLevel { get; set; }
        [DataMember]
        public DateTime FromMonth { get; set; }
        [DataMember]
        public DateTime ToMonth { get; set; }
        [DataMember]
        public decimal Denomination { get; set; }
        [DataMember]
        public int CompanyId { get; set; }
        [DataMember]
        public string LineOfBusiness { get; set; }
        [DataMember]
        public string Location1 { get; set; }
        [DataMember]
        public string Location2 { get; set; }
        [DataMember]
        public string IsDetailed { get; set; }
        [DataMember]
        public int ProgramId { get; set; }
        [DataMember]
        public int UserId { get; set; }
        [DataMember]
        public int LocationId1 { get; set; }
        [DataMember]
        public int LocationId2 { get; set; }
        [DataMember]
        public string DebtCollector { get; set; }
        [DataMember]
        public int ChequeReturn { get; set; }
        [DataMember]
        public string DraweeBank { get; set; }

        [DataMember]
        public int ReceiptMode { get; set; }
        [DataMember]
        public int SMECustomer { get; set; }
        [DataMember]
        public int ComplianceId { get; set; }
        [DataMember]
        public int NTDType { get; set; }
        [DataMember]
        public decimal CashRangeFrom { get; set; }
        [DataMember]
        public decimal CashRangeTo { get; set; }
        [DataMember]
        public int LegalType { get; set; }
        [DataMember]
        public int IsOverdue { get; set; }
        

    }

}
