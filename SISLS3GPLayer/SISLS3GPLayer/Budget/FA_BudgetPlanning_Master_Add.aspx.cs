#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Budget Planning Master
/// Created By			: Boobalan M
/// Created Date		: 13-Nov-2019
/// Purpose	            : Create New Budget Plan.
#endregion


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
using S3GBusEntity;
using System.Collections.Generic;
using System.Text;
using System.Web.Services;
using FA_BusEntity;

public partial class Budget_BudgetPlanning_Master : ApplyThemeForProject_FA
{

    #region  Variable declaration

    static string[] strarrControlsID = new string[0];
    int intCompanyId = 0;
    int intUserId = 0;
    static string strPageName = "Budget Planning Master";
    int intErrCode = 0;
    int intLocationCat_ID = 0;
    int intLocationMap_ID = 0;
    int int_budget_id = 0;
    SerializationMode SerMode = SerializationMode.Binary;
    string StrConnectionName = string.Empty;
    ApplyThemeForProject ATFP = new ApplyThemeForProject();
    UserInfo usrInfo = new UserInfo();
    //User Authorization
    string strType = "Cate";
    string strMode = string.Empty;
    bool bCreate = false;
    static DataTable dtGL = new DataTable();
    int strDecMaxLength = 0;
    int strPrefixLength = 0;
    static DataTable dtLocations = new DataTable();
    static DataTable dtCurrentBudget = new DataTable();
    static DataTable dtProjectedBudget = new DataTable();
    string strBudget_Master_Id = string.Empty;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FormsAuthenticationTicket fromTicket;
    FASession objFASession = new FASession();

    string strRedirectPageView = "~/Budget/FA_BudgetPlanning_Master_View.aspx";
    string strRedirectPageAdd = "~/Budget/FA_BudgetPlanning_Master_Add.aspx";
    string Frommonth = "0";
    string Tomonth = "0";
    int intBudgetId = 0;

    Dictionary<string, string> Procparam = null;
    S3GSession ObjS3GSession = new S3GSession();
    string RequestMode = string.Empty;

    // Serivice Ref Declaration
    BudgetServiceReference.BudgetMasterClient objBudget_MasterClient;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTRow objbudmasterrow;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTDataTable objbudmaster_DTB = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTDataTable();


    string strErrorMessage = @"Correct the following validation(s):<ul><li> ";
    string strErrorMsgLast = @"</ul></li>";
    bool IsLOBCalled = false;


    string strXMLLOBDet = "<Root><Details LOB_ID='0' /></Root>";
    StringBuilder strbLOBDet = new StringBuilder();
    #endregion

    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (usrInfo.ProCompanyIdRW == 0)
                HttpContext.Current.Response.Redirect("../SessionExpired.aspx");

