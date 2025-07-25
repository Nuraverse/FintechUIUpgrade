#region NameSpaces
using System;
using System.Threading;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AjaxControlToolkit;
using System.Configuration;
using System.IO;
using S3GBusEntity;
using System.Web.UI.HtmlControls;
using System.Text;
#endregion

public partial class Common_S3GMaster : System.Web.UI.Page
{
    #region Intialization
    string strLocalization;
    DataSet ds_Menu;
    UserInfo ObjUserInfo = new UserInfo();
    string strMenuText;
    string strModuleNameNew = string.Empty;
    Dictionary<string, string> procParam;
    #endregion


    #region Page Events

    #region Page Load
    /// <summary>
    /// Page Load Event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (ObjUserInfo.ProUserNameRW != null)
            {
                string strPageUrl = Request.Url.ToString();
                string strPageName = strPageUrl.Substring(strPageUrl.LastIndexOf("/") + 1);
                strPageUrl = strPageUrl.Replace(strPageName, "");
                strPageUrl = strPageUrl.TrimEnd('/');
                string strModuleName = strPageUrl.Substring(strPageUrl.LastIndexOf("/") + 1);
                if (System.Configuration.ConfigurationManager.AppSettings["TabCount"] != null)
                    hdnTabCount.Value = System.Configuration.ConfigurationManager.AppSettings["TabCount"];
                if (!IsPostBack)
                {
                    strLocalization = ObjUserInfo.ProLocalizationRW;
                    //ddlTheme.SelectedValue = ObjUserInfo.ProUserThemeRW;
                    System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = ObjUserInfo.ProCompanyIdRW.ToString();
                    System.Web.HttpContext.Current.Session["AutoSuggestUserId"] = ObjUserInfo.ProUserIdRW.ToString();
                    System.Web.HttpContext.Current.Session["AutoSuggestUserType"] = ObjUserInfo.ProUserTypeRW.ToString();
                    lblUser.Text = ObjUserInfo.ProUserNameRW.ToUpper();
                   // lblCompany.Text = ObjUserInfo.ProCompanyNameRW.ToUpper();
                    lblLastLoginDate.Text = ObjUserInfo.ProLastLoginRW.ToString("dd-MM-yyyy hh:mm:ss tt");
                    FungetEnvironment();
                    FnPubLoadControllblnameFrmResourceFile();

                    //Accordion1.SelectedIndex = Convert.ToInt32(Session["MenuIndex"]);

                    //imgHideMenu.Attributes.Add("onmouseup", "showMenu('F');SetMenuVisibility(0);");
                    //imgHideMenu.Attributes.Add("onmouseover", "showtooltip('H')");
                    //imgHideMenu.Attributes.Add("onmouseout", "hidetooltip('H')");
                    //imgShowMenu.Attributes.Add("onmouseup", "showMenu('T');SetMenuVisibility(1);");
                    //imgShowMenu.Attributes.Add("onmouseover", "showtooltip('S');");
                    //imgShowMenu.Attributes.Add("onmouseout", "hidetooltip('S')");
                    switch (ObjUserInfo.ProUserThemeRW.ToUpper())
                    {
                        case "S3GTHEME_BLUE2":
                            //cpeDemo.ExpandedImage = "~/Images/Blue_2/layout_button_left_blue.gif";
                            //cpeDemo.CollapsedImage = "~/Images/Blue_2/layout_button_right_blue.gif";
                            imgLogo.ImageUrl = "~/Images/Blue_2/s3g_logo.png";
                            sidenavimgLogo.ImageUrl = "~/Images/Blue_2/s3g_logo.png";
                            //  imgDetails.ImageUrl = "~/Images/Blue_2/layout_button_left_blue.gif";
                            break;
                        case "S3GTHEME_NIGHT":
                           // cpeDemo.ExpandedImage = "~/Images/Night/layout_button_left_blue.png";
                          //  cpeDemo.CollapsedImage = "~/Images/Night/layout_button_right_blue.png";
                            imgLogo.ImageUrl = "~/Images/Blue_2/s3g_logo.png";
                            sidenavimgLogo.ImageUrl = "~/Images/Blue_2/s3g_logo.png";
                            //  imgDetails.ImageUrl = "~/Images/Night/layout_button_left_blue.png";
                            break;
                        case "S3GTHEME_LIGHT":
                        case "S3GTHEME_GREEN_LIGHT":
                           // cpeDemo.ExpandedImage = "~/Images/Light/layout_button_left_blue.png";
                          //  cpeDemo.CollapsedImage = "~/Images/Light/layout_button_right_blue.png";
                            //  imgDetails.ImageUrl = "~/Images/Light/layout_button_left_blue.png";
                            imgLogo.ImageUrl = "~/Images/Light/s3g_logo.png";
                            sidenavimgLogo.ImageUrl = "~/Images/Light/s3g_logo.png";
                            break;
                        case "S3GTHEME_LIGHTBLUE":
                            // cpeDemo.ExpandedImage = "~/Images/Light/layout_button_left_blue.png";
                            //  cpeDemo.CollapsedImage = "~/Images/Light/layout_button_right_blue.png";
                            //  imgDetails.ImageUrl = "~/Images/Light/layout_button_left_blue.png";
                            imgLogo.ImageUrl = "~/Images/LightBlue/s3g_logo.png";
                            sidenavimgLogo.ImageUrl = "~/Images/LightBlue/s3g_logo.png";
                            break;
                        case "S3GTHEME_SILVER":
                            // imgHideMenu.ImageUrl = "~/Images/layout_button_left_silver.gif";
                            //  imgShowMenu.ImageUrl = "~/Images/layout_button_right_blue.gif";
                            imgLogo.ImageUrl = "~/Images/smartlend-logo_gray.jpg";
                            sidenavimgLogo.ImageUrl = "~/Images/smartlend-logo_gray.jpg";
                            break;
                        case "S3GTHEME_BLUE":
                            //  imgHideMenu.ImageUrl = "~/Images/layout_button_left.gif";
                            //  imgShowMenu.ImageUrl = "~/Images/layout_button_right.gif";
                            imgLogo.ImageUrl = "~/Images/logo_blue.jpg";
                            sidenavimgLogo.ImageUrl = "~/Images/logo_blue.jpg";
                            break;
                        default:
                            // imgHideMenu.ImageUrl = "~/Images/Orange/layout_button_left_orange.gif";
                            // imgShowMenu.ImageUrl = "~/Images/Orange/layout_button_right_orange.gif";
                            imgLogo.ImageUrl = "~/Images/Orange/logo_orange_new.jpg";
                            sidenavimgLogo.ImageUrl = "~/Images/Orange/logo_orange_new.jpg";
                            break;
                    }


                    if (Accordion1.SelectedIndex != 1)
                    {
                        FunPriSetPageTitle();
                    }
                }
               // strPageName = "HomePage.aspx";
                FunPriLoadMenu(strModuleName, strPageName);
            }
            else
            {
                Response.Redirect("~/SessionExpired.aspx");
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Master Page");
        }

    }

    protected void FungetEnvironment()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", ObjUserInfo.ProCompanyIdRW.ToString().Trim());
        DataTable DtEnvi = Utility.GetDefaultData("S3G_GET_EnvironmentName", Procparam);
      //  lblEnvironment.Text = DtEnvi.Rows[0]["ENVI"].ToString();
    }

    #endregion



    /// <summary>
    /// Event triggered onPage Intialization
    /// </summary>
    /// <param name="e"></param>
    protected override void OnInit(EventArgs e)
    {


        //Ramesh M for cultureinfo
        base.OnInit(e);
        //Modified by Nataraj Y to add localization to be obtained from Session variable 
        if (strLocalization != null)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(strLocalization);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(strLocalization);
        }
        else
        {
            strLocalization = "en";//ConfigurationManager.AppSettings["localization"].ToString();

        }
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        // FunPriLoadMenu();

        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Menu", "javascript:GetMenuVisibility();", true);

    }

    /// <summary>
    /// Event To handle Home link click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/HomePage.aspx");
    }

    protected void lnkChangePassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/Changepassword.aspx");
    }

    /// <summary>
    /// Event to handle Theme Combo selection
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    {
        //try
        //{
        ObjUserInfo.ProUserThemeRW = ddlTheme.SelectedValue;

        procParam = new Dictionary<string, string>();
        procParam.Add("@User_ID", ObjUserInfo.ProUserIdRW.ToString());
        procParam.Add("@User_Theme", ddlTheme.SelectedValue);
        DataTable dt = Utility.GetDefaultData("S3G_SYSAD_UpdateUserTheme", procParam);

        Server.Transfer(Request.FilePath);
        //}
        //catch (Exception ex)
        //{
        //    throw new Exception("Unable to Set Theme");
        //}
    }

    /// <summary>
    /// Event to handle Signout Click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 
    private int FunPriUpdateLogOutTime()
    {
        String Session_ID = Session.SessionID.ToString();
        S3GAdminServicesReference.S3GAdminServicesClient ObjWebServiceClient = new S3GAdminServicesReference.S3GAdminServicesClient();
        int intErrorCode;
        try
        {
            intErrorCode = ObjWebServiceClient.FunPubUpdateLogOutFlags(ObjUserInfo.ProCompanyIdRW, ObjUserInfo.ProUserIdRW, Session_ID, "", 1);

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            ObjWebServiceClient.Close();
        }
        return intErrorCode;
    }
    protected void lnkSignOut_Click(object sender, EventArgs e)
    {
        //To Update Log Out Time and LogOut Flag Added By Chandu  8-Aug-2013
        FunPriUpdateLogOutTime();
        //To Update Log Out Time and LogOut Flag Added By Chandu  8-Aug-2013

        Utility.FunPubKillSession();
        string strPath;
        if (ObjUserInfo.ProUserTypeRW == "USER")
        {
            strPath = Server.MapPath(@"~\Data\UserManagement\");
        }
        else
        {
            strPath = Server.MapPath(@"~\Data\UserManagement\UTPA\");
        }
        try
        {
            File.Delete(strPath + ObjUserInfo.ProUserIdRW.ToString() + ".xml");
        }
        catch
        {

        }
        //Added by Thangam M on 28-Sep-2013 for Row lock
        if (Session["RemoveLock"] != null)
        {
            Utility.FunPriRemoveLockedRow(ObjUserInfo.ProUserIdRW, "0", "0");
            Session.Remove("RemoveLock");
        }
        //End here
        Response.Redirect("~/LoginPage.aspx");
    }

    #endregion

    #region Page Methods
    /// <summary>
    /// Method to load Menu from db 
    /// </summary>
    private void FunPriLoadMenu(string strModuleNameCur, string strPageName)
    {
        try
        {
            // ObjUserInfo = new UserInfo();
            ds_Menu = new DataSet();
            StringBuilder str = new StringBuilder();
            string strPath;
            if (ObjUserInfo.ProUserTypeRW == "USER")
            {
                strPath = Server.MapPath(@"~\Data\UserManagement\");
            }
            else
            {
                strPath = Server.MapPath(@"~\Data\UserManagement\UTPA\");
            }
            if (!Directory.Exists(strPath))
            {
                Directory.CreateDirectory(strPath);
            }

            if (!File.Exists(strPath + ObjUserInfo.ProUserIdRW.ToString() + ".xml"))
            {
                S3GAdminServicesReference.S3GAdminServicesClient ObjMenuLoading = new S3GAdminServicesReference.S3GAdminServicesClient();
                byte[] byte_Menu = ObjMenuLoading.FunPubGetUserMenu(ObjUserInfo.ProUserIdRW, ObjUserInfo.ProUserNameRW.ToUpper(), ObjUserInfo.ProUserTypeRW);
                ds_Menu = (DataSet)S3GBusEntity.ClsPubSerialize.DeSerialize(byte_Menu, S3GBusEntity.SerializationMode.Binary, typeof(DataSet));
                ds_Menu.WriteXml(strPath + ObjUserInfo.ProUserIdRW.ToString() + ".xml");
            }
            else
            {
                ds_Menu.ReadXml(strPath + ObjUserInfo.ProUserIdRW.ToString() + ".xml");
            }
            str.Append("<div>");
            DataTable dt = new DataTable();
            dt.Columns.Add("ProgramId", typeof(Int32));
            dt.Columns.Add("PageUrl", typeof(string));
            dt.Columns.Add("ViewPage", typeof(string));
            dt.Columns.Add("DetailPage", typeof(string));
            dt.Columns.Add("ModuleCount", typeof(Int32));
            dt.Columns.Add("ProgramCount", typeof(Int32));
            //if (ds_Menu != null && (ds_Menu.Tables.Count > 0) && (ds_Menu.Tables[0].Rows.Count > 0))
            //{
            //    if (ds_Menu.Tables.Count > 1)
            //    {Load
            //    }
            //}
            if (ds_Menu != null && (ds_Menu.Tables.Count > 0) && (ds_Menu.Tables[0].Rows.Count > 0))
            {
                if (ds_Menu.Tables.Count > 1)
                {
                    for (int intModuleCount = 0; intModuleCount < ds_Menu.Tables["Module_Header"].Rows.Count; intModuleCount++)
                    {
                        AccordionPane accpaneProgram = new AccordionPane();
                        accpaneProgram.ID = "Accpane" + intModuleCount.ToString();
                        //accpaneProgram.HeaderCssClass = "";
                        string strModuleName = ds_Menu.Tables["Module_Header"].Rows[intModuleCount].ItemArray[2].ToString();
                        if (strModuleNameCur.ToUpper() == strModuleName.ToUpper())
                        {
                            Accordion1.SelectedIndex = intModuleCount;
                        }
                        //Code Added by Kali to change module name on 23-Dec-2011
                        if (strModuleName == "LoanAdmin")
                            strModuleNameNew = "Loan Admin";
                        else if (strModuleName == "LegalRepossession")
                            strModuleNameNew = "Legal Repossession";
                        //Added by Thangam M 0n 02/Nov/2012 for TA
                        else if (strModuleName == "TradeAdvance")
                            strModuleNameNew = "Trade Advance";
                        else
                            strModuleNameNew = strModuleName;


                        LiteralControl menuicon = new LiteralControl();
                        LiteralControl Angledownicon = new LiteralControl();
                        Angledownicon.Text = "<i class='fa fa-angle-down float-right menu-angle-down' aria-hidden='true'></i>";
                        menuicon.Text = "<i class='fa fa-line-chart mr-1' aria-hidden='true'></i>";                      
                        accpaneProgram.HeaderContainer.Controls.Add(menuicon);
                        accpaneProgram.HeaderContainer.Controls.Add(new LiteralControl(strModuleNameNew));
                        accpaneProgram.HeaderContainer.Controls.Add(Angledownicon);
                        
                        //  accpaneProgram.CssClass = "card";
                        //Code End
                        //str.Append(menuicon);
                        //str.Append(strModuleNameNew);
                        str.Append("<ul id='Accpane" + intModuleCount.ToString() + "' Title='" + strModuleNameNew + "'>");
                        for (int intProgCount = 0; intProgCount < ds_Menu.Tables[strModuleName].Rows.Count; intProgCount++)
                        {
                            //LinkButton lbtnProgram = new LinkButton();
                            HtmlAnchor lbtnProgram = new HtmlAnchor();
                            Image imgMenuItems = new Image();
                            imgMenuItems.ID = "Img" + intProgCount.ToString();
                            lbtnProgram.ID = "lbtn" + intProgCount.ToString();
                            //lbtnProgram.Click += new EventHandler(lbtnProgram_Click);
                            switch (ObjUserInfo.ProUserThemeRW.ToUpper())
                            {
                                case "S3GTHEME_BLUE2":
                                    imgMenuItems.ImageUrl = "~/images/spacer.gif";
                                    break;
                                case "S3GTHEME_NIGHT":
                                    imgMenuItems.ImageUrl = "~/images/spacer.gif";
                                    break;
                                case "S3GTHEME_LIGHT":
                                    imgMenuItems.ImageUrl = "~/images/spacer.gif";
                                    break;
                                default:
                                    imgMenuItems.ImageUrl = "~/images/bullet_button.jpg";
                                    //lbtnProgram.ForeColor = System.Drawing.Color.Orange;
                                    break;
                            }
                            strMenuText = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[1].ToString();
                            string strIFramePagePath = string.Empty;
                            //if (ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[8].ToString()!=string.Empty)//Added by Sathish R for Dynamic Menu Group 23-Jun-2020
                            //{
                            //    string strModuleName_Page_Dir = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[8].ToString().Trim();
                            //    strIFramePagePath = "../" + strModuleName_Page_Dir.Trim() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                            //}
                            //else
                            //{
                            //    strIFramePagePath = "../" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                            //}
                            strIFramePagePath = "../" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                            //lbtnProgram.PostBackUrl = "~/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                            //string strIFramePagePath = "../" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                            // lbtnProgram.OnClientClick = "fnLoadIframe('" + strIFramePagePath + "', '" + imgMenuItems.ID + "')";
                            lbtnProgram.InnerText = lbtnProgram.Title = strMenuText;
                            //lbtnProgram.Attributes.Add("value" , strMenuText);

                            //lbtnProgram.Attributes.Add("onclick", "javascript:parent.CreateTabForChild('" + lbtnProgram.Text + "','" + strIFramePagePath + "');fnLoadIframe('" + imgMenuItems.ID + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');CheckTabs('" + strIFramePagePath + "');");
                            //lbtnProgram.Attributes.Add("onclick", "javascript:parent.CreateTabForChild('" + lbtnProgram.Text + "','" + strIFramePagePath + "');fnLoadIframe('" + imgMenuItems.ID + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');");
                            lbtnProgram.Attributes.Add("href", "javascript:fnLoadIframe('" + intModuleCount.ToString() + "', '" + intProgCount.ToString() + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');");
                            //lbtnProgram.Attributes.Add("href", "javascript:fnLoadIframe('" + imgMenuItems.ID + "');");
                            str.Append("<a href='javascript:fnLoadIframe('" + intModuleCount.ToString() + "', '" + intProgCount.ToString() + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');");
                            lbtnProgram.Attributes.Add("PageUrl", strIFramePagePath);
                            str.Append(" PageUrl=" + strIFramePagePath);
                            lbtnProgram.Attributes.Add("ViewPage", ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString());
                            str.Append(" ViewPage=" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString());
                            lbtnProgram.Attributes.Add("DetailPage", ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[7].ToString());
                            str.Append(" DetailPage=" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[7].ToString());
                            lbtnProgram.Attributes.Add("class", "");
                            str.Append(" class=''");
                            if (ViewState["MenuDetails"] != null)
                            {
                                dt = (DataTable)ViewState["MenuDetails"];
                            }
                            DataRow dr = dt.NewRow();
                            dr["ProgramId"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[0].ToString();
                            dr["PageUrl"] = strIFramePagePath;
                            dr["ViewPage"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                            dr["DetailPage"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[7].ToString();
                            dr["ModuleCount"] = intModuleCount.ToString();
                            dr["ProgramCount"] = intProgCount.ToString();
                            dt.Rows.Add(dr);
                            ViewState["MenuDetails"] = dt;
                            //(!string.IsNullOrEmpty(Convert.ToString(Session["CurrentPage"])) && Session["CurrentPage"].ToString() == strMenuText && strModuleName.ToUpper() == strModuleNameCur.ToUpper())

                            if ((strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[7].ToString().ToUpper()) && strModuleName.ToUpper() == strModuleNameCur.ToUpper())
                                || (strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString().ToUpper()))
                                || (strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString().Replace("_View", "_Add").ToUpper()))
                                && strModuleName.ToUpper() == strModuleNameCur.ToUpper())
                            {

                                //Session["CurrentPage"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[1].ToString();

                                switch (ObjUserInfo.ProUserThemeRW.ToUpper())
                                {
                                    case "S3GTHEME_BLUE2":
                                        imgMenuItems.ImageUrl = "~/images/Blue_2/menu_arrow_blue.gif";
                                        //lbtnProgram.ForeColor=;
                                        //lbtnProgram.Font.Bold = true;
                                        break;
                                    case "S3GTHEME_SILVER":
                                        //lbtnProgram.ForeColor = System.Drawing.Color.FromArgb(172, 174, 189);
                                        break;
                                    default:
                                        //imgMenuItems.ImageUrl = "~/images/bullet_button.jpg";
                                        //lbtnProgram.ForeColor = System.Drawing.Color.Orange;
                                        //lbtnProgram.Font.Bold = true;
                                        break;
                                }
                            }
                            LiteralControl Submenuicon = new LiteralControl();                          
                            LiteralControl Longrightarrowicon = new LiteralControl();                          
                            Longrightarrowicon.Text="<i class='fa fa-long-arrow-right ml-1 menu-right-arrow float-right' aria-hidden='true'></i>";                            
                            Submenuicon.Text = "<i class='fa fa-database mr-2' aria-hidden='true'></i>";
                            lbtnProgram.CausesValidation = false;
                            accpaneProgram.ContentContainer.Controls.Add(new LiteralControl("<li class='sub-menu-items'>"));
                            accpaneProgram.ContentContainer.Controls.Add(Submenuicon);
                            //accpaneProgram.ContentContainer.Controls.Add(imgMenuItems);
                            //accpaneProgram.ContentContainer.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;"));
                            accpaneProgram.ContentContainer.Controls.Add(lbtnProgram);
                            accpaneProgram.ContentContainer.Controls.Add(Longrightarrowicon);
                            accpaneProgram.ContentContainer.Controls.Add(new LiteralControl("<br></li>"));
                            //str.Append(Submenuicon);
                            //str.Append(imgMenuItems);
                            //str.Append(lbtnProgram);
                            str.Append("> " + strMenuText + " </a>");
                        }
                        this.Accordion1.Panes.Add(accpaneProgram);
                        //  FunPriSetPageTitle(strMenuText);
                        str.Append("</ul>");

                       // DivDynamic_Menu.InnerHtml = str.ToString();
                    }
                }
                else
                {
                    AccordionPane accpaneProgram = new AccordionPane();
                    accpaneProgram.ID = "Accpane0";
                    string strModuleName;
                    if (ObjUserInfo.ProUserTypeRW == "USER")
                    {
                        strModuleName = "System Admin";
                    }
                    else
                    {
                        strModuleName = "Menu";
                        Accordion1.SelectedIndex = 0;
                    }
                    if (strModuleNameCur.ToUpper() == strModuleName.ToUpper())
                    {
                        Accordion1.SelectedIndex = 0;
                    }
                    accpaneProgram.HeaderContainer.Controls.Add(new LiteralControl(strModuleName));
                    for (int intProgCount = 0; intProgCount < ds_Menu.Tables[strModuleName].Rows.Count; intProgCount++)
                    {
                        //LinkButton lbtnProgram = new LinkButton();
                        HtmlAnchor lbtnProgram = new HtmlAnchor();
                        Image imgMenuItems = new Image();

                        imgMenuItems.ID = "Img" + intProgCount.ToString();
                        lbtnProgram.ID = "lbtn" + intProgCount.ToString();
                        switch (ObjUserInfo.ProUserThemeRW.ToUpper())
                        {
                            case "S3GTHEME_BLUE2":
                                imgMenuItems.ImageUrl = "~/images/spacer.gif";
                                break;
                            default:
                                imgMenuItems.ImageUrl = "~/images/bullet_button.jpg";
                                //lbtnProgram.ForeColor = System.Drawing.Color.Orange;
                                break;
                        }
                        strMenuText = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[1].ToString();

                        //lbtnProgram.PostBackUrl = "~/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                        string strIFramePagePath = "../" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                        //lbtnProgram.OnClientClick = "fnLoadIframe('" + strIFramePagePath + "', '" + imgMenuItems.ClientID + "')";
                        //lbtnProgram.Text = strMenuText;
                        lbtnProgram.InnerText = lbtnProgram.Title = strMenuText;
                        //lbtnProgram.Attributes.Add("onclick", "javascript:parent.CreateTabForChild('" + lbtnProgram.Text + "','" + strIFramePagePath + "');fnLoadIframe('" + imgMenuItems.ID + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');");
                        //lbtnProgram.Attributes.Add("href", "javascript:parent.CreateTabForChild('" + lbtnProgram.InnerText + "','" + strIFramePagePath + "');fnLoadIframe('" + imgMenuItems.ClientID + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');");
                        //lbtnProgram.Attributes.Add("href", "javascript:fnLoadIframe('" + "0" + "', '" + intProgCount.ToString() + "');;");
                        lbtnProgram.Attributes.Add("href", "javascript:fnLoadIframe('" + "0" + "', '" + intProgCount.ToString() + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');");


                        lbtnProgram.Attributes.Add("PageUrl", strIFramePagePath);
                        lbtnProgram.Attributes.Add("ViewPage", ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString());
                        lbtnProgram.Attributes.Add("DetailPage", ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[7].ToString());

                        if (ViewState["MenuDetails"] != null)
                        {
                            dt = (DataTable)ViewState["MenuDetails"];
                        }
                        DataRow dr = dt.NewRow();
                        dr["ProgramId"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[0].ToString();
                        dr["PageUrl"] = strIFramePagePath;
                        dr["ViewPage"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString();
                        dr["DetailPage"] = ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[7].ToString();
                        dr["ModuleCount"] = ds_Menu.Tables["Module_Header"].Rows.Count;
                        dr["ProgramCount"] = intProgCount.ToString();
                        dt.Rows.Add(dr);
                        ViewState["MenuDetails"] = dt;

                        if ((strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[6].ToString().ToUpper()) && strModuleName.ToUpper() == strModuleNameCur.ToUpper())
                            || (strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[1].ToString().ToUpper().Replace(" ", "")))
                            || (strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString().ToUpper())) || (strPageName.ToUpper().Contains(ds_Menu.Tables[strModuleName].Rows[intProgCount].ItemArray[3].ToString().Replace("_View", "_Add").ToUpper()))
                            && strModuleName.ToUpper() == strModuleNameCur.ToUpper())
                        {

                            switch (ObjUserInfo.ProUserThemeRW.ToUpper())
                            {
                                case "S3GTHEME_BLUE2":
                                    imgMenuItems.ImageUrl = "~/images/Blue_2/menu_arrow_blue.gif";
                                    //lbtnProgram.ForeColor=;
                                    //lbtnProgram.Font.Bold = true;
                                    break;
                                case "S3GTHEME_SILVER":
                                    //lbtnProgram.ForeColor = System.Drawing.Color.FromArgb(172, 174, 189);
                                    break;
                                default:
                                    //imgMenuItems.ImageUrl = "~/images/bullet_button.jpg";
                                    //lbtnProgram.Font.Bold = true;
                                    //lbtnProgram.ForeColor = System.Drawing.Color.Orange;
                                    break;
                            }

                        }
                        lbtnProgram.CausesValidation = false;
                        accpaneProgram.ContentContainer.Controls.Add(imgMenuItems);
                        accpaneProgram.ContentContainer.Controls.Add(new LiteralControl("&nbsp;&nbsp;&nbsp;"));
                        accpaneProgram.ContentContainer.Controls.Add(lbtnProgram);
                        accpaneProgram.ContentContainer.Controls.Add(new LiteralControl("<br>"));

                    }
                    this.Accordion1.Panes.Add(accpaneProgram);

                }
            }
            else
            {
                //Changed By Thangam M on 06/Mar/2012 to fix Bug ID - 6011
                string strRedirectPageView = "window.location.href='../LoginPage.aspx';";

                File.Delete(strPath + ObjUserInfo.ProUserIdRW.ToString() + ".xml");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('No program is mapped');" + strRedirectPageView, true);
                //Response.Redirect("~/LoginPage.aspx");
                //End here
            }
            //str.Append(divMenu.InnerHtml);           

            Accordion1.SelectedIndex = -1;
            //Session["CurrentPage"] = null;
            str.Append("</div>");
        }
        catch (Exception ex)
        {
            throw new Exception("Unable to load Menu");
        }
    }

    public string DynamicMenu
    {
        get
        {
            String menu = "";
            try
            {
                if (ds_Menu != null)
                {
                    for (int intmodulecount = 0; intmodulecount < 1; intmodulecount++)//ds_Menu.Tables["Module_Header"].Rows.Count
                    {
                        string strmodulename = ds_Menu.Tables["Module_Header"].Rows[intmodulecount].ItemArray[2].ToString();

                        if (strmodulename == "LoanAdmin")
                            strModuleNameNew = "Loan Admin";
                        else if (strmodulename == "LegalRepossession")
                            strModuleNameNew = "Legal Repossession";
                        else if (strmodulename == "TradeAdvance")
                            strModuleNameNew = "Trade Advance";
                        else
                            strModuleNameNew = strmodulename;
                        menu += "<div class='card'>"+
         " <div class='card-header' id='headingOne'>"+
            "<h5 class='mb-0'>"+
            "  <button class='btn btn-link' data-toggle='collapse' data-target='#collapseOne' aria-expanded='flase' aria-controls='collapseOne'>"+
               " <i class='fa fa-line-chart mr-1' aria-hidden='true'></i>&emsp;Admin"+
            "  </button>"+
           " </h5>"+
         " </div>";

                        menu += "<div id='collapseOne' class='collapse' aria-labelledby='headingOne' data-parent='#accordion'>" +
                            "<div class='card-body'>" +
                                "<ul>";

                        //menu += "<div class='card'><div class='card-header' id='heading" + intmodulecount + "'>" +
                        //    "<h5 class='mb-0'>" +
                        //       "<button class='btn btn-link' data-toggle='collapse' data-target='#collapsenew" + intmodulecount + "' aria-expanded='false' aria-controls='collapsenew" + intmodulecount + "'>" +
                        //            " <i class='fa fa-line-chart' aria-hidden='true'></i>&emsp;" + strModuleNameNew +
                        //        " </button>" +
                        //    " </h5>" +
                        //" </div>";

                        //menu += "<div id='collapsenew" + intmodulecount + "' class='collapse' aria-labelledby='heading" + intmodulecount + "' data-parent='#accordion'>" +
                        //    "<div class='card-body'>" +
                        //        "<ul>";
                        for (int intprogcount = 0; intprogcount < ds_Menu.Tables[strmodulename].Rows.Count; intprogcount++)
                        {

                            strMenuText = ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[1].ToString();
                            string striframepagepath = "../" + ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[4].ToString() + "/" + ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[3].ToString();
                            string path11=intmodulecount.ToString() + "', '" + intprogcount.ToString();// + "');removetabbasedoncount('" + hdnTabCount.Value + "');
                            string hrefpath = "javascript:fnloadiframe('" + intmodulecount.ToString() + "', '" + intprogcount.ToString() + "');removetabbasedoncount('" + hdnTabCount.Value + "');";
                            string viewpage = ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[3].ToString();
                            string detailpage = ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[7].ToString();

                            menu += " <li><a href='rental_sechedule.html'><i class='fa fa-database' aria-hidden='true'></i>&emsp;Rental Schedule Creation</a></li>";
             

                            //menu += "<li><a href=''  pageurl='" + striframepagepath +
                            //    "'  viewpage='" + viewpage + "' detailpage='" + detailpage + "'><i class='fa fa-database' aria-hidden='true'></i>&emsp;" + strMenuText + "</a></li>";

                            //javascript:fnloadiframe('" + path11 + "');removetabbasedoncount('" + hdnTabCount.Value + "');
                            //  //lbtnprogram.attributes.add("href",
                            //"javascript:fnloadiframe('" + intmodulecount.ToString() + "', '" + intprogcount.ToString() + "');removetabbasedoncount('" + hdnTabCount.Value + "');"
                            //);
                          


                            //lbtnprogram.innertext =  lbtnProgram.Title = strmenutext;
                            //lbtnprogram.attributes.add("href", "javascript:fnloadiframe('" + intmodulecount.ToString() + "', '" + intprogcount.ToString() + "');removetabbasedoncount('" + hdnTabCount.Value + "');");
                          
                            //lbtnprogram.attributes.add("pageurl", striframepagepath);
                            //lbtnprogram.attributes.add("viewpage", ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[3].ToString());
                            //lbtnprogram.attributes.add("detailpage", ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[7].ToString());

                            ////(!string.isnullorempty(convert.tostring(session["currentpage"])) && session["currentpage"].tostring() == strmenutext && strmodulename.toupper() == strmodulenamecur.toupper())

                            //if ((strpagename.toupper().contains(ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[7].ToString().ToUpper()) && strmodulename.ToUpper() == strmodulenamecur.toupper())
                            //    || (strpagename.toupper().contains(ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[3].ToString().ToUpper()))
                            //    || (strpagename.toupper().contains(ds_Menu.Tables[strmodulename].Rows[intprogcount].ItemArray[3].ToString().ToUpper("_view", "_add").ToUpper()))
                            //    && strmodulename.toupper() == strmodulenamecur.toupper())
                            //{
                            //}
                        }
                        menu +=  "</ul>" +
                          "</div>" +
                      "</div></div>";
                       
                    }
                }

                return menu;
            }
            catch (Exception ex) { return ""; }
        }
    }

    protected void lbtnProgram_Click(object sender, EventArgs e)
    {
        Session["CurrentPage"] = ((LinkButton)sender).Text.ToString();
        Image ImgBtn = (Image)Accordion1.Panes[Accordion1.SelectedIndex].FindControl(hdnImgBtn.Value);

        ImgBtn.ImageUrl = "~/images/Blue_2/menu_arrow_blue.gif";
        ((LinkButton)sender).Font.Bold = true;
    }

    private void FunPriSetPageTitle()
    {
        try
        {
            //string strPageTitle = SiteMapPath1.Provider.CurrentNode.Description;
            //strPageTitle = "S3G - " + strPageTitle;
            //this.Page.Title = strPageTitle;
        }
        catch (Exception ex)
        {
            throw new Exception("Unable to Set page Title");
        }
    }
    //private void FunPriSetPageTitle(string strTitle)
    //{
    //    //string strPageTitle = SiteMapPath1.Provider.CurrentNode.Description;
    //    string strPageTitle = "S3G - " + strTitle;
    //    this.Page.Title = strPageTitle;
    //}

    /// <summary>
    /// Method To laod Values from Resource file
    /// </summary>
    protected void FnPubLoadControllblnameFrmResourceFile()
    {
        //lnkHome.Text = Resources.LocalizationResources.lnkHome;
        lnkAbout.Text = Resources.LocalizationResources.lnkAbout;
        lnkMore.Text = Resources.LocalizationResources.lnkMore;
        //lnkSettings.Text = Resources.LocalizationResources.lnkSettings;
        //lnkChangePassword.Text = Resources.LocalizationResources.lnkChangePassword;
        lnkHelp.Text = Resources.LocalizationResources.lnkHelp;
        lnkSignOut.Text = Resources.LocalizationResources.lnkSignOut;

        lblApplyTheme.InnerText = Resources.LocalizationResources.lblApplyTheme;
        // lblCompany.Text = Resources.LocalizationResources.lblCompany;
       // lblCompanyName.InnerText = Resources.LocalizationResources.lblCompanyName;
        lblWelcome.InnerText = Resources.LocalizationResources.lblWelcome;
        lblLastLogin.InnerText = Resources.LocalizationResources.lblLastLogin;
        //lblMarquee.InnerText = Resources.LocalizationResources.lblMarquee;
        lblMarquee.InnerText = ObjUserInfo.ProMarqueeRW;
        //command by vijayala
        ////lnkSiteMap.InnerText = Resources.LocalizationResources.lnkSiteMap;
        ////lnkAboutUs.InnerText = Resources.LocalizationResources.lnkAboutUs;
        ////lnkTerms.InnerText = Resources.LocalizationResources.lnkTerms;
        ////lnkContact.InnerText = Resources.LocalizationResources.lnkContact;
        ////lnkDisclaimer.InnerText = Resources.LocalizationResources.lnkDisclaimer;
        ////lnkPrivacy.InnerText = Resources.LocalizationResources.lnkPrivacy;
        ////lnkFooterMore.InnerText = Resources.LocalizationResources.lnkMore;
        ////lblCopyRights.InnerText = Resources.LocalizationResources.lblCopyRights;
      
    }

    #endregion

    protected void btnHidden_Click(object sender, EventArgs e)
    {
        Session["MenuIndex"] = hdnMenuLoad.Value;
    }
    protected void lnkHelp_Click(object sender, EventArgs e)
    {
       // string strFileName = "/Help/HLP_SISSL_Company_Master.chm";
        //string strScipt = "window.open('../Common/S3GDownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        string strScipt = "window.open('../Common/Common.html', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "master", strScipt, true);
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        ddlTheme.SelectedValue = ObjUserInfo.ProUserThemeRW;
        Page.Theme = ObjUserInfo.ProUserThemeRW;
    }

    [System.Web.Services.WebMethod]
    public static string[] GetProgramList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@User_ID", System.Web.HttpContext.Current.Session["AutoSuggestUserId"].ToString());
        if (System.Web.HttpContext.Current.Session["AutoSuggestUserType"].ToString() == "USER")
        {
            Procparam.Add("@Option", "3");
        }
        else if (System.Web.HttpContext.Current.Session["AutoSuggestUserType"].ToString() == "S3GUSER")
        {
            Procparam.Add("@Option", "1");
        }
        else if (System.Web.HttpContext.Current.Session["AutoSuggestUserType"].ToString() == "SYSADMIN")
        {
            Procparam.Add("@Option", "2");
        }
        else
        {
            Procparam.Add("@Option", "5");
        }
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SYSAD_GETACTIVEPROGRAMS", Procparam));

        return suggetions.ToArray();
    }
    protected void ddlProgram_Item_Selected(object Sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        dt = (DataTable)ViewState["MenuDetails"];
        string str = ddlProgram.SelectedText;
        string str1 = ddlProgram.SelectedValue;
        DataRow[] dr = dt.Select("ProgramId = " + ddlProgram.SelectedValue);
        if (dr[0]["ModuleCount"].ToString() != null && dr[0]["ProgramCount"].ToString() != null)
        {
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "fnLoadIframe('" + dr[0]["ModuleCount"].ToString() + "','" + dr[0]["ProgramCount"].ToString() + "');RemoveTabBasedOnCount('" + hdnTabCount.Value + "');", true);
            ddlProgram.Clear();
        }
        else
        {
            ddlProgram.Clear();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('No program is available');", true);
        }
    }
}
