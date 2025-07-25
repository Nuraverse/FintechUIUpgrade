
#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name         :   Scheduled Jobs
/// Screen Name         :   Scheduled Jobs 
/// Created By          :   Muni Kavitha    
/// Created Date        :   
/// Purpose             :   To save Scheduled Jobs details
/// Created By          :  Prabhu.K 
/// Created Date        :  20-dec-2011 
/// Purpose             :  To Develop the Scheduled Jobs as per new requirement
/// Modified By         :  Sathish R 
/// Created Date        :  21-Apr-2019 
/// Purpose             :  Factoring Month End Job Functionality Added
/// 
/// 
/// <Program Summary>
#endregion


#region Namespaces
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.ServiceModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Web.Security;
using System.IO;
using System.Xml;
using S3GBusEntity.ScheduledJobs;
using System.Globalization;
using Resources;
using System.Linq;
#endregion


public partial class S3GSysAdminScheduledJobs : ApplyThemeForProject
{
    #region Common Variable declaration
    int intCompanyID, intUserID = 0;
    Dictionary<string, string> Procparam = null;
    string strApprLogicID = "0";
    int intErrCode = 0;
    int intScheduleJobId = 0;
    UserInfo ObjUserInfo = new UserInfo();
    SerializationMode SerMode = SerializationMode.Binary;
    ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsDataTable objScheduledJobsDataTable = null;
    ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsRow objScheduledJobsRow = null;
    ScheduledJobMgtServicesReference.ScheduledJobMgtServicesClient objScheduleMgtServiceClient = null;
    S3GSession ObjS3GSession = null;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "S3GSysAdminScheduledJobs.aspx";
    string strRedirectPageView = "S3GSysAdminScheduledJobsView.aspx";

    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminScheduledJobs.aspx';";
    string strRedirectPageView1 = "window.location.href='../System Admin/S3GSysAdminScheduledJobsView.aspx';";