            Page.Theme = usrInfo.ProUserThemeRW;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            strPrefixLength = ObjS3GSession.ProGpsPrefixRW;
            strDecMaxLength = ObjS3GSession.ProGpsSuffixRW;
            usrInfo = new UserInfo();
            intCompanyId = usrInfo.ProCompanyIdRW;
            intUserId = usrInfo.ProUserIdRW;
            bCreate = usrInfo.ProCreateRW;

            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intBudgetId = Convert.ToInt32(fromTicket.Name);
                RequestMode = Request.QueryString.Get("qsMode");
                strMode = RequestMode;
            }
            else
            {
                strMode = "C";
                lnkBudgetLock.Visible = false;
                icolock.Visible = false;
                lblHeading.Text = "Budget Planning Master - Create";
            }


            if (!IsPostBack)
            {
                dropDownListLoad();

                if (RequestMode != "CP")
                {
                    strPageName = strPageName + " - Modify";
                    strBudget_Master_Id = intBudgetId.ToString();

                }
                strMode = RequestMode;

                if (Request.QueryString.Get("qsmasterId") != null)
                {
                    BindQuerydata(intBudgetId);
                }

                if (RequestMode == "M")
                {
                    ModifyEnabledisable();
                    strMode = "M";
                    lblHeading.Text = "Budget Planning Master - Modify";
                }
                else if (RequestMode == "Q")
                {
                    this.pnlBudgetMaster.Enabled = false;
                    QueryEnabledisable();
                    lblHeading.Text = "Budget Planning Master - Query";
                }
                else if (RequestMode == "CP")
                {
                    strMode = RequestMode;
                    lblHeading.Text = "Budget Planning Master - Create";
                }

            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    protected void BindQuerydata(int BudMstId)
    {
        try
        {
            string currentMonth = DateTime.Now.Month.ToString();
            string currentYear = DateTime.Now.Year.ToString();

            // int Yearmonth = Convert.ToInt32(currentYear + currentMonth);
            int Yearmonth = 201901;

            DataSet Dset = new DataSet();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Budget_Mst_Id", BudMstId.ToString());
            Dset = Utility_FA.GetDataset("BUD_GET_BUDGETPALNNING_MST", Procparam);

            DataTable DtMaster = new DataTable();
            DataTable DtLocation = new DataTable();
            DataTable DtCurrent = new DataTable();
            DataTable DtProjected = new DataTable();

            DtMaster = Dset.Tables[0];
            DtLocation = Dset.Tables[1];
            DtCurrent = Dset.Tables[2];
            DtProjected = Dset.Tables[3];

            if (strMode != "CP")
            {
                this.ddlFinancialyear.SelectedValue = DtMaster.Rows[0]["FIN_YEAR"].ToString();
                this.ddlCurrency.SelectedValue = DtMaster.Rows[0]["currency_id"].ToString();

                this.ddlGlAccounts.SelectedText = DtMaster.Rows[0]["gl_desc"].ToString();
                this.ddlGlAccounts.SelectedValue = DtMaster.Rows[0]["gl_code"].ToString();
                this.ddlActivity.SelectedValue = DtMaster.Rows[0]["activity_id"].ToString();
                int ActiveStatus = Convert.ToInt32(DtMaster.Rows[0]["is_active"].ToString());
                int is_Lock = Convert.ToInt32(DtMaster.Rows[0]["is_lock"].ToString());
                int GL_Status = Convert.ToInt32(DtMaster.Rows[0]["GL_Status"].ToString());
                int GL_Duplicate = Convert.ToInt32(DtMaster.Rows[0]["GL_Duplicate"].ToString());
                if (ActiveStatus == 1)
                {
                    this.CbxActive.Checked = true;
                }
                else
                {
                    this.CbxActive.Checked = false;
                }


                if (is_Lock == 1)
                {
                    icolock.Visible = true;
                    icoUnlock.Visible = false;
                }
                else
                {
                    icolock.Visible = false;
                    icoUnlock.Visible = true;
                    GET_USER_FUN_ACCESS();
                }

                if (GL_Status == 0)
                {
                    this.CbxActive.Disabled = true;
                }
                else
                {
                    this.CbxActive.Disabled = false;
                }

                if (ActiveStatus == 0 && GL_Duplicate > 0)
                {
                    this.CbxActive.Disabled = true;
                }





                this.grvLocationList.DataSource = DtLocation;
                this.grvLocationList.DataBind();

                grvLocationList.Columns[1].Visible = false;

                this.grvCurrentYearBudget.DataSource = DtCurrent;
                this.grvCurrentYearBudget.DataBind();

                this.grvProjectedBudget.DataSource = DtProjected;
                this.grvProjectedBudget.DataBind();

                ViewState["CurrentTable"] = DtCurrent;
            }
            else
            {
                this.lnkBudgetLock.Visible = false;
                icolock.Visible = false;

                if (DtMaster.Rows[0]["budget_pattern"].ToString() == "2")
                {
                    DataView dv = new DataView(DtCurrent);
                    dv.RowFilter = String.Format("Year >" + Yearmonth);
                    DtCurrent = dv.ToTable();

                    this.grvCurrentYearBudget.DataSource = dv;
                    this.grvCurrentYearBudget.DataBind();
                    ViewState["CurrentTable"] = DtCurrent;

                    var prjyearcount = objFASession.probudgetprojectedyear;

                    dtProjectedBudget = new DataTable();
                    dtProjectedBudget.Columns.Add("year", typeof(string));
                    dtProjectedBudget.Columns.Add("budget", typeof(string));

                    foreach (DataRow Dtrow in DtCurrent.Rows)
                    {
                        string CurrYear = Dtrow[0].ToString();
                        string Amount = Dtrow[1].ToString();

                        int prjYear = Convert.ToInt32(CurrYear.Substring(0, 4));
                        string PrjMonth = CurrYear.Substring(4);

                        int a = 0;
                        while (a < prjyearcount)
                        {
                            DataRow dr1 = dtProjectedBudget.NewRow();
                            prjYear = Convert.ToInt32(prjYear) + 1;
                            dr1["Year"] = prjYear + PrjMonth;
                            dr1["Budget"] = Amount;
                            dtProjectedBudget.Rows.Add(dr1);
                            a++;
                        }

                    }

                    this.grvProjectedBudget.DataSource = dtProjectedBudget;
                    this.grvProjectedBudget.DataBind();

                }
                else
                {
                    this.grvCurrentYearBudget.DataSource = DtCurrent;
                    this.grvCurrentYearBudget.DataBind();

                    this.grvProjectedBudget.DataSource = DtProjected;
                    this.grvProjectedBudget.DataBind();
                }
            }

            this.ddlBudgetPattern.SelectedValue = DtMaster.Rows[0]["budget_pattern"].ToString();

            this.txtYearBudget.Text = DtMaster.Rows[0]["year_budget"].ToString();

            //   int selectValue = Convert.ToInt32(box1.SelectedValue);


            int j = 0;
            foreach (GridViewRow row in grvCurrentYearBudget.Rows)
            {
                DropDownList YearBox = (DropDownList)grvCurrentYearBudget.Rows[j].Cells[0].FindControl("ddlCurrentBudYear");
                YearBox.SelectedValue = DtCurrent.Rows[j]["Year"].ToString();
                int selectValue = Convert.ToInt32(DtCurrent.Rows[j]["Year"].ToString());
                if (selectValue < Yearmonth)
                {
                    row.Enabled = false;
                }

                j = j + 1;
            }

            this.pnlCurrentBudget.Visible = true;
            this.pnlPrjBudget.Visible = true;

            if (DtMaster.Rows[0]["budget_pattern"].ToString() == "1")
            {
                this.grvCurrentYearBudget.Enabled = false;
                //  this.grvProjectedBudget.Enabled = false;
                grvCurrentYearBudget.Columns[2].Visible = false;

            }

        }
        catch (Exception objException)
        {
            throw objException;
        }
    }



    protected void onTxtYEarbudgetChange(object sender, EventArgs e)
    {
        try
        {
            this.grvCurrentYearBudget.ClearGrid_FA();
            this.grvProjectedBudget.ClearGrid_FA();
            this.pnlCurrentBudget.Visible = false;
            this.pnlPrjBudget.Visible = false;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void onBudgetPatternChange(object sender, EventArgs e)
    {
        try
        {
            this.grvCurrentYearBudget.ClearGrid();
            this.grvProjectedBudget.ClearGrid();
            this.pnlCurrentBudget.Visible = false;
            this.pnlPrjBudget.Visible = false;

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvLocation_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAllRole");

                CheckBox chkSelectAllLI = (CheckBox)e.Row.FindControl("chkSelectAllLI");
                chkSelectAllLI.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + this.grvLocationList.ClientID + "',this,'chkSelectLI');");
                //chkAll.Checked = true;
                if (ViewState["SelectAll"] != null)
                {
                    bool SelectAll = bool.Parse(ViewState["SelectAll"].ToString());
                    chkSelectAllLI.Checked = SelectAll;
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void onGoclick(object sender, EventArgs e)
    {
        try
        {
            DateTime.Now.ToString("yyyyMM");

            if (this.txtYearBudget.Text != "")
            {
                if (this.ddlBudgetPattern.SelectedItem.Text == "EQUATED")
                {
                    if (this.txtYearBudget.Text != "")
                    {
                        string Budget_Amount = this.txtYearBudget.Text;
                        var Amount = Convert.ToDecimal(Budget_Amount) / 12;
                        Amount = Math.Round(Amount, 2);

                        string Year = this.ddlFinancialyear.SelectedItem.Text;
                        Year = Year.Substring(5);
                        int prjYear = Convert.ToInt16(Year);

                        int i = 0;

                        DataTable DtCurrentYearBudget = new DataTable();

                        DtCurrentYearBudget.Columns.Add("Year", typeof(string));
                        DtCurrentYearBudget.Columns.Add("Budget", typeof(string));

                        DataTable dtProjectedBudget = new DataTable();
                        dtProjectedBudget.Columns.Add("year", typeof(string));
                        dtProjectedBudget.Columns.Add("budget", typeof(string));

                        int month = 0;




                        while (i < 12)
                        {
                            month = month + 1;
                            string currMonth = month.ToString();
                            currMonth = currMonth.PadLeft(2, '0');
                            string currYear = Year + currMonth;
                            string prjYearmonth = prjYear + currMonth;
                            DtCurrentYearBudget.Rows.Add(currYear, Amount);
                            //  DtProjectedBudget.Rows.Add(prjYearmonth, Amount);
                            i = i + 1;
                        }


                        ViewState["CurrentTable"] = DtCurrentYearBudget;
                        this.grvCurrentYearBudget.DataSource = DtCurrentYearBudget;
                        this.grvCurrentYearBudget.DataBind();
                        this.pnlPrjBudget.Visible = true;
                        pnlCurrentBudget.Visible = true;
                        this.grvCurrentYearBudget.Enabled = false;



                        var prjyearcount = objFASession.probudgetprojectedyear;

                        foreach (DataRow Dtrow in DtCurrentYearBudget.Rows)
                        {
                            string CurrYear = Dtrow[0].ToString();

                            prjYear = Convert.ToInt32(CurrYear.Substring(0, 4));
                            string PrjMonth = CurrYear.Substring(4);

                            int a = 0;
                            while (a < prjyearcount)
                            {
                                DataRow dr1 = dtProjectedBudget.NewRow();
                                prjYear = Convert.ToInt32(prjYear) + 1;
                                dr1["Year"] = prjYear + PrjMonth;
                                dr1["Budget"] = Amount;
                                dtProjectedBudget.Rows.Add(dr1);
                                a++;
                            }

                        }

                        DataView dv = dtProjectedBudget.DefaultView;
                        dv.Sort = "Year";

                        this.grvProjectedBudget.DataSource = dv;
                        this.grvProjectedBudget.DataBind();

                    }

                    grvCurrentYearBudget.Columns[2].Visible = false;


                }
                else if (this.ddlBudgetPattern.SelectedItem.Text == "STRUCTURED")
                {
                    DataTable DtCurrentYearBudget = new DataTable();

                    DtCurrentYearBudget.Columns.Add("Year", typeof(string));
                    DtCurrentYearBudget.Columns.Add("Budget", typeof(string));
                    DataRow drCurrentRow = null;
                    drCurrentRow = DtCurrentYearBudget.NewRow();
                    DtCurrentYearBudget.Rows.Add(drCurrentRow);
                    //  DtCurrentYearBudget.Rows.Add(1, null, null);

                    ViewState["CurrentTable"] = DtCurrentYearBudget;
                    this.grvCurrentYearBudget.DataSource = DtCurrentYearBudget;
                    this.grvCurrentYearBudget.DataBind();
                    this.pnlPrjBudget.Visible = true;
                    pnlCurrentBudget.Visible = true;
                    this.grvCurrentYearBudget.Enabled = true;
                    Button tmpbtnGo = (Button)grvCurrentYearBudget.Rows[0].Cells[0].FindControl("btnDeleteRow");
                    tmpbtnGo.Visible = false;

                    grvCurrentYearBudget.Columns[2].Visible = true;
                }

                this.txtYearBudget.Enabled = false;
            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Please enter Year Budget");
                // ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alert('warning','Alert!','Please enter Year Budget');", true);
                //  Utility.FunShowAlertMsg(this.Page, "Please enter Year Budget.");
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }

    protected void GridViewYearBudget_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string Year = this.ddlFinancialyear.SelectedItem.Text;
                Year = Year.Substring(5);
                int month = 0;
                int i = 0;
                DataTable DtCurrentYearBudget = new DataTable();
                DtCurrentYearBudget.Columns.Add("Year", typeof(string));
                DtCurrentYearBudget.Rows.Add("--Select--");
                while (i < 12)
                {
                    month = month + 1;
                    string currMonth = month.ToString();
                    currMonth = currMonth.PadLeft(2, '0');
                    string currYear = Year + currMonth;
                    DtCurrentYearBudget.Rows.Add(currYear);
                    i = i + 1;
                }

                // DropDownList ddlCurrentbudYear = (e.Row.FindControl("ddlCurrentBudYear") as DropDownList);
                DropDownList ddlCurrentbudYear = (e.Row.FindControl("ddlCurrentBudYear") as DropDownList);
                Utility.FillFinancialMonth(ddlCurrentbudYear, objFASession.ProFinYearRW, 1);
                TextBox txtBudYear = (e.Row.FindControl("txtBudgetYear") as TextBox);

                //ddlCurrentbudYear.DataSource = DtCurrentYearBudget;
                //ddlCurrentbudYear.DataTextField = "Year";
                //ddlCurrentbudYear.DataValueField = "Year";
                //ddlCurrentbudYear.DataBind();

                if (this.ddlBudgetPattern.SelectedItem.Text == "EQUATED")
                {
                    ddlCurrentbudYear.Visible = false;
                    txtBudYear.Visible = true;
                }
                else
                {
                    txtBudYear.Visible = false;
                    ddlCurrentbudYear.Visible = true;
                }
                txtBudYear.SetDecimalPrefixSuffix(objFASession.ProGpsPrefixRW, objFASession.ProGpsSuffixRW, true, "Amount");
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnExitClick(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPageView);
    }

    protected void btnClearClick(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPageAdd);
    }

    protected void onddlCurrentBudYearChange(object sender, EventArgs e)
    {
        DropDownList ddlYear = sender as DropDownList;
        string currentMonth = DateTime.Now.Month.ToString();
        string currentYear = DateTime.Now.Year.ToString();

        //int Yearmonth = Convert.ToInt32(currentYear + currentMonth);
        int Yearmonth = 201901;

        if (ddlYear.SelectedValue != "0")
        {
            if (Convert.ToInt32(ddlYear.SelectedValue) <= Yearmonth)
            {
                //  ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alert('warning','Alert!','Selected Month should be future month only');", true);
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Selected Month should be future month only.");
                ddlYear.SelectedValue = "0";
            }
        }

    }


    private void dropDownListLoad()
    {
        try
        {
            DataSet Dset = new DataSet();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Dset = Utility_FA.GetDataset("BUD_GET_BUDGETPLANNING_LOAD", Procparam);

            // Binding Financial Year
            this.ddlFinancialyear.DataSource = Dset.Tables[0];
            this.ddlFinancialyear.DataTextField = "FINANCIAL_YEAR";
            this.ddlFinancialyear.DataValueField = "FINANCIAL_YEAR";
            this.ddlFinancialyear.DataBind();

            Frommonth = Dset.Tables[0].Rows[0]["YEAR_STARTMONTH"].ToString();
            Tomonth = Dset.Tables[0].Rows[0]["YEAR_ENDMONTH"].ToString();

            // Binding Currency Year
            this.ddlCurrency.DataSource = Dset.Tables[1];
            this.ddlCurrency.DataTextField = "currency_name";
            this.ddlCurrency.DataValueField = "currency_id";
            this.ddlCurrency.DataBind();

            // Binding Activity List
            this.ddlActivity.DataSource = Dset.Tables[2];
            this.ddlActivity.DataTextField = "lob_name";
            this.ddlActivity.DataValueField = "activity_id";
            this.ddlActivity.DataBind();
            ddlActivity.Items.Insert(0, new ListItem("--Select--", "0"));

            // Binding Budget Pattern
            this.ddlBudgetPattern.DataSource = Dset.Tables[4];
            this.ddlBudgetPattern.DataTextField = "lookup_desc";
            this.ddlBudgetPattern.DataValueField = "lookup_code";
            this.ddlBudgetPattern.DataBind();

            txtYearBudget.SetDecimalPrefixSuffix(strPrefixLength, strDecMaxLength, true, "Year Budget");


            DataSet ProfileDset = new DataSet();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            ProfileDset = Utility_FA.GetDataset("BUD_GET_COPY_PROFILE_LIST", Procparam);

            this.grvCopyProfile.DataSource = ProfileDset.Tables[0];
            this.grvCopyProfile.DataBind();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    [WebMethod]
    public static string[] GetGLList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@COMPANY_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@PREFIXTEXT", prefixText);
        suggestions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("BUD_GET_GLACCOUNTS_LIST", Procparam));

        return suggestions.ToArray();
    }

    protected void onGlChange(object Sender, EventArgs e)
    {
        try
        {
            ddlActivity.SelectedValue = "0";
            grvLocationList.ClearGrid_FA();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void onGlActivityChange(object Sender, EventArgs e)
    {
        try
        {
            if (ddlGlAccounts.SelectedValue == "0")
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "Select GL Account");
                this.ddlActivity.SelectedValue = "0";
                return;
            }

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@GL_Code", Convert.ToString(ddlGlAccounts.SelectedValue));
            Procparam.Add("@Activity_Id", Convert.ToString(ddlActivity.SelectedValue));
            DataTable dtloc = Utility_FA.GetDefaultData("BUD_GET_GL_LOCATIONS", Procparam);

            this.grvLocationList.DataSource = dtloc;
            this.grvLocationList.DataBind();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void AddNewRowToGrid(object Sender, EventArgs e)
    {
        try
        {
            int rowIndex = 0;
            Boolean EmptyValidation = true;

            if (ViewState["CurrentTable"] != null)
            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];

                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {

                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        DropDownList box1 = (DropDownList)grvCurrentYearBudget.Rows[rowIndex].Cells[0].FindControl("ddlCurrentBudYear");

                        TextBox box2 = (TextBox)grvCurrentYearBudget.Rows[rowIndex].Cells[1].FindControl("txtBudget");


                        box2.SetDecimalPrefixSuffix(strPrefixLength, strDecMaxLength, true, "Year Budget");
                        if (box2.Text != "")
                        {
                            dtCurrentTable.Rows[i - 1]["Year"] = box1.SelectedValue;
                            dtCurrentTable.Rows[i - 1]["Budget"] = box2.Text;
                            drCurrentRow = dtCurrentTable.NewRow();
                        }
                        else
                        {
                            EmptyValidation = false;
                        }

                        rowIndex++;

                    }

                    if (EmptyValidation == true)
                    {
                        int Slno = dtCurrentTable.Rows.Count;
                        dtCurrentTable.Rows.Add(null, null);
                    }


                    grvCurrentYearBudget.DataSource = dtCurrentTable;

                    grvCurrentYearBudget.DataBind();

                    int j = 0;
                    foreach (GridViewRow row in grvCurrentYearBudget.Rows)
                    {
                        DropDownList YearBox = (DropDownList)grvCurrentYearBudget.Rows[j].Cells[0].FindControl("ddlCurrentBudYear");
                        YearBox.SelectedValue = dtCurrentTable.Rows[j]["Year"].ToString();

                        Button btn = (Button)grvCurrentYearBudget.Rows[j].Cells[2].FindControl("btnDeleteRow");
                        if (YearBox.SelectedValue != "0")
                            btn.Visible = true;
                        else
                            btn.Visible = false;
                        j = j + 1;
                    }

                }

            }

            else
            {

                Response.Write("ViewState is null");

            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void onProjectedBudgetChange(object sender, EventArgs e)
    {
        TextBox txtinBudget = sender as TextBox;
        txtinBudget.SetDecimalPrefixSuffix(strPrefixLength, strDecMaxLength, true, "Projected Year Amount");
        // txtinBudget.Text = Convert.ToDecimal(Convert.ToString(txtinBudget.Text)).ToString(Funsetsuffix());
    }


    protected void onCurrentBudgetChange(object sender, EventArgs e)
    {

        try
        {
            //Reference the TextBox.
            TextBox txtinBudget = sender as TextBox;

            dtProjectedBudget = new DataTable();
            dtProjectedBudget.Columns.Add("Year");
            dtProjectedBudget.Columns.Add("Budget");

            string month = "";
            Decimal BudgetAmount = 0;
            Decimal YearBudAmount = Convert.ToDecimal(this.txtYearBudget.Text);
            Boolean AmountValidation = true;


            foreach (GridViewRow row in grvCurrentYearBudget.Rows)
            {
                DropDownList ddlyear = (DropDownList)row.Cells[0].FindControl("ddlCurrentBudYear");
                string Year = ddlyear.SelectedItem.Text;
                TextBox textBudget = (TextBox)row.Cells[1].FindControl("txtBudget");
                textBudget.Text = Convert.ToDecimal(Convert.ToString(textBudget.Text)).ToString(Funsetsuffix());
                if (Year == "--Select--")
                {
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Select Yearmonth");
                    textBudget.Text = "";
                    return;
                }

                Button Btdelete = (Button)row.Cells[2].FindControl("btnDeleteRow");
                Btdelete.Visible = true;

                month = Year.Substring(4);
                Year = Year.Substring(0, 4);

                int prjYear = Convert.ToInt16(Year);

                var prjyearcount = objFASession.probudgetprojectedyear;

                BudgetAmount = BudgetAmount + Convert.ToDecimal(textBudget.Text);
                Button btnAdd = (Button)row.Cells[2].FindControl("btnAddNew");

                if (BudgetAmount <= YearBudAmount)
                {
                    int a = 0;
                    while (a < prjyearcount)
                    {
                        DataRow dr1 = dtProjectedBudget.NewRow();
                        prjYear = Convert.ToInt32(prjYear) + 1;
                        dr1["Year"] = prjYear + month;
                        dr1["Budget"] = textBudget.Text;
                        dtProjectedBudget.Rows.Add(dr1);
                        a++;
                    }


                }
                else
                {
                    AmountValidation = false;
                    txtinBudget.Text = "0";
                }

            }
            if (AmountValidation == false)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Enter value is greater then year budget amount");

            }

            DataView dv = dtProjectedBudget.DefaultView;
            dv.Sort = "Year";

            this.grvProjectedBudget.DataSource = dv;
            this.grvProjectedBudget.DataBind();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }

    protected void GRDealerCommisionRate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            if (grvCurrentYearBudget.Rows.Count > 1)
            {
                DataTable dtBudgetCurrent = new DataTable();
                dtBudgetCurrent.Columns.Add("Sno");
                dtBudgetCurrent.Columns.Add("Year");
                dtBudgetCurrent.Columns.Add("Budget");

                TextBox lblCtrlRatingDetailsRowID = (TextBox)grvCurrentYearBudget.Rows[e.RowIndex].FindControl("txtSlno");

                int i = 0;
                foreach (GridViewRow row in grvCurrentYearBudget.Rows)
                {
                    DataRow dr1 = dtBudgetCurrent.NewRow();

                    DropDownList ddlYear = (DropDownList)row.Cells[0].FindControl("ddlCurrentBudYear");
                    dr1["Year"] = ddlYear.SelectedItem.Text;

                    TextBox txtSlno = (TextBox)row.Cells[1].FindControl("txtBudget");
                    dr1["Sno"] = i;

                    TextBox textBudget = (TextBox)row.Cells[1].FindControl("txtBudget");
                    dr1["Budget"] = textBudget.Text;

                    dtBudgetCurrent.Rows.Add(dr1);
                    i = i + 1;
                }



                int rowID = e.RowIndex;

                var checkIsAdded = dtBudgetCurrent.AsEnumerable().Where(row => Convert.ToInt32(row["Sno"]) == rowID).FirstOrDefault();
                if (checkIsAdded != null)
                {
                    dtBudgetCurrent.Rows.Remove(checkIsAdded);
                    this.grvCurrentYearBudget.DataSource = dtBudgetCurrent;
                    this.grvCurrentYearBudget.DataBind();
                    ViewState["CurrentTable"] = dtBudgetCurrent;

                }

                int j = 0;
                foreach (GridViewRow row in grvCurrentYearBudget.Rows)
                {
                    DropDownList YearBox = (DropDownList)grvCurrentYearBudget.Rows[j].Cells[0].FindControl("ddlCurrentBudYear");
                    YearBox.SelectedValue = dtBudgetCurrent.Rows[j]["Year"].ToString();

                    Button btn = (Button)grvCurrentYearBudget.Rows[j].Cells[2].FindControl("btnDeleteRow");
                    if (YearBox.SelectedValue != "0")
                        btn.Visible = true;
                    else
                        btn.Visible = false;

                    j = j + 1;
                }

                DataTable dtProjBudget = new DataTable();
                dtProjBudget.Columns.Add("Year");
                dtProjBudget.Columns.Add("Budget");

                //int month = 0;
                //foreach (GridViewRow row in grvCurrentYearBudget.Rows)
                //{
                //    DataRow drprj = dtProjBudget.NewRow();

                //    string Year = this.ddlFinancialyear.SelectedItem.Text;
                //    Year = Year.Substring(5);
                //    int prjYear = Convert.ToInt16(Year) + 1;

                //    month = month + 1;
                //    string currMonth = month.ToString();
                //    currMonth = currMonth.PadLeft(2, '0');

                //    drprj["Year"] = prjYear + currMonth;

                //    TextBox textBudget = (TextBox)row.Cells[1].FindControl("txtBudget");
                //    drprj["Budget"] = textBudget.Text;
                //    dtProjBudget.Rows.Add(drprj);

                //}


                var prjyearcount = objFASession.probudgetprojectedyear;

                foreach (DataRow Dtrow in dtBudgetCurrent.Rows)
                {

                    string CurrYear = Dtrow[1].ToString();
                    string Amount = Dtrow[2].ToString();

                    if(CurrYear != "--Select--")
                    { 

                    int prjYear = Convert.ToInt32(CurrYear.Substring(0, 4));
                    string PrjMonth = CurrYear.Substring(4);

                    int a = 0;
                    while (a < prjyearcount)
                    {
                        DataRow dr1 = dtProjBudget.NewRow();
                        prjYear = Convert.ToInt32(prjYear) + 1;
                        dr1["Year"] = prjYear + PrjMonth;
                        dr1["Budget"] = Amount;
                        dtProjBudget.Rows.Add(dr1);
                        a++;
                    }

                    }

                }

                this.grvProjectedBudget.DataSource = dtProjBudget;
                this.grvProjectedBudget.DataBind();

            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Minimum one Record required");
            }


        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnSaveClick(object sender, EventArgs e)
    {
        try
        {
            dtLocations = new DataTable();
            dtLocations.Columns.Add("Location_Id");

            foreach (GridViewRow row in grvLocationList.Rows)
            {
                DataRow dr = dtLocations.NewRow();

                CheckBox CheckStatus = (CheckBox)row.Cells[1].FindControl("chkSelectLI");

                if (CheckStatus.Checked == true)
                {

                    TextBox txtLocId = (TextBox)row.Cells[1].FindControl("txtLocId");
                    dr["Location_Id"] = txtLocId.Text;
                    dtLocations.Rows.Add(dr);
                }

            }


            if (strMode == "C" || strMode == "CP")
            {
                if (dtLocations.Rows.Count == 0)
                {
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Select atleast one Branch");
                    return;
                }
            }

            dtCurrentBudget = new DataTable();
            dtCurrentBudget.Columns.Add("Year");
            dtCurrentBudget.Columns.Add("Amount");

            foreach (GridViewRow row in grvCurrentYearBudget.Rows)
            {
                DataRow dr1 = dtCurrentBudget.NewRow();

                string year = "0";

                if (this.ddlBudgetPattern.SelectedItem.Text == "EQUATED")
                {
                    TextBox textYear = (TextBox)row.Cells[0].FindControl("txtBudgetYear");
                    dr1["Year"] = textYear.Text;
                    year = textYear.Text;
                }
                else
                {
                    DropDownList ddlYear = (DropDownList)row.Cells[0].FindControl("ddlCurrentBudYear");
                    dr1["Year"] = ddlYear.SelectedValue;
                    year = ddlYear.SelectedValue;
                }

                TextBox textBudget = (TextBox)row.Cells[1].FindControl("txtBudget");
                dr1["Amount"] = textBudget.Text;

                if (year != "0")
                {
                    dtCurrentBudget.Rows.Add(dr1);
                }




            }
            if (dtCurrentBudget.Rows.Count == 0)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Enter one row in current budget");
                return;

            }
            if (dtCurrentBudget.Rows.Count == 1 && (dtCurrentBudget.Rows[0]["Amount"].ToString() == "" || dtCurrentBudget.Rows[0]["Year"].ToString() == "--Select--"))
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Enter one row in current budget");
                return;
            }
            var duplicates = dtCurrentBudget.AsEnumerable()
                    .Select(dr => dr.Field<string>("Year"))
                    .GroupBy(x => x)
                    .Where(g => g.Count() > 1)
                    .Select(g => g.Key)
                    .ToList();
            if (duplicates.Count > 0)
            {

                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Duplicate in Current Budget year");

                //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alert('warning','Alert!','Duplicate in Current Budget year');", true);
                // Utility.FunShowAlertMsg(this.Page, "Duplicate in Current Budget year");
                return;
            }
            // Declare an object variable.
            //object sumAmount;
            //sumAmount = dtCurrentBudget.Compute("Sum(Amount)", string.Empty);
            if (ddlBudgetPattern.SelectedValue == "2")
            {
                var sumAmount = dtCurrentBudget.AsEnumerable()
                       .Sum(x => Convert.ToDecimal(x["Amount"]));

                Decimal Yearamt = Convert.ToDecimal(this.txtYearBudget.Text);

                if (Convert.ToDecimal(sumAmount) > Yearamt)
                {
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Duplicate in Current Budget year");
                    //   ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alert('warning','Alert!','Duplicate in Current Budget year');", true);
                    //   Utility.FunShowAlertMsg(this.Page, "Total Year Budget Amount less than sum of current year Budget amount ");
                    return;
                }
            }

            // Binding Projected Budget Grid Value to Datatable
            dtProjectedBudget = new DataTable();
            dtProjectedBudget.Columns.Add("Year");
            dtProjectedBudget.Columns.Add("Amount");

            foreach (GridViewRow row in grvProjectedBudget.Rows)
            {
                DataRow dr2 = dtProjectedBudget.NewRow();

                dr2["Year"] = row.Cells[0].Text;
                TextBox textBudget = (TextBox)row.Cells[1].FindControl("txtPrjbudget");
                dr2["Amount"] = textBudget.Text;

                dtProjectedBudget.Rows.Add(dr2);
            }


            int ErrorCode = FunPubSaveDetails();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    private int FunPubSaveDetails()
    {

        try
        {

            objBudget_MasterClient = new BudgetServiceReference.BudgetMasterClient();
            string strBudget_No = string.Empty;
            string strAlert = "alert('__ALERT__');";

            objbudmasterrow = objbudmaster_DTB.NewFA_BUDGET_MSTRow();

            string RequestMode = "";
            if (Request.QueryString.Get("qsMode") != null)
            {
                RequestMode = Request.QueryString.Get("qsMode");
            }

            if (Request.QueryString.Get("qsmasterId") != null && RequestMode != "CP")
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                strBudget_Master_Id = fromTicket.Name;
            }

            if (!string.IsNullOrEmpty(strBudget_Master_Id))
            {
                objbudmasterrow.BUDGET_MST_ID = Convert.ToInt32(strBudget_Master_Id);

            }
            else
                objbudmasterrow.BUDGET_MST_ID = 0;
            objbudmasterrow.COMPANY_ID = Convert.ToInt32(ObjUserInfo_FA.ProCompanyIdRW);
            objbudmasterrow.USER_ID = Convert.ToInt32(ObjUserInfo_FA.ProUserIdRW);
            objbudmasterrow.GL_CODE = ddlGlAccounts.SelectedValue;
            objbudmasterrow.BUDGET_PATTERN = ddlBudgetPattern.SelectedValue;
            objbudmasterrow.FIN_YEAR = ddlFinancialyear.SelectedValue;
            objbudmasterrow.YEAR_BUDGET = txtYearBudget.Text;
            objbudmasterrow.ACTIVITY_ID = ddlActivity.SelectedValue;
            objbudmasterrow.CURRENCY_ID = Convert.ToInt32(ddlCurrency.SelectedValue);

            objbudmasterrow.XML_Location_DTL = dtLocations.FunPubFormXml_FA(true);
            objbudmasterrow.XML_Current_Budget_DTL = dtCurrentBudget.FunPubFormXml_FA(true);
            objbudmasterrow.XML_Projected_Butget_DTL = dtProjectedBudget.FunPubFormXml_FA(true);

            int ChkActive = 0;
            if (this.CbxActive.Checked == true)
            {
                ChkActive = 1;
            }
            else
            {
                ChkActive = 0;
            }
            objbudmasterrow.IS_ACTIVE = ChkActive;

            objbudmaster_DTB.AddFA_BUDGET_MSTRow(objbudmasterrow);
            objFASession = new FASession();
            StrConnectionName = objFASession.ProConnectionName;
            FASerializationMode SerMode = FASerializationMode.Binary;
            byte[] ObjBudgetDataTable = FAClsPubSerialize.Serialize(objbudmaster_DTB, SerMode);
            intErrCode = objBudget_MasterClient.FunPubCreateBudget(SerMode, ObjBudgetDataTable, StrConnectionName);

            //if (intErrCode == 10000)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10000, "FA_BudgetPlanning_Master_View.aspx");
            //}

            switch (intErrCode)
            {
                case 10000:


                    Utility_FA.FunSaveConfirmAlertMsg(this.Page, "Success!", "Budget Palnning Master Saved Successfully.", "Would You Like to Add One More Budget Master?", "FA_BudgetPlanning_Master_Add.aspx", "FA_BudgetPlanning_Master_View.aspx");
                    // ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successConfirm('Success!','Budget Palnning Master Saved Successfully','Would You Like to Add One More Budget Master?','FA_BudgetPlanning_Master_Add.aspx','FA_BudgetPlanning_Master_View.aspx');", true);
                    break;

                case 10001:
                    Utility_FA.FunUpdateAlertMsg(this.Page, "Success!", "Budget Planning Master Updated Successfully.", "FA_BudgetPlanning_Master_View.aspx");
                    //     ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successRedir('Success!','Budget Planning Master Updated Successfully.','FA_BudgetPlanning_Master_View.aspx');", true);

                    break;
                case 10005:
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Duplicate Activity");
                    btnSave.Enabled_True_FA();
                    break;
                case 10006:
                    string strAlertMsg = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode));
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", strAlertMsg);
                    btnSave.Enabled_True_FA();
                    break;
                default:
                    btnSave.Enabled_True_FA();
                    Utility_FA.FunShowValidationMsg_FA(this, intErrCode);
                    break;

            }


            //   Response.Redirect(strRedirectPageView);

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);

        }
        finally
        {
            if (objBudget_MasterClient != null)
                objBudget_MasterClient.Close();

        }
        return intErrCode;
    }

    protected void ModifyEnabledisable()
    {
        this.ddlFinancialyear.Enabled = false;
        this.ddlCurrency.Enabled = false;
        this.txtYearBudget.Enabled = false;
        this.ddlGlAccounts.Enabled = false;
        this.grvLocationList.Enabled = false;
        this.ddlBudgetPattern.Enabled = false;
        this.ddlActivity.Enabled = false;
        this.btnGo.Enabled_False();
        this.btnCopyProfile.Enabled_False();
        // CbxActive.Disabled = false;
        btnClear.Enabled_False();

    }

    protected void QueryEnabledisable()
    {
        this.CbxActive.Disabled = true;
        this.btnCopyProfile.Disabled = true;
        this.grvCurrentYearBudget.Enabled = false;
        this.grvProjectedBudget.Enabled = false;
        this.btnSave.Enabled_False();
        this.btnClear.Enabled_False();
        this.btnGo.Enabled_False();
        this.btnCopyProfile.Enabled_False();
        grvCurrentYearBudget.Columns[2].Visible = false;
        grvLocationList.Columns[1].Visible = false;
        lnkBudgetLock.Visible = false;
        // lnkBudgetLock.EnableViewState = false;

    }

    protected void onCopyProfileClick(object sender, EventArgs e)
    {
        try
        {


        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void grvCopyProfile_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "")
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);

            Response.Redirect(strRedirectPageAdd + "?qsmasterId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=CP");
        }
    }

    private string Funsetsuffix()
    {
        int suffix = 1;
        suffix = objFASession.ProGpsSuffixRW;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }

    protected void GET_USER_FUN_ACCESS()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@User_ID", Convert.ToString(intUserId));
            Procparam.Add("@PGM_CODE", "BUD_PM");
            DataTable dt = Utility_FA.GetDefaultData("FA_GET_USER_FUN_ACCESS", Procparam);
            ViewState["Access_User"] = "0";
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["USER_FUNCTION"].ToString() == "BUD_PM")
                    {
                        this.lnkBudgetLock.Visible = true;

                    }

                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void onLockbudgetClick(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString.Get("qsmasterId") != null && RequestMode != "CP")
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                strBudget_Master_Id = fromTicket.Name;
            }

            Dictionary<string, string> Procparam = new Dictionary<string, string>();

            Procparam.Add("@Budget_Mst_ID", Convert.ToString(strBudget_Master_Id));
            Procparam.Add("@User_ID", Convert.ToString(intUserId));
            DataTable dt = Utility_FA.GetDefaultData("FA_UPD_BUDGET_LOCK", Procparam);

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["is_lock"].ToString() == "1")
                {
                    Utility_FA.FunUpdateAlertMsg(this.Page, "Success!", "Budget Locked successfully", "FA_BudgetPlanning_Master_View.aspx");
                    //   ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "confirmalert('Success!','Budget Locked Successfully.','FA_BudgetPlanning_Master_View.aspx');", true);
                }

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}


