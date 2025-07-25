using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Globalization;
using AjaxControlToolkit;
using System.Data;
using System.Web.Security;
using System.Text;
using FA_BusEntity;
using System.Xml;
using System.IO;

//namespace SIS_FA_PLayer.App_Code
//{
public class ApplyThemeForProject_FA : System.Web.UI.Page
{
    public ApplyThemeForProject_FA()
    {
        if (ObjUserInfo_FA == null)
        {
            ObjUserInfo_FA = new UserInfo_FA();

        }
        if (ObjFASession == null)
        {
            ObjFASession = new FASession();
        }

    }

    #region " Properties"

    // Common Properties Used Across the application
    public PageModes PageMode { get; set; }
    public string PageIdValue { get; set; }
    public String UserId { get; set; }
    public string CompanyId { get; set; }
    public string FinancialYear { get; set; }
    public string FinancialMonth { get; set; }
    public string PostBackControlId { get; set; }
    public string DateFormate { get; set; }
    public string RedirectOnCancel { get; set; }

    // Work Flow Properties
    public string ProgramCode { get; set; }
    public string WorkFlowId { get; set; }
    public string WorkFlowSequence { get; set; }
    public int WFProgramCode { get; set; }
    public int CurrentProgramFlowNumber { get; set; }
    public int NextProgramFlowNumber { get; set; }
    public string DocumentControlNo { get; set; }

    public bool isWorkFlowTraveler { get; set; }


    #endregion

    UserInfo_FA ObjUserInfo_FA;
    FASession ObjFASession;

    public enum PageModes
    {
        Create,
        Modify,
        Query,
        Delete,
        WorkFlow
    }

    #region "Page Values Initialization "
    private void SetPageMode(string queryMode)
    {
        switch (queryMode.ToLower())
        {
            case "c":
                PageMode = PageModes.Create;
                break;
            case "q":
                PageMode = PageModes.Query;
                break;
            case "m":
                PageMode = PageModes.Modify;
                break;
            case "d":
                PageMode = PageModes.Delete;
                break;
            case "w":
                PageMode = PageModes.WorkFlow;
                break;
            default:
                break;
        }
    }
    #endregion

    #region " Page Level Events"

    /// <summary>
    /// Page Pre Init Event to Initialize the Page Level Values
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>    

    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (ObjUserInfo_FA.ProCompanyIdRW == 0 && ObjUserInfo_FA.ProUserNameRW != "S3GUSER")
            HttpContext.Current.Response.Redirect("../SessionExpired.aspx");

        if (Request.QueryString["qsMode"] != null)
        {
            //_pageMode = Request.QueryString["qsMode"];             
            SetPageMode(Request.QueryString["qsMode"].ToString());
        }

        if (Request.QueryString["qsViewId"] != null)
        {
            FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
            if (fromTicket.Name != null)
                PageIdValue = fromTicket.Name;
        }
        if (Request.QueryString["qsWorkFlow"] != null)
        {
            FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsWorkFlow"));
            if (fromTicket.Name != null)
                isWorkFlowTraveler = true;
            WorkFlowId = fromTicket.Name;

            SetPageMode("w");
        }

        // CPT Setup Master Page 
        if (Request.QueryString["Popup"] != null)
            Page.MasterPageFile = "~/Common/MasterPage.master";
        else if (Request.QueryString["IsFromAccount"] != null)
            Page.MasterPageFile = "~/Common/MasterPage.master";
        else
            Page.MasterPageFile = "~/Common/FAMasterPageCollapse.master";


        // Setup Page Theme
        Page.Theme = ObjUserInfo_FA.ProUserThemeRW;

        // Initialize from User Information
        CompanyId = ObjUserInfo_FA.ProCompanyIdRW.ToString();
        UserId = ObjUserInfo_FA.ProUserIdRW.ToString();
        // Initialize Date Formate
        DateFormate = ObjFASession.ProDateFormatRW; //"dd/MM/yyyy";

        DropDownList d = (DropDownList)Page.Master.FindControl("ddlTheme");
        if (d != null)
            d.SelectedValue = ObjUserInfo_FA.ProUserThemeRW;

        if (!String.IsNullOrEmpty(Request.Form["__EVENTTARGET"]))
        {
            PostBackControlId = Request.Form["__EVENTTARGET"];
        }

        #region To Set FinanicalYear & Month as Property
        int intCurrentYear = DateTime.Now.Year;
        int intCurrentMonth = DateTime.Now.Month;
        int intActualMonth = Convert.ToInt32(FAClsPubConfigReader.FunPubReadConfig("StartMonth"));
        if (intCurrentMonth > (intActualMonth - 1))
        {
            FinancialYear = (intCurrentYear).ToString() + "-" + (intCurrentYear + 1).ToString();

        }
        else
        {
            FinancialYear = (intCurrentYear - 1).ToString() + "-" + (intCurrentYear).ToString();

        }
        FinancialMonth = intCurrentYear.ToString() + intCurrentMonth.ToString("00");
        #endregion

