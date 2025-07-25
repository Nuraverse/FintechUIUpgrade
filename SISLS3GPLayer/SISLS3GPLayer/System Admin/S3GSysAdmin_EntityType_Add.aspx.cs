using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Web.Services;
using System.Collections;
using S3GBusEntity.Origination;
using System.ServiceModel;
using S3GAdminServicesReference;
using System.Text;
using System.Web.Security;

public partial class System_Admin_S3GSysAdmin_EntityType_Add : ApplyThemeForProject
{
    #region Initialization

    SerializationMode SerMode = SerializationMode.Binary;
    int intErrCode = 0;

    int intEntityType_ID = 0;
    int intConstitutionID = 0;
    int intUserID = 0;
    int intCompanyID = 0;
    int intProgramSelectedCount = 0;

    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bClearList = false;
    bool bMakerChecker = false;

    UserInfo ObjUserInfo;
    S3GSession ObjS3GSession;


    string strRedirectPage = "../System Admin/S3GSysAdmin_EntityType_View.aspx";
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdmin_EntityType_Add.aspx?qsMode=C';";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdmin_EntityType_View.aspx';";
    Dictionary<string, string> dictParam = null;
    StringBuilder strbConsDocumentsDet = new StringBuilder();
    string strBindProgramXML;
    string strBindConstDocsXML;
    static string strPageName = "Entity Type";
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            ObjUserInfo = new UserInfo();
            //User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            //Code end


            intCompanyID = ObjUserInfo.ProCompanyIdRW;//Convert.ToInt32(Request.QueryString["qsCmpnyId"]);
            intUserID = ObjUserInfo.ProUserIdRW;

            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
                if (fromTicket != null)
                {
                    intEntityType_ID = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
                strMode = Request.QueryString["qsMode"];
            }



            if (ViewState["PageMode"] == null)
            {
                ViewState["PageMode"] = PageMode.ToString();
            }

            FunProSetRowAttribute();

