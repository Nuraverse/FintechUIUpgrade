<%@ page language="C#" autoeventwireup="true" title="S3G - Pricing Approval" inherits="Origination_S3GORGPricingApproval, App_Web_iftlmgmy" masterpagefile="~/Common/S3GMasterPageCollapse.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function fnCheckPageValidators_Extn(strValGrp, blnConfirm) {

            if (Page_ClientValidate() == false) {
                var iResult = "1";
                for (i = 0; i < Page_Validators.length; i++) {
                    val = Page_Validators[i];
                    controlToValidate = val.getAttribute("controltovalidate");
                    if (controlToValidate != undefined) {
                        if (document.getElementById(controlToValidate) != null) {
                            document.getElementById(controlToValidate).border = "1";
                        }
                    }
                }

                for (i = 0; i < Page_Validators.length; i++) { //For loop1
                    val = Page_Validators[i];
                    var isValidAttribute = val.getAttribute("isvalid");
                    var controlToValidate = val.getAttribute("controltovalidate");
                    if (controlToValidate != undefined) {
                        if (strValGrp == undefined) {
                            if (document.getElementById(controlToValidate) != null) {
                                if (isValidAttribute == false) {

                                    document.getElementById(controlToValidate).className = 'styleReqFieldFocus';
                                    //This is to avoid not to validate control which is already in false state (valid attribute)
                                    document.getElementById(controlToValidate).border = "0";
                                    iResult = "0";
                                }
                                else if (document.getElementById(controlToValidate).border != "0") {
                                    document.getElementById(controlToValidate).className = 'styleReqFieldDefalut';
                                }
                            }
                        }

                    }  //Undefined loop condition

                } //For loop1 End

                Page_BlockSubmit = false; ////Added by Kali on 12-Jun-2010 This function is used to solve issues
                // Need twice click of cancel and clear button after validation summary is visible
            } //

            if (Page_ClientValidate(strValGrp)) {

                if (blnConfirm == undefined) {
                    if (confirm('Are you sure you want to Revoke?')) {
                        Page_BlockSubmit = false;
                        //Added by Thangam M on 18/Oct/2012 to avoid double save click
                        var a = event.srcElement;
                        if (a.type == "submit") {
                            a.style.display = 'none';
                        }
                        //End here
                        return true;
                    }
                    else
                        return false;
                }
                else {
                    Page_BlockSubmit = false;
                    //Added by Thangam M on 18/Oct/2012 to avoid double save click
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    //End here
                    return true;
                }

            }
            else {
                Page_BlockSubmit = false;
                return false;
            }

        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" class="stylePageHeading">
                        <asp:Label runat="server" Text="Pricing Approval" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="left">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td valign="top" align="left">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="styleFieldLabel">
                                                <table cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td class="styleFieldLabel">
                                                                        <asp:Label ID="Label1" runat="server" Text="Approval Status"></asp:Label>
                                                                    </td>
                                                                    <td colspan="2">
                                                                        <asp:CheckBox ID="chkUnapproval" AutoPostBack="true" Text="Unapproved" runat="server"
                                                                            OnCheckedChanged="chkUnapproval_CheckedChanged" />
                                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender2" TargetControlID="chkUnapproval"
                                                                            Key="1" runat="server">
                                                                        </cc1:MutuallyExclusiveCheckBoxExtender>
                                                                        &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkApproved" Text="All" runat="server" OnCheckedChanged="chkApproved_CheckedChanged"
                                                                            AutoPostBack="true" />
                                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender1" TargetControlID="chkApproved"
                                                                            Key="1" runat="server">
                                                                        </cc1:MutuallyExclusiveCheckBoxExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="50%">
                                                                        <asp:Panel GroupingText="Pricing Details" ID="pnlPricingDetails" runat="server" CssClass="stylePanel">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td class="styleFieldLabel" style="width: 17%">
                                                                                        <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                    </td>
                                                                                    <td style="width: 29%">
                                                                                        <asp:DropDownList ID="ddllLineOfBusiness" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddllLineOfBusiness_SelectedIndexChanged">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddllLineOfBusiness"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Line of Business"
                                                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel">
                                                                                        <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                                                            OnItem_Selected="ddlBranch_SelectedIndexChanged" ErrorMessage="Select the Location"
                                                                                            IsMandatory="true" />
                                                                                        <%--<asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="ddlBranch"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Location"
                                                                                            InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel" style="width: 23%">
                                                                                        <asp:Label ID="lblBusinessOfferNumber" runat="server" Text="Business Offer Number"
                                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <%--<asp:DropDownList ID="ddlBusinessOfferNumber" runat="server" AutoPostBack="True"
                                                                                            OnSelectedIndexChanged="ddlBusinessOfferNumber_SelectedIndexChanged">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rvfBusinessofferNo" runat="server" ControlToValidate="ddlBusinessOfferNumber"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Business Offer Number"
                                                                                            InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                                                        <uc2:Suggest ID="ddlBusinessOfferNumber" runat="server" ServiceMethod="GetPricingNumbers"
                                                                                            AutoPostBack="true" OnItem_Selected="ddlBusinessOfferNumber_SelectedIndexChanged"
                                                                                            ErrorMessage="Select the Business Offer Number" IsMandatory="true" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel">
                                                                                        <asp:Label ID="lblOfferDate" runat="server" Text="Offer Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtOfferDate" runat="server" ReadOnly="true" Width="100px"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="styleFieldLabel">
                                                                                        <asp:Label ID="lblStatus" runat="server" Text="Status"></asp:Label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtStatus" ReadOnly="true" runat="server" Width="100px">
                                                                                        </asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="center" colspan="2" style="height: 78px">
                                                                                        <asp:HiddenField ID="hProductID" runat="server" Visible="false" /> 
                                                                                        <asp:Button ID="btnGo" CssClass="styleSubmitShortButton" runat="server" Text="Go" AccessKey="G" ToolTip="Go,Alt+G"
                                                                                            OnClick="btnGo_Click" />
                                                                                        <input type="hidden" value="0" runat="server" id="hdnID" />
                                                                                        <asp:LinkButton Text="View Pricing" CausesValidation="false" runat="server" ID="PaymentReqID" AccessKey="V" ToolTip="View Pricing,Alt+V"
                                                                                            OnClick="PaymentReqID_serverclick"></asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </td>
                                                                    <td width="50%">
                                                                        <asp:Panel GroupingText="Customer Information" ID="pnlCustomerinformation" runat="server"
                                                                            CssClass="stylePanel">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td width="100%">
                                                                                        <uc1:S3GCustomerAddress ID="S3GCustomerPermAddress" runat="server" FirstColumnStyle="styleFieldLabel"
                                                                                            SecondColumnStyle="styleFieldAlign" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="width: 100%">
                                                            <br />
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="grvApprovalDetails" runat="server" AutoGenerateColumns="false"
                                                                            OnRowDataBound="grvApprovalDetails_RowDataBound" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Approval No" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblApprovalSNO" Text='<%# Bind("Approval_Serial_Number")%>' runat="server"></asp:Label>
                                                                                        <asp:Label ID="lblPricingApproval_ID" Text='<%# Bind("PricingApproval_ID")%>' Visible="false"
                                                                                            runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Approver Name" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblApprovarName" Text='<%# Bind("User_Name") %>' runat="server"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:DropDownList ID="ddlAction" runat="server">
                                                                                        </asp:DropDownList>
                                                                                        <asp:RequiredFieldValidator ID="rfvAction" runat="server" ControlToValidate="ddlAction"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Action"
                                                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Password" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtPassword" runat="server" TargetControlID="txtPassword"
                                                                                            FilterType="Custom" FilterMode="InvalidChars" InvalidChars=" ">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                                                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Approval Date" ItemStyle-Width="15%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblApprovalDate" Text='<%# Bind("Approvaldate") %>' runat="server"
                                                                                            MaxLength="6"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="45%">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>' Height="40px"
                                                                                            Width="100%" onkeyDown="maxlengthfortxt(80)" TextMode="MultiLine"></asp:TextBox>
                                                                                        <%--   <asp:RequiredFieldValidator ID="rfvremarks" runat="server" ControlToValidate="txtRemarks"onkeypress="wraptext(this,'20')"
                                                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Remarks"></asp:RequiredFieldValidator>--%>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save" AccessKey="S" ToolTip="Save,Alt+S"
                                        OnClientClick="return fnCheckPageValidators();" OnClick="btnSave_Click" ValidationGroup="btnSave" />
                                    <asp:Button ID="btnRevoke" runat="server" CssClass="styleSubmitButton" OnClick="btnRevoke_Click" AccessKey="R" ToolTip="Revoke,Alt+R"
                                        Text="Revoke" OnClientClick="return fnCheckPageValidators_Extn();" />
                                    <%--       <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" TargetControlID="btnRevoke"
                                        ConfirmText="Are you sure want to Revoke?" runat="server">
                                    </cc1:ConfirmButtonExtender>--%>
                                    <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear" AccessKey="L" ToolTip="Clear,Alt+L"
                                        OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" CausesValidation="False" />
                                    <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Exit" AccessKey="X" ToolTip="Exit,Alt+X"
                                        OnClick="btnCancel_Click" CausesValidation="False" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                        HeaderText="Please correct the following validation(s):" ShowSummary="true" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
