#region Page Header

/// <Program Summary>
/// Module Name			: Budget 
/// Screen Name			: Formula Master Add
/// Created By			: Deepika .K
/// Created Date		: 02-Dec-2019
/// Purpose	            : Budget Module
#endregion
using FA_BusEntity;
using S3GBusEntity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Budget_BUD_FormulaMaster_Add : ApplyThemeForProject_FA
{
    static string strPageName = "Budget Formula Master";
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    UserInfo_FA objUserInfo = new UserInfo_FA();
    int intCompanyID = 0;
    int intUserID = 0;
    string StrConnectionName = string.Empty;
    string strMode = "";
    int intFormulaMasterId = 0;
    Dictionary<string, string> Procparam;
    string strDateFormat = string.Empty;
    string strRedirectPageView = "~/Budget/BUD_FormulaMaster_View.aspx";
    string strRedirectPageAdd = "~/Budget/BUD_FormulaMaster_Add.aspx";
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERDataTable objFormulaMaster = null;
    FASerializationMode SerMode = FASerializationMode.Binary;
    FormsAuthenticationTicket fromTicket;
    FASession objFASession;
    UserInfo_FA ObjUserInfo_FA = null;
    BudgetServiceReference.BudgetMasterClient objBudgetService;
    
  
    #region Paging Config

    int intNoofSearch = 2;
    ArrayList arrSearchVal = new ArrayList(1);
    string[] arrSortCol = new string[] { "ItemTypeDes", "SubTotalName" };

    string strSearchVal1 = string.Empty;
    string strSearchVal2 = string.Empty;
    string strSearchVal3 = string.Empty;
    string strSearchVal4 = string.Empty;
    string strSearchVal5 = string.Empty;

    PagingValues ObjPaging = new PagingValues();

    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
    /// <summary>
    ///Assign Page Number
    /// </summary>
    public int ProPageNumRW
    {
        get;
        set;
    }

    /// <summary>
    ///Assign Page Size
    /// </summary>
    public int ProPageSizeRW
    {
        get;
        set;
    }

    protected void AssignValue(int intPageNum, int intPageSize)
    {
        try
        {
            ProPageNumRW = intPageNum;
            ProPageSizeRW = intPageSize;

            string strSearchVal = string.Empty;
            try
            {
                string strItemTypeDes = "";
                string strSubTotalName = "";

                if (arrSearchVal.Count > 0)
                {
                    strItemTypeDes = arrSearchVal[0].ToString();
                    strSubTotalName = arrSearchVal[1].ToString();
                }
                if (strSearchVal.StartsWith(" and "))
                {
                    strSearchVal = strSearchVal.Remove(0, 5);
                }
                hdnSearch.Value = strSearchVal;
            }
            catch (Exception ex)
            {
                FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            }
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            # region User Information
            ObjUserInfo_FA = new UserInfo_FA();

            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;                                  // current user's company ID.
            intUserID = ObjUserInfo_FA.ProUserIdRW;                                        // current user's ID
            # endregion

            if (!IsPostBack)
            {
                bCreate = ObjUserInfo_FA.ProCreateRW;
                bModify = ObjUserInfo_FA.ProModifyRW;
                bQuery = ObjUserInfo_FA.ProViewRW;
                funPubBindDropdown();
                strPageName = "Budget Formula Master";
                if (Request.QueryString.Get("qsmasterId") != null)
                {
                    fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                    intFormulaMasterId = Convert.ToInt32(fromTicket.Name);
                    strPageName = strPageName + " - Modify";
                }
                else
                {
                    strPageName = strPageName + " - Create";
                }
                lblHeading.Text = strPageName;
                if (Request.QueryString["qsMode"] != null)
                    strMode = Convert.ToString(Request.QueryString["qsMode"]);

                if (((intFormulaMasterId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intFormulaMasterId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }
                else
                {
                    FunPriDisableControls(0);
                }
                ddlFormulaType.Focus();
            }
            //if (lbxFormula.Items.Count == 0)
            //{
            //    btnUp.Enabled = false;
            //    btnDown.Enabled = false;
            //    btnDelete.Enabled = false;
            //}
            //else
            //{
            //    btnUp.Enabled = true;
            //    btnDown.Enabled = true;
            //    btnDelete.Enabled = true;
            //}
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    private void FunPubLoadFormulaMaster()
    {
        try
        {
            DataSet dsFormula = new DataSet();
            if (Procparam != null)
                Procparam.Clear();


            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@FormulaMaster_ID", intFormulaMasterId.ToString());

            dsFormula = Utility_FA.GetDataset("BUD_GET_FORMULAMASTERDETAILS", Procparam);
            DataTable dtFormula = new DataTable();
            if (ViewState["dtFormula"] != null)
            {
                dtFormula = (DataTable)ViewState["dtFormula"];
            }
            if (dsFormula.Tables.Count > 0)
            {
                if (dsFormula.Tables[0].Rows.Count > 0)
                {
                    ddlItemHeader.SelectedValue = dsFormula.Tables[0].Rows[0]["Itemheader_Id"].ToString();
                    ddlAccNature.SelectedValue = dsFormula.Tables[0].Rows[0]["Accountnature_Id"].ToString();
                    ddlAccNature_SelectedIndexChanged(null, null);
                    ddlFormulaType.SelectedValue = dsFormula.Tables[0].Rows[0]["FORMULATYPE_ID"].ToString();
                    ddlFormulaType_SelectedIndexChanged(null, null);
                    ddlSublineItem.SelectedValue = dsFormula.Tables[0].Rows[0]["SUBLINEITEM_ID"].ToString();
                    // tbxFormulaView.Text = dsFormula.Tables[0].Rows[0]["FORMULA"].ToString();
                    //lbxFormula.Text = dsFormula.Tables[0].Rows[0]["FORMULA"].ToString();
                    if (dsFormula.Tables[0].Rows[0]["FORMULA"].ToString() != "")
                    {
                        string strFormula = dsFormula.Tables[0].Rows[0]["FORMULA"].ToString();
                        string str = "";
                        string[] strFormList = strFormula.Split(',');
                        for (int i = 0; i < strFormList.Length; i++)
                        {
                            if (strFormList[i].Contains("-C"))
                            {
                                str = strFormList[i].ToString();
                                string[] strSplit = str.Split(new string[] { "-C" }, StringSplitOptions.None);
                                lbxComponents.SelectionMode = ListSelectionMode.Single;
                                string lbxValue = strSplit[0].ToString();
                                string lbxText = "";
                                if (ddlFormulaType.SelectedValue == "1")
                                {
                                    lbxText = getLineItemDesc(lbxValue);
                                }
                                else
                                    lbxText = getGLCodeDesc(lbxValue);
                                //Session["lbxValue"] = lbxValue;
                                lbxComponents.SelectedIndex = lbxComponents.Items.IndexOf(new ListItem(lbxText, lbxValue.ToLower()));
                                lbxComponents_SelectedIndexChanged(null, null);
                            }
                            if (strFormList[i].Contains("-O"))
                            {
                                str = strFormList[i].ToString();
                                string[] strSplit = str.Split(new string[] { "-O" }, StringSplitOptions.None);
                                lbxOperator.SelectedValue = strSplit[0].ToString();
                                lbxOperator_SelectedIndexChanged(null, null);
                            }
                        }
                    }

                    if (dsFormula.Tables[0].Rows[0]["Is_Active"].ToString() == "1")
                    {
                        ChkbxStatus.Checked = true;
                    }
                    else
                        ChkbxStatus.Checked = false;
                }
                if (dsFormula.Tables[1].Rows.Count > 0)
                {
                    ViewState["GLCodeDetails"] = dsFormula.Tables[1];
                    grvGLCode.DataSource = (DataTable)ViewState["GLCodeDetails"];
                    grvGLCode.DataBind();
                    funPubBindFooterDropdown();
                }

                if (this.ddlFormulaType.SelectedValue.ToString() == "2")
                {
                    this.pnlActivity.Visible = true;

                    if (dsFormula.Tables[2].Rows.Count > 0)
                    {
                        foreach (DataRow Dtr in dsFormula.Tables[2].Rows)
                        {
                            string DtrActivityId = Dtr[0].ToString();
                            foreach (GridViewRow row in grvActivityList.Rows)
                            {
                                TextBox txtLocId = (TextBox)row.Cells[1].FindControl("txtActivityId");
                                CheckBox CheckStatus = (CheckBox)row.Cells[1].FindControl("chkSelectLI");

                                if (txtLocId.Text.ToString() == DtrActivityId)
                                {
                                    CheckStatus.Checked = true;
                                }

                            }
                        }

                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public string getGLCodeDesc(string strGLCode)
    {
        string strGLDesc = "";
        Procparam.Clear();
        Procparam.Add("@Option", "9");
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@GLCode", strGLCode);
        DataSet ds = new DataSet();
        ds = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);
        if (ds != null && ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                strGLDesc = ds.Tables[0].Rows[0][0].ToString();
            }
        }
        return strGLDesc;
    }
    public string getLineItemDesc(string strLineItemCode)
    {
        string strLineItemDesc = "";
        Procparam.Clear();
        Procparam.Add("@Option", "10");
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@GLCode", strLineItemCode);
        DataSet ds = new DataSet();
        ds = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);
        if (ds != null && ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                strLineItemDesc = ds.Tables[0].Rows[0][0].ToString();
            }
        }
        return strLineItemDesc;
    }
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    if (!bCreate)
                    {
                    }

                    break;

                case 1: // Modify Mode
                    if (!bModify)
                    {
                        btnSave.Enabled_False();
                    }
                    ddlFormulaType.Enabled = false;
                    ddlSublineItem.Enabled = false;
                    ChkbxStatus.Disabled = false;
                    FunPubLoadFormulaMaster();
                    btnClear.Enabled_False();
                    ddlAccNature.Enabled = false;
                    ddlItemHeader.Enabled = false;
                    break;

                case -1:// Query Mode
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageAdd);
                    }
                    FunPubLoadFormulaMaster();
                    btnSave.Enabled_False();
                    btnClear.Enabled_False();
                    ddlSublineItem.Enabled = false;
                    ddlFormulaType.Enabled = false;
                    ChkbxStatus.Disabled = true;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    lbxComponents.Enabled = false;
                    lbxFormula.Enabled = false;
                    lbxOperator.Enabled = false;
                    if (grvGLCode.Rows.Count > 0)
                    {
                        grvGLCode.FooterRow.Visible = false;
                    }
                    btnUp.Enabled = false;
                    btnDown.Enabled = false;
                    btnDelete.Enabled = false;
                    ddlAccNature.Enabled = false;
                    ddlItemHeader.Enabled = false;
                    this.pnlActivity.Enabled = false;
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageView);
                    }
                    foreach (GridViewRow row in grvGLCode.Rows)
                    {
                        System.Web.UI.HtmlControls.HtmlButton btnDel = (System.Web.UI.HtmlControls.HtmlButton)row.FindControl("btnDelete");
                        btnDel.Enabled_False();
                    }
                    break;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (lbxFormula.SelectedItem != null)
            {
                if (ViewState["dtFormula"] != null)
                {
                    DataTable dtFormula = (DataTable)ViewState["dtFormula"];
                    dtFormula.Rows.RemoveAt(lbxFormula.SelectedIndex);
                    ViewState["dtFormula"] = dtFormula;

                    if (ddlFormulaType.SelectedValue == "2")
                    {
                        DataTable dtGLCode = new DataTable();
                        dtGLCode = (DataTable)ViewState["GLCodes"];
                        DataRow[] dr = dtGLCode.Select("GLCodeDesc='" + lbxFormula.SelectedItem.Text + "'");
                        if (dr.Length > 0)
                        {
                            dtGLCode.Rows.Remove(dr[0]);
                        }
                        ViewState["GLCodes"] = dtGLCode;
                        funBindGLGrid();
                        funPubBindFooterDropdown();
                    }
                }

                lbxFormula.Items.Remove(lbxFormula.SelectedItem);
                BuildFormulaView();
            }
            else
            {
                // ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", "alert('Choose item to delete.');", true);
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10078);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void BuildFormulaView()
    {
        try
        {
            StringBuilder objSB = new StringBuilder();
            foreach (ListItem objLI in lbxFormula.Items)
            {
                objSB.Append(objLI.Text);
                objSB.Append(" ");
            }
            tbxFormulaView.Text = objSB.ToString();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void btnDown_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            MoveItem(1);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnUp_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            MoveItem(-1);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    public void MoveItem(int iDirection)
    {
        try
        {
            // Checking selected item
            if (lbxFormula.SelectedItem == null || lbxFormula.SelectedIndex < 0)
            {
                // ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", "alert('Choose item.');", true);
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10077);
                return; // No selected item - nothing to do
            }

            int iOldIndex = lbxFormula.SelectedIndex;

            // Calculate new index using move direction
            int iNewIndex = lbxFormula.SelectedIndex + iDirection;

            // Checking bounds of the range
            if (iNewIndex < 0 || iNewIndex >= lbxFormula.Items.Count)
                return; // Index out of range - nothing to do

            ListItem liSelected = lbxFormula.SelectedItem;

            // Removing removable element
            lbxFormula.Items.Remove(liSelected);
            // Insert it in new position
            lbxFormula.Items.Insert(iNewIndex, liSelected);
            // Restore selection
            //lbxFormula.SetSelected(newIndex, true);

            if (ViewState["dtFormula"] != null)
            {
                DataTable dtFormula = (DataTable)ViewState["dtFormula"];
                DataRow drNew = dtFormula.NewRow();
                DataRow dr = dtFormula.Rows[iOldIndex];

                drNew["Component"] = dr["Component"];
                drNew["ComponentID"] = dr["ComponentID"];
                drNew["ElementType"] = dr["ElementType"];
                drNew["InputValue"] = dr["InputValue"];
                dtFormula.Rows.RemoveAt(iOldIndex);
                dtFormula.Rows.InsertAt(drNew, iNewIndex);
                ViewState["dtFormula"] = dtFormula;
            }
            BuildFormulaView();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    public void funPubBindDropdown()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());

            DataSet dsData = new DataSet();

            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

            if (dsData.Tables.Count > 0)
            {
                if (dsData.Tables[0].Rows.Count > 0)
                {
                    ddlItemHeader.Items.Clear();
                    ddlItemHeader.DataSource = dsData.Tables[0];
                    ddlItemHeader.DataTextField = "lookup_desc";
                    ddlItemHeader.DataValueField = "lookup_code";
                    ddlItemHeader.DataBind();
                    ddlItemHeader.Items.Insert(0, "--Select--");
                }

                if (dsData.Tables[1].Rows.Count > 0)
                {
                    ddlAccNature.Items.Clear();
                    ddlAccNature.DataSource = dsData.Tables[1];
                    ddlAccNature.DataTextField = "lookup_desc";
                    ddlAccNature.DataValueField = "lookup_code";
                    ddlAccNature.DataBind();
                    ddlAccNature.Items.Insert(0, "--Select--");
                }
                //funPubBindFooterDropdown();
            }

            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Option", "5");
            dsData = new DataSet();
            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);
            if (dsData.Tables[0].Rows.Count > 0)
            {
                ddlFormulaType.Items.Clear();
                ddlFormulaType.DataSource = dsData.Tables[0];
                ddlFormulaType.DataTextField = "lookup_desc";
                ddlFormulaType.DataValueField = "lookup_code";
                ddlFormulaType.DataBind();
            }
            ddlFormulaType.Items.Insert(0, "--Select--");

            funBindActivity();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void LoadComponentsAndOperators()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", "1");

            if (ddlFormulaType.SelectedValue == "1")
            {
                Procparam.Add("@Option", "3");
                DataSet dsComponents = new DataSet();
                dsComponents = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);
                if (dsComponents != null && dsComponents.Tables.Count > 0 && dsComponents.Tables[0].Rows.Count > 0)
                {
                    lbxComponents.Items.Clear();
                    lbxComponents.DataTextField = "description";
                    lbxComponents.DataValueField = "value";
                    lbxComponents.DataSource = dsComponents;
                    lbxComponents.DataBind();

                    lbxOperator.Items.Clear();
                    lbxOperator.DataTextField = "Symbol";
                    lbxOperator.DataValueField = "ID";
                    lbxOperator.DataSource = dsComponents.Tables[1];
                    lbxOperator.DataBind();
                }
                else
                {
                    lbxComponents.Items.Clear();
                    lbxOperator.Items.Clear();
                    pnlFormula.Visible = false;
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", "alert('Formula not found.');", true);
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10076);
                    return;
                }
            }
            else
            {
                Procparam.Add("@Option", "6");
                DataSet dsComponents = new DataSet();
                dsComponents = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);
                if (dsComponents != null && dsComponents.Tables.Count > 0 && dsComponents.Tables[0].Rows.Count > 0)
                {
                    lbxComponents.Items.Clear();
                    lbxComponents.DataTextField = "Description";
                    lbxComponents.DataValueField = "ID";
                    lbxComponents.DataSource = dsComponents;
                    lbxComponents.DataBind();

                    lbxOperator.Items.Clear();
                    lbxOperator.DataTextField = "Symbol";
                    lbxOperator.DataValueField = "ID";
                    lbxOperator.DataSource = dsComponents.Tables[1];
                    lbxOperator.DataBind();
                }
                else
                {
                    lbxComponents.Items.Clear();
                    lbxOperator.Items.Clear();
                    pnlFormula.Visible = false;
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10076);
                    return;
                }
            }
            pnlFormula.Visible = true;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    public void AddComponent()
    {
        try
        {
            DataTable dtFormula = new DataTable();
            DataTable dtGLCode = new DataTable();

            if (ViewState["dtFormula"] == null)
            {
                dtFormula.Columns.Add("Component", typeof(string));
                dtFormula.Columns.Add("ComponentID", typeof(string));
                dtFormula.Columns.Add("ElementType", typeof(string));
                dtFormula.Columns.Add("InputValue", typeof(string));
            }
            else
            {
                dtFormula = (DataTable)ViewState["dtFormula"];
            }

            if (ViewState["GLCodes"] == null)
            {
                dtGLCode.Columns.Add("GLCodeDesc", typeof(string));
                dtGLCode.Columns.Add("GLCodeID", typeof(string));
            }
            else
            {
                dtGLCode = (DataTable)ViewState["GLCodes"];
            }

            Random objRandom = new Random();

            if (lbxComponents.SelectedItem != null)
            {
                string strText = lbxComponents.SelectedItem.Text;
                string strValue = lbxComponents.SelectedValue;

                lbxFormula.Items.Add(new ListItem(strText, strValue));
                lbxComponents.ClearSelection();

                if (strValue != "0")
                {
                    dtFormula.Rows.Add(strText, strValue, "2");
                    if (ddlFormulaType.SelectedValue.ToString() == "2")
                    {
                        DataRow[] drCount = dtGLCode.Select("GLCodeID='" + strValue + "'");
                        if (drCount.Length == 0)
                        {
                            if (ddlFormulaType.SelectedValue == "2")
                            {
                                DataRow dr = dtGLCode.NewRow();
                                dr.BeginEdit();
                                dr["GLCodeDesc"] = strText;
                                dr["GLCodeID"] = strValue;
                                dr.EndEdit();
                                dtGLCode.Rows.Add(dr);
                                ViewState["GLCodes"] = dtGLCode;
                                funBindGLGrid();
                                funPubBindFooterDropdown();
                            }
                        }
                    }
                }
            }
            else if (lbxOperator.SelectedItem != null)
            {
                string strText = lbxOperator.SelectedItem.Text;
                string strValue = lbxOperator.SelectedValue;

                lbxFormula.Items.Add(new ListItem(strText, strValue));
                lbxOperator.ClearSelection();
                dtFormula.Rows.Add(strText, strValue, "1", "");//"1"
            }
            else if (!string.IsNullOrEmpty(tbxValue.Text.Trim()))
            {
                dtFormula.Rows.Add(tbxValue.Text.Trim(), "", "1", tbxValue.Text.Trim());//"4"

                lbxFormula.Items.Add(new ListItem(tbxValue.Text.Trim(), "-2"));//-2 is manual text entered in the formula
                tbxValue.Text = string.Empty;
            }
            else
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", "alert('Choose item.');", true);
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10077);
            }

            BuildFormulaView();

            ViewState["dtFormula"] = dtFormula;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void funPubBindFooterDropdown()
    {
        try
        {
            DropDownList ddlFGLCode = (DropDownList)grvGLCode.FooterRow.FindControl("ddlFGLCode");
            ddlFGLCode.Items.Clear();
            if (ViewState["GLCodes"] != null)
            {
                DataTable dtGLCodes = new DataTable();
                dtGLCodes = (DataTable)ViewState["GLCodes"];
                ddlFGLCode.DataSource = dtGLCodes;
                ddlFGLCode.DataTextField = "GLCodeDesc";
                ddlFGLCode.DataValueField = "GLCodeID";
                ddlFGLCode.DataBind();
            }
            ddlFGLCode.Items.Insert(0, "--Select--");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btnFormualMaster_Click(object sender, EventArgs e)
    {
    }

    protected void lbxComponents_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AddComponent();
            if (ddlFormulaType.SelectedValue == "2")
            {
                tdGrid.Visible = true;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void lbxOperator_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AddComponent();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void ddlFormulaType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlFormulaType.SelectedValue != "0" || ddlFormulaType.SelectedValue != "--Select--")
            {
                if (ddlFormulaType.SelectedValue.ToString() == "1")
                {
                    lblHdr.Text = "Line Items";
                   
                }
                if (ddlFormulaType.SelectedValue.ToString() == "2")
                {
                    lblHdr.Text = "GL Codes";
                    this.pnlActivity.Visible = true;
                    

                }
                else
                {
                    this.pnlActivity.Visible = false;
       
                        foreach (GridViewRow row in grvActivityList.Rows)
                        {
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                CheckBox chkrow = (CheckBox)row.FindControl("chkSelectLI");
                                if (chkrow.Checked)
                                    chkrow.Checked = false;
                            }
                        }
                                      

                }
                lbxComponents.Items.Clear();
                lbxOperator.Items.Clear();
                grvGLCode.ClearGrid_FA();
                lbxFormula.Items.Clear();
                tbxFormulaView.Clear_FA();
                LoadComponentsAndOperators();
                ViewState["dtFormula"] = null;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    public void funBindGLGrid()
    {
        try
        {
            DataTable dt = new DataTable();
            dt = (DataTable)ViewState["GLCodeDetails"];
            if (dt != null && dt.Rows.Count > 0)
            {

                grvGLCode.DataSource = dt;
                grvGLCode.DataBind();
                if (dt.Rows[0][0].ToString() == "0")
                {
                    grvGLCode.Rows[0].Visible = false;
                }
            }
            else
            {
                funPubInitGrid();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        try
        {
            DataTable dtAdd = new DataTable();
            dtAdd = (DataTable)ViewState["GLCodeDetails"];
            DataRow drAdd = dtAdd.NewRow();
            DropDownList ddlFGLCode = (DropDownList)grvGLCode.FooterRow.FindControl("ddlFGLCode");
            DropDownList ddlFSLCode = (DropDownList)grvGLCode.FooterRow.FindControl("ddlFSLCode");
            int intSNO = 0;
            if (dtAdd.Rows.Count > 0)
            {
                if (dtAdd.Rows[0][0].ToString() == "0")
                {
                    dtAdd.Rows.RemoveAt(0);
                }
            }

            intSNO = dtAdd.Rows.Count + 1;

            drAdd["SNO"] = intSNO.ToString();
            if (ddlFGLCode.SelectedValue != "0" || ddlFGLCode.SelectedValue != "--Select--")
            {
                drAdd["GLCodeDesc"] = ddlFGLCode.SelectedItem.Text;
                drAdd["GLCodeID"] = ddlFGLCode.SelectedValue;
            }
            else
            {
                drAdd["GLCodeDesc"] = "";
                drAdd["GLCodeID"] = "0";
            }
            if (ddlFSLCode.SelectedValue != "0" || ddlFSLCode.SelectedValue != "--Select--")
            {
                drAdd["SLCodeDesc"] = ddlFSLCode.SelectedItem.Text;
                drAdd["SLCodeID"] = ddlFSLCode.SelectedValue;
            }
            else
            {
                drAdd["SLCodeDesc"] = "";
                drAdd["SLCodeID"] = "0";
            }
            drAdd.EndEdit();
            DataRow[] dr = dtAdd.Select("SLCodeID = '" + ddlFSLCode.SelectedValue.ToString() + "' AND GLCodeID='" + ddlFGLCode.SelectedValue.ToString() + "'");
            if (dr.Length == 0)
            {
                dtAdd.Rows.Add(drAdd);
                grvGLCode.DataSource = dtAdd;
                grvGLCode.DataBind();
                ViewState["GLCodeDetails"] = dtAdd;
                funPubBindFooterDropdown();
            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10079);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnDelete_ServerClick(object sender, EventArgs e)
    {
        try
        {
            System.Web.UI.HtmlControls.HtmlButton btnEdit = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow Grow = (GridViewRow)btnEdit.NamingContainer;

            DataTable dt = new DataTable();
            dt = (DataTable)ViewState["GLCodeDetails"];
            //  GridViewRow row = grvGLCode.Rows[grvGLCode.SelectedIndex];
            Label lblSLCodeID = (Label)Grow.FindControl("lblSLCodeID");
            Label lblGLCodeID = (Label)Grow.FindControl("lblGLCodeID");

            DataRow[] dr = dt.Select("SLCodeID='" + lblSLCodeID.Text + "' AND GLCodeID='" + lblGLCodeID.Text + "' ");
            if (dr.Length > 0)
            {
                for (int i = 0; i < dr.Length; i++)
                {
                    dt.Rows.Remove(dr[i]);
                }
                ViewState["GLCodeDetails"] = dt;
            }

            funBindGLGrid();
            funPubBindFooterDropdown();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    public void funPubInitGrid()
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SNO");
            dt.Columns.Add("GLCodeDesc");
            dt.Columns.Add("GLCodeID");
            dt.Columns.Add("SLCodeDesc");
            dt.Columns.Add("SLCodeID");

            DataRow drItem = dt.NewRow();
            drItem.BeginEdit();
            drItem["SNO"] = 0;
            drItem["GLCodeDesc"] = "";
            drItem["GLCodeID"] = "0";
            drItem["SLCodeDesc"] = "";
            drItem["SLCodeID"] = "0";
            drItem.EndEdit();

            dt.Rows.Add(drItem);
            grvGLCode.DataSource = dt;
            grvGLCode.DataBind();
            ViewState["GLCodeDetails"] = dt;
            grvGLCode.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (!ValidateInputs())
            {
                return;
            }
            DataTable dtVS = (DataTable)ViewState["GLCodeDetails"];
            //if (ViewState["dtFormula"] == null)
            //{
            //    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10081);
            //}

            DataTable dtActivity = new DataTable();
            dtActivity.Columns.Add("Activity_Id");


            if (ddlFormulaType.SelectedValue == "2")
            {

                foreach (GridViewRow row in grvActivityList.Rows)
                {
                    DataRow dr = dtActivity.NewRow();

                    CheckBox CheckStatus = (CheckBox)row.Cells[1].FindControl("chkSelectLI");

                    if (CheckStatus.Checked == true)
                    {

                        TextBox txtLocId = (TextBox)row.Cells[1].FindControl("txtActivityId");
                        dr["Activity_Id"] = txtLocId.Text;
                        dtActivity.Rows.Add(dr);
                    }

                }

                if (dtActivity.Rows.Count == 0)
                {
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Select atleast one Activty");
                    return;
                }
            }

            objFormulaMaster = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERDataTable();
            FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERRow objDataRow;
            objDataRow = objFormulaMaster.NewFA_BUD_FORMULAMASTERRow();
            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intFormulaMasterId = Convert.ToInt32(fromTicket.Name);
                objDataRow.FORMULAMASTER_MST_ID = intFormulaMasterId;
            }
            else
                objDataRow.FORMULAMASTER_MST_ID = 0;

            objDataRow.COMPANY_ID = intCompanyID;
            objDataRow.ITEMHEADER_ID = ddlItemHeader.SelectedValue.ToString();
            objDataRow.ACCOUNTNATURE_ID = ddlAccNature.SelectedValue.ToString();
            objDataRow.FORMULATYPE_ID = Convert.ToInt32(ddlFormulaType.SelectedValue);
            objDataRow.SUBLINEITEM_ID = Convert.ToInt32(ddlSublineItem.SelectedValue);
            objDataRow.XML_Activity = dtActivity.FunPubFormXml_FA(true);
            objDataRow.USER_ID = intUserID;
            DataTable dtFomula = new DataTable();
            dtFomula = (DataTable)ViewState["dtFormula"];
            string strFormula = "", strFormula_val = "";

            for (int i = 0; i < dtFomula.Rows.Count; i++)
            {
                string strComponent = "", strOperator = "", strOperator1 = "";
                if (dtFomula.Rows[i]["ElementType"].ToString() == "2")
                {
                    strComponent = dtFomula.Rows[i]["ComponentID"].ToString();
                }
                if (dtFomula.Rows[i]["ElementType"].ToString() == "1")
                {
                    strOperator = dtFomula.Rows[i]["ComponentID"].ToString();
                    strOperator1 = dtFomula.Rows[i]["Component"].ToString();
                }
                if (strComponent != "")
                {
                    strFormula = strFormula + strComponent + "-C,";
                    strFormula_val = strFormula_val + strComponent;
                }
                if (strOperator != "")
                {
                    strFormula = strFormula + strOperator + "-O,";
                    strFormula_val = strFormula_val + strOperator1;
                }
            }

            objDataRow.FORMULA = strFormula;
            objDataRow.FORMULA_VAL = strFormula_val;

            if (ChkbxStatus.Checked)
            {
                objDataRow.IS_ACTIVE = 1;
            }
            else
                objDataRow.IS_ACTIVE = 0;

            if (ddlFormulaType.SelectedValue.ToString() == "2")
            {
                DataTable dt = new DataTable();
                dt = (DataTable)ViewState["GLCodeDetails"];
                objDataRow.XML_FORMULADTLS = ((DataTable)ViewState["GLCodeDetails"]).FunPubFormXml(true);
                if (dt.Rows[0][0].ToString() == "0")
                {
                    objDataRow.XML_FORMULADTLS = "<Root></Root>";
                }
            }
            else
                objDataRow.XML_FORMULADTLS = "<Root></Root>";

            objFormulaMaster.AddFA_BUD_FORMULAMASTERRow(objDataRow);
            objFASession = new FASession();
            StrConnectionName = objFASession.ProConnectionName;

            int errorCode = 0;
            objBudgetService = new BudgetServiceReference.BudgetMasterClient();
            errorCode = objBudgetService.FunPubCreateFormulaMaster(SerMode, FAClsPubSerialize.Serialize(objFormulaMaster, SerMode), StrConnectionName);
            if (errorCode == 0)
            {
                Utility_FA.FunSaveConfirmAlertMsg(this, "Success!", Resources.ErrorHandlingAndValidation._10072, "Do you want to create another Formula?", "BUD_FormulaMaster_Add.aspx", "BUD_FormulaMaster_View.aspx");
            }
            else if (errorCode == 10)
            {
                Utility_FA.FunUpdateAlertMsg(this.Page, "Success!", Resources.ErrorHandlingAndValidation._10073, "BUD_FormulaMaster_View.aspx");
            }
            else if (errorCode == 11)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10058);
            }
            else
            {
                if (errorCode == 50)
                {
                    Utility_FA.FunAlertMsg(this.Page, "Error", "Alert", Resources.ErrorHandlingAndValidation._10051);
                    //Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10051);
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageAdd, false);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnExit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageView, false);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ddlFGLCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlFGLCode = (DropDownList)grvGLCode.FooterRow.FindControl("ddlFGLCode");
            DropDownList ddlFSLCode = (DropDownList)grvGLCode.FooterRow.FindControl("ddlFSLCode");

            if (ddlFGLCode != null && (ddlFGLCode.SelectedValue != "0" || ddlFGLCode.SelectedValue != "--Select--"))
            {
                Procparam = new Dictionary<string, string>();
                if (Procparam != null)
                    Procparam.Clear();

                Procparam.Add("@COMPANY_ID", intCompanyID.ToString());
                Procparam.Add("@Option", "8");
                Procparam.Add("@GLCODE", ddlFGLCode.SelectedValue.ToString());

                DataSet dsSLCodes = new DataSet();
                dsSLCodes = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

                ddlFSLCode.Items.Clear();
                if (dsSLCodes.Tables[0].Rows.Count > 0)
                {
                    ddlFSLCode.DataSource = dsSLCodes.Tables[0];
                    ddlFSLCode.DataTextField = "sl_desc";
                    ddlFSLCode.DataValueField = "sl_code";
                    ddlFSLCode.DataBind();
                }
                ddlFSLCode.Items.Insert(0, "--Select--");
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }

    private bool ValidateInputs()
    {
        bool blnIsValid = true;
        try
        {

            if (lbxFormula.Items.Count == 0)
            {
                cvFormula.ErrorMessage = "No formula defined"; cvFormula.IsValid = false; blnIsValid = false;
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Define formula to save.");
            }
            else
            {
                if (tbxFormulaView.Text.Trim().StartsWith("/") || tbxFormulaView.Text.Trim().StartsWith("*") || tbxFormulaView.Text.Trim().StartsWith("^") || tbxFormulaView.Text.Trim().StartsWith("+") ||
                    tbxFormulaView.Text.Trim().StartsWith("-") || tbxFormulaView.Text.Trim().StartsWith("%") || tbxFormulaView.Text.Trim().StartsWith(")") || tbxFormulaView.Text.Trim().StartsWith("=") ||
                    tbxFormulaView.Text.Trim().EndsWith("/") || tbxFormulaView.Text.Trim().EndsWith("*") || tbxFormulaView.Text.Trim().EndsWith("^") || tbxFormulaView.Text.Trim().EndsWith("+") ||
                    tbxFormulaView.Text.Trim().EndsWith("-") || tbxFormulaView.Text.Trim().EndsWith("%") || tbxFormulaView.Text.Trim().EndsWith("(") || tbxFormulaView.Text.Trim().EndsWith("="))
                {
                    // cvFormula.ErrorMessage = "Defined formula is invalid."; cvFormula.IsValid = false; 
                    blnIsValid = false;
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10081);
                }
                string strOpt = tbxFormulaView.Text.Replace(" ", "");

                if (strOpt.Contains(")(") || strOpt.Contains("()") || strOpt.Contains("*)") || strOpt.Contains("(*") ||
                    strOpt.Contains("-)") || strOpt.Contains("(-") || strOpt.Contains("(+") || strOpt.Contains("+)") ||
                    strOpt.Contains("/)") || strOpt.Contains("(/"))
                {
                    blnIsValid = false;
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10081);
                }

                DataTable dtFormula = new DataTable();
                if (ViewState["dtFormula"] != null)
                {
                    int i = 0;
                    dtFormula = (DataTable)ViewState["dtFormula"];
                    foreach (DataRow drForm in dtFormula.Rows)
                    {
                        i = i + 1;
                        drForm.BeginEdit();
                        drForm["InputValue"] = i.ToString();
                        drForm.EndEdit();
                    }
                    dtFormula.AcceptChanges();

                    DataRow[] drFormula = dtFormula.Select("ElementType=1");

                    if (drFormula.Length > 0)
                    {
                        for (int j = 0; j < drFormula.Length; j++)
                        {
                            if (j != 0)
                            {
                                if (drFormula[j]["Component"].ToString() != "(" && drFormula[j]["Component"].ToString() != ")")
                                {
                                    int k = Convert.ToInt32(drFormula[j]["InputValue"]);
                                    if (k - 1 == Convert.ToInt32(drFormula[j - 1]["InputValue"]))
                                    {
                                        blnIsValid = false;
                                        Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10081);
                                    }
                                }
                            }
                        }
                    }

                    drFormula = dtFormula.Select("ElementType=2");

                    if (drFormula.Length > 0)
                    {
                        for (int j = 0; j < drFormula.Length; j++)
                        {
                            if (j != 0)
                            {
                                int k = Convert.ToInt32(drFormula[j]["InputValue"]);
                                if (k - 1 == Convert.ToInt32(drFormula[j - 1]["InputValue"]))
                                {
                                    blnIsValid = false;
                                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10081);
                                }
                            }
                        }
                    }
                }
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }

        return blnIsValid;
    }

    protected void ddlAccNature_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Option", "7");
            Procparam.Add("@ItemHeader", ddlItemHeader.SelectedValue.ToString());
            Procparam.Add("@AccNature", ddlAccNature.SelectedValue.ToString());
            DataSet dsData = new DataSet();
            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);
            ddlSublineItem.Items.Clear();
            if (dsData.Tables[0].Rows.Count > 0)
            {
                ddlSublineItem.DataSource = dsData.Tables[0];
                ddlSublineItem.DataTextField = "description";
                ddlSublineItem.DataValueField = "subline_item_id";
                ddlSublineItem.DataBind();
            }
            ddlSublineItem.Items.Insert(0, "--Select--");
            ddlFormulaType.ClearSelection();
            ddlSublineItem.ClearSelection();
            grvGLCode.ClearGrid_FA();
            ddlSublineItem.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ddlItemHeader_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlAccNature.ClearSelection();
        ddlSublineItem.Items.Insert(0, "--Select--");
        ddlFormulaType.ClearSelection();
        ddlSublineItem.ClearSelection();
        grvGLCode.ClearGrid_FA();
        ddlAccNature.Focus();
    }

    private void funBindActivity()
    {

        DataSet Dset = new DataSet();
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@OPTION", "1");
        Dset = Utility_FA.GetDataset("FA_SYS_GET_ACTIVITY", Procparam);

        this.grvActivityList.DataSource = Dset.Tables[0];
        this.grvActivityList.DataBind();

        

    }

    // Add by : Boobalan M
    protected void grvActivity_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAllRole");

                CheckBox chkSelectAllLI = (CheckBox)e.Row.FindControl("chkSelectAllLI");
                chkSelectAllLI.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + this.grvActivityList.ClientID + "',this,'chkSelectLI');");
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
}