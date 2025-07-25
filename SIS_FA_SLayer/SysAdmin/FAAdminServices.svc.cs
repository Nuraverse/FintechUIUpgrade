#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: FA Admin
/// Screen Name			: FA Admin  Services 
/// Created By			: Saran
/// Created Date		: 16-Jan-2012
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
using FA_BusEntity;
using FA_DALayer.SysAdmin;
using System.Collections;
using System.Data;
using System.ServiceModel.Activation;
#endregion

namespace SIS_FA_SLayer.SysAdmin
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: If you change the class name "FAAdminServices" here, you must also update the reference to "FAAdminServices" in Web.config.
    public class FAAdminServices : IFAAdminServices
    {

        byte[] bytesDataTable;
        byte[] bytesDataSet;
        int intErrorCode;


        public int FunSetConnection(string strConnectionName,string Fin_Year, int Company_ID, out string strDB_Name, out string strInitial_Catalog, out string strUSERNAME, out string strPASSWORD,string Appl_Type)
        {
            try
            {
                ClsPubFAAdmin ObjCLsPubFAAdmin = new ClsPubFAAdmin(strConnectionName);
                intErrorCode = ObjCLsPubFAAdmin.FunSetConnection(strConnectionName,Fin_Year, Company_ID, out strDB_Name, out strInitial_Catalog, out  strUSERNAME, out strPASSWORD,Appl_Type);
             }           
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Login :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intErrorCode;

        }



        #region Login Validations
        /// <summary>
        /// Function to validate the specified user login credentials
        /// </summary>
        /// <param name="strUserLoginCode"></param>
        /// <param name="strPassword"></param>
        /// <param name="intCompanyID"></param>
        /// <param name="intUserID"></param>
        /// <param name="intUser_Level_ID"></param>
        /// <param name="strUserName"></param>
        /// <param name="strCompanyName"></param>
        /// <param name="strCompanyCode"></param>
        /// <param name="LastLoginDate"></param>
        /// <param name="strTheme"></param>
        /// <param name="strAccess"></param>
        /// <returns>Return error code Default i.e if no error it will return 0</returns>
        public int FunPubValidateLogin(string strUserLoginCode, string strConnectionName, string strPassword, out int intCompanyID, out int intUserID, out int intUser_Level_ID, out string strUserName, out string strCompanyName, out string strCompanyCode, out DateTime LastLoginDate, out string strTheme, out string strAccess, out string strCountryName, out string strUserType, out string strMarquee,out string strCompareDate)
        {
            // strMarquee parameter - Added by Santhosh.S on 03/07/2013
            try
            {

                ClsPubFAAdmin ObjCLsPubS3GAdmin = new ClsPubFAAdmin(strConnectionName);
                String StrPlainPassword = strPassword;
                intErrorCode = ObjCLsPubS3GAdmin.FunPubValidateLogin(strUserLoginCode, strConnectionName, out strPassword, out intCompanyID, out  intUserID, out intUser_Level_ID, out strUserName, out  strCompanyName, out strCompanyCode, out LastLoginDate, out strTheme, out strAccess, out strCountryName, out strUserType, out strMarquee,out strCompareDate);
                if (intErrorCode == 0)
                {
                    String StrDescrypt = FAClsPubCommCrypto.DecryptText(strPassword);
                    if (StrDescrypt != StrPlainPassword)
                    {
                        intErrorCode = 2; // Password Mismatch
                    }
                }
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Login :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intErrorCode;
        }
       #endregion
        #region Menu Loading Code
        /// <summary>
        /// Function To get user Menu as Dataset
        /// </summary>
        /// <param name="intUserId">User Id for which menu to be loaded</param>
        /// <param name="strUserName"> User Name of the user</param>
        /// <returns>DataSet</returns>
        public byte[] FunPubGetUserMenu(int intUserId, string strUserName, string strUserType, int intCompany_ID, string strConnectionName)
        {
            DataSet ds;
            try
            {
                ClsPubFAAdmin ObjCLsPubFAAdmin = new ClsPubFAAdmin(strConnectionName);
                ds = ObjCLsPubFAAdmin.FunPubGetUserMenu(intUserId, strUserName, strUserType, intCompany_ID, strConnectionName);
                if (ds != null)
                    bytesDataTable = FAClsPubSerialize.Serialize(ds, FASerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Menu Loading :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        #endregion

        #region To Get single value from SP

        public string FunGetScalarValue( string strProcName,string strConnectionName,Dictionary<string, string> dctProcParams)
        {
            string ScalarString = string.Empty;
            try
            {
                FA_DALayer.SysAdmin.ClsPubFAAdmin objSalarValue = new FA_DALayer.SysAdmin.ClsPubFAAdmin(strConnectionName);
                ScalarString = objSalarValue.FunGetScalarValue(strProcName, strConnectionName, dctProcParams);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return ScalarString;
        }
        #endregion

        #region To Get Data in datatable
        /// <summary>
        /// Common Method that will exeute the Required Procedure when send with 
        /// respective parameters and will return a datatable
        /// </summary>
        /// <param name="strProcName">Procedure name which will be executed</param>
        /// <param name="dctProcParams">dictionary Containing Parameters for the sp</param>
        /// <returns>Return a DataTable</returns>
        public byte[] FunPubFillDropdown(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams)
        {
            try
            {
                ClsPubFAAdmin objFAAdmin = new ClsPubFAAdmin(strConnectionName);
                DataTable dtDropDown = objFAAdmin.FunPubFillDropdown(strProcName, strConnectionName, dctProcParams);
                if (dtDropDown != null)
                    bytesDataTable = FAClsPubSerialize.Serialize(dtDropDown, FASerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        public byte[] FunPubFillDropdownXML(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, string strXMLKey, string strXMLParm)
        {
            try
            {
                ClsPubFAAdmin objFAAdmin = new ClsPubFAAdmin(strConnectionName);
                DataTable dtDropDown = objFAAdmin.FunPubFillDropdown(strProcName, strConnectionName, dctProcParams, strXMLKey, strXMLParm);
                if (dtDropDown != null)
                    bytesDataTable = FAClsPubSerialize.Serialize(dtDropDown, FASerializationMode.Binary);
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

        #region To Get Data in DataSet
        /// <summary>
        /// Common Method that will exeute the Required Procedure when send with 
        /// respective parameters and will return a DataSet
        /// </summary>
        /// <param name="strProcName">Procedure name which will be executed</param>
        /// <param name="dctProcParams">dictionary Containing Parameters for the sp</param>
        /// <returns>Return a DataSet</returns>
        public byte[] FunPubFillDataset(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams)
        {
            try
            {
                ClsPubFAAdmin objFAAdmin = new ClsPubFAAdmin(strConnectionName);
                DataSet ObjDataset = objFAAdmin.FunPubFillDataset(strProcName, strConnectionName ,dctProcParams);
                bytesDataSet = FAClsPubSerialize.Serialize(ObjDataset, FASerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataSet;
        }
        #endregion





        #region Gridview Binding with paging
        /// <summary>
        /// Function Mainly for Gridview Binding with paging it should have predefined Paging object
        /// passed to it.
        /// </summary>
        /// <param name="strProcName">Procedure name used for grid binding </param>
        /// <param name="dctProcParams">Parameter for the Procedure</param>
        /// <param name="intTotalRecords">Total records that the query return</param>
        /// <param name="ObjPaging"> Paging object that has page related details</param>
        /// <returns>DataTable</returns>
        public byte[] FunPubFillGridPaging(string strProcName, string strConnectionName,  Dictionary<string, string> dctProcParams, out int intTotalRecords, FAPagingValues ObjPaging)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubFAAdmin objFAAdmin = new FA_DALayer.SysAdmin.ClsPubFAAdmin(strConnectionName);
                DataTable dtGridPaging = objFAAdmin.FunPubFillGridPaging(strProcName,strConnectionName, dctProcParams, out intTotalRecords, ObjPaging);
                bytesDataTable = FAClsPubSerialize.Serialize(dtGridPaging, FASerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Filling Grid :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        /// <summary>
        /// Function Mainly for Gridview Binding with paging it should have predefined Paging object
        /// passed to it.
        /// </summary>
        /// <param name="strProcName">Procedure name used for grid binding </param>
        /// <param name="dctProcParams">Parameter for the Procedure</param>
        /// <param name="intTotalRecords">Total records that the query return</param>
        /// <param name="intErrorCode"> Parameter for returning error code </param>
        /// <param name="ObjPaging"> Paging object that has page related details</param>
        /// <returns>DataTable</returns>
        public byte[] FunPubFillGridPaging(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, out int intTotalRecords, out int intErrorCode, FAPagingValues ObjPaging)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubFAAdmin objFAAdmin = new FA_DALayer.SysAdmin.ClsPubFAAdmin(strConnectionName);
                DataTable dtGridPaging = objFAAdmin.FunPubFillGridPaging(strProcName,  strConnectionName,dctProcParams, out intTotalRecords, out intErrorCode, ObjPaging);
                bytesDataTable = FAClsPubSerialize.Serialize(dtGridPaging, FASerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Filling Grid :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }
        #endregion

        #region ErrorLog
        public string FunPubSysErrorLog(string strProcName, Dictionary<string, string> dctProcParams, string strConnectionName)
        {
            string strErrLog = string.Empty;
            try
            {
                //ClsSystemErrorLog ObjCLsPubS3GAdmin1 = new S3GDALayer.S3GAdminServices.ClsPubCmnErrorLog();
                ClsPubFAAdmin ObjCLsPubFAAdmin = new ClsPubFAAdmin(strConnectionName);
                ObjCLsPubFAAdmin.FunPubSysErrorLog(strProcName, dctProcParams, strConnectionName);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return strErrLog;
        }
        #endregion

        #region Password Validation

        public int FunPubPasswordValidation(Int32 intUserID, string strPassword, string strConnectionName)
        {
            try
            {
                String strPlainPassword = strPassword;
                ClsPubFAAdmin ObjClsPubFAAdmin = new ClsPubFAAdmin(strConnectionName);
                intErrorCode = ObjClsPubFAAdmin.FunPubPasswordValidation(intUserID, out strPassword, strConnectionName);
                if (intErrorCode == 0)
                {
                    String StrDescrypt = FAClsPubCommCrypto.DecryptText(strPassword);
                    if (StrDescrypt != strPlainPassword)
                    {
                        intErrorCode = 2; // Password Mismatch
                    }
                }
            }
            catch (Exception objEx)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Password Validation :" + objEx.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intErrorCode;
        }

        #endregion

        public int FunPubCreateScheduledJobs(FASerializationMode SerMode, byte[] bytesObjScheduledJobsDatatable, out string strScheduleJobID, string strConnectionName)
        {

            try
            {
                FA_DALayer.SysAdmin.ScheduledJobs.ClsPubScheduledJobs objScheduledJobs = new FA_DALayer.SysAdmin.ScheduledJobs.ClsPubScheduledJobs( strConnectionName);
                return objScheduledJobs.FunPubCreateScheduledJobs(SerMode, bytesObjScheduledJobsDatatable, out strScheduleJobID, strConnectionName);

            }
            catch (Exception ex)
            {
                ClsPubFaultException objfaultex = new ClsPubFaultException();
                objfaultex.ProReasonRW = ex.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objfaultex, new FaultReason(objfaultex.ProReasonRW));
            }
        }
    }

}
