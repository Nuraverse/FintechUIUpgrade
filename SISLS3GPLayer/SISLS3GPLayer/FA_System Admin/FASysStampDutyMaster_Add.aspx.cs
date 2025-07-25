#region Header
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using FA_BusEntity;
using System.Collections.Generic;
using System.ServiceModel;
using System.Text;
#endregion


public partial class System_Admin_FASysStampDutyMaster_Add : ApplyThemeForProject_FA
{

    #region Initialisation
    Dictionary<string, string> dictParam = null;
    DataTable dtStampDuty = null;
    DataTable dtupdate = null;
    int intCompanyId;
    int intUserId;
    string validationCode;
    int int_stamp_id = 0;
    //decimal decActualAmount = 0;
    String StrConnectionName;
    string strStamp_Master_Id = string.Empty;
    StringBuilder sbReceivingXML;
    DataTable dtReceiving = null;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession objFASession = new FASession();
    string strKey = "Insert";
    //FATranMasterMgtServiceReference.FATranMasterMgtServicesClient objBudget_MasterClient;
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objStampDutyMasterClient;

    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../System Admin/FASysStampDutyMaster_Add.aspx';";
    string strRedirectPageView = "window.location.href='../System Admin/FASysStampDutyMaster_View.aspx';";
    //FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTDataTable objbudmaster_DTB = new FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTDataTable();
    //FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTRow objbudmasterrow;

    FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterDataTable objStampDutyMaster_DTB = new FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterDataTable();
    FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterRow objStampDutyMasterRow;

