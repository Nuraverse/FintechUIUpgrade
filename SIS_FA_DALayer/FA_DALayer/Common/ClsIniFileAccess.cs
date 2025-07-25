using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Data.Common;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary;
using Microsoft.Practices.ObjectBuilder2;
using Microsoft.Practices.Unity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Xml;
using FA_BusEntity;
using System.Configuration;

namespace FA_DALayer.Common
{
    public class ClsIniFileAccess
    {
        public static string FunPubReadConfig(string KeyName)
        {
            string key = String.Empty;
            key = ConfigurationSettings.AppSettings.Get(KeyName);
            return key;
        }
        public static void FunPubGetConnectionString()
        {
            System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();

            string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));

            if (File.Exists(strFileName))
            {
                _xmlDoc = new XmlDocument();
                _xmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
            }
            else
            {
                throw new FileNotFoundException("Configuration file not found");
            }
        }

        private static XmlDocument _xmlDoc;
        public static XmlDocument xmlDoc
        {
            get
            {
                FunPubGetConnectionString();
                return _xmlDoc;
            }
        }

        private static FADALDBType enumDBType;
        public static FADALDBType FA_DBType
        {
            get
            {
                return enumDBType;
            }
            set
            {
                enumDBType = value;
            }
        }

        public static Database FunPubGetDatabase()
        {
            try
            {
                //FA_DBType = FADALDBType.SQL;
                //XmlDocument conxmlDoc = xmlDoc;
                //string ConnectionString = conxmlDoc.ChildNodes[0].SelectSingleNode("connectionStrings").ChildNodes[0].Attributes["connectionString"].Value;
                //string strDataProvider = conxmlDoc.ChildNodes[0].SelectSingleNode("connectionStrings").ChildNodes[0].Attributes["providerName"].Value;
                //string strConType = conxmlDoc.ChildNodes[0].SelectSingleNode("connectionStrings").ChildNodes[0].Attributes["connnectionType"].Value;
                //if (strConType.Trim().ToUpper() == "ORACLE")
                //{
                //    FA_DBType = FADALDBType.ORACLE;
                //}

                FA_DBType = FADALDBType.ORACLE;
                string ConnectionString = FunPubReadConfig("FAconnectionString");
                string strDataProvider = "System.Data.OracleClient";
                return new GenericDatabase(ConnectionString, DbProviderFactories.GetFactory(strDataProvider));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Database FunPubGetDatabase(string strConnection)
        {
            try
            {
                ////FunPubSetDatabase(strConnection, strDataProvider, User_Name, Password);
                //FA_DBType = FADALDBType.SQL;
                //XmlDocument conxmlDoc = xmlDoc;
                //string decryptstring = conxmlDoc.ChildNodes[0].SelectSingleNode(strConnection).ChildNodes[0].Attributes["connectionString"].Value;
                //string ConnectionString = FAClsPubCommCrypto.DecryptText(decryptstring);
                ////string ConnectionString = conxmlDoc.ChildNodes[0].SelectSingleNode(strConnection).ChildNodes[0].Attributes["connectionString"].Value;
                ////string decryptstring = conxmlDoc.ChildNodes[0].SelectSingleNode("connectionStrings").ChildNodes[0].Attributes["connectionString"].Value;
                ////string ConnectionString = FAClsPubCommCrypto.DecryptText(decryptstring);
                //string strDataProvider = conxmlDoc.ChildNodes[0].SelectSingleNode(strConnection).ChildNodes[0].Attributes["providerName"].Value;
                //string strConType = conxmlDoc.ChildNodes[0].SelectSingleNode(strConnection).ChildNodes[0].Attributes["connnectionType"].Value;
                //if (strConType.Trim().ToUpper() == "ORACLE")
                //{
                //    FA_DBType = FADALDBType.ORACLE;
                //}

                FA_DBType = FADALDBType.ORACLE;
                string ConnectionString = FunPubReadConfig("FAconnectionString");
                string strDataProvider = "System.Data.OracleClient";
                return new GenericDatabase(ConnectionString, DbProviderFactories.GetFactory(strDataProvider));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void FunPubSetDatabase(string strConnectionString, string strDataProvider, string User_Name, string Password)
        {
            try
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                FA_DBType = FADALDBType.SQL;
                XmlDocument conxmlDoc = xmlDoc;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region Getting FinYear Start Month from Config.ini

        public static string FunPubFinYearStartMonth()
        {
            try
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));
                string startMonth = "";
                if (File.Exists(strFileName))
                {
                    XmlDocument conxmlDoc = new XmlDocument();
                    conxmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
                    startMonth = conxmlDoc.ChildNodes[0].SelectSingleNode("FinancialStartMonth").ChildNodes[0].Attributes[1].Value;
                }
                return startMonth;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        public static string FunPriGetConfigConnectionString(string strConnection)
        {
            string ConnectionString;
            try
            {

                FA_DBType = FADALDBType.SQL;
                XmlDocument conxmlDoc = xmlDoc;
                string decryptstring = conxmlDoc.ChildNodes[0].SelectSingleNode(strConnection).ChildNodes[0].Attributes["connectionString"].Value;
               ConnectionString = FAClsPubCommCrypto.DecryptText(decryptstring);
                    //ConnectionString = conxmlDoc.ChildNodes[0].SelectSingleNode("connectionStrings").ChildNodes[0].Attributes["connectionString"].Value;
               
            }
            catch (Exception objException)
            {
                throw objException;
            }
            return ConnectionString;
        }



    }
}
