using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace SISLS3GCommonWS
{
    static class SISLS3GCommonWSStart
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            ServiceBase[] ServicesToRun;
            ServicesToRun = new ServiceBase[] 
			{ 
				new MFC_S3G_Service()
			};
            ServiceBase.Run(ServicesToRun);
        }
    }
}
