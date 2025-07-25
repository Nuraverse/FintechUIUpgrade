using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_NameSetup : System.Web.UI.UserControl
{
    public delegate void Text_ChangedEvent(object sender, EventArgs e);
    public event Text_ChangedEvent text_changed;

    public void SetNameObjectDetails(string FirstName, string SecondName, string ThirdName, string FourthName, string FifthName,
                                        string SixthName)
    {
        txtFirst_Name.Text = FirstName;
        txtSecond_Name.Text = SecondName;
        txtThird_Name.Text = ThirdName;
        txtFourth_Name.Text = FourthName;
        txtFifth_Name.Text = FifthName;
        txtSixth_Name.Text = SixthName;
    }


    public void SetNameObjectDetails(DataRow drNameSetup)
    {
        if (drNameSetup != null)
        {
            if (drNameSetup.Table.Columns["First_Name"] != null)
                txtFirst_Name.Text = drNameSetup["First_Name"].ToString();

            if (drNameSetup.Table.Columns["Second_Name"] != null)
                txtSecond_Name.Text = drNameSetup["Second_Name"].ToString();

            if (drNameSetup.Table.Columns["Third_Name"] != null)
                txtThird_Name.Text = drNameSetup["Third_Name"].ToString();

            if (drNameSetup.Table.Columns["Fourth_Name"] != null)
                txtFourth_Name.Text = drNameSetup["Fourth_Name"].ToString();

            if (drNameSetup.Table.Columns["Fifth_Name"] != null)
                txtFifth_Name.Text = drNameSetup["Fifth_Name"].ToString();

            if (drNameSetup.Table.Columns["Sixth_Name"] != null)
                txtSixth_Name.Text = drNameSetup["Sixth_Name"].ToString();
        }
    }
    public void BindNameSetupDetails()
    {

        DataSet ds = new DataSet();

        Dictionary<string, string> Procparam = new Dictionary<string, string>();

        Procparam.Add("@Lookup_Type", "2"); // 1 for Name Setup
        DataTable dtNameSetupDetails = Utility.GetDefaultData("S3G_SYSAD_GET_ADDRESS_SETUP", Procparam);

        if (dtNameSetupDetails.Rows.Count > 0)
        {
            if (dtNameSetupDetails.Rows[0]["IS_DISPLAY"].ToString() == "1") //First Name
            {
                lblFirst_Name.Text = dtNameSetupDetails.Rows[0]["DISPLAY_TEXT"].ToString();
                lblFirst_Name.ToolTip = dtNameSetupDetails.Rows[0]["TOOL_TIP"].ToString();

                if (dtNameSetupDetails.Rows[0]["IS_MANDATORY"].ToString() == "1")
                {
                    lblFirst_Name.CssClass = "styleReqFieldLabel";
                    rfvtxtFirst_Name.Enabled = true;
                    rfvtxtFirst_Name.ErrorMessage = "Enter the " + lblFirst_Name.Text;
                }

                tdlblFirst_Name.Visible = true;
            }
            if (dtNameSetupDetails.Rows[1]["IS_DISPLAY"].ToString() == "1") //Second Name
            {
                lblSecond_Name.Text = dtNameSetupDetails.Rows[1]["DISPLAY_TEXT"].ToString();
                lblSecond_Name.ToolTip = dtNameSetupDetails.Rows[1]["TOOL_TIP"].ToString();

                if (dtNameSetupDetails.Rows[1]["IS_MANDATORY"].ToString() == "1")
                {
                    lblSecond_Name.CssClass = "styleReqFieldLabel";
                    rfvtxtSecond_Name.Enabled = true;
                    rfvtxtSecond_Name.ErrorMessage = "Enter the " + lblSecond_Name.Text;
                }

                tdlblSecond_Name.Visible = true;
            }
            if (dtNameSetupDetails.Rows[2]["IS_DISPLAY"].ToString() == "1") //Third Name
            {
                lblThird_Name.Text = dtNameSetupDetails.Rows[2]["DISPLAY_TEXT"].ToString();
                lblThird_Name.ToolTip = dtNameSetupDetails.Rows[2]["TOOL_TIP"].ToString();

                if (dtNameSetupDetails.Rows[2]["IS_MANDATORY"].ToString() == "1")
                {
                    lblThird_Name.CssClass = "styleReqFieldLabel";
                    rfvtxtThird_Name.Enabled = true;
                    rfvtxtThird_Name.ErrorMessage = "Enter the " + lblThird_Name.Text;
                }

                tdlblThird_Name.Visible = true;
            }
            if (dtNameSetupDetails.Rows[3]["IS_DISPLAY"].ToString() == "1") //Fourth Name
            {
                lblFourth_Name.Text = dtNameSetupDetails.Rows[3]["DISPLAY_TEXT"].ToString();
                lblFourth_Name.ToolTip = dtNameSetupDetails.Rows[3]["TOOL_TIP"].ToString();

                if (dtNameSetupDetails.Rows[3]["IS_MANDATORY"].ToString() == "1")
                {
                    lblFourth_Name.CssClass = "styleReqFieldLabel";
                    rfvtxtFourth_Name.Enabled = true;
                    rfvtxtFourth_Name.ErrorMessage = "Enter the " + lblFourth_Name.Text;
                }

                tdlblFourth_Name.Visible = true;
            }
            if (dtNameSetupDetails.Rows[4]["IS_DISPLAY"].ToString() == "1") //Fifth Name
            {
                lblFifth_Name.Text = dtNameSetupDetails.Rows[4]["DISPLAY_TEXT"].ToString();
                lblFifth_Name.ToolTip = dtNameSetupDetails.Rows[4]["TOOL_TIP"].ToString();

                if (dtNameSetupDetails.Rows[4]["IS_MANDATORY"].ToString() == "1")
                {
                    lblFifth_Name.CssClass = "styleReqFieldLabel";
                    rfvtxtFifth_Name.Enabled = true;
                    rfvtxtFifth_Name.ErrorMessage = "Enter the " + lblFifth_Name.Text;
                }

                tdlblFifth_Name.Visible = true;
            }
            if (dtNameSetupDetails.Rows[5]["IS_DISPLAY"].ToString() == "1") //Sixth Name
            {
                lblSixth_Name.Text = dtNameSetupDetails.Rows[5]["DISPLAY_TEXT"].ToString();
                lblSixth_Name.ToolTip = dtNameSetupDetails.Rows[5]["TOOL_TIP"].ToString();

                if (dtNameSetupDetails.Rows[5]["IS_MANDATORY"].ToString() == "1")
                {
                    lblSixth_Name.CssClass = "styleReqFieldLabel";
                    rfvtxtSixth_Name.Enabled = true;
                    rfvtxtSixth_Name.ErrorMessage = "Enter the " + lblSixth_Name.Text;
                }

                tdlblSixth_Name.Visible = true;
            }
        }
    }


    /// <summary>
    /// void
    /// Fill the controls with the given user defined column value 
    /// </summary>
    /// <param name="FirstName"></param>
    /// <param name="SecondName"></param>
    /// <param name="ThirdName"></param>
    /// <param name="FourthName"></param>
    /// <param name="FifthName"></param>
    /// <param name="SixthName"></param>

    /// <summary>
    /// string
    /// Get and Set the First Name
    /// </summary>
    public string FirstName
    {
        get
        {
            return txtFirst_Name.Text;
        }
        set
        {
            txtFirst_Name.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Second Name
    /// </summary>
    public string SecondName
    {
        get
        {
            return txtSecond_Name.Text;
        }
        set
        {
            txtSecond_Name.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Third Name
    /// </summary>
    public string ThirdName
    {
        get
        {
            return txtThird_Name.Text;
        }
        set
        {
            txtThird_Name.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Fourth Name
    /// </summary>
    public string FourthName
    {
        get
        {
            return txtFourth_Name.Text;
        }
        set
        {
            txtFourth_Name.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Fifth Name
    /// </summary>
    public string FifthName
    {
        get
        {
            return txtFifth_Name.Text;
        }
        set
        {
            txtFifth_Name.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Sixth Name
    /// </summary>
    public string SixthName
    {
        get
        {
            return txtSixth_Name.Text;
        }
        set
        {
            txtSixth_Name.Text = value;
        }
    }

    public bool ReadOnly(bool isReadOnly)
    {
        txtFirst_Name.ReadOnly = isReadOnly;
        txtSecond_Name.ReadOnly = isReadOnly;
        txtThird_Name.ReadOnly = isReadOnly;
        txtFourth_Name.ReadOnly = isReadOnly;
        txtFifth_Name.ReadOnly = isReadOnly;
        txtSixth_Name.ReadOnly = isReadOnly;
        return isReadOnly;
    }

    #region Text Changed Events


    protected void txtFirst_Name_TextChanged(object sender, EventArgs e)
    {
        if (text_changed != null)
        {
            text_changed(sender, e);


        }
        // txtFirst_Name.Focus();
    }

    protected void txtSecond_Name_TextChanged(object sender, EventArgs e)
    {
        if (text_changed != null)
        {
            text_changed(sender, e);
            //  txtSecond_Name.Focus();
        }
    }

    protected void txtThird_Name_TextChanged(object sender, EventArgs e)
    {
        if (text_changed != null)
        {
            text_changed(sender, e);
            //txtThird_Name.Focus();
        }
    }

    protected void txtFourth_Name_TextChanged(object sender, EventArgs e)
    {
        if (text_changed != null)
        {
            text_changed(sender, e);
            //txtFourth_Name.Focus();
        }
    }

    protected void txtFifth_Name_TextChanged(object sender, EventArgs e)
    {
        if (text_changed != null)
        {
            text_changed(sender, e);
            // txtFifth_Name.Focus();
        }
    }

    protected void txtSixth_Name_TextChanged(object sender, EventArgs e)
    {
        if (text_changed != null)
        {
            text_changed(sender, e);
            // txtSixth_Name.Focus();
        }
    }
    #endregion

    public void ClearControls()
    {
        txtFirst_Name.Clear();
        txtSecond_Name.Clear();
        txtThird_Name.Clear();
        txtFourth_Name.Clear();
        txtFifth_Name.Clear();
        txtSixth_Name.Clear();
    }

    public string ValGroup(string strValGroup)
    {
        rfvtxtFirst_Name.ValidationGroup = strValGroup;
        rfvtxtSecond_Name.ValidationGroup = strValGroup;
        rfvtxtThird_Name.ValidationGroup = strValGroup;
        rfvtxtFourth_Name.ValidationGroup = strValGroup;
        rfvtxtFifth_Name.ValidationGroup = strValGroup;
        rfvtxtSixth_Name.ValidationGroup = strValGroup;
        return strValGroup;
    }
}