#region [Page Header]

/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name         :   Financial Accounting
/// Screen Name         :   AddressDetail
/// Created By          :   Tamilselvan.S
/// Created Date        :   12/03/2012
/// Purpose             :   To set Address details for selected code(Entity or Funder)
/// Last Updated By		:   NULL
/// Last Updated Date   :   NULL
/// Reason              :   NULL
/// <Program Summary> 

#endregion [Page Header]

#region [Namespace]

using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

#endregion [Namespace]

public partial class UserControls_FAAddressDetail : System.Web.UI.UserControl
{

    #region [Set address Details]

    /// <summary>
    /// void
    /// Fill the controls with the given data row 
    /// The data columns should be fetched as it is
    /// </summary>
    /// <param name="drAddress">
    /// Data row which is having the information
    /// </param>
    /// <param name="IsCommunication"> 
    /// True - if it is communication address
    /// </param>
    public void SetAddressDetails(DataRow drAddress, bool IsCommunication)
    {
        if (drAddress != null)
        {
            if (drAddress.Table.Columns["ID"] != null)
            {
                ID = Convert.ToString(drAddress["ID"]);
            }
            if (drAddress.Table.Columns["Code"] != null)
            {
                txtVCode.Text = txtHCode.Text = Convert.ToString(drAddress["Code"]);
            }
            if (drAddress.Table.Columns["Title"] != null)
            {
                txtVName.Text = txtHName.Text = Convert.ToString(drAddress["Title"]) + " " + Convert.ToString(drAddress["Name"]);
            }
            else
            {
                txtVName.Text = txtHName.Text = Convert.ToString(drAddress["Name"]);
            }
            if (drAddress.Table.Columns["GL_Desc"] != null)
            {
                txtVAccount.Text = txtHAccount.Text = Convert.ToString(drAddress["GL_Desc"]);
            }
            if (drAddress.Table.Columns["SL_Desc"] != null)
            {
                txtVSubaccount.Text = txtHSubAccount.Text = Convert.ToString(drAddress["SL_Desc"]);
            }
            if (drAddress.Table.Columns["Type"] != null)
            {
                hdnType.Value = Convert.ToString(drAddress["Type"]);
            }
            if (IsCommunication)
            {
                if (drAddress.Table.Columns["Mobile"] != null)
                {
                    txtVMobile.Text = txtHMobile.Text = Convert.ToString(drAddress["Mobile"]);
                }
                if (drAddress.Table.Columns.Contains("Telephone"))
                {
                    txtVPhone.Text = txtHPhone.Text = Convert.ToString(drAddress["Telephone"]);
                }
                if (drAddress.Table.Columns["Email"] != null)
                {
                    txtVEmail.Text = txtHEmail.Text = Convert.ToString(drAddress["Email"]);
                }
                if (drAddress.Table.Columns["WebSite"] != null)
                {
                    txtVWebSite.Text = txtHWebSite.Text = Convert.ToString(drAddress["WebSite"]);
                }
                txtVAddress.Text = txtHAddress.Text = Utility.SetVendorAddress(drAddress);
            }
            else
            {
                if (drAddress.Table.Columns["Mobile"] != null)
                {
                    txtVMobile.Text = txtHMobile.Text = Convert.ToString(drAddress["Mobile"]);
                }
                if (drAddress.Table.Columns.Contains("Telephone"))
                {
                    txtVPhone.Text = txtHPhone.Text = Convert.ToString(drAddress["Telephone"]);
                }
                if (drAddress.Table.Columns["Email"] != null)
                {
                    txtVEmail.Text = txtHEmail.Text = Convert.ToString(drAddress["Email"]);
                }
                if (drAddress.Table.Columns["WebSite"] != null)
                {
                    txtVWebSite.Text = txtHWebSite.Text = Convert.ToString(drAddress["WebSite"]);
                }
                txtVAddress.Text = txtHAddress.Text = Utility.SetVendorAddress(drAddress);
            }
        }
    }

    #endregion [Set address Details]

    #region [Clear address Details]
    /// <summary>
    /// void 
    /// Clear the values 
    /// </summary>
    public void ClearAddressDetails()
    {
        txtHCode.Text = txtVCode.Text = txtVName.Text = txtHName.Text =
        txtVMobile.Text = txtHMobile.Text = txtVPhone.Text = txtHPhone.Text =
        txtVEmail.Text = txtHEmail.Text = txtVWebSite.Text = txtHWebSite.Text =
        txtVAddress.Text = txtHAddress.Text = string.Empty;
        txtVSubaccount.Text = txtVAccount.Text =
        txtHSubAccount.Text = txtHAccount.Text = string.Empty;
    }

    #endregion [Clear address Details]

    #region [Properties]
    public String ID { get; set; }

    /// <summary>
    /// int 
    /// 0 - To show Vertical view
    /// 1 - To show Horizontal view
    /// </summary>
    public int ActiveViewIndex { set { mvAddressView.ActiveViewIndex = value; } }

    /// <summary>
    /// bool 
    /// Determine the visibility of Code field
    /// </summary>
    public bool ShowCode
    {
        set
        {
            V1FirstColumn1.Visible = V1SecondColumn1.Visible =
            FirstColumn1.Visible = SecondColumn1.Visible = value;
        }
    }

    /// <summary>
    /// bool
    /// Determine the visibility of Name field
    /// </summary>
    public bool ShowName
    {
        set
        {
            V1FirstColumn2.Visible = V1SecondColumn2.Visible =
            FirstColumn5.Visible = SecondColumn5.Visible = value;
        }
    }

