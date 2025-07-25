#region namespaces
using System;
using FA_DALayer.SysAdmin;
using System.Web;
using System.Globalization;
using FA_BusEntity;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Resources;
using System.Reflection;
using System.Configuration;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Xml;
using System.Xml.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using System.Diagnostics;
using Microsoft.Practices.EnterpriseLibrary.Logging.TraceListeners;
using Microsoft.Practices.EnterpriseLibrary.Logging.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;
using System.ServiceModel;
#endregion
namespace FA_DALayer
{
    namespace FA_SysAdmin
    {
        public class ClsPubFAAdminErrLog
        {
            Database db;

            public ClsPubFAAdminErrLog(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            }

        }
        public sealed class ClsPubCommErrorLogDal
        {
            public static bool CustomErrorRoutine(Exception objException, string strConnectionName)
            {

                bool bReturn = true;

                // write the error log to that text file
                if (objException != null)
                {
                    if (true != WriteErrorLog(objException, strConnectionName))
                    {
                        bReturn = false;
                    }
                }
                return bReturn;
            }

            public static bool CustomErrorRoutine(Exception objException, string strPageName, string strConnectionName)
            {

                bool bReturn = true;

                // write the error log to that text file
                if (objException != null)
                {
                    if (true != WriteErrorLog(objException, strPageName, strConnectionName))
                    {
                        bReturn = false;
                    }
                }
                return bReturn;
            }

            public static bool CustomErrorRoutine(Exception objException, string strPageName, string strProjectName , string strConnectionName)
            {

                bool bReturn = true;
                // write the error log to that text file
                if (objException != null)
                {
                    if (true != WriteErrorLog(objException, strPageName, strProjectName, strConnectionName))
                    {
                        bReturn = false;
                    }
                }
                return bReturn;
            }
            private static bool WriteErrorLog(Exception objException, string strPageName, string strConnectionName)
            {
                bool bReturn = false;
                FA_DALayer.SysAdmin.ClsPubFAAdmin ObjErrorLog = new ClsPubFAAdmin(strConnectionName);
                Dictionary<string, string> dictParams = new Dictionary<string, string>();
                StackTrace st = new StackTrace(objException, true);
                StackFrame[] frames = st.GetFrames();
                int intFrameCount = st.FrameCount;
                LogEntry logEntry = new LogEntry();
                dictParams.Add("@USER_ID", string.Empty);
                dictParams.Add("@ERROR_MESSAGE", objException.Message);
                dictParams.Add("@CATEGORY_NAME", string.Empty);
                dictParams.Add("@PRIORITY", string.Empty);
                dictParams.Add("@EVENT_ID", string.Empty);
                dictParams.Add("@SEVERITY", string.Empty);
                dictParams.Add("@TITLE", string.Empty);
                dictParams.Add("@MACHINE", logEntry.MachineName);
                dictParams.Add("@APP_DOMAIN", logEntry.AppDomainName);
                dictParams.Add("@PROCESS_ID", logEntry.ProcessId);
                dictParams.Add("@PROCESS_NAME", logEntry.ProcessName);
                dictParams.Add("@THREAD_NAME", logEntry.Win32ThreadId);
                dictParams.Add("@WIN32_THREADID", string.Empty);
                dictParams.Add("@EXTENDED_PROPERTIES", string.Empty);

                string strLastIncomeDate;
                strLastIncomeDate = ObjErrorLog.FunPubSysErrorLog("S3G_INS_ERROR_LOG", dictParams, strConnectionName);
                bReturn = true;
                return bReturn;
            }

            private static bool WriteErrorLog(Exception objException, string strPageName, string strProjectName, string strConnectionName)
            {
                bool bReturn = false;
                FA_DALayer.SysAdmin.ClsPubFAAdmin ObjErrorLog = new ClsPubFAAdmin(strConnectionName);
                Dictionary<string, string> dictParams = new Dictionary<string, string>();
                StackTrace st = new StackTrace(objException, true);
                StackFrame[] frames = st.GetFrames();
                int intFrameCount = st.FrameCount;
                LogEntry logEntry = new LogEntry();
                dictParams.Add("@USER_ID", string.Empty);
                dictParams.Add("@ERROR_MESSAGE", objException.Message);
                dictParams.Add("@CATEGORY_NAME", string.Empty);
                dictParams.Add("@PRIORITY", string.Empty);
                dictParams.Add("@EVENT_ID", string.Empty);
                dictParams.Add("@SEVERITY", string.Empty);
                dictParams.Add("@TITLE", string.Empty);
                dictParams.Add("@MACHINE", logEntry.MachineName);
                dictParams.Add("@APP_DOMAIN", logEntry.AppDomainName);
                dictParams.Add("@PROCESS_ID", logEntry.ProcessId);
                dictParams.Add("@PROCESS_NAME", logEntry.ProcessName);
                dictParams.Add("@THREAD_NAME", logEntry.Win32ThreadId);
                dictParams.Add("@WIN32_THREADID", string.Empty);
                dictParams.Add("@EXTENDED_PROPERTIES", string.Empty);

                string strLastIncomeDate;
                strLastIncomeDate = ObjErrorLog.FunPubSysErrorLog("S3G_INS_ERROR_LOG", dictParams, strConnectionName);
                bReturn = true;
                return bReturn;
            }

            private static bool WriteErrorLog(Exception objException, string strConnectionName)
            {
                bool bReturn = false;
                FA_DALayer.SysAdmin.ClsPubFAAdmin ObjErrorLog = new ClsPubFAAdmin(strConnectionName);
                Dictionary<string, string> dictParams = new Dictionary<string, string>();
                StackTrace st = new StackTrace(objException, true);
                StackFrame[] frames = st.GetFrames();
                int intFrameCount = st.FrameCount;
                LogEntry logEntry = new LogEntry();

                dictParams.Add("@USER_ID", string.Empty);
                dictParams.Add("@ERROR_MESSAGE", objException.Message);
                dictParams.Add("@CATEGORY_NAME", string.Empty);
                dictParams.Add("@PRIORITY", string.Empty);
                dictParams.Add("@EVENT_ID", string.Empty);
                dictParams.Add("@SEVERITY", string.Empty);
                dictParams.Add("@TITLE", string.Empty);
                dictParams.Add("@MACHINE", logEntry.MachineName);
                dictParams.Add("@APP_DOMAIN", logEntry.AppDomainName);
                dictParams.Add("@PROCESS_ID", logEntry.ProcessId);
                dictParams.Add("@PROCESS_NAME", logEntry.ProcessName);
                dictParams.Add("@THREAD_NAME", logEntry.Win32ThreadId);
                dictParams.Add("@WIN32_THREADID", string.Empty);
                dictParams.Add("@EXTENDED_PROPERTIES", string.Empty);

                string strLastIncomeDate;
                strLastIncomeDate = ObjErrorLog.FunPubSysErrorLog("S3G_INS_ERROR_LOG", dictParams, strConnectionName);
                bReturn = true;
                return bReturn;
            }
        }
    }

}