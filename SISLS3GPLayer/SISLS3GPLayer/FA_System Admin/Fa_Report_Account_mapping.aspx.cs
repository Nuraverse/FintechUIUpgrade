using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
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

public partial class System_Admin_Fa_Report_Account_mapping : ApplyThemeForProject_FA
{

    #region Initialization
    int intErrCode = 0;
    int intAuthorizationId = 0;
    int intCompanyID = 0;
    int intUserID = 0;
    int intRowcnt = 0;
    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    bool bClearList = false;
    //Code end 
    static string strPageName = "Report Account Mapping";
    string strRedirectPage = "../Financial Accounting/FA_AuthorisationRuleCard_View.aspx";
    DataSet DsAuthorizatioRulecard = new DataSet();
    string strConnectionName;
    FASession objFASession = new FASession();
    StringBuilder strRulecardDetail;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    DataTable dtRuleCardDetails = new DataTable();
    FASerializationMode SerMode = FASerializationMode.Binary;
    FATranMasterMgtServiceReference.FATranMasterMgtServicesClient ObjAuthorizationRuleCardClient;


    FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable ObjFA_AuthorizationRuleCard_DataTable = new FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable();
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;
            bClearList = Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings.Get("ClearListValues"));
            strConnectionName = objFASession.ProConnectionName;
            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            //Code end

            if (Request.QueryString["qsARC_ID"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsARC_ID"));
                intAuthorizationId = Convert.ToInt32(fromTicket.Name);
                strMode = Request.QueryString.Get("qsMode").ToString();
            }
            if (!IsPostBack)
            {
                if (intAuthorizationId > 0)
                {
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    FunPubBindMasterDetails();
                    btnClear.Enabled = false;
                }
                else
                {
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    FunPubBindMasterDetails();
                    ChkActive.Enabled = false;
                }
                //User Authorization

                if ((intAuthorizationId > 0) && (strMode == "M"))
                {

                    FunPriDisableControls(1);


                }
                else if ((intAuthorizationId > 0) && (strMode == "Q")) // Query // Modify
                {
                    FunPriDisableControls(-1);

                }
                else
                {
                    FunPriDisableControls(0);
                }

                //Code end
                //ddlActivity.Focus();
            }
        }
        catch (Exception ex)
        {

            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            lblErrorMessage.Text = ex.Message;
        }
    }
    #endregion

    #region Page Methods

    //This is used to implement User Authorization

    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    if (!bCreate)
                    {
                        btnSave.Enabled = false;
                    }

                   
                    hdnGrvCnt.Value = grvAuthorizationrulecardDetail.Rows.Count.ToString();

                    break;

                case 1: // Modify Mode

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    if (!bModify)
                    {
                        btnSave.Enabled = false;
                    }
                    btnClear.Enabled = false;

                    DisableMasterControls();

                    //for (int i = 0; i <= grvAuthorizationrulecardDetail.Rows.Count - 1; i++)
                    //{
                    //    LinkButton btnRemove = (LinkButton)grvAuthorizationrulecardDetail.Rows[i].FindControl("btnRemove");
                    //    TextBox ToAmount = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txtToAmount");
                    //    TextBox FromAmount = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txtFromAmount");
                    //    TextBox Totalapproval = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txttotalapproval");
                    //    TextBox Level4approvals = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txtlevel4approvals");
                    //    TextBox txtaddFromAmt1 = (TextBox)grvAuthorizationrulecardDetail.FooterRow.FindControl("txtAddFromAmount");
                    //    txtaddFromAmt1.Text = Convert.ToString(Convert.ToDecimal(ToAmount.Text.Trim()) + Convert.ToInt32("1"));
                    //    FromAmount.ReadOnly = ToAmount.ReadOnly = true;
                    //    //btnRemove.Enabled = false;
                    //}
                    //if ((intAuthorizationId > 0) && (strMode == "M"))
                    //{

                    //    //for (int i = 0; i <=grvAuthorizationrulecardDetail.Rows.Count-1; i++)
                    //    //{
                    //    //    LinkButton btnRemove = (LinkButton)grvAuthorizationrulecardDetail.Rows[i].FindControl("btnRemove");
                    //    //    if (i < Convert.ToInt32(hdnGrvCnt.Value)-1)
                    //    //        btnRemove.Enabled = false;
                    //    //    else
                    //    //        btnRemove.Enabled = true;
                    //    //}
                    //}

                    //foreach (GridViewRow grv in grvAuthorizationrulecardDetail.Rows)
                    //{
                    //    DataSet ds = new DataSet();
                    //    DataTable dt = new DataTable();
                    //    ds.Tables.Add((DataTable)Session["Trans"]);
                    //    ds.Tables[0].TableName = "dt";
                    //    DataRow dtrow = dt.Rows[0];
                    //    //TextBox txtFromAmount = (TextBox)(grvAuthorizationrulecardDetail).FindControl("txtFromAmount");
                    //    //TextBox txtToAmount = (grvAuthorizationrulecardDetail).FindControl("txtToAmount") as TextBox;
                    //    //TextBox txttotalapproval = (grvAuthorizationrulecardDetail).FindControl("txttotalapproval") as TextBox;
                    //    //TextBox txtlevel4approvals = (grvAuthorizationrulecardDetail).FindControl("txtlevel4approvals") as TextBox;
                    //    LinkButton btnRemove = (LinkButton)grv.FindControl("btnRemove");
                    //    if (dtrow["trans"].ToString() == "False")
                    //    {

                    //        //txtFromAmount.ReadOnly = txtToAmount.ReadOnly = txttotalapproval.ReadOnly = txtlevel4approvals.ReadOnly = false;
                    //        btnRemove.Enabled = true;
                    //        for (int i = 0; i <= grvAuthorizationrulecardDetail.Rows.Count - 1; i++)
                    //        {
                    //            LinkButton remove = (LinkButton)grvAuthorizationrulecardDetail.Rows[i].FindControl("btnRemove");
                    //            if (i < Convert.ToInt32(hdnGrvCnt.Value) - 1)
                    //                remove.Enabled = false;
                    //            else
                    //                remove.Enabled = true;
                    //        }
                    //    }
                    //    else
                    //    {
                    //        //txtFromAmount.ReadOnly = txtToAmount.ReadOnly = txttotalapproval.ReadOnly = txtlevel4approvals.ReadOnly = true;
                    //        btnRemove.Enabled = false;
                    //    }
                    //}


                    break;

                case -1:// Query Mode

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPage);
                    }

                    btnClear.Enabled = false;
                    btnSave.Enabled = false;
                    ChkActive.Enabled = false;

                    if (bClearList)
                    {


                        //if (ddlprogram.Items.Count > 0)
                        //    ddlprogram.ClearDropDownList_FA();

                    }



                    DisableMasterControls();

                    //for (int i = 0; i <= grvAuthorizationrulecardDetail.Rows.Count - 1; i++)
                    //{
                    //    TextBox FromAmount = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txtFromAmount");
                    //    TextBox ToAmount = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txtToAmount");
                    //    TextBox Totalapproval = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txttotalapproval");
                    //    TextBox Level4approvals = (TextBox)grvAuthorizationrulecardDetail.Rows[i].FindControl("txtlevel4approvals");
                    //    LinkButton Remove = (LinkButton)grvAuthorizationrulecardDetail.Rows[i].FindControl("btnRemove");
                    //    FromAmount.ReadOnly = ToAmount.ReadOnly = true;
                    //    Remove.Enabled = false;
                    //}

                    //ChkActive.Enabled = false;


                    //grvAuthorizationrulecardDetail.FooterRow.Visible = false;
                    //grvAuthorizationrulecardDetail.Columns[4].Visible = false;


                    break;
            }
           // FunPriSetControlDDLToolTip();
        }
        catch (Exception ex)
        {

            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            lblErrorMessage.Text = ex.Message;
        }

    }



    public void DisableMasterControls()
    {
        try
        {

            //ddlTransacType.Enabled = false;
            //ddlprogram.ClearDropDownList_FA();
            //ddlEntityType.ClearDropDownList_FA();
        }
        catch (Exception ex)
        {

            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            lblErrorMessage.Text = ex.Message;
        }
    }


    public void FunPubBindMasterDetails()
    {
        ObjAuthorizationRuleCardClient = new FATranMasterMgtServiceReference.FATranMasterMgtServicesClient();

        try
        {
           // FunPriGetActivity();
            //FunPriGetProgram();
            if (intAuthorizationId == 0)
            {
                DataRow dr;
                dtRuleCardDetails.Columns.Add("SNo");
                dtRuleCardDetails.Columns.Add("Type_ID");
                dtRuleCardDetails.Columns.Add("Type");
                //dtRuleCardDetails.Columns.Add("Total_Approvals");
                //dtRuleCardDetails.Columns.Add("Level4_Approvals");
                dtRuleCardDetails.Columns.Add("Report_Line");
                dtRuleCardDetails.Columns.Add("Description");
                dtRuleCardDetails.Columns.Add("Label");
                dtRuleCardDetails.Columns.Add("add_ID");
                dtRuleCardDetails.Columns.Add("add");
                dr = dtRuleCardDetails.NewRow();
                dr["SNo"] = 0;
                dtRuleCardDetails.Rows.Add(dr);
                ViewState["RuleCardDetail"] = dtRuleCardDetails;
                grvAuthorizationrulecardDetail.DataSource = dtRuleCardDetails;
                grvAuthorizationrulecardDetail.DataBind();
                grvAuthorizationrulecardDetail.Rows[0].Visible = false;
                ViewState["RuleCardDetail"] = dtRuleCardDetails;

            }

           
                

        }





        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            lblErrorMessage.Text = ex.Message;
        }
    }
   



    #endregion

    #region Page Events

   

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../System Admin/FA_Report_AccountMapping_View.aspx");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            lblErrorMessage.Text = ex.Message;
        }
    }



   

    #endregion


    protected void btnFApprover_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        Button btn = (Button)sender;
        GridViewRow gvRow = (GridViewRow)btn.Parent.Parent;
        string strSLNo = "";
        Label lblSNo = (Label)grvAuthorizationrulecardDetail.Rows[grvAuthorizationrulecardDetail.Rows.Count - 1].FindControl("lblSNo");
        strSLNo = (Convert.ToInt32(lblSNo.Text) + 1).ToString();
        if (ViewState["dtTempAuthApprover"] == null)
        {
            dt = FunProInitializePopup(strSLNo);
            grvApprover.DataSource = dt;
            grvApprover.DataBind();
            grvApprover.Rows[0].Visible = false;
            dt.Rows.RemoveAt(0);
            ViewState["dtTempAuthApproverPopUp"] = ViewState["dtTempAuthApprover"] = dt;
        }
        else
        {
            DataTable dt1 = (DataTable)ViewState["dtTempAuthApprover"];
            DataTable dtApprove = new DataTable();
            DataRow[] dRow = dt1.Select("SNo ='" + strSLNo + "'");
            if (dRow.Length > 0)
            {
                dtApprove = dt1.Clone();
                ViewState["dtTempAuthApproverPopUp"] = dtApprove = dt1.Select("SNo ='" + strSLNo + "'").CopyToDataTable();
                grvApprover.DataSource = dtApprove;
                grvApprover.DataBind();

            }
            else
            {
                dt1 = FunProInitializePopup(strSLNo);
                grvApprover.DataSource = dt1;
                grvApprover.DataBind();
                grvApprover.Rows[0].Visible = false;
                dt1.Rows.RemoveAt(0);
                ViewState["dtTempAuthApproverPopUp"] = dt1;

            }
        }
        ModalPopupExtenderApprover.Show();
    }


    protected void btnIApprover_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        DataTable dtApprove = new DataTable();
        Button btn = (Button)sender;
        GridViewRow gvRow = (GridViewRow)btn.Parent.Parent;
        GridView grv = (GridView)gvRow.Parent.Parent;
        dt = (DataTable)ViewState["dtTempAuthApprover"];
        //RequiredFieldValidator rfvLocation = (RequiredFieldValidator)grvApprover.FooterRow.FindControl("rfvLocation");
        //RequiredFieldValidator rfvApprovalPerson = (RequiredFieldValidator)grvApprover.FooterRow.FindControl("rfvApprovalPerson");
        //if (ddlEntityType.SelectedValue == "1" || ddlEntityType.SelectedValue == "2")
        //{
        //    grvApprover.Columns[2].Visible = false;
        //    rfvLocation.Enabled = false;
        //    rfvApprovalPerson.Enabled = false;
        //}
        //else
        //{
        //    grvApprover.Columns[2].Visible = true;
        //    rfvLocation.Enabled = true;
        //    rfvApprovalPerson.Enabled = true;
        //}
        Label lblSNo = (Label)gvRow.FindControl("lblSNo");
        int intSNo = Convert.ToInt32(lblSNo.Text);
        DataRow[] drAuthApprover = dt.Select("SNo='" + intSNo + "'");
        if (drAuthApprover.Length > 0)
        {
            ViewState["dtTempAuthApproverPopUp"] = dtApprove = dt.Select("SNo='" + intSNo + "'").CopyToDataTable();
        }
        grvApprover.DataSource = dtApprove;
        grvApprover.DataBind();
        if (strMode == "Q")
        {
            grvApprover.FooterRow.Visible = false;
        }
        ModalPopupExtenderApprover.Show();
    }


    protected void btnDEVModalAdd_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        DataTable dtModal = new DataTable();
        DataTable dtMain = new DataTable();
        dtModal = (DataTable)ViewState["dtTempAuthApproverPopUp"];
        if (dtModal.Rows.Count == 0)
        {
            Utility_FA.FunShowAlertMsg_FA(this, "Add Atleast One Approval Details");
            return;
        }
        //foreach (GridViewRow GvRow in grvApprover.Rows)
        //{
        //    DropDownList ddlApprovalEntity = (DropDownList)GvRow.FindControl("ddlApprovalEntity");
        //    DropDownList ddlApprovPerson = (DropDownList)GvRow.FindControl("ddlApprovPerson");
        //    Label lblSequenceNumber = (Label)GvRow.FindControl("lblSequenceNumber");
        //    //if (ddlApprovalEntity.Items.Count > 1 && ddlApprovalEntity.SelectedValue == "0")
        //    //{
        //    //    Utility_FA.FunShowAlertMsg_FA(this, "Select Approval Entity");
        //    //    ddlApprovalEntity.Focus();
        //    //    return;
        //    //}
        //    if (ddlApprovPerson.Items.Count > 1 && ddlApprovPerson.SelectedValue == "0")
        //    {
        //        Utility_FA.FunShowAlertMsg_FA(this, "Select Approval Authority");
        //        ddlApprovPerson.Focus();
        //        return;
        //    }
        //    //string strApprovalEntity = ddlApprovalEntity.SelectedValue;
        //    //string strApprovalPerson = ddlApprovPerson.SelectedValue;
        //    //for (int inti = 0; inti <= grvApprover.Rows.Count-1; inti++)
        //    //{
        //    //    Label lblSequenceNumber1 = (Label)grvApprover.Rows[inti].FindControl("lblSequenceNumber");
        //    //    DropDownList ddlApprovalEntity1 = (DropDownList)grvApprover.Rows[inti].FindControl("ddlApprovalEntity");
        //    //    DropDownList ddlApprovPerson1 = (DropDownList)grvApprover.Rows[inti].FindControl("ddlApprovPerson");
        //    //    if (lblSequenceNumber.Text != lblSequenceNumber1.Text && ddlApprovalEntity1.SelectedValue == strApprovalEntity && ddlApprovPerson1.SelectedValue == strApprovalPerson)
        //    //    {
        //    //        Utility_FA.FunShowAlertMsg_FA(this, "Selected combination already exist");
        //    //        ddlApprovPerson1.Focus();
        //    //        return;
        //    //    }
        //    //}
        //}
        dtMain = (DataTable)ViewState["dtTempAuthApprover"];

        int intMasterSeq = Convert.ToInt32(((Label)grvApprover.Rows[0].FindControl("LblSNo")).Text);
        /*Write Coding To delete Existing record*/

        DataRow[] Drow = dtMain.Select("SNo='" + intMasterSeq + "'");
        foreach (DataRow dr in Drow)
        {
            dtMain.Rows.Remove(dr);
        }

        foreach (GridViewRow GvRow in grvApprover.Rows)
        {
            Label lblSNo = (Label)GvRow.FindControl("lblSNo");
            Label lblSequenceNumber = (Label)GvRow.FindControl("lblSequenceNumber");
            Label lblLocation = (Label)GvRow.FindControl("lblLocation");
            Label lblLocationID = (Label)GvRow.FindControl("lblLocationID");
            Label lblApprovalPerson = (Label)GvRow.FindControl("lblApprovalPerson");
            Label ApprovPersonID = (Label)GvRow.FindControl("ApprovPersonID");
            DataRow dRow = dtMain.NewRow();

            dRow["SNo"] = intMasterSeq;
            dRow["SequenceNumber"] = lblSequenceNumber.Text;
            dRow["ApprovPerson"] = lblApprovalPerson.Text;
            dRow["ApprovPersonID"] = ApprovPersonID.Text;
            if (lblLocationID.Text != "")
                dRow["LocationID"] = lblLocationID.Text;
            dRow["Location"] = lblLocation.Text;
            dtMain.Rows.Add(dRow);
        }
        ViewState["dtTempAuthApprover"] = dtMain;
        ViewState["dtTempAuthApproverPopUp"] = null;
        ModalPopupExtenderApprover.Hide();
    }

    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Label lblSequenceNumber = (Label)grvApprover.FooterRow.FindControl("lblSequenceNumber");
        DropDownList ddlLocation = (DropDownList)grvApprover.FooterRow.FindControl("ddlLocation");
        DropDownList ddlApprovPerson = (DropDownList)grvApprover.FooterRow.FindControl("ddlApprovPerson");
        int intSNo = Convert.ToInt32(((Label)grvApprover.Rows[0].FindControl("LblSNo")).Text);
        DataTable dtModal = (DataTable)ViewState["dtTempAuthApproverPopUp"];
        if (dtModal == null)
        {
            dtModal = (((DataTable)ViewState["dtTempAuthApprover"]).Select("SNo='" + intSNo + "'")).CopyToDataTable();
        }
        DataRow dRow = dtModal.NewRow();
        dRow["SNo"] = Convert.ToInt32(((Label)grvApprover.Rows[0].FindControl("LblSNo")).Text);
        //if (ddlEntityType.SelectedValue == "3")
        //{
        //    DataRow[] dArr = (dtModal.Select("SNo='" + intSNo + "' and LocationID='" + ddlLocation.SelectedValue + "' and ApprovPersonID='" + ddlApprovPerson.SelectedValue + "'"));
        //    if (dArr.Length > 0)
        //    {
        //        Utility_FA.FunShowAlertMsg_FA(this, "The Selected user is already added for this location");
        //        return;
        //    }
        //}

        dRow["ApprovPersonID"] = ddlApprovPerson.SelectedValue;
        if (ddlLocation.SelectedValue != "")
            dRow["LocationID"] = ddlLocation.SelectedValue;
        dRow["ApprovPerson"] = ddlApprovPerson.SelectedItem.Text;
        if (ddlLocation.SelectedItem != null)
        {
            if (PageMode == PageModes.Modify)
            {
                Dictionary<string, string> dictParam = new Dictionary<string, string>();
                dictParam.Add("@LOCATION_ID", ddlLocation.SelectedValue);
              //  dictParam.Add("@PROGRAM_ID", ddlprogram.SelectedValue);
                DataTable dtLocVal = Utility_FA.GetDefaultData("FA_CHK_PENDING_PRG", dictParam);
                if (dtLocVal.Rows.Count > 0)
                {
                    string strLocVal = dtLocVal.Rows[0]["Success"].ToString();
                    if (strLocVal == "1")
                    {
                        Utility_FA.FunShowAlertMsg_FA(this, "Approve all the pending Transactions for the selected location");
                        return;
                    }

                }
            }
            DataRow[] DRowArr = dtModal.Select("LocationID='" + ddlLocation.SelectedValue + "'");
            if (DRowArr.Length > 0)
            {
                dRow["SequenceNumber"] = DRowArr.Length + 1;
            }
            else
            {
                dRow["SequenceNumber"] = 1;
            }
            if (ddlLocation.SelectedItem.Text != "")
                dRow["Location"] = Convert.ToString(ddlLocation.SelectedItem.Text);
        }
        else
        {
            if (dtModal.Rows.Count > 0)
            {
                dRow["SequenceNumber"] = dtModal.Rows.Count + 1;
            }
            else
            {
                dRow["SequenceNumber"] = 1;
            }
            dRow["Location"] = "0";
        }
        dtModal.Rows.Add(dRow);
        grvApprover.DataSource = dtModal;
        grvApprover.DataBind();
        ViewState["dtTempAuthApproverPopUp"] = dtModal;
    }


   

    protected DataTable FunProInitializePopup(string SNo)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SNo");
        dt.Columns.Add("SequenceNumber");
        dt.Columns.Add("Account_code_ID");
        dt.Columns.Add("Account_Code");
        dt.Columns.Add("SubGl_ID");
        dt.Columns.Add("SubGl_Code");

        DataRow dRow = dt.NewRow();
        dRow["SNo"] = SNo;
        dRow["SequenceNumber"] = 0;
        dRow["Account_code_ID"] = string.Empty;
        dRow["Account_Code"] = 0;
        dRow["SubGl_ID"] = 0;
        dRow["SubGl_Code"] = string.Empty;

        dt.Rows.Add(dRow);

        return dt;
        //grvApprover.DataSource = dt;
        //grvApprover.DataBind();
        //grvApprover.Rows[0].Visible = false;
        //dt.Rows.RemoveAt(0);
        //ViewState["dtTempAuthApprover"] = dt;        
    }

    protected void btnDEVModalCancel_Click(object sender, EventArgs e)
    {
        ModalPopupExtenderApprover.Hide();
    }


    protected void grvApprover_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
        }
    }
}