<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAFunderTransaction, App_Web_zogfwrp2" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnConfirmCancel() {

            if (confirm('Do you want to cancel IRS transaction?')) {
                return true;
            }
            else
                return false;

        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcFunderTransaction" runat="server" CssClass="styleTabPanel"
                                TabStripPlacement="top" ActiveTabIndex="0">
                                <cc1:TabPanel runat="server" HeaderText="IRS Details" ID="tbGeneral" CssClass="tabpan"
                                    BackColor="Red">
                                    <HeaderTemplate>
                                        Main Page
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upGeneral" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="IRS Informations" ID="pnlFunderInfo" runat="server" CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="ddlLocation" AutoPostBack="true" runat="server" AutoCompleteMode="SuggestAppend"
                                                                            DropDownStyle="DropDownList" CssClass="WindowsStyle" MaxLength="0" TabIndex="0" OnSelectedIndexChanged="ddlLocation_Changed">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlLocation" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="--Select--"
                                                                                ErrorMessage="Select Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" Text="Branch" ToolTip="Branch" ID="lblLevel" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="ddlFunderCode" Width="135px" AutoPostBack="true" runat="server" AutoCompleteMode="SuggestAppend"
                                                                            DropDownStyle="DropDownList" CssClass="WindowsStyle" MaxLength="0" OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFunderCode" runat="server" ControlToValidate="ddlFunderCode"
                                                                                InitialValue="0" ErrorMessage="Select Funder Code/Name" Display="Dynamic" SetFocusOnError="True"
                                                                                ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code/Name"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="ddlFunderTranNo" AutoPostBack="true" runat="server" AutoCompleteMode="SuggestAppend"
                                                                            DropDownStyle="DropDownList" CssClass="WindowsStyle" MaxLength="0" OnSelectedIndexChanged="ddlFunderTranNo_Changed">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFunderTransactionNo" runat="server" ControlToValidate="ddlFunderTranNo"
                                                                                InitialValue="0" ErrorMessage="Select Funder Transaction No" Display="Dynamic" SetFocusOnError="True"
                                                                                ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label runat="server" ID="lblFunderTranNo" Text="Funder Transaction Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIRSDocumentDate" runat="server" AutoPostBack="true" OnTextChanged="txtIRSDocumentDate_TextChanged"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CAEDocumentDate" runat="server" Enabled="True" TargetControlID="txtIRSDocumentDate">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDocumnetDate" runat="server" ControlToValidate="txtIRSDocumentDate"
                                                                                ErrorMessage="Enter IRS Document Date " Display="Dynamic" SetFocusOnError="True"
                                                                                ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblDealNumber" CssClass="styleReqFieldLabel" Text="IRS Document Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIRSValueDate" AutoPostBack="true" OnTextChanged="txtIRSValueDate_Changed" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CAEIRSValueDate" runat="server" Enabled="True" TargetControlID="txtIRSValueDate">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvValueDate" runat="server" ControlToValidate="txtIRSValueDate"
                                                                                ErrorMessage="Enter IRS Value Date" Display="Dynamic" SetFocusOnError="True"
                                                                                ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblIRSValueDate" CssClass="styleReqFieldLabel" Text="IRS Value Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <cc1:ComboBox ID="ddlIrsWithFunderName" Width="135px" runat="server" AutoCompleteMode="SuggestAppend"
                                                                            DropDownStyle="DropDownList" CssClass="WindowsStyle" MaxLength="0">
                                                                        </cc1:ComboBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvIrsWith" runat="server" ControlToValidate="ddlIrsWithFunderName"
                                                                                InitialValue="0" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Select IRS with Funder" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblIRS" runat="server" CssClass="styleReqFieldLabel" Text="IRS With(Funder Name)"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtNatureofFund" TabIndex="-1" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:HiddenField ID="hdnNatureofFund" runat="server" />
                                                                        <asp:HiddenField ID="hdnTrancheId" runat="server" />
                                                                        <asp:HiddenField ID="hdnFunderOsAmount" runat="server" />
                                                                        <asp:HiddenField ID="hdnAuthStatus" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                                                                CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFundTransDate" runat="server" ReadOnly="true" ToolTip="Funder Transaction Date"
                                                                            onmouseover="txt_MouseoverTooltip(this)"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFunderTransactiondate" runat="server" ControlToValidate="txtFundTransDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btngo"
                                                                                ErrorMessage="Enter Funder Transaction Date"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblTranDate" CssClass="styleReqFieldLabel" Text="Funder Transaction Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIRSNumber" runat="server" ReadOnly="true"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblIRSNumber" runat="server" CssClass="styleReqFieldLabel" Text="IRS Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIRSDealAmount" AutoPostBack="true" OnTextChanged="txtIRSDealAmount_Changed" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvIRSDealAmount" runat="server" ControlToValidate="txtIRSDealAmount"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btngo"
                                                                                ErrorMessage="Enter IRS Deal Amount"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblIRSDealAmount" runat="server" CssClass="styleReqFieldLabel" Text="IRS Deal Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTenure" OnTextChanged="txtTenure_TextChanged" Style="text-align: right" AutoPostBack="true" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="flttxtTenure" runat="server" TargetControlID="txtTenure"
                                                                            FilterType="Numbers"  Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtTenure"
                                                                                ErrorMessage="Enter Tenure" Display="Dynamic" SetFocusOnError="True"
                                                                                ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
                                                                        </div>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label1" CssClass="styleReqFieldLabel" Text="Tenure(in days)"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIRSMatDate" AutoPostBack="true" runat="server" OnTextChanged="txtIRSMatDate_OnTextChanged"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CEXMaturityDate" runat="server" Enabled="True" TargetControlID="txtIRSMatDate">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvMaturityDate" runat="server" ControlToValidate="txtIRSMatDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                ErrorMessage="Enter IRS Maturity Date" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="IRS Maturity Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Interest Receivable" ID="tpSchedule" CssClass="tabpan"
                                    BackColor="Red">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upSchedule" runat="server">
                                            <ContentTemplate>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlInteretType" runat="server"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvInteretType" runat="server" ControlToValidate="ddlInteretType"
                                                                            InitialValue="0" ErrorMessage="Select Interet Type" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblInterestType" Text="Interest Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlInterestBasis" runat="server" AutoPostBack="true"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvInterestBasis" runat="server" ControlToValidate="ddlInterestBasis"
                                                                            InitialValue="0" ErrorMessage="Select Interest Basis" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblInterestBasis" CssClass="styleReqFieldLabel" Text="Interest Basis"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtBaseRate" onchange="FuncalculateTotalRate();" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbBaseRate" runat="server" TargetControlID="txtBaseRate"
                                                                        FilterType="Numbers,Custom" ValidChars=" ."
                                                                        Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvBaseRate" runat="server" ControlToValidate="txtBaseRate"
                                                                            ErrorMessage="Enter Base Rate" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblBaseRate" Text="Base Rate %"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSpreadRate" AutoPostBack="true" OnTextChanged="txtOutflowSpreadRate_OnChanged" onchange="FuncalculateTotalRate();" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbSpreadRate" runat="server" TargetControlID="txtSpreadRate"
                                                                        FilterType="Numbers,Custom" ValidChars=" ."
                                                                        Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvSpreadRate" runat="server" ControlToValidate="txtSpreadRate"
                                                                            ErrorMessage="Enter Spread Rate" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblSpreadRate" CssClass="styleReqFieldLabel" Text="Spread Rate %"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTotalRate" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblTotalRate" Text="Total Rate %"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlInflowType" AutoPostBack="true" OnSelectedIndexChanged="ddlInflowType_OnSelectedIndexChanged" runat="server" ToolTip="Inflow Type"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlInflowType1" runat="server" ControlToValidate="ddlInflowType"
                                                                            InitialValue="0" ErrorMessage="Select Inflow Type" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblInflowType" Text="Inflow Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlReceivingType" runat="server" ToolTip="Receipt Frequency"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvReceiptFrequency" runat="server" ControlToValidate="ddlReceivingType"
                                                                            InitialValue="0" ErrorMessage="Select Receipt Frequency" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblType" CssClass="styleReqFieldLabel" Text="Receipt Frequency"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtReceivingDate" runat="server" OnTextChanged="txtReceivingDate_OnTextChanged" ToolTip="Receiving Date"
                                                                        onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true"
                                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivingDate"
                                                                        PopupButtonID="txtReceivingDate"
                                                                        ID="CEReceivingDate" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvFirstReceiptDate" runat="server" ControlToValidate="txtReceivingDate"
                                                                            ErrorMessage="Enter First Receipt Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnAddTrn"
                                                                            CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="Label2" CssClass="styleReqFieldLabel" Text="Interest Start Date" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFromDateTrn" onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" OnTextChanged="txtFromDateTrn_TextChanged" runat="server"
                                                                        ToolTip="Due Date"
                                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFromDateTrn"
                                                                        PopupButtonID="txtFromDateTrn" ID="CEtxtFromDateTrn" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                     <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtFromDateTrn" runat="server" ControlToValidate="txtFromDateTrn"
                                                                            ErrorMessage="Enter Rate From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnAddTrn"
                                                                            CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblFromDateTrn" ToolTip="From Date" runat="server" Text="Rate From Date"
                                                                            CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtToDateTrn" OnTextChanged="txtToDateTrn_TextChanged" AutoPostBack="true" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                        ToolTip="Due Date"
                                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtToDateTrn"
                                                                        PopupButtonID="txtToDateTrn" ID="CEtxtTODateTrn" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                     <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtToDateTrn" runat="server" ControlToValidate="txtToDateTrn"
                                                                            ErrorMessage="Enter Rate To Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnAddTrn"
                                                                            CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="Label3" ToolTip="To Date" runat="server" Text="Rate To Date"
                                                                            CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="ddltrancherefnoTrn" ReadOnly="false" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                        ToolTip="Due Date"
                                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtToDateTrn"
                                                                        PopupButtonID="txtToDateTrn" ID="CalendarExtender3" Enabled="True">
                                                                    </cc1:CalendarExtender>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTranche_Ref_NoTrn" ToolTip="Tranche Ref No/Serial No" runat="server"
                                                                            Text="Tranche Ref No/Serial No" CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div align="right">
                                                            <button class="css_btn_enabled" id="btnAddTrn" title="Add,Alt+T" onclick="if(fnConfirmAdd('btnAddTrn'))" causesvalidation="false" onserverclick="btnAddTrn_Click" runat="server"
                                                                button="styleSubmitShortButton" validationgroup="btnAddTrn" type="button" accesskey="T">
                                                                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnModifyTrn" title="Modify,Alt+M" onclick="if(fnCheckPageValidators('btnModifyTrn'))" causesvalidation="false" onserverclick="btnModifyTrn_Click" runat="server"
                                                                button="styleSubmitShortButton" type="button" accesskey="M">
                                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>E</u>dit
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnClearTrn" title="ClearTrn,Alt+Q" causesvalidation="false" onserverclick="btnClearTrn_Click" runat="server"
                                                                type="button" accesskey="Q">
                                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                                                <asp:Label ID="lblTrnSlNo" runat="server" Visible="False"></asp:Label>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Interest Rate Details" ID="pnlInterestDetails" runat="server"
                                                            CssClass="stylePanel" Width="100%">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="grid">
                                                                        <asp:GridView ID="grvtranche" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            Width="100%" OnRowDataBound="grvtranche_RowDataBound" OnRowDeleting="grvtranche_RowDeleting">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Select">
                                                                                    <ItemTemplate>
                                                                                        <asp:RadioButton ID="RBSelect" runat="server" Checked="false"
                                                                                            AutoPostBack="true" OnCheckedChanged="RBSelectTrn_CheckedChanged" Text="" Style="padding-left: 7px" />

                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                        <asp:HiddenField ID="hdnSlno1" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Tranche Ref. No."
                                                                                    FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLookupCode" runat="server" Text='<%#Bind("tranche_Ref_No") %>'
                                                                                            Visible="false"></asp:Label>
                                                                                        <asp:Label ID="lbltrancheNo" ToolTip="Tranche Ref. No." Width="95%" runat="server"
                                                                                            Text='<%#Eval("tranche_Ref_No")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="From Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblFromDate" runat="server" Text='<%#Eval("From_Date") %>' ToolTip="From Date" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="To Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblToDate" runat="server" Text='<%#Eval("To_Date") %>' ToolTip="From Date" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Base Rate%" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="12%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblbaserate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Base_Rate_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Variable Rate%"
                                                                                    FooterStyle-Width="12%" ItemStyle-Width="12%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblvariablerate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Variable_Rate_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Total Rate%" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbltotalrate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Total_Rate_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>
                                                                                <%--  <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="TDS Section" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbltdsrate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("TDS_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Service Tax%" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblservicetaxrate" ToolTip="Base Rate%" Width="95%" runat="server"
                                                                                            Text='<%#Eval("Service_Tax_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                <%--  <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Others%" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblothers" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Others_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                <%--    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Others AMT" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblothersamt" ToolTip="Others Amt" Width="95%" runat="server" Text='<%#Eval("Others_Amt")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Cost of Fund%" Visible="false"
                                                                                    FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblcost" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Cost_of_Funds_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>
                                                                                <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Discount %" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblDisc_Per" ToolTip="Discount %" Width="95%" runat="server" Text='<%#Eval("Disc_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Discount Amount"
                                                                                    FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblDisc_Amt" ToolTip="Discount Amount" Width="95%" runat="server"
                                                                                            Text='<%#Eval("Disc_Amt")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                <%--<asp:TemplateField HeaderText="Gross_up" ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkGrossUp" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "Gross_up").ToString().ToUpper() == "TRUE" %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>--%>
                                                                                <%-- <asp:TemplateField HeaderText="COF" ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkcof" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "COF").ToString().ToUpper() == "TRUE" %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>--%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                                                            OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div align="right">
                                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGoR_Click" validationgroup="btngo" runat="server"
                                                        button="styleSubmitShortButton" type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                    </button>
                                                    <button class="css_btn_enabled" id="btlRClear" title="Clear,Alt+R" causesvalidation="false"
                                                        onserverclick="btnGoRClear_Click" runat="server"
                                                        button="styleSubmitShortButton" type="button" accesskey="R">
                                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r
                                                    </button>
                                                    <asp:Button ID="Button1" runat="server" Text="Int Rec schedule" Visible="false" ToolTip="Go" CssClass="styleSubmitButton"
                                                        ValidationGroup="btnGoInt" OnClick="btnGoRecInt_Click" />


                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Receiving Schedule Details" ID="pnlReceiving" runat="server"
                                                            CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="grid">
                                                                        <asp:GridView ID="gvReceiving" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                            Width="100%" OnRowDataBound="gvBorrowerReceiving_RowDataBound" OnRowCommand="gvBorrowerReceiving_RowCommand"
                                                                            OnRowDeleting="gvBorrowerReceiving_RowDeleting" OnRowEditing="gvBorrowerReceiving_RowEditing"
                                                                            OnRowCancelingEdit="gvBorrowerReceiving_RowCancelingEdit" OnRowUpdating="gvBorrowerReceiving_RowUpdating">
                                                                            <Columns>
                                                                                <%--Serial Number--%>
                                                                                <asp:TemplateField HeaderText="Sl No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                                        <asp:HiddenField ID="hdn_TranID" runat="server" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--Fund Ref Number--%>
                                                                                <asp:TemplateField HeaderText="Fund Ref Number" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblFund_Ref_Number" runat="server" Text='<%#Eval("Fund_Ref_No") %>'
                                                                                            ToolTip="JV Reference Number" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                    <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                                                </asp:TemplateField>
                                                                                <%--Principal Schedule--%>
                                                                                <asp:TemplateField Visible="false" HeaderText="Principal Schedule">
                                                                                    <HeaderTemplate>
                                                                                        <table id="table2" runat="server" width="100%">
                                                                                            <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                                                <td colspan="2" align="center">Principal Schedule
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td width="50%" style="text-align: center">Due Date
                                                                                                </td>
                                                                                                <td width="50%">Due Amount
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table id="table3" runat="server" width="100%">
                                                                                            <tr>
                                                                                                <td style="text-align: left" width="50%">
                                                                                                    <asp:Label ID="lblRepayDate" runat="server" Text='<%#Eval("Repay_Date") %>' ToolTip="Repay Date" />
                                                                                                </td>
                                                                                                <td style="text-align: right" width="50%">
                                                                                                    <asp:Label ID="lblRepayAmount" Style="text-align: right" runat="server" Text='<%#Eval("Repay_Amount") %>'
                                                                                                        ToolTip="Repay Amount" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <table id="table4" runat="server" width="100%">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtRepayDate" Width="100px" Text='<%#Eval("Repay_Date") %>' runat="server"
                                                                                                        onmouseover="txt_MouseoverTooltip(this)" ToolTip="Due Date" />
                                                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                                                        PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                                                    </cc1:CalendarExtender>

                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtRepayAmount" AutoPostBack="true" OnTextChanged="txtRepayAmount_OnTextChanged" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                        Text='<%#Eval("Repay_Amount") %>' runat="server" ToolTip="Repay Amount" />
                                                                                                    <%--<cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" ValidChars="." FilterType="Numbers"
                                                                                            runat="server" Enabled="True" />--%>
                                                                                                    <asp:HiddenField ID="hdnRepayAmt" runat="server" Value='<%#Eval("Repay_Amount") %>' />

                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <table id="table5" runat="server" width="100%">
                                                                                            <tr valign="top">
                                                                                                <td width="50%">
                                                                                                    <asp:Label ID="lblTot" runat="server" Text="Total" />
                                                                                                </td>
                                                                                                <td width="50%">
                                                                                                    <asp:Label ID="lblTotRepay" runat="server" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <%--                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtRepayDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                            runat="server" ToolTip="Repay Date" />
                                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                                            PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>

                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtRepayAmount" Width="100px" AutoPostBack="true" OnTextChanged="txtRepayAmount_OnTextChanged" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                            runat="server" ToolTip="Repay Amount" />
                                                                                    </td>
                                                                                </tr>--%>
                                                                                        </table>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                    <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <%--Interest Amount--%>
                                                                                <asp:TemplateField HeaderText="Interest Amount">
                                                                                    <HeaderTemplate>
                                                                                        <table id="table6" runat="server" width="100%">
                                                                                            <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                                                <td colspan="2" align="center">Interest Receivable Schedule
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td width="50%" style="text-align: center">Due Date
                                                                                                </td>
                                                                                                <td width="50%">Due Amount
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table id="table7" runat="server" width="100%">
                                                                                            <tr>
                                                                                                <td style="text-align: left" width="50%">
                                                                                                    <asp:Label ID="lblInterestDate" runat="server" Text='<%#Eval("Interest_Date") %>'
                                                                                                        ToolTip="Repay Date" />
                                                                                                </td>
                                                                                                <td width="50%" style="text-align: right">
                                                                                                    <asp:Label ID="lblInterestAmount" Style="text-align: right" runat="server" Text='<%#Eval("Interest_Amount") %>'
                                                                                                        ToolTip="Repay Amount" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <table id="table12" runat="server" width="100%">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtEInterestDate" Width="100px" Text='<%#Eval("Interest_Date") %>' onmouseover="txt_MouseoverTooltip(this)"
                                                                                                        runat="server" ToolTip="Interest Date" />
                                                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEInterestDate"
                                                                                                        ID="CalEInterestDate" Enabled="True">
                                                                                                    </cc1:CalendarExtender>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:TextBox ID="txtEDueAmount" Width="100px" Text='<%#Eval("Interest_Amount") %>' onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                        runat="server" ToolTip="DueAmount" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <table id="table12" runat="server" width="100%">
                                                                                            <tr valign="top">
                                                                                                <td width="50%">
                                                                                                    <asp:Label ID="lblTotInt" runat="server" Text="Total" Width="100px" />
                                                                                                </td>
                                                                                                <td width="50%">
                                                                                                    <asp:Label ID="lblTotInterest" runat="server" Width="100px" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <%-- <tr>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtFInterestDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                            runat="server" ToolTip="Interest Date" />
                                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFInterestDate"
                                                                                            ID="CalFInterestDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtFDueAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                            runat="server" ToolTip="DueAmount" />
                                                                                    </td>
                                                                                </tr>--%>
                                                                                        </table>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                    <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <%--Hedge Reference Number--%>
                                                                                <asp:TemplateField Visible="false" HeaderText="Hedge">
                                                                                    <HeaderTemplate>
                                                                                        <table id="table8" runat="server" width="100%">
                                                                                            <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                                                <td colspan="2" align="center">Hedge
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td width="50%" style="text-align: center">Ref No
                                                                                                </td>
                                                                                                <td width="50%">Amount
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table id="table9" runat="server" width="100%">
                                                                                            <tr>
                                                                                                <td style="text-align: center" width="50%">
                                                                                                    <asp:Label ID="lblHedgeNo" runat="server" Text='<%#Eval("Hedge_No") %>' ToolTip="Hedge No" />
                                                                                                </td>
                                                                                                <td width="50%" style="text-align: right">
                                                                                                    <asp:Label ID="lblHedgeAmount" Style="text-align: right" runat="server" Text='<%#Eval("Hedge_Amount") %>'
                                                                                                        ToolTip="Hedge Amount" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <table id="table10" runat="server" width="100%">
                                                                                            <tr>
                                                                                                <td width="50%">
                                                                                                    <asp:DropDownList ID="ddlHedgeNo" runat="server" Width="100px">
                                                                                                        <asp:ListItem Value="0" Text="--Select--" />
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:Label ID="lblHedgeNo" runat="server" Text='<%#Eval("Hedge_No") %>' ToolTip="Hedge No"
                                                                                                        Visible="false" />
                                                                                                </td>
                                                                                                <td width="50%">
                                                                                                    <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                        onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                        Text='<%#Eval("Hedge_Amount") %>' runat="server" ToolTip="Hedge Amount" />
                                                                                                    <%--<cc1:FilteredTextBoxExtender ID="fHedgeAmount" TargetControlID="HedgeAmount" FilterType="Numbers"
                                                                        runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnHedgeAmount" runat="server" Value='<%#Eval("Hedge_Amount") %>' />--%>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <table id="table11" runat="server" width="100%">
                                                                                            <tr valign="top">
                                                                                                <td width="50%">&nbsp;
                                                                                                </td>
                                                                                                <td width="50%">&nbsp;
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr valign="top">
                                                                                                <td width="50%">
                                                                                                    <center>
                                                                                                        <asp:DropDownList ID="ddlHedgeNo" runat="server" Width="110px">
                                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                                        </asp:DropDownList>
                                                                                                    </center>
                                                                                                </td>
                                                                                                <td width="50%">
                                                                                                    <center>
                                                                                                        <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                            runat="server" ToolTip="Hedge Amount" />
                                                                                                        <%--  <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                            runat="server" Enabled="True" />--%>
                                                                                                        <%--<asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                            ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />--%>
                                                                                                    </center>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                    <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <%--JV Reference Number--%>
                                                                                <asp:TemplateField HeaderText="JV Reference Number">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                    <EditItemTemplate>
                                                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                                    </EditItemTemplate>
                                                                                    <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Repay_Int" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblRepay_Int" runat="server" Text='<%#Eval("Repay_Int") %>' ToolTip="Repay Int" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                    <EditItemTemplate>
                                                                                        <asp:Label ID="lblRepay_Int" runat="server" Text='<%#Eval("Repay_Int") %>' ToolTip="Repay Int" />
                                                                                    </EditItemTemplate>
                                                                                    <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                                                </asp:TemplateField>
                                                                                <%--Add Edit Update Cancel Delete--%>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        ToolTip="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                                        &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                            ToolTip="Update" ValidationGroup="vgBRUpdate" CausesValidation="true"></asp:LinkButton>
                                                                                        &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <br></br>
                                                                                        <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgBRAdd"
                                                                                            ToolTip="Add" CausesValidation="true"></asp:LinkButton>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                                    <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                        </asp:Panel>
                                                    </div>

                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabMoratorium" Visible="false" CssClass="tabpan" BackColor="Red"
                                    Width="65%">
                                    <HeaderTemplate>
                                        Moratorium
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="grid">
                                                            <asp:GridView ID="grvMorotorium" runat="server" Width="98%" AutoGenerateColumns="false"
                                                                ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvMorotorium_RowCommand"
                                                                OnRowDataBound="grvMorotorium_RowDataBound" OnRowDeleting="grvMorotorium_RowDeleting">
                                                                <Columns>
                                                                    <%--Serial Number--%>
                                                                    <asp:TemplateField HeaderText="Sl No">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMorotorium_Sl" runat="server" Text='<%#Eval("SLNo") %>' ToolTip="Cashflow Type" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--Morotorium type ID--%>
                                                                    <asp:TemplateField HeaderText="Morotorium Type ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMorotorium_Type_ID" runat="server" Text='<%#Eval("Moratoriumtype") %>'
                                                                                ToolTip="Cashflow Type" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--Morotorium type--%>
                                                                    <asp:TemplateField HeaderText="Morotorium Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblMorotorium_Type" runat="server" Text='<%#Eval("Moratorium") %>'
                                                                                ToolTip="Morotorium Type" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:DropDownList ID="ddlMorotorium_Type" runat="server" Width="100%">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvMorotorium_Type" runat="server" ControlToValidate="ddlMorotorium_Type"
                                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ErrorMessage="Select the Moratorium Type"
                                                                                InitialValue="-1" ValidationGroup="btnAddMor"></asp:RequiredFieldValidator>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--From date--%>
                                                                    <asp:TemplateField HeaderText="From Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFrom_Date" runat="server" Text='<%#Eval("Fromdate") %>' ToolTip="Frequency" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtFrom_Date" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                runat="server" ToolTip="From Date" />
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFrom_Date"
                                                                                PopupButtonID="txtFrom_Date" ID="CEFrom_Date" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <asp:RequiredFieldValidator ID="rfvFrom_Date" runat="server" ControlToValidate="txtFrom_Date"
                                                                                ErrorMessage="Enter From Date" Display="None" SetFocusOnError="True" ValidationGroup="btnAddMor" />
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--To date--%>
                                                                    <asp:TemplateField HeaderText="To Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTo_Date" runat="server" Text='<%#Eval("Todate") %>' ToolTip="Frequency" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtTo_Date" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                runat="server" ToolTip="To Date" />
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtTo_Date"
                                                                                PopupButtonID="txtTo_Date" ID="CETo_Date" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <asp:RequiredFieldValidator ID="rfvTo_Date" runat="server" ControlToValidate="txtTo_Date"
                                                                                ErrorMessage="Enter To Date" Display="None" SetFocusOnError="True" ValidationGroup="btnAddMor" />
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <%--No of days--%>
                                                                    <asp:TemplateField HeaderText="No of days" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblNo_of_days" runat="server" Text='<%#Eval("Noofdays") %>' ToolTip="No of days" />
                                                                        </ItemTemplate>
                                                                        <%-- <FooterTemplate>
                                                                    <asp:TextBox ID="txtNo_of_days" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                        runat="server" ToolTip="No of days" />
                                                                </FooterTemplate>--%>
                                                                    </asp:TemplateField>
                                                                    <%-- Action --%>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                                CausesValidation="false" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="btnAddMor" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                                Text="Add" ValidationGroup="btnAddMor"></asp:Button>
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Interest Payable" ID="TpBorower"
                                    CssClass="tabpan" BackColor="Red">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPayflowInterestType" runat="server"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvOutfloeInterestType" runat="server" ControlToValidate="ddlPayflowInterestType"
                                                                            InitialValue="0" ErrorMessage="Select Interest Type" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn_IPay" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblOutflowInterestType" Text="Interest Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPayFlowInterestBasis" runat="server" AutoPostBack="true"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlPayFlowInterestBasis"
                                                                            InitialValue="0" ErrorMessage="Select Interest Basis" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn_IPay" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblOutflowInterestBasis" CssClass="styleReqFieldLabel" Text="Interest Basis"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtOutflowBaseRate" onchange="FuncalculateTotalRateOut();" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbOutBaseRate" runat="server" TargetControlID="txtOutflowBaseRate"
                                                                        FilterType="Numbers,Custom" ValidChars=" ."
                                                                        Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvOutBaseRate" runat="server" ControlToValidate="txtOutflowBaseRate"
                                                                            ErrorMessage="Enter Base Rate" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn_IPay" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblOutflowBaseRate" Text="Base Rate %"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtOutflowSpreadRate" AutoPostBack="true" OnTextChanged="txtOutflowSpreadRate_OnChanged" onchange="FuncalculateTotalRateOut();" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbOutSpreadRate" runat="server" TargetControlID="txtOutflowSpreadRate"
                                                                        FilterType="Numbers,Custom" ValidChars=" ."
                                                                        Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvSpredRate" runat="server" ControlToValidate="txtOutflowSpreadRate"
                                                                            ErrorMessage="Enter Spread Rate" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn_IPay" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblOutflowSpreadRate" CssClass="styleReqFieldLabel" Text="Spread Rate %"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtOutflowRate" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblOutflowTotalRate" Text="Total Rate %"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlOutflowType" runat="server" ToolTip="Inflow Type"
                                                                        class="md-form-control form-control" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlOutflowType"
                                                                            InitialValue="0" ErrorMessage="Select Inflow Type" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btngoOut" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblOutflowInflowType" Text="Inflow Type"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPaymentFrequency" runat="server" ToolTip="Payment Frequency"
                                                                        class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvPaymentFrequency" runat="server" ControlToValidate="ddlPaymentFrequency"
                                                                            InitialValue="0" ErrorMessage="Select Payment Frequency" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn_IPay" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblPaymentFrequency" CssClass="styleReqFieldLabel" Text="Payment Frequency"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtRepayDate" runat="server" OnTextChanged="txtRepayDate_OnTextChanged" ToolTip="Pay Date"
                                                                        onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true"
                                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                        PopupButtonID="txtReceivingDate"
                                                                        ID="CalendarExtender1" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtRepayDate"
                                                                            ErrorMessage="Enter First Payment Date" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="btnAddTrn_IPay" CssClass="validation_msg_box_sapn" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblFirstDueDate" CssClass="styleReqFieldLabel" Text="Interest Start Date" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFromDateTrn_IPay" AutoPostBack="true" OnTextChanged="txtFromDateTrn_IPay_TextChanged" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                        ToolTip="Due Date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFromDateTrn_IPay"
                                                                        PopupButtonID="txtFromDateTrn" ID="CEtxtFromDateTrn_IPay" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblFromDateTrn_IPay" ToolTip="From Date" runat="server" Text="Rate From Date"
                                                                            CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtToDateTrn_IPay" OnTextChanged="txtToDateTrn_IPay_TextChanged" AutoPostBack="true" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                        ToolTip="Due Date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtToDateTrn_IPay"
                                                                        PopupButtonID="txtToDateTrn_IPay" ID="CalendarExtender2" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="Label4" ToolTip="To Date" runat="server" Text="Rate To Date"
                                                                            CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="ddltrancherefnoTrn_IPay" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                        ToolTip="Due Date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtToDateTrn_IPay"
                                                                        PopupButtonID="txtToDateTrn_IPay" ID="CalendarExtender4" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTranche_Ref_NoTrn_IPay" ToolTip="Tranche Ref No/Serial No" runat="server"
                                                                            Text="Tranche Ref No/Serial No" CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div align="right">

                                                            <button class="css_btn_enabled" id="btnAddTrn_IPay" title="Add,Alt+T" onclick="if(fnConfirmAdd('btnAddTrn_IPay'))" causesvalidation="false" onserverclick="btnAddTrn_Click_IPay" runat="server"
                                                                validationgroup="btnAddTrn_IPay" type="button" accesskey="T">
                                                                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                            </button>
                                                            <button class="css_btn_enabled" id="Button2" title="Modify, Alt+M" onclick="if(fnCheckPageValidators('btnModifyTrn_IPay'))" causesvalidation="false" onserverclick="btnModifyTrn_Click_IPay" runat="server"
                                                                validationgroup="btnModifyTrn_IPay" type="button" accesskey="M">
                                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                            </button>
                                                            <button class="css_btn_enabled" id="btnClearTrn_IPay" title="Clear,Alt+Q" causesvalidation="false" onserverclick="btnClearTrn_Click_IPay" runat="server"
                                                                type="button" accesskey="Q">
                                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                                                <asp:Label ID="lblTrnSlNo_IPay" runat="server" Visible="False"></asp:Label>

                                                            </button>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel GroupingText="Interest Rate Details" ID="pnlInterestDetails_IPay" runat="server"
                                                                    CssClass="stylePanel" Width="100%">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="grid">
                                                                                <asp:GridView ID="grvtranche_IPay" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                    Width="100%" OnRowDataBound="grvtranche_IPay_RowDataBound" OnRowDeleting="grvtranche_IPay_RowDeleting">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="Select">
                                                                                            <ItemTemplate>
                                                                                                <asp:RadioButton ID="RBSelect" runat="server" Checked="false"
                                                                                                    AutoPostBack="true" OnCheckedChanged="RBSelectTrn_CheckedChanged_IPay" Text="" Style="padding-left: 7px" />

                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                                <asp:HiddenField ID="hdnSlno1" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Tranche Ref. No."
                                                                                            FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblLookupCode" runat="server" Text='<%#Bind("tranche_Ref_No") %>'
                                                                                                    Visible="false"></asp:Label>
                                                                                                <asp:Label ID="lbltrancheNo" ToolTip="Tranche Ref. No." Width="95%" runat="server"
                                                                                                    Text='<%#Eval("tranche_Ref_No")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="From Date">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblFromDate" runat="server" Text='<%#Eval("From_Date") %>' ToolTip="From Date" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="To Date">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblToDate" runat="server" Text='<%#Eval("To_Date") %>' ToolTip="From Date" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Base Rate%" FooterStyle-Width="20%"
                                                                                            ItemStyle-Width="12%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblbaserate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Base_Rate_Per")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Variable Rate%"
                                                                                            FooterStyle-Width="12%" ItemStyle-Width="12%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblvariablerate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Variable_Rate_Per")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Total Rate%" FooterStyle-Width="20%"
                                                                                            ItemStyle-Width="20%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lbltotalrate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Total_Rate_Per")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <%--  <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="TDS Section" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lbltdsrate" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("TDS_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                        <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Service Tax%" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblservicetaxrate" ToolTip="Base Rate%" Width="95%" runat="server"
                                                                                            Text='<%#Eval("Service_Tax_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                        <%--  <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Others%" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblothers" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Others_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                        <%--    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Others AMT" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblothersamt" ToolTip="Others Amt" Width="95%" runat="server" Text='<%#Eval("Others_Amt")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Cost of Fund%" Visible="false"
                                                                                            FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblcost" ToolTip="Base Rate%" Width="95%" runat="server" Text='<%#Eval("Cost_of_Funds_Per")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                        <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Discount %" FooterStyle-Width="20%"
                                                                                    ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblDisc_Per" ToolTip="Discount %" Width="95%" runat="server" Text='<%#Eval("Disc_Per")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                        <%-- <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Discount Amount"
                                                                                    FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblDisc_Amt" ToolTip="Discount Amount" Width="95%" runat="server"
                                                                                            Text='<%#Eval("Disc_Amt")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                </asp:TemplateField>--%>
                                                                                        <%--<asp:TemplateField HeaderText="Gross_up" ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkGrossUp" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "Gross_up").ToString().ToUpper() == "TRUE" %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>--%>
                                                                                        <%-- <asp:TemplateField HeaderText="COF" ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkcof" runat="server" Enabled="false" Checked='<%# DataBinder.Eval(Container.DataItem, "COF").ToString().ToUpper() == "TRUE" %>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>--%>
                                                                                        <asp:TemplateField HeaderText="Action">
                                                                                            <ItemTemplate>
                                                                                                <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                                                                    OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div align="right">
                                                            <%--<asp:Button ID="btnGoB" runat="server" Text="Go" ToolTip="Go,Alt+G" AccessKey="G" CssClass="styleSubmitShortButton"
                                                                    ValidationGroup="btngoB" OnClientClick="return fnCheckPageValidators('btnGoB',false)"
                                                                    OnClick="btnGoB_Click" />--%>
                                                            <button class="css_btn_enabled" id="btnGoB" onserverclick="btnGoB_Click"  runat="server"
                                                                button="styleSubmitShortButton" type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                            </button>

                                                            <button class="css_btn_enabled" id="btnClearB" title="Clear,Alt+R" causesvalidation="false"
                                                                onserverclick="btnGoBClear_Click" runat="server"
                                                                button="styleSubmitShortButton" type="button" accesskey="R">
                                                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r
                                                            </button>
                                                            <asp:Button ID="btnGoInt" runat="server" Text="Int Pay schedule" Visible="false" ToolTip="Go" CssClass="styleSubmitButton"
                                                                ValidationGroup="btnGoInt" OnClick="btnGoInt_Click" />
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel GroupingText="Borrower Repay Details" ID="pnlBorrowerRepay" runat="server"
                                                                    CssClass="stylePanel">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="grid">
                                                                                <asp:GridView ID="gvBorrowerRepay" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                                    Width="100%" OnRowDataBound="gvBorrowerRepay_RowDataBound" OnRowCommand="gvBorrowerRepay_RowCommand"
                                                                                    OnRowDeleting="gvBorrowerRepay_RowDeleting" OnRowEditing="gvBorrowerRepay_RowEditing"
                                                                                    OnRowCancelingEdit="gvBorrowerRepay_RowCancelingEdit" OnRowUpdating="gvBorrowerRepay_RowUpdating">
                                                                                    <Columns>
                                                                                        <%--Serial Number--%>
                                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                                                <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                                                <asp:HiddenField ID="hdn_TranID" runat="server" Value='<%#Eval("Funder_Tran_DTL1_ID") %>' />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Fund Ref Number--%>
                                                                                        <asp:TemplateField HeaderText="Fund Ref Number" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblFund_Ref_Number" runat="server" Text='<%#Eval("Fund_Ref_No") %>'
                                                                                                    ToolTip="JV Reference Number" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                            <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                                                        </asp:TemplateField>
                                                                                        <%--Principal Schedule--%>
                                                                                        <asp:TemplateField Visible="false" HeaderText="Principal Schedule">
                                                                                            <HeaderTemplate>
                                                                                                <table id="table2" runat="server" width="100%">
                                                                                                    <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                                                        <td colspan="2" align="center">Principal Schedule
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="50%" style="text-align: center">Due Date
                                                                                                        </td>
                                                                                                        <td width="50%">Due Amount
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <table id="table3" runat="server" width="100%">
                                                                                                    <tr>
                                                                                                        <td style="text-align: left" width="50%">
                                                                                                            <asp:Label ID="lblRepayDate" runat="server" Text='<%#Eval("Repay_Date") %>' ToolTip="Repay Date" />
                                                                                                        </td>
                                                                                                        <td style="text-align: right" width="50%">
                                                                                                            <asp:Label ID="lblRepayAmount" Style="text-align: right" runat="server" Text='<%#Eval("Repay_Amount") %>'
                                                                                                                ToolTip="Repay Amount" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                            <EditItemTemplate>
                                                                                                <table id="table4" runat="server" width="100%">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtRepayDate" Width="100px" Text='<%#Eval("Repay_Date") %>' runat="server"
                                                                                                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Due Date" />
                                                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                                                                PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                                                            </cc1:CalendarExtender>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtRepayAmount" Width="100px" AutoPostBack="true" OnTextChanged="txtRepayAmount_OnTextChanged" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                                Text='<%#Eval("Repay_Amount") %>' runat="server" ToolTip="Repay Amount" />
                                                                                                            <%--    <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                                            runat="server" Enabled="True" />--%>
                                                                                                            <asp:HiddenField ID="hdnRepayAmt" runat="server" Value='<%#Eval("Repay_Amount") %>' />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </EditItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <table id="table5" runat="server" width="100%">
                                                                                                    <tr valign="top">
                                                                                                        <td width="50%">
                                                                                                            <asp:Label ID="lblTot" runat="server" Text="Total" />
                                                                                                        </td>
                                                                                                        <td width="50%">
                                                                                                            <asp:Label ID="lblTotRepay" runat="server" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtRepayDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                                runat="server" ToolTip="Repay Date" />
                                                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                                                                                PopupButtonID="txtRepayDate" ID="CalRepayDate" Enabled="True">
                                                                                                            </cc1:CalendarExtender>
                                                                                                            <asp:RequiredFieldValidator ID="rfvRePayDate" runat="server" ControlToValidate="txtRepayDate"
                                                                                                                ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAddPay" />
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtRepayAmount" Width="100px" AutoPostBack="true" OnTextChanged="txtRepayAmount_OnTextChanged" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                                runat="server" ToolTip="Repay Amount" />
                                                                                                            <%--<cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                                            runat="server" Enabled="True" />--%>
                                                                                                            <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                                                                ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAddPay" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                            <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Interest Amount">
                                                                                            <HeaderTemplate>
                                                                                                <table id="table6" runat="server" width="100%">
                                                                                                    <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                                                        <td colspan="2" align="center">Interest Payable Schedule
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="50%" style="text-align: center">Due Date
                                                                                                        </td>
                                                                                                        <td width="50%">Due Amount
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <table id="table7" runat="server" width="100%">
                                                                                                    <tr>
                                                                                                        <td style="text-align: left" width="50%">
                                                                                                            <asp:Label ID="lblInterestDate" runat="server" Text='<%#Eval("Interest_Date") %>'
                                                                                                                ToolTip="Repay Date" />
                                                                                                        </td>
                                                                                                        <td width="50%" style="text-align: right">
                                                                                                            <asp:Label ID="lblInterestAmount" Style="text-align: right" runat="server" Text='<%#Eval("Interest_Amount") %>'
                                                                                                                ToolTip="Repay Amount" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                            <EditItemTemplate>
                                                                                                <table id="table12" runat="server" width="100%">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtEInterestDate" Width="100px" Text='<%#Eval("Interest_Date") %>' onmouseover="txt_MouseoverTooltip(this)"
                                                                                                                runat="server" ToolTip="Interest Date" />
                                                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEInterestDate"
                                                                                                                ID="CalEInterestDate" Enabled="True">
                                                                                                            </cc1:CalendarExtender>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:TextBox ID="txtEDueAmount" Width="100px" Text='<%#Eval("Interest_Amount") %>' onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                                runat="server" ToolTip="DueAmount" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </EditItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <table id="table12" runat="server" width="100%">
                                                                                                    <tr valign="top">
                                                                                                        <td width="50%">
                                                                                                            <asp:Label ID="lblTotInt" runat="server" Text="Total" Width="100px" />
                                                                                                        </td>
                                                                                                        <td width="50%">
                                                                                                            <asp:Label ID="lblTotInterest" runat="server" Width="100px" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <%--<tr>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtFInterestDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                            runat="server" ToolTip="Interest Date" />
                                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFInterestDate"
                                                                                            ID="CalFInterestDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:TextBox ID="txtFDueAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                            runat="server" ToolTip="Due Amount" />
                                                                                    </td>
                                                                                </tr>--%>
                                                                                                </table>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                            <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <%--Hedge Reference Number--%>
                                                                                        <asp:TemplateField Visible="false" HeaderText="Hedge">
                                                                                            <HeaderTemplate>
                                                                                                <table id="table8" runat="server" width="100%">
                                                                                                    <tr align="center" style="border-bottom: solid 1px #bad4ff;">
                                                                                                        <td colspan="2" align="center">Hedge
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td width="50%" style="text-align: center">Ref No
                                                                                                        </td>
                                                                                                        <td width="50%">Amount
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <table id="table9" runat="server" width="100%">
                                                                                                    <tr>
                                                                                                        <td style="text-align: center" width="50%">
                                                                                                            <asp:Label ID="lblHedgeNo" runat="server" Text='<%#Eval("Hedge_No") %>' ToolTip="Hedge No" />
                                                                                                        </td>
                                                                                                        <td width="50%" style="text-align: right">
                                                                                                            <asp:Label ID="lblHedgeAmount" Style="text-align: right" runat="server" Text='<%#Eval("Hedge_Amount") %>'
                                                                                                                ToolTip="Hedge Amount" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                            <EditItemTemplate>
                                                                                                <table id="table10" runat="server" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="50%">
                                                                                                            <asp:DropDownList ID="ddlHedgeNo" runat="server" Width="100px">
                                                                                                                <asp:ListItem Value="0" Text="--Select--" />
                                                                                                            </asp:DropDownList>
                                                                                                            <asp:Label ID="lblHedgeNo" runat="server" Text='<%#Eval("Hedge_No") %>' ToolTip="Hedge No"
                                                                                                                Visible="false" />
                                                                                                        </td>
                                                                                                        <td width="50%">
                                                                                                            <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                                Text='<%#Eval("Hedge_Amount") %>' runat="server" ToolTip="Hedge Amount" />
                                                                                                            <%--<cc1:FilteredTextBoxExtender ID="fHedgeAmount" TargetControlID="HedgeAmount" FilterType="Numbers"
                                                                        runat="server" Enabled="True" />
                                                                    <asp:HiddenField ID="hdnHedgeAmount" runat="server" Value='<%#Eval("Hedge_Amount") %>' />--%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </EditItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <table id="table11" runat="server" width="100%">
                                                                                                    <tr valign="top">
                                                                                                        <td width="50%">&nbsp;
                                                                                                        </td>
                                                                                                        <td width="50%">&nbsp;
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr valign="top">
                                                                                                        <td width="50%">
                                                                                                            <center>
                                                                                                                <asp:DropDownList ID="ddlHedgeNo" runat="server" Width="110px">
                                                                                                                    <asp:ListItem Value="0" Text="--Select--" />
                                                                                                                </asp:DropDownList>
                                                                                                            </center>
                                                                                                        </td>
                                                                                                        <td width="50%">
                                                                                                            <center>
                                                                                                                <asp:TextBox ID="txtHedgeAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                                    runat="server" ToolTip="Hedge Amount" />
                                                                                                                <%--  <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                            runat="server" Enabled="True" />--%>
                                                                                                                <%--<asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                            ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />--%>
                                                                                                            </center>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                            <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <%--JV Reference Number--%>
                                                                                        <asp:TemplateField HeaderText="JV Reference Number">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                            <EditItemTemplate>
                                                                                                <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                                            </EditItemTemplate>
                                                                                            <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Repay_Int" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblRepay_Int" runat="server" Text='<%#Eval("Repay_Int") %>' ToolTip="Repay Int" />
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                                            <EditItemTemplate>
                                                                                                <asp:Label ID="lblRepay_Int" runat="server" Text='<%#Eval("Repay_Int") %>' ToolTip="Repay Int" />
                                                                                            </EditItemTemplate>
                                                                                            <%--<FooterTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </FooterTemplate>--%>
                                                                                        </asp:TemplateField>
                                                                                        <%--Add Edit Update Cancel Delete--%>
                                                                                        <asp:TemplateField>
                                                                                            <ItemTemplate>
                                                                                                &nbsp;
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%#Container.DataItemIndex%>'
                                                                        ToolTip="Edit" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                                                                                &nbsp;
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                        ToolTip="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <EditItemTemplate>
                                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                                    ToolTip="Update" ValidationGroup="vgBRUpdate" CausesValidation="true"></asp:LinkButton>
                                                                                                &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                                            </EditItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <br></br>
                                                                                                <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgBRAddPay"
                                                                                                    ToolTip="Add" CausesValidation="true"></asp:LinkButton>
                                                                                            </FooterTemplate>
                                                                                            <ItemStyle Width="15%" HorizontalAlign="Center" />
                                                                                            <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <div>

                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="styleMandatoryLabel"
                                                                Enabled="true" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Cashflow" ID="tpcashflow" CssClass="tabpan"
                                    BackColor="Red" Visible="false">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Cashflow" ID="pnlCashflow" runat="server" CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="grid">
                                                                        <asp:GridView ID="grvCashflows" runat="server" Width="90%" AutoGenerateColumns="false"
                                                                            ShowFooter="true" FooterStyle-HorizontalAlign="Center" OnRowCommand="grvCashflows_RowCommand"
                                                                            OnRowDataBound="grvCashflows_RowDataBound" OnRowDeleting="grvCashflows_RowDeleting">
                                                                            <Columns>
                                                                                <%--Serial Number--%>
                                                                                <asp:TemplateField HeaderText="Sl No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                                        <asp:HiddenField ID="hdn_Fund_CF_ID" runat="server" Value='<%#Eval("Fund_CF_ID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--Type--%>
                                                                                <asp:TemplateField HeaderText="Type">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblType" runat="server" Text='<%#Eval("Type") %>' ToolTip="Cashflow Type" />
                                                                                        <asp:Label ID="lblTypeID" runat="server" Text='<%#Eval("TypeID") %>' Visible="false"
                                                                                            ToolTip="Cashflow Type ID" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--Frequency--%>
                                                                                <asp:TemplateField HeaderText="CashFlow Desc">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCashFlow" runat="server" Text='<%#Eval("CashFlow") %>' ToolTip="CashFlow" />
                                                                                        <asp:Label ID="lblCashFlowID" runat="server" Text='<%#Eval("CashFlowID") %>' Visible="false"
                                                                                            ToolTip="Cashflow desc ID" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="ddlCashFlow" runat="server" AutoPostBack="true">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--Frequency--%>
                                                                                <asp:TemplateField HeaderText="Frequency">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblFrequency" runat="server" Text='<%#Eval("Frequency") %>' ToolTip="Frequency" />
                                                                                        <asp:Label ID="lblFrequencyID" runat="server" Text='<%#Eval("FrequencyID") %>' Visible="false"
                                                                                            ToolTip="Cashflow Frequency ID" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:DropDownList ID="ddlFrequency" runat="server" AutoPostBack="true">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                                        </asp:DropDownList>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--Date--%>
                                                                                <asp:TemplateField HeaderText="Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCFDate" runat="server" Text='<%#Eval("CFDate") %>' ToolTip="Frequency" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:TextBox ID="txtCFDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                            runat="server" ToolTip="CashFlow Date" />
                                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtCFDate"
                                                                                            PopupButtonID="txtCFDate" ID="CEtxtCFDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--Amount--%>
                                                                                <asp:TemplateField HeaderText="Amount">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCFAmount" Style="text-align: right;" runat="server" Text='<%#Eval("CFAmount") %>'
                                                                                            ToolTip="Frequency" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:TextBox ID="txtCFAmount" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                                            Style="text-align: right;" runat="server" ToolTip="Amount" />
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Right" />
                                                                                </asp:TemplateField>
                                                                                <%--Jv No--%>
                                                                                <asp:TemplateField HeaderText="Jv No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCFJv_No" runat="server" Text='<%#Eval("Jv_No") %>' ToolTip="Jv No" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%--checkbox for Formula Field--%>
                                                                                <asp:TemplateField HeaderText="Condition">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblCondition" Visible="false" runat="server" Text='<%#Eval("Condition") %>'
                                                                                            ToolTip="Condition" />
                                                                                        <asp:CheckBox ID="cbkConditionI" AutoPostBack="true" runat="server" OnCheckedChanged="cbkConditionI_CheckedChanged" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:CheckBox ID="cbkCondition" AutoPostBack="true" runat="server" OnCheckedChanged="cbkCondition_CheckedChanged" />
                                                                                    </FooterTemplate>
                                                                                    <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <%-- Action --%>
                                                                                <asp:TemplateField>
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                                            CausesValidation="false" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <asp:Button ID="btnAddrow" CausesValidation="false" runat="server" CommandName="Add"
                                                                                            CssClass="styleGridShortButton" Text="Add"></asp:Button>
                                                                                    </FooterTemplate>
                                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Condition" ID="pnlConditions" runat="server" CssClass="stylePanel"
                                                            Visible="false">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlFields" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFields_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFields" Text="Fields"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlNumericOperators" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlNumericOperators_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblNumericOperator" Text="Numeric Operator"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                            </div>
                                                            <tr>
                                                                <td colspan="6">
                                                                    <asp:TextBox ID="txtFormula" Width="100%" onmouseover="txt_MouseoverTooltip(this)"
                                                                        runat="server" ToolTip="Formula" TextMode="MultiLine" Rows="5" />
                                                                </td>
                                                            </tr>

                                                            </table>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Others" ID="TpOthers" CssClass="tabpan"
                                    BackColor="Red" Visible="false">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Others" ID="pnlOthers" runat="server" CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtIntApplMoney" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Int. on Appl. Money(%)"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblIntApplMoney" Text="Int on Appl Money(%)"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtApplMoneyHC" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Appln. Money HC"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblApplMoneyHC" CssClass="styleReqFieldLabel" Text="Appln. Money HC"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtApplMoneyISIN" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="ISIN"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblApplMoneyISIN" CssClass="styleReqFieldLabel" Text="ISIN"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDateofAvailment" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Date of Availment"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDateofAvailment"
                                                                            PopupButtonID="txtDateofAvailment" ID="CEDateofAvailment" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblDateofAvailment" Text="Date of Availment"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAvailmentAmount" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Availment Amount"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAvailmentAmount" CssClass="styleReqFieldLabel" Text="Availment Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <
                                                                        <asp:TextBox ID="txtAvailmentISIN" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="ISIN"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAvailmentISIN" CssClass="styleReqFieldLabel" Text="ISIN"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <<asp:TextBox ID="txtAllotmentDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Allotmen tDate"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtAllotmentDate"
                                                                            PopupButtonID="txtAllotmentDate" ID="CEAllotmentDate" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAllotmentDate" Text="Allotment Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="CP Details" ID="pnlCP" runat="server" CssClass="stylePanel"
                                                            Visible="false">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:CheckBox ID="chkCP" AutoPostBack="true" runat="server" OnCheckedChanged="chkCP_CheckedChanged" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <asp:Label runat="server" ID="lblCP" Text="Roll Over"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPrevFundTran" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPrevFundTran_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPrevFundTran" Text="Fund Tran No"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Letter Credit Details" ID="pnlLC" runat="server" CssClass="stylePanel"
                                                            Visible="false">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLCAmount" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblLCAmount" Text="Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLCValidity" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Validity" class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblLCValidity" Text="Validity"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFavouring_Of" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Favouring Of" class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFavouring_Of" Text="Favouring Of"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLC_Type" runat="server"
                                                                            class="md-form-control form-control">
                                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblLC_Type" Text="Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLCAvailmentDate" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Availment Date"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblLCAvailmentDate" Text="Availment Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <<asp:TextBox ID="txtPurpose" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="Purpose" TextMode="MultiLine"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblPurpose" Text="Purpose"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="tpDocuments" Visible="false" runat="server" HeaderText="Documents Details" CssClass="tabpan"
                                    BackColor="Red" Width="99%">
                                    <HeaderTemplate>
                                        Documents Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="grid_btn">
                                                    <asp:GridView ID="grvDocDtls" runat="server" AutoGenerateColumns="False" Width="100%"
                                                        BorderColor="Gray" DataKeyNames="Doc_Type_Id" CssClass="styleInfoLabel" ShowFooter="true"
                                                        OnRowDataBound="grvDocDtls_RowDataBound" OnRowCommand="grvDocDtls_RowCommand"
                                                        OnRowDeleting="grvDocDtls_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="SlNo">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Tranche Ref No">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTranche_Ref_No" runat="server" Text='<%#Eval("Tranche_Ref_No") %>'
                                                                        ToolTip="Tranche Ref No" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlTrancheNo" onmouseover="ddl_itemchanged(this)" runat="server">
                                                                    </asp:DropDownList>
                                                                    <%-- <asp:RequiredFieldValidator ID="RFVddlTrancheNo" runat="server" Display="None" ControlToValidate="ddlTrancheNo"
                                                                    ValidationGroup="btnAddDoc" InitialValue="0" ErrorMessage="Select Tranche Ref no"
                                                                    CssClass="styleMandatoryLabel" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                                <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Type Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Type_Id" runat="server" Text='<%# Bind("Doc_Type_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Type" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Type" runat="server" Text='<%# Bind("Doc_Type") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlDoc_Type" runat="server">
                                                                    </asp:DropDownList>
                                                                    <%--                                                                <asp:RequiredFieldValidator ID="RFVddlDoc_Type" runat="server" Display="None" ControlToValidate="ddlDoc_Type"
                                                                    ValidationGroup="lnkAddDoc" InitialValue="0" ErrorMessage="Select Doc Type" CssClass="styleMandatoryLabel"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Doc Description" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc_Description" runat="server" Text='<%# Bind("Doc_Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtDoc_Description" runat="server" Width="95%">
                                                                    </asp:TextBox>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CollectedById" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCollectedBy" runat="server" Text='<%# Bind("Collected_By_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Collected By" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblColletedBy" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlCollectedBy" runat="server">
                                                                    </asp:DropDownList>
                                                                    <%--                                                                <asp:RequiredFieldValidator ID="RFVddlCollectedBy" runat="server" Display="None"
                                                                    ControlToValidate="ddlCollectedBy" ValidationGroup="lnkAddDoc" InitialValue="0"
                                                                    ErrorMessage="Select Collected By" CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Collected Date" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCollected_Date" runat="server" Text='<%# Bind("Collected_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtCollectedDate" runat="server" Width="95%">
                                                                    </asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CECollectedDate" runat="server" Enabled="True" TargetControlID="txtCollectedDate"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <%--                                                                <asp:RequiredFieldValidator ID="RFVtxtCollectedDate" runat="server" Display="None"
                                                                    ControlToValidate="txtCollectedDate" ValidationGroup="lnkAddDoc" ErrorMessage="Enter Collected Date"
                                                                    CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblScanned_Date" runat="server" Text='<%# Bind("Scanned_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtScanned_Date" runat="server" Width="95%">
                                                                    </asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CEScanned_Date" runat="server" Enabled="True" TargetControlID="txtScanned_Date"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Scanned Ref No" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblScanned_Ref_No" runat="server" Visible="false" Text='<%# Bind("Scanned_Ref_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="File View">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                        OnClick="hyplnkView_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEditDisabled"
                                                                        runat="server" />
                                                                    <asp:Label ID="lblFile_Upload" runat="server" Visible="false" Text='<%# Bind("Scanned_Ref_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <cc1:AsyncFileUpload ID="asyFileUpload" runat="server" Width="175px" OnClientUploadComplete="uploadComplete"
                                                                        OnUploadedComplete="asyncFileUpload_UploadedComplete"
                                                                        onmouseover="FunShowPath(this);" />
                                                                    <asp:Label runat="server" ID="myThrobber"></asp:Label>
                                                                    <asp:HiddenField runat="server" ID="hidThrobber" />
                                                                </FooterTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                                                                        OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:LinkButton ID="lnkAdd" Width="100%" ToolTip="Add to the grid" CommandName="Add"
                                                                        ValidationGroup="lnkAddDoc" runat="server" Text="Add"></asp:LinkButton>
                                                                </FooterTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <tr>
                                            <td>
                                                <asp:ValidationSummary ID="VSlnkAddDoc" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                                    ValidationGroup="lnkAddDoc" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                            </td>
                                        </tr>
                                        </table>
                                        <%-- </div>--%>
                                        <%--   <table style="border-collapse: collapse; border-left: solid 1px #aaaaff; border-top: solid 1px #aaaaff;"
                                        runat="server" cellpadding="3" id="clientSide" />
                                    <asp:Label runat="server" Text="&nbsp;" ID="uploadResult" />--%>
                                        <%--</ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Main'))"
                            type="button" accesskey="S" causesvalidation="false" title="Save,Alt+S" validationgroup="Main">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                            type="button" accesskey="L" title="Clear_FA,Alt+L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                            type="button" accesskey="X" title="Exit,Alt+X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <button class="css_btn_enabled" id="btnCancelIRS" onserverclick="btnCancelIRS_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmCancel())"
                            type="button" accesskey="N" title="Cancel IRS,Alt+N">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>ancel</u>IRS
                        </button>

                        <%--<asp:Button ID="btnCalIRR" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Text="Calc COF" OnClick="btnCalIRR_Click" />--%>
                    </div>
                    <tr>
                        <td>
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary5" runat="server" ShowSummary="false"
                                CssClass="styleMandatoryLabel" ValidationGroup="btngo" DisplayMode="BulletList" ShowMessageBox="true"
                                HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="vsFunderTransactionB" runat="server" ShowSummary="true"
                                CssClass="styleMandatoryLabel" ValidationGroup="btngoB" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                                CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowSummary="true"
                                CssClass="styleMandatoryLabel" ValidationGroup="vgUpdate" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowSummary="true"
                                CssClass="styleMandatoryLabel" ValidationGroup="vgBRAdd" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="ValidationSummary4" runat="server" ShowSummary="true"
                                CssClass="styleMandatoryLabel" ValidationGroup="vgBRUpdate" ShowMessageBox="false"
                                HeaderText="Correct the following validation(s):" />
                            <asp:ValidationSummary ID="vsbtnAddMor" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="btnAddMor" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:CustomValidator ID="cvFunderTransaction" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                            <asp:HiddenField ID="hdn_DueAmtTot" Value="0" runat="server" />
                        </td>
                    </tr>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <%--  <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
    <script type="text/javascript">
        function checkDate_PrevSystemDate1(sender, args) {

            if (sender._selectedDate < new Date()) {

                //alert('You cannot select a date less than or equal to system date');
                alert('Selected date cannot be less than or equal to system date');
                //sender._textbox.set_Value('');
            }
            document.getElementById(sender._textbox._element.id).focus();

        }

        //Method to Check zero only in the Text box     
        function ChkIsZeroL(textbox) {
            if (parseFloat(textbox.value) == 0) {
                textbox.focus();
                //textbox.value='';
                alert('Rate should not be 0');
            }

        }


        //Round of to desired prefix and sufix   
        function funChkDecimialF(txtbox, prefixLen, sufixLen, strFieldName, IsZeroCheckReq) {
            if (txtbox.value != '') {
                if (IsZeroCheckReq) {
                    if (parseFloat(txtbox.value) == 0) {
                        txtbox.focus();
                        txtbox.value = '';
                        if (strFieldName == undefined) {
                            alert('Value Can not be 0');
                            txtbox.value = "0";
                            txtbox.focus();
                            return false;
                        }
                        else {
                            alert(strFieldName + ' Can not be 0');
                            txtbox.value = "0";
                            txtbox.focus();
                            return false;
                        }
                    }
                }
                if (isNaN(parseFloat(txtbox.value))) {
                    alert('Enter a valid decimal');
                    txtbox.value = "";
                    txtbox.focus();
                    return false;
                }
                else {
                    var str = txtbox.value.split('.');

                    if (str[0].length > prefixLen) {
                        if (strFieldName == '') {
                            alert('Value precision should not exceed ' + prefixLen + ' digits');
                        }
                        else {
                            alert(strFieldName + ' precision should not exceed ' + prefixLen + ' digits');
                        }
                        txtbox.focus();
                        return false;
                    }
                    txtbox.value = parseFloat(txtbox.value).toFixed(sufixLen);
                }
            }
            return true;
        }


        function FuncalculateTotalRate() {
            var txtbaserateTrn = document.getElementById('<%=txtBaseRate.ClientID%>');
            var txtVariablerateTrn = document.getElementById('<%=txtSpreadRate.ClientID%>');
            intRecSpreadRate = txtVariablerateTrn;
            var txttotalrateTrn = document.getElementById('<%=txtTotalRate.ClientID%>');
            var baserate = 0;
            var varbrate = 0; var SpreadRateId = 0;
            if (txtbaserateTrn != null) {
                if (txtbaserateTrn.value != '')
                    baserate = txtbaserateTrn.value;
            }
            if (txtVariablerateTrn != null) {
                if (txtVariablerateTrn.value != '')
                    varbrate = txtVariablerateTrn.value;
            }
            txttotalrateTrn.value = (parseFloat(baserate) + parseFloat(varbrate)).toFixed(4);
        }
        function FuncalculateTotalRateOut() {
            var txtbaserateTrn = document.getElementById('<%=txtOutflowBaseRate.ClientID%>');
            var txtVariablerateTrn = document.getElementById('<%=txtOutflowSpreadRate.ClientID%>');
            var intRecSpreadRate = document.getElementById('<%=txtSpreadRate.ClientID%>');
            var txttotalrateTrn = document.getElementById('<%=txtOutflowRate.ClientID%>');
            var baserate = 0;
            var varbrate = 0; var SpreadRateId = 0;



            if (txtbaserateTrn != null) {
                if (txtbaserateTrn.value != '')
                    baserate = txtbaserateTrn.value;
            }
            if (txtVariablerateTrn != null) {
                if (txtVariablerateTrn.value != '')
                    varbrate = txtVariablerateTrn.value;
            }
            txttotalrateTrn.value = (parseFloat(baserate) + parseFloat(varbrate)).toFixed(4);

        }
        function FunShowPath(input) {
            if (input != null) {
                var objID = input.id;
                var myThrobber = document.getElementById((input.id).replace('asyFileUpload', 'myThrobber'));
                if (myThrobber != null) {
                    if (myThrobber.innerText != "")
                        input.setAttribute('title', myThrobber.innerText);
                }
            }
        }
        function uploadComplete(sender, args) {
            var objID = sender._inputFile.id.split("_");
            var obj = args._fileName.split("\\");
            objID = "<%= grvDocDtls.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;
                //                document.getElementById(objID + "_hidThrobber").style.Visbility = 'hidden';
                //                document.getElementById(objID + "_hidThrobber").style.display = 'none';
                //document.getElementById(objID + "_myThrobber").visible = false;


                if (obj[obj.length - 1].length > 80) {
                    alert("File Name can't exceed more than 80 characters");
                    document.getElementById(objID + "_myThrobber").innerText = "";
                    document.getElementById(objID + "_hidThrobber").value = "";
                    return false;
                }
            }
        }
    </script>
</asp:Content>





















