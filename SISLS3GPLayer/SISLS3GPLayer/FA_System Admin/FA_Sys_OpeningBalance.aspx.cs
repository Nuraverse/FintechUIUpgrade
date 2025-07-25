using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FA_BusEntity;

public partial class System_Admin_FA_Sys_OpeningBalance : ApplyThemeForProject_FA
{
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession objFASession = new FASession();
    int intCompanyId;
    int intUserId;
    string strMode = string.Empty;
    Dictionary<string, string> Procparam;
    string strPageName = "Opening Balance";
    DataTable dtTable = new DataTable();
    string strRedirectPageHome = "../Common/HomePage.aspx";
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objAdminServiceClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable ObjFA_SYS_openingDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceRow objopening_Row;
    string strRedirectPageView = "window.location.href='../Common/HomePage.aspx';";
    string strRedirectPageAdd = "window.location.href='../Common/HomePage.aspx';";
    string strRedirectAddPage = "~/Common/HomePage.aspx";
    string strRedirectViewPage = "~/Common/HomePage.aspx";
    FASession ObjFAsession = null;
    string strConnectionName = "";
    string financialyear;
    string financialmonth;
        string startfinancialyearmonth;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
            
           
        }
        catch (Exception ex)
        {
            cvDealInflow.ErrorMessage = "Due to Data Problem, Unable to Load Page";
            cvDealInflow.IsValid = false;
        }
    }
    private void FunPriLoadPage()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.PageTitle);
            ObjFAsession = new FASession();
            intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;
            Session["Company"] = ObjUserInfo_FA.ProCompanyNameRW;
            intUserId = ObjUserInfo_FA.ProUserIdRW;
            strConnectionName = ObjFAsession.ProConnectionName;
            string financialyear = objFASession.ProFinStartYearRW;
            string financialmonth = objFASession.ProFinYearStartMonthRW;
            string startfinancialyearmonth = financialyear + "00";
            Session["startfinancialyearmonth"] = startfinancialyearmonth;
            strMode = "C";
            //txtDate .Attributes .Add ("Readonly","true");
            txtdebit.SetDecimalPrefixSuffix_FA(objFASession.ProGpsPrefixRW, objFASession.ProGpsSuffixRW, true, "Debit");
            txtcredit.SetDecimalPrefixSuffix_FA(objFASession.ProGpsPrefixRW, objFASession.ProGpsSuffixRW, true, "Credit");
            if (!IsPostBack)
            {

                FunPriGetLocaList();
                FunPriLoadActivity();
                FunPriLoadGLCode();
                
            }
            //ScriptManager.RegisterStartupScript(this, GetType(), "te", "Resize();", true);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Load Opening Balance");
        }
    }

    private void FunPriGetLocaList()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyId));
            dictParam.Add("@User_ID", Convert.ToString(intUserId));
            if (strMode == "C")
            {
                dictParam.Add("@Location_Active", "1");
                dictParam.Add("@Is_Operational", "1");
            }
            dictParam.Add("@Program_ID", "97");
            ddllocation.BindDataTable_FA(SPNames.GetLocation, dictParam, new string[] { "Location_ID", "Location" });

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Location");
        }
    }
    private void FunPriLoadActivity()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", "-1");
            Procparam.Add("@LookupType", "1");
            Procparam.Add("@LookupCodes", "-1");
            ddlactivity.BindDataTable_FA(SPNames.GetLookupDetails, Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            Procparam = null;
            if (ddlactivity.Items.Count == 2)
                ddlactivity.SelectedIndex = 1;
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    private void FunPriLoadGLCode()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyId));
            dictParam.Add("@Program_ID", "97");
            dictParam.Add("@User_ID", Convert.ToString(intUserId));
            if (ddllocation.SelectedIndex > 0)
                dictParam.Add("@Location_ID1", ddllocation.SelectedValue);
             
          //ddlglcode.BindComboBoxWithALL_FA("FA_RPT_GET_GLCODE", dictParam, new string[] { "GL_Code", "GL_Desc" });
            ddlglcode.BindDataTable_FA("FA_RPT_GET_GLCODE", dictParam, new string[] { "GL_Code", "GL_Desc" });
            dictParam = null;
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    protected void ddlglcode_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {


            if (ddlglcode.SelectedIndex > 0)
            {

                FunPriLoadSLCode();
               
            }
           
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);

        }
    }
    private void FunPriLoadSLCode()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            dictParam.Add("@GL_Code", ddlglcode.SelectedValue);
            ddlslcode.BindDataTable_FA(SPNames.GetSLCode, dictParam, new string[] { "SL_Code", "SL_Desc" });
            if (ddlslcode.Items.Count == 2)
            {
                ddlslcode.SelectedIndex = 1;
            }
            dictParam = null;

        }

        catch (Exception ex)
        {

            throw new ApplicationException("Unable To Load Slcode");
        }
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadGrid();
        }

        catch (Exception ex)
        {
            throw new ApplicationException("Unable To Load Grid");
        }
    }

    private void FunPriLoadGrid()
    {
        try
        {
            pnlDetails.Visible = true;
            btnsave.Enabled = true;
            divTransaction.Style.Add("display", "block");
          
           //To get Financial year
           Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyId));
            dictParam.Add("@Program_ID", "42");
            dictParam.Add("@User_ID", Convert.ToString(intUserId));
            dictParam.Add("@Location_ID", ddllocation.SelectedValue);
            if(ddlglcode.SelectedIndex>0)
           dictParam.Add("@GL_CODE", ddlglcode.SelectedValue);
            if (ddlslcode.SelectedIndex > 0)
                dictParam.Add("@SL_CODE", ddlslcode.SelectedValue);
            dictParam.Add("@finmonth", Session["startfinancialyearmonth"].ToString());
            dtTable = Utility_FA.GetDefaultData("FA_GET_Opening_balance", dictParam);
               if (dtTable.Rows.Count > 0)
            {

                grvtransaction.DataSource = dtTable;
                grvtransaction.DataBind();
                ViewState["dtTable"] = dtTable;
           
            }
            else
            {
           
                grvtransaction.EmptyDataText = "No Transactions between the selected range";
                grvtransaction.DataBind();


            }



            //if (ds.Tables[3].Rows.Count > 0)
            //{
            //    Label lblTotDebit = grvtransaction.FooterRow.FindControl("lblTotalDues") as Label;
            //    Label lblTotCredit = grvtransaction.FooterRow.FindControl("lblTotalReceipts") as Label;
            //    lblTotDebit.Text = ds.Tables[3].Rows[0]["TotDebit"].ToString();
            //    lblTotCredit.Text = ds.Tables[3].Rows[0]["TotCredit"].ToString();

            //}

        }

        catch (Exception ex)
        {

            throw new ApplicationException("Unable To Load Grid");
        }
    }

    protected void chkselect_OnCheckedChanged(object sender, EventArgs e)
    {
        try
        {
            int intRowIndex = Utility_FA.FunPubGetGridRowID("grvtransaction", ((CheckBox)sender).ClientID);
            dtTable = (DataTable)ViewState["dtTable"];
            lbldebit.Visible = lblcredit.Visible = btnupdate.Visible = txtdebit.Visible = txtcredit.Visible = true;
            //for (int i = 0; i <= grvtransaction.Rows.Count - 1; i++)
            //{
            //    if (i != intRowIndex)
            //    {
            //        CheckBox chkselect = grvtransaction.Rows[i].FindControl("chkselect") as CheckBox;
            //        chkselect.Enabled = false;
            //    }
            //}
            DataRow drow = dtTable.Rows[intRowIndex];
            lblSlNo.Text = drow["SINO"].ToString();
            if (!string.IsNullOrEmpty(drow["gl_code"].ToString()))
            {
                ddlglcode.SelectedValue = drow["gl_code"].ToString();
                ddlglcode.ClearDropDownList_FA();
                FunPriLoadSLCode();
            }
            if (!string.IsNullOrEmpty(drow["sl_code"].ToString()))
            {
                ddlslcode.SelectedValue = drow["sl_code"].ToString();
                ddlslcode.ClearDropDownList_FA();
            }

            if (!string.IsNullOrEmpty(drow["location_id"].ToString()))
            {
                ddllocation.SelectedValue = drow["location_id"].ToString();

            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);

        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        
        dtTable = (DataTable)ViewState["dtTable"];
        DataRow drow = dtTable.Rows[Convert.ToInt32(lblSlNo.Text) - 1];
        drow.BeginEdit();
        if (txtdebit.Text != "")
        {
            drow["debit"] = txtdebit.Text.Trim();
        }
        if (txtcredit.Text != "")
        {
            drow["Credit"] = txtcredit.Text.Trim();
        }
        //if (!string.IsNullOrEmpty(txtFromDateTrn.Text.Trim()))
        drow.EndEdit();
        ViewState["dtTable"] = dtTable;
        grvtransaction.DataSource = dtTable;
        grvtransaction.DataBind();
        txtdebit.Text = txtcredit.Text = "";
        FunPriGetLocaList();
        FunPriLoadGLCode();
        FunPriLoadSLCode();
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool blnValReturn = false;
        Utility_FA.FunShowValidationMsg_FA(this.Page, FunPubGPSSave(out blnValReturn), strRedirectPageAdd, strRedirectPageView, strMode, blnValReturn);
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {

        FunPriGetLocaList();
        FunPriLoadGLCode();
        FunPriLoadSLCode();
        grvtransaction.DataSource = null;
            grvtransaction.DataBind();
        pnlDetails.Visible=false;
        btnsave.Enabled=false;
    }


    public int FunPubGPSSave(out bool blnValReturn)
    {
        int intReturnValue = 0;
        blnValReturn = false;
        objAdminServiceClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        objAdminServiceClient.Open();
        ObjFA_SYS_openingDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable();
        try
        {
            objopening_Row = ObjFA_SYS_openingDataTable.NewFA_OpeningbalanceRow();
            objopening_Row.Company_ID = intCompanyId.ToString();
            objopening_Row.User_id = intUserId.ToString();
            objopening_Row.XML_Detail = grvtransaction.FunPubFormXml_FA();
            objopening_Row.Fin_month = Session["startfinancialyearmonth"].ToString();
            ObjFA_SYS_openingDataTable.AddFA_OpeningbalanceRow(objopening_Row);
            intReturnValue = objAdminServiceClient.FunPubInsertUpdateOpeningbalance(FASerializationMode.Binary, FAClsPubSerialize.Serialize(ObjFA_SYS_openingDataTable, FASerializationMode.Binary), "C",strConnectionName );
           
        }
        catch (Exception ex)
        {
 
        }
        return intReturnValue;
    }


}