    string strDateFormat = string.Empty;
    //string strcode = "";
    static string strPageName = "Scheduled Jobs";
    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    string strSch_ID = "0";
    string strTransactionType = "0";

    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();

        }
        catch (Exception ex)
        {
            //cvScheduledJobs.ErrorMessage = Resources.ValidationMsgs.S3G_ErrMsg_PageLoad + this.Page.Header.Title;
            //cvScheduledJobs.IsValid = false;

            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }

    }

    #endregion

    #region Private Methods

    private void FunPriLoadPage()
    {

        try
        {

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            FunPubSetIndex(1);
            if (Request.QueryString["qsMode"] != null)
            {
                strMode = Request.QueryString["qsMode"].ToString();
            }
            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket formTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
                if (formTicket != null)
                {
                    strSch_ID = formTicket.Name;
                }
            }


            ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            //User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            //Code end
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            calDocDate.Format = strDateFormat;
            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();
            // txtStartDate.Attributes.Add("readonly", "true");
            if (!IsPostBack)
            {
                FunPubBindFunctionGrid();
                FunPubBindMailCCGrid();
                FunPubBindMailBCCGrid();
                txtStartDate.Attributes.Add("onchange", "fnDoDate(this,'" + txtStartDate.ClientID + "','" + strDateFormat + "',false, true);");
                if ((strSch_ID != "") && (strMode == "Q")) // Query  Mode
                {
                    FunPriDisableControls(-1);
                    FunBindJobRunDetails();
                    ddlOcbReportType.Enabled = false;
                }
                else if (strMode == "M") //Modify Mode
                {
                    FunPriDisableControls(1);
                    FunBindJobRunDetails();
                    tmRefereshData.Enabled = true;
                    pnlGridExeceptionDetails.GroupingText = "Schedule Job Details-Grid Data Refresh Every 5 Seconds Automatically";
                    if (ddlJob.SelectedValue == "39")
                    {
                        ddlOcbReportType.Enabled = true;
                        divOcbReportType.Visible = true;
                        btnDownloadOcbExcpetion.Enabled_True();
                    }
                    else
                    {
                        divOcbReportType.Visible = false;
                        ddlOcbReportType.Enabled = false;
                        btnDownloadOcbExcpetion.Enabled_False();
                    }
                }
                else //Create Mode
                {
                    FunPriDisableControls(0);
                    divOcbReportType.Visible = false;
                    pnlGridExeceptionDetails.Visible = false;
                }
                ddlLocation.Focus();//Added by Suseela
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }

    }

    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    {
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                        //btnClear.Enabled = true;
                        btnClear.Enabled_True();
                        chkActive.Checked = true;
                        chkActive.Enabled = false;
                        FunPriLoadLov();
                        if (!bCreate)
                        {
                            //btnSave.Enabled = false;
                            btnSave.Enabled_False();
                        }
                        break;
                    }

                case -1:// Query Mode
                    {
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                        if (!bQuery)
                        {
                            Response.Redirect(strRedirectPage, false);
                        }
                        FunGetScheduledJobsDetails();
                        //chkActive.Enabled =
                        chkHoliday.Enabled = false;
                        // chkActive.Checked = true;
                        chkActive.Enabled = false;
                        //btnClear.Enabled = false;
                        btnClear.Enabled_False();
                        btnSave.Enabled_False();
                        calDocDate.Enabled = false;
                        //btnSave.Enabled = false;
                        ddlJobNature.ClearDropDownList();
                        ddlFrequency.ClearDropDownList();
                        ddlLocation.ClearDropDownList();
                        ddlJob.ClearDropDownList();
                        calDocDate.Enabled = false;
                        txtJobDescription.ReadOnly =
                        txtRemarks.ReadOnly = txtFrqText.ReadOnly = txtStartDate.ReadOnly = txtStartTime.ReadOnly = true;
                        chklstFrquency.Enabled = false;
                        txtmailTo.ReadOnly = txtMailcc.ReadOnly = txtMailBcc.ReadOnly = true;
                        grvFunctions.Columns[grvFunctions.Columns.Count - 2].Visible = false;
                        grvMailCC.Columns[grvMailCC.Columns.Count - 2].Visible = false;
                        grvMailBCC.Columns[grvMailBCC.Columns.Count - 2].Visible = false;
                        if (grvFunctions != null && grvFunctions.FooterRow != null)
                        {
                            grvFunctions.FooterRow.Visible = false;
                        }
                        //else
                        //{
                        //    grvFunctions.EmptyDataText = "No Record Found";
                        //}
                        if (grvMailCC != null && grvMailCC.FooterRow != null)
                        {
                            grvMailCC.FooterRow.Visible = false;
                        }
                        if (grvMailBCC != null && grvMailBCC.FooterRow != null)
                        {
                            grvMailBCC.FooterRow.Visible = false;
                        }
                        // txtMinutes.ReadOnly = true;
                        break;
                    }
                case 1:// Modify Mode
                    {
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                        if (!bQuery)
                        {
                            Response.Redirect(strRedirectPage, false);
                        }

                        rfvFrequency.Enabled = false;
                        FunGetScheduledJobsDetails();
                        //chkActive.Enabled = 
                        //   chkActive.Checked = true;
                        chkActive.Enabled = true; ;
                        chkHoliday.Enabled = false;
                        //btnClear.Enabled = false;
                        btnClear.Enabled_False();
                        calDocDate.Enabled = false;
                        btnSave.Enabled_True();
                        //btnSave.Enabled = false;
                        ddlJobNature.ClearDropDownList();
                        ddlFrequency.ClearDropDownList();
                        ddlLocation.ClearDropDownList();
                        ddlJob.ClearDropDownList();
                        txtJobDescription.ReadOnly =
                        txtRemarks.ReadOnly = txtFrqText.ReadOnly = txtStartDate.ReadOnly = txtStartTime.ReadOnly = true;
                        chklstFrquency.Enabled = false;
                        txtmailTo.ReadOnly = txtMailcc.ReadOnly = txtMailBcc.ReadOnly = true;
                        // txtMinutes.ReadOnly = true;
                        break;
                    }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadLov()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "1");
            Procparam.Add("@CompanyID", intCompanyID.ToString());
            ddlFrequency.BindDataTable("S3G_SCH_LOADLOV", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });

            Procparam.Clear();
            Procparam.Add("@Option", "2");
            Procparam.Add("@CompanyID", intCompanyID.ToString());
            ddlJobNature.BindDataTable("S3G_SCH_LOADLOV", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });

            Procparam.Clear();
            Procparam.Add("@Option", "3");
            Procparam.Add("@CompanyID", intCompanyID.ToString());
            ddlJob.BindDataTable("S3G_SCH_LOADLOV", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });

            /*
            Procparam.Clear();
            if (intScheduleJobId == 0)
            {
                Procparam.Add("@Is_Active", "1");
            }
            Procparam.Add("@User_Id", intUserID.ToString());
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Program_Id", "205");
            Procparam.Add("@Option", "1");
            ddlLocation.BindDataTable(SPNames.BranchMaster_LIST, Procparam, new string[] { "Location_ID", "Location" });
             */

            FunPriGetBranchList();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadFileType()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "4");
            Procparam.Add("@CompanyID", intCompanyID.ToString());
            ddlFileType.BindDataTable("S3G_SCH_LOADLOV", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriGetBranchList()
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (intScheduleJobId == 0)
            {
                Procparam.Add("@Is_Active", "1");
            }
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Option", "1");
            Procparam.Add("@Program_ID", "205");
            ddlLocation.BindDataTable("S3G_GET_LOCATION", Procparam, new string[] { "BRANCH_ID", "BRANCH" });
            ddlLocation.AddItemToolTip();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunGetScheduledJobsDetails()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo.ProCompanyIdRW.ToString());
            Procparam.Add("@Schedule_ID", (strSch_ID));
            DataSet dtScheduleDetails = Utility.GetDataset("S3G_Sysad_GetScheduleDetails", Procparam);
            //DataTable dtScheduleDetails = Utility.GetDefaultData("S3G_Sysad_GetScheduleDetails", Procparam);
            FunPriLoadLov();
            if (dtScheduleDetails.Tables[0].Rows.Count > 0)
            {
                ddlLocation.SelectedValue = dtScheduleDetails.Tables[0].Rows[0]["Location"].ToString();
                txtJobDescription.Text = dtScheduleDetails.Tables[0].Rows[0]["JobDescription"].ToString();
                ddlJobNature.SelectedValue = dtScheduleDetails.Tables[0].Rows[0]["JobNature"].ToString();
                ddlJob.SelectedValue = dtScheduleDetails.Tables[0].Rows[0]["ScheduleJob"].ToString();
                txtStartDate.Text = dtScheduleDetails.Tables[0].Rows[0]["StartDate"].ToString();
                txtStartTime.Text = dtScheduleDetails.Tables[0].Rows[0]["StartTime"].ToString();
                //txtMinutes.Text =MAIL_TO,mail_cc,MAIL_BCC
                txtFrqText.Text = dtScheduleDetails.Tables[0].Rows[0]["Time_In_Mins"].ToString();
                ddlFrequency.SelectedValue = dtScheduleDetails.Tables[0].Rows[0]["Frequency"].ToString();
                chkHoliday.Checked = Convert.ToBoolean(dtScheduleDetails.Tables[0].Rows[0]["Holiday"]);
                txtRemarks.Text = dtScheduleDetails.Tables[0].Rows[0]["Remarks"].ToString();
                chkActive.Checked = Convert.ToBoolean(dtScheduleDetails.Tables[0].Rows[0]["Is_Active"]);
                dvFileType.Visible = false;
                if (ddlJob.SelectedValue == "36")// Terriost Data Upload
                {
                    dvFileType.Visible = true;
                    FunPriLoadFileType();
                    ddlFileType.SelectedValue = Convert.ToString(dtScheduleDetails.Tables[0].Rows[0]["FILE_TYPE"]);
                }
                // txtmailTo.Text = dtScheduleDetails.Rows[0]["MAIL_TO"].ToString();
                //txtMailcc.Text = dtScheduleDetails.Rows[0]["mail_cc"].ToString();
                //txtMailBcc.Text = dtScheduleDetails.Rows[0]["MAIL_BCC"].ToString();

            }

            if (strMode == "Q")
            {
                if (dtScheduleDetails.Tables[1].Rows.Count > 0)
                {
                    ViewState["FunctionDetails"] = dtScheduleDetails.Tables[1];
                    grvFunctions.DataSource = dtScheduleDetails.Tables[1];
                    grvFunctions.DataBind();
                }
                else
                {
                    grvFunctions.EmptyDataText = "No Record Found";
                    grvFunctions.DataBind();
                }
                if (dtScheduleDetails.Tables[2].Rows.Count > 0)
                {
                    ViewState["MailCCDetails"] = dtScheduleDetails.Tables[2];
                    grvMailCC.DataSource = dtScheduleDetails.Tables[2];
                    grvMailCC.DataBind();
                }
                else
                {
                    grvMailCC.EmptyDataText = "No Record Found";
                    grvMailCC.DataBind();
                }
                if (dtScheduleDetails.Tables[3].Rows.Count > 0)
                {
                    ViewState["MailBCCDetails"] = dtScheduleDetails.Tables[3];
                    grvMailBCC.DataSource = dtScheduleDetails.Tables[3];
                    grvMailBCC.DataBind();
                }
                else
                {
                    grvMailBCC.EmptyDataText = "No Record Found";
                    grvMailBCC.DataBind();
                }
            }
            else if (strMode == "M")
            {
                if (dtScheduleDetails.Tables[1].Rows.Count > 0)
                {
                    ViewState["FunctionDetails"] = dtScheduleDetails.Tables[1];
                    grvFunctions.DataSource = dtScheduleDetails.Tables[1];
                    grvFunctions.DataBind();
                }
                else
                {
                    FunPubBindFunctionGrid();
                }
                if (dtScheduleDetails.Tables[2].Rows.Count > 0)
                {
                    ViewState["MailCCDetails"] = dtScheduleDetails.Tables[2];
                    grvMailCC.DataSource = dtScheduleDetails.Tables[2];
                    grvMailCC.DataBind();
                }
                else
                {
                    FunPubBindMailCCGrid();
                }
                if (dtScheduleDetails.Tables[3].Rows.Count > 0)
                {
                    ViewState["MailBCCDetails"] = dtScheduleDetails.Tables[3];
                    grvMailBCC.DataSource = dtScheduleDetails.Tables[3];
                    grvMailBCC.DataBind();
                }
                else
                {
                    FunPubBindMailBCCGrid();
                }
                if (Convert.ToInt32(ddlFrequency.SelectedValue) == 1)  //Time In Minutes
                {
                    txtFrqText.Text = Convert.ToString(dtScheduleDetails.Tables[0].Rows[0]["Frequency"]);
                    //txtFrqText.Style["display"] = "block";
                    //lblFrqText.Style["visibility"] = "visible";
                    //lblFrqText.Text = "Time In Minutes *";
                    //rfvFrequencyTxt.Enabled = true;
                    lblFrqText.Text = "Time In Minutes*";
                    lblFrqText.Visible = true;
                    divfreq.Visible = true;
                    txtFrqText.Visible = true;
                    chklstFrquency.Visible = false;
                }
                if (Convert.ToInt32(ddlFrequency.SelectedValue) >= 4)  //Monthly
                {
                    txtFrqText.Text = Convert.ToString(dtScheduleDetails.Tables[0].Rows[0]["Frequency"]);
                    lblFrqText.Text = "Day*";
                    lblFrqText.Visible = true;
                    divfreq.Visible = true;
                    txtFrqText.Visible = true;
                    chklstFrquency.Visible = false;
                }
                else if (Convert.ToInt32(ddlFrequency.SelectedValue) == 3)  //Weekly
                {
                    ListItem listItem = chklstFrquency.Items.FindByValue(Convert.ToString(dtScheduleDetails.Tables[0].Rows[0]["Frequency"]));
                    if (listItem != null) listItem.Selected = true;
                    lblFrqText.Text = "Day*";
                    chklstFrquency.Visible = true;
                    txtFrqText.Visible = false;
                    divfreq.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            //throw ex;
        }
    }

    private void FunPubBindFunctionGrid()
    {
        try
        {

            DataTable dtUsers = new DataTable();
            DataRow dr;
            dtUsers.Columns.Add("SNO");
            dtUsers.Columns.Add("FUNCTION_ID");
            dtUsers.Columns.Add("FUNCTION_NAME");
            dtUsers.Columns.Add("MasterID");
            dr = dtUsers.NewRow();
            dtUsers.Rows.Add(dr);
            grvFunctions.DataSource = dtUsers;
            grvFunctions.DataBind();
            dtUsers.Rows[0].Delete();
            ViewState["FunctionDetails"] = dtUsers;
            grvFunctions.Rows[0].Visible = false;

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }
    private void FunPubBindMailCCGrid()
    {
        try
        {

            DataTable dtUsers = new DataTable();
            DataRow dr;
            dtUsers.Columns.Add("SNO");
            dtUsers.Columns.Add("FUNCTION_ID");
            dtUsers.Columns.Add("FUNCTION_NAME");
            dtUsers.Columns.Add("MasterID");
            dr = dtUsers.NewRow();
            dtUsers.Rows.Add(dr);
            grvMailCC.DataSource = dtUsers;
            grvMailCC.DataBind();
            dtUsers.Rows[0].Delete();
            ViewState["MailCCDetails"] = dtUsers;
            grvMailCC.Rows[0].Visible = false;

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }
    private void FunPubBindMailBCCGrid()
    {
        try
        {

            DataTable dtUsers = new DataTable();
            DataRow dr;
            dtUsers.Columns.Add("SNO");
            dtUsers.Columns.Add("FUNCTION_ID");
            dtUsers.Columns.Add("FUNCTION_NAME");
            dtUsers.Columns.Add("MasterID");
            dr = dtUsers.NewRow();
            dtUsers.Rows.Add(dr);
            grvMailBCC.DataSource = dtUsers;
            grvMailBCC.DataBind();
            dtUsers.Rows[0].Delete();
            ViewState["MailBCCDetails"] = dtUsers;
            grvMailBCC.Rows[0].Visible = false;

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }
    private void FunBindJobRunDetails()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Schedule_Id", strSch_ID);
            DataTable dtJobDetails = Utility.GetDefaultData("S3G_SA_GET_SCHEDULE_RUN_DET", Procparam);
            if (dtJobDetails.Rows.Count > 0)
            {
                gvJobDetails.DataSource = dtJobDetails;
                gvJobDetails.DataBind();
                pnlGridExeceptionDetails.Visible = true;

                if (Convert.ToInt32(ddlJob.SelectedValue) == 15 || Convert.ToInt32(ddlJob.SelectedValue) == 16 || Convert.ToInt32(ddlJob.SelectedValue) == 17 || Convert.ToInt32(ddlJob.SelectedValue) == 18)//Factoring 15-ODI,16-REGULAR INTEREST,17-LOC,18-DIFF SC,
                {
                    if (strMode == "M")
                    {
                        gvJobDetails.Columns[11].Visible = true;
                        gvJobDetails.Columns[12].Visible = true;
                        btnSave.Enabled_False();
                    }
                    else
                    {
                        gvJobDetails.Columns[11].Visible = false;
                        gvJobDetails.Columns[12].Visible = false;

                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void ExportToExcel(GridView Grd, String FileName)
    {
        try
        {
            string attachment = "attachment; filename=" + FileName + ".xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());

            Response.ContentType = "application/vnd.xls";
            System.Text.StringBuilder StrBuildHtml = new System.Text.StringBuilder();
            StrBuildHtml.Append("<html>");
            StrBuildHtml.Append("<table  width='60%' CssClass='styleInfoLabel' class='styleGridHeader' align='center' BorderColor='000000' cellpadding=1 cellspacing=0 border=1>");
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td align='center'>");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("Job Details for " + ddlJob.SelectedItem.Text);
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("</tr>");
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("</tr>");
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);



            foreach (GridViewRow gv in Grd.Rows)
            {
                for (int i = 0; i <= gv.Cells.Count - 1; i++)
                {
                    if (i > 0)
                    {

                        if (!string.IsNullOrEmpty(gv.Cells[i].Text))
                        {
                            Int32 type = 0;       // 1 = int, 2 = datetime, 3 = string
                            type = FunPriTypeCast(gv.Cells[i].Text);
                            switch (type)
                            {
                                case 1:  // int - right to left
                                    if (ddlJob.SelectedValue == "15")
                                    {
                                        if (i != 8)
                                        {
                                            gv.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                                            gv.Cells[i].Attributes["style"] = "mso-number-format:\\#\\,\\#\\#0\\.000\\";
                                        }
                                    }
                                    else if (ddlJob.SelectedValue == "16")
                                    {
                                        if (i != 2)
                                        {
                                            gv.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                                            gv.Cells[i].Attributes["style"] = "mso-number-format:\\#\\,\\#\\#0\\.000\\";
                                        }
                                    }
                                    else
                                    {
                                        gv.Cells[i].HorizontalAlign = HorizontalAlign.Right;
                                        gv.Cells[i].Attributes["style"] = "mso-number-format:\\#\\,\\#\\#0\\.000\\";
                                    }

                                    break;
                                case 3:  // string - do nothing - left align(default)
                                    gv.Cells[i].Attributes["style"] = "mso-number-format:\\@;";
                                    gv.Cells[i].HorizontalAlign = HorizontalAlign.Left;
                                    break;
                                case 2:  // string - do nothing - left align(default)
                                    gv.Cells[i].Attributes["style"] = "mso-number-format:\\@;";
                                    gv.Cells[i].HorizontalAlign = HorizontalAlign.Left;
                                    break;
                            }
                        }

                    }
                }
            }



            Grd.RenderControl(htw);
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td class='stylePageHeading' style='width:100px;' align='center' fontbold=true>");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append(sw.ToString());
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");
            StrBuildHtml.Append("</table>");
            StrBuildHtml.Append("</html>");
            Response.Write(StrBuildHtml.ToString());
            Response.End();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    private Int32 FunPriTypeCast(string val)
    {
        try                                                         // casting - to use proper align       
        {
            Int32 tempint = Convert.ToInt32(Convert.ToDecimal(val));                   // Try int     
            return 1;
        }
        catch (Exception ex)
        {
            try
            {
                DateTime tempdatetime = Convert.ToDateTime(val);    // try datetime
                return 2;
            }
            catch (Exception ex1)
            {
                return 3;                                           // try String
            }
        }


    }
    #endregion

    #region Button Events


    protected void btnSave_Click(object sender, EventArgs e)
    {
        objScheduleMgtServiceClient = new ScheduledJobMgtServicesReference.ScheduledJobMgtServicesClient();
        try
        {
            if (Convert.ToInt32(ddlFrequency.SelectedValue) == 4) //MONTHLY
            {
                if (Convert.ToInt32(txtFrqText.Text) > 31 && txtFrqText.Text != "")
                {
                    Utility.FunShowAlertMsg(this, "Days should be entered between 1 to 31");
                    txtFrqText.Text = "";
                    txtFrqText.Focus();
                    return;
                }
            }
            if (Convert.ToInt32(ddlFrequency.SelectedValue) == 5)//QUARTERLY
            {
                if (Convert.ToInt32(txtFrqText.Text) > 92 && txtFrqText.Text != "")
                {
                    Utility.FunShowAlertMsg(this, "Days should be entered between 1 to 92");
                    txtFrqText.Text = "";
                    txtFrqText.Focus();
                    return;
                }
            }
            if (Convert.ToInt32(ddlFrequency.SelectedValue) == 6)//HALF YEARLY
            {
                if (Convert.ToInt32(txtFrqText.Text) > 188 && txtFrqText.Text != "")
                {
                    Utility.FunShowAlertMsg(this, "Days should be entered between 1 to 188");
                    txtFrqText.Text = "";
                    txtFrqText.Focus();
                    return;
                }
            }
            if (Convert.ToInt32(ddlFrequency.SelectedValue) == 7)//ANUALLY
            {
                if (Convert.ToInt32(txtFrqText.Text) > 366 && txtFrqText.Text != "")
                {
                    Utility.FunShowAlertMsg(this, "Days should be entered between 1 to 366");
                    txtFrqText.Text = "";
                    txtFrqText.Focus();
                    return;
                }
            }
            if (Convert.ToInt32(ddlFrequency.SelectedValue) == 3)  //Weekly
            {
                List<ListItem> selected = chklstFrquency.Items.Cast<ListItem>().Where(li => li.Selected).ToList();
                if (selected.Count == 0)
                {
                    Utility.FunShowAlertMsg(this, "Select the Day of the week");
                    return;
                }
            }

            objScheduledJobsDataTable = new ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsDataTable();
            objScheduledJobsRow = objScheduledJobsDataTable.NewS3G_SYSAD_ScheduledJobsRow();
            objScheduledJobsRow.Location_Code = ddlLocation.SelectedValue;
            objScheduledJobsRow.JobDescription = txtJobDescription.Text;
            objScheduledJobsRow.JobNature = Convert.ToInt32(ddlJobNature.SelectedValue);
            objScheduledJobsRow.Schedule_Job = Convert.ToInt32(ddlJob.SelectedValue);
            objScheduledJobsRow.Frequency = Convert.ToInt32(ddlFrequency.SelectedValue);
            if (ddlFrequency.SelectedValue == "1")
            {
                objScheduledJobsRow.Time_In_Mins = Convert.ToInt32(txtFrqText.Text);
            }
            objScheduledJobsRow.ID = strSch_ID;
            objScheduledJobsRow.StartDateTime = Utility.StringToDate(txtStartDate.Text + " " + txtStartTime.Text);
            objScheduledJobsRow.Holiday = chkHoliday.Checked;
            objScheduledJobsRow.Remarks = txtRemarks.Text;
            objScheduledJobsRow.Mail_TO = ((DataTable)ViewState["FunctionDetails"]).FunPubFormXml();//ViewState["FunctionDetails"]
            objScheduledJobsRow.Mail_CC = ((DataTable)ViewState["MailCCDetails"]).FunPubFormXml();
            objScheduledJobsRow.Mail_BCC = ((DataTable)ViewState["MailBCCDetails"]).FunPubFormXml();
            objScheduledJobsRow.Created_By = intUserID;
            objScheduledJobsRow.Company_ID = intCompanyID;
            objScheduledJobsRow.Is_Active = chkActive.Checked;
            if (ddlFileType.SelectedValue != "0" && ddlFileType.SelectedValue != string.Empty)
            {
                objScheduledJobsRow.FileType = ddlFileType.SelectedValue;
            }
            objScheduledJobsDataTable.AddS3G_SYSAD_ScheduledJobsRow(objScheduledJobsRow);
            byte[] byteobjScheduledJobsDataTable = ClsPubSerialize.Serialize(objScheduledJobsDataTable, SerMode);
            intErrCode = objScheduleMgtServiceClient.FunPubCreateScheduledJobs(out strSch_ID, SerMode, byteobjScheduledJobsDataTable);
            if (intErrCode == 0)
            {
                strAlert = "Job Scheduled Successfully";
                strAlert += @"\n\nWould you like to Schedule one more Job?";
                strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView1 + "}";
                if (strMode == "M")
                {
                    strKey = "Modify";
                    strAlert = "Schedule Job details updated successfully";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageView1 + "}else {" + strRedirectPageAdd + "}";
                    strRedirectPageView = "";
                    //btnSave.Enabled = false;
                    btnSave.Enabled_False();
                }
            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this, "Mail ID not exists in User Master");
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Due to Data Problem,Unable to schedule the Job");
            }
            strRedirectPageView1 = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView1, true);
            btnSave.Focus();//Added by Suseela

        }
        catch (Exception ex)
        {
            //cvScheduledJobs.ErrorMessage = Resources.ValidationMsgs.S3G_ErrMsg_Save + this.Page.Header.Title;
            //cvScheduledJobs.IsValid = false;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {

            ddlJobNature.SelectedValue = "0";
            ddlFrequency.SelectedValue = "0";
            ddlLocation.SelectedValue = "0";
            ddlJob.SelectedValue = "0";
            txtStartDate.Text = txtJobDescription.Text =
            txtRemarks.Text = txtStartTime.Text = txtFrqText.Text = "";
            //txtMinutes.Text = "";
            chkHoliday.Checked = false;
            //chkActive.Checked
            chklstFrquency.Items.Clear();
            txtMailBcc.Text = txtMailcc.Text = txtmailTo.Text = "";
            dvFileType.Visible = false;
            btnClear.Focus();//Added by Suseela
            grvFunctions.DataSource = null;
            grvFunctions.DataBind();
            FunPubBindFunctionGrid();
            grvMailBCC.DataSource = null;
            grvMailBCC.DataBind();
            FunPubBindMailBCCGrid();
            grvMailCC.DataSource = null;
            grvMailCC.DataBind();
            FunPubBindMailCCGrid();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageView);
            btnCancel.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnViewExeption_Click(object sender, EventArgs e)
    {
        try
        {
            System.Web.UI.HtmlControls.HtmlButton btnView = sender as System.Web.UI.HtmlControls.HtmlButton;
            GridViewRow grvRow = (GridViewRow)btnView.Parent.Parent.Parent.Parent;

            Label lblGvSchedulejob_Status_Id = (Label)grvRow.FindControl("lblSchedulejob_Status_Id");
            Label lblGVStatusCode = (Label)grvRow.FindControl("lblStatusCode");

            string strMode = string.Empty;

            if (ddlJob.SelectedValue == "6") //For Pasi Adjustment
                strTransactionType = "6";
            else if (ddlJob.SelectedValue == "7") //For Salary Adjustment(SJV FOR EMI DEDUCTION)
                strTransactionType = "7";
            else if (ddlJob.SelectedValue == "8") //For Rental Adjustment/EMI Deduction Data to HRMS
                strTransactionType = "1";
            else if (ddlJob.SelectedValue == "9") //For Telephone Exp Adjust to HRMS
                strTransactionType = "2";
            else if (ddlJob.SelectedValue == "10") //For Marketing Incentive data to HRMS
                strTransactionType = "3";
            else if (ddlJob.SelectedValue == "11") //For DC Incentive data to HRMS
                strTransactionType = "4";
            else if (ddlJob.SelectedValue == "12") //For Salary Process to FA
                strTransactionType = "5";
            else if (ddlJob.SelectedValue == "13") //For Petti Cash Process to FA
                strTransactionType = "8";

            else if (ddlJob.SelectedValue == "14") //For Salary Deduction from HRMS to FA
                strTransactionType = "9";

            else if (ddlJob.SelectedValue == "15" || ddlJob.SelectedValue == "16" || ddlJob.SelectedValue == "17" || ddlJob.SelectedValue == "18")//Factoring ODI Job
            {
                strTransactionType = ddlJob.SelectedValue;
            }
            else if (ddlJob.SelectedValue == "19") //For FM13 PRocess
                strTransactionType = "19";
            else if (ddlJob.SelectedValue == "27") //For FM13 PRocess
                strTransactionType = "27";
            else if (ddlJob.SelectedValue == "20" || ddlJob.SelectedValue == "21" || ddlJob.SelectedValue == "22" || ddlJob.SelectedValue == "23"
                        || ddlJob.SelectedValue == "24" || ddlJob.SelectedValue == "25" || ddlJob.SelectedValue == "26")//SMS
            {
                strTransactionType = ddlJob.SelectedValue;
            }
            else if (ddlJob.SelectedValue == "38")
            {
                strTransactionType = "38";

            }
            else if (ddlJob.SelectedValue == "37")
            {
                strTransactionType = "37";
            }
            else
                strTransactionType = "0";


            if (lblGVStatusCode.Text.ToUpper() == "E")
                strMode = "1";   //View Exception details
            else
                strMode = "2"; //View success data details


            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Schjob_Status_ID", lblGvSchedulejob_Status_Id.Text);
            Procparam.Add("@Mode", strMode);
            if (ddlJob.SelectedValue == "6" || ddlJob.SelectedValue == "7" || ddlJob.SelectedValue == "8" || ddlJob.SelectedValue == "9" || ddlJob.SelectedValue == "10" || ddlJob.SelectedValue == "11" || ddlJob.SelectedValue == "12" || ddlJob.SelectedValue == "13" || ddlJob.SelectedValue == "14")//HRMS
                Procparam.Add("@OPTION", "1");//HRMS
            else if (ddlJob.SelectedValue == "15" || ddlJob.SelectedValue == "16" || ddlJob.SelectedValue == "17" || ddlJob.SelectedValue == "18" || ddlJob.SelectedValue == "38" || ddlJob.SelectedValue == "37")//Factoring ODI,INCOME,LOC,DIFF SC,FACTORING MIS
                Procparam.Add("@OPTION", "2");//FACTORING MONTH END JOBS
            else if (ddlJob.SelectedValue == "19")//FM13
                Procparam.Add("@OPTION", "3");//LEASING

            else if (ddlJob.SelectedValue == "20" || ddlJob.SelectedValue == "21" || ddlJob.SelectedValue == "22" || ddlJob.SelectedValue == "23" || ddlJob.SelectedValue == "24"
                            || ddlJob.SelectedValue == "25" || ddlJob.SelectedValue == "26")//SMS
                Procparam.Add("@OPTION", "4");
            else if (ddlJob.SelectedValue == "39")
                Procparam.Add("@OPTION", "5");

            //Below else if added on 28-12-2021, for leasing overdue report
            else if (ddlJob.SelectedValue == "43")
                Procparam.Add("@OPTION", "6");


            if (ddlJob.SelectedValue == "39")
                Procparam.Add("@Transaction_Type", ddlOcbReportType.SelectedValue);
            else
                Procparam.Add("@Transaction_Type", strTransactionType);

            if (ddlJob.SelectedValue == "39")//OCB Report
            {
                Utility.FunShowAlertMsg(this, "Select the OCB Report Type");
                return;
            }

            DataTable dt_Trans_Excel = Utility.GetDefaultData("S3G_SA_GET_SCHJOB_EXCEPTIONDET", Procparam);
            if (dt_Trans_Excel.Rows.Count > 0)
            {
                gvExceptionDetToExcel.DataSource = dt_Trans_Excel;
                gvExceptionDetToExcel.DataBind();
                if (ddlJob.SelectedValue == "38")//Factroing MIS
                {
                    funPriDataTabletoExcel(dt_Trans_Excel, txtJobDescription.Text);
                }
                else if (ddlJob.SelectedValue == "37")//Account MIS
                {
                    funPriDataTabletoExcel(dt_Trans_Excel, txtJobDescription.Text);
                }
                else if (ddlJob.SelectedValue == "39")//OCB Report
                {
                    funPriDataTabletoExcel(dt_Trans_Excel, txtJobDescription.Text);
                }
                else
                {
                    ExportToExcel(gvExceptionDetToExcel, "JobDataDetails");
                }
            }
            else
            {
                if (ddlJob.SelectedValue == "19")//FM13 Process
                {
                    Utility.FunShowAlertMsg(this, "No Exception Found, View Excel files in Delinquency Spooling");
                }
                else
                {
                    Utility.FunShowAlertMsg(this, "No Record Found");
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnViewFactoringMIS_Click(object sender, EventArgs e)
    {
        try
        {
            //  String Req = sende

            System.Web.UI.HtmlControls.HtmlButton btnView = sender as System.Web.UI.HtmlControls.HtmlButton;
            GridViewRow grvRow = (GridViewRow)btnView.Parent.Parent.Parent.Parent;

            Label lblGvSchedulejob_Status_Id = (Label)grvRow.FindControl("lblSchedulejob_Status_Id");
            Label lblGVStatusCode = (Label)grvRow.FindControl("lblStatusCode");


            strTransactionType = "38";


            string strMode = string.Empty;




            if (lblGVStatusCode.Text.ToUpper() == "E")
                strMode = "1";   //View Exception details
            else
                strMode = "2"; //View success data details


            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Schjob_Status_ID", lblGvSchedulejob_Status_Id.Text);
            Procparam.Add("@Mode", strMode);
            if (ddlJob.SelectedValue == "6" || ddlJob.SelectedValue == "7" || ddlJob.SelectedValue == "8" || ddlJob.SelectedValue == "9" || ddlJob.SelectedValue == "10" || ddlJob.SelectedValue == "11" || ddlJob.SelectedValue == "12" || ddlJob.SelectedValue == "13" || ddlJob.SelectedValue == "14")//HRMS
                Procparam.Add("@OPTION", "1");//HRMS
            else if (ddlJob.SelectedValue == "15" || ddlJob.SelectedValue == "16" || ddlJob.SelectedValue == "17" || ddlJob.SelectedValue == "18" || ddlJob.SelectedValue == "38" || ddlJob.SelectedValue == "37")//Factoring ODI,INCOME,LOC,DIFF SC,FACTORING MIS
                Procparam.Add("@OPTION", "2");//FACTORING MONTH END JOBS
            else if (ddlJob.SelectedValue == "19")//FM13
                Procparam.Add("@OPTION", "3");//LEASING

            else if (ddlJob.SelectedValue == "20" || ddlJob.SelectedValue == "21" || ddlJob.SelectedValue == "22" || ddlJob.SelectedValue == "23" || ddlJob.SelectedValue == "24"
                            || ddlJob.SelectedValue == "25" || ddlJob.SelectedValue == "26")//SMS
                Procparam.Add("@OPTION", "4");



            Procparam.Add("@Transaction_Type", strTransactionType);
            DataTable dt_Trans_Excel = new DataTable();
            DataSet Dset = Utility.GetDataset("S3G_SA_GET_SCHJOB_EXCEPTIONDET", Procparam);
            if (Dset.Tables.Count > 0)
            {
                gvExceptionDetToExcel.DataSource = dt_Trans_Excel;
                gvExceptionDetToExcel.DataBind();
                if (ddlJob.SelectedValue == "38")//Factroing MIS
                {
                    funPriDataTabletoExcel(dt_Trans_Excel, "Factoring MIS");
                }
                else if (ddlJob.SelectedValue == "37")//Account MIS
                {
                    funPriDataTabletoExcel(Dset.Tables[0], "Factoring MIS");
                }
                else
                {
                    ExportToExcel(gvExceptionDetToExcel, "JobDataDetails");
                }
            }
            else
            {
                if (ddlJob.SelectedValue == "19")//FM13 Process
                {
                    Utility.FunShowAlertMsg(this, "No Exception Found, View Excel files in Delinquency Spooling");
                }
                else
                {
                    Utility.FunShowAlertMsg(this, "No Record Found");
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnViewMIS_Click(object sender, EventArgs e)
    {
        try
        {
            //  String Req = sende

            System.Web.UI.HtmlControls.HtmlButton btnView = sender as System.Web.UI.HtmlControls.HtmlButton;
            GridViewRow grvRow = (GridViewRow)btnView.Parent.Parent.Parent.Parent;

            Label lblGvSchedulejob_Status_Id = (Label)grvRow.FindControl("lblSchedulejob_Status_Id");
            Label lblGVStatusCode = (Label)grvRow.FindControl("lblStatusCode");

            string Request = btnView.InnerText;

            strTransactionType = "37";


            string strMode = string.Empty;




            if (lblGVStatusCode.Text.ToUpper() == "E")
                strMode = "1";   //View Exception details
            else
                strMode = "2"; //View success data details


            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Schjob_Status_ID", lblGvSchedulejob_Status_Id.Text);
            Procparam.Add("@Mode", strMode);
            if (ddlJob.SelectedValue == "6" || ddlJob.SelectedValue == "7" || ddlJob.SelectedValue == "8" || ddlJob.SelectedValue == "9" || ddlJob.SelectedValue == "10" || ddlJob.SelectedValue == "11" || ddlJob.SelectedValue == "12" || ddlJob.SelectedValue == "13" || ddlJob.SelectedValue == "14")//HRMS
                Procparam.Add("@OPTION", "1");//HRMS
            else if (ddlJob.SelectedValue == "15" || ddlJob.SelectedValue == "16" || ddlJob.SelectedValue == "17" || ddlJob.SelectedValue == "18" || ddlJob.SelectedValue == "38" || ddlJob.SelectedValue == "37")//Factoring ODI,INCOME,LOC,DIFF SC,FACTORING MIS
                Procparam.Add("@OPTION", "2");//FACTORING MONTH END JOBS
            else if (ddlJob.SelectedValue == "19")//FM13
                Procparam.Add("@OPTION", "3");//LEASING

            else if (ddlJob.SelectedValue == "20" || ddlJob.SelectedValue == "21" || ddlJob.SelectedValue == "22" || ddlJob.SelectedValue == "23" || ddlJob.SelectedValue == "24"
                            || ddlJob.SelectedValue == "25" || ddlJob.SelectedValue == "26")//SMS
                Procparam.Add("@OPTION", "4");



            Procparam.Add("@Transaction_Type", strTransactionType);
            DataTable dt_Trans_Excel = new DataTable();
            DataSet Dset = Utility.GetDataset("S3G_SA_GET_SCHJOB_EXCEPTIONDET", Procparam);
            if (Dset.Tables.Count > 0)
            {
                gvExceptionDetToExcel.DataSource = dt_Trans_Excel;
                gvExceptionDetToExcel.DataBind();
                if (ddlJob.SelectedValue == "38")//Factroing MIS
                {
                    funPriDataTabletoExcel(dt_Trans_Excel, "Account MIS");
                }
                else if (ddlJob.SelectedValue == "37")//Account MIS
                {
                    funPriDataTabletoExcel(Dset.Tables[0], "Account MIS");
                }
                else
                {
                    ExportToExcel(gvExceptionDetToExcel, "JobDataDetails");
                }
            }
            else
            {
                if (ddlJob.SelectedValue == "19")//FM13 Process
                {
                    Utility.FunShowAlertMsg(this, "No Exception Found, View Excel files in Delinquency Spooling");
                }
                else
                {
                    Utility.FunShowAlertMsg(this, "No Record Found");
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnResume_Click(object sender, EventArgs e)
    {
        objScheduleMgtServiceClient = new ScheduledJobMgtServicesReference.ScheduledJobMgtServicesClient();

        try
        {
            string strFieldAtt = ((System.Web.UI.HtmlControls.HtmlButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("gvJobDetails", strFieldAtt);
            Label lblSchedulejob_Status_Id = gvJobDetails.Rows[gRowIndex].FindControl("lblSchedulejob_Status_Id") as Label;

            int schJob_Status_ID = Convert.ToInt32(lblSchedulejob_Status_Id.Text);
            int intResult = 0;
            intResult = objScheduleMgtServiceClient.FunPubUpdateScheduleJobStatus(out intResult, schJob_Status_ID, 0);//(out intResult, schJob_Status_ID , 0)
            if (intResult == 0)
            {
                Utility.FunShowAlertMsg(this, "Job started Successfully");
                FunBindJobRunDetails();

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnReRun_Click(object sender, EventArgs e)
    {
        objScheduleMgtServiceClient = new ScheduledJobMgtServicesReference.ScheduledJobMgtServicesClient();

        try
        {
            string strFieldAtt = ((System.Web.UI.HtmlControls.HtmlButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("gvJobDetails", strFieldAtt);
            Label lblSchedulejob_Status_Id = gvJobDetails.Rows[gRowIndex].FindControl("lblSchedulejob_Status_Id") as Label;

            int schJob_Status_ID = Convert.ToInt32(lblSchedulejob_Status_Id.Text);
            int intResult = 0;
            intResult = objScheduleMgtServiceClient.FunPubUpdateScheduleJobStatus(out intResult, schJob_Status_ID, 1);
            if (intResult == 0)
            {
                Utility.FunShowAlertMsg(this, "Job started Successfully");
                FunBindJobRunDetails();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    #endregion

    #region Dropdown Changed Events

    //protected void ddlFrequency_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (ddlFrequency.SelectedValue == "1")
    //    {
    //        txtMinutes.Enabled = true;
    //        lblTime.Enabled = true;

    //        //        divMin.Visible = true;
    //    }
    //    else
    //    {
    //        txtMinutes.Enabled = false;
    //        //divMin.Visible = false;
    //        //txtMinutes.Visible = false;
    //        //lblTime.Visible = false;
    //    }
    //}
    protected void ddlFrequency_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            if (ddlFrequency.SelectedValue == "1")
            {
                lblFrqText.Text = "Time In Minutes*";
                // lblFrqText.Visible = true;
                divfreq.Visible = true;
                // txtFrqText.Visible = true;
                // chklstFrquency.Visible = false;
                divchkfrq.Visible = false;
                rfvFrequencyTxt.ErrorMessage = "Enter Time In Minutes";
                //if (txtFrqText.Text == "")
                //{
                //    Utility.FunShowAlertMsg(this, "Time In Minutes");
                //}
            }

            else if (Convert.ToInt32(ddlFrequency.SelectedValue) >= 4)
            {
                lblFrqText.Text = "Day*";
                lblFrqText.Visible = true;
                divfreq.Visible = true;
                divchkfrq.Visible = false;
                txtFrqText.Visible = true;
                chklstFrquency.Visible = false;
                rfvFrequencyTxt.ErrorMessage = "Enter Day";

            }

            else if (Convert.ToInt32(ddlFrequency.SelectedValue) == 3)
            {
                lblchkfrq.Text = "Day*";
                //lblFrqText.Visible = true;
                chklstFrquency.Visible = true;
                //txtFrqText.Visible = false;
                divfreq.Visible = false;
                divchkfrq.Visible = true;
                //rfvChkfrq.ErrorMessage = "Select Week Day";
                rfvChkfrq.ErrorMessage = "Select Week Day";
            }
            else
            {
                //chklstFrquency.Visible = false;
                //txtFrqText.Visible = false;
                //lblFrqText.Visible = false;
                divfreq.Visible = false;
                divchkfrq.Visible = false;
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ddlJobNature_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlJobNature.SelectedValue == "2")
            {
                ddlFrequency.Enabled = false;
                rfvFrequency.Enabled = false;
            }
            else
            {
                ddlFrequency.Enabled = true;
                rfvFrequency.Enabled = true;
            }
            ddlJobNature.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            //cvScheduledJobs.ErrorMessage = ex.ToString();
            //cvScheduledJobs.IsValid = false;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    #endregion

    #region Grid Events
    protected void grvFunctions_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        try
        {
            UserControls_S3GAutoSuggest txtFUserName = (UserControls_S3GAutoSuggest)grvFunctions.FooterRow.FindControl("txtFFunctionName");
            Label lblSNO = (Label)grvFunctions.FindControl("lblSNO");
            DataRow dr = null;
            DataTable dtUsers = (DataTable)ViewState["FunctionDetails"];

            if (e.CommandName == "AddNew")
            {
                if (txtFUserName.SelectedValue == "0")
                {
                    txtFUserName.Focus();
                    Utility.FunShowAlertMsg(this, "Select the Mail To from LOV");
                    txtFUserName.SelectedText = "";
                    return;
                }
                if (FunPubCheckDupFunctions(txtFUserName.SelectedValue))
                {
                    Utility.FunShowAlertMsg(this, "Selected Combination Already Exists");
                    txtFUserName.Focus();
                    return;
                }
                dr = dtUsers.NewRow();
                dr["SNO"] = dtUsers.Rows.Count + 1;
                dr["FUNCTION_ID"] = txtFUserName.SelectedValue;
                dr["FUNCTION_NAME"] = txtFUserName.SelectedText.Trim();
                dr["MasterID"] = "-1";
                dtUsers.Rows.Add(dr);
                grvFunctions.DataSource = dtUsers;
                grvFunctions.DataBind();
                ViewState["FunctionDetails"] = dtUsers;
                hdnFuncitonID.Value = string.Empty;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {

        }
    }
    protected void grvFunctions_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Dictionary<string, string> dictParam;
            dictParam = new Dictionary<string, string>();
            grvFunctions.EditIndex = -1;
            DataTable dtEditApprDet = (DataTable)ViewState["FunctionDetails"];
            dtEditApprDet.Rows.RemoveAt(e.RowIndex);
            if (dtEditApprDet.Rows.Count > 0)
            {
                grvFunctions.DataSource = dtEditApprDet;
                grvFunctions.DataBind();
                ViewState["FunctionDetails"] = dtEditApprDet;
            }
            else
            {
                FunPubBindFunctionGrid();
            }
            hdnFuncitonID.Value = string.Empty;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {

        }

    }
    protected void grvFunctions_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //UserControls_S3GAutoSuggest txtFFunctionName = (UserControls_S3GAutoSuggest)e.Row.FindControl("txtFFunctionName");
                //txtFFunctionName.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvMailCC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //UserControls_S3GAutoSuggest txtFFunctionName = (UserControls_S3GAutoSuggest)e.Row.FindControl("txtFFunctionName");
                //txtFFunctionName.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void grvMailCC_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Dictionary<string, string> dictParam;
            dictParam = new Dictionary<string, string>();
            grvMailCC.EditIndex = -1;
            DataTable dtEditApprDet = (DataTable)ViewState["MailCCDetails"];
            dtEditApprDet.Rows.RemoveAt(e.RowIndex);
            if (dtEditApprDet.Rows.Count > 0)
            {
                grvMailCC.DataSource = dtEditApprDet;
                grvMailCC.DataBind();
                ViewState["MailCCDetails"] = dtEditApprDet;
            }
            else
            {
                FunPubBindMailCCGrid();
            }
            hdnMailCC.Value = string.Empty;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }

    }
    protected void grvMailBCC_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            UserControls_S3GAutoSuggest txtFUserName = (UserControls_S3GAutoSuggest)grvMailBCC.FooterRow.FindControl("txtFFunctionName");
            Label lblSNO = (Label)grvMailBCC.FindControl("lblSNO");
            DataRow dr = null;
            DataTable dtUsers = (DataTable)ViewState["MailBCCDetails"];

            if (e.CommandName == "AddNew")
            {
                if (txtFUserName.SelectedValue == "0")
                {
                    txtFUserName.Focus();
                    Utility.FunShowAlertMsg(this, "Select the Mail BCC from LOV");
                    txtFUserName.SelectedText = "";
                    return;
                }
                if (FunPubCheckDupMailBCC(txtFUserName.SelectedValue))
                {
                    Utility.FunShowAlertMsg(this, "Selected Combination Already Exists");
                    txtFUserName.Focus();
                    return;
                }
                dr = dtUsers.NewRow();
                dr["SNO"] = dtUsers.Rows.Count + 1;
                dr["FUNCTION_ID"] = txtFUserName.SelectedValue;
                dr["FUNCTION_NAME"] = txtFUserName.SelectedText.Trim();
                dr["MasterID"] = "-1";
                dtUsers.Rows.Add(dr);
                grvMailBCC.DataSource = dtUsers;
                grvMailBCC.DataBind();
                ViewState["MailBCCDetails"] = dtUsers;
                hdnMailBCC.Value = string.Empty;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {
        }
    }
    protected void grvMailBCC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //UserControls_S3GAutoSuggest txtFFunctionName = (UserControls_S3GAutoSuggest)e.Row.FindControl("txtFFunctionName");
                //txtFFunctionName.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }

    }
    protected void grvMailBCC_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            Dictionary<string, string> dictParam;
            dictParam = new Dictionary<string, string>();
            grvMailBCC.EditIndex = -1;
            DataTable dtEditApprDet = (DataTable)ViewState["MailBCCDetails"];
            dtEditApprDet.Rows.RemoveAt(e.RowIndex);
            if (dtEditApprDet.Rows.Count > 0)
            {
                grvMailBCC.DataSource = dtEditApprDet;
                grvMailBCC.DataBind();
                ViewState["MailBCCDetails"] = dtEditApprDet;
            }
            else
            {
                FunPubBindMailBCCGrid();
            }
            hdnMailBCC.Value = string.Empty;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }

    protected void gvJobDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatusCode = e.Row.FindControl("lblStatusCode") as Label;
                Label lblStatusDesc = e.Row.FindControl("lblStatusDesc") as Label;
                Label lblScheduleJobType = e.Row.FindControl("lblScheduleJobType") as Label;
                System.Web.UI.HtmlControls.HtmlButton btnViewExeption = e.Row.FindControl("btnViewExeption") as System.Web.UI.HtmlControls.HtmlButton;
                System.Web.UI.HtmlControls.HtmlButton btnResume = e.Row.FindControl("btnResume") as System.Web.UI.HtmlControls.HtmlButton;
                System.Web.UI.HtmlControls.HtmlButton btnPostInterestDetails = e.Row.FindControl("btnPostInterestDetails") as System.Web.UI.HtmlControls.HtmlButton;
                System.Web.UI.HtmlControls.HtmlButton btnReRun = e.Row.FindControl("btnReRun") as System.Web.UI.HtmlControls.HtmlButton;
                btnViewExeption.Enabled_False_Success();
                lblStatusDesc.Attributes.Add("class", "btn btn-success");

                btnReRun.Enabled_False_Success();
                btnResume.Enabled_False_Success();
                btnPostInterestDetails.Enabled_False_Success();

                if (lblStatusCode.Text == "O" || lblStatusCode.Text == "WIP")       //OPEN OR WORK IN PROGRESS
                {

                    btnViewExeption.Enabled_False_Warning();
                    btnResume.Enabled_False_Warning();
                    lblStatusDesc.Attributes.Add("class", "btn btn-primary");
                    btnPostInterestDetails.Enabled_False_Warning();
                }
                else if (lblStatusCode.Text == "E")     //ERROR
                {
                    btnViewExeption.Enabled_True_Danger();
                    btnResume.Enabled_True_Success();
                    lblStatusDesc.Attributes.Add("class", "btn btn-danger");
                    btnPostInterestDetails.Enabled_False_Warning();
                }
                else if (lblStatusCode.Text == "C" || lblStatusCode.Text == "DP")        //COMPLETED
                {
                    btnViewExeption.Enabled_True_Success();
                    lblStatusDesc.Attributes.Add("class", "btn btn-success");
                    if (lblScheduleJobType.Text == "28" && strMode == "M")
                    {
                        btnReRun.Enabled_True_Success();
                    }
                    else
                    {
                        btnReRun.Enabled_False_Warning();
                    }
                    btnPostInterestDetails.Enabled_True_Success();
                    if (lblScheduleJobType.Text.Trim() == "19" || lblScheduleJobType.Text.Trim() == "15" || lblScheduleJobType.Text.Trim() == "16")//FM13 Process
                    {
                        // To Check Special User Rights for Favoring Name Edit
                        if (strMode == "M")
                        {
                            if (UserFunctionCheck("SCH_RERUN"))
                            {
                                btnReRun.Enabled_True_Success();
                            }
                        }
                    }
                }
                if (lblScheduleJobType.Text.Trim() == "15" || lblScheduleJobType.Text.Trim() == "16")//FM13 Process
                {
                    if (strMode == "M")
                    {
                        if (lblStatusCode.Text == "C" || lblStatusCode.Text == "DP")
                        {
                            btnReRun.Enabled_True_Success();
                        }
                    }
                }
                if ((strSch_ID != "") && (strMode == "Q")) // For Query Mode
                {
                    btnResume.Enabled_False_Warning();
                    btnPostInterestDetails.Enabled_False_Warning();
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
    }

    protected void grvMailCC_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            UserControls_S3GAutoSuggest txtFUserName = (UserControls_S3GAutoSuggest)grvMailCC.FooterRow.FindControl("txtFFunctionName");
            Label lblSNO = (Label)grvMailCC.FindControl("lblSNO");
            DataRow dr = null;
            DataTable dtUsers = (DataTable)ViewState["MailCCDetails"];

            if (e.CommandName == "AddNew")
            {
                if (txtFUserName.SelectedValue == "0")
                {
                    txtFUserName.Focus();
                    Utility.FunShowAlertMsg(this, "Select the Mail CC from LOV");
                    txtFUserName.SelectedText = "";
                    return;
                }
                if (FunPubCheckDupMailCC(txtFUserName.SelectedValue))
                {
                    Utility.FunShowAlertMsg(this, "Selected Combination Already Exists");
                    txtFUserName.Focus();
                    return;
                }
                dr = dtUsers.NewRow();
                dr["SNO"] = dtUsers.Rows.Count + 1;
                dr["FUNCTION_ID"] = txtFUserName.SelectedValue;
                dr["FUNCTION_NAME"] = txtFUserName.SelectedText.Trim();
                dr["MasterID"] = "-1";
                dtUsers.Rows.Add(dr);
                grvMailCC.DataSource = dtUsers;
                grvMailCC.DataBind();
                ViewState["MailCCDetails"] = dtUsers;
                hdnMailCC.Value = string.Empty;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {
        }
    }
    #endregion

    #region Boolean Methods

    public bool FunPubCheckDupFunctions(string strMOOfficer)
    {
        bool IsDuplicateCasfFlow = false;
        try
        {

            if (ViewState["FunctionDetails"] != null)
            {
                DataRow[] dr = ((DataTable)ViewState["FunctionDetails"]).Select("FUNCTION_ID='" + strMOOfficer + "'");
                if (dr.Length > 0)
                    IsDuplicateCasfFlow = true;
                else
                    IsDuplicateCasfFlow = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {

        }
        return IsDuplicateCasfFlow;
    }
    public bool FunPubCheckDupMailCC(string strMOOfficer)
    {
        bool IsDuplicateCasfFlow = false;
        try
        {

            if (ViewState["MailCCDetails"] != null)
            {
                DataRow[] dr = ((DataTable)ViewState["MailCCDetails"]).Select("FUNCTION_ID='" + strMOOfficer + "'");
                if (dr.Length > 0)
                    IsDuplicateCasfFlow = true;
                else
                    IsDuplicateCasfFlow = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {

        }
        return IsDuplicateCasfFlow;
    }
    public bool FunPubCheckDupMailBCC(string strMOOfficer)
    {
        bool IsDuplicateCasfFlow = false;
        try
        {

            if (ViewState["MailBCCDetails"] != null)
            {
                DataRow[] dr = ((DataTable)ViewState["MailBCCDetails"]).Select("FUNCTION_ID='" + strMOOfficer + "'");
                if (dr.Length > 0)
                    IsDuplicateCasfFlow = true;
                else
                    IsDuplicateCasfFlow = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {

        }
        return IsDuplicateCasfFlow;
    }
    #endregion

    #region Web Method


    [System.Web.Services.WebMethod]
    public static string[] GetMailList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SYSAD_LOAD_USER_MAILID", Procparam));
        return suggetions.ToArray();
    }

    #endregion

    public override void VerifyRenderingInServerForm(Control control)
    {
        // base.VerifyRenderingInServerForm(control);
        // control.Focus();
    }
    protected void btnViewInterestDetails_Click(object sender, EventArgs e)
    {
        try
        {
            funPriDownloadInterestDetails(sender, e);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void btnPostInterestDetails_Click(object sender, EventArgs e)
    {
        funPriPostInterestDetails(sender, e);
    }
    private void funPriPostInterestDetails(object sender, EventArgs e)
    {
        try
        {
            int intRowIndex = Utility.FunPubGetGridRowID("gvJobDetails", ((System.Web.UI.HtmlControls.HtmlButton)sender).ClientID);
            Label lblScheduleJobID = gvJobDetails.Rows[intRowIndex].FindControl("lblScheduleJobID") as Label;
            Label lblSchedulejob_Status_Id = gvJobDetails.Rows[intRowIndex].FindControl("lblSchedulejob_Status_Id") as Label;
            int intResult;
            string strApp_Number = string.Empty;
            ApplicationMgtServicesReference.ApplicationMgtServicesClient ObjAProcessSave = new ApplicationMgtServicesReference.ApplicationMgtServicesClient();
            S3GBusEntity.ApplicationProcess.ApplicationProcess ObjBusApplicationProcess = new S3GBusEntity.ApplicationProcess.ApplicationProcess();
            ObjBusApplicationProcess.Company_ID = intCompanyID;
            ObjBusApplicationProcess.Branch_ID = 1;
            ObjBusApplicationProcess.Offer_Date = Utility.StringToDate(DateTime.Now.ToString());
            ObjBusApplicationProcess.Application_Process_ID = Convert.ToInt32(lblSchedulejob_Status_Id.Text);
            ObjBusApplicationProcess.Sales_Person_ID = Convert.ToInt32(ddlJob.SelectedValue);

            intResult = ObjAProcessSave.FunPubSaveFactroingIncomeandInterest(out strApp_Number, ObjBusApplicationProcess);
            if (intResult == 0)
            {

                strKey = "Modify";
                strAlert = strAlert.Replace("__ALERT__", strApp_Number);
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);


            }
            else if (intResult == 50)
            {
                Utility.FunShowAlertMsg(this, "Error in Posting");
                return;
            }
            else
            {
                Utility.FunShowAlertMsg(this, strApp_Number);
                return;

            }


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriDownloadInterestDetails(object sender, EventArgs e)
    {
        try
        {
            if (ddlJob.SelectedValue == "37")
            {
                funPriDownloadAccountDetails(sender, e);
            }
            else
            {
                DataTable dtDownloadDtl = new DataTable();
                int intRowIndex = Utility.FunPubGetGridRowID("gvJobDetails", ((System.Web.UI.HtmlControls.HtmlButton)sender).ClientID);
                Label lblScheduleJobID = gvJobDetails.Rows[intRowIndex].FindControl("lblScheduleJobID") as Label;

                Dictionary<string, string> strProparm = new Dictionary<string, string>();
                strProparm.Add("@Company_Id", intCompanyID.ToString());
                strProparm.Add("@ScheduleJobID", lblScheduleJobID.Text);
                strProparm.Add("@Job", ddlJob.SelectedValue);
                strProparm.Add("@TRANSACTION_TYPE", "0");//Query the Details
                dtDownloadDtl = Utility.GetDefaultData("S3G_GET_FAC_DTLS", strProparm);
                if (dtDownloadDtl.Rows.Count > 0)
                {
                    gvExceptionDetToExcel.DataSource = dtDownloadDtl;
                    gvExceptionDetToExcel.DataBind();
                    ExportToExcel(gvExceptionDetToExcel, "Factoring Month Job Details");
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void tmRefereshData_Tick(object sender, EventArgs e)
    {
        FunBindJobRunDetails();
    }

    private bool UserFunctionCheck(string strFunctionCode)
    {
        bool blnRights = false;
        try
        {

            Dictionary<string, string> ProParm = new Dictionary<string, string>();
            ProParm.Add("@Company_Id", Convert.ToString(intCompanyID));
            ProParm.Add("@USER_ID", Convert.ToString(intUserID));
            ProParm.Add("@PGM_CODE", strFunctionCode);
            DataTable dt = Utility.GetDefaultData("S3G_SA_GET_SCREEN_ACCESS", ProParm);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToInt32(dt.Rows[0]["COUNT"]) > 0)
                {
                    blnRights = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Payment Request");
        }
        return blnRights;
    }

    protected void ddlJob_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            dvFileType.Visible = false;
            if (ddlJob.SelectedValue != "0" && ddlJob.SelectedValue == "36")//Terriost Data Upload
            {
                dvFileType.Visible = true;
                FunPriLoadFileType();
            }
            if (ddlJob.SelectedValue == "39")
            {
                ddlOcbReportType.Enabled = true;
                btnDownloadOcbExcpetion.Enabled_False();
            }
            else
            {
                ddlOcbReportType.Enabled = false;
                btnDownloadOcbExcpetion.Enabled_True();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void funPriDownloadAccountDetails(object sender, EventArgs e)
    {
        try
        {
            DataTable dtDownloadDtl = new DataTable();
            int intRowIndex = Utility.FunPubGetGridRowID("gvJobDetails", ((System.Web.UI.HtmlControls.HtmlButton)sender).ClientID);
            Label lblScheduleJobID = gvJobDetails.Rows[intRowIndex].FindControl("lblScheduleJobID") as Label;

            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            strProparm.Add("@Company_Id", intCompanyID.ToString());
            strProparm.Add("@ScheduleJobID", lblScheduleJobID.Text);
            strProparm.Add("@Job", ddlJob.SelectedValue);
            strProparm.Add("@TRANSACTION_TYPE", "0");//Query the Details
            dtDownloadDtl = Utility.GetDefaultData("S3G_GET_FAC_DTLS", strProparm);
            if (dtDownloadDtl.Rows.Count > 0)
            {
                GridView drv = new GridView();
                drv.DataSource = dtDownloadDtl;
                drv.DataBind();
                ExportToExcel(drv, "Account MIS Report");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriDataTabletoExcel(DataTable dt, string FileName)
    {
        DateTime now = DateTime.Now;
        string attachment = "attachment; filename=" + FileName + "_" + now + ".xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/vnd.ms-excel";
        string tab = "";
        foreach (DataColumn dc in dt.Columns)
        {
            Response.Write(tab + dc.ColumnName);
            tab = "\t";
        }
        Response.Write("\n");
        int i;
        foreach (DataRow dr in dt.Rows)
        {
            tab = "";
            for (i = 0; i < dt.Columns.Count; i++)
            {
                Response.Write(tab + dr[i].ToString());
                tab = "\t";
            }
            Response.Write("\n");
        }
        Response.End();
    }
    protected void btnStartStopTimer_ServerClick(object sender, EventArgs e)
    {
        //Sathish R-26-Nov-2019
        if (btnStartStopTimer.InnerText == "Stop Timer")
        {
            btnStartStopTimer.InnerText = "Start Timer";
            tmRefereshData.Enabled = false;
        }
        else
        {
            btnStartStopTimer.InnerText = "Stop Timer";
            tmRefereshData.Enabled = true;
        }
    }
    protected void btnDownloadOcbExcpetion_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@OPTION", "1");
            strProParm.Add("@COMPANYID", "1");
            DataTable dtOcbException = Utility.GetDefaultData("S3G_GET_OCB_EXCEPTION", strProParm);
            funPriDataTabletoExcel(dtOcbException, txtJobDescription.Text + "_OcbException");
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
}