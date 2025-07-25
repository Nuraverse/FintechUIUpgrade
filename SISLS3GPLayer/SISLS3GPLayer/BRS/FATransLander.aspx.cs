
#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name         :   Financial Accounting
/// Screen Name         :   Transaction Lander
/// Created By          :   Tamilselvan.S
/// Created Date        :   04/02/2012
/// Purpose             :   This is the landing screen for all the other Financial Accounting Screens
/// Last Updated By		:   NULL
/// Last Updated Date   :   NULL
/// Reason              :   NULL
/// <Program Summary> 
#endregion

#region How to use this
/*
   1)	Search for the word "Add Here" and add your code respectively  there...
   2)   Use the same stored procedure FA_TransLander, the return table should have the first column named "ID" - to use it as the RowCommandValue
            SP return table Rule
                1)  First Column should be "ID" - which will be used as a row command
                2)  Second Column should be "Created_By" - which will be the created_By column
                3)  third should be the "User_Level_ID" - which will be the createdBy user's level id.            
            The second and third should was used to check the user authorization.
            Take latest code from - App_Code\Utility_FA.cs
   3)  Add your page Program ID as a parameter (@DocumentNumber)
   4)  If you want to send any other special parameters to your SP, then you can send it – through Dictionary – ProcParam. 
   5)  Also add it – to the Common SP – Commented with your program ID
   6)  The Query String can accept 6 Parameters, 
        a) Create – (Optional)
        b) Query – (Optional)
        c) Modify – (Optional)
        d) MultipleDNC - (Optional)  - If the user wants to select the Document Number Control dynamically.
        e) DNCOption - (Optional) - If the Enduser have more than one option for the selected DNC - eg: approved,unapproved - etc.
        f) Code – (Mandatory)
            ex: 
                FATransLander.aspx?Code=FEIR	
                FATransLander.aspx?Code=SNQ&Create=0&Query=1&Modify=0
                FATransLander.aspx?Code=SNQ&Query=0
                FATransLander.aspx?Code=SNQ& Modify=0
                FATransLander.aspx?Code=CRPT&MultipleDNC=1&DNCOption=1
   7) If you use the Query string "MultipleDNC" then you want to pass the parameter "@MultipleDNC_ID" to "[S3G_ORG_Get_TransLander]" SP
   8) If you use the Query string "DNCOption" then you want to pass the parameter "@MultipleOption_ID" to "[S3G_ORG_Get_TransLander]" SP 

  */
#endregion

#region [Namespaces]

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
using System.Text;
using Resources;
using System.IO;
using System.ServiceModel;
using System.Globalization;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

#endregion [Namespaces]

public partial class Financial_Accounting_FATransLander : ApplyThemeForProject_FA
{

    # region [Programs Code]
    string ProgramCodeToCompare = "";                       // this is to hold the Program Code of your web page
    public string strQueryString = "";
    string strDocNumberProcName = "";
    public static Financial_Accounting_FATransLander Obj_Trans;
    // Add here - Add your Program Code Here - refer to the SQL table Program Master.
    const string strBRS = "FABRS";// Program Code for Bank Reconciliation
    const string strBDU = "BRSD";// Program Code for Bank Statement Upload
    static bool IsApprovalNeed;
    #endregion [Programs Code]

    #region [Common Variables]
    int intCreate = 0;                                                         // intCreate = 1 then display the create button, else invisible
    int intQuery = 0;                                                          // intQuery = 1 then display the Query button, else invisible
    int intModify = 0;                                                         // intModify = 1 then display the Modify button, else invisible
    int intMultipleDNC = 0;                                                    // Allow the user to select the DNC dynamically.
    int intDNCOption = 0;                                                      // Allow the user to select the further option depend on the DNC - eg: approved,unapproved etc...
    Dictionary<int, string> dictMultipleDNC = null;                             // collection for Multiple DNC - DDL
    Dictionary<int, string> dictDNCOption = null;                               // Collection for DNCOption.
    string strProcName = "FA_TransLander";                             // this is the Stored procedure to get call                     
    // To maintain the ProgramID
    UserInfo_FA ObjUserInfo_FA;                                                       // to maintain the user information     
    FASession objSession;
    public string strDateFormat;                                                // to maintain the standard format
    string strRedirectPage = "";                                                // page to redirect to the page in query mode
    string strRedirectCreatePage = "";                                          // page to redirect to the page in Create mode
    Dictionary<string, string> Procparam = null;                                // Dictionary to send our procedure's Parameters
    int intUserID = 0;                                                          // user who signed in
    int intCompanyID = 0;                                                       // conpany of the user who signed in   
    FAPagingValues ObjPaging = new FAPagingValues();                                // grid paging
    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
    bool isQueryColumnVisible;                                                  // To change the Query Column visibility - depend on the user autherization 
    bool isEditColumnVisible;                                                  // To change the Edit Column visibility - depend on the user autherization 
    string[] strLOBCodeToFilter;
    public string strProgramId = "";
    string strRedirectPageHome = "../Common/HomePage.aspx";
    // give the selective lob code 

    FASession objFASession = new FASession();
    #region  User Authorization
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    #endregion

    public int ProPageNumRW                                                     // to retain the current page size and number
    {
        get;
        set;
    }

    public int ProPageSizeRW
    {
        get;
        set;
    }

    #endregion [Common Variables]

    #region [Event's]

