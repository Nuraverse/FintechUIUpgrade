using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ServiceModel;

/// <summary>
/// Summary description for S3GCommonMethods
/// Created By  : Rajendran
/// Purpose     : Separate the 
/// </summary>
public static partial class Utility_FA
{
    /*public static string GetTableScalarValue(string strProcName, Dictionary<string, string> dictProcParam)
    {
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
        //S3GAdminServicesReference.S3GAdminServicesClient ObjAdminService = null;        
        try
        {
            ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
            string ScalarValue = ObjAdminService.FunGetScalarValue(strProcName, dictProcParam);            
            return ScalarValue;
        }
        catch (FaultException ex)
        {
            
        }
        finally
        {
            ObjAdminService.Close();                       
        }
        return null;
    }    
   */

    public enum S3GModules
    {
        SysAdmin,
        Orgination,
        LoanAdmin,
        Collection,
        Insurance

    }    
}

