using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SmartLendLiteNxgDALHelper.ADM;
using System.Data;



namespace SmartLendLiteNxgBusiness.ADM
{
    public class UserBLL_FA
    {
        public int ValidateLogin(string userLoginID, string password, out int CompanyID, out int UserID, out string CompanyName,string CompanyCode)
        {
            try
            {
                UserDAL_FA UserDAL_FA = new UserDAL_FA();
                return (UserDAL_FA.ValidateLogin(userLoginID, password, out CompanyID, out UserID, out CompanyName, CompanyCode));
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        //public NxgMaster.SNXG_Company_CodeDataTable getcompanydetails(int company_id)
        //{
        //    try
        //    {
        //        UserDAL_FA UserDAL_FA = new UserDAL_FA();
        //        return (UserDAL_FA.getcompanydetails(company_id,company_code,company_name));
        //     }
        //    catch
        //    {
        //    }
        //}

    }
}
