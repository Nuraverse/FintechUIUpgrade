<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GCln_NFB_Exposure_Entry, App_Web_a0fm2otg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Client_ItemSelected(sender, e) {
            var hdnClientName = $get('<%= hdnClientName.ClientID %>');
            hdnClientName.value = e.get_value();
        }

        function Client_ItemPopulated(sender, e) {
            var hdnClientName = $get('<%= hdnClientName.ClientID %>');
            hdnClientName.value = '';
        }

        function IssuedTo_ItemSelected(sender, e) {
            var hdnIssuedto = $get('<%= hdnIssuedto.ClientID %>');
            hdnIssuedto.value = e.get_value();
        }

        function IssuedTo_ItemPopulated(sender, e) {
            var hdnIssuedto = $get('<%= hdnIssuedto.ClientID %>');
            hdnIssuedto.value = '';
        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="PnlExposureentry" CssClass="stylePanel" GroupingText="NFB Exposure Entry" runat="server">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDocumentNo" runat="server" Enabled="false"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblTranNo" runat="server" Text="Transaction No"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTranDate" runat="server" Visible="false" Enabled="false"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblTranDate" Visible="false" runat="server" Text="Transaction Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlProduct" runat="server" ToolTip="Product"
                                                class="md-form-control form-control">
                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="ddlProduct"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                    ErrorMessage="Select a Product" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblProduct" runat="server" CssClass="styleReqFieldLabel" Text="Product"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBank" runat="server" ToolTip="Bank Name"
                                                class="md-form-control form-control">
                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ControlToValidate="ddlBank"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                    ErrorMessage="Select a Bank" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBankName" runat="server" CssClass="styleReqFieldLabel" Text="Bank Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGuaranteeNo" runat="server" MaxLength="30" Style="text-align: right"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvGuarNo" runat="server" ControlToValidate="txtGuaranteeNo"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Guarantee No" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblGuaranteeNo" runat="server" CssClass="styleReqFieldLabel" Text="Guarantee No"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="txtClientName" hovermenuextenderleft="true" runat="server" AutoPostBack="true" dispalycontent="Both" class="md-form-control form-control"
                                                ServiceMethod="GetClientName" />
                                            <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                                            <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                           <%-- <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvClientNameList" runat="server" ControlToValidate="txtClientName"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="" SetFocusOnError="True"
                                                    ErrorMessage="Select a Client Name" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <label>
                                                <asp:Label runat="server" ID="lblClientName" CssClass="styleReqFieldLabel" Text="Client Name"></asp:Label>
                                            </label>

                                            <%--<asp:TextBox ID="txtClientName" runat="server" MaxLength="30" AutoPostBack="true" OnTextChanged="txtClientName_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:AutoCompleteExtender ID="autoClientNameSearch" MinimumPrefixLength="3" OnClientPopulated="Client_ItemPopulated"
                                                OnClientItemSelected="Client_ItemSelected"
                                                runat="server" TargetControlID="txtClientName"
                                                ServiceMethod="GetClientName" Enabled="True" CompletionSetCount="5"
                                                CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                ShowOnlyCurrentWordInCompletionListItem="true">
                                            </cc1:AutoCompleteExtender>
                                            <cc1:TextBoxWatermarkExtender ID="ClientNameExtender" runat="server" TargetControlID="txtClientName"
                                                WatermarkText="--Select--">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                            <asp:HiddenField ID="hdnClientName" runat="server" />
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvClientNameList" runat="server" ControlToValidate="txtClientName"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="" SetFocusOnError="True"
                                                    ErrorMessage="Select a Client Name" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <%--<span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblClientName" runat="server" Text="Client Name"></asp:Label>
                                            </label>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="txtIssuedto" hovermenuextenderleft="true" runat="server" AutoPostBack="true" dispalycontent="Both" class="md-form-control form-control"
                                                ServiceMethod="GetIssuedTo" />
                                            <%-- <asp:TextBox ID="txtIssuedto" runat="server" MaxLength="30" AutoPostBack="true" OnTextChanged="txtIssuedto_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:AutoCompleteExtender ID="autoIssuedtoSearch" MinimumPrefixLength="3"
                                                OnClientPopulated="IssuedTo_ItemPopulated"
                                                OnClientItemSelected="IssuedTo_ItemSelected" runat="server" TargetControlID="txtIssuedto"
                                                ServiceMethod="GetIssuedTo" Enabled="True" CompletionSetCount="5"
                                                CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                ShowOnlyCurrentWordInCompletionListItem="true">
                                            </cc1:AutoCompleteExtender>
                                            <cc1:TextBoxWatermarkExtender ID="IssuedtoExtender" runat="server" TargetControlID="txtIssuedto"
                                                WatermarkText="--Select--">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                            <asp:HiddenField ID="hdnIssuedto" runat="server" />
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvIssuedtoList" runat="server" ControlToValidate="txtIssuedto"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="" SetFocusOnError="True"
                                                    ErrorMessage="Select a Issued to" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblIssuedto" runat="server" CssClass="styleReqFieldLabel" Text="Issued to"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlType" runat="server" ToolTip="Type of Gtee"
                                                class="md-form-control form-control">
                                                <%--<asp:ListItem Value="0" Text="--Select--"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtype" runat="server" ControlToValidate="ddlType"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                    ErrorMessage="Select a type of Gtee" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblType" runat="server" CssClass="styleReqFieldLabel" Text="Type of Gtee"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtApplicationDate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                AutoPostBack="True" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalApplicationDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                PopupButtonID="txtApplicationDate" TargetControlID="txtApplicationDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvApplicationDate" runat="server" ControlToValidate="txtApplicationDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Application Date" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblApplicationDate" runat="server" CssClass="styleReqFieldLabel" Text="Application Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtIssueDate" runat="server" MaxLength="12" AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="calIssueDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                PopupButtonID="txtIssueDate" TargetControlID="txtIssueDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvIssueDate" runat="server" ControlToValidate="txtIssueDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Issue Date" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblIssueDate" runat="server" CssClass="styleReqFieldLabel" Text="Issue Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtExpiryDate" runat="server" MaxLength="12" AutoPostBack="true"
                                                OnTextChanged="txtExpiryDate_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="calExpiryDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                PopupButtonID="txtExpiryDate" TargetControlID="txtExpiryDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvExpiryDate" runat="server" ControlToValidate="txtExpiryDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Expiry Date" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblExpiryDate" runat="server" CssClass="styleReqFieldLabel" Text="Expiry Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtExpiryMonth" runat="server" MaxLength="12" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblExpiryMonth" runat="server" CssClass="styleReqFieldLabel" Text="Expiry Month"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAmount" runat="server" MaxLength="20" Style="text-align: right"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftxtAmount" TargetControlID="txtAmount" FilterType="Custom,Numbers"
                                                ValidChars="." runat="server" Enabled="True" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="txtAmount"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Amount (RO)" ValidationGroup="main" InitialValue=""></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAmount" runat="server" CssClass="styleReqFieldLabel" Text="Amount (RO)"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBank_Issue_Date" runat="server" MaxLength="12" AutoPostBack="true"
                                                OnTextChanged="txtExpiryDate_TextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="calBankIssueDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                PopupButtonID="txtBank_Issue_Date" TargetControlID="txtBank_Issue_Date">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtBank_Issue_Date" runat="server" ControlToValidate="txtBank_Issue_Date"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Enter Bank Issue Date" ValidationGroup="main" InitialValue=""></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBank_Issue_Date" runat="server" CssClass="styleReqFieldLabel" Text="Bank Issue Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:RadioButtonList ID="rbnAuto" runat="server" RepeatDirection="Horizontal"
                                                CssClass="md-form-control form-control radio">
                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblAuto" runat="server" Text="Auto Renewal"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSubGlAccount" runat="server" MaxLength="20" Style="text-align: right"
                                                class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:TextBox>
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvSubGlAccount" runat="server" ControlToValidate="txtSubGlAccount"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Select the Sub GL Account" ValidationGroup="main"></asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSubGlAccount" Visible="false" runat="server" Text="Sub Gl Account"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>

                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('main'))" causesvalidation="false" validationgroup="main" runat="server" onserverclick="btnSave_Click"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>

                    </div>

                    <tr class="styleButtonArea">
                        <td>
                            <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="vsMainPage" runat="server" ValidationGroup="" ShowSummary="false" Enabled="false"
                                HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                        </td>
                    </tr>

                    <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