    protected void Page_Load(object sender, EventArgs e)
    {
        Obj_Trans = this;
        try
        {
            FunPriGetQueryStrings();                       // refresh the page even if the query string of the URL varys - it mean the user navigates to some other page.
            FunPriPageLoad();
            ViewState["AllowCreate"] = null;
            if (ViewState["AllowCreate"] != null)
            {
                if (Convert.ToInt32(ViewState["AllowCreate"]) == 1)
                    btnCreate.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected bool FunExistsPreYear()
    {
        try
        {
            ViewState["AllowCreate"] = null;
            ucCustomPaging.Visible = false;
            ObjUserInfo_FA = new UserInfo_FA();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANY_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            string strPreYear = "";
            int year = Convert.ToInt32(objFASession.ProFinYearRW.Substring(0, 4));
            strPreYear = (year - 1).ToString() + "-" + year.ToString();
            Procparam.Add("@Fin_Year", strPreYear);
            DataTable dt = Utility_FA.GetDefaultData("FA_RPT_Exists_Pre_Year", Procparam);
            //if (dt.Rows.Count <= 0)
            //    return false;
            if (dt.Rows[0]["PY"].ToString() == "0")
                return true;
            else if (dt.Rows[0]["PY"].ToString() == "1")
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "No Previous Financial Year Exists for the Company", strRedirectPageHome);
                return true;
            }
            else if (dt.Rows[0]["PY"].ToString() == "2")
            {
                //Utility_FA.FunShowAlertMsg_FA(this.Page, "Previous Financial Year Closed", strRedirectPageHome);
                //Utility_FA.FunShowAlertMsg_FA(this.Page, "Previous Financial Year Closed");
                ViewState["AllowCreate"] = 1;
                return true;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return true;
    }

    protected void FunExistsPPJVApproval()
    {
        try
        {
            //  ViewState["AllowCreate"] = null;
            ucCustomPaging.Visible = false;
            ObjUserInfo_FA = new UserInfo_FA();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANY_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            //string strPreYear = "";
            //int year = Convert.ToInt32(objFASession.ProFinYearRW.Substring(0, 4));
            //strPreYear = (year - 1).ToString() + "-" + year.ToString();
            //Procparam.Add("@Fin_Year", strPreYear);
            Procparam.Add("@Program_ID", "37");
            DataTable dt = Utility_FA.GetDefaultData("FA_Exists_PPJVApproval", Procparam);
            //if (dt.Rows.Count <= 0)
            //    return false;
            if (dt.Rows[0]["Approval"].ToString() == "0")
            {
                ViewState["AllowCreate"] = 1;
                //return true;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        //return true ;
    }

    /// <summary>
    /// To load the DNC combo according to this field get change 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>    
    protected void ComboBoxLocationSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ProgramCode)
        {
            default:
                FunPriLoadDNCCombo();                               // To load DNC
                break;
        }
    }

    protected void txtStartDateSearch_TextChanged(object sender, EventArgs e)
    {
        if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtStartDateSearch, txtStartDateSearch.Text, lblStartDateSearch.Text))
            return;

        hidDate.Value = "Start";
        switch (ProgramCode)
        {
            default:
                FunPriLoadDNCCombo();
                break;
        }
        Session["StartDateSearch"] = txtStartDateSearch.Text;

    }

    protected void txtEndDateSearch_TextChanged(object sender, EventArgs e)
    {
        if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtEndDateSearch, txtEndDateSearch.Text, lblEndDateSearch.Text))
            return;

