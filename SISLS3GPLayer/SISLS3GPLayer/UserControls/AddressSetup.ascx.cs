using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using S3GBusEntity;

public partial class UserControls_AddressSetup : System.Web.UI.UserControl
{
    #region Intialization


    #endregion
    public void SetAddressDetails(string PostalCode_Text, string PostalCode_Value, string PostBoxNo, string WayNo, string HouseNo, string BlockNo, string FlatNo,
                                   string LandMark, string AreaSheik, string ResidencePhoneNo, string ResidenceFaxNo, string MobilePhoneNo,
                                   string ContactName, string ContactNo, string OfficePhoneNo, string OfficeFaxNo, string CustomerEmail, string PostalCode_Label,
                                   bool IsPostalCode_Mandatory)
    {
        //ddlPostal_Code.Text = PostalCode;
        ddlPostal_Code.SelectedText = PostalCode_Text;
        ddlPostal_Code.SelectedValue = PostalCode_Value;
        txtPost_Box_No.Text = PostBoxNo;
        txtWay_No.Text = WayNo;
        txtHouse_No.Text = HouseNo;
        txtBlock_No.Text = BlockNo;
        txtFlat_No.Text = FlatNo;
        txtLand_Mark.Text = LandMark;
        txtArea_Sheik.Text = AreaSheik;
        txtRes_Phone_No.Text = ResidencePhoneNo;
        txtRes_Fax_No.Text = ResidenceFaxNo;
        txtMob_Phone_No.Text = MobilePhoneNo;
        txtContact_name.Text = ContactName;
        txtContact_No.Text = ContactNo;
        txtOff_Phone_No.Text = OfficePhoneNo;
        txtOff_Fax_No.Text = OfficeFaxNo;
        txtCust_Email.Text = CustomerEmail;

        lblPostal_Code.Text = PostalCode_Label;
        ddlPostal_Code.IsMandatory = IsPostalCode_Mandatory;


    }

    public void SetAddressDetails(DataRow drAddress)
    {
        if (drAddress != null)
        {
            if (drAddress.Table.Columns["Postal_Code_Text"] != null)
            {
                ddlPostal_Code.SelectedText = drAddress["Postal_Code_Text"].ToString();
                ddlPostal_Code.SelectedValue = drAddress["Postal_Code_Value"].ToString();
            }
            if (drAddress.Table.Columns["Post_Box_No"] != null)
                txtPost_Box_No.Text = drAddress["Post_Box_No"].ToString();

            if (drAddress.Table.Columns["Way_No"] != null)
                txtWay_No.Text = drAddress["Way_No"].ToString();

            if (drAddress.Table.Columns["House_No"] != null)
                txtHouse_No.Text = drAddress["House_No"].ToString();

            if (drAddress.Table.Columns["Block_No"] != null)
                txtBlock_No.Text = drAddress["Block_No"].ToString();

            if (drAddress.Table.Columns["Flat_No"] != null)
                txtFlat_No.Text = drAddress["Flat_No"].ToString();

            if (drAddress.Table.Columns["LandMark"] != null)
                txtLand_Mark.Text = drAddress["LandMark"].ToString();

            if (drAddress.Table.Columns["Area_Sheik"] != null)
            {
                txtArea_Sheik.Text = drAddress["Area_Sheik"].ToString();
            }

            if (drAddress.Table.Columns["Residence_Phone_No"] != null)
                txtRes_Phone_No.Text = drAddress["Residence_Phone_No"].ToString();

            if (drAddress.Table.Columns["Residence_Fax_No"] != null)
                txtRes_Fax_No.Text = drAddress["Residence_Fax_No"].ToString();

            if (drAddress.Table.Columns["Mobile_Phone_No"] != null)
                txtMob_Phone_No.Text = drAddress["Mobile_Phone_No"].ToString();

            if (drAddress.Table.Columns["Contact_Name"] != null)
                txtContact_name.Text = drAddress["Contact_Name"].ToString();

            if (drAddress.Table.Columns["Contact_No"] != null)
                txtContact_No.Text = drAddress["Contact_No"].ToString();

            if (drAddress.Table.Columns["Office_Phone_No"] != null)
                txtOff_Phone_No.Text = drAddress["Office_Phone_No"].ToString();

            if (drAddress.Table.Columns["Office_Fax_No"] != null)
                txtOff_Fax_No.Text = drAddress["Office_Fax_No"].ToString();

            if (drAddress.Table.Columns["Cust_Email"] != null)
                txtCust_Email.Text = drAddress["Cust_Email"].ToString();
        }
    }

