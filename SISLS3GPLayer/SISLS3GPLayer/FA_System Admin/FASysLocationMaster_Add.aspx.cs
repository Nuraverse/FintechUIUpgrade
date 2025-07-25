#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin  
/// Screen Name			: Location Master add
/// Created By			: Muni Kavitha
/// Created Date		: 17-Jan-2012
/// Purpose	            : 
#endregion

#region [Namespace]

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
using System.Text;

#endregion [Namespace]

public partial class Sysadm_FASysLocationMaster_Add : ApplyThemeForProject_FA
{
    #region Initialization

    static string[] strarrControlsID = new string[0];
    int intCompanyId = 0;
    int intUserId = 0;
    static string strPageName = "Location Master";
    int intErrorCode = 0;
    int intLocationCat_ID = 0;
    int intLocationMap_ID = 0;
    FASerializationMode SerMode = FASerializationMode.Binary;

    ApplyThemeForProject_FA ATFP = new ApplyThemeForProject_FA();
    UserInfo_FA usrInfo = new UserInfo_FA();
    //User Authorization
    string strType = "Cate";
    string strMode = string.Empty;
    int intTc = 0;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    bool bClearList = false;
    static DataTable dtHierarchyWidth = new DataTable();
    //Code end

    FASession ObjFASession = new FASession();
    string strConnectionName = "";
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objLocationMasterClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable objLocationCategory_DataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryRow objLocationCategory_DataRow;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable objLocationMaster_DataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterRow objLocationMaster_DataRow;

    string strRedirectPageView = "window.location.href='../System Admin/FASysLocationMaster_View.aspx';";
    string strRedirectPageAdd = "window.location.href='../System Admin/FASysLocationMaster_Add.aspx';";
    string strRedirectPage = "../System Admin/FASysLocationMaster_View.aspx";
    string strErrorMessage = @"Correct the following validation(s):<ul><li> ";
    string strErrorMsgLast = @"</ul></li>";

    #endregion Initialization

    #region [Page Event's]