        hidDate.Value = "End";
        switch (ProgramCode)
        {
            default:
                FunPriLoadDNCCombo();
                break;
        }
        Session["EndDateSearch"] = txtEndDateSearch.Text;
    }

    /// <summary>
    /// Will bind the grid and validate the from and to date.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        #region  [User Authorization]
        if (!bIsActive)
        {
            isEditColumnVisible = isQueryColumnVisible = false;
        }
        if ((!bModify) || (intModify == 0))
        {
            isEditColumnVisible = false;
        }
        if ((!bQuery) || (intQuery == 0))
        {
            isQueryColumnVisible = false;
        }
        #endregion
        grvTransLander.Visible = true;
        FunPriValidateFromEndDate();
    }

    /// <summary>
    /// Will call create Page - depend on the Program ID passed.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(strRedirectCreatePage))
        {
            Utility_FA.FunShowAlertMsg_FA(this, "Target page not found");
            return;
        }
        // to get the FA_GETPROGRAM_REF_NO
        #region [To maintain Program_Ref_No in session]
        DataTable dt_Program_Ref_No = Utility_FA.FunGetProgramDetailsByProgramCode(ProgramCode, Convert.ToString(intCompanyID));
        if (dt_Program_Ref_No != null && dt_Program_Ref_No.Rows.Count > 0)
        {
            Session["Program_Ref_No"] = dt_Program_Ref_No.Rows[0]["Program_Ref_No"].ToString();
        }
        else
        {
            Session["Program_Ref_No"] = null;
        }
        #endregion
        Response.Redirect(strRedirectCreatePage, false);
    }

    /// <summary>
    /// Will Clear_FA the controls
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlMultipleDNC != null && ddlMultipleDNC.Visible && ddlMultipleDNC.Items.Count > 0)
                ddlMultipleDNC.SelectedIndex = 0;
            if (ddlDNCOption != null && ddlDNCOption.Visible && ddlDNCOption.Items.Count > 0)
                ddlDNCOption.SelectedIndex = 0;

            grvTransLander.DataSource = null;
            grvTransLander.Visible = false;
            ucCustomPaging.Visible = false;
            lblErrorMessage.Text = txtStartDateSearch.Text = cmbJournalNo.Text = hdnCommonID.Value = txtEndDateSearch.Text = "";

            cmbDocumentNumberSearch.Clear_FA();

          //  ComboBoxLocationSearch.Clear_FA();
            FunPriLoadDNCCombo();


            Session["StartDateSearch"] = null;
            Session["EndDateSearch"] = null;
        }
        catch (Exception ex)
        {

        }
    }

    protected void cmbJournalNo_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            string strhdnValue = hdnCommonID.Value;
            if (strhdnValue == "-1" || strhdnValue == string.Empty)
            {
                cmbJournalNo.Text = string.Empty;
                hdnCommonID.Value = string.Empty;
            }
        }
        catch (Exception ex)
        {

        }
    }

    /// <summary>
    /// It will redirect the page from LAnding to Document Number Page.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvTransLander_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
        if (strRedirectPage.Contains('?'))
            strRedirectPage += "&";
        else
            strRedirectPage += "?";
        switch (e.CommandName.ToLower())
        {
            case "modify":
                Response.Redirect(strRedirectPage + "qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M", false);
                break;
            case "query":
                Response.Redirect(strRedirectPage + "qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q", false);
                break;
            case "print":
                //FunOpenPDF(e.CommandArgument.ToString());
                break;
        }
    }

    /// <summary>
    /// Will set the Grid Style and Alignment of the string dynamically depend on the data types of the cell
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvTransLander_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)                 // if header - then set the style dynamically.
        {
            for (int i_cellVal = 3; i_cellVal < e.Row.Cells.Count; i_cellVal++)
            {
                e.Row.Cells[i_cellVal].CssClass = "styleGridHeader";
            }

        }
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow) // to hide the "ID" column
        {
            e.Row.Cells[4].Visible = false;                             // ID Column - always invisible
            e.Row.Cells[e.Row.Cells.Count - 2].Visible = false;                             // User ID Column - always invisible
            e.Row.Cells[e.Row.Cells.Count - 1].Visible = false;                            // User Level ID Column - always invisible
        }
        if (e.Row.RowType == DataControlRowType.DataRow)                // If data Row then check the data type and set the style - Alignment.
        {

            #region [User Authorization]
            Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
            bool blnAccess = true; //Added for FA integration with S3G data on 08/03/2012
            //if ((ProgramCodeToCompare == "RCP" || ProgramCodeToCompare == "                                                                                                                               RAUT") && Convert.ToInt32(e.Row.Cells[4].Text) > 0)
            //{
            //    blnAccess = false;
            //}

            ImageButton imgbtnQuery = (ImageButton)e.Row.FindControl("imgbtnQuery");
            if (imgbtnEdit != null)
            {
                if (blnAccess && (intModify != 0) && ((bModify) && (ObjUserInfo_FA.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text)))))
                {
                    imgbtnEdit.Enabled = true;
                }
                else
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
            }
            //if (ProgramCodeToCompare == "RCP" || ProgramCodeToCompare == "CHR")
            //{
            //    if (!"Not Approved".ToLower().Contains(e.Row.Cells[e.Row.Cells.Count - 3].Text.ToLower().Trim()))
            //    {
            //        imgbtnEdit.Enabled = false;
            //        imgbtnEdit.CssClass = "styleGridEditDisabled";
            //    }
            //}
            if (ProgramCodeToCompare == "BRSD")
            {
                imgbtnEdit.Enabled = false;
                imgbtnEdit.CssClass = "styleGridEditDisabled";
                if (Convert.ToString(e.Row.Cells[9].Text).Trim() == "Uploaded")
                {
                    imgbtnEdit.Enabled = true;
                    imgbtnEdit.CssClass = "styleGridEdit";
                }
                // e.Row.Cells[e.Row.Cells.Count - 3].Visible = false;
            }
            if (imgbtnQuery != null)
            {
                if (intQuery != 0)
                {
                    imgbtnQuery.Enabled = true;
                }
                else
                {
                    imgbtnQuery.Enabled = false;
                    imgbtnQuery.CssClass = "styleGridQueryDisabled";
                }
            }

            //Code For Specific Approval screens
            if (ProgramCodeToCompare == "APPVL")//PAyment Approval or receipt approval
            {
                imgbtnEdit.Enabled = false;
                imgbtnEdit.CssClass = "styleGridEditDisabled";
            }

            #endregion  [User Authorization]


            for (int i_cellVal = 2; i_cellVal < e.Row.Cells.Count; i_cellVal++)
            {
                try
                {
                    // if (!string.IsNullOrEmpty(e.Row.Cells[i_cellVal].Text) && e.Row.Cells[i_cellVal].Text.Contains("/"))
                    if (!string.IsNullOrEmpty(e.Row.Cells[i_cellVal].Text))
                    {
                        Int32 type = 0;       // 1 = int, 2 = datetime, 3 = string
                        type = FunPriTypeCast(e.Row.Cells[i_cellVal].Text);

                        // cell alignment
                        switch (type)
                        {
                            case 1:  // int - right to left
                                e.Row.Cells[i_cellVal].HorizontalAlign = HorizontalAlign.Right;
                                if (ProgramCodeToCompare != "FUNT") //Changed by Tamilselvan.s on 02/05/2012
                                {
                                    if (grvTransLander.HeaderRow.Cells[i_cellVal].Text.ToLower().ToString().Contains("Amount".ToLower()))
                                    {
                                        e.Row.Cells[i_cellVal].Text = Convert.ToDecimal(e.Row.Cells[i_cellVal].Text).ToString(Utility_FA.SetSuffix());
                                    }
                                }
                                break;
                            case 2:  // datetime - trim to code standard
                                e.Row.Cells[i_cellVal].Text = DateTime.Parse(e.Row.Cells[i_cellVal].Text, CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                                break;
                            case 3:  // string - do nothing - left align(default)
                                e.Row.Cells[i_cellVal].HorizontalAlign = HorizontalAlign.Left;
                                break;
                        }
                    }
                    grvTransLander.Columns[2].Visible = false;
                }
                catch (Exception ex)
                {
                    //continue;
                }
            }
        }
    }

    #endregion [Event's]

    #region [Function's]

    private void FunPriPageLoad()
    {
        #region [Application Standard Date Format]
        objSession = new FASession();
        strDateFormat = objSession.ProDateFormatRW;                              // to get the standard date format of the Application
        CalendarExtenderEndDateSearch.Format = strDateFormat;                       // assigning the first textbox with the End date
        CalendarExtenderStartDateSearch.Format = strDateFormat;                     // assigning the first textbox with the start date
        #endregion [Application Standard Date Format]

        #region Grid Paging Config
        ProPageNumRW = 1;                                                           // to set the default page number
        TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
        if (txtPageSize.Text != "")
            ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
        else
            ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));
        PageAssignValue obj = new PageAssignValue(this.AssignValue);
        ucCustomPaging.callback = obj;
        ucCustomPaging.ProPageNumRW = ProPageNumRW;
        ucCustomPaging.ProPageSizeRW = ProPageSizeRW;
        #endregion

        # region User Information
        ObjUserInfo_FA = new UserInfo_FA();
        intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;                                  // current user's company ID.
        intUserID = ObjUserInfo_FA.ProUserIdRW;                                        // current user's ID

        #region  User Authorization
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;
        #endregion
        #endregion

        #region Initialize page
        bool IsQueryStringChanged = false;
        if (!(string.IsNullOrEmpty(Request.QueryString["Code"])))                   // reading the query string
        {
            // to do  : want to decrypt this code in the URL
            FunPriGetQueryStrings();
            FunPriTransactionActionButtons();
            InitPage();
            FunPriUIVisibility();
            if (ViewState["ProgramCode"] == null)                                    // Added viewstate for the program code - to refresh the page - when the query string of the URL varys. - It will assign the program code to the view state - for the very first time the page loads.
                ViewState["ProgramCode"] = ProgramCode;
            else                                                                    // If the program code in the URL changes then - it mean the user clicked on some other menu - so it need to refresh the page accordingly.
            {
                if (string.Compare(ViewState["ProgramCode"].ToString(), ProgramCode) != 0)
                {
                    IsQueryStringChanged = true;                                    // If the page changed from the current page.
                }
            }
        }
        #endregion

        #region !IsPostBack or QueryString changed.
        if ((!IsPostBack) || (IsQueryStringChanged))                                // refresh the page even if the query string of the URL varys - it mean the user navigates to some other page.
        {
            IsApprovalNeed = false;
           // RFVComboLocation.ErrorMessage = ErrorHandlingAndValidation.ResourceManager.GetString("11");
            ViewState["ProgramCode"] = ProgramCode;
            IsQueryStringChanged = false;
            txtEndDateSearch.Attributes.Add("readonly", "readonly");                // making the end date textbox readonly
            txtStartDateSearch.Attributes.Add("readonly", "readonly");              // making the start date textbox readonly
            FunProLoadCombos();                                                     // loading the combos - LOB and Branch
            grvTransLander.Visible = ucCustomPaging.Visible = false;
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);           // setting the Page Title
            //ComboBoxLocationSearch.Clear_FA();

            #region  [User Authorization]
            if (btnCreate.Enabled)                                                  // if the user can view the create button - depends on the query string
            {
                #region [User Authorization]
                if (!bIsActive)
                {
                    grvTransLander.Columns[1].Visible = false;
                    grvTransLander.Columns[0].Visible = false;
                    btnCreate.Enabled = false;
                    return;
                }
                if (!bModify)
                {
                    grvTransLander.Columns[1].Visible = false;
                    intModify = 0;
                }
                if (!bQuery)
                {
                    grvTransLander.Columns[0].Visible = false;
                    intQuery = 0;
                }
                if (!bCreate)
                {
                    btnCreate.Enabled = false;
                    intCreate = 0;
                }
                #endregion [Authorization Code end]

                #region [This Switch is to set the button Text changed based on Screen Purpose]
                switch (ProgramCode)
                {
                    default:
                        btnCreate.Text = btnCreate.ToolTip = "Create";
                        break;
                }
                #endregion [This Switch is to set the button Text changed based on Screen Purpose]
            }
            #endregion
            Session["SJournal"] = rdoSystem.Checked.ToString();
            txtEndDateSearch.Text = txtStartDateSearch.Text = "";

            switch (ProgramCode)
            {
                case strBDU:
                    FunPriLoadBankDetails();
                    break;
                default:
                    break;
            }
        }
        #endregion
        ViewState["EnquiryorCustomer"] = string.Empty;
    }

    /// <summary>
    /// To read the values from the querystring
    /// </summary>
    private void FunPriGetQueryStrings()
    {
        if (Request.QueryString.Get("Code") != null)
            ProgramCode = (Request.QueryString.Get("Code"));
    }

    /// <summary>
    /// To Enable/Disable your transaction page Action Buttons
    /// </summary>
    private void FunPriTransactionActionButtons()
    {
        // Add here
        switch (ProgramCode)
        {
            case strBRS:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strBDU:
                FunPriEnableActionButtons(true, true, true, true, false, false);
                break;
            default:
                FunPriEnableActionButtons(false, false, false, false, false, false);
                break;
        }
    }

    /// <summary>
    /// This method will decide to make the Action Buttons Enable/Disable - Depending to your transaction Page.
    /// </summary>
    /// <param name="blnCreate">true to enable create button</param>
    /// <param name="blnQuery">true to enable Query Mode</param>
    /// <param name="blnModify">true to enable Modify Mode</param>
    /// <param name="blnMultipleDNC">true to enable Multiple DNC</param>
    /// <param name="blnDNCOption">true to maintain the DNC Option</param>
    private void FunPriEnableActionButtons(bool blnCreate, bool blnQuery, bool blnModify, bool blnMultipleDNC, bool blnDNCOption, bool isApprovalNeed)
    {
        intCreate = (bCreate) ? Convert.ToInt32(blnCreate) : 0; // checking user access
        intModify = (bModify) ? Convert.ToInt32(blnModify) : 0; // checking user access
        intQuery = (bQuery) ? Convert.ToInt32(blnQuery) : 0; // checking user access
        intMultipleDNC = Convert.ToInt32(blnMultipleDNC);
        intDNCOption = Convert.ToInt32(blnDNCOption);
        isApprovalNeed = isApprovalNeed;
    }

    /// <summary>
    /// This method will Initialize the page depend on the document Number Code passed.
    /// </summary>
    protected void InitPage()
    {
        // Add here - your case condition - with respect to you program Code 
        // only If you're not passing the MultipleDNC Query String.
        // if you want to pass the LOB and branch as a query string - then make a call to FunPriQueryString();
        lblJVNo.Visible = cmbJournalNo.Visible = false;
        switch (ProgramCode)
        {
            case strBRS:
                strProgramId = "100";
                FunPubIsVisible(true, true);
                FunPubIsMandatory(false, false, false);
                ProgramCodeToCompare = strBRS;
                this.Title = "FA - BRS AutoMatching";
                lblHeading.Text = " Bank AutoMatching - Details";
                lblProgramIDSearch.Text = "BRS No.";                          // This is to display on the Document Number Label                
                strRedirectPage = "~/BRS/FABRS_Add.aspx";                     // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode            
                strDocNumberProcName = "FA_TRANS_BRS_AGT";
                break;
            case strBDU:
                strProgramId = "107";
                FunPubIsVisible(true, false);
                FunPubIsMandatory(false, false, false);
                ProgramCodeToCompare = strBDU;
                this.Title = "FA - Bank Statement Upload";
                lblHeading.Text = " Bank Statement Upload - Details";
                lblProgramIDSearch.Text = "Document No.";                    // This is to display on the Document Number Label                
                strRedirectPage = "~/BRS/FA_BRS_DataValidation.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode            
                strDocNumberProcName = "FA_TRANS_BRS_AGT";
                lblMultipleDNC.Text = "Bank Name";
                break;
        }
    }

    /// <summary>
    /// To set the Location visible/NonVisible
    /// </summary>
    /// <param name="isLocation">true to set the Location DDL Mandatory</param>
    /// <param name="isMultipleDNC">true to set the Multiple DNC Mandatory</param>
    private void FunPubIsVisible(bool isLocation, bool isMultipleDNC)
    {
        // To make the LOB and Branch Non-Mandatory
       // RFVComboLocation.Enabled = isLocation;
        // To change the Label style to Non mandatory
        lblLocationSearch.CssClass = (isLocation) ? "styleReqFieldLabel" : "styleDisplayLabel";
        ComboBoxLocationSearch.Visible = lblLocationSearch.Visible = isLocation;
        lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = isMultipleDNC;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="isLocationMandatory"></param>
    /// <param name="isStartDateMandatory"></param>
    /// <param name="isEndDateMandatory"></param>
    private void FunPubIsMandatory(bool isLocationMandatory, bool isStartDateMandatory, bool isEndDateMandatory)
    {
        // To make the LOB and Branch Non-Mandatory
       // RFVComboLocation.Enabled = (isLocationMandatory) ? true : false;
        RFVStartDate.Enabled = (isStartDateMandatory) ? true : false;
        RFVEndDate.Enabled = (isEndDateMandatory) ? true : false;
        // To change the Label style to Non mandatory
        lblLocationSearch.CssClass = (isLocationMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel";
        lblStartDateSearch.CssClass = (isStartDateMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel";
        lblEndDateSearch.CssClass = (isEndDateMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel";
    }

    /// <summary>
    /// To change the visibility - according to the Query String
    /// </summary>
    private void FunPriUIVisibility()
    {
        btnCreate.Enabled = (intCreate == 0) ? false : true;
    }

    /// <summary>
    /// This is tp load the combo(s) in the page.
    /// </summary>
    protected void FunProLoadCombos()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        Procparam.Add("@User_ID", Convert.ToString(intUserID));
        Procparam.Add("@Program_Id", strProgramId);
        //-----Changed By kavitha for getting operating Locations in Translander------//
        Procparam.Add("@Is_Operational", "1");
        string strPreYear = "";
        int year = Convert.ToInt32(objFASession.ProFinYearRW.Substring(0, 4));
        strPreYear = (year - 1).ToString() + "-" + year.ToString();
        if (ProgramCode == "PPJV" || ProgramCode == "PPJVA")
            Procparam.Add("@Fin_Year", strPreYear);
        //-----Changed By kavitha------//

        // Location
        ComboBoxLocationSearch.BindDataTable_FA(SPNames.GetLocation, Procparam, true, "-- Select --", new string[] { "Location_ID", "Location" });
        // Loading Multiple DNC
        FunPriLoadMultiDNCCombo();
        FunPriLoadDNCCombo();

        switch (ProgramCode)
        {
            case "INVT":
                FunPriFilterAndLoadLocation();
                break;
            case "FUNL":
                FunPriFilterAndLoadLocation();
                break;
            case "FUNT":
                FunPriFilterAndLoadLocation();
                break;
            case "RCP":
                FunPriFilterAndLoadLocation();
                break;
            case "RAUT":
                FunPriFilterAndLoadLocation();
                break;
            case "CRAUT":
                FunPriFilterAndLoadLocation();
                break;
            case "INVI":
                FunPriFilterAndLoadLocation();
                break;
            default:
                break;
        }
    }

    /// <summary>
    /// This is an optional dropdown box - if the user want to 
    /// display multiple DNC - then he can make use of this method.
    /// </summary>
    private void FunPriLoadMultiDNCCombo()
    {
        lblMultipleDNC.Visible = ddlMultipleDNC.Visible = intMultipleDNC == 1 ? true : false;
        lblDNCOption.Visible = ddlDNCOption.Visible = intDNCOption == 1 ? true : false;
    }

    private void FunPriFilterAndLoadLocation()
    {
        //if (ComboBoxLocationSearch != null && ComboBoxLocationSearch.DataSource != null)
        //{
        //    DataTable dtLocation = (DataTable)ComboBoxLocationSearch.DataSource;
        //    if (dtLocation.Columns["DataText"].ColumnName == "DataText")
        //    {
        //        dtLocation.Columns.Remove("DataText");
        //    }
        //    if (dtLocation != null && dtLocation.Rows.Count > 0)
        //    {
        //        //StringBuilder strddlItem = new StringBuilder();
        //        //for (int i_lob = 0; i_lob < strLOBCodeToFilter.Length; i_lob++)
        //        //{
        //        //    strddlItem.Append(" LOB_Code like '" + strLOBCodeToFilter[i_lob] + "' or ");
        //        //}
        //        //strddlItem.Append(" LOB_Code like '" + strLOBCodeToFilter[0] + "'");

        //        //dtLocation.DefaultView.RowFilter = strddlItem.ToString();

        //        //ComboBoxLocationSearch.Items.Clear();
        //        //ComboBoxLocationSearch.BindDataTable_FA(dtLocation, "Location_ID", "Location");
        //    }
        //}
    }

    /// <summary>
    /// Will load the DNC Combo
    /// </summary>
    private void FunPriLoadDNCCombo()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        // Add Here - your case statement blow if needed
        // Document Number Combo - Before add your code check if the common Function was available.       
        switch (ProgramCode)
        {
            default:
                // to do: disable the page 
                break;
        }
    }

    /// <summary>
    /// To load the DNC according to the Location selected.
    /// </summary>
    private void FunPri_AddParamsLocation()
    {
        if (ComboBoxLocationSearch != null && ComboBoxLocationSearch.Text != "")
        {
            Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
        }
        cmbDocumentNumberSearch.Clear_FA();
    }

    /// <summary>
    /// To Bind the Landing Grid
    /// </summary>
    /// <param name="intPageNum"> Current Page Number of the grid </param>
    /// <param name="intPageSize"> Current Page size of the grid </param>
    protected void AssignValue(int intPageNum, int intPageSize)
    {
        ProPageNumRW = intPageNum;              // To set the page Number
        ProPageSizeRW = intPageSize;            // To set the page size    
        FunPriBindGrid();                       // Binding the Landing grid
    }

    /// <summary>
    /// Bind the Landing Grid.
    /// </summary>
    private void FunPriBindGrid()
    {
        try
        {
            FunPriAddCommonParameters();                                                        // Adding the Common parameters to the dictionary            
            // Passing DNC ddl value to the SP
            if (cmbDocumentNumberSearch != null && cmbDocumentNumberSearch.SelectedText != "")   // General document no of your page (ex)FIR Number,Enquiry No,App Processing No,
            {
                Procparam.Add("@DocumentNumber", cmbDocumentNumberSearch.SelectedValue);
            }

            // Passing MJV DNC to get the specific Doc no details 
            //if (cmbJournalNo != null && cmbJournalNo.SelectedIndex > 0)
            //{
            //    Procparam.Add("@DocumentNumber", cmbJournalNo.SelectedValue);
            //}
            if (hdnCommonID.Value != string.Empty)
            {
                Procparam.Add("@DocumentNumber", hdnCommonID.Value);
            }
            // Passing Multiple DNC ddl value to the SP
            if (ddlMultipleDNC != null && ddlMultipleDNC.Visible && ddlMultipleDNC.SelectedIndex > 0)
            {
                Procparam.Add("@MultipleDNC_ID", ddlMultipleDNC.SelectedValue);
            }
            // Passing Multiple DNC option ddl value to the SP
            if (ddlDNCOption != null && ddlDNCOption.Visible && ddlDNCOption.SelectedIndex > 0)
            {
                Procparam.Add("@MultipleOption_ID", ddlDNCOption.SelectedValue);
            }
            if ((cmbDocumentNumberSearch != null && cmbDocumentNumberSearch.SelectedText != "") && IsApprovalNeed)   // using for approval screen purpose
            {
                Procparam.Add("@Task_Number_ID", cmbDocumentNumberSearch.SelectedValue);
            }
            Procparam.Add("@ProgramCode", ProgramCodeToCompare.ToString());                     // using for approval screen purpose

            string strPreYear = "";
            int year = Convert.ToInt32(objFASession.ProFinYearRW.Substring(0, 4));
            strPreYear = (year - 1).ToString() + "-" + year.ToString();
            Procparam.Add("@Fin_Year", strPreYear);

            bool colModify = true;//This is to hide column grid
            bool colQuery = true;

            //Add here - add your extra SP parameters - if required... in the below switch case (also Add the same to the common SP - with your program Code Commented).
            switch (ProgramCode)
            {
                case strBDU:
                    Procparam.Add("@MultipleOption_ID", Convert.ToString(ddlMultipleDNC.SelectedValue));
                    break;
                default:
                    break;
            }
            FunPriBindGridWithFooter(colModify, colQuery);                                                                   // Binding the grid.

        }
        //catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

    /// <summary>
    /// Will add the common parameters to the Dictionary - to pass it to the Common SP.
    /// </summary>
    private void FunPriAddCommonParameters()
    {
        //Paging Properties set  
        int intTotalRecords = 0;
        ObjPaging.ProCompany_ID = intCompanyID;
        ObjPaging.ProUser_ID = intUserID;
        ObjPaging.ProTotalRecords = intTotalRecords;
        ObjPaging.ProCurrentPage = ProPageNumRW;
        ObjPaging.ProPageSize = ProPageSizeRW;
        ObjPaging.ProSearchValue = hdnSearch.Value;
        ObjPaging.ProOrderBy = hdnOrderBy.Value;
        ObjPaging.ProProgram_ID = Convert.ToInt32(strProgramId);
        if (Procparam != null)
        {
            Procparam.Clear();
        }
        else
        {
            Procparam = new Dictionary<string, string>();
        }
        if (ComboBoxLocationSearch.Text != "")
        {
            Procparam.Add("@Location_ID", hdnBranchID.Value);
        }
        if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
            Procparam.Add("@StartDate", Utility_FA.StringToDate(txtStartDateSearch.Text).ToString());
        if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
            Procparam.Add("@EndDate", Utility_FA.StringToDate(txtEndDateSearch.Text).ToString());
    }

    /// <summary>
    /// Will bind the grid view 
    /// </summary>
    private void FunPriBindGridWithFooter(bool colModify, bool colQuery)
    {
        int intTotalRecords = 0;
        bool bIsNewRow = false;
        grvTransLander.BindGridView_FA(strProcName, Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

        //This is to hide first row if grid is empty
        if (bIsNewRow)
        {
            grvTransLander.Rows[0].Visible = false;
        }
        //if (ProgramCodeToCompare == strPaymentApproval || ProgramCodeToCompare == strLeaseAssetSaleApproval || ProgramCodeToCompare == strAccountclosureApproval || ProgramCodeToCompare == strTopupApproval || ProgramCodeToCompare == strSpecificRevisionApproval || ProgramCodeToCompare == strManualJournalApproval || ProgramCodeToCompare == strPrematureClosureApproval || ProgramCodeToCompare == strConsolidationApproval || ProgramCodeToCompare == strSplitApproval)
        if ((IsApprovalNeed) || (!colModify))
        {
            grvTransLander.Columns[1].Visible = false;
        }
        else
        {
            grvTransLander.Columns[1].Visible = true;
        }

        ucCustomPaging.Visible = true;
        ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
        ucCustomPaging.setPageSize(ProPageSizeRW);
        lblErrorMessage.Text = "";
    }

    /// <summary>
    /// This method will validate the from and to date - entered by the user.
    /// </summary>
    private void FunPriValidateFromEndDate()
    {
        DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
        dtformat.ShortDatePattern = "MM/dd/yy";

        //if ((!(string.IsNullOrEmpty(DateTime.Parse(txtStartDateSearch.Text, dtformat).ToString()))) &&
        if ((!(string.IsNullOrEmpty(txtStartDateSearch.Text))) &&
           (!(string.IsNullOrEmpty(txtEndDateSearch.Text))))                                   // If start and end date is not empty
        {
            if (Utility_FA.StringToDate(txtStartDateSearch.Text) > Utility_FA.StringToDate(txtEndDateSearch.Text)) // start date should be less than or equal to the enddate
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "End date should not be less than the Start Date");
                if (hidDate.Value.ToUpper() == "START")
                    Utility_FA.FunShowAlertMsg_FA(this, "Start date should be lesser than the End Date");
                else
                    Utility_FA.FunShowAlertMsg_FA(this, "End date should be greater than the Start Date");
                FunPriBindGrid();
                return;
            }
        }
        //if ((!(string.IsNullOrEmpty(txtStartDateSearch.Text))) &&
        //   ((string.IsNullOrEmpty(txtEndDateSearch.Text))))
        //{
        //    txtEndDateSearch.Text = DateTime.Parse(DateTime.Now.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);

        //}
        FunPriBindGrid();
    }

    /// <summary>
    /// This is the get the datatype of the string passed
    /// </summary>
    /// <param name="val">string</param>
    /// <returns>   
    ///             1 for int, 
    ///             2 for datetime, 
    ///             3 for string
    /// </returns>
    private Int32 FunPriTypeCast(string val)
    {
        try                                                         // casting - to use proper align       
        {
            Int32 tempint = Convert.ToInt32(Convert.ToDecimal(val));                   // Try int     
            return 1;
        }
        catch (Exception ex)
        {
            return 3;
            //    try
            //    {
            //        DateTime tempdatetime = Convert.ToDateTime(val);    // try datetime
            //        return 2;
            //    }
            //    catch (Exception ex1)
            //    {
            //        return 3;                                           // try String
            //    }
        }
    }

    protected void Journal_OnCheckedChanged(object sender, EventArgs e)
    {
        FunPriLoadDNCCombo();                               // to load DNC
        grvTransLander.DataSource = null;
        grvTransLander.DataBind();
        ucCustomPaging.Visible = false;
        Session["SJournal"] = rdoSystem.Checked.ToString();
    }

    private void FunPriLoadBankDetails()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            DataTable dtBankList = Utility_FA.GetDefaultData(SPNames.Get_BankDetail_Receipt, Procparam);
            ddlMultipleDNC.BindDataTable_FA(dtBankList, "Bank_Detail_ID", "Bank_Name");

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion [Function's]

    private string FunGetCompAddress()
    {
        string strCompAddress = string.Empty;
        try
        {

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            DataSet DS = new DataSet();
            DS = Utility_FA.GetDataset(SPNames.FA_SYS_GET_COMPANYDETAILS, Procparam);

            if (DS != null)
            {
                if (DS.Tables[0].Rows.Count > 0)
                {
                    if (!string.IsNullOrEmpty(DS.Tables[0].Rows[0]["Comu_Address"].ToString()))
                        strCompAddress = DS.Tables[0].Rows[0]["Comu_Address"].ToString();

                    if (strCompAddress.Contains("\r\n"))
                        strCompAddress = strCompAddress.Replace("\r\n", " ");

                }
            }
        }
        catch (Exception ex)
        {
            //    FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        return strCompAddress;
    }

    protected void txtBranchSearch_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            string strhdnValue = hdnBranchID.Value;
            if (strhdnValue == "-1" || strhdnValue == string.Empty)
            {
                ComboBoxLocationSearch.Text = string.Empty;
                hdnBranchID.Value = string.Empty;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Translander - Collection");
        }
    }

    [System.Web.Services.WebMethod]
    public static string[] GetBranchList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        UserInfo_FA Ufo = new UserInfo_FA();

        Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(Ufo.ProCompanyIdRW));
        Procparam.Add("@User_ID", Convert.ToString(Ufo.ProUserIdRW));
        Procparam.Add("@Program_Id", Obj_Trans.strProgramId);
        Procparam.Add("@Is_Operational", "1");
        string strPreYear = "";
        int year = Convert.ToInt32(Obj_Trans.objFASession.ProFinYearRW.Substring(0, 4));
        strPreYear = (year - 1).ToString() + "-" + year.ToString();
        if (Obj_Trans.ProgramCode == "PPJV" || Obj_Trans.ProgramCode == "PPJVA")
            Procparam.Add("@Fin_Year", strPreYear);
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_Loca_List_AGT", Procparam));

        return suggetions.ToArray();
    }

    private Dictionary<string, string> GetDefaultParams()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();

        if (ComboBoxLocationSearch.Text != "")
        {
            Procparam.Add("@Location_ID", hdnBranchID.Value);
        }
        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        Procparam.Add("@Program_Id", strProgramId);
        if (txtStartDateSearch.Text != "")
        {
            Procparam.Add("@Fromdate", Utility_FA.StringToDate(txtStartDateSearch.Text).ToString());
        }
        if (txtEndDateSearch.Text != "")
        {
            Procparam.Add("@Todate", Utility_FA.StringToDate(txtEndDateSearch.Text).ToString());
        }

        return Procparam;
    }

    [System.Web.Services.WebMethod]
    public static string[] GetDocNumber(String prefixText, int count)
    {
        List<String> suggetions = new List<String>();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        string ProcName = Obj_Trans.strDocNumberProcName;
        UserInfo_FA Ufo = new UserInfo_FA();
        Procparam = Obj_Trans.GetDefaultParams();
        Procparam.Add("@prefixText", prefixText);
        switch (Obj_Trans.ProgramCode)
        {
            case strBRS:
                Procparam.Add("@User_ID", Ufo.ProUserIdRW.ToString());
                break;
            case strBDU:
                Procparam.Add("@User_ID", Ufo.ProUserIdRW.ToString());
                break;
        }
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData(ProcName, Procparam));
        return suggetions.ToArray();
    }
}
