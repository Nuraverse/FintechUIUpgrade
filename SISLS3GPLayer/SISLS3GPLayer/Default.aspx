<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript" language="javascript">

        //*************************************************************
        //Disable the controls in form
        //Controls which are not to be disabled are passed as "txtUserID~txtUserName"
        //ex: btnSave.Attributes.Add("OnClick", "javascript:return DisableFormElements(frmMemberLogin,'btnCancel~btnClose');")




    function DisableFormElements(FormName, ctrlList) {
        debugger;
            if (document.all || document.getElementById) {
                for (i = 0; i < FormName.length; i++) {
                    var formElement = FormName.elements[i];
                    if (formElement != null || formElement != "") {
                        formElement.style.color = "red";
                        formElement.disabled = true;
                        
                        //formElement.contentEditable = false;
                    }
                }
            }
            if (ctrlList != null) {
                arrClist = ctrlList.split("~")
                for (i = 0; i < arrClist.length; i++) {
                    document.getElementById(arrClist[i]).disabled = false;
                }
            }
            return false;
        }


    </script>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release"></cc1:ToolkitScriptManager>
    
   
    <div>
     <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Pricing" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-top: 10px">
                <cc1:TabContainer ID="tcPricing" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                    Width="99%" ScrollBars="Auto" TabStripPlacement="top">
                    <cc1:TabPanel runat="server" HeaderText="Entity Details" ID="tbMainPage" CssClass="tabpan"
                        BackColor="Red">
                        <HeaderTemplate>
                            Main Page &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table width="100%" >
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <cc1:ComboBox ID="cmbCustomerCode" runat="server" AutoPostBack="True" AutoCompleteMode="SuggestAppend"
                                            onkeyup="maxlengthfortxt(113)" DropDownStyle="DropDownList" MaxLength="0" 
                                            CssClass="AquaStyle" 
                                            >
                                        </cc1:ComboBox>
                                        <asp:Button ID="btnCreateCustomer" runat="server" Text="Create Customer" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblCustomerAddress" runat="server" Text="Customer Address"></asp:Label>
                                    </td>
                                    <td  colspan="3"><!--class="styleFieldAlign"!-->
                                        <asp:TextBox ID="txtCustomerAddress" runat="server" TextMode="MultiLine" Width="300px" Text="sdgughasdjghhjsdghjjkg"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblSanctionNumber" runat="server" Text="Sanction Number"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlSanctionNumber" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblSanctionDate" runat="server" Text="Sanction Date"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtSanctionDate" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblEnquiryNumber" runat="server" Text="Enquiry Number"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlEnquiryNumber" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblEnquiryDate" runat="server" Text="Enquiry Date"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtEnquiryDate" runat="server" Width="100px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td align="center" style="padding-top:10px">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators()" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" 
                    CssClass="styleSubmitButton" CausesValidation="false" 
                    OnClientClick="return fnConfirmClear();" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="styleSubmitButton" CausesValidation="false"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="vsPricing" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" />
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