            if (!IsPostBack)
            {
                FunGetEntityTypeDetails();

                if ((intEntityType_ID > 0) && (strMode == "M"))
                {
                    hdnMode.Value = "M";
                    FunPriDisableControls(1);
                }
                else if ((intEntityType_ID > 0) && (strMode == "Q")) // Query // Modify
                {
                    FunPriDisableControls(-1);
                }
                else
                {
                    strMode = "C"; //Create Mode
                    FunPriGetProgramMaster();
                    // FunGetEntityTypeDetails();
                    FunPriDisableControls(0);

                }


                txtEntityType.Focus();
            }


        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName); ;
        }
    }

    #endregion

    #region Button Events
    protected void btnSave_Click(object sender, EventArgs e)
    {

        S3GAdminServicesClient ObjWebServiceClient = new S3GAdminServicesClient();

        try
        {
            intProgramSelectedCount = FunBindProgramListXML();

            if (intProgramSelectedCount == 0)
            {
                Utility.FunShowAlertMsg(this, "Atlease Select One Program");
                return;
            }

            int result = FunPriGenerateConstDocDet();
            if (result == 1)
            {
                if (grvConsDocuments.Rows.Count == 1 && ViewState["PageMode"].ToString() == PageModes.Create.ToString())
                    Utility.FunShowAlertMsg(this.Page, "Add atleast one constitution document to proceed.");
                else
                    Utility.FunShowAlertMsg(this.Page, "Atleast one mandatory document should be selected in constitution");
                return;
            }

            else if (grvConsDocuments.Rows.Count == 0 && ViewState["PageMode"].ToString() == PageModes.Modify.ToString())
            {
                Utility.FunShowAlertMsg(this.Page, "Add atleast one document to proceed.");
                return;
            }


            SerializationMode SerMode = SerializationMode.Binary;

            SystemAdmin.S3G_SYSAD_ENTITY_TYPEDataTable obj_Entity_Type_DataTable = new SystemAdmin.S3G_SYSAD_ENTITY_TYPEDataTable();
            SystemAdmin.S3G_SYSAD_ENTITY_TYPERow objEntityTypeRow;

            objEntityTypeRow = obj_Entity_Type_DataTable.NewS3G_SYSAD_ENTITY_TYPERow();
            objEntityTypeRow.Company_ID = Convert.ToInt16(intCompanyID);
            objEntityTypeRow.Entity_Type_ID = intEntityType_ID;
            objEntityTypeRow.Entity_Type_Name = txtEntityType.Text;
            objEntityTypeRow.Is_Active = Convert.ToBoolean(chkIsActive.Checked);
            objEntityTypeRow.XML_Program_Details = strBindProgramXML;
            objEntityTypeRow.XML_Const_Doc_Det = strBindConstDocsXML;
            objEntityTypeRow.Created_By = intUserID;
            obj_Entity_Type_DataTable.AddS3G_SYSAD_ENTITY_TYPERow(objEntityTypeRow);

            intErrCode = ObjWebServiceClient.FunPubInsertUpdateEntityType(SerMode, ClsPubSerialize.Serialize(obj_Entity_Type_DataTable, SerMode));
            if (intErrCode == 0)
            {

                btnSave.Enabled = false;

                if (intEntityType_ID > 0)
                {
                    Utility.FunShowAlertMsg(this.Page, "Entity Type Updated Successfully", strRedirectPage);
                    return;
                }
                else
                {
                    strAlert = "Entity type setup added successfully";
                    strAlert += @"\n\nWould you like to add one more Entity Type?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    lblErrorMessage.Text = string.Empty;
                    ViewState["PageMode"] = PageModes.Create.ToString();
                    return;
                }
            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Entity Type Name already exists");
                return;
            }
            else if (intErrCode == 2)
            {
                Utility.FunShowAlertMsg(this.Page, "Entity Type cannot be created.There are 99 Entity Types Already in the system.");
                return;
            }

            lblErrorMessage.Text = string.Empty;

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjWebServiceClient.Close();
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
    }

    #endregion

    #region Grid Events
    protected void gvProgramList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkbox = (CheckBox)e.Row.FindControl("cbxApplicable");

            if (PageMode != PageModes.Query)
            {
                chkbox.Attributes.Add("onclick", "fnUnselectAllExpectSelected(this,'" + e.Row.ClientID + "')");
            }

            if ((bQuery && strMode == "Q") || ((ViewState["GridCbx"] != null) && Convert.ToString(ViewState["GridCbx"]) == "0"))
            {
                chkbox.Enabled = false;
            }

        }
    }

    protected void grvConsDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblDocCatID = (Label)e.Row.FindControl("lblDocCatIDAssigned");
            CheckBox chkSel = (CheckBox)e.Row.FindControl("chkSel");


            CheckBox chkOptMan = (CheckBox)e.Row.FindControl("chkOptMan");
            CheckBox chkImageCopy = (CheckBox)e.Row.FindControl("chkImageCopy");

            TextBox txtRemarks = (TextBox)e.Row.FindControl("txtRemarks");

            txtRemarks.ReadOnly = true;
            if (Convert.ToInt32(lblDocCatID.Text) > 0)
            {
                txtRemarks.Text = System.Web.HttpUtility.HtmlDecode(txtRemarks.Text);
                if (chkSel != null)
                {
                    chkSel.Checked = true;
                    chkSel.Enabled = true; //ENABLED CHANGED
                }
                Label lblOptMan = (Label)e.Row.FindControl("lblOptMan");
                Label lblImageCopy = (Label)e.Row.FindControl("lblImageCopy");
                txtRemarks.ReadOnly = false;

                chkOptMan.Enabled = true; //ENABLED CHANGED
                chkImageCopy.Enabled = true; // ENABLED CHANGED

                if ((lblOptMan.Text == "True") || (lblOptMan.Text == "1"))    //  Added for Oracle Conversion , PSK -- 4/Nov/2011
                {
                    chkOptMan.Checked = true;
                    // chkOptMan.Enabled = true; //ENABLED CHANGED
                }

                if ((lblImageCopy.Text == "True") || (lblImageCopy.Text == "1"))   //  Added for Oracle Conversion, PSK -- 4/Nov/2011
                {
                    chkImageCopy.Checked = true;
                    //chkImageCopy.Enabled = true; // ENABLED CHANGED
                }

            }
            else
            {
                txtRemarks.Text = "";
            }

            if (strMode == "Q")
            {
                chkOptMan.Enabled = false;
                chkImageCopy.Enabled = false;
                txtRemarks.ReadOnly = true;
            }
        }
    }

    protected void grvConsDocuments_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    #endregion


    protected void ddlDocCatGrid_SelectedIndexChanged(object sender, EventArgs e)
    {

        //Commnted and Added by Saranya 29-Feb-2012 to bind the Document Description Details
        ViewState["DocID"] = null;
        dictParam = new Dictionary<string, string>();
        //DropDownList ddlCode = grvConsDocuments.FooterRow.FindControl("ddlDocCatGird") as DropDownList;
        UserControls_S3GAutoSuggest ddlCode = grvConsDocuments.FooterRow.FindControl("ddlDocCatGird") as UserControls_S3GAutoSuggest;
        TextBox txtDescription = grvConsDocuments.FooterRow.FindControl("txtOthersGrid") as TextBox;

        txtDescription.Text = string.Empty;
        if (Convert.ToInt32(ddlCode.SelectedValue) > 0)
        {
            dictParam.Add("@Doc_Id", ddlCode.SelectedValue);
            dictParam.Add("@Mode", "ET"); //For getting entity type constitution category docs

            DataSet dsCOSDesc = Utility.GetTableValues(SPNames.S3G_GetCons_Category, dictParam);
            System.Web.HttpContext.Current.Session["dtConCodes"] = dsCOSDesc.Tables[0];
            if (dsCOSDesc.Tables[0].Rows[0]["Document_Description"].ToString().ToLower() == "others")
            {
                txtDescription.Enabled = true;
                txtDescription.Focus();
            }
            else
            {

                txtDescription.Enabled = false;
                txtDescription.Text = dsCOSDesc.Tables[0].Rows[0]["Document_Description"].ToString();
                ViewState["DocID"] = dsCOSDesc.Tables[0].Rows[0][ConstitutionDocumentCategory_ID].ToString();
            }

        }

        
    }


    protected void RemoveRow(object sender, EventArgs e)
    {
        LinkButton lnkRemovePRDDC = (LinkButton)sender;
        GridViewRow gvRow = (GridViewRow)lnkRemovePRDDC.Parent.Parent;
        Label lbl = gvRow.FindControl("lblDocCatID") as Label;
        removeRow(lbl.Text);
    }
    void removeRow(string sno)
    {
        DataTable dtConstitutions = ViewState["Documents"] as DataTable;
        DataRow[] dtrRow = dtConstitutions.Select("Doc_Cat_ID=" + sno);
        if (dtrRow.Length > 0)
            dtConstitutions.Rows.Remove(dtrRow[0]);
        if (dtConstitutions.Rows.Count == 0)
        {
            ViewState["PageMode"] = PageModes.Create.ToString();
            AddNewRowTable("", "", false, false, "");
            dtConstitutions = ViewState["Documents"] as DataTable;
            dtConstitutions.AcceptChanges();
            BindGrid(dtConstitutions);
        }
        else
            BindGrid(dtConstitutions);


        ViewState["Documents"] = dtConstitutions;
        //LoadDocumentFlags();
    }
    protected void txtOthersGrid_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (System.Web.HttpContext.Current.Session["dtConCodes"] != null)
            {
                DataTable dt = (DataTable)System.Web.HttpContext.Current.Session["dtConCodes"];
                if (dt.Rows.Count > 0)
                {
                    string filterExpression = "Document_Description = '" + (grvConsDocuments.FooterRow.FindControl("txtOthersGrid") as TextBox).Text.Trim() + "'";
                    DataRow[] dtSuggestions = dt.Select(filterExpression);
                    if (dtSuggestions.Length > 0)
                    {
                        ViewState["DocID"] = dtSuggestions[0][ConstitutionDocumentCategory_ID].ToString();
                        ViewState["DocumentFlag"] = dtSuggestions[0]["Document_Flag"].ToString();
                    }
                }
            }
            grvConsDocuments.FooterRow.FindControl("chkOptManIns").Focus();
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    [WebMethod]
    public static string[] getDocumentsList(String prefixText, int count)
    {
        //dictParam = new Dictionary<string, string>();
        //dictParam.Add("@CatName", drCodeName.SelectedValue);
        //drpLst.BindDataTable(SPNames.S3G_GetCons_Category, dictParam, new string[] { "ConstitutionDocumentCategory_ID", "Document_Description" });        
        List<String> suggetions = null;
        DataTable dtDesc = new DataTable();
        try
        {
            if (System.Web.HttpContext.Current.Session["dtConCodes"] != null)
            {
                dtDesc = (DataTable)System.Web.HttpContext.Current.Session["dtConCodes"];
                suggetions = GetDescription(prefixText, count, dtDesc);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return suggetions.ToArray();
    }

    private static List<String> GetDescription(string key, int count, DataTable dt1)
    {
        List<String> suggestions = new List<string>();
        try
        {
            string filterExpression = "Document_Description like '" + key + "%'";
            DataRow[] dtSuggestions = dt1.Select(filterExpression);
            foreach (DataRow dr in dtSuggestions)
            {
                string suggestion = dr["Document_Description"].ToString();
                suggestions.Add(suggestion);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
        return suggestions;
    }


    void AddNewRowTable(string codeName, string codeDesc, bool codeMandatory, bool codeImageCopy, string codeRemarks)
    {

        DataTable dtConstitutions = ViewState["Documents"] as DataTable;
        string strCatID = string.Empty;
        DataRow[] dtrFilter;
        // Retain the Existing Row Values from Grid
        foreach (GridViewRow grvConsDoc in grvConsDocuments.Rows)
        {
            strCatID = ((Label)grvConsDoc.FindControl("lblDocCatID")).Text;
            dtrFilter = dtConstitutions.Select("Doc_Cat_ID=" + strCatID);
            if (dtrFilter.Length > 0)
            {
                dtrFilter[0].BeginEdit();
                dtrFilter[0]["Doc_Cat_OptMan"] = ((CheckBox)grvConsDoc.FindControl("chkOptMan")).Checked == true ? true : false;
                dtrFilter[0]["Doc_Cat_ImageCopy"] = ((CheckBox)grvConsDoc.FindControl("chkImageCopy")).Checked == true ? true : false;
                dtrFilter[0]["Remarks"] = ((TextBox)grvConsDoc.FindControl("txtRemarks")).Text.Replace("'", "~");
                dtrFilter[0].EndEdit();
            }

        }

        DataRow drNew = dtConstitutions.NewRow();


        string[] str = codeName.Split('-');
        string val = str[0] + ((str.Length >= 2) ? '-' + str[1] : "");
        //codeName.Split('-').GetValue(0) + "-" + codeName.Split('-').GetValue(1);

        if (!codeName.ToLower().Contains("others") &&
            dtConstitutions.Select("Doc_Cat_Flag='" + val
                // Condition Added for Code and Description Validation...
                // By Senthilkumar P on 12/mar/2012
                + "' and Doc_Cat_Desc='" + codeDesc + "'").Length > 0)
        {
            Utility.FunShowAlertMsg(this.Page, "Document Type already exists");
            return;
        }
        else if (codeName.ToLower().Contains("others") && codeDesc == "")
        {
            Utility.FunShowAlertMsg(this.Page, "Document Description cannot be empty");
            return;
        }
        else if (codeName.ToLower().Contains("others") && dtConstitutions.Select("Doc_Cat_Desc='" + codeDesc + "'").Length > 0)
        {
            Utility.FunShowAlertMsg(this.Page, "Document Description already exists");
            return;
        }

        if (codeName == "0")
        {
            Utility.FunShowAlertMsg(this.Page, "Document Type cannot be empty");
            return;
        }
        //if (codeRemarks.Trim().Length == 0 && codeName!="")
        //{
        //    Utility.FunShowAlertMsg(this.Page, "Remarks cannot be empty");
        //    return;
        //}
        // insert the newly added OTHERS  row to Documents master
        if (ViewState["DocID"] == null && codeName.ToLower().Contains("others"))
        {
            if (codeDesc.Trim().Length > 0)
                InsertNewDocumentCategory(codeName.Split('-').GetValue(0).ToString(), codeName, codeDesc);
            // Code can Split and pass to DB because Doc_Cat_Name has 3 Char Max Length.
            // Modified by Senthilkumar on 12/mar/2012
        }
        drNew.BeginEdit();
        drNew["Sno"] = dtConstitutions.Rows.Count + 1;
        drNew["Doc_Cat_Name"] = codeName;
        drNew["Doc_Cat_ID"] = ((ViewState["DocID"] != null) ? ViewState["DocID"].ToString() : int.MaxValue.ToString());
        drNew["Doc_Cat_IDAssigned"] = ((ViewState["DocID"] != null) ? ViewState["DocID"].ToString() : int.MaxValue.ToString());
        drNew["Doc_Cat_Desc"] = codeDesc.ToUpper();
        drNew["Doc_Cat_Flag"] = val;//((ViewState["DocumentFlag"] != null) ? ViewState["DocumentFlag"].ToString() : "");
        drNew["Doc_Cat_OptMan"] = codeMandatory;
        drNew["Doc_Cat_ImageCopy"] = codeImageCopy;
        drNew["Remarks"] = codeRemarks;
        drNew.EndEdit();
        dtConstitutions.Rows.Add(drNew);
        BindGrid(dtConstitutions);
        ViewState["DocID"] = null;
        // Load the Drop downlist
        //LoadDocumentFlags();
        //grvConsDocuments.Rows[0].Visible = false;
        ViewState["Documents"] = dtConstitutions;
        //FunGetConstitutionCodeDetails();
    }

    private void BindGrid(DataTable dtConstitutions)
    {
        grvConsDocuments.DataSource = dtConstitutions;
        grvConsDocuments.DataBind();
        if (grvConsDocuments.Rows.Count > 0)
        {
            if (ViewState["PageMode"].ToString() != PageModes.Modify.ToString() && ViewState["PageMode"].ToString() != PageModes.Delete.ToString() && ViewState["PageMode"].ToString() != PageModes.Query.ToString())
                grvConsDocuments.Rows[0].Visible = false;
        }
        else
        {
            if (ViewState["PageMode"].ToString() == PageModes.Query.ToString())
            {
                Utility.FunShowAlertMsg(this.Page, "No Constitutional documents found to load", strRedirectPage);
                return;
            }
        }
    }

    private void InsertNewDocumentCategory(string codeName, string codeFlag, string codeDesc)
    {
        PRDDCMgtServicesReference.PRDDCMgtServicesClient ObjPRDDCMasterClient;
        PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
        PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
        ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();
        try
        {

            ObjPRDDCRow.DocType = "Consti";
            ObjPRDDCRow.DocCategory = codeName;
            ObjPRDDCRow.DocDesc = codeDesc;
            ObjPRDDCRow.Created_By = intUserID;

            ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);

            ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();

            intErrCode = ObjPRDDCMasterClient.FunPubCreateOtherDocDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));

            if (intErrCode >= 0)
            {
                //Utility.FunShowAlertMsg(this.Page, "Constitution other document added successfully");
                if (Request.QueryString["qsConstitutionId"] != null)
                    intConstitutionID = Convert.ToInt32(Request.QueryString["qsConstitutionId"]);
                ViewState["DocID"] = intErrCode;
                //FunGetConstitutionCodeDetails();
            }
            else if (intErrCode == -1)
            {
                Utility.FunShowAlertMsg(this.Page, "Constitution other document already exists");
            }
            //else if (intErrCode == 2)
            //{
            //    Utility.FunShowAlertMsg(this.Page, "Document sequence number is not defined to create PRDDC Code");
            //}
            lblErrorMessage.Text = string.Empty;

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjPRDDCMasterClient.Close();
        }
    }

    protected void SaveRow(object sender, EventArgs e)
    {
        UserControls_S3GAutoSuggest drCodeName = (UserControls_S3GAutoSuggest)grvConsDocuments.FooterRow.FindControl("ddlDocCatGird");
        //DropDownList drCodeName = grvConsDocuments.FooterRow.FindControl("ddlDocCatGird") as DropDownList;
        //DropDownList drpLst = lvContacts.InsertItem.FindControl("drplstDesc") as DropDownList;
        TextBox txtDesc = grvConsDocuments.FooterRow.FindControl("txtOthersGrid") as TextBox;
        CheckBox chkOptMan = grvConsDocuments.FooterRow.FindControl("chkOptManIns") as CheckBox;
        CheckBox chkImageCopy = grvConsDocuments.FooterRow.FindControl("chkImageCopyIns") as CheckBox;
        TextBox txtRemarks = grvConsDocuments.FooterRow.FindControl("txtRemarks") as TextBox;
        if (drCodeName.SelectedValue == "0")
        {
            Utility.FunShowAlertMsg(this.Page, "Select Document Type");
            drCodeName.Focus();
            return;
        }
        if (txtDesc.Text == string.Empty)
        {
            Utility.FunShowAlertMsg(this.Page, "Enter the Other document description.");
            txtDesc.Focus();
            return;
        }

        AddNewRowTable(drCodeName.SelectedText, txtDesc.Text.Trim(), chkOptMan.Checked, chkImageCopy.Checked, txtRemarks.Text.Trim());


    }

    private void FunGetEntityTypeDetails()
    {
        DataSet dsEntityTypeDet = new DataSet();

        try
        {

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Entity_Type_ID", Convert.ToString(intEntityType_ID));
            if (PageMode == PageModes.Query)
                dictParam.Add("@IsQueryMode", Convert.ToString(1));
            if (PageMode == PageModes.Modify)
                dictParam.Add("@IsQueryMode", Convert.ToString(0));

            dsEntityTypeDet = Utility.GetDataset("S3G_SA_GET_ENTITY_TYPE_DET", dictParam);
            if (dsEntityTypeDet.Tables.Count > 0)
            {
                if (dsEntityTypeDet.Tables[0].Rows.Count > 0)
                {
                    txtEntityType.Text = dsEntityTypeDet.Tables[0].Rows[0]["ENTITY_TYPE_NAME"].ToString();
                    chkIsActive.Checked = Convert.ToBoolean(dsEntityTypeDet.Tables[0].Rows[0]["IS_ACTIVE"]);
                }

                if (dsEntityTypeDet.Tables[1].Rows.Count > 0)
                {
                    gvProgramList.DataSource = dsEntityTypeDet.Tables[1];
                    gvProgramList.DataBind();
                    FunProSetGridStyle(dsEntityTypeDet.Tables[1]);
                }


                if (ViewState["PageMode"].ToString() == PageModes.Create.ToString())
                {
                    if (!dsEntityTypeDet.Tables[2].Columns.Contains("Sno"))
                        dsEntityTypeDet.Tables[2].Columns.Add("Sno", typeof(System.Int16));
                    ViewState["Documents"] = dsEntityTypeDet.Tables[2].Clone();
                    AddNewRowTable("", "", false, false, "");
                    grvConsDocuments.Columns[8].Visible = true;
                }
                else if (ViewState["PageMode"].ToString() == PageModes.Modify.ToString())
                {
                    BindGrid(dsEntityTypeDet.Tables[2]);
                    ViewState["Documents"] = dsEntityTypeDet.Tables[2].Copy();

                }
                else if (ViewState["PageMode"].ToString() == PageModes.Delete.ToString() || ViewState["PageMode"].ToString() == PageModes.Query.ToString())
                {
                    BindGrid(dsEntityTypeDet.Tables[2]);
                    if (grvConsDocuments.FooterRow != null)
                        grvConsDocuments.FooterRow.Visible = grvConsDocuments.Columns[8].Visible = false;
                    //ViewState["Documents"] = dsConstitution.Tables[2].Copy();
                }
            }
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            dsEntityTypeDet.Dispose();
            dsEntityTypeDet = null;
        }
    }

    private int FunPriGenerateConstDocDet()
    {
        try
        {
            string strCatID = string.Empty;
            string strOptMan = string.Empty;
            string strImageCopy = string.Empty;
            string strRemarks = string.Empty;

            strbConsDocumentsDet.Append("<Root>");
            bool isMandatorySelected = false;

            foreach (GridViewRow grvConsDoc in grvConsDocuments.Rows)
            {
                strCatID = ((Label)grvConsDoc.FindControl("lblDocCatID")).Text;
                if (strCatID != int.MaxValue.ToString())
                {
                    strOptMan = ((CheckBox)grvConsDoc.FindControl("chkOptMan")).Checked == true ? "1" : "0";
                    strImageCopy = ((CheckBox)grvConsDoc.FindControl("chkImageCopy")).Checked == true ? "1" : "0";
                    strRemarks = ((TextBox)grvConsDoc.FindControl("txtRemarks")).Text.Trim().Replace("'", "~");

                    if (((CheckBox)grvConsDoc.FindControl("chkOptMan")).Checked == true)
                        isMandatorySelected = true;
                    strbConsDocumentsDet.Append(" <Details Doc_Cat_ID='" + strCatID + "' Doc_Cat_OptMan='" + strOptMan + "' Doc_Cat_ImageCopy='" + strImageCopy + "' Doc_Cat_Remarks='" + formatXMLString(strRemarks) + "' /> ");
                }

            }
            strbConsDocumentsDet.Append("</Root>");
            strBindConstDocsXML = strbConsDocumentsDet.ToString();
            if (isMandatorySelected == false)
                return 1;

            return 0;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void FunPriDisableControls(int intModeID)
    {

        switch (intModeID)
        {
            case 0: // Create Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);

                if (!bCreate)
                {
                    btnSave.Enabled = true;
                }

                chkIsActive.Checked = true;
                chkIsActive.Enabled = false;

                break;

            case 1: // Modify Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);

                if (!bModify)
                {
                    btnSave.Enabled = false;
                }


                // FunGetEntityTypeDetails();
                FunPriGetProgramMaster();

                txtEntityType.Enabled = true;
                btnClear.Enabled = false;
                break;

            case -1:// Query Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);

                if (!bQuery)
                {
                    Response.Redirect(strRedirectPage, false);
                }
                // FunGetEntityTypeDetails();
                txtEntityType.ReadOnly = true;

                btnClear.Enabled = false;
                btnSave.Enabled = false;
                chkIsActive.Enabled = false;

                break;
        }

    }
    protected void FunProSetGridStyle(DataTable dtGrid)
    {
        for (int i = 0; i < gvProgramList.Rows.Count; i++)
        {

            if (gvProgramList.Rows[i].RowType == DataControlRowType.DataRow)
            {

                int Program_ID = Convert.ToInt32(gvProgramList.DataKeys[i]["Program_ID"].ToString());
                CheckBox Cbx1 = (CheckBox)gvProgramList.Rows[i].FindControl("cbxApplicable");

                Cbx1.Checked = false;

                if (Program_ID == Convert.ToInt32(dtGrid.Rows[i]["Program_ID"].ToString()))
                {
                    if (dtGrid.Rows[i]["Program_ID"].ToString() == "0")
                        Cbx1.Checked = false;
                    else
                        Cbx1.Checked = Convert.ToBoolean(dtGrid.Rows[i]["Is_Applicable"]);

                    if (Cbx1.Checked)
                    {
                        gvProgramList.Rows[i].BackColor = System.Drawing.Color.FromName("#f5f8ff");
                    }
                }
            }
        }
    }
    protected void FunProSetRowAttribute()
    {
        for (int i = 0; i < gvProgramList.Rows.Count; i++)
        {
            if (gvProgramList.Rows[i].RowType == DataControlRowType.DataRow)
            {
                CheckBox Cbx1 = (CheckBox)gvProgramList.Rows[i].FindControl("cbxApplicable");
                Cbx1.Attributes.Add("onclick", "fnUnselectAllExpectSelected(this,'" + gvProgramList.Rows[i].ClientID + "')");
                if (Cbx1.Checked)
                {
                    gvProgramList.Rows[i].BackColor = System.Drawing.Color.FromName("#f5f8ff");
                }
            }
        }
    }
    private int FunBindProgramListXML()
    {
        StringBuilder strbuXML = new StringBuilder();
        strbuXML.Append("<Root>");
        foreach (GridViewRow grvData in gvProgramList.Rows)
        {

            string strlblPRTID = ((Label)grvData.FindControl("lblProgramID")).Text;
            //string strApplicable = Convert.ToString(((CheckBox)grvData.FindControl("cbxApplicable")).Checked);
            //string strApplicable = Convert.ToString(((CheckBox)grvData.FindControl("cbxApplicable")).Checked);
            CheckBox cbxApplicable = (CheckBox)grvData.FindControl("cbxApplicable");

            if (cbxApplicable.Checked)
            {
                strbuXML.Append(" <Details  PROGRAM_ID='" + strlblPRTID + "' IS_APPLICABLE='" + 1 + "'/>");
                intProgramSelectedCount++;
            }


        }
        strbuXML.Append("</Root>");
        strBindProgramXML = strbuXML.ToString();
        return intProgramSelectedCount;
    }

    [System.Web.Services.WebMethod]
    public static string[] GetDocumentFlags(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SA_GET_ENTITY_DOCCATG_DET", Procparam));

        return suggetions.ToArray();
    }

    string formatXMLString(string newString)
    {
        // >
        newString = newString.Replace(">", "&gt;");
        //  <
        newString = newString.Replace("<", "&lt;");
        //&
        newString = newString.Replace("&", "&amp;");

        //Double Quote " –This does not work here…
        // newString = newString.Replace(ControlChars.Quote,"&quot;"); 
        // newString = newString.Replace(CHR(32),"&quot;");
        //Single Quote '
        newString = newString.Replace("'", "&apos;");

        return newString;
    }

    #region GetProgramNumber
    private void FunPriGetProgramMaster()
    {

        try
        {
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@ENTITY_TYPE_ID", Convert.ToString(intEntityType_ID));
            dictParam.Add("@MODECODE", Convert.ToString(strMode));
            DataTable dtGrid = Utility.GetDefaultData("S3G_SA_GET_ENTIY_TYPE_PROG", dictParam);

            if (dtGrid.Rows.Count > 0)
            {
                gvProgramList.DataSource = dtGrid;
                gvProgramList.DataBind();
                FunProSetGridStyle(dtGrid);
            }

        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;

        }
        finally
        {
            //objCashflow_MasterClient.Close();
        }
    }
    #endregion

    #region Propertites


    /// <summary>
    /// Added by PSK reg. Oracle Conversion     -   09/Jan/2012
    /// </summary>
    public string ConstitutionDocumentCategory_ID
    {
        get
        {
            return "ENTITYDOCCATEG_ID";
        }

    }

    #endregion
}