    public void BindAddressSetupDetails(int address_typeID)
    {

        /*
            Address_TypeID  Description
            1- Communication
            2- Corporation
        */
        DataSet ds = new DataSet();

        Dictionary<string, string> Procparam = new Dictionary<string, string>();

        Procparam.Add("@Lookup_Type", "1"); // 1 for Address Setup
        DataTable dtAddressSetupDetails = Utility.GetDefaultData("S3G_SYSAD_GET_ADDRESS_SETUP", Procparam);

        if (dtAddressSetupDetails.Rows.Count > 0)
        {
            if (dtAddressSetupDetails.Rows[0]["IS_DISPLAY"].ToString() == "1") //Postal Code
            {
                lblPostal_Code.Text = dtAddressSetupDetails.Rows[0]["DISPLAY_TEXT"].ToString();
                ddlPostal_Code.ToolTip = dtAddressSetupDetails.Rows[0]["TOOL_TIP"].ToString();

                if (dtAddressSetupDetails.Rows[0]["IS_MANDATORY"].ToString() == "1")
                {
                    lblPostal_Code.CssClass = "styleReqFieldLabel";
                    ddlPostal_Code.IsMandatory = true;
                    ddlPostal_Code.ErrorMessage = "Select the " + lblPostal_Code.Text;


                    //if (address_typeID == 1)
                    //    ddlPostal_Code.ErrorMessage = "Enter the " + lblPostal_Code.Text + " in Communication Address";
                    //else if (address_typeID == 2)
                    //    ddlPostal_Code.ErrorMessage = "Enter the " + lblPostal_Code.Text + " in Corporation Address";

                }

                tdddlPostal_Code.Visible = true;
            }
            if (dtAddressSetupDetails.Rows[1]["IS_DISPLAY"].ToString() == "1") //Post Box No
            {
                lblPost_Box_No.Text = dtAddressSetupDetails.Rows[1]["DISPLAY_TEXT"].ToString();
                txtPost_Box_No.ToolTip = dtAddressSetupDetails.Rows[1]["TOOL_TIP"].ToString();

                if (dtAddressSetupDetails.Rows[1]["IS_MANDATORY"].ToString() == "1")
                {
                    lblPost_Box_No.CssClass = "styleReqFieldLabel";
                    rfvtxtPost_Box_No.Enabled = true;
                    rfvtxtPost_Box_No.ErrorMessage = "Enter the " + lblPost_Box_No.Text;

                    //if (address_typeID == 1)
                    //    rfvtxtPost_Box_No.ErrorMessage = "Enter the " + lblPost_Box_No.Text + " No in Communication Address";
                    //else if (address_typeID == 2)
                    //    rfvtxtPost_Box_No.ErrorMessage = "Enter the " + lblPost_Box_No.Text + " in Corporation Address";


                }

                tdtxtPost_Box_No.Visible = true;
            }
            if (dtAddressSetupDetails.Rows[2]["IS_DISPLAY"].ToString() == "1") //Way No
            {
                lblWay_No.Text = dtAddressSetupDetails.Rows[2]["DISPLAY_TEXT"].ToString();
                txtWay_No.ToolTip = dtAddressSetupDetails.Rows[2]["TOOL_TIP"].ToString();

                if (dtAddressSetupDetails.Rows[2]["IS_MANDATORY"].ToString() == "1")
                {
                    lblWay_No.CssClass = "styleReqFieldLabel";
                    rfvtxtWay_No.Enabled = true;
                    rfvtxtWay_No.ErrorMessage = "Enter the " + lblWay_No.Text;

                    //if (address_typeID == 1)
                    //    rfvtxtWay_No.ErrorMessage = "Enter the " + lblWay_No.Text + " in Communication Address";
                    //else if (address_typeID == 2)
                    //    rfvtxtWay_No.ErrorMessage = "Enter the " + lblWay_No.Text + " in Corporation Address";
                }

                tdtxtWay_No.Visible = true;
            }
        }
        if (dtAddressSetupDetails.Rows[3]["IS_DISPLAY"].ToString() == "1") //House No
        {
            lblHouse_No.Text = dtAddressSetupDetails.Rows[3]["DISPLAY_TEXT"].ToString();
            txtHouse_No.ToolTip = dtAddressSetupDetails.Rows[3]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[3]["IS_MANDATORY"].ToString() == "1")
            {
                lblHouse_No.CssClass = "styleReqFieldLabel";
                rfvtxtHouse_No.Enabled = true;
                rfvtxtHouse_No.ErrorMessage = "Enter the " + lblHouse_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtHouse_No.ErrorMessage = "Enter the " + lblHouse_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtHouse_No.ErrorMessage = "Enter the " + lblHouse_No.Text + " in Corporation Address";
            }

            tdlblHouse_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[4]["IS_DISPLAY"].ToString() == "1") //Block No
        {
            lblBlock_No.Text = dtAddressSetupDetails.Rows[4]["DISPLAY_TEXT"].ToString();
            txtBlock_No.ToolTip = dtAddressSetupDetails.Rows[4]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[4]["IS_MANDATORY"].ToString() == "1")
            {
                lblBlock_No.CssClass = "styleReqFieldLabel";
                rfvtxtBlock_No.Enabled = true;
                rfvtxtBlock_No.ErrorMessage = "Enter the " + lblBlock_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtBlock_No.ErrorMessage = "Enter the " + lblBlock_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtBlock_No.ErrorMessage = "Enter the " + lblBlock_No.Text + " in Corporation Address";
            }

