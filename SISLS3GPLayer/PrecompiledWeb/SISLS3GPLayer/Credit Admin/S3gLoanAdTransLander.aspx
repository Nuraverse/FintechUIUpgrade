<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="LoanAdmin_S3gLoanAdTransLander, App_Web_lyohvbtb" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Common_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Common_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = '';

        }
        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
        }
        function Instrument_ItemSelected(sender, e) {
            var hdnInstrument = $get('<%= hdnInstrument.ClientID %>');
            hdnInstrument.value = e.get_value();
        }
        function Instrument_ItemPopulated(sender, e) {
            var hdnInstrument = $get('<%= hdnInstrument.ClientID %>');
            hdnInstrument.value = '';

        }
        function Account_ItemSelected(sender, e) {
            var hdnaccnumber = $get('<%= hdnaccnumber.ClientID %>');
            hdnaccnumber.value = e.get_value();
        }
        function Account_ItemPopulated(sender, e) {
            var hdnaccnumber = $get('<%= hdnaccnumber.ClientID %>');
            hdnaccnumber.value = '';

        }
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
        function fnLoadCustClient() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustClient').click();
        }
    </script>
    <asp:UpdatePanel ID="UpTranslander" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">



                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" EnableViewState="false">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvLOBSearch" runat="server" visible="false">
                            <div class="md-input">
                                <%--          <cc1:ComboBox ID="ComboBoxLOBSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                        </cc1:ComboBox>--%>

                                <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" class="md-form-control form-control" AutoPostBack="true" ToolTip="Line of Business" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleReqFieldLabel" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                                        CssClass="styleMandatoryLabel" runat="server" ControlToValidate="ComboBoxLOBSearch"
                                        SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvBranch" runat="server" visible="false">
                            <div class="md-input">
                                <%-- <asp:TextBox ID="txtBranchSearch" runat="server" MaxLength="50" OnTextChanged="txtBranchSearch_OnTextChanged"
                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                        <cc1:AutoCompleteExtender ID="autoBranchSearch" MinimumPrefixLength="3" OnClientPopulated="Branch_ItemPopulated"
                            OnClientItemSelected="Branch_ItemSelected" runat="server" TargetControlID="txtBranchSearch"
                            ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="5"
                            CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                            ShowOnlyCurrentWordInCompletionListItem="true">
                        </cc1:AutoCompleteExtender>
                        <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="txtBranchSearch"
                            WatermarkText="--Select--">
                        </cc1:TextBoxWatermarkExtender>--%>
                                <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" CssClass="md-form-control form-control">
                                </asp:DropDownList>
                                <asp:HiddenField ID="hdnBranchID" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleReqFieldLabel" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                                        InitialValue="0" CssClass="styleMandatoryLabel" runat="server" ControlToValidate="ddlBranch"
                                        SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtStartDateSearch" runat="server" autocomplete="off"
                                    OnTextChanged="txtStartDateSearch_TextChanged" AutoPostBack="True"
                                    CssClass="md-form-control form-control login_form_content_input requires_true" ToolTip="Start Date"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel" Enabled="false"
                                        runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                        ErrorMessage="Enter a Start Date" Display="None">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" autocomplete="off"
                                    OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="True" CssClass="md-form-control form-control login_form_content_input requires_true" ToolTip="End Date"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                    PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                </cc1:CalendarExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel" Enabled="false"
                                        runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a End Date"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvMultipleDNC" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server" CssClass="md-form-control form-control"
                                    OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Visible="false" Text="Transaction" runat="server" ID="lblMultipleDNC"
                                        CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvDNCOption" style="display: none" runat="server">
                            <div class="md-input">
                                <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server" CssClass="md-form-control form-control"
                                    OnSelectedIndexChanged="ddlDNCOption_SelectedIndexChanged">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption"
                                        CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="tdManual" visible="false">
                            <div class="md-input">
                                <asp:RadioButton ID="rdoManual" AutoPostBack="true" CssClass="md-form-control form-control radio"
                                    OnCheckedChanged="Journal_OnCheckedChanged" Checked="true" runat="server"
                                    GroupName="DocYes" Text="Manual Journal" />
                                <asp:RadioButton ID="rdoSystem" AutoPostBack="true" CssClass="md-form-control form-control radio"
                                    OnCheckedChanged="Journal_OnCheckedChanged"
                                    GroupName="DocYes" runat="server" Text="System Journal" />
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divDocType" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlDocType" runat="server" ToolTip="Doc Type" AutoPostBack="true" OnSelectedIndexChanged="ddlDocType_SelectedIndexChanged"
                                    onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Doc Type" ToolTip="Doc Type" ID="lblDocType" CssClass="styleFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divPayTo" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlPayTo" runat="server" ToolTip="Pay to" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged" CssClass="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Pay To" ToolTip="Pay to" ID="lblPayTo" CssClass="styleFieldLabel"></asp:Label>
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPayTo" CssClass="validation_msg_box_sapn"
                                        runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayTo"
                                        ErrorMessage="Select Pay To" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPayToOne" CssClass="validation_msg_box_sapn"
                                        runat="server" SetFocusOnError="True" Enabled="false" InitialValue="0" ControlToValidate="ddlPayTo"
                                        ErrorMessage="Select Pay To" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divCustomerName" runat="server" visible="false">
                            <div class="md-input">
                                <%--<asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                            Style="display: none;" MaxLength="50"></asp:TextBox>--%>
                                <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both"
                                    strLOV_Code="CUS_ASTIDN" ServiceMethod="GetCustomerCodeList" class="md-form-control form-control" OnItem_Selected="ucCustomerCodeLov_Item_Selected" AutoPostBack="true" />
                                <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                    Style="display: none" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Customer Name" ID="lblCustomerName"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvpanAutoSuggest" runat="server" visible="false">
                            <div class="md-input">
                                <asp:Panel ID="panAutoSuggest" runat="server">
                                    <asp:TextBox ID="txtDocumentNumberSearch" CssClass="md-form-control form-control login_form_content_input requires_true" runat="server" MaxLength="50" OnTextChanged="txtDocumentNumberSearch_OnTextChanged"
                                        AutoPostBack="true"></asp:TextBox>
                                    <cc1:AutoCompleteExtender ID="aceCommonCon" MinimumPrefixLength="1" OnClientPopulated="Common_ItemPopulated" OnClientItemSelected="Common_ItemSelected"
                                        runat="server" TargetControlID="txtDocumentNumberSearch" ServiceMethod="GetCommonList"
                                        CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                        DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </cc1:AutoCompleteExtender>
                                    <cc1:TextBoxWatermarkExtender ID="txtWatermarkExtender" runat="server" TargetControlID="txtDocumentNumberSearch"
                                        WatermarkText="--Select--">
                                    </cc1:TextBoxWatermarkExtender>
                                    <asp:HiddenField ID="hdnCommonID" runat="server" />
                                </asp:Panel>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="" runat="server" ID="lblAutosuggestProgramIDSearch" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvPanel1" runat="server" visible="false">
                            <div class="md-input">
                                <asp:Panel ID="Panel1" runat="server">
                                    <asp:TextBox ID="txtInstrumentNumber" CssClass="md-form-control form-control login_form_content_input requires_true" Visible="false" runat="server" MaxLength="50" OnTextChanged="txtInstrumentNumber_TextChanged"
                                        AutoPostBack="true"></asp:TextBox>
                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" MinimumPrefixLength="1" OnClientPopulated="Instrument_ItemPopulated" OnClientItemSelected="Instrument_ItemSelected"
                                        runat="server" TargetControlID="txtInstrumentNumber"
                                        CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                        DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass" ServiceMethod="GetInstrumentList"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </cc1:AutoCompleteExtender>
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtInstrumentNumber"
                                        WatermarkText="--Select--">
                                    </cc1:TextBoxWatermarkExtender>
                                    <asp:HiddenField ID="hdnInstrument" runat="server" />
                                </asp:Panel>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="" runat="server" ID="lblInstrumentNumber" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="ccol-lg-3 col-md-4 col-sm-6 col-xs-12" id="divAccountno" runat="server" visible="false">
                            <div class="md-input">
                                <%--<uc:Suggest ID="ucAccountLov" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" />--%>
                                <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                    strLOV_Code="ACC_ASTIDN" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                    Style="display: none" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvclientnamefactoring" runat="server" visible="false">
                            <div class="md-input">
                                <uc4:ICM ID="ucCustomerCodeLovPro" onblur="fnLoadCustClient()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" OnItem_Selected="ucCustomerCodeLovPro_Item_Selected" DispalyContent="Both" class="md-form-control form-control"
                                    strLOV_Code="CLIENT_INV_LOAD" ServiceMethod="GetClientCodeList" />
                                <asp:Button ID="btnLoadCustClient" runat="server" Text="Load Client Name" CausesValidation="false" OnClick="btnLoadCustClient_Click" UseSubmitBehavior="false"
                                    Style="display: none" />
                                <%--<asp:TextBox runat="server" ID="txtCustomerName" ToolTip="Client Name" Visible="false"
                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                        <asp:HiddenField ID="hdnCustomerCode" runat="server" />
                        <asp:HiddenField ID="hdnCustomerId" runat="server" />--%>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblCustName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvclientName" runat="server" visible="false">
                            <div class="md-input">
                                <uc:Suggest ID="ucEntityCode" runat="server" ServiceMethod="GetClientCodeList" ToolTip="Customer Name" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Customer Name" ID="lblClientName"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvStatus" runat="server" visible="false">
                            <div class="md-input">
                                <uc:Suggest ID="ddlStatus" runat="server" Visible="false" AutoPostBack="true"
                                    ServiceMethod="GetSearchOptionList" OnItem_Selected="ddlStatus_Item_Selected" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="" runat="server" ID="lblStatusSearch" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvPanel2" runat="server" visible="false">
                            <div class="md-input">
                                <asp:Panel ID="Panel2" runat="server">
                                    <asp:TextBox ID="txtAccountNumber" Visible="false" runat="server" MaxLength="50" OnTextChanged="txtAccountNumber_TextChanged"
                                        AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" MinimumPrefixLength="1" OnClientPopulated="Account_ItemPopulated" OnClientItemSelected="Account_ItemSelected"
                                        runat="server" TargetControlID="txtAccountNumber"
                                        CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                        DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass" ServiceMethod="GetAccountList"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </cc1:AutoCompleteExtender>
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="txtAccountNumber"
                                        WatermarkText="--Select--">
                                    </cc1:TextBoxWatermarkExtender>
                                    <asp:HiddenField ID="hdnaccnumber" runat="server" />
                                </asp:Panel>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="" runat="server" ID="lblaccountNumber" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvTranStatus" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlTranStatus" runat="server" class="md-form-control form-control" 
                                     ToolTip="Status" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="Status" runat="server" ID="lblTranStatus" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                </label>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                                OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                                RowStyle-HorizontalAlign="Left" class="gird_details" OnRowDataBound="grvTransLander_RowDataBound">
                                <Columns>
                                    <%--Query Column--%>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                                CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                            <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="row">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                    </div>
                    <%--Row 12 with 1 columns--%>
                    <div class="row">
                        <%--Hidden fields for grid usage--%>
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <div class="col-lg-12 col-md-8 col-sm-8 col-xs-12" style="float: right;">
                            <button class="css_btn_enabled" id="btnSearch" title="Search[Alt+S]" causesvalidation="false" onserverclick="btnSearch_Click" runat="server"
                                type="button" accesskey="S">
                                <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                            </button>
                            <button class="css_btn_enabled" id="btnCreate" title="Create[Alt+C]" causesvalidation="false" onserverclick="btnCreate_Click" runat="server"
                                type="button" accesskey="C">
                                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </div>



                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
