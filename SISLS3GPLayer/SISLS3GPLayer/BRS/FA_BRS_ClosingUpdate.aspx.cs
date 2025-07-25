#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using FA_BusEntity;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;
using System.Data;
using System.Text;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

#endregion

public partial class BRS_FA_BRS_ClosingUpdate : ApplyThemeForProject_FA
{
    #region Initialization
    int intCompanyID, intUserID = 0;
    Dictionary<string, string> Procparam = null;
    string strBRS_Id = string.Empty;
    int intErrCode = 0;
    string validationCode;
    string strDateFormat = "";
    string strSuffixFormat = "0.00";
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();
    FASerializationMode ObjSerMode = FASerializationMode.Binary;
    DataTable dtAdjustmentDetails;
    DataTable dtPaymentDtls;
    DataTable dtReceiptDtls;
    DataTable dtInvestment;
    DataTable dtDim;
    DataTable dtStagingtable;
    StringBuilder sbConditionsXML;
    StringBuilder sbBudget_XML = new StringBuilder();



    string strConnectionName = string.Empty;
    int intBRS_Id = 0;
    string strBRS_No = "";

    FATransactionServiceReference.FATransactionServiceClient objFATranMasterMgt = new FATransactionServiceReference.FATransactionServiceClient();
    FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable objFA_BRSDataTable = new FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable();
    FA_BusEntity.FinancialAccounting.Hedging.FA_BRSRow objFA_BRSRow;


    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";


    static string strPageName = "BRS";
    //User Authorization
    string strMode = "C";
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    //Code end



    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);

        }
    }

    private void FunPriLoadPage()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            //Code end

            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;
            //setting date format
            strDateFormat = ObjFASession.ProDateFormatRW;

            strConnectionName = ObjFASession.ProConnectionName;

            if (!string.IsNullOrEmpty(strDateFormat))
            {
                CEDocumentDate.Format =  strDateFormat;
            }
            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strBRS_Id = fromTicket.Name;
            }
            if (Request.QueryString["qsMode"] != null)
                strMode = Request.QueryString.Get("qsMode");








            if (!IsPostBack)
            {

                txtDocumentDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtDocumentDate.ClientID + "','" + strDateFormat + "',false,  false);");
                //txtStartDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtStartDate.ClientID + "','" + strDateFormat + "',true,  false);");
                //txtEndDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtEndDate.ClientID + "','" + strDateFormat + "',true,  false);");

                FunPriLoadLocation();





                ddlLocation.Focus();

            }
            //FunPriSetMaxLength();
            //FunPriSetControlDDLToolTip();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    private void FunPriLoadLocation()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (strMode == "C")
            {
                Procparam.Add("@Location_Active", "1");
                Procparam.Add("@Is_Operational", "1");
            }
            Procparam.Add("@Program_ID", "100");
            ddlLocation.BindDataTable_FA(SPNames.GetLocation, Procparam, new string[] { "Location_ID", "Location" });
            Procparam = null;
            //if (ddlLocation.Items.Count == 2)
            //{
            //    ddlLocation.SelectedIndex = 1;
            //    FunPriLoadBankDetails();
            //}
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadBankDetails();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);

        }
    }


    private void FunPriLoadBankDetails()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
            DataTable dtBankList = Utility_FA.GetDefaultData(SPNames.Get_BankDetail_Receipt, Procparam);
            ViewState["vs_BankList"] = dtBankList;
            ddlBankName.BindDataTable_FA(dtBankList, "Bank_Detail_ID", "Bank_Name");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../Common/HomePage.aspx", false);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            //lblErrorMessage.Text = ex.Message;
        }
    }
}