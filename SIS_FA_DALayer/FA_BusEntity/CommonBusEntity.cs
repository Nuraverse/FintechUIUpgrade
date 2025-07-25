using System;
using System.Text;
using System.IO;
using System.Net;
using System.Configuration;
using System.Security.Cryptography;
using System.Collections;
using System.Xml;
using System.Xml.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using System.ServiceModel;
using System.Diagnostics;
using Microsoft.Practices.EnterpriseLibrary.Logging.TraceListeners;
using Microsoft.Practices.EnterpriseLibrary.Logging.Configuration;
using Microsoft.Practices.EnterpriseLibrary.Common.Configuration;

namespace FA_BusEntity
{
   
        [ConfigurationElementType(typeof(CustomTraceListenerData))]
        public class AlwaysClosedTextFileTraceListener : CustomTraceListener
        {
            private string WeblogFilePath;
            private XmlDocument _xmlDoc;
            public string strProjectName
            {
                get { return _strProjectName; }
                set { _strProjectName = value; }
            }
            private string _strProjectName = "";

            public AlwaysClosedTextFileTraceListener()
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));// @"D:\S3G\SISLS3GPLayer\SISLS3GPLayer\Config.ini";// 
                if (File.Exists(strFileName))
                {
                    _xmlDoc = new XmlDocument();
                    _xmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
                }
                else
                {
                    throw new FileNotFoundException("Configuration file not found");
                }

                WeblogFilePath = _xmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[0].Attributes["FilePath"].Value;// @"C:\S3Glog.txt";
                if (_strProjectName.ToUpper() == "SERVICE")
                    WeblogFilePath = _xmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[1].Attributes["FilePath"].Value;// @"C:\S3Glog.txt";
                else if (_strProjectName.ToUpper() == "WINSERVICE")
                    WeblogFilePath = _xmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[2].Attributes["FilePath"].Value;// @"C:\S3Glog.txt";
            }

            public override void Write(string message)
            {
                using (StreamWriter logFile = File.AppendText(WeblogFilePath))
                {
                    logFile.Write(message);
                    logFile.Flush();
                    logFile.Close();
                }
            }

            public override void WriteLine(string message)
            {
                using (StreamWriter logFile = File.AppendText(WeblogFilePath))
                {
                    //logFile.WriteLine("************************************");                
                    logFile.WriteLine(message);
                    logFile.Flush();
                }
            }

            public override void TraceData(TraceEventCache eventCache, string source, TraceEventType eventType, int id, object data)
            {
                if (data is LogEntry && this.Formatter != null)
                {
                    WriteLine(this.Formatter.Format(data as LogEntry));
                }
                else
                {
                    WriteLine(data.ToString());
                }
            }
        }



        public enum FADALFlag
        {
            Insert = 1,
            Update = 2,
            Delete = 3,
            Query = 4
        }

        public enum FASerializationMode
        {
            Binary,
            Xml,
            Soap,
        }

        public sealed class FAClsPubCommCrypto
        {
            // Encrypt the text
            public static string EncryptText(string strText)
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                string strEncryptKey = (string)AppReader.GetValue("EncryptKey", typeof(string));
                return Encrypt(strText, strEncryptKey);
            }

            //Decrypt the text 
            public static string DecryptText(string strText)
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                string strEncryptKey = (string)AppReader.GetValue("EncryptKey", typeof(string));
                return Decrypt(strText, strEncryptKey);
            }

            //The function used to encrypt the text - 128 Bit Key
            private static string Encrypt(string strText, string strEncrKey)
            {
                byte[] byKey;
                byte[] IV = { 65, 6, 12, 34, 28, 232, 34, 158, 185, 192, 51, 74, 236, 28, 55, 9 };

                try
                {
                    byKey = System.Text.Encoding.UTF8.GetBytes(strEncrKey.Trim());
                    TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
                    byte[] inputByteArray = Encoding.Unicode.GetBytes(strText);
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    return Convert.ToBase64String(ms.ToArray());
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }

            //The function used to decrypt the text - 128 Bit Key
            private static string Decrypt(string strText, string sDecrKey)
            {
                byte[] byKey;
                byte[] IV = { 65, 6, 12, 34, 28, 232, 34, 158, 185, 192, 51, 74, 236, 28, 55, 9 };
                byte[] inputByteArray = new byte[strText.Length];
                try
                {
                    byKey = System.Text.Encoding.UTF8.GetBytes(sDecrKey.Trim());
                    TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
                    inputByteArray = Convert.FromBase64String(strText);
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    System.Text.Encoding encoding = System.Text.Encoding.Unicode;

                    return encoding.GetString(ms.ToArray());
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
        }

        public sealed class FAClsPubCommErrorLog
        {
            public static string strLogFilePath = string.Empty;
            private static StreamWriter sw = null;

            ///<summary>
            /// If the LogFile path is empty then, it will write the log entry to 
            /// LogFile.txt under application directory.
            /// If the LogFile.txt is not availble it will create it
            /// If the Log File path is not empty but the file is 
            /// not availble it will create it.
            /// <param name="objException"></param>
            /// <RETURNS>false if the problem persists</RETURNS>
            ///</summary>

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
                bool bReturn = false;

                LogEntry logEntry = new LogEntry();
                //logEntry.EventId = 100;
                //logEntry.Priority = 2;
                if (objException.Source != null)
                {
                    logEntry.Title = objException.Source;
                }
                else
                {
                    logEntry.Title = "S3G";
                }
                logEntry.Message = objException.Message;
                if (objException.TargetSite != null)
                {
                    if (objException.TargetSite.Name != null)
                    {
                        logEntry.ExtendedProperties.Add("Method", objException.TargetSite.Name.ToString());

                    }
                }
                logEntry.ExtendedProperties.Add("Page Name", strPageName);

                logEntry.Categories.Add("General");

                //Logger.Write(logEntry);

                AlwaysClosedTextFileTraceListener obj = new AlwaysClosedTextFileTraceListener();
                obj.WriteLine(logEntry.ToString());

                bReturn = true;

                return bReturn;
            }

            private static bool WriteErrorLog(Exception objException, string strPageName, string strProjectName)
            {
                bool bReturn = false;

                LogEntry logEntry = new LogEntry();
                //logEntry.EventId = 100;
                //logEntry.Priority = 2;
                if (objException.Source != null)
                {
                    logEntry.Title = objException.Source;
                }
                else
                {
                    logEntry.Title = "S3G";
                }
                logEntry.Message = objException.Message;
                if (objException.TargetSite != null)
                {
                    if (objException.TargetSite.Name != null)
                    {
                        logEntry.ExtendedProperties.Add("Method", objException.TargetSite.Name.ToString());

                    }
                }
                logEntry.ExtendedProperties.Add("Page Name", strPageName);

                logEntry.Categories.Add("General");

                //Logger.Write(logEntry);

                AlwaysClosedTextFileTraceListener obj = new AlwaysClosedTextFileTraceListener();
                obj.strProjectName = strProjectName;
                obj.WriteLine(logEntry.ToString());

                bReturn = true;

                return bReturn;
            }

            private static bool WriteErrorLog(Exception objException)
            {
                bool bReturn = false;

                LogEntry logEntry = new LogEntry();
                //logEntry.EventId = 100;
                //logEntry.Priority = 2;
                if (objException.Source != null)
                {
                    logEntry.Title = objException.Source;
                }
                else
                {
                    logEntry.Title = "S3G";
                }
                logEntry.Message = objException.Message;

                if (objException.TargetSite.Name != null)
                {
                    logEntry.ExtendedProperties.Add("Method", objException.TargetSite.Name.ToString());

                }
                logEntry.Categories.Add("General");
                //Logger.Write(logEntry);

                AlwaysClosedTextFileTraceListener obj = new AlwaysClosedTextFileTraceListener();
                obj.WriteLine(logEntry.ToString());

                bReturn = true;
                return bReturn;
            }
           public static string LoginName { get; set; }
        }

        public sealed class FAS3GLogger
        {

            ///<summary>
            /// If the LogFile path is empty then, it will write the log entry to 
            /// LogFile.txt under application directory.
            /// If the LogFile.txt is not availble it will create it
            /// If the Log File path is not empty but the file is 
            /// not availble it will create it.
            /// <param name="objException"></param>
            /// <RETURNS>false if the problem persists</RETURNS>
            ///</summary>

            public static void LogMessage(string Message, string strPageName)
            {

                // write the error log to that text file
                if (Message != null)
                {
                    WriteLogMessage(Message, strPageName);

                }
            }

            private static void WriteLogMessage(string Message, string strPageName)
            {
                LogEntry logEntry = new LogEntry();
                logEntry.EventId = 100;
                logEntry.Priority = 2;
                logEntry.Title = "S3G";
                // Create a StackTrace that captures
                // filename, line number, and column
                // information for the current thread.
                //StackTrace st = new StackTrace(true);
                //for (int i = 0; i < st.FrameCount; i++)
                //{
                //    // Note that high up the call stack, there is only
                //    // one stack frame.
                //    StackFrame sf = st.GetFrame(i);

                //    Message = Message + string.Format("\r\n High up the call stack, Method: {0}",
                //        sf.GetMethod());

                //    Message = Message + string.Format("\r\n High up the call stack, File: {0}",
                //       sf.GetFileName());

                //    Message = Message + string.Format("\r\n High up the call stack, Line Number: {0}",
                //        sf.GetFileLineNumber());
                //}
                logEntry.Message = Message;
                logEntry.ExtendedProperties.Add("Page Name", strPageName);
                logEntry.Categories.Add("General");
                Logger.Write(logEntry);

            }

            private static bool WriteErrorLog(Exception objException)
            {
                bool bReturn = false;

                LogEntry logEntry = new LogEntry();
                logEntry.EventId = 100;
                logEntry.Priority = 2;
                if (objException.Source != null)
                {
                    logEntry.Title = objException.Source;
                }
                else
                {
                    logEntry.Title = "S3G";
                }
                logEntry.Message = objException.Message;

                if (objException.TargetSite.Name != null)
                {
                    logEntry.ExtendedProperties.Add("Method", objException.TargetSite.Name.ToString());

                }
                logEntry.ExtendedProperties.Add("fileLocation", objException.TargetSite.Name.ToString());

                logEntry.Categories.Add("General");
                Logger.Write(logEntry);
                bReturn = true;
                return bReturn;
            }
        }

        public class FAClsPubCommMail
        {
            #region properties

            public string ProFromRW
            {
                get;
                set;
            }
            public string ProTORW
            {
                get;
                set;
            }
            public string ProCCRW
            {
                get;
                set;
            }
            public string ProBCCRW
            {
                get;
                set;
            }
            public string ProSubjectRW
            {
                get;
                set;
            }
            public string ProMessageRW
            {
                get;
                set;
            }
            public ArrayList ProFileAttachementRW
            {
                get;
                set;
            }
            #endregion
        }

        public static class FAClsPubConfigReader
        {

            /// <summary>
            /// Method to get Connection string from Config file by default 
            /// has a over load method which gets the required key's value
            /// from config file
            /// </summary>
            /// <returns>Connection String</returns>
            public static string FunPubReadConfig()
            {
                string key = String.Empty;
                key = ConfigurationSettings.AppSettings.Get("connectionString");
                return key;
            }

            /// <summary>
            /// Method to Read from Config file has a over load method which 
            /// by default get Connection string from config file
            /// </summary>
            /// <param name="KeyName"> Key name to search in config file</param>
            /// <returns>Key Value for GIven Key</returns>
            public static string FunPubReadConfig(string KeyName)
            {
                string key = String.Empty;
                key = ConfigurationSettings.AppSettings.Get(KeyName);
                return key;
            }

        }

        public static class FAClsPubSerialize
        {

            public static byte[] Serialize(object ObjSerialize, FASerializationMode SerMode)
            {
                using (MemoryStream msStream = new MemoryStream())
                {
                    if (SerMode == FASerializationMode.Xml)
                    {
                        XmlSerializer xmSerializer = new XmlSerializer(ObjSerialize.GetType());
                        xmSerializer.Serialize(msStream, ObjSerialize);

                    }
                    if (SerMode == FASerializationMode.Binary)
                    {
                        BinaryFormatter binaryformatter = new BinaryFormatter();
                        binaryformatter.Serialize(msStream, ObjSerialize);
                    }
                    byte[] ObjSerialize_bytes = msStream.ToArray();
                    msStream.Flush();
                    return ObjSerialize_bytes;
                }
            }
            public static object ObjDE;
            public static object DeSerialize(byte[] ObjSerialize_bytes, FASerializationMode SerMode, Type type)
            {
                var ObjDeSerialize = ObjDE;
                try
                {

                    // ObjDeSerialize = null;
                    if (SerMode == FASerializationMode.Binary)
                    {
                        using (MemoryStream msStream = new MemoryStream((ObjSerialize_bytes)))
                        {
                            //fileStreamObject = new FileStream(filename, FileMode.Open);
                            BinaryFormatter binaryFormatter = new BinaryFormatter();
                            ObjDeSerialize = binaryFormatter.Deserialize(msStream);
                        }
                    }
                    if (SerMode == FASerializationMode.Xml)
                    {
                        using (MemoryStream msStream = new MemoryStream((ObjSerialize_bytes)))
                        {
                            //fileStreamObject = new FileStream(filename, FileMode.Open);
                            XmlSerializer xmlSerializer = new XmlSerializer(type);
                            ObjDeSerialize = xmlSerializer.Deserialize(msStream);
                        }
                    }
                }
                catch (Exception ex)
                {
                    FAClsPubCommErrorLog.CustomErrorRoutine(ex, "CommonBusEntity");
                }
                return ObjDeSerialize;
            }
        }
        [Serializable]
        [DataContractFormat]
        public class FAPagingValues
        {
            public int ProCompany_ID
            {
                get;
                set;
            }
            public int ProUser_ID
            {
                get;
                set;
            }

            public int ProPageSize
            {
                get;
                set;
            }
            public int ProTotalRecords
            {
                get;
                set;
            }
            public int ProCurrentPage
            {
                get;
                set;
            }
            public string ProSearchValue
            {
                get;
                set;
            }
            public string ProOrderBy
            {
                get;
                set;
            }
            public int ProProgram_ID //Added by Tamilselvan.S on 24/09/2011
            {
                get;
                set;
            }
        }

}
