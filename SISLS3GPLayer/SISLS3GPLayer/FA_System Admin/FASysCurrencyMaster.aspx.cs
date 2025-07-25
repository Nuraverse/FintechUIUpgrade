/// Module Name     :   System Admin
/// Screen Name     :   Currency Master
/// Created By      :   Manikandan. R
/// Created Date    :   24-JAN-2012
/// Purpose         :   To insert and update Currency master details

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
using System.ServiceModel;

#endregion [Namespace]



public partial class Sysadm_FASysCurrencyMaster : ApplyThemeForProject_FA
{
    #region Intialization
    
    int intErrCode = 0;
    int intCurrencyId = 0;
    FASession ObjFASession = new FASession();
    
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objCurrencyMasterClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable objCurrencyMaster_DataTable = null;
    FASerializationMode SerMode = FASerializationMode.Binary;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "../FA_System Admin/FASysCurrencyMaster_View.aspx";
    string strRedirectPageView = "window.location.href='../FA_System Admin/FASysCurrencyMaster_View.aspx';";
    string strRedirectPageAdd = "window.location.href='../FA_System Admin/FASysCurrencyMaster.aspx ';";
    int intCompanyID = 0;

    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    bool bClearList = false;
    //Code end
    UserInfo_FA ObjUserInfo_FA = null;
    int intUserID = 0;
    Dictionary<string, string> Procparam = null;
    string strConnectionName = "";
    #endregion

