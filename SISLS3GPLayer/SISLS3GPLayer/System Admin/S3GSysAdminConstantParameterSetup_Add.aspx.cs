#region Page Header
/// © 2018 SUNDARAM INFOTECH. All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Constant Parameter Definition S3G_SYS_IN_ADD_PAR_DTL
/// Created By			: Kannan RC
/// Created Date		: 11-JUL-2018
/// Purpose	            : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Globalization;
using System.Resources;
using System.Collections.Generic;
using System.Web.UI;
using System.ServiceModel;
using System.Data;
using System.Text;
using S3GBusEntity.Origination;
using S3GBusEntity;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Web.Services;
using System.Collections;
#endregion

public partial class System_Admin_S3GSysAdminConstantParameterSetup_Add : ApplyThemeForProject
{
    #region Intialization

    OrgMasterMgtServicesReference.OrgMasterMgtServicesClient ObjConstitutionCodeMasterClient;
    OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable ObjS3G_ORG_ConstitutionMasterDataTable = new OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable();
    SerializationMode SerMode = SerializationMode.Binary;
    int intErrCode = 0;

    int intConstitutionID = 0;
    bool IsEnableLOB = true;
    bool IsLOBCalled = false;
    int intUserID = 0;
    int intCompanyID = 0;


    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bClearList = false;
    bool bMakerChecker = false;
    //Code end

    string strXMLLOBDet = "<Root><Details LOB_ID='0' /></Root>";
    string strXMLConsDocumentsDet = "<Root><Details LOB_ID='0' /></Root>";
    string strXMLCONDet = "<Root><Details CONSTITUTION_ID='0' /></Root>";
    StringBuilder strbLOBDet = new StringBuilder();
    StringBuilder strbConsDocumentsDet = new StringBuilder();
    StringBuilder strbCONDet = new StringBuilder();
    string strRedirectPage = "../System Admin/S3GSysAdminConstantParameterSetup_View.aspx";
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminConstantParameterSetup_Add.aspx?qsMode=C';";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminConstantParameterSetup_View.aspx';";
    Dictionary<string, string> dictParam = null;
    string strDateFormat = string.Empty;
    #endregion

    #region PageLoad



    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
        UserInfo ObjUserInfo = new UserInfo();
        S3GSession ObjS3GSession = new S3GSession();
        intCompanyID = ObjUserInfo.ProCompanyIdRW;
        intUserID = ObjUserInfo.ProUserIdRW;
        //User Authorization
        bCreate = ObjUserInfo.ProCreateRW;
        bModify = ObjUserInfo.ProModifyRW;
        bQuery = ObjUserInfo.ProViewRW;
        //Code end
        System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID;
        System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = intUserID;
        strDateFormat = ObjS3GSession.ProDateFormatRW;
        if (Request.QueryString["qsViewId"] != null)
        {
            FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
            if (fromTicket != null)
            {
                intConstitutionID = Convert.ToInt32(fromTicket.Name);
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            }
            strMode = Request.QueryString["qsMode"];
        }
        if (ViewState["PageMode"] == null)
        {
            ViewState["PageMode"] = PageMode.ToString();
        }