    int intErrCode = 0;
    string strMode = string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bval = false;
    int j = 1;
    static string strPageName = "Stamp Duty Master";
    #endregion


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriPageLoad();
            FunPriDummy();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            //cvBudget.ErrorMessage = Resources.ErrorHandlingAndValidation._1201;
            //cvBudget.IsValid = false;



        }


        //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
        //FunProInitializeGridData();

    }

    DataTable dtdummy = new DataTable();
    private void FunPriDummy()
    {
        dtdummy.Columns.Add("Tim",typeof(DateTime));
        DataRow dr= dtdummy.NewRow();
        for (int i = 0; i <= 5; i++)
            dr["Tim"] = DateTime.Now.AddHours(i);

        dtdummy.Rows.Add(dr);
        ViewState["dtdummy"] = dtdummy;
    }


    private void FunPriPageLoad()
    {
        try
        {
            UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
            FASession objFASession = new FASession();
            intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;
            intUserId = ObjUserInfo_FA.ProUserIdRW;
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.Create);
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            StrConnectionName = objFASession.ProConnectionName;


            strMode = "C";
            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strMode = Request.QueryString.Get("qsMode");
                strStamp_Master_Id = fromTicket.Name;
            }
            if (!IsPostBack)
            {
                FunProInitializeGridData();

                FunPriGetLocationList();
                //FunPriGetStampDutyDetails();
                //FunPriDisplayFinancialYear();
                //FunPriLoadBudgetType();
                FunPriLoadStampDutyPattern();
                //FunGetCurrency();
                //FunPriLoadGLCode();
                cbxActive.Checked = true;
                cbxActive.Enabled = false;

                if (Request.QueryString["qsMode"] == "Q")
                {
                    FunPriGetStampDutyDetails(strStamp_Master_Id);
                    // FunGetRepay_AllocationDetails(strFunder_Tran_ID);
                    FunPriDisableControls(-1);
                }
                else if (Request.QueryString["qsMode"] == "M")
                {
                    FunPriGetStampDutyDetails(strStamp_Master_Id);
                    // FunGetRepay_AllocationDetails(strFunder_Tran_ID);
                    FunPriDisableControls(1);
                }
                else
                {
                    FunPriDisableControls(0);
                }
                //if (txtamount.Text != "")
                //txtamount.SetDecimalPrefixSuffix_FA(objFASession.ProGpsPrefixRW, objFASession.ProGpsSuffixRW, true, "Amount");


            }
            

        }

        catch (Exception ex)
        {

               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    private void FunPriGetLocationList()
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
            dictParam.Add("@Program_ID", "71"); // 13
            ddlLocation.BindDataTable_FA(SPNames.GetLocation, dictParam, new string[] { "Location_ID", "Location" });

        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Location");
        }
    }


    private void FunPriLoadStampDutyPattern()
    {
        try
        {

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            ddlFundType.BindDataTable_FA("FA_GET_STMP_PATTERN", dictParam, new string[] { "ID", "DESCRIPTION" });
            dictParam = null;

        }

        catch (Exception ex)
        {
            throw new ApplicationException("Unable To Load Slcode");
        }
    }


    private void FunPriGetStampDutyDetails(string strStamp_Master_Id)
    {
        try
        {
            //pnlBudgetDetails.Visible = true;
            //DataTable ds.Tables[0] = new DataTable();
            DataSet ds = new DataSet();
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            dictParam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            dictParam.Add("@StampMaster_ID", strStamp_Master_Id);
            ds = Utility_FA.GetDataset("FA_GET_Stamp_Duty_MST", dictParam);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlLocation.SelectedValue = ds.Tables[0].Rows[0]["Location_Id"].ToString();
                FunPriLoadGLCode(ddlLocation.SelectedValue);
                ddlGLAccount.SelectedValue = ds.Tables[0].Rows[0]["Gl_Code"].ToString();
                FunPriLoadSLCode();
                //if (ds.Tables[0].Rows[0]["Budget_Type"].ToString() == "1")
                //{
                //    txtbudgettype.Text = "Original";
                //}
                //else
                //{
                //    txtbudgettype.Text = "Revision";
                //}
                ddlFundType.SelectedValue = ds.Tables[0].Rows[0]["Fund_Type_Code_Id"].ToString();
                ddlSLAccount.SelectedValue = ds.Tables[0].Rows[0]["SL_Code"].ToString();
                //txtamount.Text = ds.Tables[0].Rows[0]["Yearly_Amount"].ToString();
                // ViewState["YearlyAmount"] = ds.Tables[0].Rows[0]["Yearly_Amount"].ToString();
                cbxActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Is_Active"].ToString());
                //if (Convert.ToInt32(ds.Tables[0].Rows[0]["debit"].ToString()) > 0 || Convert.ToInt32(ds.Tables[0].Rows[0]["credit"].ToString()) > 0)
                //{
                //    ddlGLAccount.ClearDropDownList_FA();
                //    ddlSLAccount.ClearDropDownList_FA();
                //}

            }
            if (ds.Tables[1].Rows.Count > 0)
            {

                ViewState["StampDuty"] = dtStampDuty = ds.Tables[1];
                grvStampDuty.DataSource = ds.Tables[1];
                grvStampDuty.DataBind();

                //ViewState["DT_Budget"] = dtBudget;
                //foreach (DataRow drrow in dtBudget.Rows)
                //{
                //    decActualAmount += (Convert.ToDecimal(drrow["Budget"].ToString()));
                //}
                //ViewState["Total"] = decActualAmount;
                if (ddlFundType.SelectedValue == "1")
                {
                    grvStampDuty.FooterRow.Visible = false;
                    //gvBudgetDetails.Columns[3].Visible = false;
                }

            }
            // FunGetRepay_InterestDetails(ds.Tables[0].Rows[0]["Funder_ID"].ToString());

        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                if (!bCreate)
                {

                    btnSave.Enabled = false;
                }

                break;

            case 1: // Modify Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                //FunPriLoadSLCode();
                //rfvpwd.Enabled = true;
                btnClear.Enabled = false;
                cbxActive.Enabled = true;
                //ddlLocation.ClearDropDownList_FA();
                btnSave.Enabled = true;
                //ddlSLCode.ClearDropDownList_FA();
                //ddlGLCode.ClearDropDownList_FA();
                //ddlFundType.ClearDropDownList_FA();
                //grvStampDuty.Columns[0].Visible = false;                
                if (!bModify)
                {

                }

                break;

            case -1:// Query Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                //grvStampDuty.Cl.Enabled = false;
                btnSave.Enabled = btnClear.Enabled = false;
                ddlLocation.ClearDropDownList_FA();
                ddlGLAccount.ClearDropDownList_FA();
                ddlSLAccount.ClearDropDownList_FA();
                //ddlBudgetType.ClearDropDownList_FA();
                ddlFundType.ClearDropDownList_FA();
                grvStampDuty.FooterRow.Visible = false;
                //grvStampDuty.Columns[3].Visible = false;



                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                break;
        }

    }


    private void FunPriLoadGLCode(string location)
    {
        try
        {
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            //Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            //if (strMode == "C")
            //    Procparam.Add("@Is_Active", "1");
            dictParam.Add("@Program_ID", "71"); // 13
            dictParam.Add("@Location_ID", location);

            ddlGLAccount.BindDataTable_FA(SPNames.GetGLCode, dictParam, new string[] { "GL_Code", "GL_Desc" });

            dictParam = null;
            //if (ddlGLCode.Items.Count == 2)
            //    ddlGLCode.SelectedIndex = 1;

        }

        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load GLCode");
        }
    }


    private void FunPriLoadSLCode()
    {
        try
        {
            ddlSLAccount.Enabled = true;
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            dictParam.Add("@GL_Code", ddlGLAccount.SelectedValue);
            dictParam.Add("@Is_Active", "1");
            ddlSLAccount.BindDataTable_FA(SPNames.GetSLCode, dictParam, new string[] { "SL_Code", "SL_Desc" });
            dictParam = null;
            //if (ddlSLCode.Items.Count > 1)
            //{
            //    rfvddlslcode.Enabled = true;
            //}
            if (ddlSLAccount.Items.Count == 2)
                ddlSLAccount.SelectedIndex = 1;

        }

        catch (Exception ex)
        {

            throw new ApplicationException("Unable To Load Slcode");
        }
    }


    protected void FunProInitializeGridData()
    {
        DataTable dtStamp = new DataTable("StampDuty");

        dtStamp.Columns.Add("Stamp_DTL_Id");
        dtStamp.Columns.Add("StartDate");
        dtStamp.Columns.Add("EndDate");
        dtStamp.Columns.Add("StartRange");
        dtStamp.Columns.Add("EndRange");
        //dtStamp.Columns.Add("Active");
        dtStamp.Columns.Add("Amount");
        dtStamp.Columns.Add("Action");


        DataRow dRow = dtStamp.NewRow();

        dRow["Stamp_DTL_Id"] = "";
        dRow["StartDate"] = "";
        dRow["EndDate"] = "";
        dRow["StartRange"] = "";
        dRow["EndRange"] = "";
        //dRow["Active"] = "";
        dRow["Amount"] = "";
        dRow["Action"] = "";


        dtStamp.Rows.Add(dRow);


        grvStampDuty.DataSource = dtStamp;
        grvStampDuty.DataBind();
        grvStampDuty.Rows[0].Visible = false;
        grvStampDuty.FooterRow.Visible = true;

        dtStamp.Rows[0].Delete();
        ViewState["StampDuty"] = dtStamp;


    }


    protected void ddlFundType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //ViewState["DT_Budget"] = null; //
            //pnlBudgetDetails.Visible = false;
            //btnSave.Enabled = false; //
            //btngo.Enabled = true;


        }

        catch (Exception objException)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);

        }


    }


    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlLocation.SelectedIndex > 0)
            {
                FunPriLoadGLCode(ddlLocation.SelectedValue);
                //FunPriLoadSLCode();
                //pnlBudgetDetails.Visible = false;
                ViewState["DT_Budget"] = null;
                //btnSave.Enabled = false;
                //FunPriInsertBudgetDetailsDataTable("", "","");
                //pnlBudgetDetails.Visible = true;
                //txtamount.Text = "";
                FunPriLoadStampDutyPattern();
                //lnkCopyProfile.Enabled = true;
                //btngo.Enabled = true;
            }
            else
            {
                //pnlBudgetDetails.Visible = false;
                ViewState["DT_Budget"] = null;
                ddlGLAccount.ClearDropDownList_FA();
                FunPriLoadSLCode();
                //btnSave.Enabled = false;
                //txtamount.Text = "";
                //lnkCopyProfile.Enabled = false;
                FunPriLoadStampDutyPattern();
                //btngo.Enabled = true;
            }
        }
        catch (Exception objException)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);

        }

    }


    protected void ddlGLAccount_SelectedIndexChanged1(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadSLCode();
            //FunPriSetControlDDLToolTip();

        }
        catch (Exception objException)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);

        }

    }


    protected void grvStampDuty_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Insert")
        {

            DataTable dt = (DataTable)ViewState["StampDuty"];


            TextBox txtStartDate = (TextBox)grvStampDuty.FooterRow.FindControl("txtStartDate");
            TextBox txtEndDate = (TextBox)grvStampDuty.FooterRow.FindControl("txtEndDate");
            TextBox txtStartRange = (TextBox)grvStampDuty.FooterRow.FindControl("txtStartRange");
            TextBox txtEndRange = (TextBox)grvStampDuty.FooterRow.FindControl("txtEndRange");
            //CheckBox chkActive = (CheckBox)grvStampDuty.FooterRow.FindControl("chkActiveF");
            TextBox txtAmount = (TextBox)grvStampDuty.FooterRow.FindControl("txtAmount");


            DataRow dtRow = dt.NewRow();
            //dtRow["StampDuty_ID"] = "";
            dtRow["StartDate"] = txtStartDate.Text;
            dtRow["EndDate"] = txtEndDate.Text;
            dtRow["StartRange"] = txtStartRange.Text;
            dtRow["EndRange"] = txtEndRange.Text;
            //dtRow["Active"] = chkActive.Checked;
            dtRow["Amount"] = txtAmount.Text;

            dt.Rows.Add(dtRow);

            ViewState["StampDuty"] = dt;
            grvStampDuty.DataSource = (DataTable)ViewState["StampDuty"];
            grvStampDuty.DataBind();

        }

    }


    protected void grvStampDuty_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            AjaxControlToolkit.CalendarExtender cldrStartDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("cldrStartDate");
            cldrStartDate.Format = objFASession.ProDateFormatRW;

            AjaxControlToolkit.CalendarExtender cldrEndDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("cldrEndDate");
            cldrEndDate.Format = objFASession.ProDateFormatRW;

            TextBox txtAmount = (TextBox)e.Row.FindControl("txtAmount");
            txtAmount.SetDecimalPrefixSuffix_FA(objFASession.ProGpsPrefixRW, objFASession.ProGpsSuffixRW, true, "Amount");


        }


        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox txtStartDate = (TextBox)e.Row.FindControl("txtStartDate");
            txtStartDate.Attributes.Add("readonly", "readonly");

            TextBox txtEndDate = (TextBox)e.Row.FindControl("txtEndDate");
            txtEndDate.Attributes.Add("readonly", "readonly");

        }


        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (Request.QueryString["qsMode"] == "Q")
            {
                //CheckBox chkActive = (CheckBox)e.Row.FindControl("chkActive");
                //chkActive.Enabled = false;
                LinkButton lnkDelete = (LinkButton)(e.Row.FindControl("lnkDelete"));
                lnkDelete.Enabled = false;
                lnkDelete.OnClientClick = "";


            }
        }

        if (strMode == "C")
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DataTable dtStampDutyStartRange = new DataTable();
                dtStampDutyStartRange = (DataTable)ViewState["StampDuty"];

                if (dtStampDutyStartRange != null)
                {
                    if (dtStampDutyStartRange.Rows.Count >= 1)
                    {
                        int count = dtStampDutyStartRange.Rows.Count;


                        DataRow dRow = dtStampDutyStartRange.Rows[count - 1];

                        TextBox txtStartRange = (TextBox)e.Row.FindControl("txtStartRange");
                        if (!string.IsNullOrEmpty(dRow["EndRange"].ToString()))
                        {
                            txtStartRange.Text = dRow["EndRange"].ToString();
                            txtStartRange.Text = (Convert.ToDecimal(txtStartRange.Text) + 1).ToString("0");
                        }
                    }

                }

            }
        }

    }


    protected void grvStampDuty_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        DataTable dtStampDelete;
        dtStampDelete = (DataTable)ViewState["StampDuty"];
        dtStampDelete.Rows[e.RowIndex].Delete();
        dtStampDelete.AcceptChanges();
        if (dtStampDelete.Rows.Count == 0)
        {
            FunProInitializeGridData();
        }
        else
        {

            ViewState["StampDuty"] = dtStampDelete;
            grvStampDuty.DataSource = (DataTable)ViewState["StampDuty"];
            grvStampDuty.DataBind();
        }

    }


    private string FunPriReceivingXML()
    {
        try
        {
            sbReceivingXML = new StringBuilder();
            dtReceiving = (DataTable)ViewState["StampDuty"];
            sbReceivingXML.Append("<Root>");

            //if (dtReceiving.Rows.Count == 1 && Convert.ToString(dtReceiving.Rows[0]["StampDuty_ID"]) == "0")
            //{
            //    sbReceivingXML.Append("</Root>");
            //}
            //else
            //{
            for (int dtRow = 0; dtRow < dtReceiving.Rows.Count; dtRow++)
            {
                //sbReceivingXML.Append("<Details StampDuty_ID='" + dtReceiving.Rows[dtRow]["StampDuty_ID"].ToString() + "' ");
                sbReceivingXML.Append("<Details StartDate='" + Utility_FA.StringToDate(dtReceiving.Rows[dtRow]["StartDate"].ToString()) + "' ");
                sbReceivingXML.Append(" EndDate='" + Utility_FA.StringToDate(dtReceiving.Rows[dtRow]["EndDate"].ToString()) + "' ");
                sbReceivingXML.Append(" StartRange='" + dtReceiving.Rows[dtRow]["StartRange"].ToString() + "' ");
                sbReceivingXML.Append(" EndRange='" + dtReceiving.Rows[dtRow]["EndRange"].ToString() + "' ");
                //sbReceivingXML.Append(" Active='" + dtReceiving.Rows[dtRow]["Active"].ToString() + "' ");
                sbReceivingXML.Append(" Amount='" + dtReceiving.Rows[dtRow]["Amount"].ToString() + "' ");
                sbReceivingXML.Append(" />");

            }

            sbReceivingXML.Append("</Root>");
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sbReceivingXML.ToString();

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        //SystemAdminMgtServiceReference.SystemAdminMgtServiceClient ObjSAMgtServices = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        //int intErrPwd = 0;
        dtReceiving = new DataTable();
        if (ViewState["StampDuty"] != null)
            dtReceiving = (DataTable)ViewState["StampDuty"];

        if (dtReceiving.Rows.Count < 1)
        {
            Utility_FA.FunShowAlertMsg_FA(this.Page, "Add atleast one stamp duty details");
            return;
        }


        Utility_FA.FunShowValidationMsg_FA(this.Page, FunPubSaveDetails(), strRedirectPageAdd, strRedirectPageView, strMode, false);

    }


    private int FunPubSaveDetails()
    {

        objStampDutyMasterClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            objStampDutyMasterRow = objStampDutyMaster_DTB.NewFA_SYS_StampDutyMasterRow();
            if (Request.QueryString["qsMode"] != "M")
            {

                //if (!string.IsNullOrEmpty())
                //{

                //}
                //else 
                //    objStampDutyMasterRow.
                objStampDutyMasterRow.User_ID = Convert.ToInt32(ObjUserInfo_FA.ProUserIdRW);
                objStampDutyMasterRow.Company_ID = ObjUserInfo_FA.ProCompanyIdRW;
                objStampDutyMasterRow.Location_ID = Convert.ToInt32(ddlLocation.SelectedValue);
                objStampDutyMasterRow.Fund_Type = ddlFundType.SelectedValue;
                if (ddlGLAccount.SelectedIndex != 0)
                {
                    objStampDutyMasterRow.GL_Account_Code = ddlGLAccount.SelectedValue;
                    if (ddlSLAccount.SelectedIndex != 0)
                        objStampDutyMasterRow.SL_Account_Code = ddlSLAccount.SelectedValue;
                }
                objStampDutyMasterRow.Active = cbxActive.Checked;
                objStampDutyMasterRow.Trans_Date = DateTime.Now;
                objStampDutyMasterRow.Option = 1;
                objStampDutyMasterRow.Xml_Stamp = FunPriReceivingXML();

                objStampDutyMaster_DTB.AddFA_SYS_StampDutyMasterRow(objStampDutyMasterRow);

                FASerializationMode SerMode = FASerializationMode.Binary;
                byte[] ObjStampDutyDataTable = FAClsPubSerialize.Serialize(objStampDutyMaster_DTB, SerMode);
                intErrCode = objStampDutyMasterClient.FunPubCreateStampDuty(SerMode, ObjStampDutyDataTable, StrConnectionName,out int_stamp_id);


            }

            else
            {

                //if (!string.IsNullOrEmpty())
                //{

                //}
                //else 
                //    objStampDutyMasterRow.
                objStampDutyMasterRow.StampMaster_ID = Convert.ToInt32(strStamp_Master_Id);
                objStampDutyMasterRow.User_ID = Convert.ToInt32(ObjUserInfo_FA.ProUserIdRW);
                objStampDutyMasterRow.Company_ID = ObjUserInfo_FA.ProCompanyIdRW;
                objStampDutyMasterRow.Location_ID = Convert.ToInt32(ddlLocation.SelectedValue);
                objStampDutyMasterRow.Fund_Type = ddlFundType.SelectedValue;
                if (ddlGLAccount.SelectedIndex != 0)
                {
                    objStampDutyMasterRow.GL_Account_Code = ddlGLAccount.SelectedValue;
                    if (ddlSLAccount.SelectedIndex != 0)
                        objStampDutyMasterRow.SL_Account_Code = ddlSLAccount.SelectedValue;
                }
                objStampDutyMasterRow.Active = cbxActive.Checked;
                objStampDutyMasterRow.Trans_Date = DateTime.Now;
                objStampDutyMasterRow.Option = 1;
                objStampDutyMasterRow.Xml_Stamp = FunPriReceivingXML();

                objStampDutyMaster_DTB.AddFA_SYS_StampDutyMasterRow(objStampDutyMasterRow);

                FASerializationMode SerMode = FASerializationMode.Binary;
                byte[] ObjStampDutyDataTable = FAClsPubSerialize.Serialize(objStampDutyMaster_DTB, SerMode);
                intErrCode = objStampDutyMasterClient.FunPubCreateStampDuty(SerMode, ObjStampDutyDataTable, StrConnectionName,out int_stamp_id);

            }



        }

        catch (Exception ex)
        {
            throw ex;
        }

        finally
        {
            if (objStampDutyMasterClient != null)
                objStampDutyMasterClient.Close();
        }
        return intErrCode;



    }


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../System Admin/FASysStampDutyMaster_View.aspx");
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            //lblErrorMessage.Text = ex.Message;
        }
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {
        FunPubClear();
        dtdummy = (DataTable)ViewState["dtdummy"];

        int value = 0;
        value =(int)dtdummy.Compute("sum(Tim)", "");



    }

    private void FunPubClear()
    {
        ViewState["StampDuty"] = null;
        ddlLocation.SelectedIndex = ddlFundType.SelectedIndex = 0;

        if (ddlGLAccount.Items.Count > 0)
            ddlGLAccount.SelectedIndex = 0;

        if (ddlSLAccount.Items.Count > 0)
            ddlSLAccount.SelectedIndex = 0;

        FunPriGetLocationList();
        //FunPriGetStampDutyDetails(strStamp_Master_Id);


    }


}