    #region PageLoad

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPubPageLoad();
        }
        catch (Exception ex)
        {
            cvCurrency.ErrorMessage = "Unable to Load Currency Master";
            cvCurrency.IsValid = false;
        }
    }

    private void FunPubPageLoad()
    {
        try
        {
            ObjUserInfo_FA = new UserInfo_FA();
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intUserID = ObjUserInfo_FA.ProUserIdRW;

            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            strConnectionName = ObjFASession.ProConnectionName;
            //Code end

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

            if (Request.QueryString["qsCurrencyId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsCurrencyId"));

                if (fromTicket != null)
                {
                    intCurrencyId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }

                strMode = Request.QueryString["qsMode"];
            }

            if (!IsPostBack)
            {

                FunBindCurrency();

                //User Authorization
                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if ((intCurrencyId > 0) && (strMode == "M"))
                {
                    //FunGetCurrencyDetails();
                    FunPriDisableControls(1);

                }
                else if ((intCurrencyId > 0) && (strMode == "Q")) // Query // Modify
                {
                    //FunGetCurrencyDetails();
                    FunPriDisableControls(-1);

                }
                else
                {
                    FunPriDisableControls(0);
                }

                //Code end

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    #endregion

    #region Events

    /// <summary>
    /// This is used to save currecny details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnSave_Click(object sender, EventArgs e)
    {
     
        try
        {
            FunPubSave();

        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            objCurrencyMasterClient.Close();
        }
    }

    /// <summary>
    /// This is used to redirect page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage);
    }

   
  

    /// <summary>
    /// This is used to Clear_FA data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnClear_Click(object sender, EventArgs e)
    {

        FunClear();
    }

    

   

    #endregion

    #region Methods

    public void FunClear()
    {
        ddlCurrencyName.SelectedIndex = 0;
        txtPrecision.Text = "";
        chkActive.Checked = true;
    }

    /// <summary>
    /// To bind Currency Name
    /// </summary>

    private void FunBindCurrency()
    {
        //LOB List
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Is_Active", "1");
            ddlCurrencyName.BindDataTable_FA(SPNames.Get_Currency_List,Procparam, new string[] { "Currency_ID", "Currency_Code", "Currency_Name" });
            
        }
        catch (Exception ex)
        {
           cvCurrency.ErrorMessage = "Unable to load Currency Name";
           throw ex;
        }

    }

    /// <summary>
    /// Function to Save Currency Master
    /// </summary>
    /// <param name=""></param>
    /// <param name=""></param>
    public void FunPubSave()
    {
       objCurrencyMasterClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
           objCurrencyMaster_DataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable();
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapRow objCurrencyMasteRow;
            objCurrencyMasteRow = objCurrencyMaster_DataTable.NewFA_SYS_CompanyCurrencyMapRow();
            objCurrencyMasteRow.Currency_ID = Convert.ToInt32(ddlCurrencyName.SelectedValue);
            objCurrencyMasteRow.Precision = Convert.ToInt32(txtPrecision.Text);
            objCurrencyMasteRow.Is_Active = chkActive.Checked;
            objCurrencyMasteRow.User_ID = intUserID;
            objCurrencyMasteRow.Txt_Date = DateTime.Now;
            objCurrencyMasteRow.Currency_Map_ID = intCurrencyId;
            objCurrencyMaster_DataTable.AddFA_SYS_CompanyCurrencyMapRow(objCurrencyMasteRow);
            FASerializationMode SerMode = FASerializationMode.Binary;

            if (intCurrencyId > 0)
            {
                intErrCode = objCurrencyMasterClient.FunPubModifyCurrencyInt(SerMode, FAClsPubSerialize.Serialize(objCurrencyMaster_DataTable, SerMode), strConnectionName);
            }
            else
            {
                intErrCode = objCurrencyMasterClient.FunPubCreateCurrencyInt(SerMode, FAClsPubSerialize.Serialize(objCurrencyMaster_DataTable, SerMode), strConnectionName);
            }

            if (intErrCode == 0)
            {
                if (intCurrencyId > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Currency details updated successfully');" + strRedirectPageView, true);
                    lblErrorMessage.Text = string.Empty;
                }
                else
                {
                    strAlert = "Currency details added successfully";
                    strAlert += @"\n\nWould you like to add one more currency?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                   
                }
            }
            else if (intErrCode == 101)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Currency Name already exist");
              
            }
            else if (intErrCode == 102)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Currency Name already active");
            }
            else if (intErrCode == 105)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Currency is already Mapped to the Company");
            }
            //lblErrorMessage.Text = string.Empty;
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

   
    /// <summary>
    /// This method is used to display Currency details
    /// </summary>
    private void FunGetCurrencyDetails()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Currency_Map_ID", intCurrencyId.ToString());
            DataTable dtCurrency = Utility_FA.GetDefaultData(SPNames.Get_Currency_Dtls, Procparam);
            if (dtCurrency.Rows.Count > 0)
            {
                DataRow drCurrRow = dtCurrency.Rows[0];
                txtPrecision.Text = drCurrRow["Precision"].ToString();
                ddlCurrencyName.SelectedValue = (drCurrRow["Currency_ID"].ToString());
                ddlCurrencyName.ClearDropDownList_FA();
                if (drCurrRow["Is_Active"].ToString() == "True")
                   chkActive.Checked = true;
                else
                   chkActive.Checked = false;
            }
          

        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
         {
            cvCurrency.ErrorMessage = objFaultExp.Detail.ProReasonRW;
         }
        catch (Exception ex)
         {
             cvCurrency.ErrorMessage = "Unable to Load Currency Master";
             cvCurrency.IsValid = false;
         }
        //finally
        // {
        //    objCurrencyMasterClient.Close();
        // }
    }

   

    private void FunPriDisableControls(int intModeID)
    {

        switch (intModeID)
        {
            case 0: // Create Mode
                if (!bCreate)
                {
                    btnSave.Enabled_False();
                }
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);

                chkActive.Enabled = false;
                chkActive.Checked = true;

                break;

            case 1: // Modify Mode
                if (!bModify)
                {
                    btnSave.Enabled_False();
                }

                FunGetCurrencyDetails();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);

                ddlCurrencyName.Enabled = false;
                chkActive.Enabled = true;

                btnClear.Enabled_False();

                break;

            case -1:// Query Mode
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPage);
                }
                FunGetCurrencyDetails();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                ddlCurrencyName.Enabled = true;
                txtPrecision.ReadOnly = true;
                chkActive.Enabled = false;
                if (bClearList)
                {
                    ddlCurrencyName.ClearDropDownList_FA();
                }
                btnClear.Enabled_False();
                btnSave.Enabled_False();

                break;
        }

    }

    //Code end

    #endregion
}