        if (!IsPostBack)
        {
            FunGetConstantParameterDetails();

            bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
            if ((intConstitutionID > 0) && (strMode == "M"))
            {
                //LoadDocumentFlags();
                hdnMode.Value = "M";
                FunPriDisableControls(1);

            }
            else if ((intConstitutionID > 0) && (strMode == "Q")) // Query // Modify
            {
                FunPriDisableControls(-1);

            }
            else
            {
                FunPriDisableControls(0);
            }
        }
        txtConstantName.Focus();
    }

    #endregion

    public static void BindTooltip(DropDownList lc)
    {
        for (int i = 0; i < lc.Items.Count; i++)
        {
            lc.Items[i].Attributes.Add("title", lc.Items[i].Text);
        }
    }


    #region Page Events

    /// <summary>
    /// This is used to save ConstitutionCode details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnSave_Click(object sender, EventArgs e)
    {

        //if (!Page.IsValid)
        //    return;
        if (hdnProgramID.Value == "45" || hdnProgramID.Value == "32")
        {
            int result1 = FunPriGenerateConDocDet();
            if (result1 == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Atleast one Constitution/Entity Type should be selected");
                return;
            }
        }
        int result = FunPriGenerateLOBDocDet();
        if (result == 1)
        {
            if (grvConsDocuments.Rows.Count == 1 && ViewState["PageMode"].ToString() == PageModes.Create.ToString())
                Utility.FunShowAlertMsg(this.Page, "Add atleast one Parameter Details to proceed.");
            return;
        }
        //else if (result == 3)
        //{
        //    Utility.FunShowAlertMsg(this.Page, "Atleast one Line of Business should be selected");
        //    return;
        //}
        else if (grvConsDocuments.Rows.Count == 0 && ViewState["PageMode"].ToString() == PageModes.Modify.ToString())
        {
            Utility.FunShowAlertMsg(this.Page, "Add atleast one Parameter Details to proceed.");
            return;
        }
        else if (((DataTable)ViewState["ParameterDetails"]).Rows.Count == 0 && ViewState["PageMode"].ToString() == PageModes.Create.ToString())
        {
            Utility.FunShowAlertMsg(this.Page, "Add atleast one Parameter Details to proceed.");
            return;
        }

        ObjConstitutionCodeMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable ObjS3G_ORG_ConstitutionMasterDataTable = new OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable();
            OrgMasterMgtServices.S3G_ORG_ConstitutionMasterRow ObjConstitutionCodeRow;
            ObjConstitutionCodeRow = ObjS3G_ORG_ConstitutionMasterDataTable.NewS3G_ORG_ConstitutionMasterRow();
            ObjConstitutionCodeRow.Company_ID = intCompanyID;
            ObjConstitutionCodeRow.Constitution_ID = intConstitutionID;
            ObjConstitutionCodeRow.ConstitutionCode = 0;
            ObjConstitutionCodeRow.ConstitutionName = txtConstantName.Text.Trim();
            ObjConstitutionCodeRow.LOB_ID = 0;
            ObjConstitutionCodeRow.Created_By = intUserID;
            if (hdnProgramID.Value == "45" || hdnProgramID.Value == "32")
            {
                ObjConstitutionCodeRow.XMLLOBDet = strXMLCONDet;
            }
            else
                ObjConstitutionCodeRow.XMLLOBDet = strXMLLOBDet;
            if (ViewState["ParameterDetails"] != null)
            {
                ObjConstitutionCodeRow.XMLConsDocumentsDet = ((DataTable)ViewState["ParameterDetails"]).FunPubFormXml();
            }
            if (hdnProgramID.Value == string.Empty || hdnProgramID.Value == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select valid Module Description.");
                return;
            }
            ObjConstitutionCodeRow.Customer_Type = Convert.ToInt32(hdnProgramID.Value);//ddlCustomerType.SelectedValue
            ObjS3G_ORG_ConstitutionMasterDataTable.AddS3G_ORG_ConstitutionMasterRow(ObjConstitutionCodeRow);
            string ConstantCode = "-1";

            intErrCode = ObjConstitutionCodeMasterClient.FunPubCreateConstantSetup(out ConstantCode, SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_ConstitutionMasterDataTable, SerMode));

            if (intErrCode == 0)
            {
                btnSave.Enabled_False();
                if (intConstitutionID > 0)
                {
                    Utility.FunShowAlertMsg(this.Page, "Additional Parameters Definition updated successfully", strRedirectPage);
                    return;
                }
                else
                {
                    if (!string.IsNullOrEmpty(ConstantCode))
                        txtConstantCode.Text = Convert.ToString(ConstantCode);
                    strAlert = "Additional Parameters added successfully";
                    strAlert += @"\n\nWould you like to add one more Additional Parameters Definition?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    lblErrorMessage.Text = string.Empty;
                    ViewState["PageMode"] = PageModes.Create.ToString();
                    return;
                }
            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Document control not defined for Additional Parameters Definition");
                strRedirectPageView = "";
                return;

            }
            else if (intErrCode == 2)
            {
                Utility.FunShowAlertMsg(this.Page, "Document control has reach the maximium size defined.");
                strRedirectPageView = "";
                return;

            }
            else if (intErrCode == 3)
            {
                Utility.FunShowAlertMsg(this.Page, "Constant Name already exists");
                return;
            }
            lblErrorMessage.Text = string.Empty;

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjConstitutionCodeMasterClient.Close();
        }
    }

    /// <summary>
    /// This is used to save Constitution other document details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void grvConstitution_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkSel = (CheckBox)e.Row.FindControl("chkSel");
            Label lblConstitutionID = (Label)e.Row.FindControl("lblConstitutionID");
            if (lblConstitutionID.Text == hdnConstitution.Value)
            {
                chkSel.Checked = true;
            }
            e.Row.Cells[1].ToolTip = e.Row.Cells[1].Text;
            e.Row.Cells[2].ToolTip = e.Row.Cells[2].Text;
        }
    }

    /// <summary>
    /// This is used to redirect page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
    }

    /// <summary>
    /// checkbox validation for LOB
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvLOB_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblAssigned = (Label)e.Row.FindControl("lblAssigned");
            CheckBox chkSelectLOB = (CheckBox)e.Row.FindControl("chkSelectLOB");
            chkSelectLOB.Attributes.Add("onclick", "javascript:fnGridUnSelect('" + grvLOB.ClientID + "','chkSelectAllLOB','chkSelectLOB');");
            if (lblAssigned.Text == "1")
            {
                if (IsLOBCalled == false)
                {
                    if ((intConstitutionID > 0) && (strMode == "M"))
                    {
                        IsLOBCalled = true;
                        //Dictionary<string, string> Procparam = new Dictionary<string, string>();
                        //Procparam.Add("@Constitution_ID", intConstitutionID.ToString());
                        //DataTable dt_IsExists = Utility.GetDefaultData("S3G_ORG_InsertConstitutionTransactionIsExits", Procparam);
                        //if (dt_IsExists != null && dt_IsExists.Rows.Count > 0)
                        IsEnableLOB = true;
                    }
                }
                chkSelectLOB.Checked = true;
            }
            if (strMode == "Q" || strMode == "M")
            {
                chkSelectLOB.Enabled = false;
            }
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAllRole");

            CheckBox chkSelectAllLOB = (CheckBox)e.Row.FindControl("chkSelectAllLob");
            chkSelectAllLOB.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + grvLOB.ClientID + "',this,'chkSelectLOB');");
            if (ViewState["SelectAll"] != null)
            {
                bool SelectAll = bool.Parse(ViewState["SelectAll"].ToString());
                chkSelectAllLOB.Checked = SelectAll;
            }
            if (strMode == "Q" || strMode == "M")
            {
                chkSelectAllLOB.Enabled = false;
            }
        }

    }
    /// <summary>
    /// checkbox validation for Constitutional Documents
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvConsDocs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataTable dtParameterDetails = (DataTable)ViewState["ParameterDetails"];

        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                AjaxControlToolkit.CalendarExtender calFromDate = e.Row.FindControl("CEFFromDate") as AjaxControlToolkit.CalendarExtender;
                AjaxControlToolkit.CalendarExtender calToDate = e.Row.FindControl("CEFToDate") as AjaxControlToolkit.CalendarExtender;
                DropDownList ddlParamterType = e.Row.FindControl("ddlParamterType") as DropDownList;
                TextBox txtFFromDate = e.Row.FindControl("txtFFromDate") as TextBox;
                TextBox txtFToDate = e.Row.FindControl("txtFToDate") as TextBox;
                txtFFromDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtFFromDate.ClientID + "','" + strDateFormat + "',false,true);");
                txtFToDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtFToDate.ClientID + "','" + strDateFormat + "',false,true);");
                txtFFromDate.Text = DateTime.Now.ToString(strDateFormat);
                txtFToDate.Text = DateTime.Now.ToString(strDateFormat);
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                DataTable dtLookUp = new DataTable();
                Procparam.Add("@TYPE", "ORG_Paramter_Type");
                ddlParamterType.Items.Clear();
                dtLookUp = Utility.GetDefaultData("S3G_SYS_LOADPARAMETER_TYPE", Procparam);
                if (dtLookUp != null && dtLookUp.Rows.Count > 0)
                {
                    ddlParamterType.FillDataTable(dtLookUp, "Value", "Name");
                }

                calFromDate.Format = strDateFormat;
                calToDate.Format = strDateFormat;
                //txtFFromDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtFFromDate.ClientID + "','" + strDateFormat + "',true,false);");
                //if (strMode == "M" || strMode == "Q")
                if (strMode == "Q")
                {
                    grvConsDocuments.ShowFooter = false;
                }
                //else
                //    FunPriLoadParamLookup();

            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                AjaxControlToolkit.CalendarExtender calFromDate = e.Row.FindControl("CEFFromDate") as AjaxControlToolkit.CalendarExtender;
                AjaxControlToolkit.CalendarExtender calToDate = e.Row.FindControl("CEFToDate") as AjaxControlToolkit.CalendarExtender;
                LinkButton lnkbtnRemove = (LinkButton)e.Row.FindControl("btnRemove");


                if (calFromDate != null)
                    calFromDate.Format = strDateFormat;

                if (calToDate != null)
                    calToDate.Format = strDateFormat;

                if (strMode == "M" || strMode == "Q")
                    lnkbtnRemove.Visible = false;

            }

        }
        catch (Exception ex)
        {
        }
    }
    void GetLOBGridSelectedValues()
    {
        // clear the Selected LOB's
        CheckBox chkLOB;
        Label LblLOB;
        ArrayList SelectedLOBs = new ArrayList();
        foreach (GridViewRow grvData in grvLOB.Rows)
        {
            chkLOB = ((CheckBox)grvData.FindControl("chkSelectLOB"));
            LblLOB = ((Label)grvData.FindControl("lblLOBID"));
            if (chkLOB.Checked)
                SelectedLOBs.Add(int.Parse(LblLOB.Text.Trim()));
            chkLOB.Checked = false;
        }
        chkLOB = (CheckBox)grvLOB.HeaderRow.FindControl("chkSelectAllLOB");
        chkLOB.Checked = false;
        ViewState["SelectedLOBs"] = SelectedLOBs;
    }

    void ClearLOBGrid()
    {
        // clear the Selected LOB's
        CheckBox chkLOB;
        foreach (GridViewRow grvData in grvLOB.Rows)
        {
            chkLOB = ((CheckBox)grvData.FindControl("chkSelectLOB"));
            chkLOB.Checked = false;
        }
        chkLOB = (CheckBox)grvLOB.HeaderRow.FindControl("chkSelectAllLOB");
        chkLOB.Checked = false;
    }
    void LoadSelectedLOBsAgain()
    {
        ArrayList SelectedLOB;
        DataTable AllLOB = new DataTable();
        if (ViewState["SelectedLOBs"] != null)
        {
            SelectedLOB = (ArrayList)ViewState["SelectedLOBs"];
            AllLOB = (DataTable)grvLOB.DataSource;

            foreach (DataRow LOB in AllLOB.Rows)
            {
                LOB["Assigned"] = false;
            }
            foreach (DataRow LOB in AllLOB.Rows)
            {
                foreach (int sLOB in SelectedLOB)
                {
                    if (int.Parse(LOB["LOB_ID"].ToString()) == sLOB)
                    {
                        LOB["Assigned"] = true;
                    }
                }

            }
        }
        grvLOB.DataSource = AllLOB;
        grvLOB.DataBind();
    }

    /// <summary>
    /// This is used to clear data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            txtConstantName.Text = "";
            ViewState["PageMode"] = PageModes.Create.ToString();
            txtProgramName.Text = "";
            txtConstantCode.Text = "";
            //ddlEntityType.SelectedIndex = 0;
            //ddlCustomerType.SelectedIndex = 0;
            hdnConstitution.Value = "0";
            //dvCustomerType.Visible = false;
            //dvEntityType.Visible = false;
            pnlConstitution.Visible = false;
            pnllob.Visible = false;
            FunGetConstantParameterDetails();

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

    #endregion

    #region Page Methods

    private void FunGetConstantParameterDetails()
    {
        DataSet dsConstitution = new DataSet();
        ObjConstitutionCodeMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            ObjS3G_ORG_ConstitutionMasterDataTable = new OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable();
            OrgMasterMgtServices.S3G_ORG_ConstitutionMasterRow ObjConstitutionCodeRow;
            SerializationMode SerMode = SerializationMode.Binary;
            ObjConstitutionCodeRow = ObjS3G_ORG_ConstitutionMasterDataTable.NewS3G_ORG_ConstitutionMasterRow();
            ObjConstitutionCodeRow.Company_ID = intCompanyID;
            ObjConstitutionCodeRow.Constitution_ID = intConstitutionID;
            ObjConstitutionCodeRow.Created_By = intUserID;
            if (PageMode == PageModes.Query)
                ObjConstitutionCodeRow.IsQueryMode = true;
            if (PageMode == PageModes.Modify)
                ObjConstitutionCodeRow.IsQueryMode = false;

            ObjS3G_ORG_ConstitutionMasterDataTable.AddS3G_ORG_ConstitutionMasterRow(ObjConstitutionCodeRow);

            byte[] byteConstitutionCodeDetails = ObjConstitutionCodeMasterClient.FunPubQueryConstantSetupDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_ConstitutionMasterDataTable, SerMode));
            dsConstitution = (DataSet)ClsPubSerialize.DeSerialize(byteConstitutionCodeDetails, SerializationMode.Binary, typeof(DataSet));
            try
            {
                if (strMode != "" && strMode != string.Empty)
                {
                    if (dsConstitution.Tables[0] != null && dsConstitution.Tables[0].Rows.Count > 0 && hdnProgramID.Value != "45" && hdnProgramID.Value != "32" && strMode != "")
                    {
                        ViewState["GridDetails"] = dsConstitution.Tables[0];
                        if (dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString() != "45" && dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString() != "32" && dsConstitution.Tables[0].Rows.Count > 0)
                        {
                            DataView dv = new DataView(dsConstitution.Tables[0], "Assigned=1", "", DataViewRowState.CurrentRows);
                            if (dv.Count == dsConstitution.Tables[0].Rows.Count)
                                ViewState["SelectAll"] = true;
                            else
                                ViewState["SelectAll"] = false;

                            grvLOB.DataSource = dsConstitution.Tables[0];
                            grvLOB.DataBind();
                        }
                        else if (dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString() != "45" && dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString() != "32" && strMode != "")
                        {
                            grvLOB.EmptyDataText = "No Records Found.";
                            grvLOB.DataBind();
                        }
                        else if ((dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString() == "45" || dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString() == "32") && strMode != "")
                        {
                            GrvConstitution.DataSource = dsConstitution.Tables[0];
                            GrvConstitution.DataBind();
                        }
                        else
                        {
                            GrvConstitution.DataSource = "No Records Found.";
                            GrvConstitution.DataBind();
                        }
                    }
                }
            }
            catch (Exception es)
            {
                throw;
            }
            if ((dsConstitution.Tables[1].Rows.Count > 0) && hdnConstitution.Value == "0")
            {
                txtConstantCode.Text = dsConstitution.Tables[1].Rows[0]["CONSTANT_CODE"].ToString();
                txtConstantName.Text = dsConstitution.Tables[1].Rows[0]["CONSTANT_NAME"].ToString();
                txtProgramName.Text = dsConstitution.Tables[1].Rows[0]["PROGRAM_NAME"].ToString();
                hdnProgramID.Value = dsConstitution.Tables[1].Rows[0]["PROGRAM_ID"].ToString();
                ListItem lst;
                if (hdnProgramID.Value == "45")
                {
                    //dvCustomerType.Visible = true;
                    //dvEntityType.Visible = false;
                    pnlConstitution.Visible = true;
                    pnlConstitution.GroupingText = "Constitution Details";
                    GrvConstitution.Columns[1].HeaderText = "Constitution Name";
                    //lst = new ListItem(dsConstitution.Tables[1].Rows[0]["PARAM_REF"].ToString(), dsConstitution.Tables[1].Rows[0]["PARAM_REF"].ToString());
                    //ddlCustomerType.Items.Add(lst);
                    //ddlCustomerType.SelectedValue = dsConstitution.Tables[1].Rows[0]["PARAM_REF"].ToString();
                }
                else if (hdnProgramID.Value == "32")
                {
                    pnlConstitution.Visible = true;
                    pnlConstitution.GroupingText = "Entity Type Details";
                    GrvConstitution.Columns[1].HeaderText = "Entity Type";
                    //dvCustomerType.Visible = false;
                    //dvEntityType.Visible = true;
                    //lst = new ListItem(dsConstitution.Tables[1].Rows[0]["PARAM_REF"].ToString(), dsConstitution.Tables[1].Rows[0]["PARAM_REF"].ToString());
                    //ddlEntityType.Items.Add(lst);
                    //ddlEntityType.SelectedValue = dsConstitution.Tables[1].Rows[0]["PARAM_REF"].ToString();
                }
                else
                {
                    pnllob.Visible = true;
                    pnlConstitution.Visible = false;
                }
                //ddlCustomerType.SelectedValue = dsConstitution.Tables[1].Rows[0]["CUSTOMER_CLASSIFICATION"].ToString();

            }
            ViewState["ParameterDetails"] = dsConstitution.Tables[2];
            if (ViewState["PageMode"].ToString() == PageModes.Create.ToString())
            {
                if (!dsConstitution.Tables[2].Columns.Contains("Sno"))
                    dsConstitution.Tables[2].Columns.Add("Sno", typeof(System.Int16));
                ViewState["Documents"] = dsConstitution.Tables[2].Clone();
                //AddNewRowTable("", "", false, false, "");
                //grvConsDocuments.Columns[4].Visible = true;
                FunPubBindDummyGrid();
            }
            else if (ViewState["PageMode"].ToString() == PageModes.Modify.ToString())
            {
                BindGrid(dsConstitution.Tables[2]);
                ViewState["Documents"] = dsConstitution.Tables[2].Copy();

            }
            else if (ViewState["PageMode"].ToString() == PageModes.Delete.ToString() || ViewState["PageMode"].ToString() == PageModes.Query.ToString())
            {
                BindGrid(dsConstitution.Tables[2]);
            }
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            dsConstitution.Dispose();
            dsConstitution = null;
        }
    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chkSelct = (CheckBox)sender;
            chkSelct.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void BindGrid(DataTable dtConstitutions)
    {
        grvConsDocuments.DataSource = dtConstitutions;
        grvConsDocuments.DataBind();
        ViewState["ParameterDetails"] = dtConstitutions;
    }

    private int FunPriGenerateLOBDocDet()
    {
        try
        {
            string strLOBID = string.Empty;
            string strlblPARAM_LOB_DET_ID = string.Empty;
            string strOptMan = string.Empty;
            string strImageCopy = string.Empty;
            string strRemarks = string.Empty;

            strbLOBDet.Append("<Root>");
            CheckBox chkLOB = null;
            CheckBox chkConsDoc = null;
            RequiredFieldValidator rfvRemarks = null;
            bool isAtleastOneLOBSelected = false;
            foreach (GridViewRow grvData in grvLOB.Rows)
            {
                chkLOB = ((CheckBox)grvData.FindControl("chkSelectLOB"));
                if (chkLOB.Checked)
                {
                    isAtleastOneLOBSelected = true;
                    strlblPARAM_LOB_DET_ID = ((Label)grvData.FindControl("lblPARAM_LOB_DET_ID")).Text;
                    strLOBID = ((Label)grvData.FindControl("lblLOBID")).Text;
                    strbLOBDet.Append(" <Details LOB_ID='" + strLOBID + "' /> ");
                }
            }
            if (isAtleastOneLOBSelected == false)
                return 3;
            strbLOBDet.Append("</Root>");
            strXMLLOBDet = strbLOBDet.ToString();
            strbConsDocumentsDet.Append("<Root>");
            return 0;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    string formatXMLString(string newString)
    {
        // >
        newString = newString.Replace(">", "&gt;");
        //  <
        newString = newString.Replace("<", "&lt;");
        //&
        newString = newString.Replace("&", "&amp;");
        newString = newString.Replace("'", "&apos;");

        return newString;
    }

    //This is used to implement User Authorization

    private void FunPriDisableControls(int intModeID)
    {

        switch (intModeID)
        {
            case 0: // Create Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);

                if (!bCreate)
                {
                    btnSave.Enabled_False();
                }
                break;

            case 1: // Modify Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                if (!bModify)
                {
                    btnSave.Enabled_False();
                }
                trConstitutionCode.Visible = true;
                txtConstantCode.Enabled = false;
                txtConstantName.Enabled = true;
                lnkCopyProfile.Visible = false;
                txtConstantCode.ReadOnly = true;
                txtConstantName.ReadOnly = true;
                txtProgramName.ReadOnly = true;
                //ddlEntityType.Enabled = false;
                //ddlCustomerType.Enabled = false;
                btnClear.Enabled_False();
                break;

            case -1:// Query Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPage, false);
                }
                trConstitutionCode.Visible = true;
                txtConstantCode.ReadOnly = true;
                txtConstantName.ReadOnly = true;
                //ddlEntityType.Enabled = false;
                //ddlCustomerType.Enabled = false;
                //ddlCustomerType.ClearDropDownList();
                txtProgramName.ReadOnly = true;
                lnkCopyProfile.Visible = false;
                btnClear.Enabled_False();
                btnSave.Enabled_False();
                break;
        }

    }

    //Code end

    #endregion

    #region Foorer row Add Button - To add Other Document Type
    protected void btnAddDocType_Click(object sender, EventArgs e)
    {
        DropDownList ddlDocCatGird = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlDocCatGird");
        TextBox txtOthersGrid = (TextBox)grvConsDocuments.FooterRow.FindControl("txtOthersGrid");
        if (ddlDocCatGird.SelectedValue == "0")
        {
            Utility.FunShowAlertMsg(this.Page, "Select the Document Category");
            ddlDocCatGird.Focus();
            return;
        }
        else if (txtOthersGrid.Text.Trim() == "")
        {
            Utility.FunShowAlertMsg(this.Page, "Enter the Document Description");
            txtOthersGrid.Focus();
            return;
        }

        PRDDCMgtServicesReference.PRDDCMgtServicesClient ObjPRDDCMasterClient;
        PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
        PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
        ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();
        try
        {
            ObjPRDDCRow.DocType = "Consti";
            ObjPRDDCRow.DocCategory = ddlDocCatGird.SelectedValue;
            ObjPRDDCRow.DocDesc = txtOthersGrid.Text;
            ObjPRDDCRow.Created_By = intUserID;

            ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);
            ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
            intErrCode = ObjPRDDCMasterClient.FunPubCreateOtherDocDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));

            if (intErrCode == 0)
            {
                Utility.FunShowAlertMsg(this.Page, "Constitution other document added successfully");
                if (Request.QueryString["qsConstitutionId"] != null)
                    intConstitutionID = Convert.ToInt32(Request.QueryString["qsConstitutionId"]);
                FunGetConstantParameterDetails();
            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Constitution other document already exists");
            }
            lblErrorMessage.Text = string.Empty;

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjPRDDCMasterClient.Close();
        }
    }
    #endregion

    #region "grvConstitution Row Created event "
    protected void grvConstitution_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridView grvSender = (GridView)sender;

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal ||
            e.Row.RowState == DataControlRowState.Alternate))
        {
            CheckBox chkBoxSelect = (CheckBox)e.Row.FindControl("chkSel");
            chkBoxSelect.Attributes["onclick"] = string.Format
            (
            "javascript:fnDGUnselectAllExpectSelected('{0}',this);",
            grvSender.ClientID
            );
        }
    }
    #endregion

    protected void RemoveRow(object sender, EventArgs e)
    {
        LinkButton lnkRemovePRDDC = (LinkButton)sender;
        GridViewRow gvRow = (GridViewRow)lnkRemovePRDDC.Parent.Parent;
        Label lbl = gvRow.FindControl("lblConstSNo") as Label;
        removeRow(lbl.Text);
    }
    void removeRow(string sno)
    {
        DataTable dtConstitutions = ViewState["ParameterDetails"] as DataTable;
        DataRow[] dtrRow = dtConstitutions.Select("Sno=" + sno);
        if (dtrRow.Length > 0)
            dtConstitutions.Rows.Remove(dtrRow[0]);
        dtConstitutions.AcceptChanges();
        if (dtConstitutions.Rows.Count > 0)
        {
            grvConsDocuments.DataSource = dtConstitutions;
            grvConsDocuments.DataBind();
        }
        else
        {
            FunPubBindDummyGrid();
        }
    }

    [WebMethod]
    public static string[] getDocumentsList(String prefixText, int count)
    {
        List<String> suggetions = null;
        DataTable dtDesc = new DataTable();
        try
        {
            if (System.Web.HttpContext.Current.Session["dtConCodes"] != null)
            {
                dtDesc = (DataTable)System.Web.HttpContext.Current.Session["dtConCodes"];
                suggetions = GetDescription(prefixText, count, dtDesc);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return suggetions.ToArray();
    }

    private static List<String> GetDescription(string key, int count, DataTable dt1)
    {
        List<String> suggestions = new List<string>();
        try
        {
            string filterExpression = "Document_Description like '" + key + "%'";
            DataRow[] dtSuggestions = dt1.Select(filterExpression);
            foreach (DataRow dr in dtSuggestions)
            {
                string suggestion = dr["Document_Description"].ToString();
                suggestions.Add(suggestion);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
        return suggestions;
    }


    protected void ddlParamterType_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlParamterType = (DropDownList)sender;
        RequiredFieldValidator rfvtxtFParamterValue = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvtxtFParamterValue");
        RequiredFieldValidator rfvrbnType = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvrbnType");
        RequiredFieldValidator rfvtxtFLookupName = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvtxtFLookupName");
        RequiredFieldValidator RFVddlLookupVales = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("RFVddlLookupVales");
        RangeValidator rgvFParamterValue = (RangeValidator)grvConsDocuments.FooterRow.FindControl("rgvFParamterValue");
        TextBox txtFParamter = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFParamterValue");
        txtFParamter.Text = string.Empty;
        if (ddlParamterType.SelectedValue != "0")
        {
            //grvConsDocuments.Columns[3].Visible = false;
            if (ddlParamterType.SelectedValue == "5")
            {
                rfvrbnType.Enabled = true;
                rfvtxtFParamterValue.Enabled = true;
                rfvtxtFLookupName.Enabled = true;
            }
            else if (ddlParamterType.SelectedValue == "4")
            {
                rfvrbnType.Enabled = false;
                rfvtxtFParamterValue.Enabled = false;
                rfvtxtFLookupName.Enabled = false;
                RFVddlLookupVales.Enabled = false;
            }
            else
            {
                rfvrbnType.Enabled = false;
                rfvtxtFParamterValue.Enabled = true;
                rfvtxtFLookupName.Enabled = false;
            }
            if (ddlParamterType.SelectedValue == "1" || ddlParamterType.SelectedValue == "2" || ddlParamterType.SelectedValue == "3")//Number
            {
                //grvConsDocuments.Columns[3].Visible = true;
                //grvConsDocuments.Columns[4].Visible = false;
                TextBox txtFParamterValue = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFParamterValue");
                DropDownList ddlLookupVales = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlLookupVales");
                TextBox txtFLookupName = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFLookupName");
                ddlLookupVales.Visible = false;
                txtFParamterValue.ReadOnly = false;
                txtFParamterValue.Visible = true;
                RadioButtonList rbnType = (RadioButtonList)grvConsDocuments.FooterRow.FindControl("rbnType");
                rbnType.Visible = false;
                rfvtxtFParamterValue.Enabled = true;
                txtFLookupName.Visible = false;
            }
            if (ddlParamterType.SelectedValue == "5")//Lookup
            {
                if (hdnProgramID.Value == "")
                {
                    Utility.FunShowAlertMsg(this.Page, "Select the Module Description.");
                    FunPriLoadParamLookup();
                    return;
                }
                TextBox txtFParamterValue = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFParamterValue");
                TextBox txtFLookupName = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFLookupName");
                //grvConsDocuments.Columns[3].Visible = false;
                //grvConsDocuments.Columns[4].Visible = true;
                RadioButtonList rbnType = (RadioButtonList)grvConsDocuments.FooterRow.FindControl("rbnType");
                rbnType.Visible = true;
                txtFParamterValue.Visible = false;
                txtFLookupName.Visible = false;
                rfvtxtFParamterValue.Enabled = true;
            }
            if (ddlParamterType.SelectedValue == "4")//Date
            {
                TextBox txtFParamterValue = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFParamterValue");
                TextBox txtFLookupName = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFLookupName");
                txtFParamterValue.ReadOnly = true;
                txtFParamterValue.Visible = true;
                txtFLookupName.Visible = false;
                RadioButtonList rbnType = (RadioButtonList)grvConsDocuments.FooterRow.FindControl("rbnType");
                rbnType.Visible = false;
                rfvtxtFParamterValue.Enabled = false;
            }
            if (ddlParamterType.SelectedValue == "3")
            {
                rgvFParamterValue.Enabled = true;
            }
            else
            {
                rgvFParamterValue.Enabled = false;
            }
        }
        //else
        //{
        //    grvConsDocuments.Columns[2].Visible = false;
        //}
    }
    protected void grvConsDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            DataTable dtParameterDetails = (DataTable)ViewState["ParameterDetails"];
            DataRow dRow;
            if (e.CommandName == "Add")
            {
                //Label lbl = (Label)grvConsDocuments.Rows[grvConsDocuments.Rows.Count - 1].FindControl("lblConstSNo");
                int intSNo = 1; // (Convert.ToInt32(lbl.Text)) + 1;
                Label lblParamid = (Label)grvConsDocuments.HeaderRow.FindControl("lblPARAM_ID");
                TextBox txtFParamterName = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFParamterName");
                DropDownList ddlParamterType = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlParamterType");
                TextBox txtFParamterValue = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFParamterValue");
                DropDownList ddlLookupVales = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlLookupVales");
                TextBox txtFLookupName = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFLookupName");
                TextBox txtFFromDate = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFFromDate");
                TextBox txtFToDate = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFToDate");
                RequiredFieldValidator rfvtxtFParamterValue = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvtxtFParamterValue");
                RequiredFieldValidator rfvrbnType = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvrbnType");
                RequiredFieldValidator rfvtxtFLookupName = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvtxtFLookupName");
                RequiredFieldValidator RFVddlLookupVales = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("RFVddlLookupVales");
                string strCommlengthlookup = "";
                if (txtFParamterValue.Text != string.Empty)
                {
                    strCommlengthlookup = txtFParamterValue.Text;
                }
                else if (ddlLookupVales.SelectedValue != "" && ddlLookupVales.SelectedValue != "0")
                {
                    strCommlengthlookup = ddlLookupVales.SelectedItem.Text;
                }
                else if (txtFLookupName.Text != string.Empty)
                {
                    strCommlengthlookup = txtFLookupName.Text;
                }
                else
                {
                    strCommlengthlookup = "";
                }
                if ((!string.IsNullOrEmpty(txtFFromDate.Text)) && (!string.IsNullOrEmpty(txtFFromDate.Text)))
                {
                    if (Convert.ToInt32(Utility.StringToDate(txtFFromDate.Text).ToString("yyyyMMdd")) > Convert.ToInt32(Utility.StringToDate(txtFToDate.Text).ToString("yyyyMMdd")))
                    {
                        Utility.FunShowAlertMsg(this, "From Date should not be Greater than To Date");
                        txtFFromDate.Text = string.Empty;
                        return;
                    }
                }
                DataRow[] drDuplicate = dtParameterDetails.Select("PARAM_NAME ='" + txtFParamterName.Text + "' and PARAM_DATA_TYPE = " + ddlParamterType.SelectedValue + " and LENGTH_OR_LOOKUP_COMM = '" + strCommlengthlookup.Trim() + "'");
                if (drDuplicate.Length > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Parameter Details", "alert('Selected Combinations already Exists');", true);
                    return;
                }
                dRow = dtParameterDetails.NewRow();
                dRow["Sno"] = (Convert.ToInt32(1) + 1).ToString();
                dRow["PARAM_DET_ID"] = 0;
                dRow["PARAM_ID"] = 0;
                dRow["PARAM_NAME"] = txtFParamterName.Text;
                if (txtFParamterValue.Text != string.Empty)
                {
                    dRow["LENGTH_OR_LOOKUP_COMM"] = txtFParamterValue.Text;
                }
                else if (ddlLookupVales.SelectedValue != "" && ddlLookupVales.SelectedValue != "0")
                {
                    dRow["LENGTH_OR_LOOKUP_COMM"] = ddlLookupVales.SelectedItem.Text;
                }
                else if (txtFLookupName.Text != string.Empty)
                {
                    dRow["LENGTH_OR_LOOKUP_COMM"] = txtFLookupName.Text;
                }
                else
                {
                    dRow["LENGTH_OR_LOOKUP_COMM"] = "";
                }
                dRow["PARAM_DATA_TYPE"] = ddlParamterType.SelectedValue;
                dRow["Param_Type_Desc"] = ddlParamterType.SelectedItem.Text;
                if (ddlLookupVales.SelectedValue == "0" || ddlLookupVales.SelectedValue == "")
                {
                    dRow["PARAM_LOOK_TYPE_DESC"] = "";
                    dRow["PARAM_LOOK_TYPE_ID"] = 0;
                }
                else
                {
                    dRow["PARAM_LOOK_TYPE_DESC"] = ddlLookupVales.SelectedItem.Text;
                    dRow["PARAM_LOOK_TYPE_ID"] = ddlLookupVales.SelectedValue;
                }
                if (txtFParamterValue.Text == null || txtFParamterValue.Text == string.Empty)
                {
                    dRow["PARAM_DATA_LENGTH"] = 0;
                }
                else
                {
                    dRow["PARAM_DATA_LENGTH"] = txtFParamterValue.Text;
                }
                dRow["PARAM_NEW_LOOK_TYPE"] = txtFLookupName.Text;
                dRow["EFFECTIVE_FROM_DATE"] = txtFFromDate.Text;
                dRow["EFFECTIVE_TO_DATE"] = txtFToDate.Text;
                dtParameterDetails.Rows.Add(dRow);
                grvConsDocuments.DataSource = dtParameterDetails;
                grvConsDocuments.DataBind();
                ViewState["ParameterDetails"] = dtParameterDetails;
                FunPriLoadParamLookup();
                FunPriLoadLookup();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Cons");

        }
        finally
        {
        }
    }

    #region Propertites
    protected void txtProgramName_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (hdnProgramID.Value == string.Empty || hdnProgramID.Value == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select valid Module Description.");
                return;
            }
            FunPriGetDetails();
            DataTable dt = new DataTable();
            dt = (DataTable)ViewState["GridDetails"];
            if (txtProgramName.Text == string.Empty)
            {
                hdnProgramID.Value = string.Empty;
            }
            if (hdnProgramID.Value == "45")
            {
                //dvCustomerType.Visible = true;
                //dvEntityType.Visible = false;
                //rfvcustomer.Enabled = true;
                //rfvEntitytype.Enabled = false;
                pnlConstitution.Visible = true;
                pnlConstitution.GroupingText = "Constitution Details";
                pnllob.Visible = false;
                pnlConstitution.Visible = true;
                GrvConstitution.DataSource = dt;
                GrvConstitution.DataBind();
            }
            else if (hdnProgramID.Value == "32")
            {
                //dvEntityType.Visible = true;
                //dvCustomerType.Visible = false;
                //rfvcustomer.Enabled = false;
                //rfvEntitytype.Enabled = true;
                pnlConstitution.Visible = true;
                pnlConstitution.GroupingText = "Entity Type Details";
                pnllob.Visible = false;
                pnlConstitution.Visible = true;
                GrvConstitution.DataSource = dt;
                GrvConstitution.DataBind();
            }
            else
            {
                //dvCustomerType.Visible = false;
                //dvEntityType.Visible = false;
                //rfvcustomer.Enabled = false;
                //rfvEntitytype.Enabled = false;
                pnllob.Visible = true;
                pnlConstitution.Visible = false;
                grvLOB.DataSource = dt;
                grvLOB.DataBind();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    protected void rbnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadioButtonList rbnType = (RadioButtonList)sender;
        if (rbnType.SelectedValue != "0")
        {
            TextBox txtFLookupName = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFLookupName");
            Label lblLookupNames = (Label)grvConsDocuments.FooterRow.FindControl("lblLookupNames");
            DropDownList ddlLookupVales = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlLookupVales");
            RequiredFieldValidator rfvtxtFLookupName = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("rfvtxtFLookupName");
            RequiredFieldValidator RFVddlLookupVales = (RequiredFieldValidator)grvConsDocuments.FooterRow.FindControl("RFVddlLookupVales");
            FunPriLoadLookup();
            lblLookupNames.Visible = false;


            if (rbnType.SelectedValue == "1")
            {
                txtFLookupName.Visible = true;
                ddlLookupVales.Visible = false;
                rfvtxtFLookupName.Enabled = true;
            }
            else
            {
                txtFLookupName.Visible = false;
                ddlLookupVales.Visible = true;
                RFVddlLookupVales.Enabled = true;
            }
        }
        else
        {
            grvConsDocuments.Columns[2].Visible = false;
        }
    }
    private void FunPubBindDummyGrid()
    {
        try
        {
            DataTable dtRoles = new DataTable();
            DataRow dr;
            dtRoles.Columns.Add("Sno");
            dtRoles.Columns.Add("PARAM_DET_ID");
            dtRoles.Columns.Add("PARAM_ID");
            dtRoles.Columns.Add("PARAM_NAME");
            dtRoles.Columns.Add("LENGTH_OR_LOOKUP_COMM");
            dtRoles.Columns.Add("PARAM_DATA_TYPE");
            dtRoles.Columns.Add("Param_Type_Desc");
            dtRoles.Columns.Add("PARAM_DATA_LENGTH");
            dtRoles.Columns.Add("PARAM_LOOK_TYPE_ID");
            dtRoles.Columns.Add("PARAM_LOOK_TYPE_DESC");
            dtRoles.Columns.Add("PARAM_NEW_LOOK_TYPE");
            dtRoles.Columns.Add("EFFECTIVE_FROM_DATE");
            dtRoles.Columns.Add("EFFECTIVE_TO_DATE");
            dr = dtRoles.NewRow();
            dr["Sno"] = "";
            dr["PARAM_DET_ID"] = 0;
            dr["PARAM_ID"] = 0;
            dr["PARAM_NAME"] = 1;
            dr["LENGTH_OR_LOOKUP_COMM"] = "";
            dr["PARAM_DATA_TYPE"] = string.Empty;
            dr["Param_Type_Desc"] = string.Empty;
            dr["PARAM_DATA_LENGTH"] = 0;
            dr["PARAM_LOOK_TYPE_ID"] = 0;
            dr["PARAM_LOOK_TYPE_DESC"] = string.Empty;
            dr["PARAM_NEW_LOOK_TYPE"] = string.Empty;
            dr["EFFECTIVE_FROM_DATE"] = string.Empty; // DateTime.Now.Date.ToString();
            dr["EFFECTIVE_TO_DATE"] = string.Empty;
            dtRoles.Rows.Add(dr);
            grvConsDocuments.DataSource = dtRoles;
            grvConsDocuments.DataBind();
            dtRoles.Rows[0].Delete();
            ViewState["ParameterDetails"] = dtRoles;
            grvConsDocuments.Rows[0].Visible = false;
            FunPriLoadParamLookup();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Cons");

        }
        finally
        {
        }
    }
    private void FunPriLoadLookup()
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        DataSet dsLookUp = new DataSet();
        Procparam.Add("@COMPANY_ID", intCompanyID.ToString());
        Procparam.Add("@PROGRAM_ID", hdnProgramID.Value);
        DropDownList ddlLookupVales = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlLookupVales");
        ddlLookupVales.Items.Clear();
        dsLookUp = Utility.GetDataset("S3G_SYS_MANULLOOKUP", Procparam);
        if (dsLookUp.Tables[0] != null && dsLookUp.Tables[0].Rows.Count > 0)
        {
            ddlLookupVales.FillDataTable(dsLookUp.Tables[0], "Value", "Name");
        }
    }
    private void FunPriLoadParamLookup()
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        DataTable dtLookUp = new DataTable();
        Procparam.Add("@TYPE", "ORG_Paramter_Type");
        DropDownList ddlParamterType = (DropDownList)grvConsDocuments.FooterRow.FindControl("ddlParamterType");
        ddlParamterType.Items.Clear();
        dtLookUp = Utility.GetDefaultData("S3G_SYS_LOADPARAMETER_TYPE", Procparam);
        if (dtLookUp != null && dtLookUp.Rows.Count > 0)
        {
            ddlParamterType.FillDataTable(dtLookUp, "Value", "Name");
        }
    }
    #endregion

    [System.Web.Services.WebMethod]
    public static string[] GetProgramName(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@User_ID", System.Web.HttpContext.Current.Session["AutoSuggestUserID"].ToString());
        Procparam.Add("@PrefixText", prefixText.Trim());
        Procparam.Add("@Type", "2");
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_PRGNAMEDUSER", Procparam));
        return suggetions.ToArray();
    }
    protected void grvConsDocuments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dtDelete = (DataTable)ViewState["ParameterDetails"];
        dtDelete.Rows.RemoveAt(e.RowIndex);
        grvConsDocuments.DataSource = dtDelete;
        grvConsDocuments.DataBind();
        ViewState["ParameterDetails"] = dtDelete;
        if (dtDelete.Rows.Count == 0)
        {
            FunPubBindDummyGrid();
        }
    }
    protected void txtFFromDate_TextChanged(object sender, EventArgs e)
    {
        TextBox txtFFromDate = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFFromDate");
        string strDate = DateTime.Now.ToString(strDateFormat);
        if (!string.IsNullOrEmpty(txtFFromDate.Text))
        {
            if (Utility.StringToDate(txtFFromDate.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat))) //(Convert.ToInt32(Utility.StringToDate(txtFFromDate.Text)) < Convert.ToInt32(Utility.StringToDate(strDate)))
            {
                Utility.FunShowAlertMsg(this, "Selected date cannot be less than system date.");
                txtFFromDate.Text = string.Empty;
                return;
            }
        }
    }
    protected void txtFToDate_TextChanged(object sender, EventArgs e)
    {
        TextBox txtFToDate = (TextBox)grvConsDocuments.FooterRow.FindControl("txtFToDate");
        if (!string.IsNullOrEmpty(txtFToDate.Text))
        {
            if (Utility.StringToDate(txtFToDate.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
            {
                Utility.FunShowAlertMsg(this, "Selected date cannot be less than system date.");
                txtFToDate.Text = string.Empty;
                return;
            }
        }
    }

    //private void FunPriLoadCommonData()
    //{
    //    try
    //    {
    //        Dictionary<string, string> Procparam = new Dictionary<string, string>();
    //        Procparam.Clear();
    //        Procparam.Add("@Option", "1");
    //        ddlEntityType.BindDataTable(SPNames.S3G_ORG_GetEntity_List, Procparam, new string[] { "ENTITY_TYPE_ID", "ENTITY_TYPE_Name" });
    //        Procparam.Clear();
    //        Procparam.Add("@Option", "1");
    //        Procparam.Add("@Param1", "CUSTOMER_TYPE");
    //        ddlCustomerType.BindDataTable("S3G_OR_GET_CUSTLOOKUP", Procparam, true, "--Select--", new string[] { "ID", "NAME" });
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //    }
    //}
    private int FunPriGenerateConDocDet()
    {
        try
        {
            string strCONSTITUTION_ID = string.Empty;

            strbCONDet.Append("<Root>");
            CheckBox chkSelect0 = null;
            bool isAtleastOneCONSelected = false;

            foreach (GridViewRow grvData in GrvConstitution.Rows)
            {
                chkSelect0 = ((CheckBox)grvData.FindControl("chkSelect0"));
                if (chkSelect0.Checked)
                {
                    isAtleastOneCONSelected = true;
                    strCONSTITUTION_ID = ((Label)grvData.FindControl("lblConstitution_Id")).Text;
                    strbCONDet.Append(" <Details ID='" + strCONSTITUTION_ID + "' /> ");
                }
            }
            if (isAtleastOneCONSelected == false)
                return 1;
            strbCONDet.Append("</Root>");
            strXMLCONDet = strbCONDet.ToString();

            return 0;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void FunPriGetDetails()
    {
        try
        {
            DataSet DS = new DataSet();
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@PARAM_ID", Convert.ToString(intConstitutionID));
            dictParam.Add("@User_ID", Convert.ToString(intUserID));
            dictParam.Add("@PROGRAM_TYPE", Convert.ToString(hdnProgramID.Value));
            if (strMode == "Q")
            {
                dictParam.Add("@IsQueryMode", "1");
            }
            else
                dictParam.Add("@IsQueryMode", "0");
            DS = Utility.GetDataset("S3G_SYS_GET_CONSPARAMDET", dictParam);
            DataTable dt1 = new DataTable();
            if (DS.Tables[0].Rows.Count > 0)
            {
                ViewState["GridDetails"] = DS.Tables[0];
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void GrvConstitution_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblAssigned = (Label)e.Row.FindControl("lblChked0");
                CheckBox chkSelect0 = (CheckBox)e.Row.FindControl("chkSelect0");

                if (lblAssigned.Text == "1")
                {
                    chkSelect0.Checked = true;
                }
                if (strMode == "Q")
                {
                    chkSelect0.Enabled = false;
                }
                if (strMode == "Q" || strMode == "M")
                {
                    chkSelect0.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
}