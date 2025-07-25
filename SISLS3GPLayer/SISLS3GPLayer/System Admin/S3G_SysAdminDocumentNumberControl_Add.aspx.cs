#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Document Number Control Creation
/// Created By			: Kannan RC
/// Created Date		: 13-May-2010
/// Purpose	            : 
/// 
/// Last Updated By		: Kannan RC
/// Last Updated Date   : 12-July-2010   
/// Reason              : Add Role Access setup 
/// 
/// Last Updated By		: Gunasekar.K
/// Last Updated Date   : 12-Oct-2010   
/// Reason              : To Address the Company Level scenario
/// 
/// Last Updated By		: Gunasekar.K
/// Last Updated Date   : 15-Oct-2010   
/// Reason              : To Address the Bug Ids 1737 and 1738
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.ServiceModel;
using System.Data;
using System.Web.Security;
using System.Configuration;
using S3GBusEntity;
#endregion

public partial class System_Admin_S3G_SysAdminDocumentNumberControl_Add : ApplyThemeForProject
{
    #region Intialization
    DocMgtServicesReference.DocMgtServicesClient ObjDocumentNumberControlClient;
    DocMgtServices.S3G_SYSAD_DocumentationType_ListDataTable ObjS3G_DocTypeListDataTable = new DocMgtServices.S3G_SYSAD_DocumentationType_ListDataTable();
    DocMgtServices.S3G_SYSAD_Get_DNCDetailsDataTable ObjS3G_GetDNCDataTable = new DocMgtServices.S3G_SYSAD_Get_DNCDetailsDataTable();
    DocMgtServices.S3G_SYSAD_DNCMasterDataTable ObjS3G_DNCMasterDataTable = new DocMgtServices.S3G_SYSAD_DNCMasterDataTable();
    DocMgtServices.S3G_SYSAD_GetBatch_ListDataTable ObjS3G_BatchMasterDataTable = new DocMgtServices.S3G_SYSAD_GetBatch_ListDataTable();
    int intDocSeqId = 0;
    int intErrCode = 0;
    string _ViewMode = "";
    int intUserID = 0;
    int intCompanyID = 0;
    int inthdUserid;
    string strRedirectPageMC;
    string strMode = string.Empty;
    UserInfo ObjUserInfo = null;
    S3GSession ObjS3GSession;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bClearList = false;
    bool bMakerChecker = false;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "window.location.href='../System Admin/S3G_SysAdminDocumentNumberControl_View.aspx'";
    public string strDateFormat;
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Request.QueryString["qsDNCId"] != null)
            {

                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsDNCId"));
                strMode = Request.QueryString.Get("qsMode");
                if (fromTicket != null)
                {
                    intDocSeqId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
            }
            txtBatch.Attributes.Add("onblur", "Trim('" + txtBatch.ClientID + "');");
            ObjUserInfo = new UserInfo();

            txtEffectiveFrom.Attributes.Add("onblur", "fnDoDate(this,'" + txtEffectiveFrom.ClientID + "','" + strDateFormat + "',false,  true);");
            txtEffectiveTo.Attributes.Add("onblur", "fnDoDate(this,'" + txtEffectiveTo.ClientID + "','" + strDateFormat + "',false,  true);");

            // btnDelete.Visible = false;
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            ddlBatch.Visible = false;
            rfvddlBatch.Visible = false;
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bDelete = ObjUserInfo.ProDeleteRW;
            bMakerChecker = ObjUserInfo.ProMakerCheckerRW;

            ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;

            ceFromDate.Format = strDateFormat;                       // assigning the first textbox with the End date
            ceToDate.Format = strDateFormat;


            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();

            if (!IsPostBack)
            {
                FunProIntializeData();
                FunPriGetLOBList();
                FunPriGetBranchList();
                // FunPriGetDocTypeList();
                FunPriGetBatchList();
                ddlFinYear.FillFinancialYears();
                FunBind_Effective_To();
                /// <summary> 
                ///  This method used for set role access
                /// </summary>

                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if (((intDocSeqId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);

                }
                else if (((intDocSeqId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }

                else
                {
                    FunPriDisableControls(0);

                }

            }




            if (strMode == "M")
                txtTotalWidth.Focus();
            else
                ddlFinYear.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;

        }

    }
    #endregion

    #region Validation
    /// <summary>
    /// Validation in create and modify
    /// </summary>

    private void validtion()
    {
        ddlLOB.Enabled = false;
        ddlBranch.Enabled = false;
        ddlDocType.Enabled = false;
        ddlFinYear.Enabled = false;
        txtBatch.Enabled = false;
        txtFromNo.Enabled = false;
        //txtToNo.Enabled = false;
        txtToNo.Enabled = true;
        txtLastNo.Enabled = false;
        rfvBatch.Visible = false;
        //   rfvDocType.Visible = false;
        //rfvFinYear.Visible = false;
        //rfvFromNos.Visible = false;
        //rfvToNo.Visible = false;
        //btnDelete.Enabled = false;
        CbxActive.Enabled = true;
    }

    private void Modifyvalidtion()
    {
        ddlLOB.Enabled = false;
        ddlBranch.Enabled = false;
        ddlDocType.Enabled = false;
        ddlFinYear.Enabled = false;
        txtBatch.Enabled = false;
        txtFromNo.Enabled = true;
        txtLastNo.Enabled = false;
        txtToNo.Enabled = true;
        rfvBatch.Visible = false;
        // rfvDocType.Visible = false;
        //rfvFinYear.Visible = false;
        //rfvFromNos.Visible = false;
        //rfvToNo.Visible = false;
        txtLastNo.Text = "";

    }
    private void EnabledControls()
    {
        ddlLOB.Enabled = true;
        ddlBranch.Enabled = true;
        ddlDocType.Enabled = true;
        ddlFinYear.Enabled = true;
        txtBatch.Enabled = true;
        txtFromNo.Enabled = true;
        txtToNo.Enabled = true;
        txtToNo.Enabled = true;
        txtLastNo.Enabled = true;
        rfvBatch.Visible = true;
        //   rfvDocType.Visible = false;
        //rfvFinYear.Visible = false;
        //rfvFromNos.Visible = false;
        //rfvToNo.Visible = false;
        //btnDelete.Enabled = false;
        CbxActive.Enabled = true;
        txtEffectiveFrom.Enabled = true;
    }
    #endregion

    #region Page Methods

    private void FunPriGetLOBList()
    {
        try
        {
            /*
            CompanyMgtServices.S3G_SYSAD_LOBMasterRow ObjLOBMasterRow;
            ObjLOBMasterRow = ObjS3G_LOBMasterListDataTable.NewS3G_SYSAD_LOBMasterRow();
            ObjLOBMasterRow.Company_ID = intCompanyID;        
            if (intDocSeqId == 0)
            {
                ObjLOBMasterRow.Is_Active = true;
            }
            ObjS3G_LOBMasterListDataTable.AddS3G_SYSAD_LOBMasterRow(ObjLOBMasterRow);

            objLOB_MasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            SerializationMode SerMode = SerializationMode.Binary;

            byte[] bytesLOBListDetails = objLOB_MasterClient.FunPubQueryLOB_LIST(SerMode, ClsPubSerialize.Serialize(ObjS3G_LOBMasterListDataTable, SerMode));
            ObjS3G_LOBMasterListDataTable = (CompanyMgtServices.S3G_SYSAD_LOBMasterDataTable)ClsPubSerialize.DeSerialize(bytesLOBListDetails, SerializationMode.Binary, typeof(CompanyMgtServices.S3G_SYSAD_LOBMasterDataTable));

            ddlLOB.FillDataTable(ObjS3G_LOBMasterListDataTable, ObjS3G_LOBMasterListDataTable.LOB_IDColumn.ColumnName, ObjS3G_LOBMasterListDataTable.LOBCode_LOBNameColumn.ColumnName);
            objLOB_MasterClient.Close();
            */

            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (intDocSeqId == 0)
            {
                dictParam.Add("@Is_Active", "1");
            }
            //--Added by Guna on 15th-Oct-2010 to address the Bud -1738
            //if (strMode != "M" && strMode != "Q")
            //{
            //    dictParam.Add("@User_ID", ObjUserInfo.ProUserIdRW.ToString());
            //}
            dictParam.Add("@Program_ID", "10");
            ////dictParam.Add("@User_ID", ObjUserInfo.ProUserIdRW.ToString());
            //--Ends Here

            ddlLOB.BindDataTable("S3G_Get_LOB_LIST", dictParam, new string[] { "LOB_ID", "LOB_Name" });
            ddlLOB.AddItemToolTip();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Line of Business");
        }


    }

    private void FunPriGetBranchList()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (intDocSeqId == 0)
            {
                dictParam.Add("@Is_Active", "1");
            }

            //--Added by Guna on 15th-Oct-2010 to address the Bud -1738
            //if (strMode != "M" && strMode != "Q")
            //{
            //    dictParam.Add("@User_ID", ObjUserInfo.ProUserIdRW.ToString());
            //}
            dictParam.Add("@User_ID", ObjUserInfo.ProUserIdRW.ToString());
            dictParam.Add("@Option", "1");
            //--Ends Here
            dictParam.Add("@Program_ID", "10");
            //ddlBranch.BindDataTable("S3G_Get_Branch_List", dictParam, new string[] { "Location_ID", "Location" });
            ddlBranch.BindDataTable("S3G_GET_LOCATION", dictParam, new string[] { "BRANCH_ID", "BRANCH" });
            ddlBranch.AddItemToolTip();
            //.BindDataTable("S3G_Get_LOB_LIST", dictParam, new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
            //CompanyMgtServices.S3G_SYSAD_Branch_ListRow ObjBranchListRow;
            //ObjBranchListRow = ObjS3G_BranchList.NewS3G_SYSAD_Branch_ListRow();
            //ObjBranchListRow.Company_ID = intCompanyID;
            //ObjS3G_BranchList.AddS3G_SYSAD_Branch_ListRow(ObjBranchListRow);
            //objBranchList_MasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            //SerializationMode SerMode = SerializationMode.Binary;
            //byte[] bytesBranchListDetails = objBranchList_MasterClient.FunPubBranch_List(SerMode, ClsPubSerialize.Serialize(ObjS3G_BranchList, SerMode));
            //ObjS3G_BranchList = (CompanyMgtServices.S3G_SYSAD_Branch_ListDataTable)ClsPubSerialize.DeSerialize(bytesBranchListDetails, SerializationMode.Binary, typeof(CompanyMgtServices.S3G_SYSAD_Branch_ListDataTable));
            //ddlBranch.FillDataTable(ObjS3G_BranchList, ObjS3G_BranchList.Branch_IDColumn.ColumnName.Trim(), ObjS3G_BranchList.BranchColumn.ColumnName.Trim());

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Branch");
        }
    }

    private void FunPriGetDocTypeList()
    {
        ObjDocumentNumberControlClient = new DocMgtServicesReference.DocMgtServicesClient();
        try
        {
            DocMgtServices.S3G_SYSAD_DocumentationType_ListRow ObjDocTypeListRow;
            ObjDocTypeListRow = ObjS3G_DocTypeListDataTable.NewS3G_SYSAD_DocumentationType_ListRow();
            ObjS3G_DocTypeListDataTable.AddS3G_SYSAD_DocumentationType_ListRow(ObjDocTypeListRow);
            SerializationMode SerMode = SerializationMode.Binary;
            byte[] bytesDocTypeListDetails = ObjDocumentNumberControlClient.FunPubDocTypeList(SerMode, ClsPubSerialize.Serialize(ObjS3G_DocTypeListDataTable, SerMode));
            ObjS3G_DocTypeListDataTable = (DocMgtServices.S3G_SYSAD_DocumentationType_ListDataTable)ClsPubSerialize.DeSerialize(bytesDocTypeListDetails, SerializationMode.Binary, typeof(DocMgtServices.S3G_SYSAD_DocumentationType_ListDataTable));
            //ddlDocType.FillDataTable(ObjS3G_DocTypeListDataTable, ObjS3G_DocTypeListDataTable.Document_Type_IDColumn.ColumnName.Trim(), ObjS3G_DocTypeListDataTable.DocumenTypeColumn.ColumnName.Trim());
            //ddlDocType.AddItemToolTip();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Document Type");
        }
        finally
        {
            // if (ObjDocumentNumberControlClient != null)
            ObjDocumentNumberControlClient.Close();
        }
    }

    private void GetDateYear()
    {
        try
        {
            ListItem liPSelect = new ListItem(((DateTime.Now.Year - 1) + "-" + (DateTime.Now.Year)), "1");
            ddlFinYear.Items.Insert(1, liPSelect);

            ListItem liCSelect = new ListItem(((DateTime.Now.Year) + "-" + (DateTime.Now.Year + 1)), "1");
            ddlFinYear.Items.Insert(2, liCSelect);

            ListItem liNSelect = new ListItem(((DateTime.Now.Year + 1) + "-" + (DateTime.Now.Year + 2)), "1");
            ddlFinYear.Items.Insert(3, liNSelect);


        }
        catch (Exception exp)
        {

            ClsPubCommErrorLogDB.CustomErrorRoutine(exp);
            lblErrorMessage.Text = exp.Message;
        }

    }

    private void FunPriGetBatchList()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            ddlBatch.BindDataTable("S3G_GetBatch_List", dictParam, new string[] { "Doc_Number_Seq_ID", "Batch" });
            ListItem lit = new ListItem("--Add Batch--", "-1");
            ddlBatch.Items.Insert(ddlBatch.Items.Count, lit);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Batch");
        }

    }

    #region Get DNC
    /// <summary>
    /// Get DNC Details 
    /// </summary>
    private void FunGetEscalationDetatils()
    {
        ObjDocumentNumberControlClient = new DocMgtServicesReference.DocMgtServicesClient();
        try
        {
            DocMgtServices.S3G_SYSAD_Get_DNCDetailsRow ObjDNCDetailsRow;
            ObjDNCDetailsRow = ObjS3G_GetDNCDataTable.NewS3G_SYSAD_Get_DNCDetailsRow();
            ObjDNCDetailsRow.Doc_Number_Seq_ID = intDocSeqId;
            ObjS3G_GetDNCDataTable.AddS3G_SYSAD_Get_DNCDetailsRow(ObjDNCDetailsRow);

            SerializationMode SerMode = SerializationMode.Binary;
            byte[] byteDNCDetails = ObjDocumentNumberControlClient.FunPubGetDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_GetDNCDataTable, SerMode));
            ObjS3G_GetDNCDataTable = (DocMgtServices.S3G_SYSAD_Get_DNCDetailsDataTable)ClsPubSerialize.DeSerialize(byteDNCDetails, SerializationMode.Binary, typeof(DocMgtServices.S3G_SYSAD_Get_DNCDetailsDataTable));
            //if (ObjS3G_GetDNCDataTable.Rows[0]["LOB"].ToString() == "0 - 0")
            //{
            //    ddlLOB.SelectedItem.Text = "--Select--";
            //}
            //else
            //{
            //    ddlLOB.SelectedValue = ObjS3G_GetDNCDataTable.Rows[0]["LOB_ID"].ToString();
            //}

            //if (ObjS3G_GetDNCDataTable.Rows[0]["Location"].ToString() == "0 - 0")
            //{
            //    ddlBranch.SelectedItem.Text = "--Select--";
            //}
            //else
            //{
            //    ddlBranch.SelectedValue = ObjS3G_GetDNCDataTable.Rows[0]["Location_ID"].ToString();
            //}
            //ddlDocType.SelectedValue = ObjS3G_GetDNCDataTable.Rows[0]["Document_Type_ID"].ToString();
            //ddlDocType.SelectedText = ObjS3G_GetDNCDataTable.Rows[0]["DESCS"].ToString();

            //if (string.IsNullOrEmpty(ObjS3G_GetDNCDataTable.Rows[0]["Fin_Year"].ToString()))
            //{
            //    ddlFinYear.SelectedItem.Text = "--Select--";
            //}
            //else
            //{
            //    ddlFinYear.SelectedItem.Text = ObjS3G_GetDNCDataTable.Rows[0]["Fin_Year"].ToString();
            //}

            //txtBatch.Text = ObjS3G_GetDNCDataTable.Rows[0]["Batch"].ToString();
            //txtFromNo.Text = ObjS3G_GetDNCDataTable.Rows[0]["From_Number"].ToString();
            //txtToNo.Text = ObjS3G_GetDNCDataTable.Rows[0]["To_Number"].ToString();
            //txtLastNo.Text = ObjS3G_GetDNCDataTable.Rows[0]["Last_Used_Number"].ToString();
            //hdnID.Value = ObjS3G_GetDNCDataTable.Rows[0]["Created_By"].ToString();
            //if (ObjS3G_GetDNCDataTable.Rows[0]["Is_Active"].ToString() == "True")
            //    CbxActive.Checked = true;
            //else
            //    CbxActive.Checked = false;

            //if (txtLastNo.Text == "0")
            //{
            //    Modifyvalidtion();
            //}
            //else
            //{
            //    validtion();
            //}

            //validtion();
            txtToNo.Enabled = true;



            //Binding Grid Start

            DataTable dt = ObjS3G_GetDNCDataTable;// (DataTable)ViewState["DetailsTable"];
            ViewState["DetailsTable"] = dt;
            gvDocDetails.DataSource = dt;
            gvDocDetails.DataBind();
            gvDocDetails.Columns[19].Visible = false; // Set visible false for delete button


            if (gvDocDetails.Rows.Count > 0)
                hdnDocID.Value = dt.Rows[0]["Doc_Number_Seq_ID"].ToString();

            //Binding Grid End


        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objFaultExp);
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            // if(ObjDocumentNumberControlClient!=null)
            ObjDocumentNumberControlClient.Close();
        }
    }

    #endregion

    private bool FunCheckLobisvalid(string strLobId)
    {
        bool blnResult = false;
        try
        {
            Dictionary<string, string> Procparm = new Dictionary<string, string>();
            Procparm.Add("@Company_ID", intCompanyID.ToString());
            Procparm.Add("@User_Id", intUserID.ToString());
            Procparm.Add("@LOB_ID", strLobId);
            if (intDocSeqId == 0)
            {
                Procparm.Add("@Is_Active", "1");
            }
            Procparm.Add("@Is_UserLobActive", "1");
            Procparm.Add("@Program_ID", "10");
            DataTable dtBool = Utility.GetDefaultData("S3G_GetUserLobMapping", Procparm);
            if (dtBool.Rows[0]["EXISTS"].ToString() == "1")
                blnResult = true;
            else
                blnResult = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        return blnResult;

    }

    private bool FunCheckBranchisvalid(string strBranchId)
    {
        bool blnResult = false;
        try
        {
            Dictionary<string, string> Procparm = new Dictionary<string, string>();
            Procparm.Add("@Company_ID", intCompanyID.ToString());
            Procparm.Add("@User_Id", intUserID.ToString());
            Procparm.Add("@Location_ID", strBranchId);
            if (intDocSeqId == 0)
            {
                Procparm.Add("@Is_Active", "1");
            }
            Procparm.Add("@Program_ID", "10");
            Procparm.Add("@Is_UserLobActive", "1");
            DataTable dtBool = Utility.GetDefaultData("S3G_GetUserBranchMapping", Procparm);
            if (dtBool.Rows[0]["EXISTS"].ToString() == "1")
                blnResult = true;
            else
                blnResult = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        return blnResult;

    }

    #region ValueDisable
    /// <summary>
    /// this method using role access
    /// </summary>
    /// <param name="intModeID"></param>
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    if (!bCreate)
                    {
                        //btnSave.Enabled_False();
                    }
                    CbxActive.Checked = true;
                    CbxActive.Enabled = false;
                    txtLastNo.Enabled = false;
                    // rfvDocType.Visible = true;
                    //rfvFinYear.Visible = true;
                    // btnDelete.Visible = false;
                    ddlBatch.Visible = false;
                    CbxActive.Enabled = false;
                    // btnAdd.Visible = true;
                    cbIncludeCharSet.Checked = true;
                    btnModify.Visible = false;

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    break;

                case 1: // Modify Mode
                    if (!bModify)
                    {
                        // btnSave.Enabled_False();
                    }
                    CbxActive.Enabled = true;
                    FunGetEscalationDetatils();
                    btnClear.Enabled_False();
                    // btnDelete.Visible = true;
                    ddlBatch.Visible = false;
                    btnAdd.Visible = true;
                    btnModify.Visible = false;
                    cbIncludeCharSet.Enabled = false;

                  

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    break;

                case -1:// Query Mode
                    FunGetEscalationDetatils();
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageView);
                    }


                    CbxActive.Enabled = false;
                    cbIncludeCharSet.Enabled = false;
                    ddlFinYear.Enabled = true;
                    ddlDocType.Enabled = true;
                    ddlBranch.Enabled = true;
                    ddlLOB.Enabled = true;
                    txtFromNo.ReadOnly = true;
                    txtLastNo.ReadOnly = true;
                    txtToNo.ReadOnly = true;
                    txtBatch.ReadOnly = true;
                    txtBatch.Enabled = true;
                    txtFromNo.Enabled = true;
                    txtLastNo.Enabled = true;
                    txtToNo.Enabled = true;
                    // btnDelete.Visible = false;
                    //    btnSave.Enabled_False();
                    btnClear.Enabled_False();
                    btnAdd.Visible = false;
                    btnModify.Visible = false;
                    btnSave.Enabled_False();
                    txtEffectiveFrom.Enabled = false;
                    txtEffectiveTo.Enabled = false;
                    if (bClearList)
                    {
                        ddlLOB.ClearDropDownList();
                        ddlBranch.ClearDropDownList();
                        //ddlDocType.ClearDropDownList();
                        ddlDocType.Enabled = false;
                        ddlFinYear.ClearDropDownList();
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    gvDocDetails.Enabled = false;
                    pnlDocumentDetails.Enabled = false;
                    btnModify.Enabled_False();
                    btnModify.Disabled = true;
                   
                    break;
            }
        }
        catch (Exception ex)
        {

            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }

    }
    #endregion

    #endregion

    #region Page Events

    #region Save/Delete/Clear
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../System Admin/S3G_SysAdminDocumentNumberControl_View.aspx");
            btnCancel.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    #region Create DNC
    /// <summary>
    /// Create New DNC Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ObjDocumentNumberControlClient = new DocMgtServicesReference.DocMgtServicesClient();

        try
        {
            if (gvDocDetails.Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "NoEdit", "alert('Add atleast one record to save.');", true);
                return;
            }

            SerializationMode SerMode = SerializationMode.Binary;

            string strKey = "Insert";
            string strAlert = "alert('__ALERT__');";
            string strRedirectPageView = "window.location.href='../System Admin/S3G_SysAdminDocumentNumberControl_View.aspx';";
            string strRedirectPageAdd = "window.location.href='../System Admin/S3G_SysAdminDocumentNumberControl_Add.aspx';";

            DocMgtServices.S3G_SYSAD_DNCMasterRow ObjDNCMasterRow;
            ObjDNCMasterRow = ObjS3G_DNCMasterDataTable.NewS3G_SYSAD_DNCMasterRow();

            ObjDNCMasterRow.Company_ID = intCompanyID;
            ObjDNCMasterRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
            ObjDNCMasterRow.Branch_ID = Convert.ToInt32(ddlBranch.SelectedValue);
            ObjDNCMasterRow.Document_Type_ID = Convert.ToInt32(ddlDocType.SelectedValue);
            if (ddlFinYear.SelectedIndex > 0)
                ObjDNCMasterRow.Fin_Year = ddlFinYear.SelectedItem.Text;
            else
                ObjDNCMasterRow.Fin_Year = "";
            ObjDNCMasterRow.Batch = txtBatch.Text;
            ObjDNCMasterRow.From_Number = Convert.ToDecimal(0);
            ObjDNCMasterRow.To_Number = Convert.ToDecimal(0);

            //Modified by Nataraj Y on 29/10/2010 To address the Company Level Scenario
            if (Convert.ToInt32(ddlLOB.SelectedValue) == 0 && Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "C";
            }
            //ends here
            else if (Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "L";
            }
            else if (Convert.ToInt32(ddlLOB.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "B";
            }
            else if (Convert.ToInt32(ddlLOB.SelectedValue) != 0 && Convert.ToInt32(ddlBranch.SelectedValue) != 0)
            {
                ObjDNCMasterRow.Level = "S";
            }
            //-----Added By Guna on 12-Oct-2010 To address the Company Level Scenario
            //if (Convert.ToInt32(ddlLOB.SelectedValue) == 0 && Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            //{
            //    ObjDNCMasterRow.Level = "C";
            //}
            //-- Ends Here 

            if (txtLastNo.Text == "")
            {
                ObjDNCMasterRow.Last_Used_Number = "0";
            }
            else
            {
                ObjDNCMasterRow.Last_Used_Number = txtLastNo.Text;                //validtion();
                //cvDNC.ErrorMessage = "Cannot modify this Document Number, its already used in some transaction.";
            }


            ObjDNCMasterRow.Created_By = intUserID;
            ObjDNCMasterRow.Created_On = DateTime.Now;
            ObjDNCMasterRow.Doc_Number_Seq_ID = intDocSeqId;
            ObjDNCMasterRow.Modified_By = intUserID;
            ObjDNCMasterRow.Modified_On = DateTime.Now;
            ObjDNCMasterRow.Is_Active = CbxActive.Checked;
            ObjDNCMasterRow.Type = "I";
            ObjDNCMasterRow.XML_Doc_Details = gvDocDetails.FunPubFormXml().Replace("nbsp;", ""); ;

            ObjS3G_DNCMasterDataTable.AddS3G_SYSAD_DNCMasterRow(ObjDNCMasterRow);

            if (intDocSeqId > 0)
            {
                if (Convert.ToInt32(ddlLOB.SelectedValue) > 0)
                {
                    if (FunCheckLobisvalid(ddlLOB.SelectedValue))
                    {

                        intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));
                    }
                    else
                    {
                        strAlert = strAlert.Replace("__ALERT__", "Selected Line of Business rights not assigned");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                        return;
                    }
                }
                else
                {
                    intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));
                }


                if (Convert.ToInt32(ddlBranch.SelectedValue) > 0)
                {
                    if (FunCheckBranchisvalid(ddlBranch.SelectedValue))
                    {

                        intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));
                    }
                    else
                    {
                        strAlert = strAlert.Replace("__ALERT__", "Selected Branch rights not assigned");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                        return;
                    }
                }
                //else
                //{
                //    intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));
                //}


            }
            else
            {
                intErrCode = ObjDocumentNumberControlClient.FunPubCreateDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));
            }
            if (intErrCode == 0)
            {
                if (intDocSeqId > 0)
                {
                    //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                    btnSave.Enabled_False();
                    //End here
                    strKey = "Modify";
                    strAlert = strAlert.Replace("__ALERT__", "Document Number Control details updated successfully");
                }
                else
                {
                    //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                    btnSave.Enabled_False();
                    //End here
                    strAlert = "Document Number Control details added successfully";
                    strAlert += @"\n\nWould you like to add one more record?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    CbxActive.Checked = true;
                }
            }
            //else if (intErrCode == 1)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
            //    strRedirectPageView = "";
            //}

            //else if (intErrCode == 2)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
            //    strRedirectPageView = "";
            //}
            //else if (intErrCode == 3)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
            //    strRedirectPageView = "";
            //}

            //else if (intErrCode == 4)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists.");
            //    strRedirectPageView = "";
            //}

            //else if (intErrCode == 5)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Enter the To Number greater than From Number");
            //    strRedirectPageView = "";
            //}
            //else if (intErrCode == 6)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Enter the From Number and To Number already exists this selected year");
            //    strRedirectPageView = "";
            //}

            //else if (intErrCode == 7)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
            //    strRedirectPageView = "";
            //    //Deactivate the active indicator and insert for that combination of Company and Line of Business and Branch wise
            //}

            //else if (intErrCode == 8)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
            //    strRedirectPageView = "";
            //    //Deactivate the active indicator and insert for that combination of Company and Line of business wise
            //}
            //else if (intErrCode == 9)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
            //    strRedirectPageView = "";
            //    //Deactivate the active indicator and insert for that combination of company and branch wise         
            //}
            //else if (intErrCode == 19)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Financial year to be mapped");
            //    strRedirectPageView = "";
            //    //Deactivate the active indicator and insert for that combination of company and branch wise         
            //}
            //else if (intErrCode == 20)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Batch Number already exists");
            //    strRedirectPageView = "";
            //    //Deactivate the active indicator and insert for that combination of company and branch wise         
            //}
            //else if (intErrCode == 21)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be defined for closed Financial Year");
            //    strRedirectPageView = "";
            //}
            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Error in saving document sequence number");
                strRedirectPageView = "";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            lblErrorMessage.Text = string.Empty;
            btnSave.Focus();//Added by Suseela
        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objFaultExp);
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjDocumentNumberControlClient.Close();
        }
    }
    #endregion

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        ObjDocumentNumberControlClient = new DocMgtServicesReference.DocMgtServicesClient();
        try
        {
            string strAlert = "alert('__ALERT__');";
            string strKey = "Insert";
            string strRedirectPageView = "window.location.href='../System Admin/S3G_SysAdminDocumentNumberControl_View.aspx';";
            string strRedirectPageAdd = "window.location.href='../System Admin/S3G_SysAdminDocumentNumberControl_Add.aspx';";


            DocMgtServices.S3G_SYSAD_Get_DNCDetailsRow ObjDNCDetailsRow;
            ObjDNCDetailsRow = ObjS3G_GetDNCDataTable.NewS3G_SYSAD_Get_DNCDetailsRow();
            ObjDNCDetailsRow.Doc_Number_Seq_ID = intDocSeqId;

            intErrCode = ObjDocumentNumberControlClient.FunPubDeleteDNCDetails(intDocSeqId);
            // strAlert = strAlert.Replace("__ALERT__", "Document Number details deleted Successfully");
            if (intErrCode == 0)
            {
                if (intDocSeqId > 0)
                {
                    //strKey = "Modify";
                    strAlert = strAlert.Replace("__ALERT__", "Document Number details deleted Successfully");
                }
            }
            else if (intErrCode == 1)
            {
                strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be deleted,since the sequence has been used");
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            lblErrorMessage.Text = string.Empty;
            //btnDelete.Focus();//Added by Suseela
        }
        catch (FaultException<DocMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objFaultExp);
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            // if(ObjDocumentNumberControlClient!=null)
            ObjDocumentNumberControlClient.Close();
        }

    }
    /// <summary>
    /// Clear the all user enterable details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            ddlLOB.SelectedIndex = 0;
            ddlBranch.SelectedIndex = 0;
            ddlFinYear.SelectedIndex = 0;
            ddlDocType.SelectedText = "--Select--";
            txtBatch.Text = "";
            txtFromNo.Text = "";
            txtToNo.Text = "";
            txtLastNo.Clear();
            cbIncludeCharSet.Checked = false;
            CbxActive.Checked = true;
            txtTotalWidth.Clear();
            txtEffectiveFrom.Clear();
            // txtEffectiveTo.Clear();

            ViewState["DetailsTable"] = null;
            gvDocDetails.DataSource = null;
            gvDocDetails.DataBind();

            txtEffectiveTo.Text = Convert.ToString(ViewState["Effective_To"]);

            ddlFinYear.Focus();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    #endregion

    #region Dropdown List
    /// <summary>
    /// selected change value using branch
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlBatch_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(ddlBatch.SelectedValue) == -1)
            {
                txtBatch.Enabled = true;
            }
            else
            {
                txtBatch.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    #endregion


    #endregion

    protected void FunProIntializeData()
    {
        try
        {
            DataTable dtDocDetails;
            dtDocDetails = new DataTable("DocDetails");
            dtDocDetails.Columns.Add("Doc_Number_Seq_ID");
            dtDocDetails.Columns.Add("Fin_Year");
            dtDocDetails.Columns.Add("LOB_ID");
            dtDocDetails.Columns.Add("LOB");
            dtDocDetails.Columns.Add("Location_ID");
            dtDocDetails.Columns.Add("Location");
            dtDocDetails.Columns.Add("Document_Type_ID");
            dtDocDetails.Columns.Add("Document_Type_Desc");
            dtDocDetails.Columns.Add("TotalWidth");
            dtDocDetails.Columns.Add("IncludeCharSet");
            dtDocDetails.Columns.Add("Batch");
            dtDocDetails.Columns.Add("From_Number");
            dtDocDetails.Columns.Add("To_Number");
            dtDocDetails.Columns.Add("Last_Used_Number");
            dtDocDetails.Columns.Add("EffectiveFrom");
            dtDocDetails.Columns.Add("EffectiveTo");
            dtDocDetails.Columns.Add("ModifyDoc");
            dtDocDetails.Columns.Add("Doc_Level");
            dtDocDetails.Columns.Add("Active");
            ViewState["DetailsTable"] = dtDocDetails;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new Exception("Unable to Intialize data");
        }
    }
    protected void FunClearDocDetails()
    {
        ddlFinYear.SelectedIndex = 0;
        ddlLOB.SelectedIndex = 0;
        ddlBranch.SelectedIndex = 0;
        ddlDocType.SelectedText = "--Select--";
        txtTotalWidth.Text = "";
        txtBatch.Text = "";
        txtFromNo.Text = "";
        txtToNo.Text = "";
        txtEffectiveFrom.Text = "";
        cbIncludeCharSet.Checked = false;
        cbModDoc.Checked = false;
        btnAdd.Enabled_True();
        btnModify.Enabled_False();
    }

    

    private bool funPriDateOverlap(DateTime strFromdate, DateTime strToDate, DataTable dvDocDetails2, string strDoc_Number_Seq_ID)
    {
        bool Ireturn = false;
        try
        {

            DateTime StartDate1 = new DateTime();
            DateTime EndDate1 = new DateTime();
            DateTime StartDate2 = new DateTime();
            DateTime EndDate2 = new DateTime();

            StartDate1 = strFromdate;
            EndDate1 = strToDate;



            //You would validate it as follows
            DataRow[] dr2 = dvDocDetails2.Select("Doc_Number_Seq_ID<>'" + strDoc_Number_Seq_ID + "'");

            if (dr2.Length > 0)
            {

                foreach (DataRow dr in dr2.CopyToDataTable().Rows)
                {

                    StartDate2 = Utility.StringToDate(dr["EffectiveFrom"].ToString());
                    EndDate2 = Utility.StringToDate(dr["EffectiveTo"].ToString());


                    //if (StartDate2 >= StartDate1 && StartDate2 <= EndDate1 || EndDate1 >= StartDate1 && EndDate1 <= EndDate2)
                    //{
                    //    Utility.FunShowAlertMsg(this, "From Date and To Date should not Overlap");
                    //    Ireturn = false;
                    //}
                    //else
                    //{
                    //    Ireturn = true;
                    //}

                    if (StartDate2 <= EndDate1 && EndDate2 >= StartDate1)
                    {
                        Utility.FunShowAlertMsg(this, "From Date and To Date should not Overlap");
                        Ireturn = false;
                    }
                    else
                    {
                        Ireturn = true;
                    }
                }
            }
            else
            {
                Ireturn = true;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return Ireturn;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ObjDocumentNumberControlClient = new DocMgtServicesReference.DocMgtServicesClient();

        try
        {
            //Validation Start
            bool bNumberValidation = false;
            DocMgtServices.S3G_SYSAD_DNCMasterRow ObjDNCMasterRow;
            //--Added by Guna on 15th-Oct-2010 to address the Bug ID 1737


            string[] str = ddlFinYear.SelectedValue.Split('-');
            if (ddlFinYear.SelectedValue != "0")
            {
                if (str.Length > 0)
                {
                    string strYear = str[0].ToString();
                    string strValidateYear = "01/01/" + strYear;
                    string strValidateYearTo = "31/12/" + strYear;
                    DateTime strCurrentYearDate = Utility.StringToDate(strValidateYear);

                    DateTime dtstrValidateYearTo = Utility.StringToDate(strValidateYearTo);


                    if (Utility.StringToDate(txtEffectiveFrom.Text).Year.ToString() != strYear)
                    {
                        Utility.FunShowAlertMsg(this, "Effective From and To Date should be with in the Financial Year");
                        return;
                    }

                    if (Utility.StringToDate(txtEffectiveTo.Text).Year.ToString() != strYear)
                    {
                        Utility.FunShowAlertMsg(this, "Effective From and To Date should be with in the Financial Year");
                        return;
                    }

                    //&& strCurrentYearDate <= Utility.StringToDate(txtEffectiveTo.Text))

                }
            }


          
           

            if (ddlDocType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Document Type");
                ddlDocType.Focus();
                return;

            }

            if (!string.IsNullOrEmpty(txtEffectiveTo.Text))
            {
                if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
                {
                    Utility.FunShowAlertMsg(this, "Effective To Date cannot be lesser than System Date.");
                    txtEffectiveTo.Text = string.Empty;

                    return;
                }
                if (txtEffectiveTo.Text != string.Empty && txtEffectiveFrom.Text != string.Empty)
                {
                    if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(txtEffectiveFrom.Text))
                    {
                        Utility.FunShowAlertMsg(this, "Effective To Date should be greater than or equal to Effective From Date");
                        txtEffectiveTo.Text = string.Empty;

                        return;
                    }
                }
            }


            if ((Convert.ToInt64(txtFromNo.Text) == 0) && (Convert.ToInt64(txtToNo.Text) == 0))
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 1);
                return;
            }
            //--Ends Here
            if (Convert.ToInt64(txtFromNo.Text) == 0)
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 2);
                return;
            }
            if (Convert.ToInt64(txtToNo.Text) == 0)
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 3);
                return;
            }
            if (bNumberValidation == true)
            {
                return;
            }

            if (Convert.ToInt64(txtFromNo.Text) == Convert.ToInt64(txtToNo.Text))
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 4);
                return;
            }


            if (Convert.ToInt64(txtFromNo.Text) > Convert.ToInt64(txtToNo.Text))
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 4);
                return;
            }

            if (intDocSeqId > 0)
            {
                cvDNC.ErrorMessage = "";
            }
            else
            {
                //-----Commend By Guna on 12-Oct-2010 To address the Company Level Scenario
                //-----Commend the Below lines
                ////if (ddlBranch.SelectedValue == "0" && ddlLOB.SelectedValue == "0")
                ////{
                ////    cvDNC.ErrorMessage = "Select the Line of Business or Branch";
                ////    cvDNC.IsValid = false;
                ////    return;
                ////}
                //----Ends Here
            }

            //Total Width Validation Start
            if (txtBatch.Text.Length > 0)
            {
                int count = txtBatch.Text.Length + txtToNo.Text.Length;
                if (Convert.ToInt32(txtTotalWidth.Text) != count)
                {
                    Utility.FunShowValidationMsg(this.Page, "SA_DNC", 5);
                    return;
                }
            }

            //Total Width Validation End

            //-----Added By kannan RC on 14-dec-2010 To Last used number case
            if (intDocSeqId > 0)
            {
                if (txtLastNo.Text.Length > 0)
                {
                    if (Convert.ToInt64(txtLastNo.Text) > Convert.ToInt64(txtToNo.Text))
                    {
                        Utility.FunShowValidationMsg(this.Page, "SA_DNC", 6);
                        return;
                    }
                    if (Convert.ToInt64(txtLastNo.Text) == Convert.ToInt64(txtToNo.Text))
                    {
                        Utility.FunShowValidationMsg(this.Page, "SA_DNC", 6);
                        return;
                    }
                }

            }
            //---End here
            //Validation End


            ObjDNCMasterRow = ObjS3G_DNCMasterDataTable.NewS3G_SYSAD_DNCMasterRow();

            //Modified by Nataraj Y on 29/10/2010 To address the Company Level Scenario
            if (Convert.ToInt32(ddlLOB.SelectedValue) == 0 && Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "C";
            }
            //ends here
            else if (Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "L";
            }
            else if (Convert.ToInt32(ddlLOB.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "B";
            }
            else if (Convert.ToInt32(ddlLOB.SelectedValue) != 0 && Convert.ToInt32(ddlBranch.SelectedValue) != 0)
            {
                ObjDNCMasterRow.Level = "S";
            }
            //-----Added By Guna on 12-Oct-2010 To address the Company Level Scenario
            //if (Convert.ToInt32(ddlLOB.SelectedValue) == 0 && Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            //{
            //    ObjDNCMasterRow.Level = "C";
            //}
            //-- Ends Here 



            DataRow drDetails;
            DataTable dtDocDetails = (DataTable)ViewState["DetailsTable"];
            if (dtDocDetails.Rows.Count < 10)
            {
                //grvBankDetails
                drDetails = dtDocDetails.NewRow();
                drDetails["Doc_Number_Seq_ID"] = "0";

                if (ddlFinYear.SelectedItem.Text == "--Select--")
                    drDetails["Fin_Year"] = "";
                else
                    drDetails["Fin_Year"] = ddlFinYear.SelectedItem.Text;

                drDetails["LOB_ID"] = ddlLOB.SelectedValue;

                if (ddlLOB.SelectedItem.Text == "--Select--")
                    drDetails["LOB"] = "";
                else
                    drDetails["LOB"] = ddlLOB.SelectedItem.Text;

                drDetails["Location_ID"] = ddlBranch.SelectedValue;

                if (ddlBranch.SelectedItem.Text == "--Select--")
                    drDetails["Location"] = "";
                else
                    drDetails["Location"] = ddlBranch.SelectedItem.Text;




                drDetails["Document_Type_ID"] = ddlDocType.SelectedValue;
                drDetails["Document_Type_Desc"] = ddlDocType.SelectedText;
                drDetails["TotalWidth"] = txtTotalWidth.Text;
                if (cbIncludeCharSet.Checked)
                    drDetails["IncludeCharSet"] = "Yes";
                else
                    drDetails["IncludeCharSet"] = "No";
                drDetails["Batch"] = txtBatch.Text;
                drDetails["From_Number"] = txtFromNo.Text;
                drDetails["To_Number"] = txtToNo.Text;
                drDetails["Last_Used_Number"] = txtLastNo.Text;
                drDetails["EffectiveFrom"] = txtEffectiveFrom.Text;
                drDetails["EffectiveTo"] = txtEffectiveTo.Text;
                drDetails["ModifyDoc"] = "0";
                drDetails["Doc_Level"] = ObjDNCMasterRow.Level;
                drDetails["Active"] = "Yes";




                if (!funPriDateOverlap(Utility.StringToDate(txtEffectiveFrom.Text), Utility.StringToDate(txtEffectiveTo.Text), dtDocDetails, "0"))
                {
                    return;
                }

                ObjDNCMasterRow.Company_ID = intCompanyID;
                ObjDNCMasterRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
                ObjDNCMasterRow.Branch_ID = Convert.ToInt32(ddlBranch.SelectedValue);
                ObjDNCMasterRow.Document_Type_ID = Convert.ToInt32(ddlDocType.SelectedValue);
                if (ddlFinYear.SelectedIndex > 0)
                    ObjDNCMasterRow.Fin_Year = ddlFinYear.SelectedItem.Text;
                else
                    ObjDNCMasterRow.Fin_Year = "";
                ObjDNCMasterRow.Batch = txtBatch.Text;
                ObjDNCMasterRow.From_Number = Convert.ToDecimal(txtFromNo.Text);
                ObjDNCMasterRow.To_Number = Convert.ToDecimal(txtToNo.Text);


                if (txtLastNo.Text == "")
                {
                    ObjDNCMasterRow.Last_Used_Number = "0";
                }
                else
                {
                    ObjDNCMasterRow.Last_Used_Number = txtLastNo.Text;                //validtion();
                    //cvDNC.ErrorMessage = "Cannot modify this Document Number, its already used in some transaction.";
                }
                ObjDNCMasterRow.Created_By = intUserID;
                ObjDNCMasterRow.Created_On = Utility.StringToDate(txtEffectiveFrom.Text);//Parm Resued
                ObjDNCMasterRow.Doc_Number_Seq_ID = intDocSeqId;
                ObjDNCMasterRow.Modified_By = intUserID;
                ObjDNCMasterRow.Modified_On = Utility.StringToDate(txtEffectiveTo.Text);//Parm Resued
                ObjDNCMasterRow.Is_Active = CbxActive.Checked;
                ObjDNCMasterRow.Type = "V";
                ObjDNCMasterRow.XML_Doc_Details = gvDocDetails.FunPubFormXml().Replace("nbsp;", "");

                ObjS3G_DNCMasterDataTable.AddS3G_SYSAD_DNCMasterRow(ObjDNCMasterRow);

                SerializationMode SerMode = SerializationMode.Binary;




                intErrCode = ObjDocumentNumberControlClient.FunPubCreateDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));

                if (intErrCode == 0)
                {
                    dtDocDetails.Rows.Add(drDetails);
                    gvDocDetails.DataSource = dtDocDetails;
                    gvDocDetails.DataBind();
                    ViewState["DetailsTable"] = dtDocDetails;
                    // btnSave.Enabled_True();
                }
                else if (intErrCode == 1)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;
                }

                else if (intErrCode == 2)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number for selected combination is already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;
                }
                else if (intErrCode == 3)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number for selected combination is already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;
                }

                else if (intErrCode == 4)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists.");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number for selected combination is already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;
                }

                else if (intErrCode == 5)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Enter the To Number greater than From Number");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Enter the To Number greater than From Number");
                    return;
                }
                else if (intErrCode == 6)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Enter the From Number and To Number already exists this selected year");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Enter the From Number and To Number already exists this selected year");
                    return;
                }

                else if (intErrCode == 7)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;

                    //Deactivate the active indicator and insert for that combination of Company and Line of Business and Branch wise
                }

                else if (intErrCode == 8)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;

                    //Deactivate the active indicator and insert for that combination of Company and Line of business wise
                }
                else if (intErrCode == 9)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                    //strRedirectPageView = "";


                    Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                    return;
                    //Deactivate the active indicator and insert for that combination of company and branch wise         
                }
                else if (intErrCode == 19)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Financial year to be mapped");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Financial year to be mapped");
                    return;
                    //Deactivate the active indicator and insert for that combination of company and branch wise         
                }
                else if (intErrCode == 20)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Batch Number already exists");
                    //strRedirectPageView = "";


                    Utility.FunShowAlertMsg(this, "Batch Number already exists");
                    return;
                    //Deactivate the active indicator and insert for that combination of company and branch wise         
                }
                else if (intErrCode == 21)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be defined for closed Financial Year");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Document Number cannot be defined for closed Financial Year");
                    return;

                }
                else if (intErrCode == 22)
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be defined for closed Financial Year");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Batch Number Exists between the Effective From and To date");
                    return;

                }
                else
                {
                    //strAlert = strAlert.Replace("__ALERT__", "Error in saving document sequence number");
                    //strRedirectPageView = "";

                    Utility.FunShowAlertMsg(this, "Error in saving document sequence number");
                    return;
                }

                //if (gvDocDetails.Rows.Count > 1)
                //    btnSave.Enabled_True();

                FunClearDocDetails();
            }
        }
        catch (Exception ex)
        {

            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        ObjDocumentNumberControlClient = new DocMgtServicesReference.DocMgtServicesClient();

        try
        {
            //Validation Start
            bool bNumberValidation = false;

            DocMgtServices.S3G_SYSAD_DNCMasterRow ObjDNCMasterRow;
            if (ddlFinYear.SelectedValue != "0")
            {
                string[] str = ddlFinYear.SelectedValue.Split('-');
                if (str.Length > 0)
                {
                    string strYear = str[0].ToString();
                    string strValidateYear = "01/01/" + strYear;
                    string strValidateYearTo = "31/12/" + strYear;
                    DateTime strCurrentYearDate = Utility.StringToDate(strValidateYear);

                    DateTime dtstrValidateYearTo = Utility.StringToDate(strValidateYearTo);


                    if (Utility.StringToDate(txtEffectiveFrom.Text).Year.ToString() != strYear)
                    {
                        Utility.FunShowAlertMsg(this, "Effective From and To Date should be with in the Financial Year");
                        return;
                    }

                    if (Utility.StringToDate(txtEffectiveTo.Text).Year.ToString() != strYear)
                    {
                        Utility.FunShowAlertMsg(this, "Effective From and To Date should be with in the Financial Year");
                        return;
                    }

                    //&& strCurrentYearDate <= Utility.StringToDate(txtEffectiveTo.Text))

                }
            }




            if (!string.IsNullOrEmpty(txtEffectiveTo.Text))
            {
                if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
                {
                    Utility.FunShowAlertMsg(this, "Effective To Date cannot be lesser than System Date.");
                    txtEffectiveTo.Text = string.Empty;

                    return;
                }
                if (txtEffectiveTo.Text != string.Empty && txtEffectiveFrom.Text != string.Empty)
                {
                    if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(txtEffectiveFrom.Text))
                    {
                        Utility.FunShowAlertMsg(this, "Effective To Date should be greater than or equal to Effective From Date");
                        txtEffectiveTo.Text = string.Empty;

                        return;
                    }
                }
            }

            if (Convert.ToInt64(txtToNo.Text) == 0)
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 3);
                return;
            }
            if (bNumberValidation == true)
            {
                return;
            }

            if (Convert.ToInt64(txtFromNo.Text) == Convert.ToInt64(txtToNo.Text))
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 4);
                return;
            }


            if (Convert.ToInt64(txtFromNo.Text) > Convert.ToInt64(txtToNo.Text))
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 4);
                return;
            }

            if (intDocSeqId > 0)
            {
                cvDNC.ErrorMessage = "";
            }

            //Total Width Validation Start
            int count = txtBatch.Text.Length + txtToNo.Text.Length;
            if (Convert.ToInt32(txtTotalWidth.Text) != count)
            {
                Utility.FunShowValidationMsg(this.Page, "SA_DNC", 5);
                return;
            }

            //Total Width Validation End

            //-----Added By kannan RC on 14-dec-2010 To Last used number case
            if (intDocSeqId > 0)
            {
                if (txtLastNo.Text.Length > 0)
                {
                    if (Convert.ToInt64(txtLastNo.Text) > Convert.ToInt64(txtToNo.Text))
                    {
                        Utility.FunShowValidationMsg(this.Page, "SA_DNC", 6);
                        return;
                    }
                    if (Convert.ToInt64(txtLastNo.Text) == Convert.ToInt64(txtToNo.Text))
                    {
                        Utility.FunShowValidationMsg(this.Page, "SA_DNC", 6);
                        return;
                    }
                }

            }
            //---End here
            //Validation End


            ObjDNCMasterRow = ObjS3G_DNCMasterDataTable.NewS3G_SYSAD_DNCMasterRow();

            DataTable dtdocDetails = (DataTable)ViewState["DetailsTable"];
            DataView dvDocDetails = dtdocDetails.DefaultView;
            dvDocDetails.Sort = "Doc_Number_Seq_ID";
            int rowindex = dvDocDetails.Find(hdnDocID.Value);


            dvDocDetails[rowindex].Row["Fin_Year"] = ddlFinYear.SelectedItem.Text;
            //  dvDocDetails[rowindex].Row["LOB"] = ddlLOB.SelectedItem.Text;
            dvDocDetails[rowindex].Row["LOB_ID"] = ddlLOB.SelectedItem.Value;

            dvDocDetails[rowindex].Row["Location_ID"] = ddlBranch.SelectedValue;
            dvDocDetails[rowindex].Row["Document_Type_ID"] = ddlDocType.SelectedValue;
            dvDocDetails[rowindex].Row["TotalWidth"] = txtTotalWidth.Text.Trim();

            if (cbIncludeCharSet.Checked)
                dvDocDetails[rowindex].Row["IncludeCharSet"] = "Yes";
            else
                dvDocDetails[rowindex].Row["IncludeCharSet"] = "No";

            dvDocDetails[rowindex].Row["Batch"] = txtBatch.Text.Trim();
            dvDocDetails[rowindex].Row["From_Number"] = txtFromNo.Text.Trim();
            dvDocDetails[rowindex].Row["To_Number"] = txtToNo.Text.Trim();
            dvDocDetails[rowindex].Row["Last_Used_Number"] = txtLastNo.Text.Trim();
            dvDocDetails[rowindex].Row["EffectiveFrom"] = txtEffectiveFrom.Text;
            dvDocDetails[rowindex].Row["EffectiveTo"] = txtEffectiveTo.Text;
            dvDocDetails[rowindex].Row["ModifyDoc"] = "0";
            dvDocDetails[rowindex].Row["Doc_Level"] = "C";
            if (CbxActive.Checked)
                dvDocDetails[rowindex].Row["Active"] = "Yes";
            else
                dvDocDetails[rowindex].Row["Active"] = "No";


            //grvBankDetails

            //if (!funPriDateOverlap(Utility.StringToDate(txtEffectiveFrom.Text), Utility.StringToDate(txtEffectiveTo.Text), dtdocDetails, hdnDocID.Value))
            //{
            //    return;
            //}

            btnAdd.Enabled_True();
            btnModify.Enabled_False();


            if (Convert.ToInt32(ddlLOB.SelectedValue) == 0 && Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "C";
            }
            //ends here
            else if (Convert.ToInt32(ddlBranch.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "L";
            }
            else if (Convert.ToInt32(ddlLOB.SelectedValue) == 0)
            {
                ObjDNCMasterRow.Level = "B";
            }
            else if (Convert.ToInt32(ddlLOB.SelectedValue) != 0 && Convert.ToInt32(ddlBranch.SelectedValue) != 0)
            {
                ObjDNCMasterRow.Level = "S";
            }



            ObjDNCMasterRow.Company_ID = intCompanyID;
            ObjDNCMasterRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
            ObjDNCMasterRow.Branch_ID = Convert.ToInt32(ddlBranch.SelectedValue);
            ObjDNCMasterRow.Document_Type_ID = Convert.ToInt32(ddlDocType.SelectedValue);
            if (ddlFinYear.SelectedIndex > 0)
                ObjDNCMasterRow.Fin_Year = ddlFinYear.SelectedItem.Text;
            else
                ObjDNCMasterRow.Fin_Year = "";
            ObjDNCMasterRow.Batch = txtBatch.Text;
            ObjDNCMasterRow.From_Number = Convert.ToDecimal(txtFromNo.Text);
            ObjDNCMasterRow.To_Number = Convert.ToDecimal(txtToNo.Text);


            if (txtLastNo.Text == "")
            {
                ObjDNCMasterRow.Last_Used_Number = "0";
            }
            else
            {
                ObjDNCMasterRow.Last_Used_Number = txtLastNo.Text;                //validtion();
                //cvDNC.ErrorMessage = "Cannot modify this Document Number, its already used in some transaction.";
            }
            ObjDNCMasterRow.Created_By = intUserID;
            ObjDNCMasterRow.Created_On = Utility.StringToDate(txtEffectiveFrom.Text);
            ObjDNCMasterRow.Doc_Number_Seq_ID = intDocSeqId;
            ObjDNCMasterRow.Modified_By = intUserID;
            ObjDNCMasterRow.Modified_On = Utility.StringToDate(txtEffectiveTo.Text);

            ObjDNCMasterRow.Is_Active = CbxActive.Checked;
            ObjDNCMasterRow.Type = "V";
            ObjDNCMasterRow.XML_Doc_Details = gvDocDetails.FunPubFormXml().Replace("nbsp;", "");

            ObjS3G_DNCMasterDataTable.AddS3G_SYSAD_DNCMasterRow(ObjDNCMasterRow);

            SerializationMode SerMode = SerializationMode.Binary;

            intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_DNCMasterDataTable, SerMode));

            if (intErrCode == 0)
            {
                gvDocDetails.DataSource = dvDocDetails;
                gvDocDetails.DataBind();
                //wraptext(grvBankDetails, 20);
                ViewState["DetailsTable"] = dvDocDetails.Table;

                // btnSave.Enabled_True();
            }
            else if (intErrCode == 1)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;
            }

            else if (intErrCode == 2)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination is already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;
            }
            else if (intErrCode == 3)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination is already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;
            }

            else if (intErrCode == 4)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists.");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination is already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;
            }

            else if (intErrCode == 5)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Enter the To Number greater than From Number");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Enter the To Number greater than From Number");
                return;
            }
            else if (intErrCode == 6)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Enter the From Number and To Number already exists this selected year");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Enter the From Number and To Number already exists this selected year");
                return;
            }

            else if (intErrCode == 7)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;

                //Deactivate the active indicator and insert for that combination of Company and Line of Business and Branch wise
            }

            else if (intErrCode == 8)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;

                //Deactivate the active indicator and insert for that combination of Company and Line of business wise
            }
            else if (intErrCode == 9)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
                //strRedirectPageView = "";

                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number for selected combination already exists or Effective From and To Date should not Overlap for the Same Document Type");
                return;
                //Deactivate the active indicator and insert for that combination of company and branch wise         
            }
            else if (intErrCode == 19)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Financial year to be mapped");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Financial year to be mapped");
                return;
                //Deactivate the active indicator and insert for that combination of company and branch wise         
            }
            else if (intErrCode == 20)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Batch Number already exists");
                //strRedirectPageView = "";

                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Batch Number already exists");
                return;
                //Deactivate the active indicator and insert for that combination of company and branch wise         
            }
            else if (intErrCode == 21)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be defined for closed Financial Year");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Document Number cannot be defined for closed Financial Year");
                return;

            }
            else if (intErrCode == 22)
            {
                //strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be defined for closed Financial Year");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Batch Number Exists between the Effective From and To date");
                return;

            }
            else
            {
                //strAlert = strAlert.Replace("__ALERT__", "Error in saving document sequence number");
                //strRedirectPageView = "";
                btnModify.Enabled_True();
                btnAdd.Enabled_False();
                Utility.FunShowAlertMsg(this, "Error in saving document sequence number");
                return;
            }

            //if (gvDocDetails.Rows.Count > 1)
            //    btnSave.Enabled_True();

            FunClearDocDetails();
            EnabledControls();

        }
        catch (Exception ex)
        {

            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }


    protected void gvDocDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            //AddConfirmDelete((GridView)sender, e);
            //if (e.Row.Cells.Count >= 1)
            //    e.Row.Cells[0].Visible = false;

            //if (e.Row.Cells.Count >= 2)
            //    e.Row.Cells[1].Visible = false;

            //if (e.Row.Cells.Count >= 3)
            //    e.Row.Cells[2].Visible = false;

            //if (e.Row.Cells.Count >= 4)
            //    e.Row.Cells[4].Visible = false;

            //if (e.Row.Cells.Count >= 5)
            //    e.Row.Cells[6].Visible = false;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink
                //(this.grvBankDetails, "Select$" + e.Row.RowIndex);
                //Modified by Tamilselvan.S on 23/11/2011 for Deleting and selecting


                //Label lblgvEffectiveFrom = (Label)e.Row.FindControl("lblEffectiveFrom");
                //Label lblgvEffectiveTo = (Label)e.Row.FindControl("lblEffectiveTo");




                for (int i = 0; i < e.Row.Cells.Count - 1; i++)
                {
                    e.Row.Cells[i].Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink
                    (this.gvDocDetails, "Select$" + e.Row.RowIndex);
                }

                //LinkButton lnkbtnGVDelete = (LinkButton)e.Row.FindControl("lnkbtnDelete");
                //lnkbtnGVDelete.Enabled = false;

                //Label lblgvContd = (Label)e.Row.FindControl("lblgvContd");
                //TextBox txtgvBankAddress = (TextBox)e.Row.FindControl("txtgvBankAddress");

                //if (txtgvBankAddress.Text.Length >= 30)
                //{
                //    lblgvContd.Visible = true;
                //}
                //else
                //{
                //    lblgvContd.Visible = false;
                //}


                //if (strMode == "M")
                //{
                //    //Added By Thangam M on 13/Feb/2012 to make the address lable as textbox

                //    e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);funSetColor('" + txtgvBankAddress.ClientID + "', 1);";
                //    e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);funSetColor('" + txtgvBankAddress.ClientID + "', 2);";
                //}



                LinkButton LnkBtn = (LinkButton)e.Row.FindControl("lnkbtnDelete");
                LnkBtn.CommandArgument = e.Row.RowIndex.ToString();
                LnkBtn.Attributes.Add("onclick", "return confirm(\"Are you sure want to delete?\")");
            }


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }


    protected void gvDocDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dtDelete;
        dtDelete = (DataTable)ViewState["DetailsTable"];
        dtDelete.Rows.RemoveAt(e.RowIndex);
        gvDocDetails.DataSource = dtDelete;
        gvDocDetails.DataBind();
        ViewState["DetailsTable"] = dtDelete;
        FunClearDocDetails();
    }
    protected void gvDocDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            if (strMode != "Q")
            {

                if (intDocSeqId > 0)
                {
                    Label lblGVDoc_Number_Seq_ID = (Label)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("lblDoc_Number_Seq_ID");

                    hdnDocID.Value = lblGVDoc_Number_Seq_ID.Text;
                    //txtBranch_Code.Text = Convert.ToString(gvAddressDetails.SelectedRow.Cells[1].Text.Replace("&nbsp;", ""));

                    //temp

                    //ddlDocType.SelectedValue = ObjS3G_GetDNCDataTable.Rows[0]["Document_Type_ID"].ToString();
                    //ddlDocType.SelectedText = ObjS3G_GetDNCDataTable.Rows[0]["DESCS"].ToString();
                    Label lblGVLOBID = (Label)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("lblLOB_ID");
                    Label lblGVLocation_ID = (Label)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("lblLocation_ID");
                    Label lblGVDoc_Type_ID = (Label)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("lblDocTypeID");

                    if (string.IsNullOrEmpty(Convert.ToString(gvDocDetails.SelectedRow.Cells[1].Text.Replace("&nbsp;", ""))))
                    {
                        ddlFinYear.SelectedItem.Text = "--Select--";
                    }
                    else
                    {
                        ddlFinYear.SelectedItem.Text = Convert.ToString(gvDocDetails.SelectedRow.Cells[1].Text.Replace("&nbsp;", ""));
                    }

                    if (string.IsNullOrEmpty(lblGVLOBID.Text))
                    {
                        ddlLOB.SelectedItem.Text = "--Select--";
                    }
                    else
                    {
                        ddlLOB.SelectedValue = lblGVLOBID.Text;
                    }

                    if (string.IsNullOrEmpty(lblGVLocation_ID.Text))
                    {
                        ddlBranch.SelectedItem.Text = "--Select--";
                    }
                    else
                    {
                        ddlBranch.SelectedValue = lblGVLocation_ID.Text;
                    }

                    if (!string.IsNullOrEmpty(lblGVDoc_Type_ID.Text))
                    {
                        ddlDocType.SelectedValue = lblGVDoc_Type_ID.Text;
                        ddlDocType.SelectedText = Convert.ToString(gvDocDetails.SelectedRow.Cells[8].Text.Replace("&nbsp;", ""));
                        ddlDocType_Item_Selected(null, null);
                    }



                    //TextBox txtgvBankAddress = (TextBox)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("txtgvBankAddress");
                    Label lblgvEffectiveFrom = (Label)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("lblEffectiveFrom");
                    Label lblgvEffectiveTo = (Label)gvDocDetails.Rows[gvDocDetails.SelectedRow.RowIndex].FindControl("lblEffectiveTo");

                    txtTotalWidth.Text = Convert.ToString(gvDocDetails.SelectedRow.Cells[9].Text.Replace("&nbsp;", ""));

                    if (Convert.ToString(gvDocDetails.SelectedRow.Cells[10].Text.Replace("&nbsp;", "")).ToUpper() == "YES")
                        cbIncludeCharSet.Checked = true;
                    else
                        cbIncludeCharSet.Checked = false;
                    //cbIncludeCharSet.Checked = Convert.ToBoolean(Convert.ToString(gvDocDetails.SelectedRow.Cells[10].Text.Replace("&nbsp;", "")));
                    txtBatch.Text = Convert.ToString(gvDocDetails.SelectedRow.Cells[11].Text.Replace("&nbsp;", ""));
                    txtFromNo.Text = Convert.ToString(gvDocDetails.SelectedRow.Cells[12].Text.Replace("&nbsp;", ""));
                    txtToNo.Text = Convert.ToString(gvDocDetails.SelectedRow.Cells[13].Text.Replace("&nbsp;", ""));
                    txtLastNo.Text = Convert.ToString(gvDocDetails.SelectedRow.Cells[14].Text.Replace("&nbsp;", ""));
                    txtEffectiveFrom.Text = lblgvEffectiveFrom.Text;
                    txtEffectiveTo.Text = lblgvEffectiveTo.Text;

                    //CbxActive.Checked = Convert.ToBoolean(Convert.ToString(gvDocDetails.SelectedRow.Cells[18].Text.Replace("&nbsp;", "")));

                    if (Convert.ToString(gvDocDetails.SelectedRow.Cells[18].Text.Replace("&nbsp;", "")).ToUpper() == "YES")
                        CbxActive.Checked = true;
                    else
                        CbxActive.Checked = false;

                    btnModify.Visible = true;
                    btnModify.Enabled_True();
                    btnAdd.Enabled_False();
                    validtion();

                    if (txtEffectiveFrom.Text != null && txtEffectiveFrom.Text != "")
                    {
                        if (Utility.StringToDate(txtEffectiveFrom.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)) && strMode == "M")
                        {
                            txtEffectiveFrom.Enabled = false;
                        }
                        else
                        {
                            txtEffectiveFrom.Enabled = true;
                        }
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "NoEdit", "alert('Edit is not allowed in this Mode');", true);
                    btnAdd.Enabled_True();
                }
            }
           
        }
        catch (Exception ex)
        {
            btnModify.Enabled_True();
            btnAdd.Enabled_False();


            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }

    protected void FunBind_Effective_To()
    {
        try
        {

            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "793");
            Procparam.Add("@Param1", Convert.ToString(intCompanyID));
            DataTable dtdata = Utility.GetDefaultData("S3G_ORG_GetCustomerLookUp", Procparam);
            if (dtdata.Rows.Count > 0)
            {
                txtEffectiveTo.Text = dtdata.Rows[0][0].ToString();
                ViewState["Effective_To"] = txtEffectiveTo.Text;
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    [System.Web.Services.WebMethod]
    public static string[] GetDocumentType(String prefixText, int count)
    {

        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@PrefixText", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SA_GET_DOCTYPELST", Procparam));
        return suggestions.ToArray();
    }




    protected void txtEffectiveTo_TextChanged(object sender, EventArgs e)
    {

        ceToDate.Focus();
        try
        {

            if (!string.IsNullOrEmpty(txtEffectiveTo.Text))
            {
                if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
                {
                    Utility.FunShowAlertMsg(this, "Effective To Date cannot be lesser than System Date.");
                    txtEffectiveTo.Text = string.Empty;

                    return;
                }
                if (txtEffectiveTo.Text != string.Empty && txtEffectiveFrom.Text != string.Empty)
                {
                    if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(txtEffectiveFrom.Text))
                    {
                        Utility.FunShowAlertMsg(this, "Effective To Date should be greater than or equal to Effective From Date");
                        txtEffectiveTo.Text = string.Empty;

                        return;
                    }
                }
            }
            //txtEffectiveTo.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
   
    protected void txtEffectiveFrom_TextChanged(object sender, EventArgs e)
    {
        ceFromDate.Focus();

        if (!string.IsNullOrEmpty(txtEffectiveFrom.Text))
        {
            if (Utility.StringToDate(txtEffectiveFrom.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat))) //(Convert.ToInt32(Utility.StringToDate(txtFFromDate.Text)) < Convert.ToInt32(Utility.StringToDate(strDate)))
            {
                Utility.FunShowAlertMsg(this, "Effective From cannot be lesser than System Date.");
                txtEffectiveFrom.Text = string.Empty;

                return;
            }
        }


        if (!string.IsNullOrEmpty(txtEffectiveTo.Text))
        {
            if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
            {
                Utility.FunShowAlertMsg(this, "Effective To Date cannot be lesser than System Date.");
                txtEffectiveTo.Text = string.Empty;

                return;
            }
            if (txtEffectiveTo.Text != string.Empty && txtEffectiveFrom.Text != string.Empty)
            {
                if (Utility.StringToDate(txtEffectiveTo.Text) < Utility.StringToDate(txtEffectiveFrom.Text))
                {
                    Utility.FunShowAlertMsg(this, "Effective To Date should be greater than or equal to Effective From Date");
                    txtEffectiveTo.Text = string.Empty;

                    return;
                }
            }
        }



        txtEffectiveTo.Focus();

    }
    protected void cbIncludeCharSet_CheckedChanged(object sender, EventArgs e)
    {
        if (cbIncludeCharSet.Checked)
        {
            rfvBatch.Enabled = true;
            Batch.CssClass = "styleReqFieldLabel";
        }
        else
        {
            rfvBatch.Enabled = false;
            Batch.CssClass = "styleDisplayFieldLabel";
        }
    }
    protected void ddlDocType_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            //if (ddlDocType.SelectedValue == "13" || ddlDocType.SelectedValue == "14")
            if (ddlDocType.SelectedValue == "13" || ddlDocType.SelectedValue == "14" || ddlDocType.SelectedValue == "503"
                || ddlDocType.SelectedValue == "513" || ddlDocType.SelectedValue == "516" || ddlDocType.SelectedValue == "522"
                || ddlDocType.SelectedValue == "559" || ddlDocType.SelectedValue == "601" || ddlDocType.SelectedValue == "5051"
                || ddlDocType.SelectedValue == "5052" || ddlDocType.SelectedValue == "5053" || ddlDocType.SelectedValue == "5054"
                || ddlDocType.SelectedValue == "5056" || ddlDocType.SelectedValue == "5057" || ddlDocType.SelectedValue == "5058"
                || ddlDocType.SelectedValue == "5059" || ddlDocType.SelectedValue == "5060" || ddlDocType.SelectedValue == "5061"
                || ddlDocType.SelectedValue == "5062" || ddlDocType.SelectedValue == "5063"
                )
            {
                cbIncludeCharSet.Enabled = true;
            }
            else
            {
                cbIncludeCharSet.Checked = true;
                cbIncludeCharSet.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
}
