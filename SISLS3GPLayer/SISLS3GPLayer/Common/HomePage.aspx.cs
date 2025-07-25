
#region -------------> NameSpaces
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using S3GBusEntity;
using System.Web.UI;

using System.Web.Security;
using System.Text;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.DataVisualization.Charting.Utilities;
#endregion

/// ---------><summary>
/// Created By      : Rajendran
/// Purpose         : S3G Dash Board  | Work flow implementation
/// Created Date    : 2/2/2011
/// Last Modified   :    
/// Software Pattern  : Singletone Web Service Implementation
/// </summary>

public partial class HomePage : ApplyThemeForProject
{

    S3GAdminServicesReference.S3GAdminServicesClient ObjS3GAdminClient = new S3GAdminServicesReference.S3GAdminServicesClient();
    static string lDateFormate;
    static string strConnectionName;
    static string strDateformat;
    static int intGpsPrefix;
    static int intGpsSuffix;

    #region " WORKFLOW EVENTS "
    protected void Page_Load(object sender, EventArgs e)
    {
        UserInfo objS3GUser = new UserInfo();

        if (!IsPostBack)
        {
            AssisgnApplicationSessionValues();
            AssisgnFAApplicationSessionValues();
            FunpriWorkflowBind(1);


        }
        CETo.Format = CEFrom.Format = (DateFormate != null) ? DateFormate : lDateFormate;

        if (objS3GUser.ProUserTypeRW.ToString().ToUpper() == "UTPA")
        {
            tblContainer.Visible = false;
        }

    }
    protected void ddlHome_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/HomePage.aspx");
    }
    protected void gvToDoList_SelectedIndexChanged(object sender, EventArgs e)
    {

        AssignSelectedWorkFlowRecord('G');
    }
    protected void gvListWFDocuments_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label WFStatus = (Label)gvListWFDocuments.SelectedRow.FindControl("lblStatus");
        if (WFStatus.Text.Length > 0 && WFStatus.Text.ToLower() == "open")
            AssignSelectedWorkFlowRecord('A');
        else
            Utility.FunShowAlertMsg(this, "Use left hand side menu to navigate to the corresponding screen");
    }
    protected void gvDocuments_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {


    }
    protected void grvTransLander_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void grvTransLander_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void grvTransLander_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int selectedDocumentId = int.Parse(grvTransLander.SelectedDataKey.Value.ToString());
        //bindDocumentsList(selectedDocumentId);
    }
    protected void lbtnAll_Click(object sender, EventArgs e)
    {
        // FunpriWorkflowBind('A');
    }
    protected void lbtnGW_Click(object sender, EventArgs e)
    {
        // FunpriWorkflowBind('G');
    }

    protected void gvListWFDocuments_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string eventArg = "Select$" + e.Row.RowIndex.ToString();
            e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(gvListWFDocuments, eventArg));
            e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer';");
            //e.Row.Attributes.Add("onhover",e.Row.Style.cu );
        }
        else if (e.Row.RowType == DataControlRowType.Header)
        {
            //CheckBox chkSelected = (CheckBox)(e.Row.FindControl("chkStatus"));
            //chkSelected.Checked = (ViewState["ShowAll"] != null) ? (Boolean.Parse(ViewState["ShowAll"].ToString())) : false;
            //if (chkSelected.Checked)
            //    chkSelected.Text = "Show Pending";

        }
    }
    protected void chkStatus_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        ViewState["ShowAll"] = true;
        //  FunpriWorkflowBind('A');
    }
    protected void txtFromDate_TextChanged(object sender, EventArgs e)
    {
        ViewState["ShowAll"] = true;
        //FunpriWorkflowBind('A');
    }
    protected void txtToDate_TextChanged(object sender, EventArgs e)
    {
        ViewState["ShowAll"] = true;
        //FunpriWorkflowBind('A');
    }
    #endregion

    #region " HOMEPAGE INTERFACE METHODS"
    private static void AssisgnApplicationSessionValues()
    {
        UserInfo UserInfo = new UserInfo();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", UserInfo.ProCompanyIdRW.ToString());
        DataTable dtSessionInfo = Utility.GetDefaultData(SPNames.S3G_Get_GobalCompanyDetails, Procparam);

        if (dtSessionInfo.Rows.Count > 0)
        {
            strDateformat = dtSessionInfo.Rows[0]["DISPLAY_DATE_FORMAT"].ToString();
            lDateFormate = strDateformat;
            string strCurrencyName = dtSessionInfo.Rows[0]["CURRENCY_NAME"].ToString();
            string strCurrencyCode = dtSessionInfo.Rows[0]["CURRENCY_CODE"].ToString();
            int intCurrencyId = Convert.ToInt32(dtSessionInfo.Rows[0]["CURRENCY_ID"].ToString());
            int intPINdigits = Convert.ToInt32(dtSessionInfo.Rows[0]["Pincode_Digits"].ToString());
            string strPINType = dtSessionInfo.Rows[0]["Pincode_Field_Type"].ToString();
            intGpsPrefix = Convert.ToInt32(dtSessionInfo.Rows[0]["Currency_Max_Digit"].ToString());
            intGpsSuffix = Convert.ToInt32(dtSessionInfo.Rows[0]["Currency_Max_Dec_Digit"].ToString());
            string strCompanyCntry = dtSessionInfo.Rows[0]["Country"].ToString();
            S3GSession ObjS3GSession = new S3GSession(strDateformat, strCurrencyName, strCurrencyCode, intCurrencyId, intPINdigits, strPINType, intGpsPrefix, intGpsSuffix, strCompanyCntry);
            //CultureInfo.CurrentCulture.D = strDateformat;
        }
    }
    private void FunpriWorkflowBind(int int_WFType)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_Id", Convert.ToString(CompanyId));
        Procparam.Add("@User_ID", Convert.ToString(UserId));
        Procparam.Add("@WF_Type", Convert.ToString(int_WFType));

        DataSet dsWFRecs = Utility.GetDataset("S3G_WF_GET_WFRECS_ALL", Procparam);
        if (dsWFRecs != null)
        {
            //gvListWFDocuments.DataSource = dsWFRecs.Tables[0];
            //gvListWFDocuments.DataBind();
            //gvListWFDocuments.Visible = true;
            //gvEscalExpiredDet.Visible = false;
            //pnlWorkItems.Visible = true;
            divPendingTasks.InnerText = dsWFRecs.Tables[1].Rows.Count.ToString();//Pending Tasks
            divComletedTasks.InnerText = dsWFRecs.Tables[4].Rows.Count.ToString();//ComletedTasks
            divEscalation.InnerText = dsWFRecs.Tables[2].Rows.Count.ToString();//Esclation
            divCompletedTransactions.InnerText = dsWFRecs.Tables[8].Rows.Count.ToString();//Completed Transactions
            divPendingTransaction.InnerText = dsWFRecs.Tables[9].Rows.Count.ToString();//Pending Transactions

        }
        if (dsWFRecs.Tables[5].Rows.Count > 0)
        {
            //StringBuilder strBuilNoti = new StringBuilder();
            //string strNotification = string.Empty;
            //foreach (DataRow dr in dsWFRecs.Tables[5].Rows)
            //{
            //    strBuilNoti = strBuilNoti.Append(Environment.NewLine);
            //    strBuilNoti = strBuilNoti.AppendLine(dr["DASH_NOTI_MESSEGE"].ToString());
            //    strBuilNoti = strBuilNoti.Append(Environment.NewLine);
            //}
            //PNotification.InnerText = strBuilNoti.ToString();

            //rptCustomers.Style.Remove("gird_details");
            //rptCustomers.DataSource = dsWFRecs.Tables[5];
            //rptCustomers.DataBind();
            int iLoadLine = 0;
            foreach (DataRow dr in dsWFRecs.Tables[5].Rows)
            {
                //Label txt = new Label();
                //txt.ID = "lblNotify" + iLoadLine.ToString();
                //txt.Text = dr["DASH_NOTI_MESSEGE"].ToString();
                //plShoNotifi.Controls.Add(txt);
                //iLoadLine = iLoadLine + 1;
                //txt.Font.Bold = true;
                ////txt.Font.Size = FontUnit.XLarge;
                //if (dr["TEXT_REPRESENT"].ToString() == "1")
                //{
                //    txt.CssClass = "text-success_In";
                //}
                //if (dr["TEXT_REPRESENT"].ToString() == "2")
                //{
                //    txt.CssClass = "text-primary_In";
                //}
                //if (dr["TEXT_REPRESENT"].ToString() == "3")
                //{
                //    txt.CssClass = "text-secondary_In";
                //}
                //if (dr["TEXT_REPRESENT"].ToString() == "4")
                //{
                //    txt.CssClass = "text-info_In";
                //}


                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                dynDiv.ID = "lblNotify" + iLoadLine.ToString();
                dynDiv.InnerHtml = dr["DASH_NOTI_MESSEGE"].ToString();

                if (dr["TEXT_REPRESENT"].ToString() == "1")
                {
                    //dynDiv.CssClass = "text-success_In";
                    dynDiv.Attributes.Add("class", "bg-successIn small_txt text-white");
                }
                if (dr["TEXT_REPRESENT"].ToString() == "2")
                {
                    //dynDiv.CssClass = "text-primary_In";
                    dynDiv.Attributes.Add("class", "bg-primaryIn small_txt text-white");
                }
                if (dr["TEXT_REPRESENT"].ToString() == "3")
                {
                    //dynDiv.CssClass = "text-secondary_In";
                    dynDiv.Attributes.Add("class", "bg-warningIn small_txt text-white");
                }
                if (dr["TEXT_REPRESENT"].ToString() == "4")
                {
                    //dynDiv.CssClass = "text-info_In";
                    dynDiv.Attributes.Add("class", "bg-infoIn small_txt text-white");
                }
                plShoNotifi.Controls.Add(dynDiv);
                iLoadLine = iLoadLine + 1;

                plShoNotifi.Controls.Add(new LiteralControl("<br />"));
                plShoNotifi.Controls.Add(new LiteralControl("<br />"));

            }
        }
        if (dsWFRecs.Tables[6].Rows.Count > 0)
        {
            int iLoadLine = 0;
            foreach (DataRow dr in dsWFRecs.Tables[6].Rows)
            {

                Label txt = new Label();
                txt.ID = "lblThingstodo" + iLoadLine.ToString();
                txt.Text = dr["PROGRAM_NAME"].ToString() + " Pending";
                plThingstodo.Controls.Add(txt);
                iLoadLine = iLoadLine + 1;
                //txt.Font.Bold = true;
                txt.CssClass = "text-primary_In";
                //txt.Font.Size = FontUnit.XLarge;
                //if (dr["TEXT_REPRESENT"].ToString() == "1")
                //{
                //    txt.CssClass = "text-success_In";
                //}
                //if (dr["TEXT_REPRESENT"].ToString() == "2")
                //{
                //    txt.CssClass = "text-primary_In";
                //}
                //if (dr["TEXT_REPRESENT"].ToString() == "3")
                //{
                //    txt.CssClass = "text-secondary_In";
                //}
                //if (dr["TEXT_REPRESENT"].ToString() == "4")
                //{
                //    txt.CssClass = "text-info_In";
                //}
                
                //Label txt2 = new Label();
                //txt2.ID = "lblNotify" + iLoadLine.ToString() + "LienIndi";
                //txt2.Text = "100                                  %";
                //plThingstodo.Controls.Add(txt2);
                //txt2.CssClass = "bg-successIn";
                //iLoadLine = iLoadLine + 1;

                System.Web.UI.HtmlControls.HtmlGenericControl createDiv =new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                createDiv.ID = "createDiv" + iLoadLine.ToString();
                createDiv.InnerHtml = " I'm a div, from code behind ";
                createDiv.Attributes.Add("class", "bg-dangerIn small_txt text-white");
              
                plThingstodo.Controls.Add(createDiv);


                plThingstodo.Controls.Add(new LiteralControl("<br />"));
                plThingstodo.Controls.Add(new LiteralControl("<br />"));
            }


        }
        if (dsWFRecs.Tables[7].Rows.Count > 0)
        {
            funPriLoadDounutChart(dsWFRecs.Tables[7]);
            //divChartPieDisplay1.Visible = true;


        }
        else
        {
            //divChartPieDisplay1.Visible = false;
        }
        if (dsWFRecs.Tables[7].Rows.Count > 0)
        {
            funPriLoadPyramidChart(dsWFRecs.Tables[7]);
            //divChartPieDisplay2.Visible = true;


        }
        else
        {
           // divChartPieDisplay2.Visible = false;
        }






        //if (int_WFType == 1 || int_WFType == 2) //Things to do and Pending Approval
        //{
        //    DataSet dsWFRecs = Utility.GetDataset("S3G_WF_GET_WFRECS", Procparam);
        //    if (dsWFRecs != null)
        //    {
        //        gvListWFDocuments.DataSource = dsWFRecs.Tables[0];
        //        gvListWFDocuments.DataBind();
        //        gvListWFDocuments.Visible = true;
        //        gvEscalExpiredDet.Visible = false;
        //        pnlWorkItems.Visible = true;
        //        divPendingTasks.InnerText = dsWFRecs.Tables[0].Rows.Count.ToString();
        //    }
        //}
        //else if (int_WFType == 3 || int_WFType == 4) // Escalation and Expired
        //{
        //    DataSet dsWFRecs = Utility.GetDataset("S3G_WF_GET_WFRECS", Procparam);
        //    if (dsWFRecs != null)
        //    {
        //        gvEscalExpiredDet.DataSource = dsWFRecs.Tables[0];
        //        gvEscalExpiredDet.DataBind();
        //        gvEscalExpiredDet.Visible = true;
        //        gvListWFDocuments.Visible = false;
        //        pnlWorkItems.Visible = true;
        //    }
        //}
        //if (int_WFType == 5)
        //{
        //    DataSet dsWFRecs = Utility.GetDataset("S3G_WF_GET_WFRECS", Procparam);
        //    divComletedTasks.InnerText = dsWFRecs.Tables[0].Rows.Count.ToString();
        //}
        //if (int_WFType == 3)
        //{
        //    DataSet dsWFRecs = Utility.GetDataset("S3G_WF_GET_WFRECS", Procparam);
        //    divEscalation.InnerText = dsWFRecs.Tables[0].Rows.Count.ToString();
        //}

    }
    void AssignSelectedWorkFlowRecord(char ListType)
    {
        //SessionValues WFSessionItems = new SessionValues();
        WorkFlowSession WFSessionItems = new WorkFlowSession();

        GridView GVDocuments;
        GVDocuments = gvListWFDocuments;

        WFSessionItems.WorkFlowStatusID = int.Parse(GVDocuments.SelectedDataKey.Values[0].ToString());
        WFSessionItems.WorkFlowProgramId = int.Parse(GVDocuments.SelectedDataKey.Values[1].ToString());
        WFSessionItems.WorkFlowDocumentNo = GVDocuments.SelectedDataKey.Values[2].ToString();

        WFSessionItems.LOBId = int.Parse(GVDocuments.SelectedDataKey.Values[3].ToString());
        WFSessionItems.BranchID = int.Parse(GVDocuments.SelectedDataKey.Values[4].ToString());
        WFSessionItems.ProductId = int.Parse(GVDocuments.SelectedDataKey.Values[5].ToString());
        WFSessionItems.LastDocumentNo = GVDocuments.SelectedDataKey.Values[6].ToString();
        WFSessionItems.WorkFlowSequence = GVDocuments.SelectedDataKey.Values[7].ToString();

        WFSessionItems.PANUM = GVDocuments.SelectedDataKey.Values[8].ToString();
        WFSessionItems.SANUM = GVDocuments.SelectedDataKey.Values[9].ToString();
        if (!string.IsNullOrEmpty(GVDocuments.SelectedDataKey.Values[10].ToString()))
            WFSessionItems.Document_Type = int.Parse(GVDocuments.SelectedDataKey.Values[10].ToString());
        else
            WFSessionItems.Document_Type = 0;//Instead of null we use 0
        LoadWorkFlowDocument(WFSessionItems);
    }
    DataTable LoadWorkFlowScreensList(string WFSequenceID)
    {
        //S3G_GEN_GetWorkFlowScreens
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@WFSequence", WFSequenceID);
        DataTable WorkFlowScreens = Utility.GetDefaultData(SPNames.S3G_WORKFLOW_GetWorkFlowScreens, Procparam);
        return WorkFlowScreens;
    }
    void LoadWorkFlowDocument(WorkFlowSession sessionItems)
    {
        try
        {
            WorkFlowSession WFValues = new WorkFlowSession(); // sessionItems.SelecteDocument, sessionItems.SelectedProgramId, sessionItems.SelectedDocumentNo, sessionItems.BranchID, sessionItems.LOBId, sessionItems.ProductId, sessionItems.ReferenceDocNo);
            //WFValues.PANUM = "2011-2012/PRIME/591";
            //WFValues.SANUM = "2011-2012/PRIME/591DUMMY";
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(WFValues.WorkFlowDocumentNo, false, 0);

            WFValues.WorkFlowScreens = LoadWorkFlowScreensList(WFValues.WorkFlowSequence);
            //reterive the Progrram code from the  available data table kept under session
            string ProgramCode = string.Empty;
            DataTable dtWFScreens = new DataTable();
            if (WFValues.WorkFlowScreens != null)
                dtWFScreens = WFValues.WorkFlowScreens;

            if (dtWFScreens.Rows.Count > 0)
            {
                DataRow[] dtRow = dtWFScreens.Select("Workflow_Prg_Id = " + WFValues.WorkFlowProgramId);
                if (dtRow.Length > 0)
                    ProgramCode = dtRow[0]["Program_Ref_No"].ToString();
            }


            //Incase we didn't receive the program Code then fetch it from database.
            if (string.IsNullOrEmpty(ProgramCode))
            {
                Dictionary<string, string> Procparam = new Dictionary<string, string>();
                Procparam.Add("@WFProgramId", WFValues.WorkFlowProgramId.ToString());
                // GET Program ID from WF PROGRAMID
                ProgramCode = Utility.GetTableScalarValue("S3G_GEN_GetProgramCodeFromWFProgram", Procparam);
                //S3GBusEntity.S3GLogger.LogMessage("Test message for Approval", "home page Load");
            }
            NavigateToWFURL(WFValues, Ticket, ProgramCode);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void NavigateToWFURL(WorkFlowSession WFValues, FormsAuthenticationTicket Ticket, string ProgramCode)
    {
        DataRow[] NavigationURL = WFValues.WorkFlowScreens.Select("Program_Ref_No=" + ProgramCode);

        if (NavigationURL.Length > 0) // URL EXISTS
        {
            //if checklist/application/payment approval then redirect to transaction approval page
            if (ProgramCode == "031" || ProgramCode == "037" || ProgramCode == "056")
            {
                Response.Redirect("~/LoanAdmin/S3G_LAD_TransactionApproval.aspx?qsWorkFlow=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=W");
            }
            else
            {
                switch (NavigationURL[0]["Module_Code"].ToString().ToLower())
                {
                    case "o":
                        Response.Redirect("~/Origination/" + NavigationURL[0]["WFUrl"].ToString() + FormsAuthentication.Encrypt(Ticket) + "&qsMode=W");

                        break;
                    case "l":
                        Response.Redirect("~/LoanAdmin/" + NavigationURL[0]["WFUrl"].ToString() + FormsAuthentication.Encrypt(Ticket) + "&qsMode=W");
                        break;
                    case "c":
                        Response.Redirect("~/Collection/" + NavigationURL[0]["WFUrl"].ToString() + FormsAuthentication.Encrypt(Ticket) + "&qsMode=W");
                        break;
                    default:
                        break;
                }
            }

        }
    }
    #endregion

    #region "PROPERTIES"
    public DateTime? FromDate
    {
        get
        {
            return ((txtFromDate.Text.Trim().Length > 0) ? Utility.StringToDate(txtFromDate.Text) : DateTime.MaxValue);
        }
    }
    public DateTime? ToDate
    {
        get
        {
            return ((txtToDate.Text.Trim().Length > 0) ? Utility.StringToDate(txtToDate.Text) : DateTime.MaxValue);
        }
    }

    #endregion




    protected void chkShowAll_CheckedChanged(object sender, EventArgs e)
    {
        //CheckBox chkSelected = (CheckBox)(gvListWFDocuments.HeaderRow.FindControl("chkStatus"));
        if (chkShowAll.Checked)
        {
            ViewState["ShowAll"] = true;
            // FunpriWorkflowBind('A');
        }
        else
        {
            ViewState["ShowAll"] = false;
            // FunpriWorkflowBind('G');
        }
    }


    private static void AssisgnFAApplicationSessionValues()
    {
        UserInfo UserInfo = new UserInfo();
        DataTable dtSessionInfo;
        strConnectionName = Convert.ToString("FA" + "_" + 1 + "_" + "2018-2018".Replace("-", ""));
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", UserInfo.ProCompanyIdRW.ToString());
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
        try
        {
            byte[] byteDataset = ObjAdminService.FunPubFillDataset("FA_GETGLOBALCOMPANYDETAIL", strConnectionName, Procparam);
            dtSessionInfo = ((DataSet)ClsPubSerialize.DeSerialize(byteDataset, SerializationMode.Binary, typeof(DataSet))).Tables[0];

            if (dtSessionInfo.Rows.Count > 0)
            {
                //string strDateformat = dtSessionInfo.Rows[0]["DISPLAY_DATE_FORMAT"].ToString();
                //lDateFormate = strDateformat;
                string strCurrencyName = dtSessionInfo.Rows[0]["CURRENCY_NAME"].ToString();
                string strCurrencyCode = dtSessionInfo.Rows[0]["CURRENCY_CODE"].ToString();
                int intCurrencyId = Convert.ToInt32(dtSessionInfo.Rows[0]["CURRENCY_ID"].ToString());
                //int intGpsPrefix = Convert.ToInt32(dtSessionInfo.Rows[0]["Currency_Max_Digit"].ToString());
                //int intGpsSuffix = Convert.ToInt32(dtSessionInfo.Rows[0]["Currency_Max_Dec_Digit"].ToString());
                decimal decCurrencyValue = 0;
                string strFinYear = Convert.ToString(dtSessionInfo.Rows[0]["Financial_Year"]);
                string strFinStartYear = Convert.ToString(dtSessionInfo.Rows[0]["FinYearStart"]);
                string strFinEndYear = Convert.ToString(dtSessionInfo.Rows[0]["FinYearEnd"]);
                string intFinYearStartMonth = Convert.ToString(dtSessionInfo.Rows[0]["FinYearStartMonth"]);
                string intFinYearEndMonth = Convert.ToString(dtSessionInfo.Rows[0]["FinYearEndMonth"]);
                bool blnDimApplicable = Convert.ToBoolean(dtSessionInfo.Rows[0]["Dimension_Applicable"]);
                bool blnDim2_Linkwith_Dim1 = Convert.ToBoolean(dtSessionInfo.Rows[0]["Dim2_Linkwith_Dim1"]);
                bool blnBudgetAllicable = Convert.ToBoolean(dtSessionInfo.Rows[0]["Budget_Applicable"]);
                int intDenominatorDays = Convert.ToInt32(dtSessionInfo.Rows[0]["Denominator_Days"]);

                bool blnMultiCompany = Convert.ToBoolean(dtSessionInfo.Rows[0]["Multi_Company"]);
                string strCurrencyLevel = Convert.ToString(dtSessionInfo.Rows[0]["Currency_Level"]);
                int intCurrencyLevelID = Convert.ToInt32(dtSessionInfo.Rows[0]["Currency_Level_ID"]);
                int intChequeValidDays = Convert.ToInt32(dtSessionInfo.Rows[0]["Instrument_Valid_Days"]);
                int NOOF_BUDGET_PRJ_YR = Convert.ToInt32(dtSessionInfo.Rows[0]["NOOF_BUDGET_PRJ_YR"]);
                int intExchangeRateID = 0;
                FASession ObjFASession = new FASession(strDateformat, strCurrencyName, strCurrencyCode, intCurrencyId, intGpsPrefix, intGpsSuffix,
                       decCurrencyValue, strFinYear, strFinStartYear, strFinEndYear, intFinYearStartMonth, intFinYearEndMonth, blnDimApplicable, blnDim2_Linkwith_Dim1
                       , blnBudgetAllicable, intExchangeRateID, intDenominatorDays, blnMultiCompany, strCurrencyLevel, intCurrencyLevelID, intChequeValidDays, strConnectionName, NOOF_BUDGET_PRJ_YR);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            ObjAdminService.Close();
        }
    }



    #region WorkFlow Button Events

    protected void imgbtnThingsToDO_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        FunpriWorkflowBind(1);
    }

    protected void imgbtnEscalation_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        FunpriWorkflowBind(3);
    }

    protected void imgbtnExpiredList_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        FunpriWorkflowBind(4);
    }

    protected void imgbtnPendingApproval_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        FunpriWorkflowBind(2);
    }

    #endregion
    protected void btnPrint_ServerClick(object sender, EventArgs e)
    {

    }
    protected void btnLoadDashBoardTransactions_Click(object sender, EventArgs e)
    {
        try
        {
            if (hdnFunctionControl.Value != string.Empty)
            {
                FunpriWorkflowBindPopup(Convert.ToInt32(hdnFunctionControl.Value));
            }
            MPShowDashBoard.Show();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    protected void btnUploadCancel_ServerClick(object sender, EventArgs e)
    {
        MPShowDashBoard.Hide();
        FunpriWorkflowBind(1);
    }
    private void FunpriWorkflowBindPopup(int IntLoadPoint)
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", Convert.ToString(CompanyId));
            Procparam.Add("@User_ID", Convert.ToString(UserId));
            Procparam.Add("@WF_Type", "1");

            DataSet dsWFRecs = Utility.GetDataset("S3G_WF_GET_WFRECS_ALL", Procparam);
            if (dsWFRecs != null)
            {
                gvListWFDocuments.DataSource = dsWFRecs.Tables[IntLoadPoint];
                gvListWFDocuments.DataBind();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void funPriLoadDashBoardNotfications()
    {
        try
        {
            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            string str = string.Empty;
            //str=
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriLoadDounutChart(DataTable dt)
    {
        try
        {
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            //Chart1.Series[0].Points.DataBindXY(x, y);
            //Chart1.Series[0].ChartType = SeriesChartType.Doughnut;
            //Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            //Chart1.ChartAreas[0].AxisX.LabelAutoFitStyle = LabelAutoFitStyles.LabelsAngleStep45 | LabelAutoFitStyles.LabelsAngleStep90 | LabelAutoFitStyles.LabelsAngleStep30;
            //Chart1.Series[0].IsValueShownAsLabel = true;
            //Chart1.Legends[0].Enabled = true;
            //Chart1.Titles.Add("Proposal Chart");

            //for (int i = 0; i < Chart1.Series[0].Points.Count; i++)
            //    if (Chart1.Series[0].Points[i].YValues[0] < 10)
            //    {
            //        Chart1.Series[0].Points[i]["Exploded"] = "True";
            //        Chart1.Series[0].Points[i]["PieLabelStyle"] = "Outside";
            //        Chart1.Series[0].Points[i]["PieLineColor"] = "Red";
            //    }

            //for (var i = 0; i < Chart1.Series.Count; i++)
            //    for (var j = 0; j < Chart1.Series[i].Points.Count; j++)
            //    {
            //        //Chart1.Series[i].Points[j]["Exploded"] = "True";
            //        Chart1.Series[i].Points[j]["PieLabelStyle"] = "Outside";
            //    }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriLoadPyramidChart(DataTable dt)
    {
        try
        {
            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i][0].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i][1]);
            }
            //Chart2.Series[0].Points.DataBindXY(x, y);
            //Chart2.Series[0].ChartType = SeriesChartType.Pyramid;
            //Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            //Chart2.ChartAreas[0].AxisX.LabelAutoFitStyle = LabelAutoFitStyles.LabelsAngleStep45 | LabelAutoFitStyles.LabelsAngleStep90 | LabelAutoFitStyles.LabelsAngleStep30;
            //Chart2.Series[0].IsValueShownAsLabel = true;
            //Chart2.Legends[0].Enabled = true;
            //Chart2.Titles.Add("Payment Chart");

            //for (int i = 0; i < Chart1.Series[0].Points.Count; i++)
            //    if (Chart1.Series[0].Points[i].YValues[0] < 10)
            //    {
            //        Chart1.Series[0].Points[i]["Exploded"] = "True";
            //        Chart1.Series[0].Points[i]["PieLabelStyle"] = "Outside";
            //        Chart1.Series[0].Points[i]["PieLineColor"] = "Red";
            //    }

            //for (var i = 0; i < Chart1.Series.Count; i++)
            //    for (var j = 0; j < Chart1.Series[i].Points.Count; j++)
            //    {
            //        //Chart1.Series[i].Points[j]["Exploded"] = "True";
            //        Chart2.Series[i].Points[j]["PieLabelStyle"] = "Outside";
            //    }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
}
