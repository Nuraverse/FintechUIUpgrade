﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

/// <summary>
/// Summary description for ClsPubCmnErrorLog_FA
/// </summary>
namespace FA_BusEntity
{   
    public static partial class ClsPubCmnErrorLog_FA
    {               
        public static string GetSysErrorLogValue(string strProcName, Dictionary<string, string> dictProcParam,string strConnectionName)
        {
            FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
            try
            {
                ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
                string ErrorLogValue = ObjAdminService.FunPubSysErrorLog(strProcName, dictProcParam, strConnectionName);
                return ErrorLogValue;
            }
            catch (Exception ex)
            {
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);              
                //  ClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            finally
            {
                ObjAdminService.Close();
            }
        }
    }
    public sealed class FAClsPubCommErrorLogDB
    {        
        public static bool CustomErrorRoutine(Exception objException)
        {

            bool bReturn = true;

            // write the error log to that text file
            if (objException != null)
            {
                if (true != WriteErrorLog(objException))
                {
                    bReturn = false;
                }
            }
            return bReturn;
        }

        public static bool CustomErrorRoutine(Exception objException, string strPageName)
        {

            bool bReturn = true;

            // write the error log to that text file
            if (objException != null)
            {
                if (true != WriteErrorLog(objException, strPageName))
                {
                    bReturn = false;
                }
            }
            return bReturn;
        }

        public static bool CustomErrorRoutine(Exception objException, string strPageName, string strProjectName)
        {

            bool bReturn = true;
            // write the error log to that text file
            if (objException != null)
            {
                if (true != WriteErrorLog(objException, strPageName, strProjectName))
                {
                    bReturn = false;
                }
            }
            return bReturn;
        }
        private static bool WriteErrorLog(Exception objException, string strPageName)
        {
            FASession objSession = new FASession(); 
            bool bReturn = false;
            Dictionary<string, string> dictParams = new Dictionary<string, string>();
            StackTrace st = new StackTrace(objException, true);
            StackFrame[] frames = st.GetFrames();
            int intFrameCount = st.FrameCount;
            LogEntry logEntry = new LogEntry();

            dictParams.Add("@USER_ID", "");
            dictParams.Add("@ERROR_MESSAGE", objException.Message);
            dictParams.Add("@PRIORITY", Convert.ToString(logEntry.Priority));
            dictParams.Add("@EVENT_ID", Convert.ToString(logEntry.EventId));
            dictParams.Add("@TITLE", Convert.ToString(logEntry.Title));
            dictParams.Add("@MACHINE", logEntry.MachineName);
            dictParams.Add("@PROCESS_ID", Convert.ToString(logEntry.ProcessId));
            dictParams.Add("@THREAD_NAME", logEntry.Win32ThreadId);
            dictParams.Add("@WIN32_THREADID", Convert.ToString(logEntry.Win32ThreadId));

            //dictParams.Add("@PROCESS_NAME", logEntry.ProcessName);
            dictParams.Add("@FILE", frames[intFrameCount - 1].GetFileName());
            dictParams.Add("@METHOD", frames[intFrameCount - 1].GetMethod().Name);
            dictParams.Add("@LINE_NUMBER", frames[intFrameCount - 1].GetFileLineNumber().ToString());
            if (intFrameCount > 1)
            {
                dictParams.Add("@SUB_METHOD", frames[intFrameCount - 2].GetMethod().Name);
            }
            
             string strLastIncomeDate;
             strLastIncomeDate = ClsPubCmnErrorLog_FA.GetSysErrorLogValue("S3G_INS_ERROR_LOG", dictParams, objSession.ProConnectionName);
            bReturn = true;
            return bReturn;
        }

        private static bool WriteErrorLog(Exception objException, string strPageName, string strProjectName)
        {
            FASession objSession = new FASession(); 
            bool bReturn = false;
            Dictionary<string, string> dictParams = new Dictionary<string, string>();
            StackTrace st = new StackTrace(objException, true);
            StackFrame[] frames = st.GetFrames();
            int intFrameCount = st.FrameCount;
            LogEntry logEntry = new LogEntry();
            dictParams.Add("@USER_ID", "");
            dictParams.Add("@ERROR_MESSAGE", objException.Message);
            dictParams.Add("@PRIORITY", Convert.ToString(logEntry.Priority));
            dictParams.Add("@EVENT_ID", Convert.ToString(logEntry.EventId));
            dictParams.Add("@TITLE", Convert.ToString(logEntry.Title));
            dictParams.Add("@MACHINE", logEntry.MachineName);
            dictParams.Add("@PROCESS_ID", Convert.ToString(logEntry.ProcessId));
            dictParams.Add("@THREAD_NAME", logEntry.Win32ThreadId);
            dictParams.Add("@WIN32_THREADID", Convert.ToString(logEntry.Win32ThreadId));


            //dictParams.Add("@PROCESS_NAME", logEntry.ProcessName);
            dictParams.Add("@FILE", frames[intFrameCount - 1].GetFileName());
            dictParams.Add("@METHOD", frames[intFrameCount - 1].GetMethod().Name);
            dictParams.Add("@LINE_NUMBER", frames[intFrameCount - 1].GetFileLineNumber().ToString());
            if (intFrameCount > 1)
            {
                dictParams.Add("@SUB_METHOD", frames[intFrameCount - 2].GetMethod().Name);
            }
           

            string strLastIncomeDate;
            strLastIncomeDate = ClsPubCmnErrorLog_FA.GetSysErrorLogValue("S3G_INS_ERROR_LOG", dictParams, objSession.ProConnectionName);
            bReturn = true;
            return bReturn;
        }

        private static bool WriteErrorLog(Exception objException)
        {
            FASession objSession = new FASession(); 
            bool bReturn = false;
            Dictionary<string, string> dictParams = new Dictionary<string, string>();
            StackTrace st = new StackTrace(objException, true);
            StackFrame[] frames = st.GetFrames();
            int intFrameCount = st.FrameCount;
            LogEntry logEntry = new LogEntry();
            dictParams.Add("@USER_ID", "");
            dictParams.Add("@ERROR_MESSAGE", objException.Message);
            dictParams.Add("@PRIORITY", Convert.ToString(logEntry.Priority));
            dictParams.Add("@EVENT_ID", Convert.ToString(logEntry.EventId));
            dictParams.Add("@TITLE", Convert.ToString(logEntry.Title));
            dictParams.Add("@MACHINE", logEntry.MachineName);
            dictParams.Add("@PROCESS_ID", Convert.ToString(logEntry.ProcessId));
            dictParams.Add("@THREAD_NAME", logEntry.Win32ThreadId);
            dictParams.Add("@WIN32_THREADID", Convert.ToString(logEntry.Win32ThreadId));


            //dictParams.Add("@PROCESS_NAME", logEntry.ProcessName);
            dictParams.Add("@FILE", frames[intFrameCount - 1].GetFileName());
            dictParams.Add("@METHOD", frames[intFrameCount - 1].GetMethod().Name);
            dictParams.Add("@LINE_NUMBER", frames[intFrameCount - 1].GetFileLineNumber().ToString());
            if (intFrameCount > 1)
            {
                dictParams.Add("@SUB_METHOD", frames[intFrameCount - 2].GetMethod().Name);
            }
            

            string strLastIncomeDate;
            strLastIncomeDate = ClsPubCmnErrorLog_FA.GetSysErrorLogValue("S3G_INS_ERROR_LOG", dictParams, objSession.ProConnectionName);
            bReturn = true;
            return bReturn;
        }
    }
}