            tdlblBlock_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[5]["IS_DISPLAY"].ToString() == "1") //Flat No
        {
            lblFlat_No.Text = dtAddressSetupDetails.Rows[5]["DISPLAY_TEXT"].ToString();
            txtFlat_No.ToolTip = dtAddressSetupDetails.Rows[5]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[5]["IS_MANDATORY"].ToString() == "1")
            {
                lblFlat_No.CssClass = "styleReqFieldLabel";
                rfvtxtFlat_No.Enabled = true;
                rfvtxtFlat_No.ErrorMessage = "Enter the " + lblFlat_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtFlat_No.ErrorMessage = "Enter the " + lblFlat_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtFlat_No.ErrorMessage = "Enter the " + lblFlat_No.Text + " in Corporation Address";
            }

            tdlblFlat_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[6]["IS_DISPLAY"].ToString() == "1") //Land Mark
        {
            lblLand_Mark.Text = dtAddressSetupDetails.Rows[6]["DISPLAY_TEXT"].ToString();
            txtLand_Mark.ToolTip = dtAddressSetupDetails.Rows[6]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[6]["IS_MANDATORY"].ToString() == "1")
            {
                lblLand_Mark.CssClass = "styleReqFieldLabel";
                rfvtxtLand_Mark.Enabled = true;
                rfvtxtLand_Mark.ErrorMessage = "Enter the " + lblLand_Mark.Text;

                //if (address_typeID == 1)
                //    rfvtxtLand_Mark.ErrorMessage = "Enter the " + lblLand_Mark.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtLand_Mark.ErrorMessage = "Enter the " + lblLand_Mark.Text + " in Corporation Address";
            }

            tdlblLand_Mark.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[7]["IS_DISPLAY"].ToString() == "1") //Area Sheik
        {
            lblArea_Sheik.Text = dtAddressSetupDetails.Rows[7]["DISPLAY_TEXT"].ToString();
            txtArea_Sheik.ToolTip = dtAddressSetupDetails.Rows[7]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[7]["IS_MANDATORY"].ToString() == "1")
            {
                lblArea_Sheik.CssClass = "styleReqFieldLabel";
                rfvtxtArea_Sheik.Enabled = true;
                rfvtxtArea_Sheik.ErrorMessage = "Enter the " + lblArea_Sheik.Text;

                //if (address_typeID == 1)
                //    ddlArea_Sheik.ErrorMessage = "Enter the " + lblArea_Sheik.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    ddlArea_Sheik.ErrorMessage = "Enter the " + lblArea_Sheik.Text + " in Corporation Address";
            }

            tdlblArea_Sheik.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[8]["IS_DISPLAY"].ToString() == "1") //Residence Phone Number
        {
            lblRes_Phone_No.Text = dtAddressSetupDetails.Rows[8]["DISPLAY_TEXT"].ToString();
            txtRes_Phone_No.ToolTip = dtAddressSetupDetails.Rows[8]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[8]["IS_MANDATORY"].ToString() == "1")
            {
                lblRes_Phone_No.CssClass = "styleReqFieldLabel";
                rfvtxtRes_Phone_No.Enabled = true;
                rfvtxtRes_Phone_No.ErrorMessage = "Enter the " + lblRes_Phone_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtRes_Phone_No.ErrorMessage = "Enter the " + lblRes_Phone_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtRes_Phone_No.ErrorMessage = "Enter the " + lblRes_Phone_No.Text + " in Corporation Address";
            }

            tdlblRes_Phone_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[9]["IS_DISPLAY"].ToString() == "1") //Residence Fax Number
        {
            lblRes_Fax_No.Text = dtAddressSetupDetails.Rows[9]["DISPLAY_TEXT"].ToString();
            txtRes_Fax_No.ToolTip = dtAddressSetupDetails.Rows[9]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[9]["IS_MANDATORY"].ToString() == "1")
            {
                lblRes_Fax_No.CssClass = "styleReqFieldLabel";
                rfvtxtRes_Fax_No.Enabled = true;
                rfvtxtRes_Fax_No.ErrorMessage = "Enter the " + lblRes_Fax_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtRes_Fax_No.ErrorMessage = "Enter the " + lblRes_Fax_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtRes_Fax_No.ErrorMessage = "Enter the " + lblRes_Fax_No.Text + " in Corporation Address";
            }

            tdlblRes_Fax_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[10]["IS_DISPLAY"].ToString() == "1") //Mobile Phone Number
        {
            lblMob_Phone_No.Text = dtAddressSetupDetails.Rows[10]["DISPLAY_TEXT"].ToString();
            txtMob_Phone_No.ToolTip = dtAddressSetupDetails.Rows[10]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[10]["IS_MANDATORY"].ToString() == "1")
            {
                lblMob_Phone_No.CssClass = "styleReqFieldLabel";
                rfvtxtMob_Phone_No.Enabled = true;
                rfvtxtMob_Phone_No.ErrorMessage = "Enter the " + lblMob_Phone_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtMob_Phone_No.ErrorMessage = "Enter the " + lblMob_Phone_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtMob_Phone_No.ErrorMessage = "Enter the " + lblMob_Phone_No.Text + " in Corporation Address";
            }

            tdlblMob_Phone_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[11]["IS_DISPLAY"].ToString() == "1") //Contact Name
        {
            lblContact_name.Text = dtAddressSetupDetails.Rows[11]["DISPLAY_TEXT"].ToString();
            txtContact_name.ToolTip = dtAddressSetupDetails.Rows[11]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[11]["IS_MANDATORY"].ToString() == "1")
            {
                lblContact_name.CssClass = "styleReqFieldLabel";
                rfvtxtContact_name.Enabled = true;
                rfvtxtContact_name.ErrorMessage = "Enter the " + lblContact_name.Text;

                //if (address_typeID == 1)
                //    rfvtxtContact_name.ErrorMessage = "Enter the " + lblContact_name.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtContact_name.ErrorMessage = "Enter the " + lblContact_name.Text + " in Corporation Address";
            }

            tdlblContact_name.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[12]["IS_DISPLAY"].ToString() == "1") //Contact No
        {
            lblContact_No.Text = dtAddressSetupDetails.Rows[12]["DISPLAY_TEXT"].ToString();
            txtContact_No.ToolTip = dtAddressSetupDetails.Rows[12]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[12]["IS_MANDATORY"].ToString() == "1")
            {
                lblContact_No.CssClass = "styleReqFieldLabel";
                rfvtxtContact_No.Enabled = true;
                rfvtxtContact_No.ErrorMessage = "Enter the " + lblContact_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtContact_No.ErrorMessage = "Enter the " + lblContact_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtContact_No.ErrorMessage = "Enter the " + lblContact_No.Text + " in Corporation Address";
            }

            tdlblContact_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[13]["IS_DISPLAY"].ToString() == "1") //Office Phone No
        {
            lblOff_Phone_No.Text = dtAddressSetupDetails.Rows[13]["DISPLAY_TEXT"].ToString();
            txtOff_Phone_No.ToolTip = dtAddressSetupDetails.Rows[13]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[13]["IS_MANDATORY"].ToString() == "1")
            {
                lblOff_Phone_No.CssClass = "styleReqFieldLabel";
                rfvtxtOff_Phone_No.Enabled = true;
                rfvtxtOff_Phone_No.ErrorMessage = "Enter the " + lblOff_Phone_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtOff_Phone_No.ErrorMessage = "Enter the " + lblOff_Phone_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtOff_Phone_No.ErrorMessage = "Enter the " + lblOff_Phone_No.Text + " in Corporation Address";
            }

            tdtxtOff_Phone_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[14]["IS_DISPLAY"].ToString() == "1") //Office Fax No
        {
            lblOff_Fax_No.Text = dtAddressSetupDetails.Rows[14]["DISPLAY_TEXT"].ToString();
            txtOff_Fax_No.ToolTip = dtAddressSetupDetails.Rows[14]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[14]["IS_MANDATORY"].ToString() == "1")
            {
                lblOff_Fax_No.CssClass = "styleReqFieldLabel";
                rfvtxtOff_Fax_No.Enabled = true;
                rfvtxtOff_Fax_No.ErrorMessage = "Enter the " + lblOff_Fax_No.Text;

                //if (address_typeID == 1)
                //    rfvtxtOff_Fax_No.ErrorMessage = "Enter the " + lblOff_Fax_No.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtOff_Fax_No.ErrorMessage = "Enter the " + lblOff_Fax_No.Text + " in Corporation Address";
            }

            tdlblOff_Fax_No.Visible = true;
        }
        if (dtAddressSetupDetails.Rows[15]["IS_DISPLAY"].ToString() == "1") //Customer Email
        {
            lblCust_Email.Text = dtAddressSetupDetails.Rows[15]["DISPLAY_TEXT"].ToString();
            txtCust_Email.ToolTip = dtAddressSetupDetails.Rows[15]["TOOL_TIP"].ToString();

            if (dtAddressSetupDetails.Rows[15]["IS_MANDATORY"].ToString() == "1")
            {
                lblCust_Email.CssClass = "styleReqFieldLabel";
                rfvtxtCust_Email.Enabled = true;
                revtxtCust_Email.Enabled = true;
                rfvtxtCust_Email.ErrorMessage = "Enter the " + lblCust_Email.Text;

                //if (address_typeID == 1)
                //    rfvtxtCust_Email.ErrorMessage = "Enter the " + lblCust_Email.Text + " in Communication Address";
                //else if (address_typeID == 2)
                //    rfvtxtCust_Email.ErrorMessage = "Enter the " + lblCust_Email.Text + " in Corporation Address";
            }

            tdlblCust_Email.Visible = true;
        }


    }

    /// <summary>
    /// void
    /// Fill the controls with the given user defined column value 
    /// </summary>
    /// <param name="PostalCode"></param>
    /// <param name="PostBoxNo"></param>
    /// <param name="WayNo"></param>
    /// <param name="HouseNo"></param>
    /// <param name="BlokNo"></param>
    /// <param name="FlatNo"></param>
    /// <param name="AreaSheik"></param>
    /// <param name="ResidencePhoneNo"></param>
    /// <param name="ResidenceFaxNo"></param>
    /// <param name="MobilePhoneNo"></param>
    /// <param name="ContactName"></param>
    /// <param name="ContactNo"></param>
    /// <param name="OfficePhoneNo"></param>
    /// <param name="OfficeFaxNo"></param>
    /// <param name="CustomerEmail"></param>

    /// <summary>
    /// string
    /// Get and Set the Postal Code
    /// </summary>
    public string PostalCode_Text
    {
        get
        {
            // return ddlPostal_Code.Text;
            return ddlPostal_Code.SelectedText;
        }
        set
        {
            ddlPostal_Code.SelectedText = value;
        }
    }

    public string PostalCode_Value
    {
        get
        {
            // return ddlPostal_Code.Text;
            return ddlPostal_Code.SelectedValue;
        }
        set
        {
            ddlPostal_Code.SelectedValue = value;
        }
    }
    public string PostBoxNo
    {
        get
        {
            return txtPost_Box_No.Text;
        }
        set
        {
            txtPost_Box_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Way No
    /// </summary>
    public string WayNo
    {
        get
        {
            return txtWay_No.Text;
        }
        set
        {
            txtWay_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the House No
    /// </summary>
    public string HouseNo
    {
        get
        {
            return txtHouse_No.Text;
        }
        set
        {
            txtHouse_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Block No
    /// </summary>
    public string BlockNo
    {
        get
        {
            return txtBlock_No.Text;
        }
        set
        {
            txtBlock_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Flat No
    /// </summary>
    public string FlatNo
    {
        get
        {
            return txtFlat_No.Text;
        }
        set
        {
            txtFlat_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the LandMark
    /// </summary>
    public string LandMark
    {
        get
        {
            return txtLand_Mark.Text;
        }
        set
        {
            txtLand_Mark.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Area Sheik
    /// </summary>
    public string AreaSheik
    {
        get
        {
            return txtArea_Sheik.Text;
        }
        set
        {
            txtArea_Sheik.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Residence Phone No
    /// </summary>
    public string ResidencePhoneNo
    {
        get
        {
            return txtRes_Phone_No.Text;
        }
        set
        {
            txtRes_Phone_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Residence Fax No
    /// </summary>
    public string ResidenceFaxNo
    {
        get
        {
            return txtRes_Fax_No.Text;
        }
        set
        {
            txtRes_Fax_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Mobile Phone No
    /// </summary>
    public string MobilePhoneNo
    {
        get
        {
            return txtMob_Phone_No.Text;
        }
        set
        {
            txtMob_Phone_No.Text = value;
        }

    }

    /// <summary>
    /// string
    /// Get and Set the Contact Name
    /// </summary>
    public string ContactName
    {
        get
        {
            return txtContact_name.Text;
        }
        set
        {
            txtContact_name.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Contact Number
    /// </summary>
    public string ContactNo
    {
        get
        {
            return txtContact_No.Text;
        }
        set
        {
            txtContact_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Office Phone No
    /// </summary>
    public string OfficePhoneNo
    {
        get
        {
            return txtOff_Phone_No.Text;
        }
        set
        {
            txtOff_Phone_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Office Fax No
    /// </summary>
    public string OfficeFaxNo
    {
        get
        {
            return txtOff_Fax_No.Text;
        }
        set
        {
            txtOff_Fax_No.Text = value;
        }
    }

    /// <summary>
    /// string
    /// Get and Set the Customer Email
    /// </summary>
    public string CustomerEmail
    {
        get
        {
            return txtCust_Email.Text;
        }
        set
        {
            txtCust_Email.Text = value;
        }
    }

    public string PostalCode_Label
    {
        get
        {
            // return ddlPostal_Code.Text;
            return lblPostal_Code.Text;
        }
        set
        {
            lblPostal_Code.Text = value;
        }
    }

    public bool IsPostalCode_Mandatory
    {
        get
        {
            return ddlPostal_Code.IsMandatory;
        }
        set
        {
            ddlPostal_Code.IsMandatory = value;
        }
    }



    public bool ReadOnly(bool isReadOnly)
    {
        ddlPostal_Code.Enabled = !isReadOnly;
        txtPost_Box_No.ReadOnly = isReadOnly;
        txtWay_No.ReadOnly = isReadOnly;
        txtHouse_No.ReadOnly = isReadOnly;
        txtBlock_No.ReadOnly = isReadOnly;
        txtFlat_No.ReadOnly = isReadOnly;
        txtLand_Mark.ReadOnly = isReadOnly;
        txtArea_Sheik.ReadOnly = isReadOnly;
        txtRes_Phone_No.ReadOnly = isReadOnly;
        txtRes_Fax_No.ReadOnly = isReadOnly;
        txtMob_Phone_No.ReadOnly = isReadOnly;
        txtContact_name.ReadOnly = isReadOnly;
        txtContact_No.ReadOnly = isReadOnly;
        txtOff_Phone_No.ReadOnly = isReadOnly;
        txtOff_Fax_No.ReadOnly = isReadOnly;
        txtCust_Email.ReadOnly = isReadOnly;
        return isReadOnly;
    }

    public void ClearControls()
    {
        ddlPostal_Code.SelectedText = "";
        ddlPostal_Code.SelectedValue = "0";
        txtPost_Box_No.Clear();
        txtWay_No.Clear();
        txtHouse_No.Clear();
        txtBlock_No.Clear();
        txtFlat_No.Clear();
        txtLand_Mark.Clear();
        txtArea_Sheik.Clear();
        txtRes_Phone_No.Clear();
        txtRes_Fax_No.Clear();
        txtMob_Phone_No.Clear();
        txtContact_name.Clear();
        txtContact_No.Clear();
        txtOff_Phone_No.Clear();
        txtOff_Fax_No.Clear();
        txtCust_Email.Clear();
    }
    public string ValGroup(string strValGroup)
    {
        ddlPostal_Code.ValidationGroup = strValGroup;
        rfvtxtPost_Box_No.ValidationGroup = strValGroup;
        rfvtxtWay_No.ValidationGroup = strValGroup;
        rfvtxtHouse_No.ValidationGroup = strValGroup;
        rfvtxtBlock_No.ValidationGroup = strValGroup;
        rfvtxtFlat_No.ValidationGroup = strValGroup;
        rfvtxtLand_Mark.ValidationGroup = strValGroup;
        rfvtxtArea_Sheik.ValidationGroup = strValGroup;
        rfvtxtRes_Phone_No.ValidationGroup = strValGroup;
        rfvtxtRes_Fax_No.ValidationGroup = strValGroup;
        rfvtxtMob_Phone_No.ValidationGroup = strValGroup;
        rfvtxtContact_name.ValidationGroup = strValGroup;
        rfvtxtContact_No.ValidationGroup = strValGroup;
        rfvtxtOff_Phone_No.ValidationGroup = strValGroup;
        rfvtxtOff_Fax_No.ValidationGroup = strValGroup;
        rfvtxtCust_Email.ValidationGroup = strValGroup;
        revtxtCust_Email.ValidationGroup = strValGroup;
        return strValGroup;
    }
}