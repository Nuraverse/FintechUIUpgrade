using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace S3GBusEntity.Reports
{
    [Serializable]
    [DataContract]
    public class ClsPubPASA
    {
        [DataMember]
        public string PrimeAccountNo { get; set; }

        [DataMember]
        public string SubAccountNo { get; set; }

        /* Added by Sangeetha R on 12-Aug-2016 for Oracle Conversion from SQL Product start */
        /* to display Account Status in SOA */
        [DataMember]
        public string AccountStatus { get; set; }
        /* Added by Sangeetha R on 12-Aug-2016 for Oracle Conversion from SQL Product end */
        public string PA_SA_REF_ID { get; set; }
         /* Added by Deepika K on 30-Jan-2019 for Oracle Conversion from SQL Product end */
    }
}