    /// <summary>
    /// bool 
    /// Determine the visibility of Account field
    /// </summary>
    public bool ShowAccount
    {
        set
        {
            V1FirstColumn7.Visible = V1SecondColumn7.Visible =
            ThirdColumn1.Visible = FourthColumn1.Visible = value;
        }
    }

    /// <summary>
    /// bool
    /// Determine the visibility of Sub Account field
    /// </summary>
    public bool ShowSubAccount
    {
        set
        {
            V1FirstColumn8.Visible = V1SecondColumn8.Visible =
            ThirdColumn5.Visible = FourthColumn5.Visible = value;
        }
    }

    /// <summary>
    /// bool
    /// Determine the visibility of Name field
    /// </summary>
    public bool ShowTelePhone
    {
        set
        {
            lblVMobile.Visible = lblHMobile.Visible =
            txtVPhone.Visible = txtHPhone.Visible = false;

            lblVPhone.Text = lblHPhone.Text = "Mobile";
        }
    }

    /// <summary>
    /// string
    /// Set the width of first column
    /// </summary>
    public string FirstColumnWidth
    {
        set
        {
            V1FirstColumn1.Width = V1FirstColumn2.Width =
            V1FirstColumn3.Width = V1FirstColumn4.Width =
            V1FirstColumn5.Width = V1FirstColumn6.Width =
            V1FirstColumn7.Width = V1FirstColumn8.Width =
            FirstColumn1.Width = FirstColumn2.Width =
            FirstColumn3.Width = FirstColumn4.Width =
            FirstColumn5.Width = value;
        }
    }

    /// <summary>
    /// string
    /// Set the width of second column
    /// </summary>
    public string SecondColumnWidth
    {
        set
        {
            V1SecondColumn1.Width = V1SecondColumn2.Width =
            V1SecondColumn3.Width = V1SecondColumn4.Width =
            V1SecondColumn5.Width = V1SecondColumn6.Width =
            V1SecondColumn7.Width = V1SecondColumn8.Width =
            SecondColumn1.Width = SecondColumn2.Width = SecondColumn5.Width =
             value;
        }
    }

    /// <summary>
    /// string
    /// Set the width of third column
    /// </summary>
    public string ThirdColumnWidth
    {
        set
        {
            ThirdColumn1.Width = ThirdColumn2.Width =
            ThirdColumn3.Width = ThirdColumn4.Width =
            ThirdColumn5.Width = value;
        }
    }

    /// <summary>
    /// string
    /// Set the width of fourth column
    /// </summary>
    public string FourthColumnWidth
    {
        set
        {
            FourthColumn1.Width = FourthColumn2.Width =
            FourthColumn3.Width = FourthColumn4.Width =
            FourthColumn5.Width = value;
        }
    }

    /// <summary>
    /// string
    /// Set the style for first column
    /// </summary>
    public string FirstColumnStyle
    {
        set
        {
            V1FirstColumn1.Attributes.Add("class", value);
            V1FirstColumn2.Attributes.Add("class", value);
            V1FirstColumn3.Attributes.Add("class", value);
            V1FirstColumn4.Attributes.Add("class", value);
            V1FirstColumn5.Attributes.Add("class", value);
            V1FirstColumn6.Attributes.Add("class", value);
            V1FirstColumn7.Attributes.Add("class", value);
            V1FirstColumn8.Attributes.Add("class", value);
        }
    }

    /// <summary>
    /// string
    /// Set the style for second column
    /// </summary>
    public string SecondColumnStyle
    {
        set
        {
            V1SecondColumn1.Attributes.Add("class", value);
            V1SecondColumn2.Attributes.Add("class", value);
            V1SecondColumn3.Attributes.Add("class", value);
            V1SecondColumn4.Attributes.Add("class", value);
            V1SecondColumn5.Attributes.Add("class", value);
            V1SecondColumn6.Attributes.Add("class", value);
            V1SecondColumn7.Attributes.Add("class", value);
            V1SecondColumn8.Attributes.Add("class", value);
        }
    }

    /// <summary>
    /// string
    /// Get the Code value
    /// </summary>
    public string Code
    {
        get
        {
            return txtVCode.Text;
        }
    }

    /// <summary>
    /// string
    /// Get the Name value
    /// </summary>
    public string Name
    {
        get
        {
            return txtVName.Text;
        }
    }

    /// <summary>
    /// string
    /// Get the address value
    /// </summary>
    public string Address
    {
        get
        {
            return txtVAddress.Text;
        }
    }

    /// <summary>
    /// string
    /// Get the Mobile Number
    /// </summary>
    public string Mobile
    {
        get
        {
            return txtVMobile.Text;
        }
    }

    /// <summary>
    /// string
    /// Get the Phone Number
    /// </summary>
    public string TelePhone
    {
        get
        {
            return txtVPhone.Text;
        }
    }

    /// <summary>
    /// string
    /// Get the EMail ID
    /// </summary>
    public string EmailID
    {
        get
        {
            return txtVEmail.Text;
        }
    }

    /// <summary>
    /// string
    /// Get the Website
    /// </summary>
    public string Website
    {
        get
        {
            return txtVWebSite.Text;
        }
    }

    /// <summary>
    /// string
    /// Set the value to display the caption
    /// </summary>
    public string Caption
    {
        set
        {
            lblVCode.Text = lblHCode.Text = value + " Code";

            lblVName.Text = lblHName.Text = value + " Name";
        }
    }

    #endregion [Properties]
}
