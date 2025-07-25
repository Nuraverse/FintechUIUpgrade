using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace S3GBusEntity.Reports
{
    [Serializable]  
    [DataContract]
    public class ClsPubAsset
    {
        [DataMember]
        public string LobName { get; set; }

        [DataMember]
        public string PrimeAccountNo { get; set; }

        [DataMember]
        public string SubAccountNo { get; set; }

        [DataMember]
        public string AssetDesc { get; set; }

        [DataMember]
        public string RegNo { get; set; }

        [DataMember]
        public decimal AmountFinanced { get; set; }

        [DataMember]
        public string Terms { get; set; }

        [DataMember]
        public decimal YetToBeBilled { get; set; }

        [DataMember]
        public decimal Billed { get; set; }

        [DataMember]
        public decimal TotalReceivable { get; set; }

        [DataMember]
        public decimal Balance { get; set; }


        [DataMember]
        public string GPSSuffix { get; set; }

        [DataMember]
        public string Denomination { get; set; }

        /* Added by Sangeetha R on 12-Aug-2016 for Oracle Conversion from SQL Product start */
        /* To display the below columns in SOA and CAG report in Account Asset details grid */
        [DataMember]
        public string AccountDate { get; set; }

        [DataMember]
        public string MaturityDate { get; set; }

        [DataMember]
        public decimal Unbilled_Principal { get; set; }

        [DataMember]
        public decimal Unbilled_Interest { get; set; }

        [DataMember]
        public string AccountStatus { get; set; }
        /* Added by Sangeetha R on 12-Aug-2016 for Oracle Conversion from SQL Product end */
    }
}