        //KeepSessionAlive();
    }
    #endregion

    #region "Clear_FA Page"
    // to enable\disable the control & its child controls        
    public void DisableControl(Control control, bool isDisable)
    {
        foreach (Control c in control.Controls) try
            {
                if (c is WebControl)
                    ((WebControl)c).Enabled = !isDisable;
                if (c.HasControls())
                    DisableControl(c, isDisable);
            }
            catch (Exception) { }
    }
    public virtual void ClearControlValues(Control control)
    {
        foreach (Control formControl in control.Controls) try
            {
                if (formControl is WebControl)
                {

                    switch (((System.Reflection.MemberInfo)(formControl.GetType())).Name.ToLower())
                    {
                        case "textbox":
                            ((TextBox)formControl).Text = "";
                            break;
                        case "dropdownlist":
                            if (((DropDownList)formControl).Enabled)
                                ((DropDownList)formControl).SelectedIndex = -1;
                            break;
                        case "checkbox":
                            if (((CheckBox)formControl).Checked)
                                ((CheckBox)formControl).Checked = false;
                            break;
                        default:
                            break;
                    }
                }
                if (formControl.HasControls())
                    ClearControlValues(formControl);

            }
            catch (Exception) { }
    }
    public virtual void ClearControlValues(Control control, bool isClearDropDownRequired)
    {
        foreach (Control formControl in control.Controls) try
            {
                if (formControl is WebControl)
                {

                    switch (((System.Reflection.MemberInfo)(formControl.GetType())).Name.ToLower())
                    {
                        case "textbox":
                            ((TextBox)formControl).Text = "";
                            break;
                        case "dropdownlist":
                            if (((DropDownList)formControl).Enabled)
                                if (isClearDropDownRequired && ((DropDownList)formControl).AccessKey != "N") ((DropDownList)formControl).Items.Clear();
                            break;
                        case "checkbox":
                            if (((CheckBox)formControl).Checked)
                                ((CheckBox)formControl).Checked = false;
                            break;
                        default:
                            break;
                    }
                }
                if (formControl.HasControls())
                    ClearControlValues(formControl);

            }
            catch (Exception) { }
    }
    public virtual void SetControlValuesReadOnly(Control control)
    {
        foreach (Control formControl in control.Controls) try
            {
                if (formControl is WebControl)
                {

                    switch (((System.Reflection.MemberInfo)(formControl.GetType())).Name.ToLower())
                    {
                        case "textbox":
                            ((TextBox)formControl).Attributes.Add("ContentEditable", "False");
                            break;
                        case "dropdownlist":
                            if (((DropDownList)formControl).Enabled)
                                ((DropDownList)formControl).Enabled = false;
                            break;
                        default:
                            break;
                    }
                }
                //if (formControl.HasControls())
                //    ClearControlValues(formControl);

            }
            catch (Exception) { }
    }
    public virtual void ClearGridValues(Control control)
    {
        foreach (Control formControl in control.Controls) try
            {
                if (formControl is WebControl)
                {

                    switch (((System.Reflection.MemberInfo)(formControl.GetType())).Name)
                    {
                        case "GridView":
                            if (((GridView)formControl).Enabled)
                            {
                                ((GridView)formControl).DataSource = null;
                                ((GridView)formControl).DataBind();
                            }
                            break;
                        default:
                            break;
                    }
                }
                if (formControl.HasControls())
                    ClearGridValues(formControl);

            }
            catch (Exception) { }
    }
    #endregion


    //string _pageMode=string.Empty;
    int _idValue = 0;
    //public string PageMode { 
    //    get {return _pageMode;} set{_pageMode=value;} }
    public int IdValue { get { return _idValue; } set { _idValue = value; } }

    public enum enumPageTitle
    {
        PageTitle,
        Create,
        Modify,
        View,
        Details,
        Schedule
    }

    /// <summary>
    /// Get the Title of the module
    /// </summary>
    /// <param name="ePageTitle"></param>
    /// <returns></returns>
    public string FunPubGetPageTitles(enumPageTitle ePageTitle)
    {
        SiteMapPath s1 = (SiteMapPath)this.Master.FindControl("SiteMapPath1");
        string strValue = s1.Provider.CurrentNode.Description;

        if (ePageTitle == enumPageTitle.PageTitle)
        {
            strValue = "FA - " + strValue;
        }
        else if (ePageTitle == enumPageTitle.Create)
        {
            strValue = strValue + " - Create";
        }
        else if (ePageTitle == enumPageTitle.Modify)
        {
            strValue = strValue + " - Modify";
        }
        else if (ePageTitle == enumPageTitle.View)
        {
            strValue = strValue + " - View";
        }
        else if (ePageTitle == enumPageTitle.Details)
        {
            strValue = strValue + " - Details";
        }

        return strValue;
    }

    public void FunPubGetPageUrl(string strPageUrl, out int intModuleID, out int intProgramID)
    {
        string strPageName;
        string strModuleName;

        UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();

        DataSet ds_Menu = new DataSet();
        DataTable dtMenu;
        DataView dvSearch;

        ds_Menu.ReadXml(Server.MapPath(@"~\Data\UserManagement\" + ObjUserInfo_FA.ProUserIdRW.ToString() + ".xml"));

        //  Get PageName
        strPageName = strPageUrl.Substring(strPageUrl.LastIndexOf("/") + 1);

        //  Get the Remaining Page URL Except PageName
        strPageUrl = strPageUrl.Replace(strPageName, "");
        strPageUrl = strPageUrl.TrimEnd('/');

        //  Get ModuleName
        strModuleName = strPageUrl.Substring(strPageUrl.LastIndexOf("/") + 1);


        dtMenu = ds_Menu.Tables["Module_Header"];
        dvSearch = new DataView(dtMenu);
        dvSearch.RowFilter = "Module_Name LIKE '" + strModuleName + "'";
        intModuleID = Convert.ToInt32(dvSearch[0]["Module_ID"].ToString());

        strPageName = strPageName.Replace("_Add", "_View");
        dtMenu = ds_Menu.Tables[strModuleName];
        dvSearch = new System.Data.DataView(dtMenu);
        dvSearch.RowFilter = "PAGE_URL LIKE '" + strPageName + "'";
        //intProgramID = Convert.ToInt32(dvSearch[0]["Program_ID"].ToString());
        intProgramID = 34;
    }





    private void KeepSessionAlive()
    {
        //        int int_MilliSecondsTimeOut = (this.Session.Timeout * 60000) - 30000;
        //        string str_Script = @" <script type='text/javascript'>
        //        //Number of Reconnects
        //        var count=0;
        //        //Maximum reconnects setting
        //        var max = 5;
        //        function Reconnect(){
        //
        //        count++;
        //        if (count < max)
        //        {
        //        window.status = 'Link to Server Refreshed ' + count.toString()+' time(s)' ;
        //        var img = new Image(1,1);
        //        img.src = 'Reconnect.aspx';
        //        }
        //        }
        //        window.setInterval('Reconnect()'," + int_MilliSecondsTimeOut.ToString() + @"); //Set to length required
        //        </script>
        //        ";
        //        this.Page.RegisterClientScriptBlock("Reconnect", str_Script);


        // METHOD to WARN THE USER
        StringBuilder ScriptToWarn = new StringBuilder();
        ScriptToWarn.Append("<script type='text/javascript' language='javascript'>");
        ScriptToWarn.Append("Timeout = 30000;"); // Milli-Seconds ( warning in 50th second for 1 minute timeout session)
        ScriptToWarn.Append(@"setTimeout(""AlertUser();"", Timeout);");
        ScriptToWarn.Append("function AlertUser()");
        ScriptToWarn.Append("{");
        ScriptToWarn.Append(@"var ans = confirm(""Timeout in 10 Seconds. Reset?"");");
        ScriptToWarn.Append("if (ans)");
        ScriptToWarn.Append("{");
        ScriptToWarn.Append("window.location.reload();");
        ScriptToWarn.Append(@"setTimeout(""AlertUser();"", Timeout);");
        ScriptToWarn.Append("}");

        //ScriptToWarn.Append(" openph('../SessionReconnect.aspx');");
        //ScriptToWarn.Append("}");
        //ScriptToWarn.Append("function openph(url)");
        //    ScriptToWarn.Append("{");
        //    ScriptToWarn.Append("var url1 = url;");
        //    ScriptToWarn.Append(@"window.open(url1, """",""top=0,left=0,menubar=no,toolbar=no,location=no,resizable=no,height=200,width=450,status=no,scrollbars=no,maximize=null,resizable=0,titlebar=no;"");");
        //ScriptToWarn.Append("}");

        ScriptToWarn.Append("</script>");
        this.Page.RegisterClientScriptBlock("Reconnect", ScriptToWarn.ToString());
    }

    public void FunPubSetIndex(int intAccordIndex)
    {
        AjaxControlToolkit.Accordion ajxacc = new AjaxControlToolkit.Accordion();
        ajxacc = (AjaxControlToolkit.Accordion)Master.FindControl("Accordion1");
        ajxacc.SelectedIndex = intAccordIndex;
    }
    private static XmlDocument _xmlDoc;
    public static XmlDocument xmlDoc
    {
        get
        {
            FunPubGetConnectionString();
            return _xmlDoc;
        }
    }

    public static void FunPubGetConnectionString()
    {
        System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();

        string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));

        if (File.Exists(strFileName))
        {
            _xmlDoc = new XmlDocument();
            _xmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
        }
        else
        {
            throw new FileNotFoundException("Configuration file not found");
        }
    }

    public static FADALDBType FunPubGetDatabaseType()
    {
        try
        {
            FADALDBType FA_DBType;
            FA_DBType = FADALDBType.SQL;
            XmlDocument conxmlDoc = xmlDoc;
            string strConType = conxmlDoc.ChildNodes[0].SelectSingleNode("FAMasterConnection").ChildNodes[0].Attributes["connnectionType"].Value;
            if (strConType.Trim().ToUpper() == "ORACLE")
            {
                FA_DBType = FADALDBType.ORACLE;
            }
            return FA_DBType;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
        }
    }

    public enum FADALDBType
    {
        ORACLE = 0,
        SQL = 1,
    }
}
//}