    protected void Page_PreInit(object sender, EventArgs e)
    {

        if (usrInfo.ProCompanyIdRW == 0)
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
        //if (Request.QueryString["Popup"] != null)
        //    Page.MasterPageFile = "~/Common/MasterPage.master";
        //else if (Request.QueryString["IsFromAccount"] != null)
        //    Page.MasterPageFile = "~/Common/MasterPage.master";
        //else
        //    Page.MasterPageFile = "~/Common/S3GMasterPageCollapse.master";


        // Setup Page Theme
        Page.Theme = usrInfo.ProUserThemeRW;

        // Initialize from User Information
        CompanyId = usrInfo.ProCompanyIdRW.ToString();
        UserId = usrInfo.ProUserIdRW.ToString();
        // Initialize Date Formate
        DateFormate = ObjFASession.ProDateFormatRW; //"dd/MM/yyyy";
        strConnectionName = ObjFASession.ProConnectionName;

        DropDownList d = (DropDownList)Page.Master.FindControl("ddlTheme");
        if (d != null)
            d.SelectedValue = usrInfo.ProUserThemeRW;

        if (!String.IsNullOrEmpty(Request.Form["__EVENTTARGET"]))
        {
            PostBackControlId = Request.Form["__EVENTTARGET"];
        }
        //KeepSessionAlive();


        FunPubLoadActiveHierarchy();
        FunPubLoadHierarchyForMapping();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            usrInfo = new UserInfo_FA();
            intCompanyId = usrInfo.ProCompanyIdRW;
            intUserId = usrInfo.ProUserIdRW;
            //User Authorization
            bCreate = usrInfo.ProCreateRW;
            bModify = usrInfo.ProModifyRW;
            bQuery = usrInfo.ProViewRW;
            bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
            //Code end

            if (Request.QueryString["qsMode"] != null)
                strMode = Request.QueryString["qsMode"];
            if (Request.QueryString["Type"] != null)
                strType = Request.QueryString["Type"];
            if (Request.QueryString["qsT"] != null)
               intTc =  Convert .ToInt32 (Request.QueryString["qsT"]);

            if (Request.QueryString["qsLocCatId"] != null && strType == "Cate")
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsLocCatId"));
                intLocationCat_ID = Convert.ToInt32(fromTicket.Name.ToString());
            }
            else if (Request.QueryString["qsLocMapId"] != null && strType == "Map")
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsLocMapId"));
                intLocationMap_ID = Convert.ToInt32(fromTicket.Name.ToString());
            }
          //  lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            if (strMode.ToUpper() == "C")
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
            else if (strMode.ToUpper() == "Q")
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
            else if (strMode.ToUpper() == "M")
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);


           
            if (!IsPostBack)
            {
                if (strType == "Cate")
                {
                    Dictionary<string, string> dictParam = new Dictionary<string, string>();
                    dictParam.Add("@Company_ID", usrInfo.ProCompanyIdRW.ToString());
                    if (strMode != "Q" && strMode != "M")
                        dictParam.Add("@IsActive", "1");
                    DataTable dtHierarchy = Utility_FA.GetDefaultData(SPNames.GetHierachyDTL, dictParam);
                    rblHierarchy.DataTextField = "Location_Description";
                    rblHierarchy.DataValueField = "Hierachy";
                    rblHierarchy.DataSource = dtHierarchy;
                    rblHierarchy.DataBind();
                    if (dtHierarchy.Rows.Count == 0)
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Define Hierarchy Master.");
                        Response.Redirect(strRedirectPage);
                    }
                    if (intLocationCat_ID > 0)
                    {
                        FunPubLoadLocationCategoryDetails();
                    }
                    pnlLocationMapping.Visible = false;
                    if (tcLocCategory.ActiveTab != null && strMode != "M" && strMode != "Q")
                    {
                        DataRow[] drow = dtHierarchyWidth.Select("Location_Description='" + tcLocCategory.ActiveTab.HeaderText + "'");
                        if (drow != null && drow.Count() > 0)
                            txtLocationCode.MaxLength = Convert.ToInt32(drow[0]["Width"]);
                        lblLocationCode.Text = tcLocCategory.ActiveTab.HeaderText + " Code"; //"Location " + 
                        lblLocationDescription.Text = tcLocCategory.ActiveTab.HeaderText + " Description";//"Location " +
                        if (tcLocCategory.Tabs.Count > 0 && tcLocCategory.ActiveTabIndex != 0)
                            lblParent.Text = tcLocCategory.Tabs[tcLocCategory.ActiveTabIndex - 1].HeaderText;
                    }
                    if (intLocationCat_ID == 0)
                    {
                        lblParent.Visible = ddlParent.Visible = false;
                    }
                }
                else if (strType == "Map")
                {
                    pnlHierarchyType.Visible = pnlLocationCatDetails.Visible = false;
                    if (intLocationMap_ID > 0)
                    {
                        FunPubLoadLocationMappingDetails();
                    }
                }
                if (intLocationCat_ID <= 0)
                    FunProRedirect(intTc);
            }
            //if (strType == "Cate" && strMode != "M" && strMode != "Q")
            //{
                //FunPubLoadlocationDetailsBasedOnHierarchy();
                //ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                //AjaxControlToolkit.TabContainer tcDefCat = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocCategory");
                //string strHText = tcDefCat.ActiveTab.HeaderText;
                //AjaxControlToolkit.TabPanel tp = (AjaxControlToolkit.TabPanel)tcDefCat.FindControl("tpLocDef" + strHText);
                //GridView gv = ((GridView)tp.FindControl("gv" + strHText));
            //}
            if (strType == "Map" && strMode != "M" && strMode != "Q")
            {
                txtLocationMappingCode.Text = "";
                txtMappingDescription.Text = "";
                string strCodes = string.Empty;
                string strSaveCodes = string.Empty;
                string strDescriptions = string.Empty;
                int intCount = 0;
                foreach (string str in strarrControlsID)
                {
                    DropDownList ddlList = new DropDownList();
                    ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                    AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocationMapping");
                    AjaxControlToolkit.TabPanel tpLocDef = (AjaxControlToolkit.TabPanel)tcDefMap.FindControl("tpLocDef" + str);
                    if (tpLocDef != null)
                    {
                        ddlList = ((DropDownList)tpLocDef.FindControl("ddlHierarchy" + str));
                        if (ddlList != null && ddlList.SelectedIndex > 0)
                        {
                            if (intCount == 0)
                            {
                                if (strCodes == string.Empty)
                                {
                                    ;
                                    strCodes += ddlList.SelectedValue;
                                    strSaveCodes += ddlList.SelectedValue;
                                    strDescriptions = ddlList.SelectedItem.Text;
                                }
                                else
                                {
                                    strCodes += ddlList.SelectedValue;  // "|" +
                                    strSaveCodes += "|" + ddlList.SelectedValue;
                                    strDescriptions = ddlList.SelectedItem.Text;
                                }
                            }
                            else
                                ddlList.SelectedIndex = 0;
                        }
                        else
                            intCount++;
                    }
                }
                hdnMappingCode.Value = strSaveCodes;
                txtLocationMappingCode.Text = strCodes;
                txtMappingDescription.Text = strDescriptions;
            }
            ddlParent.AddItemToolTipValue_FA();
            //Added for Dynamic Validation Message//
            rfvLocationParent.ErrorMessage = "Select " + lblParent.Text;
            rfvLocationCode.ErrorMessage = "Enter " + lblLocationCode.Text;
            rfvLocationName.ErrorMessage = "Enter " + lblLocationDescription.Text;
            //Added for Dynamic Validation Message//
            txtLocationName.Attributes.Add("onBlur", "return FunTrimwhitespace(this,'" + lblLocationDescription.Text + "');");
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            cvLocationMaster.IsValid = false;
            cvLocationMaster.ErrorMessage = strErrorMessage + "Unable to load the page." + strErrorMsgLast;
        }
    }

    #endregion [Page Event's]

    #region [Button Event's]

    protected void btnCategoryGo_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtLocation = ((DataTable)ViewState["dt_Location"]);
            //Code Added and Commented by Saran on 12-Jan-2012 to achieve Operational Location start
            //if (dtLocation == null || dtLocation.Columns.Count != 11)
            if (dtLocation == null || dtLocation.Columns.Count != 12)
            //Code Added and Commented by Saran on 12-Jan-2012 to achieve Operational Location end
            {
                dtLocation = FunPubCreateLocationTableStructure();
            }
            if (dtLocation.Rows.Count == 0)
            {
                DataRow drNew = dtLocation.NewRow();
                drNew["SNo"] = dtLocation.Rows.Count + 1;
                drNew["Location_Code"] = txtLocationCode.Text;
                drNew["Location_Description"] = txtLocationName.Text.Trim ();
                drNew["Hierarchy_Description"] = tcLocCategory.ActiveTab.HeaderText;
                drNew["Hierarchy_Type"] = tcLocCategory.ActiveTabIndex + 1;// Convert.ToInt32(rblHierarchy.SelectedValue);
                string strMappingCode = tcLocCategory.ActiveTabIndex == 0 ? "" : ddlParent.SelectedItem.Text;
                drNew["CurrenctMapping_Code"] = tcLocCategory.ActiveTabIndex == 0 ? txtLocationCode.Text : strMappingCode + "|" + txtLocationCode.Text;
                drNew["Mapping_Description"] = tcLocCategory.ActiveTabIndex == 0 ? txtLocationName.Text.Trim() : lblMappingCodeDescription.Text + "|" + txtLocationName.Text.Trim();
                string[] strcodes = strMappingCode.Split('|');
                drNew["Parent_Code"] = tcLocCategory.ActiveTabIndex == 0 ? "" : (strcodes[strcodes.Length - 1]).ToString();
                //Code Added by Chandrasekar K On 21-Sep-2012
                drNew["Loc_Parent_Code"] = strMappingCode;
                //Code Added by Saran on 12-Jan-2012 to achieve Operational Location start
                drNew["Operational_Location"] = cbxOperationalLoc.Checked;
                //Code Added by Saran on 12-Jan-2012 to achieve Operational Location end

                dtLocation.Rows.Add(drNew);
                ViewState["dt_Location"] = dtLocation;
            }
            else
            {
                //************************//
                //Added new For Code Duplication//
                string strToCompareCode = "";
                string strMappingCode1 = tcLocCategory.ActiveTabIndex == 0 ? "" : ddlParent.SelectedItem.Text;
                strToCompareCode = tcLocCategory.ActiveTabIndex == 0 ? txtLocationCode.Text : strMappingCode1 + "|" + txtLocationCode.Text;
                //DataRow[] drCode = dtLocation.Select("CurrenctMapping_Code='" + strToCompareCode + "'");
                DataRow[] drCode ;
                //------Now changed--
               // drCode = dtLocation.Select("Location_Code='" + strToCompareCode.ToUpper() + "'");
                drCode = dtLocation.Select("CurrenctMapping_Code='" + strToCompareCode.ToUpper() + "'");
                if (drCode.Count() < 1)
                    drCode = dtLocation.Select("Location_Code='" + strToCompareCode.ToLower() + "'");

                //    drCode = dtLocation.Select("Location_Code='" + txtLocationCode.Text.Trim().ToUpper () + "'");
                //if (drCode.Count() < 1)
                //    drCode = dtLocation.Select("Location_Code='" + txtLocationCode.Text.Trim().ToLower () + "'");
                //------Now changed--

                //Added new For Code Duplication//

                //(OLD Code)--DataRow[] drCode = dtLocation.Select("Location_Code='" + txtLocationCode.Text.Trim() + "'");
               //************************//
                DataRow[] drName ;
                   drName = dtLocation.Select("Location_Description='" + txtLocationName.Text.Trim().ToUpper() + "'");
                if (drName.Count() < 1)
                    drName = dtLocation.Select("Location_Description='" + txtLocationName.Text.Trim().ToUpper() + "'");


                //if (drCode.Count() == 1)
                if (drCode.Count() == 1)
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Exists Location Code : " + strToCompareCode + " in the list");
                    //Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Exists Location Code : " + txtLocationCode.Text.Trim()+  " in the list");
                else if (drName.Count() == 1)
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Exists Location Description : " + txtLocationName.Text.Trim() + " in the list");
               

                /*Changed to allow Location with same description and Different Code
                      Modified on 11-June-2012 for Bug fixing*/
                //else if (drName.Count() == 1)
                //    Utility_FA.FunShowAlertMsg_FA(this.Page, "Location Description Already Exists in the list : " + txtLocationName.Text.Trim());
               
                /*Changed to allow Location with same description and Different Code
                                      Modified on 11-June-2012 for Bug fixing*/
                else
                {
                    DataRow drNew = dtLocation.NewRow();
                    drNew["SNo"] = dtLocation.Rows.Count + 1;
                    drNew["Location_Code"] = txtLocationCode.Text;
                    drNew["Location_Description"] = txtLocationName.Text.Trim ();
                    drNew["Hierarchy_Description"] = tcLocCategory.ActiveTab.HeaderText;
                    drNew["Hierarchy_Type"] = tcLocCategory.ActiveTabIndex + 1; ;// Convert.ToInt32(rblHierarchy.SelectedValue);
                    string strMappingCode = tcLocCategory.ActiveTabIndex == 0 ? "" : ddlParent.SelectedItem.Text;
                    drNew["CurrenctMapping_Code"] = tcLocCategory.ActiveTabIndex == 0 ? txtLocationCode.Text : strMappingCode + "|" + txtLocationCode.Text;
                    drNew["Mapping_Description"] = tcLocCategory.ActiveTabIndex == 0 ? txtLocationName.Text.Trim() : lblMappingCodeDescription.Text + "|" + txtLocationName.Text.Trim();
                    drNew["Parent_Code"] = tcLocCategory.ActiveTabIndex == 0 ? "" : (strMappingCode.Split('|')[(strMappingCode.Split('|').Length - 1)]);
                    //Code Added by Chandrasekar K On 21-Sep-2012
                    drNew["Loc_Parent_Code"] = strMappingCode;
                    //Code Added by Saran on 12-Jan-2012 to achieve Operational Location start
                    drNew["Operational_Location"] = cbxOperationalLoc.Checked;
                    //Code Added by Saran on 12-Jan-2012 to achieve Operational Location end

                    dtLocation.Rows.Add(drNew);
                    ViewState["dt_Location"] = dtLocation;
                    //CurrenctDisplay
                }
            }
            FunPubLoadlocationDetailsBasedOnHierarchy();
            FunPubClearCategoryuEntry();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            cvLocationMaster.IsValid = false;
            cvLocationMaster.ErrorMessage = strErrorMessage + "Unable to add the Category details." + strErrorMsgLast;
        }
    }

    protected void btnSaveLocationCategory_Click(object sender, EventArgs e)
    {
        try
        {
            if (strMode == "M")
            {
                if (string.IsNullOrEmpty(txtLocationName.Text))
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Enter " + lblLocationDescription.Text);
                    return ;
                }
            }


            if (Page.IsValid)
                FunPubInsertLocationCategory();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            cvLocationMaster.IsValid = false;
            cvLocationMaster.ErrorMessage = strErrorMessage + "Unable to save the location category." + strErrorMsgLast;
        }
    }

    protected void btnCancelLocCategory_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPage + "?Type=" + strType);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnSaveLocationMapping_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
                FunPubInsertLocationMaster();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            cvLocationMaster.IsValid = false;
            cvLocationMaster.ErrorMessage = strErrorMessage + "Unable to save the location mapping details." + strErrorMsgLast;
        }
    }

    protected void btnLocationMapping_Go_Click(object sender, EventArgs e)
    {
        try
        {
            string[] strCodeCheck = txtLocationMappingCode.Text.Split('|');
            if (strCodeCheck != null && strCodeCheck.Count() == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Select at least minimum two mapping...");
                return;
            } 
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            cvLocationMaster.IsValid = false;
            cvLocationMaster.ErrorMessage = strErrorMessage + "" + strErrorMsgLast;
        }
    }
    #endregion [Button Event's]

    #region [Tab Event's]

    protected void tcLocCategory_ActiveTabChanged(object sender, EventArgs e)
    {
        try
        {
            FunProRedirect(tcLocCategory.ActiveTabIndex);
            //lblMappingCodeDescription.Text = "";
            //FunPubLoadlocationDetailsBasedOnHierarchy();
            //if (tcLocCategory.ActiveTabIndex == 0)
            //{
            //    lblParent.Visible = ddlParent.Visible = lblMappingCodeDescription.Visible = false;
            //}
            //else
            //{
            //    lblParent.Visible = ddlParent.Visible = lblMappingCodeDescription.Visible = true;
            //}
            //FunPubLoadParentMappingDropDown(tcLocCategory.ActiveTabIndex);
            ////Added for Dynamic Validation Message//
            //rfvLocationParent.ErrorMessage ="Select " + lblParent.Text;
            //rfvLocationCode.ErrorMessage = "Enter " + lblLocationCode.Text;
            //rfvLocationName.ErrorMessage = "Enter " + lblLocationDescription.Text;
            ////Added for Dynamic Validation Message//

        }
        catch (Exception ex)
        {
            cvLocationMaster.IsValid = false;
            cvLocationMaster.ErrorMessage = strErrorMessage + "" + strErrorMsgLast;
        }
    }



    protected void FunProRedirect(int index)
    {
        tcLocCategory.ActiveTabIndex = index;
        lblMappingCodeDescription.Text = "";
        FunPubLoadlocationDetailsBasedOnHierarchy();
        if (index == 0)
        {
            lblParent.Visible = ddlParent.Visible = lblMappingCodeDescription.Visible = false;
        }
        else
        {
            lblParent.Visible = ddlParent.Visible = lblMappingCodeDescription.Visible = true;
        }
        FunPubLoadParentMappingDropDown(index);
        //Added for Dynamic Validation Message//
        rfvLocationParent.ErrorMessage = "Select " + lblParent.Text;
        rfvLocationCode.ErrorMessage = "Enter " + lblLocationCode.Text;
        rfvLocationName.ErrorMessage = "Enter " + lblLocationDescription.Text;
        //Added for Dynamic Validation Message//
       
    }
    #endregion [Tab Event's]

    #region [Function's]

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

    public void FunPubLoadLocationCategoryDetails()
    {
        try
        {
            //DataTable dtLocCategoryDetails;
            //objLocationMasterClient = new  SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
            //byte[] byteLocCatDetails = objLocationMasterClient.FunPubQueryLocationCategoryDetails(intCompanyId, intUserId, intLocationCat_ID, SerMode);
            //dtLocCategoryDetails = (DataTable)FAClsPubSerialize.DeSerialize(byteLocCatDetails, SerMode, typeof(DataTable));
            //// rblHierarchy.SelectedValue = Convert.ToString(dtLocCategoryDetails.Rows[0]["Hierarchy_Type"]);  

            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", intCompanyId.ToString());
            dictParam.Add("@User_ID", intUserId.ToString());
            dictParam.Add("@Location_Category_ID", intLocationCat_ID.ToString());
            DataTable dtLocCategoryDetails = Utility_FA.GetDefaultData(SPNames.GetLocationCategoryDetails, dictParam);

            lblLocationCode.Text = Convert.ToString(dtLocCategoryDetails.Rows[0]["Location_Description"]) + " Code";//"Location " +
            lblLocationDescription.Text = Convert.ToString(dtLocCategoryDetails.Rows[0]["Location_Description"]) + " Description";//"Location " +
            txtLocationCode.Text = Convert.ToString(dtLocCategoryDetails.Rows[0]["Location_Code"]);
            txtLocationName.Text = Convert.ToString(dtLocCategoryDetails.Rows[0]["LocationCat_Description"]);
            cbxActive.Checked = Convert.ToBoolean(dtLocCategoryDetails.Rows[0]["Is_Active"]);
            lblParent.Text = Convert.ToString(dtLocCategoryDetails.Rows[0]["ParentLocation"]);
            rblHierarchy.Enabled = false;
            if ((Convert.ToInt32(dtLocCategoryDetails.Rows[0]["Hierarchy_Type"]) - 1) != 0)
            {
                FunPubLoadParentMappingDropDown(Convert.ToInt32(dtLocCategoryDetails.Rows[0]["Hierarchy_Type"]) - 1);
                ddlParent.SelectedValue = Convert.ToString(dtLocCategoryDetails.Rows[0]["Previous_LocMap"]);
                lblMappingCodeDescription.Text = Convert.ToString(dtLocCategoryDetails.Rows[0]["Previous_LocMap"]);
                ddlParent.ClearDropDownList_FA();
            }
            else
            {
                ddlParent.Visible = lblMappingCodeDescription.Visible = lblParent.Visible = false;
            }
            if (strMode == "Q" || strMode == "M")
            {
                txtLocationCode.ReadOnly = true;
                btnCategoryGo.Enabled = btnSaveLocCategory.Enabled = cbxActive.Enabled = false;
                //Code Added by Saran on 12-Jan-2012 to achieve Operational Location start
                lblOperationalLoc.Visible = cbxOperationalLoc.Visible = false;
                //Code Added by Saran on 12-Jan-2012 to achieve Operational Location end

                tcLocCategory.Visible = false;
            }
            if (strMode == "M")
                btnSaveLocCategory.Enabled = cbxActive.Enabled = true;
            if (strMode == "Q") 
                txtLocationName.ReadOnly = true;
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new Exception("Unable to load Location Category details");
        }
        finally
        {
            if (objLocationMasterClient != null)
                objLocationMasterClient.Close();
        }
    }

    public void FunPubLoadLocationMappingDetails()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", usrInfo.ProCompanyIdRW.ToString());
            dictParam.Add("@LocationMap_ID", intLocationMap_ID.ToString());
            DataTable dtLocMappingDetails = Utility_FA.GetDefaultData(SPNames.GetLocationMappingDetails, dictParam);

            txtLocationMappingCode.Text = Convert.ToString(dtLocMappingDetails.Rows[0]["LocationMap_Code"]).Replace("|", "");
            cbxActiveMapping.Checked = Convert.ToBoolean(dtLocMappingDetails.Rows[0]["Is_Active"]);
            cbxOperationalLocM.Checked = Convert.ToBoolean(dtLocMappingDetails.Rows[0]["Is_Operational"]);
            if (strMode == "Q" || strMode == "M")
            {
                txtLocationMappingCode.ReadOnly = true;
                btnSaveLocationMapping.Enabled = false;
                tcLocCategory.Visible = false;
                cbxActiveMapping.Enabled = false;
                if (strMode == "M")
                {
                    cbxActiveMapping.Enabled = btnSaveLocationMapping.Enabled = true;
                    cbxOperationalLocM.Enabled = true;
                }
            }
            string strDescription = string.Empty;
            foreach (string str in strarrControlsID)
            {
                DropDownList ddlList = new DropDownList();
                ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocationMapping");
                AjaxControlToolkit.TabPanel tpLocDef = (AjaxControlToolkit.TabPanel)tcDefMap.FindControl("tpLocDef" + str);
                if (tpLocDef != null)
                {
                    ddlList = ((DropDownList)tpLocDef.FindControl("ddlHierarchy" + str));
                    DataRow[] drow = dtLocMappingDetails.Select("Hierarchy_Description='" + str + "'");
                    if (drow != null && drow.Count() > 0)
                    {
                        ddlList.SelectedValue = Convert.ToString(drow[0]["Location_Category_ID"]); // Convert.ToString(drow[0]["LocationCat_Code"]);
                        strDescription = ddlList.SelectedItem.Text;
                        ddlList.ClearDropDownList_FA();
                    }
                    if (ddlList != null && ddlList.Items.Count > 0)
                        ddlList.ClearDropDownList_FA();
                }
                ddlList.AddItemToolTipText_FA();
            }
            txtMappingDescription.Text = strDescription;
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new Exception("Unable to load Location Mapping details");
        }
    }

    public void FunPubLoadActiveHierarchy()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", usrInfo.ProCompanyIdRW.ToString());
            dictParam.Add("@IsActive", "1");
            DataTable dtHierarchy = Utility_FA.GetDefaultData(SPNames.GetHierachyDTL, dictParam);
            dtHierarchyWidth = dtHierarchy.Copy();
            ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
            AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocCategory");
            AjaxControlToolkit.TabPanel tpLocDef = new AjaxControlToolkit.TabPanel();
            int intCount = 0;
            foreach (DataRow drow in dtHierarchy.Rows)
            {
                tpLocDef = new AjaxControlToolkit.TabPanel();
                tpLocDef.ID = "tpLocDef" + Convert.ToString(drow["Location_Description"]);
                tpLocDef.HeaderText = Convert.ToString(drow["Location_Description"]);
                tcDefMap.Tabs.Add(tpLocDef);
                intCount++;
            }
            if (tcLocCategory.ActiveTab != null)
            {
                DataRow[] drow = dtHierarchyWidth.Select("Location_Description='" + tcLocCategory.ActiveTab.HeaderText + "'");
                if (drow != null && drow.Count() > 0)
                    txtLocationCode.MaxLength = Convert.ToInt32(drow[0]["Width"]);
                lblLocationCode.Text = tcLocCategory.ActiveTab.HeaderText + " Code";// "Location " + 
                lblLocationDescription.Text = tcLocCategory.ActiveTab.HeaderText + " Description";//"Location " +
                if (tcLocCategory.Tabs.Count > 0 && tcLocCategory.ActiveTabIndex != 0)
                    lblParent.Text = tcLocCategory.Tabs[tcLocCategory.ActiveTabIndex - 1].HeaderText;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw;
        }
    }

    public void FunPubLoadHierarchyForMapping()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", usrInfo.ProCompanyIdRW.ToString());
            DataTable dtLocCategory = Utility_FA.GetDefaultData(SPNames.GetAllLocationCategory, dictParam);
            dictParam.Add("@IsActive", "1");
            DataTable dtHierarchy = Utility_FA.GetDefaultData(SPNames.GetHierachyDTL, dictParam);
            ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
            AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocationMapping");
            AjaxControlToolkit.TabPanel tpLocDef = new AjaxControlToolkit.TabPanel();
            int intCount = 0;
            strarrControlsID = new string[dtHierarchy.Rows.Count];

            DropDownList ddlHierarchy = new DropDownList();
            foreach (DataRow drow in dtHierarchy.Rows)
            {
                ddlHierarchy = new DropDownList();
                tpLocDef = new AjaxControlToolkit.TabPanel();
                tpLocDef.ID = "tpLocDef" + Convert.ToString(drow["Location_Description"]);
                tpLocDef.HeaderText = Convert.ToString(drow["Location_Description"]);
                ddlHierarchy.ID = "ddlHierarchy" + Convert.ToString(drow["Location_Description"]);
                ddlHierarchy.Width = Unit.Pixel(200);
                DataRow[] drLoc = dtLocCategory.Select("Hierarchy_Type='" + drow["Hierachy"] + "'");
                if (drLoc != null && drLoc.Count() > 0)
                {
                    ddlHierarchy.DataTextField = "LocationCat_Description";
                    ddlHierarchy.DataValueField = "Location_Category_ID"; //"Location_Code";
                    ddlHierarchy.AutoPostBack = true;
                    ddlHierarchy.DataSource = drLoc.CopyToDataTable();
                    ddlHierarchy.DataBind();
                    System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
                    ddlHierarchy.Items.Insert(0, liSelect);
                    ddlHierarchy.SelectedIndexChanged += new EventHandler(ddlHierarchy_SelectedIndexChanged);
                }
                strarrControlsID[intCount] = Convert.ToString(drow["Location_Description"]);
                tpLocDef.Controls.Add(ddlHierarchy);

                tcDefMap.Tabs.Add(tpLocDef);
                intCount++;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw;
        }
    }

    void ddlHierarchy_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnSaveLocationMapping.Enabled = false;
        if (((DropDownList)sender).SelectedIndex > 0 && FunPubCheckExistingMapping(Convert.ToString(((DropDownList)sender).SelectedValue)) == 0)
        {
            btnSaveLocationMapping.Enabled = true;
            //  ((DropDownList)sender).SelectedIndex = 0;

        }
        //throw new NotImplementedException();
    }

    public DataTable FunPubCreateLocationTableStructure()
    {
        DataTable dtLocation = new DataTable();
        dtLocation.Columns.Add("SNo", typeof(Int32));
        dtLocation.Columns.Add("Location_Code", typeof(String));
        dtLocation.Columns.Add("Location_Description", typeof(String));
        dtLocation.Columns.Add("Hierarchy_Description", typeof(String));
        dtLocation.Columns.Add("Hierarchy_Type", typeof(Int32));
        dtLocation.Columns.Add("CurrenctMapping_Code", typeof(string)).DefaultValue = "";
        dtLocation.Columns.Add("CurrenctDisplay", typeof(string)).DefaultValue = "";
        dtLocation.Columns.Add("Mapping_Description", typeof(string)).DefaultValue = "";
        dtLocation.Columns.Add("Active", typeof(bool)).DefaultValue = true;
        dtLocation.Columns.Add("Remove", typeof(string)).DefaultValue = "Remove";
        dtLocation.Columns.Add("Parent_Code", typeof(string)).DefaultValue = "";
        //Code Added by Chandrasekar K On 21-Sep-2012
        dtLocation.Columns.Add("Loc_Parent_Code", typeof(string)).DefaultValue = "";
        //Code Added by Saran on 12-Jan-2012 to achieve Operational Location start
        dtLocation.Columns.Add("Operational_Location", typeof(bool)).DefaultValue = true;
        //Code Added by Saran on 12-Jan-2012 to achieve Operational Location end
        return dtLocation;
    }

    public void FunPubLoadlocationDetailsBasedOnHierarchy()
    {
        try
        {
            ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
            AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocCategory");
            if (((DataTable)ViewState["dt_Location"]) != null)
            {
                DataTable dtList = new DataTable();
                AjaxControlToolkit.TabPanel tpLocDef = new AjaxControlToolkit.TabPanel();
                foreach (AjaxControlToolkit.TabPanel tp in tcDefMap.Tabs)
                {
                    tpLocDef = (AjaxControlToolkit.TabPanel)tcDefMap.FindControl("tpLocDef" + tp.HeaderText);
                    DataRow[] drlist = ((DataTable)ViewState["dt_Location"]).Select("Hierarchy_Description='" + Convert.ToString(tp.HeaderText) + "'");
                    GridView gv = new GridView();
                    gv.ID = "gv" + tp.HeaderText;
                    tpLocDef.Controls.Remove(gv);
                    if (drlist != null && drlist.Count() > 0)
                    {
                        dtList = drlist.CopyToDataTable();
                        gv.RowDataBound += new GridViewRowEventHandler(gv_RowDataBound);
                        gv.EmptyDataText = "No Records found";
                        gv.Width = Unit.Percentage(98);
                        gv.AutoGenerateColumns = true;
                        
                        gv.DataSource = dtList;
                        gv.DataBind();

                        

                        //foreach (GridViewRow grvRow in gv.Rows)
                        //{
                        //    grvRow.Cells[11].ToolTip = "hsdghs";
                        //}  
                        tpLocDef.Controls.Add(gv);
                          
                    }
                    else
                    {
                        gv.DataSource = ((DataTable)ViewState["dt_Location"]).Clone();
                        gv.DataBind();
                        tpLocDef.Controls.Add(gv);
                    }
                   // for (int i = 0; i < gv.Rows.Count; i++)
                   // {
                       // ((System.Web.UI.WebControls.WebControl)(((System.Web.UI.WebControls.TableRow)(gv.Rows[i])).Cells[11])).ToolTip = "sdfd";
                        
                   // }
                }
            }
            if (tcLocCategory.ActiveTab != null)
            {
                DataRow[] drow = dtHierarchyWidth.Select("Location_Description='" + tcLocCategory.ActiveTab.HeaderText + "'");
                if (drow != null && drow.Count() > 0)
                    txtLocationCode.MaxLength = Convert.ToInt32(drow[0]["Width"]);
                lblLocationCode.Text = tcLocCategory.ActiveTab.HeaderText + " Code"; // "Location " +
                lblLocationDescription.Text = tcLocCategory.ActiveTab.HeaderText + " Description"; //"Location " +
                if (tcLocCategory.Tabs.Count > 0 && tcLocCategory.ActiveTabIndex != 0)
                    lblParent.Text = tcLocCategory.Tabs[tcLocCategory.ActiveTabIndex - 1].HeaderText;
                txtLocationName.Text = "";
                txtLocationCode.Text = "";

            }
            if (ViewState["dt_Location"] != null && ((DataTable)ViewState["dt_Location"]).Rows.Count > 0)
            {
                int intTabCount = tcDefMap.Tabs.Count;
                for (int i = 0; i < tcDefMap.Tabs.Count; i++)
                {
                    if (i != tcDefMap.ActiveTabIndex)
                    {
                        tcDefMap.Tabs[i].Enabled = false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw;
        }
    }

    public void FunPubLoadParentMappingDropDown(int intCurrentTabIndex)
    {
        try
        {
            DataTable dtLocations = new DataTable();
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", usrInfo.ProCompanyIdRW.ToString());
            dictParam.Add("@Hierarchy_Type", (intCurrentTabIndex).ToString());
            DataTable dtExisting = Utility_FA.GetDefaultData(SPNames .GetLocationCategory, dictParam);
            dtExisting.Columns["Location_Code"].ColumnName = "CurrenctMapping_Code";
            dtExisting.Columns["LocationCat_Description"].ColumnName = "Mapping_Description";
            if (((DataTable)ViewState["dt_Location"]) != null)
            {
                dtLocations = ((DataTable)ViewState["dt_Location"]);
                if (dtLocations.Rows.Count > 0)
                {
                    DataRow[] drLocations = dtLocations.Select("Hierarchy_Type='" + Convert.ToString(intCurrentTabIndex) + "'");
                    if (drLocations != null && drLocations.Length > 0)
                    {
                        ddlParent.DataSource = drLocations.CopyToDataTable();
                        ddlParent.DataBind();
                        dtExisting.Merge(drLocations.CopyToDataTable(), false, MissingSchemaAction.Add);
                    }
                    else
                        FunPubLoadDropDownList(dtExisting);
                }
                else
                    FunPubLoadDropDownList(dtExisting);
            }
            else
                FunPubLoadDropDownList(dtExisting);
            ddlParent.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            ddlParent.AddItemToolTipValue_FA();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw;
        }
    }

    private void FunPubLoadDropDownList(DataTable dtExisting)
    {
        ddlParent.DataSource = dtExisting;
        ddlParent.DataBind();
    }

    void gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[1].Text = "Location Code";
            e.Row.Cells[2].Text = "Location Description";
            e.Row.Cells[3].Text = "Hierarchy Description";
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[5].Visible = true;
            e.Row.Cells[5].Text = "Current Mapping";
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[7].Text = "Mapping Description";
            //Added
            //e.Row.Cells[8].Visible = true;
            //e.Row.Cells[9].Visible = e.Row.Cells[10].Visible = false;
            e.Row.Cells[8].Visible = true;
            e.Row.Cells[8].Text = "Active";
            e.Row.Cells[9].Visible = e.Row.Cells[10].Visible = false;
            e.Row.Cells[11].Text = "Operational Location";
            //Added
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;
            e.Row.Cells[3].Visible = false;
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[5].Visible = true;
            e.Row.Cells[6].Visible = false;
            e.Row.Cells[7].Visible = false;
            e.Row.Cells[8].Visible = true;
            e.Row.Cells[9].Visible = e.Row.Cells[10].Visible = false;
            LinkButton lnkRemove = new LinkButton();
            lnkRemove.Text = "Remove";
            lnkRemove.CommandArgument = e.Row.Cells[0].Text;
            lnkRemove.Click += new EventHandler(lnkRemove_Click);

            e.Row.Cells[6].Controls.Add(lnkRemove);
            e.Row.Cells[6].Visible = false;


            e.Row.Cells[1].ToolTip = "Location Code";
            e.Row.Cells[2].ToolTip = "Location Description";
            e.Row.Cells[5].ToolTip = "Current Mapping";
            e.Row.Cells[8].Attributes.Add("align", "center");
            e.Row.Cells[11].Attributes.Add("align", "center");
           
        }
    }

    void lnkRemove_Click(object sender, EventArgs e)
    {
        string strSNo = ((LinkButton)sender).CommandArgument;
        if (((DataTable)ViewState["dt_Location"]) != null)
        {
            DataTable dtList = ((DataTable)ViewState["dt_Location"]);
            DataRow[] drow = dtList.Select("SNo='" + strSNo + "'");
            if (drow != null && drow.Count() > 0)
            {
                dtList.Rows.Remove(drow[0]);
                dtList.AcceptChanges();
                ViewState["dt_Location"] = dtList;
            }
        }
        FunPubLoadlocationDetailsBasedOnHierarchy();
    }

    public void FunPubInsertLocationCategory()
    {
        objLocationMasterClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        objLocationCategory_DataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable();
        objLocationCategory_DataRow = objLocationCategory_DataTable.NewFA_Sys_LocationCategoryRow();

        try
        {
            String StrQryStr = "";
            if (Request.QueryString["qsType"] != null)
                StrQryStr = Request.QueryString["qsType"].ToString().Trim();

            if (strMode != "Q" && strMode != "M")
            {
                if (((DataTable)ViewState["dt_Location"]) != null && ((DataTable)ViewState["dt_Location"]).Rows.Count > 0)
                {
                    string strLocationDetails = ((DataTable)ViewState["dt_Location"]).FunPubFormXml_FA();
                    objLocationCategory_DataRow.Company_ID = intCompanyId;
                    objLocationCategory_DataRow.Created_By = intUserId;
                    objLocationCategory_DataRow.XMLLocationDetails = strLocationDetails;
                    objLocationCategory_DataTable.AddFA_Sys_LocationCategoryRow(objLocationCategory_DataRow);
                    string strExistingCode = string.Empty;
                    string strExistingDescrption = string.Empty;
                    intErrorCode = objLocationMasterClient.FunPubInsertLocationCategory(SerMode, FAClsPubSerialize.Serialize(objLocationCategory_DataTable, SerMode), strConnectionName,out strExistingCode, out strExistingDescrption);
                    if (intErrorCode == 30)
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Existing Details : \\n Location Code :-" + strExistingCode + "\\n Location Description :-" + strExistingDescrption);
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Exists Location Code : " + strExistingCode);
                        FunPubLoadlocationDetailsBasedOnHierarchy();
                        return;
                    }
                    else if (intErrorCode == 31)
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Existing Details : \\n Location Code :-" + strExistingCode + "\\n Location Description :-" + strExistingDescrption);
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Exists Location Description : " + strExistingDescrption);
                        FunPubLoadlocationDetailsBasedOnHierarchy();
                        return;
                    }
                    else if (intErrorCode == 40 || intErrorCode == 50)
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Error Occured in Location Defined");
                        FunPubLoadlocationDetailsBasedOnHierarchy();
                        return;
                    }
                    else if (intErrorCode == 0)
                    {
                        
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Location Definition Added successfully" ,strRedirectPage + "?Type=" + strType + "&Level=" + HttpUtility.UrlEncode(StrQryStr));
                  

                        FunPubClearCategoryuEntry();
                        ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                        AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocCategory");
                        for (int i = 0; i < tcDefMap.Tabs.Count; i++)
                        {
                            tcDefMap.Tabs[i].Enabled = true;
                        }
                        ((DataTable)ViewState["dt_Location"]).Rows.Clear();
                    }
                    else
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Error Occured in Location Defined");
                        FunPubLoadlocationDetailsBasedOnHierarchy();
                        return;
                    }
                }
                else
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Atleast one Category should be added.");
                    return;
                }
            }
            else if (strMode == "M")
            {
                objLocationCategory_DataRow.Company_ID = intCompanyId;
                objLocationCategory_DataRow.Modified_By = intUserId;
                objLocationCategory_DataRow.Location_Category_ID = intLocationCat_ID;
                objLocationCategory_DataRow.Is_Active = Convert.ToBoolean(cbxActive.Checked);
                objLocationCategory_DataRow.Location_Description = txtLocationName.Text.Trim ();
                objLocationCategory_DataTable.AddFA_Sys_LocationCategoryRow(objLocationCategory_DataRow);
                intErrorCode = objLocationMasterClient.FunPubUpdateLocationCategory(SerMode, FAClsPubSerialize.Serialize(objLocationCategory_DataTable, SerMode), strConnectionName);
                if (intErrorCode == 0)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Location Definition Updated successfully",strRedirectPage + "?Type=" + strType + "&Level=" + HttpUtility.UrlEncode(StrQryStr));
                }
                else if (intErrorCode == 31)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "The Location has mapped, cannot be modified.");
                    return;
                }
                else if (intErrorCode == 32)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Already Exists Location Description : " + txtLocationName.Text.Trim());
                    return;
                }
                else
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Error Occured in Location Defined");
                    return;
                }
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw;
        }
        finally
        {
            if (objLocationMasterClient != null)
                objLocationMasterClient.Close();
        }
    }

    public void FunPubInsertLocationMaster()
    {
        objLocationMasterClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        // objLocationMaster_DataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable();
        objLocationMaster_DataRow = objLocationMaster_DataTable.NewFA_Sys_LocationMasterRow();
        string strExistingDetails = string.Empty;
        try
        {
            if (strMode != "Q" && strMode != "M")
            {
                //FunPubCheckExistingMapping();


                StringBuilder strb = new StringBuilder();
                strb.Append("<Root><Details ");
                strb.Append("Location_Code='" + hdnMappingCode.Value.ToString() + "  Is_Operational='" + cbxOperationalLocM.Checked + " '/></Root>");
                // string strLocationDetails = ((DataTable)ViewState["dt_LocationMapping"]).FunPubFormXml_FA();
                objLocationMaster_DataRow.Company_ID = intCompanyId;
                objLocationMaster_DataRow.Created_By = intUserId;
                objLocationMaster_DataRow.XMLLocationMasterDetails = strb.ToString();// strLocationDetails;
                objLocationMaster_DataTable.AddFA_Sys_LocationMasterRow(objLocationMaster_DataRow);
                intErrorCode = objLocationMasterClient.FunPubInsertLocationMaster(SerMode, FAClsPubSerialize.Serialize(objLocationMaster_DataTable, SerMode), strConnectionName,out strExistingDetails);
                if (intErrorCode == 0 && strExistingDetails != string.Empty)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "The location mapping code : " + strExistingDetails + "-already exist.");
                    return;
                }
                else if (intErrorCode == 0)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Location Mapping Added successfully.");
                    FunPubClearMappingEntry();
                }
                else
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Error Occured in Location Master.");
                    return;
                }
            }
            else if (strMode == "M")
            {
                objLocationMaster_DataRow.Company_ID = intCompanyId;
                objLocationMaster_DataRow.Modified_By = intUserId;
                objLocationMaster_DataRow.Location_ID = intLocationMap_ID;
                objLocationMaster_DataRow.Is_Active = Convert.ToBoolean(cbxActiveMapping.Checked);
                //Code Added by Saran on 12-Jan-2012 to achieve Operational Location start
                objLocationMaster_DataRow.Is_Operational = Convert.ToBoolean(cbxOperationalLocM.Checked);
                //Code Added by Saran on 12-Jan-2012 to achieve Operational Location end
                objLocationMaster_DataTable.AddFA_Sys_LocationMasterRow(objLocationMaster_DataRow);
                intErrorCode = objLocationMasterClient.FunPubUpdateLocationMapping(SerMode, FAClsPubSerialize.Serialize(objLocationMaster_DataTable, SerMode), strConnectionName);
                if (intErrorCode == 0)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Location Mapping details Updated Successfully", strRedirectPage + "?Type=" + strType);
                }
                else if (intErrorCode == 59)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Lower level Location has referring with selected location, deactive low level to top level");
                    return;
                }
                else if (intErrorCode == 58)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Active top level Location");
                    return;
                }
                else if (intErrorCode == 60)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Selected Location Should be Active in Location Definition");
                    return;
                }
                else
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Error Occured in Location Mapping Updation");
                    return;
                }
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw;
        }
        finally
        {
            if (objLocationMasterClient != null)
                objLocationMasterClient.Close();
        }

    }

    #region [Clear_FA Function]

    public void FunPubClearCategoryuEntry()
    {
        rblHierarchy.ClearSelection();
        txtLocationCode.Text = txtLocationName.Text = lblMappingCodeDescription.Text = "";
        //Code Added by Saran on 12-Jan-2012 to achieve Operational Location start
        cbxOperationalLoc.Checked = false;
        //Code Added by Saran on 12-Jan-2012 to achieve Operational Location end

        ddlParent.ClearSelection();
    }

    public void FunPubClearMappingEntry()
    {
        txtLocationMappingCode.Text = "";
        foreach (string str in strarrControlsID)
        {
            DropDownList ddlList = new DropDownList();
            ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
            AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocationMapping");
            AjaxControlToolkit.TabPanel tpLocDef = (AjaxControlToolkit.TabPanel)tcDefMap.FindControl("tpLocDef" + str);
            if (tpLocDef != null)
            {
                ddlList = ((DropDownList)tpLocDef.FindControl("ddlHierarchy" + str));
                ddlList.SelectedIndex = 0;
            }
            tcDefMap.ActiveTabIndex = 0;
        }
    }

    #endregion [Clear_FA Function]

    #region [Validation for Current Existing mapping check]
    public int FunPubCheckExistingMapping(string strCurrentMappingCode)
    {
        int intErrorCode = 0;
        //S3GAdminServicesReference.S3GAdminServicesClient objAdminClient = new S3GAdminServicesReference.S3GAdminServicesClient();
        FAAdminServiceReference.FAAdminServicesClient objAdminClient = new FAAdminServiceReference.FAAdminServicesClient();
        try
        {
            ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
            AjaxControlToolkit.TabContainer tcDefMap = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcLocationMapping");
            AjaxControlToolkit.TabPanel tcParrent = tcDefMap.ActiveTabIndex == 0 ? (AjaxControlToolkit.TabPanel)tcDefMap.ActiveTab : (AjaxControlToolkit.TabPanel)tcDefMap.Tabs[tcDefMap.ActiveTabIndex - 1];
            DropDownList ddlParent = (DropDownList)tcParrent.FindControl("ddlHierarchy" + tcParrent.HeaderText);

            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", usrInfo.ProCompanyIdRW.ToString());
            dictParam.Add("@Current_MapCode", strCurrentMappingCode);
            dictParam.Add("@Current_Level", (tcDefMap.ActiveTabIndex + 1).ToString());
            dictParam.Add("@Parrent_Code", (tcDefMap.ActiveTabIndex > 0 ? ddlParent.SelectedValue : "").ToString());
            dictParam.Add("@CurrentMapping", hdnMappingCode.Value);
            intErrorCode = Convert.ToInt32(objAdminClient.FunGetScalarValue(strConnectionName,SPNames.ExistLocationMapping, dictParam));
            dictParam.Clear();
            if (intErrorCode == 60 || intErrorCode == 63)
            {
                for (int i = tcDefMap.ActiveTabIndex + 1; i < tcDefMap.Tabs.Count; i++)
                {
                    tcDefMap.Tabs[i].Enabled = false;
                }
            }
            else
            {
                for (int i = tcDefMap.ActiveTabIndex + 1; i < tcDefMap.Tabs.Count; i++)
                {
                    tcDefMap.Tabs[i].Enabled = true;
                }
            }
            if (intErrorCode == 61)
            {
                //Utility_FA.FunShowAlertMsg_FA(this.Page, "Select Location already mapped");
            }
            else if (intErrorCode == 62)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Upper Level Locations not mapped");
            }
            else if (intErrorCode == 63)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Select Location has mapped with other upper level location");
            }
        }
        catch (Exception ex)
        { }
        finally
        {
            if (objAdminClient != null)
                objAdminClient.Close();
        }
        return intErrorCode == 60 ? 0 : intErrorCode;
    }
    #endregion [Validation for Current Existing mapping check]

    #endregion [Function's]


    protected void ddlParent_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMappingCodeDescription.Text = "";
        FunPubLoadlocationDetailsBasedOnHierarchy();
        if (ddlParent.SelectedIndex > 0)
            lblMappingCodeDescription.Text = ddlParent.SelectedItem.Value;
    }
}
