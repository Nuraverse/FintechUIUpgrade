#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Month and Year Lock
/// Created By			: Manikandan. R
/// Created Date		: 06-April-2012

/// <Program Summary>
#endregion

#region Namespaces
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
using System.Collections.Generic;
using FA_BusEntity;
using System.Globalization;
using System.Text;
#endregion


public partial class System_Admin_FAMonthAndYearLock : ApplyThemeForProject_FA
{
    #region Intialization
    int intGPSId = 0;
    int intMnthIdId = 0;
    int intMnthEndDetId = 0;
    int intErrCode = 0;
    int intMaxMonth;
    int intUser_ID = 0;
    int intCompany_ID = 0;
    string strDateFormat;
    static bool boolGPSDone = true;
    bool bModify = false;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    string strConnectionName = string.Empty;
    string strMsg = "";
    string strAlertMsg = "";
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objAdminClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable objMonthLockDataTable;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockRow objMonthRow;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable objYearLockDataTable;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockRow objYearRow;
    FASerializationMode SerMode = FASerializationMode.Binary;
    string strKey = "Insert";
    string strMode;
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "~/Common/HomePage.aspx";
    string strRedirectView = "window.location.href='../Common/HomePage.aspx';";
    string strRedirectPage;
    StringBuilder strMonthBuilder;
    StringBuilder strMonthBuilderRev;
    Dictionary<string, string> Procparam = null;
    FASession ObjSession = new FASession();

    #endregion

    #region Function to Load Month Lock Grid
    protected void FunProLoadGPS_New(int intCompany_ID, string strFinancialYear, string strFinancialMonth)
      {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_ID.ToString());
            Procparam.Add("@Fin_Year", strFinancialYear.ToString());
            Procparam.Add("@ML", strFinancialMonth.ToString());
            Procparam.Add("@User_ID", intUser_ID.ToString());
            DataTable dtLoadGrid;
            dtLoadGrid = Utility_FA.GetDefaultData("FA_MonthLockGrid", Procparam);
            if (dtLoadGrid.Columns.Count > 1)
            {
                if (dtLoadGrid.Rows.Count > 0)
                {
                    grvMothEndParam.DataSource = dtLoadGrid;
                    grvMothEndParam.DataBind();
                    chkMonthLock.Enabled = true;
                    //To disable the save & excel button when Fin Yr is closed for bug id 4492
                    if (chkYearLock.Checked)
                    {
                        btnSave.Enabled_False();
                        btnExcel.Enabled_False();
                    }
                    else
                    {
                        btnSave.Enabled_True();
                        btnExcel.Enabled_True();
                    }
                    CheckBox chkHdrMonthLock = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
                    foreach (GridViewRow grvrow in grvMothEndParam.Rows)
                    {
                        int i = 0;
                        int j = 0;
                        CheckBox chkmonth = (CheckBox)grvrow.FindControl("chkMonth");
                       
                        if (chkmonth.Checked)
                        {
                            j = j + 1;
                        }
                        i=i+1;
                        if (i == j)
                        {
                            chkHdrMonthLock.Checked = true;
                            chkHdrMonthLock.Enabled = false;
                            chkMonthLock.Checked = true;
                            chkMonthLock.Enabled = false;
                        }
                        else
                        {
                            chkHdrMonthLock.Checked = false;
                            chkHdrMonthLock.Enabled = true;
                            chkMonthLock.Checked = false;
                            chkMonthLock.Enabled = false;
                        }
                    }
                    //To disable the save & excel button when Fin Yr is closed for bug id 4492
                }
                else
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "No Transaction had taken place");
                    grvMothEndParam.DataSource = "";
                    grvMothEndParam.DataBind();
                    btnSave.Enabled_False();
                    btnExcel.Enabled_False();
                }
            }
            else
            {              
                Utility_FA.FunShowAlertMsg_FA(this, "No Transaction had taken place");
                grvMothEndParam.DataSource = "";
                grvMothEndParam.DataBind();
                btnSave.Enabled_False();
                btnExcel.Enabled_False();
            }
      }

    #endregion

    #region Function For Disable Controls

    private void FunPriDisableControls(int intMode)
    {
        switch (intMode)
        {

            case 0://Create Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                boolGPSDone = false;
                break;

            case 1://Modify Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                break;

            case -1: // Query Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                ddlFinacialYear.Enabled = true;
                ddlFinancialMonth.Enabled = true;
                btnSave.Enabled_False();
                chkMonthLock.Enabled = false;
                chkYearLock.Enabled = false;
                break;
        }
    }
    #endregion

    #region Events
    #region Page Loading
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Page Load Intialization

        UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();

        intUser_ID = ObjUserInfo_FA.ProUserIdRW;
        intCompany_ID = ObjUserInfo_FA.ProCompanyIdRW;
        strDateFormat = ObjSession.ProDateFormatRW;
        string strFinYear = ObjSession.ProFinYearRW;
        string strStartYear = ObjSession.ProFinYearStartMonthRW;
        string strFinMonth = ObjSession.ProConnectionName;
        strConnectionName = ObjSession.ProConnectionName;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;
        bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
        if (!bIsActive)
        {
            btnSave.Enabled_False();
            //btnClear.Enabled = false;
        }
        else
        {
            if (boolGPSDone)
            {
                if ((bModify) && (ObjUserInfo_FA.IsUserLevelUpdate(Convert.ToInt32(intUser_ID), Convert.ToInt32(ObjUserInfo_FA.ProUserLevelIdRW))))
                {
                    strMode = "M";

                }
                else
                {
                    strMode = "Q";
                }
            }

            else
            {
                strMode = "C";
            }
        }


        #endregion
        if (!IsPostBack)
        {
            //  lblYearLock1.Text = strFinYear; //DateTime.Now.AddYears(intMaxMonth).Year.ToString() + "-" + DateTime.Now.AddYears(intMaxMonth).Year.ToString();


            FunLoadFinYear();
            //ddlFinacialYear.FillFinancialYears();
            FunLoadFinMonth();
            FunPriCheckYrLock();
            //ddlFinacialYear.SelectedValue = "1";
            //ddlFinancialMonth.FillFinancialMonth(lblYearLock1.Text);
            //ddlFinacialYear.SelectedItem.Text= lblYearLock1.Text;
            //ddlFinacialYear.SelectedItem.Text = strFinYear;
            //ddlFinacialYear.ClearDropDownList_FA();
            string strDateTime = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Year.ToString();
            if (strFinYear == strDateTime)
            {
                //lblMonthLock1.Text = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString("00");
                //ddlFinancialMonth.SelectedValue = lblMonthLock1.Text;
                if (lblYearLock1.Text != "" && lblMonthLock1.Text != "")
                    FunProLoadGPS_New(intCompany_ID, lblYearLock1.Text, lblMonthLock1.Text);
                btnSave.Enabled_True();
                btnExcel.Enabled_True();
            }
            else
            {
                btnSave.Enabled_False();
                btnExcel.Enabled_False();
            }
            if (strMode == "M")
            {
                FunPriDisableControls(1);
            }
            else if (strMode == "Q")
            {
                FunPriDisableControls(-1);
            }
            else
            {
                FunPriDisableControls(0);
            }
            ddlFinacialYear.Focus();
        }
    }
    #endregion

    private void FunLoadFinMonth()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_ID.ToString());
            Procparam.Add("@Fin_YEAR", ddlFinacialYear.SelectedValue);
            ddlFinancialMonth.BindDataTable_FA("FA_GETFINMONTH_MONTHLOCK", Procparam, new string[] { "FinMonth", "FinMonth" });
            //ddlFinancialMonth.SelectedValue(ObjSession.);
        }
        catch (Exception ex)
        {
        }
    }

    private void FunLoadFinYear()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_ID.ToString());
            ddlFinacialYear.BindDataTable_FA("FA_GET_FINYR", Procparam, new string[] { "FINANCIAL_YEAR", "FINANCIAL_YEAR" });

        }
        catch (Exception ex)
        {
        }
    }


    #region Grid Events
    /// <summary>
    /// Gridview Row Created event adds a java script to Check all and uncheck all in grid view columns
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvMothEndParam_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
               (e.Row.RowState == DataControlRowState.Normal ||
                e.Row.RowState == DataControlRowState.Alternate))
        {
            CheckBox chkBoxMonth = (CheckBox)e.Row.FindControl("chkMonth");
            //CheckBox chkRevoke = (CheckBox)e.Row.FindControl("chkRevoke");


            CheckBox chkBxHeaderMonth = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
            //CheckBox chkHdrRevokeLock = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrRevokeLock");
            if (chkBoxMonth.Checked)
            {
                chkBoxMonth.Attributes["onclick"] = string.Format
                                           (
                                              "javascript:ChildClick(this,'{0}');",
                                              chkBxHeaderMonth.ClientID
                                           );
            }
            //if (chkRevoke.Checked)
            //{
            //    chkRevoke.Attributes["onclick"] = string.Format
            //                               (
            //                                  "javascript:ChildClick1(this,'{0}');",
            //                                  chkHdrRevokeLock.ClientID);
            //}
            //else
            //{
            //    chkHdrRevokeLock.Checked = false;
            //}
            if (chkBxHeaderMonth.Checked)
            {
                chkMonthLock.Checked = true;
                chkMonthLock.Enabled = false;
            }
            //To disable the header month chk box in grid when Fin Yr is closed for bug id 4492
            if (chkYearLock.Checked)
            {
                chkBxHeaderMonth.Enabled = false;
            }
            //To disable the header month chk box in grid when Fin Yr is closed for bug id 4492
        }
    }
    /// <summary>
    /// Function written for reteriving pending documents
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvMothEndParam_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            lblmodalerror.Text = "";
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_ID.ToString());
            Procparam.Add("@ML", ddlFinancialMonth.SelectedValue);
            Procparam.Add("@Location_ID", e.CommandArgument.ToString());
            DataSet dsPendingList = Utility_FA.GetDataset("FA_ApprovedRec_ML", Procparam);

            if (dsPendingList.Tables.Count > 0)
            {

                // Loading Receipt
                if ((dsPendingList.Tables[0].Rows.Count > 0) && (dsPendingList.Tables[0].Columns.Count > 1))
                {
                    lblReceipt.Visible = false;
                    grvReceipt.DataSource = dsPendingList.Tables[0];
                    grvReceipt.DataBind();
                }
                else
                {
                    lblReceipt.Visible = true;
                    grvReceipt.DataSource = null;
                    grvReceipt.DataBind();
                }

                // Loading Payment
                if ((dsPendingList.Tables[1].Rows.Count > 0) && (dsPendingList.Tables[1].Columns.Count > 1))
                {
                    lblPay.Visible = false;
                    grvPay.DataSource = dsPendingList.Tables[1];
                    grvPay.DataBind();
                }
                else
                {
                    lblPay.Visible = true;
                    grvPay.DataSource = null;
                    grvPay.DataBind();
                }

                // Loading MJV
                if ((dsPendingList.Tables[2].Rows.Count > 0) && (dsPendingList.Tables[2].Columns.Count > 1))
                {
                    lblMJV_Rec.Visible = false;
                    grvMJV.DataSource = dsPendingList.Tables[2];
                    grvMJV.DataBind();
                }
                else
                {
                    lblMJV_Rec.Visible = true;
                    grvMJV.DataSource = null;
                    grvMJV.DataBind();
                }

                // Loading Credit Note
                if ((dsPendingList.Tables[3].Rows.Count > 0) && (dsPendingList.Tables[3].Columns.Count > 1))
                {
                    lblCreditNote.Visible = false;
                    grvCredit.DataSource = dsPendingList.Tables[3];
                    grvCredit.DataBind();
                }
                else
                {
                    lblCreditNote.Visible = true;
                    grvCredit.DataSource = null;
                    grvCredit.DataBind();
                }


                // Loading Debit Note
                if ((dsPendingList.Tables[4].Rows.Count > 0) && (dsPendingList.Tables[4].Columns.Count > 1))
                {
                    lblDebit.Visible = false;
                    grvDebit.DataSource = dsPendingList.Tables[4];
                    grvDebit.DataBind();
                }
                else
                {
                    lblDebit.Visible = true;
                    grvDebit.DataSource = null;
                    grvDebit.DataBind();
                }

                // Loading Cheque Return
                if ((dsPendingList.Tables[5].Rows.Count > 0) && (dsPendingList.Tables[5].Columns.Count > 1))
                {
                    lblCheque.Visible = false;
                    grvCheque.DataSource = dsPendingList.Tables[5];
                    grvCheque.DataBind();
                }
                else
                {
                    lblCheque.Visible = true;
                    grvCheque.DataSource = null;
                    grvCheque.DataBind();
                }

                //Loading Specific revision starts Here
                if ((dsPendingList.Tables[7].Rows.Count > 0) && (dsPendingList.Tables[7].Columns.Count > 1))
                {
                    //lblSpecRev.Visible = false;
                    //grvSpecificrev.DataSource = dsPendingList.Tables[7];
                    //grvSpecificrev.DataBind();
                }
                else
                {
                    //lblSpecRev.Visible = true;
                    //grvSpecificrev.DataSource = null;
                    //grvSpecificrev.DataBind();
                }
                //Loading Specific revision ends Here

                // Pendind Count Loading
                if ((dsPendingList.Tables[6].Rows.Count > 0) && (dsPendingList.Tables[6].Columns.Count > 1))
                {
                    // Receipt Count
                    int intReceiptCount = 0;
                    intReceiptCount = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Receipt"]);
                    if (intReceiptCount > 20)
                    {
                        lblReceipt_Count.Visible = true;
                        lblReceipt_Count.Text = (intReceiptCount.ToString() + " and more..");
                    }
                    else
                    {
                        lblReceipt_Count.Visible = false;
                    }
                    // Payment Count

                    int intPayCount = 0;
                    intPayCount = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Payment"]);
                    if (intPayCount > 20)
                    {
                        lblPay_Count.Visible = true;
                        lblPay_Count.Text = (intPayCount.ToString() + " and more..");
                    }
                    else
                    {
                        lblPay_Count.Visible = false;
                    }

                    // MJV Count

                    int intMJV = 0;
                    intMJV = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["MJV"]);
                    if (intMJV > 20)
                    {
                        lblMJV_Count.Visible = true;
                        lblMJV_Count.Text = (intMJV.ToString() + " and more..");
                    }
                    else
                    {
                        lblMJV_Count.Visible = false;
                    }

                    // Credit Note Count

                    int intCredit = 0;
                    intCredit = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Credit_Note"]);
                    if (intCredit > 20)
                    {
                        lblCredit_Count.Visible = true;
                        lblCredit_Count.Text = (intCredit.ToString() + " and more..");
                    }
                    else
                    {
                        lblCredit_Count.Visible = false;
                    }

                    // Debit Note Count
                    int intDebit = 0;
                    intDebit = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Debit_Note"]);
                    if (intDebit > 20)
                    {
                        lblDebit_Count.Visible = true;
                        lblDebit_Count.Text = (intDebit.ToString() + " and more..");
                    }
                    else
                    {
                        lblDebit_Count.Visible = false;
                    }

                    //Cheque Return Count
                    int intCR = 0;
                    intCR = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Cheque_Rtn"]);
                    if (intCR > 20)
                    {
                        lblCredit_Count.Visible = true;
                        lblCredit_Count.Text = (intCR.ToString() + " and more..");
                    }
                    else
                    {
                        lblCredit_Count.Visible = false;
                    }

                    int intAssetDep = 0;
                    intAssetDep = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Asset_DEp"]);

                    if (intAssetDep == 0)
                    {
                        lblDepreciation.Visible = true;
                        lblDepreciation.Text = "Asset Depreciation not Run";
                    }
                    else
                    {
                        lblDepreciation.Visible = false;
                        lblDepreciation.Text = "";
                    }

                    int intfundertrans = 0;
                    intfundertrans = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["Funder_Int"]);

                    if (intfundertrans == 0)
                    {
                        lblFunderInterest.Visible = true;
                        lblFunderInterest.Text = "Treasury Funder Interest not Run";
                    }
                    else
                    {
                        lblFunderInterest.Visible = false;
                        lblFunderInterest.Text = "";
                    }


                    //specific revision count starts here
                    int intSpecRevCnt = 0;
                    intSpecRevCnt = Convert.ToInt32(dsPendingList.Tables[6].Rows[0]["SPEC_REV_CNT"]);
                    if (intSpecRevCnt > 20)
                    {
                        //lblSpecRev_Cnt.Visible = true;
                        //lblSpecRev_Cnt.Text = (intSpecRevCnt.ToString() + " and more..");
                    }
                    else
                    {
                        //lblSpecRev_Cnt.Visible = false;
                    }
                    //specific revision count ends here

                }

            }


            else
            {
                lblmodalerror.Text = "No Pending Records Available !";
            }
            ModalPopupExtenderPassword.Show();

        }

    }
    /// <summary>
    /// GridView Row DataBound Event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvMothEndParam_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkMonth = (CheckBox)e.Row.FindControl("chkMonth");
            CheckBox chkIs_Doc = (CheckBox)e.Row.FindControl("chkDoc");
            CheckBox chkRevoke = (CheckBox)e.Row.FindControl("chkRevoke");
            LinkButton lnkView = (LinkButton)e.Row.FindControl("lnkView");
            //CheckBox chkDoc = (CheckBox)e.Row.FindControl.FindControl("chkDoc");
            Label lblLockDate = (Label)e.Row.FindControl("lblLockDate");
            Label lblLockTime = (Label)e.Row.FindControl("lblLockTime");
            Label lblLockDate_O = (Label)e.Row.FindControl("lblLockDate_O");
            Label lblLockTime_O = (Label)e.Row.FindControl("lblLockTime_O");

            if (strMode == "M" || strMode == "C")
            {
                //chkMonth.Enabled = true;
                //if (chkIs_Doc.Checked)
                //{
                //    //chkMonth.Enabled = false;
                //    lnkView.Enabled = true;
                //}
                //else
                //{
                //    //chkMonth.Enabled = true;
                //    lnkView.Enabled = false;
                //}
                if (chkMonth.Checked)
                {
                    chkMonth.Enabled = false;
                    chkRevoke.Enabled = true;
                }

                if (chkMonth.Checked == false && chkRevoke.Enabled == false)
                {
                    if ((!string.IsNullOrEmpty(lblLockTime.Text.Trim())) && (!string.IsNullOrEmpty(lblLockDate.Text.Trim())))
                    {
                        chkRevoke.Checked = true;
                    }
                    else
                    {
                        chkRevoke.Checked = false;
                    }
                }

            }
            if (!chkMonth.Checked)
            {
                chkMonthLock.Checked = false;
                chkMonthLock.Enabled = true;
            }
            //else
            //{
            //    chkMonthLock.Enabled = true;
            //    chkMonthLock.Checked = false;
            //}

            //To disable revoke button when Fin Yr is closed for bug id 4492
            if (chkYearLock.Checked)
            {
                chkRevoke.Enabled = false;
            }
            //To disable revoke button when Fin Yr is closed for bug id 4492

        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            if (strMode == "M" || strMode == "C")
            {
                ((CheckBox)e.Row.FindControl("chkHdrMonthLock")).Enabled = true;
            }
        }

    }
    #endregion

    #region Check Box Events
    /// <summary>
    /// Moth Lock Check Box Checks weather all Branch Moths are locked r not
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkMonthLock_CheckedChanged(object sender, EventArgs e)
    {
        if (chkMonthLock.Checked == true)
        {
            bool boolChecked = false;
            foreach (GridViewRow grvrowBrnchRow in grvMothEndParam.Rows)
            {
                CheckBox chkBranchMonthLock = (CheckBox)grvrowBrnchRow.FindControl("chkMonth");
                if (chkBranchMonthLock.Checked)
                {
                    boolChecked = true;
                }
                else
                {
                    boolChecked = false;
                    goto exitloop;
                }
            }
        exitloop:
            if (boolChecked)
            {
                chkMonthLock.Checked = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked,since all branches are not locked for the month');", true);
                chkMonthLock.Checked = false;
            }
        }
    }

    /// <summary>
    /// Fiered on Header Checkboxes check changed event to ensure proper Month Lock
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkHdrLockEvent_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkBxHeader = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
        foreach (GridViewRow grvMothEndParamRow in grvMothEndParam.Rows)
        {
            CheckBox chkMonth = (CheckBox)grvMothEndParamRow.FindControl("chkMonth");
            //CheckBox chkDoc = (CheckBox)grvMothEndParamRow.FindControl("chkDoc");
            Label lbdoc = (Label)grvMothEndParamRow.FindControl("lbdoc");
            if (chkBxHeader.Checked)
            {
                if (chkBxHeader.ID.Contains("Month") && chkMonth.Checked == true)
                {
                    //chkMonth.Checked = (chkDoc.Checked);
                    if (lbdoc.Text != "OK")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch until all process are locked');", true);
                        chkMonth.Checked = false;
                        chkBxHeader.Checked = false;
                        chkMonthLock.Checked = false;
                    }
                }
            }
            else
            {
                if (!chkBxHeader.ID.Contains("Month"))
                {
                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch Since all process are locked');", true);
                    chkMonth.Checked = false;
                    chkBxHeader.Checked = false;
                    chkMonthLock.Checked = false;
                }
            }
        }
    }
    /// <summary>
    /// Year Lock Check Box Event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkYearLock_CheckedChanged(object sender, EventArgs e)
    {
        if (chkYearLock.Checked)
        {
            if (chkMonthLock.Checked)
            {

                return;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Year cannot be locked for a company until month is locked');", true);
                chkYearLock.Checked = false;
            }
        }
    }
    /// <summary>
    /// Fired and every rows Check changed to ensure proper month Lock and unlock mechanism
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkLockEvent_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkbox = (CheckBox)sender;

        string str = chkbox.ClientID;
        int intIndex = str.IndexOf("grvMothEndParam_ctl");
        int intRow = Convert.ToInt32(str.Substring(intIndex).Replace("grvMothEndParam_ctl", "").Substring(0, 2));
        intRow = intRow - 2;
        CheckBox chkMonth = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkMonth");
        CheckBox chkBxHeader = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
        CheckBox chkRevoke = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkRevoke");
        Label lbdoc = (Label)grvMothEndParam.Rows[intRow].FindControl("lbdoc");
        Label lblLockDate = (Label)grvMothEndParam.Rows[intRow].FindControl("lblLockDate");
        Label lblLockTime = (Label)grvMothEndParam.Rows[intRow].FindControl("lblLockTime");
        Label lblLockDate_O = (Label)grvMothEndParam.Rows[intRow].FindControl("lblLockDate_O");
        Label lblLockTime_O = (Label)grvMothEndParam.Rows[intRow].FindControl("lblLockTime_O");

        if (chkbox.Checked)
        {
            if (str.Contains("chkMonth") && chkMonth.Checked == true)
            {
                // chkMonth.Checked = (chkDoc.Checked);
                if (lbdoc.Text != "OK")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch until all process are locked');", true);
                    chkMonth.Checked = false;
                    chkBxHeader.Checked = false;
                    chkMonthLock.Checked = false;
                }
                else
                {
                    if (chkMonth.Checked)
                    {
                        if (lbdoc.Text != "OK")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch until all process are locked');", true);
                            chkMonth.Checked = false;
                            chkBxHeader.Checked = false;
                            chkMonthLock.Checked = false;
                        }
                        else
                        {
                            lblLockDate.Text = DateTime.Parse(DateTime.Today.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat); ;
                            string strHour;
                            string strTime;
                            string strAMPM;
                            FunGetTime(out strHour, out strTime, out strAMPM);
                            lblLockTime.Text = (strHour + ":" + strTime + strAMPM).ToString();
                        }


                    }
                    //if (chkRevoke.Checked == true)
                    //{
                    //    if (chkMonth.Checked == false && (chkRevoke.Enabled == false))
                    //    {
                    //        lblLockDate.Text = lblLockDate_O.Text.Trim();
                    //        lblLockTime.Text = lblLockTime_O.Text.Trim();
                    //    }
                    //}
                    else
                    {
                        lblLockDate.Text = "";
                        lblLockTime.Text = "";
                    }
                }
            }
            if (str.Contains("chkRevoke") && chkMonth.Checked == true && chkRevoke.Checked == true)
            {
                lblLockDate.Text = DateTime.Parse(DateTime.Today.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat); ;
                string strHour;
                string strTime;
                string strAMPM;
                FunGetTime(out strHour, out strTime, out strAMPM);
                lblLockTime.Text = (strHour + ":" + strTime + strAMPM).ToString();


            }

        }
        else
        {
            if (!str.Contains("chkMonth"))
            {
                //chkMonth.Checked = false;
                chkBxHeader.Checked = false;
                chkMonthLock.Checked = false;
            }
            if (str.Contains("chkRevoke") && chkRevoke.Checked == false)
            {
                lblLockDate.Text = lblLockDate_O.Text.Trim();
                lblLockTime.Text = lblLockTime_O.Text.Trim();
            }
            if (str.Contains("chkMonth") && chkRevoke.Checked == true)
            {
                if (chkMonth.Checked == false && (chkRevoke.Enabled == false))
                {
                    lblLockDate.Text = lblLockDate_O.Text.Trim();
                    lblLockTime.Text = lblLockTime_O.Text.Trim();
                }
            }
            if (str.Contains("chkMonth") && chkRevoke.Checked == false)
            {
                if (chkMonth.Checked == false && (chkRevoke.Enabled == false))
                {
                    lblLockDate.Text = "";
                    lblLockTime.Text = "";
                }
            }
        }

    }

    private static void FunGetTime(out string strHour, out string strTime, out string strAMPM)
    {
        int intCurHour;
        int intTime;
        int intHour;
        intCurHour = DateTime.Now.Hour;
        intTime = DateTime.Now.Minute;
        if (intCurHour > 12)
        {
            intHour = intCurHour - 12;
            if (intHour < 10)
                strHour = Convert.ToString(intHour);

            else
                strHour = Convert.ToString(intHour);
        }
        else
        {
            if (intCurHour < 10)
                strHour = Convert.ToString(intCurHour);
            else
                strHour = Convert.ToString(intCurHour);
        }
        if (intTime < 10)
            strTime = Convert.ToString("0" + intTime);
        else
            strTime = Convert.ToString(intTime);
        if (intCurHour >= 12)
            strAMPM = "PM";
        else
            strAMPM = "AM";
    }

    #endregion

    #region Drop Down Events
    /// <summary>
    /// Handles  Financial YearChange Event loads respective Finace Months
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlFinacialYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlFinancialMonth.Items.Clear();
        ddlFinancialMonth.Items.Add(new ListItem("--Select--", "0"));
        lblYearLock1.Text = "";
        chkYearLock.Enabled = false;
        FunPubResetMonthEndParamDetails();
        if (ddlFinacialYear.SelectedIndex > 0)
        {
            lblYearLock1.Text = ddlFinacialYear.SelectedItem.Text;
            lblMonthLock1.Text = "";
            //ddlFinancialMonth.FillFinancialMonth(ddlFinacialYear.SelectedItem.Text);
            FunLoadFinMonth();
            return;
        }
    }

    /// <summary>
    /// To Reset month end parameter details
    /// </summary>
    public void FunPubResetMonthEndParamDetails()
    {
        grvMothEndParam.DataSource = null;
        grvMothEndParam.DataBind();
        grvMothEndParam.DataSource = null;
        grvMothEndParam.DataBind();
        chkMonthLock.Enabled = false;
        lblMonthLock1.Text = "";
    }

    /// <summary>
    /// Handles 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlFinancialMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        FunPubResetMonthEndParamDetails();
        //To load the FIn yr checkbox value from DB for bug id 4492
        FunpriFinYrChkBox();
        //To load the FIn yr checkbox value from DB for bug id 4492
        if (ddlFinancialMonth.SelectedIndex > 0)
        {
            //chkMonthLock.Checked = true;
            chkMonthLock.Enabled = false;
            //FunProLoadGPS(intCompanyId, ddlFinacialYear.SelectedItem.Text, ddlFinancialMonth.SelectedItem.Text);
            FunProLoadGPS_New(intCompany_ID, ddlFinacialYear.SelectedItem.Text, ddlFinancialMonth.SelectedItem.Text);
            lblMonthLock1.Text = ddlFinancialMonth.SelectedItem.Text;

        }
    }
    #endregion

    #region Button Events


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPageView);
    }
    /// <summary>
    /// Main Save Button inserts and & Modifies Month and Year Lock Details into the Table
    /// Retruns Error Code
    /// </summary>
    /// <param name="bool blnValReturn"></param>

    public int FunPubMonthLockSave()
    {
        int intReturnValue = 0;
        int intReturnCode = 0;
        objAdminClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        objAdminClient.Open();
        objMonthLockDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable();
        objYearLockDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable();

        try
        {
            if (!chkYearLock.Checked)
            {
                objMonthRow = objMonthLockDataTable.NewFA_SYS_MonthLockRow();
                FunGetXML();
                FunGetXMLRev();

                objMonthRow.Month_Lock_ID = 0;
                objMonthRow.XmlMonth = strMonthBuilder.ToString();
                objMonthRow.XmlMonthRev = strMonthBuilderRev.ToString();
                objMonthLockDataTable.AddFA_SYS_MonthLockRow(objMonthRow);
                intReturnValue = objAdminClient.FunInsertMonthLock(FASerializationMode.Binary, FAClsPubSerialize.Serialize(objMonthLockDataTable, SerMode), strMode, strConnectionName);

            }
            else
            {
                objYearRow = objYearLockDataTable.NewFA_SYS_YearLockRow();
                objYearRow.Company_ID = intCompany_ID;
                objYearRow.Fin_Year = ddlFinacialYear.SelectedItem.Text;
                objYearRow.Final_Lock = chkYearLock.Checked;
                objYearRow.Created_By = intUser_ID;
                objYearRow.Created_Date = DateTime.Now;
                objYearRow.Modified_By = intUser_ID;
                objYearRow.Modified_Date = DateTime.Now;
                //To add the rows in yearlock datatable for bug id 4492
                objYearLockDataTable.AddFA_SYS_YearLockRow(objYearRow);
                intReturnValue = objAdminClient.FunInsertYearLock(FASerializationMode.Binary, FAClsPubSerialize.Serialize(objYearLockDataTable, SerMode), strMode, strConnectionName);
                //To add the rows in yearlock datatable for bug id 4492
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        return intReturnValue;


    }
    /// <summary>
    /// Main Save Button inserts and & Modifies Month and Year Lock Details into Table
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int intReturnCode = 0;
        FAAdminServiceReference.FAAdminServicesClient ObjFAAdminServices = new FAAdminServiceReference.FAAdminServicesClient();
        int intErrPwd = 0;
        intErrPwd = ObjFAAdminServices.FunPubPasswordValidation(intUser_ID, txtPassword.Text.Trim(), strConnectionName);
        if (intErrPwd > 0)
        {
            Utility_FA.FunShowValidationMsg_FA(this, intErrPwd);
            if (ObjFAAdminServices != null)
                ObjFAAdminServices.Close();
            return;


        }

        FunGetXML();

        FunGetXMLRev();
        if (chkMonthLock.Checked)
            hdnvalue.Value = "1";
        if (hdnvalue.Value != "1")
        {
            Utility_FA.FunShowAlertMsg_FA(this.Page, "Select Month Lock in grid");
            return;
        }
        if (!chkYearLock.Checked)
        {
            intReturnCode = FunPubMonthLockSave();
            if (intReturnCode == 0)
            {
                strMsg = "Data updated Successfully";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);

            }
            else if (intReturnCode == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Month has not been locked in Lending");
                return;

            }
            else
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Failed to Update Month Lock");
            }


        }
        else
        {
            intReturnCode = FunPubMonthLockSave();
            if (intReturnCode == 0)
            {
                strMsg = "Year Lock Added Successfully";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);
            }
            else if (intReturnCode == 2450)
            {
                strMsg = "Financial Year cannot be Locked Until all the Month has to be Locked";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);
            }
            else
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Failed to Update Year Lock");
            }

        }
    }

    //protected bool FunProValidateMonthLock(string strDate)
    //{

    //    bool is_Lock = false;

    //    try
    //    {


    //        Procparam = new Dictionary<string, string>();
    //        Procparam.Add("@Company_ID", intCompany_ID.ToString());

    //        Procparam.Add("@Fin_Year", ddlFinacialYear.SelectedValue);
    //        Procparam.Add("@Lock_Month", ddlFinancialMonth.SelectedValue);

    //            DataTable dtMonthLock = Utility_FA.GetDefaultData("FA_Validate_Month_Lock", Procparam);
    //            is_Lock = Convert.ToBoolean(dtMonthLock.Rows[0]["Is_Month_Lock"].ToString());

    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }

    //    return is_Lock;

    //}


    private void FunGetXML()
    {
        strMonthBuilder = new StringBuilder();
        strMonthBuilder.Append("<Root>");
        string strTxn;
        strTxn = "";
        string Prev_Lock_Month;
        string Prev_Substr_Year;
        string Prev_Substr_Month;
        Prev_Lock_Month = Convert.ToString(Convert.ToInt32(ddlFinancialMonth.SelectedItem.Text) - 1);
        Prev_Substr_Month = Prev_Lock_Month.Substring(4, 2);
        Prev_Substr_Year = Prev_Lock_Month.Substring(0, 4);
        if (Prev_Substr_Month.ToString() == "00")
        {
            Prev_Substr_Year = Convert.ToString(Convert.ToInt32(Prev_Substr_Year) - 1);
            Prev_Substr_Month = "12";
            Prev_Lock_Month = Prev_Substr_Year + Prev_Substr_Month;
        }



        foreach (GridViewRow grvMothEndParamRow in grvMothEndParam.Rows)
        {
            CheckBox chkMonth = (CheckBox)grvMothEndParamRow.FindControl("chkMonth");
            CheckBox chkRevoke = (CheckBox)grvMothEndParamRow.FindControl("chkRevoke");
            Label lblLastMonth = (Label)grvMothEndParamRow.FindControl("lblLastMonth");
            Label lblLockTime = (Label)grvMothEndParamRow.FindControl("lblLockTime");
            Label lblLocationId = (Label)grvMothEndParamRow.FindControl("lblLocationId");
            
            if ((chkMonth.Checked) && (chkMonth.Enabled == true))
            {
                if (lblLastMonth.Text != Prev_Lock_Month)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Previous month not Locked");
                    return;
                }
                hdnvalue.Value = "1";
                strMonthBuilder.Append("<Details Is_Month_Lock ='" + chkMonth.Checked + "'");
                strMonthBuilder.Append(" Company_ID = '" + intCompany_ID + "'");
                strMonthBuilder.Append(" Location_ID ='" + lblLocationId.Text.ToString() + "'");
                strMonthBuilder.Append(" Lock_Month ='" + ddlFinancialMonth.SelectedValue + "'");
                strMonthBuilder.Append(" Fin_Year = '" + ddlFinacialYear.SelectedItem.Text + "'");
                strMonthBuilder.Append(" Created_By = '" + intUser_ID + "'");
                strMonthBuilder.Append(" Modified_By = '" + intUser_ID + "'/> "); ;
            }
        }
        strMonthBuilder.Append("</Root>");
    }


    private void FunGetXMLRev()
    {
        strMonthBuilderRev = new StringBuilder();
        strMonthBuilderRev.Append("<Root>");
        string strTxn;
        strTxn = "";
        foreach (GridViewRow grvMothEndParamRow in grvMothEndParam.Rows)
        {
            CheckBox chkMonth = (CheckBox)grvMothEndParamRow.FindControl("chkMonth");
            CheckBox chkRevoke = (CheckBox)grvMothEndParamRow.FindControl("chkRevoke");
            //Label lblLockMonth = (Label)grvMothEndParamRow.FindControl("lblLockMonth");
            Label lblLockTime = (Label)grvMothEndParamRow.FindControl("lblLockTime");
            Label lblLocationId = (Label)grvMothEndParamRow.FindControl("lblLocationId");
            if ((chkRevoke.Checked) && (chkRevoke.Enabled))
            {
                hdnvalue.Value = "1";
                strMonthBuilderRev.Append("<Details Is_Month_Lock ='" + false + "'");
                strMonthBuilderRev.Append(" Company_ID = '" + intCompany_ID + "'");
                strMonthBuilderRev.Append(" Location_ID ='" + lblLocationId.Text.ToString() + "'");
                strMonthBuilderRev.Append(" Lock_Month ='" + ddlFinancialMonth.SelectedValue + "'");
                strMonthBuilderRev.Append(" Fin_Year = '" + ddlFinacialYear.SelectedItem.Text + "'");
                strMonthBuilderRev.Append(" Created_By = '" + intUser_ID + "'");
                strMonthBuilderRev.Append(" Modified_By = '" + intUser_ID + "'/> ");

            }
        }
        strMonthBuilderRev.Append("</Root>");
    }


    #endregion
    private void FunPriCheckYrLock()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompany_ID.ToString());
        Procparam.Add("@Fin_Year", ObjSession.ProFinYearRW);
        DataTable dtyr = Utility_FA.GetDefaultData("FA_SYS_CHKYEARLOCK", Procparam);
        if (dtyr.Columns.Count > 1)
        {
            if (dtyr.Rows.Count > 0)
                chkYearLock.Enabled = true;
            else
                chkYearLock.Enabled = false;
        }
        else
        {
            chkYearLock.Enabled = false;
        }
        // ddlFinancialMonth.BindDataTable_FA("FA_GETFINMONTH", Procparam, new string[] { "FinMonth", "FinMonth" });

    }

    #endregion
    //To load the Financial year checkbox value for bug id 4492
    private void FunpriFinYrChkBox()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompany_ID.ToString());
        DataTable dtfc = Utility_FA.GetDefaultData("FA_SYS_FINYRSTATUS", Procparam);
        if (dtfc.Rows.Count > 0)
        {
            chkYearLock.Checked = true;
            chkYearLock.Enabled = false;
        }
        else
            chkYearLock.Checked = false;
    }
    //To load the Financial year checkbox value for bug id 4492
    #region CR31
    /// <summary>
    /// Created By : R. Manikandan 
    /// Created on : 25 - Jun - 2015
    /// Reason     : To Bring Pending Documents in FA
    /// Based on   : CR 31
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        try
        {
            tdExportDtl.Visible = false;
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_ID.ToString());
            Procparam.Add("@ML", ddlFinancialMonth.SelectedValue);
            DataSet dsPendingDoc = new DataSet();
            dsPendingDoc = Utility_FA.GetDataset("FA_PENDING_DOC", Procparam);
            if (dsPendingDoc.Tables[0].Rows.Count > 0)
            {
                tdExportDtl.Visible = true;
                StringBuilder shtml = new StringBuilder();
                shtml.Append(FunForExportExcel(dsPendingDoc));
                tdExportDtl.InnerHtml = shtml.ToString();
                string attachment = "attachment; filename= " + "Pending_Document_" + ddlFinancialMonth.SelectedItem.Text + ".xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.xls";
                Response.Write(shtml.ToString());
                Response.End();

            }
            else
            {
                tdExportDtl.Visible = false;
                Utility_FA.FunShowAlertMsg_FA(this, "No Pending Documents");
            }
        }
        catch (Exception ex)
        {

        }

    }
    protected string FunForExportExcel(DataSet ds)
    {

        StringBuilder shtml = new StringBuilder();
        shtml.Append("<html><head>");
        shtml.Append("<style type='text/css'>");
        shtml.Append(".PageHeading{background-image:url('../../images/title_headerBG.jpg');font-family:calibri,Verdana;font-weight:bold;font-size:15px;color:Navy;width:99.5%; padding-left:3px;border-bottom:0px solid #788783;border-top:0px solid #788783;margin-bottom:2px;filter:glow(color=InactiveCaptionText,strength=50);}");
        shtml.Append(".stylePageHeading{background-image:url('../../images/title_headerBG.jpg');font-family:calibri,Verdana;font-weight:bold;font-size:13px;color:Navy;width:99.5%; padding-left:3px;border-bottom:0px solid #788783;border-top:0px solid #788783;margin-bottom:2px;filter:glow(color=InactiveCaptionText,strength=50);}");
        shtml.Append(".styleGridHeader{color:Navy;text-decoration:none;background-color:aliceblue;font-weight:bold;}");
        shtml.Append(".styleInfoLabel{font-family:calibri,Verdana;font-weight:normal;font-size:13px;color:Navy;text-decoration:none;background-color:White;}");
        shtml.Append("</style>");
        shtml.Append("</head>");

        shtml.Append("<Body>");
        shtml.Append("<table width='100%'>");
        shtml.Append("<tr>");
        shtml.Append("<td align='center' class='PageHeading' colspan=" + Convert.ToSingle(ds.Tables[0].Columns.Count - 2) + " scope='col'>");
        shtml.Append(ds.Tables[1].Rows[0]["company_name"].ToString());
        shtml.Append("</td>");
        shtml.Append("</tr>");
        shtml.Append("<tr>");
        shtml.Append("<td align='center' class='PageHeading' colspan=" + Convert.ToSingle(ds.Tables[0].Columns.Count - 2) + " scope='col'>");
        shtml.Append(ds.Tables[1].Rows[0]["Years"].ToString());
        shtml.Append("</td>");
        shtml.Append("</tr>");

        shtml.Append("<tr>");
        shtml.Append("<td>");
        shtml.Append(FunReturnTable(ds.Tables[0]));
        shtml.Append("</td>");
        shtml.Append("</tr>");


        shtml.Append("</table>");

        return shtml.ToString();

    }
    private string FunReturnTable(DataTable dtDetails)
    {
        StringBuilder shtml = new StringBuilder();
        shtml.Append(" <table class='styleGridView' cellspacing='0' cellpadding='1' rules='all' border='0'style='color: #003D9E; font-family: calibri;font-size: 13px; font-weight: normal; width: 100%; border-collapse: collapse;'>");

        shtml.Append("<tr>");
        for (int i = 0; i < dtDetails.Columns.Count; i++)
        {
            shtml.Append("<td style='border: 1px solid #EFF4FF;' class='styleGridHeader' align='left' scope='col' >");
            shtml.Append(dtDetails.Columns[i].Caption.ToString().Replace("_", " ") + " </td>");

        }
        shtml.Append("</tr>");
        for (int i = 0; i < dtDetails.Rows.Count; i++)
        {
            shtml.Append("<tr>");
            for (int j = 0; j < dtDetails.Columns.Count; j++)
            {
                if (dtDetails.Rows[i][j].GetType() == Type.GetType("System.Int32") || dtDetails.Rows[i][j].GetType() == Type.GetType("System.Decimal"))
                    shtml.Append("<td style='border: 1px solid #EFF4FF;' class='styleInfoLabel' align='right' scope='col' >");
                else
                    shtml.Append("<td style='border: 1px solid #EFF4FF;mso-number-format:\"" + @"\@" + "\"" + "' class='styleInfoLabel' align='right' scope='col' >");

                shtml.Append(dtDetails.Rows[i][j].ToString() + " </td>");
            }
            shtml.Append("</tr>");
        }
        shtml.Append("</table>");

        return shtml.ToString();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

    protected void btnDimClose_Click(object sender, EventArgs e)
    {
        ModalPopupExtenderPassword.Hide();
    }
    # endregion CR31


    protected void btnFetch_ServerClick(object sender, EventArgs e)
    {

    }
    protected void btnupdateopening_ServerClick(object sender, EventArgs e)
    {

    }
}
