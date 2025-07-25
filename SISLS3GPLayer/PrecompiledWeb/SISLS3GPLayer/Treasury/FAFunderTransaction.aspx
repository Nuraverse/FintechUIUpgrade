<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAFunderTransaction, App_Web_ezlcepmc" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="Terms Details" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <%-- Terms Details--%>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <cc1:TabContainer ID="tcFunderTransaction" runat="server" CssClass="styleTabPanel"
                        Width="99%" TabStripPlacement="top" ActiveTabIndex="0">
                        <cc1:TabPanel runat="server" HeaderText="Funder Details" ID="tbGeneral" CssClass="tabpan"
                            BackColor="Red" TabIndex="0">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upGeneral" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Funder Informations" ID="pnlFunderInfo" runat="server" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlDealNumber" runat="server" ToolTip="Deal Number"
                                                                    OnSelectedIndexChanged="ddlDealNumber_SelectedIndexChanged" AutoPostBack="true"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDealNumber"
                                                                        InitialValue="0" ErrorMessage="Select Deal Number" Display="Dynamic" SetFocusOnError="True"
                                                                        ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDealNumber" CssClass="styleReqFieldLabel" Text="Deal Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlTrancheRefNo" OnSelectedIndexChanged="ddlTrancheRefNo_SelectedIndexChanged"
                                                                    AutoPostBack="true" runat="server" ToolTip="Tranche Ref No" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTrancheRefNo"
                                                                        InitialValue="0" ErrorMessage="Select Tranche Ref No" Display="Dynamic" SetFocusOnError="True"
                                                                        ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTrancheRefNo" CssClass="styleReqFieldLabel" Text="Tranche/Serial Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtFunderTranNo" runat="server" ToolTip="Funder Transaction Number"
                                                                    onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFunderTranNo" Text="Funder Transaction Number"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFundTransDate" runat="server" ToolTip="Funder Transaction Date"
                                                                    onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:CalendarExtender ID="CESubscriptionFrom" runat="server" Enabled="True" TargetControlID="txtFundTransDate">
                                                                </cc1:CalendarExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblTranDate" Text="Funder Transaction Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlNatureofFund" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                    Enabled="false" class="md-form-control form-control">
                                                                </asp:DropDownList>

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
                                                                <asp:DropDownList ID="ddlFunderCode" runat="server" ToolTip="Funder Code/Name" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlFunderCode_SelectedIndexChanged" class="md-form-control form-control" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFunderCode" runat="server" ControlToValidate="ddlFunderCode"
                                                                        InitialValue="0" ErrorMessage="Select Funder Code/Name" Display="Dynamic" SetFocusOnError="True"
                                                                        ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblFundercode" CssClass="styleReqFieldLabel" Text="Funder Code/Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" ItemToValidate="Value" ValidationGroup="Main" IsMandatory="true" ErrorMessage="Select Branch" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblLocation" Text="Branch" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtComCity" runat="server" ReadOnly="true"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvComCity" runat="server" ControlToValidate="txtComCity"
                                                                        Display="Dynamic" SetFocusOnError="True" ValidationGroup="Main" ErrorMessage="Enter City in Communication Address"
                                                                        InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtComState" runat="server" ReadOnly="true"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvComState" runat="server" ControlToValidate="txtComState"
                                                                        InitialValue="0" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                        ErrorMessage="Enter State in Communication Address" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtComCountry" runat="server" ReadOnly="true"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvComCountry" runat="server" ControlToValidate="txtComCountry"
                                                                        InitialValue="0" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                        ErrorMessage="Enter Country in Communication Address" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblComCountry" runat="server" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtComPincode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    onblur="FunTrimwhitespace(this,'Pincode/Zipcode in Communication Address');"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtComPincode" ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="Pin"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Panel ID="pnlCurrencyInfo" runat="server" GroupingText="facility Details" Width="100%">
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtCurrecncyCode" runat="server" ToolTip="Currency Code"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblCurrecncyCode" Text="Foreign Currency"></asp:Label>
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtCurrencyValue" runat="server" ToolTip="Currency Code"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblCurrencyValue" Text="Currency (OMR)"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtBaseRate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="Base Rate" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblBaseRate" Text="Base Rate"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtSpreadRate" runat="server" ToolTip="Spread Rate"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblSpreadRate" Text="Spread"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTotalRate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="Total Rate" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblbTotalRate" Text="Total Rate"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtCommitAmt" runat="server" ToolTip="Commitment Amount (FC)"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblCommitmentAmt" CssClass="styleReqFieldLabel" Text="Commitment Amount (FC)" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtCommitAmtINR" runat="server" ToolTip="Commitment Amount (OMR)"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblCommitmentAmtINR" CssClass="styleReqFieldLabel"
                                                                                    Text="Commitment Amount (OMR)" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTrancheAmt" runat="server" ToolTip="Tranche Amount"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblTrancheAmount" Text="Tranche Amount (FC)"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTrancheAmtINR" runat="server" ToolTip="Tranche Amount(OMR)"
                                                                                onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblTrancheAmountINR" Text="Tranche Amount(OMR)"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtAvailedAmt" runat="server" Style="text-align: right;"
                                                                                onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                ToolTip="Availed Amount" ReadOnly="true" CssClass="md-form-control form-control login_form_content_input" />
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvTAX" runat="server" ControlToValidate="txtCommitAmt"
                                                                                    ErrorMessage="Enter Availed Amount" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Main"
                                                                                    CssClass="validation_msg_box_sapn" />
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblAvailedAmt" CssClass="styleReqFieldLabel" Text="Availed Amount (FC)" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtAvailedAmtINR" runat="server" ToolTip="Availed Amount INR"
                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" ReadOnly="true"
                                                                                CssClass="md-form-control form-control login_form_content_input" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblAvailedAmtINR" CssClass="styleReqFieldLabel" Text="Availed Amount (OMR)" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTransactionAmt" runat="server" Style="text-align: right;"
                                                                                onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" OnTextChanged="txtCommitAmt_TextChanged"
                                                                                onkeypress="fnAllowNumbersOnly(false,false,this)" ToolTip="Commitment Amount"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RFVTransactionAmt" runat="server" ControlToValidate="txtTransactionAmt"
                                                                                    ErrorMessage="Enter Transaction Amount" Display="Dynamic" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblTransactionAmt" CssClass="styleReqFieldLabel" Text="Transaction Amount (FC)" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTransactionamtINR" runat="server" ToolTip="Transaction Amount INR"
                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblTransactionAmtINR" CssClass="styleReqFieldLabel"
                                                                                    Text="Transaction Amount(OMR)" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div align="right">
                                                                            <div align="right" style="margin-top: 15px;">
                                                                                <button class="css_btn_enabled" id="btnValidate" onserverclick="btnValidate_Click" validationgroup="btnValidate" runat="server"
                                                                                    type="button" causesvalidation="true" accesskey="P" title="Proceed,Alt+P">
                                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>P</u>roceed
                                                                                </button>

                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Panel ID="pnlTerms" runat="server" GroupingText="Terms Details">
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlTenureType" onchange="FunClearTenure();" runat="server"
                                                                                ToolTip="Interest Tenure Type" class="md-form-control form-control" />

                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblTenure" CssClass="styleReqFieldLabel" Text="Tenure" />
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">

                                                                            <asp:TextBox ID="txtTenure" runat="server" ToolTip="Tenure"
                                                                                Style="text-align: right;" OnTextChanged="txtTenure_TextChanged" AutoPostBack="true"
                                                                                onmouseover="txt_MouseoverTooltip(this)" onblur="ChkIsZero(this,'Tenure')" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                CssClass="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label class="tess">
                                                                                <asp:Label runat="server" ID="Label1" CssClass="styleReqFieldLabel" Text="Tenure" />
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlInterestCalc" runat="server" ToolTip="Interest Calculation"
                                                                                class="md-form-control form-control" />
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlInterestCalc" runat="server" ControlToValidate="ddlInterestCalc"
                                                                                    InitialValue="0" ErrorMessage="Select InterestCalc" Display="Dynamic" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblInterestCalc" CssClass="styleReqFieldLabel" Text="Interest Calculation" />
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">

                                                                            <asp:TextBox ID="txtInterestCalcdate" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                                ToolTip="Interest Calc start date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtInterestCalcdate"
                                                                                PopupButtonID="txtInterestCalcdate" ID="CEInterestCalcdate" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RFVInterestCalcdate" runat="server" ControlToValidate="txtInterestCalcdate"
                                                                                    ErrorMessage="Select Interest Calculation date" Display="None" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" Enabled="true" CssClass="validation_msg_box_sapn" />
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label class="tess">
                                                                                <asp:Label runat="server" ID="Label3" CssClass="styleReqFieldLabel" Text="Interest Calculation" />
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlInterestLevy" runat="server" ToolTip="Interest Pay" class="md-form-control form-control" />
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlInterestLevy" runat="server" ControlToValidate="ddlInterestLevy"
                                                                                    InitialValue="0" ErrorMessage="Select Interest Pay" Display="Dynamic" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblInterestLevy" CssClass="styleReqFieldLabel" Text="Interest Pay" />
                                                                            </label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">

                                                                            <asp:TextBox ID="txtInterestLevy" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                                ToolTip="Interest Credit start date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtInterestLevy"
                                                                                PopupButtonID="txtInterestLevy" ID="CEInterestLevy" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RFVInterestLevy" runat="server" ControlToValidate="txtInterestLevy"
                                                                                    ErrorMessage="Select Interest Pay date" Display="Dynamic" SetFocusOnError="True"
                                                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label class="tess">
                                                                                <asp:Label runat="server" ID="Label4" CssClass="styleReqFieldLabel" Text="Interest Pay" />
                                                                            </label>
                                                                        </div>

                                                                    </div>


                                                                </div>
                                                                <div>
                                                                    <asp:RequiredFieldValidator ID="rfvTenure" runat="server" ControlToValidate="txtTenure"
                                                                        ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="Main" />
                                                                    <asp:RequiredFieldValidator ID="rfvTenure1" runat="server" ControlToValidate="txtTenure"
                                                                        ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="btngo" />
                                                                    <asp:RequiredFieldValidator ID="rfvTenure2" runat="server" ControlToValidate="txtTenure"
                                                                        ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="btngoB" />
                                                                    <asp:RequiredFieldValidator ID="rfvTenure3" runat="server" ControlToValidate="txtTenure"
                                                                        ErrorMessage="Enter Tenure" Display="None" SetFocusOnError="True" ValidationGroup="btnGoInt" />
                                                                    <asp:RequiredFieldValidator ID="rfvddlTenureType" runat="server" ControlToValidate="ddlTenureType"
                                                                        InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="Main" />
                                                                    <asp:RequiredFieldValidator ID="rfvddlTenureType1" runat="server" ControlToValidate="ddlTenureType"
                                                                        InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="btngo" />
                                                                    <asp:RequiredFieldValidator ID="rfvddlTenureType2" runat="server" ControlToValidate="ddlTenureType"
                                                                        InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                        ValidationGroup="btngoB" />
                                                                    </td>
                                                                        <asp:RequiredFieldValidator ID="rfvddlTenureType3" runat="server" ControlToValidate="ddlTenureType"
                                                                            InitialValue="0" ErrorMessage="Select Tenure Type" Display="None" SetFocusOnError="True"
                                                                            ValidationGroup="btnGoInt" />
                                                                </div>

                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtValidUpto" runat="server" ToolTip="Valid Upto" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtValidUpto"
                                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="txtValidUpto"
                                                                    ID="CalendarExtender1" Enabled="false">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvVAT" runat="server" ControlToValidate="txtValidUpto"
                                                                        ErrorMessage="Enter Valid Upto" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Main"
                                                                        CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label runat="server" ID="lblValidUpto" CssClass="styleReqFieldLabel" Text="Maturity Date" />
                                                                </label>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlRepayPattern" runat="server" ToolTip="Repay Pattern"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="1" Text="Advance " />
                                                                    <asp:ListItem Value="2" Text="Arrears" Selected="True" />
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVRepayPattern" runat="server" ControlToValidate="ddlRepayPattern"
                                                                        InitialValue="0" ErrorMessage="Select Repay Pattern" Display="Dynamic" SetFocusOnError="True"
                                                                        ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblRepayPattern" CssClass="styleReqFieldLabel" Text="Repay Pattern"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlArrangement" runat="server" ToolTip="Arrangement" class="md-form-control form-control" Visible="false">
                                                                    <asp:ListItem Value="0" Text="--Select--" />
                                                                    <asp:ListItem Value="1" Text="Blanket " />
                                                                </asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblArrangement" CssClass="styleReqFieldLabel" Text="Arrangement" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlInvestmentLein" runat="server" ToolTip="Investment Lein"
                                                                    class="md-form-control form-control" Visible="false">
                                                                </asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblInvestmentLein" CssClass="styleReqFieldLabel" Text="Investment Lein" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlReportType" runat="server" ToolTip="Report Type" Visible="false" AutoPostBack="false"
                                                                    class="md-form-control form-control" onchange="fnOnChange(this);">

                                                                    <asp:ListItem Text="Loan drawdown letter" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="Promissory Note" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Text="Deposit letter" Value="5"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblReportType" CssClass="styleReqFieldLabel" Text="Report Type" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Panel ID="pnlLetterNo" runat="server" GroupingText="Letter Number">
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtLetterNumber" runat="server" ToolTip="Letter Number"
                                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" ID="lblLetterNumber" Text="Letter Number"></asp:Label>
                                                                            </label>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:Button runat="server" ID="btnDrawdown" Text="Report" ToolTip="Report"
                                                                                CausesValidation="false" CssClass="grid_btn" OnClick="btnDrawdown_Click" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </asp:Panel>
                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="ddlTrancheRefNo" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Receiving Schedule" ID="tpSchedule" CssClass="tabpan"
                            BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="upSchedule" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlInflowType" runat="server" ToolTip="Inflow Type" class="md-form-control form-control" />
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlInflowType1" runat="server" ControlToValidate="ddlInflowType"
                                                            InitialValue="0" ErrorMessage="Select Inflow Type" Display="Dynamic" SetFocusOnError="True"
                                                            ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
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
                                                        class="md-form-control form-control" />
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlReceivingType"
                                                            InitialValue="0" ErrorMessage="Select Receiving Frequency" Display="Dynamic" SetFocusOnError="True"
                                                            ValidationGroup="btngo" CssClass="validation_msg_box_sapn" />
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
                                                    <asp:TextBox ID="txtReceivingDate" runat="server" ToolTip="Receiving Date"
                                                        onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivingDate"
                                                        PopupButtonID="txtReceivingDate"
                                                        ID="CEReceivingDate" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtReceivingDate"
                                                            ErrorMessage="Enter First Due Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btngo"
                                                            CssClass="validation_msg_box_sapn" />
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="Label2" CssClass="styleReqFieldLabel" Text="First Due Date" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div align="right" style="margin-top: 15px;">
                                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGoR_Click" validationgroup="btngo" runat="server"
                                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Receiving Schedule Details" ID="pnlReceiving" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="grid">
                                                                <asp:GridView ID="gvReceiving" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                    Width="90%" OnRowDataBound="gvReceiving_RowDataBound" OnRowCommand="gvReceiving_RowCommand"
                                                                    OnRowDeleting="gvReceiving_RowDeleting" OnRowEditing="gvReceiving_RowEditing"
                                                                    OnRowCancelingEdit="gvReceiving_RowCancelingEdit" OnRowUpdating="gvReceiving_RowUpdating"
                                                                    CssClass="gird_details">
                                                                    <Columns>
                                                                        <%--Serial Number--%>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                                                <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />
                                                                                <asp:HiddenField ID="hdn_TranID" runat="server" Value='<%#Eval("Funder_Tran_Details_ID") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="3%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Funder Reference Number --%>
                                                                        <asp:TemplateField HeaderText="Tranche Reference Number" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Fund Reference Number" />
                                                                            </ItemTemplate>

                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtFund_Ref_No" runat="server" ToolTip="Fund Reference Number" AutoPostBack="true"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtFund_Ref_No_OnTextChanged"
                                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvComboRefNo" runat="server" ControlToValidate="txtFund_Ref_No"
                                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                                                ErrorMessage="Enter Funder Reference Number"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                            <FooterStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <%--Rate --%>
                                                                        <asp:TemplateField HeaderText="Rate" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRate" runat="server" Text='<%#Eval("Fund_Rate") %>' ToolTip="Rate" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtRate" onkeypress="fnAllowNumbersOnly(true,false,this)" Width="60px"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" onblur="funChkDecimialF(this,2,2,'Rate',true);"
                                                                                    MaxLength="5" runat="server" Text='<%#Eval("Fund_Rate") %>' ToolTip="Rate" />
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtRate" TargetControlID="txtRate" FilterType="Custom,Numbers"
                                                                                    ValidChars="." runat="server" Enabled="True" />
                                                                                <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                                    ErrorMessage="Enter Rate" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <center>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtRate" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" onblur="funChkDecimialF(this,2,2,'Rate',true);"
                                                                                            MaxLength="5" runat="server" ToolTip="Rate"
                                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtRate" TargetControlID="txtRate" FilterType="Custom,Numbers"
                                                                                            ValidChars="." runat="server" Enabled="True" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvRate" runat="server" ControlToValidate="txtRate"
                                                                                                ErrorMessage="Enter Rate" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgAdd" CssClass="validation_msg_box_sapn" />
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <%--<ItemStyle Width="8%" HorizontalAlign="Right" />
                                                                <FooterStyle Width="8%" HorizontalAlign="Right" />--%>
                                                                        </asp:TemplateField>
                                                                        <%--Received Date--%>
                                                                        <asp:TemplateField HeaderText="Due Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceivedDate" runat="server" Text='<%#Eval("Due_Date") %>' ToolTip="Due Date" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtReceivedDate" Width="100px" Text='<%#Eval("Due_Date") %>' runat="server"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" OnTextChanged="txtReceivedDate_OnTextChanged"
                                                                                    ToolTip="Due Date" />
                                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivedDate"
                                                                                    PopupButtonID="txtReceivedDate"
                                                                                    ID="CalReceivedDate" Enabled="True">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                                                    ErrorMessage="Enter Due Date" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTot" runat="server" Text="Total" Style="text-align: right;" />
                                                                                <br></br>
                                                                                <center>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtReceivedDate" onmouseover="txt_MouseoverTooltip(this)"
                                                                                            runat="server" ToolTip="Due Date"
                                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReceivedDate"
                                                                                            PopupButtonID="txtReceivedDate"
                                                                                            ID="CalReceivedDate" Enabled="True">
                                                                                        </cc1:CalendarExtender>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvReceivedDate" runat="server" ControlToValidate="txtReceivedDate"
                                                                                                ErrorMessage="Enter Due Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                                                CssClass="grid_validation_msg_box" />
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <%--Received Amount--%>
                                                                        <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReceivedAmount" runat="server" Text='<%#Eval("Due_Amount") %>'
                                                                                    ToolTip="Due Amount" Style="text-align: right;" />
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtReceivedAmount" Width="100px" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                    Text='<%#Eval("Due_Amount") %>' runat="server" ToolTip="Due Amount" />
                                                                                <%--<cc1:FilteredTextBoxExtender ID="ftxtDueAmt" TargetControlID="txtReceivedAmount"
                                                                        FilterType="Numbers" runat="server" ValidChars="." Enabled="True" />--%>
                                                                                <asp:HiddenField ID="hdnDueAmt" runat="server" Value='<%#Eval("Due_Amount") %>' />
                                                                                <asp:RequiredFieldValidator ID="rfvReceivedAmount" runat="server" ControlToValidate="txtReceivedAmount"
                                                                                    ErrorMessage="Enter Due Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgUpdate" />
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblTotDue" runat="server" Text='<%#Eval("TotDue") %>' Style="text-align: right;" />
                                                                                <br></br>
                                                                                <center>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:TextBox ID="txtReceivedAmount" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                            onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                            runat="server" ToolTip="Due Amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                        <%--<cc1:FilteredTextBoxExtender ID="ftxtDueAmt" TargetControlID="txtReceivedAmount"
                                                                            FilterType="Numbers" ValidChars="." runat="server" Enabled="True" />--%>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvReceivedAmount" runat="server" ControlToValidate="txtReceivedAmount"
                                                                                                ErrorMessage="Enter Due Amount" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgAdd" CssClass="validation_msg_box_sapn" />
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <%--JV Reference Number--%>
                                                                        <asp:TemplateField HeaderText="JV Reference Number">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                            <%--<EditItemTemplate>
                                                        <asp:Label ID="lblJVNo" runat="server" Text='<%#Eval("JV_No") %>' ToolTip="JV Reference Number" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
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
                                                                        ToolTip="Delete" OnClientClick="return confirm('On Deleting Fund Reference Number Respective \nBorrower Repay Details will also be Deleted \nAre you sure want to delete?');"
                                                                        CausesValidation="false"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ToolTip="Update" ValidationGroup="vgUpdate" CausesValidation="false"></asp:LinkButton>
                                                                                &nbsp; &nbsp;
                                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                        ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <br></br>
                                                                                <%-- <button class="grid_btn" id="lnkAdd" validationgroup="vgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>  --%>
                                                                                <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="vgAdd"
                                                                                    ToolTip="Add" CausesValidation="true" CssClass="grid_btn"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
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
                        <cc1:TabPanel runat="server" ID="TabMoratorium" CssClass="tabpan" BackColor="Red"
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
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:DropDownList ID="ddlMorotorium_Type" runat="server"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvMorotorium_Type" runat="server" ControlToValidate="ddlMorotorium_Type"
                                                                                CssClass="grid_validation_msg_box" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Select the Moratorium Type"
                                                                                InitialValue="-1" ValidationGroup="btnAddMor"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--From date--%>
                                                            <asp:TemplateField HeaderText="From Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFrom_Date" runat="server" Text='<%#Eval("Fromdate") %>' ToolTip="Frequency" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtFrom_Date" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="From Date"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFrom_Date"
                                                                            PopupButtonID="txtFrom_Date" ID="CEFrom_Date" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFrom_Date" runat="server" ControlToValidate="txtFrom_Date"
                                                                                ErrorMessage="Enter From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnAddMor"
                                                                                CssClass="grid_validation_msg_box" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <%--To date--%>
                                                            <asp:TemplateField HeaderText="To Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTo_Date" runat="server" Text='<%#Eval("Todate") %>' ToolTip="Frequency" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtTo_Date" onmouseover="txt_MouseoverTooltip(this)"
                                                                            runat="server" ToolTip="To Date"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtTo_Date"
                                                                            PopupButtonID="txtTo_Date" ID="CETo_Date" Enabled="True">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvTo_Date" runat="server" ControlToValidate="txtTo_Date"
                                                                                ErrorMessage="Enter To Date" Display="None" SetFocusOnError="True" ValidationGroup="btnAddMor" />
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
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
                                                                    <button class="grid_btn" id="btnAddMor" validationgroup="btnAddMor" title=",Alt+F" accesskey="F" runat="server">
                                                                        <i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                    <%--<asp:Button ID="btnAddMor" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                        Text="Add" ValidationGroup="btnAddMor" ToolTip="Add,Alt+F" AccessKey="F"></asp:Button>--%>
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
                        <cc1:TabPanel runat="server" HeaderText="Borrower Repayment Schedule" ID="TpBorower"
                            CssClass="tabpan" BackColor="Red">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlOutflowType" runat="server" ToolTip="Outflow Type"
                                                        OnSelectedIndexChanged="ddlOutflowType_SelectedIndexChanged" class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlOutflowType1" runat="server" ControlToValidate="ddlOutflowType"
                                                            InitialValue="0" ErrorMessage="Select Outflow Type" Display="Dynamic" SetFocusOnError="True"
                                                            ValidationGroup="btngoB" CssClass="validation_msg_box_sapn" />
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblOutflowType" Text="Outflow Type"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlRepaymentType" runat="server" ToolTip="Repayment Type"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlRepaymentType"
                                                            InitialValue="0" ErrorMessage="Select Repayment Frequency" Display="Dynamic" SetFocusOnError="True"
                                                            ValidationGroup="btngoB" CssClass="validation_msg_box_sapn" />
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblRepaymentType" CssClass="styleReqFieldLabel" Text="Repayment Frequency"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtRepayDate" runat="server" ToolTip="Repayment Date"
                                                        onmouseover="txt_MouseoverTooltip(this)"
                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtRepayDate"
                                                        PopupButtonID="txtRepayDate"
                                                        ID="CERepayDate" Enabled="True">
                                                    </cc1:CalendarExtender>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtRepayDate"
                                                            ErrorMessage="Enter Repayment Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btngoB"
                                                            CssClass="validation_msg_box_sapn" />
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblRepaymentDate" CssClass="styleReqFieldLabel" Text="Repayment Date" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCOF" runat="server" ToolTip="Cost of Fund %" onmouseover="txt_MouseoverTooltip(this)"
                                                        Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true" />

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVtxtCOF" runat="server" ControlToValidate="txtCOF"
                                                            ErrorMessage="Calculate Cost of Fund %" Display="Dynamic" SetFocusOnError="True"
                                                            ValidationGroup="Main" CssClass="grid_validation_msg_box" />
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblCOF" CssClass="styleReqFieldLabel" Text="Cost of Fund %" />
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div align="right" style="margin-top: 15px;">
                                            <button class="css_btn_enabled" id="btnGoB" onserverclick="btnGoB_Click" validationgroup="btngoB" runat="server"
                                                type="button" causesvalidation="true" accesskey="O" title="Go,Alt+O">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                            </button>

                                            <button class="css_btn_enabled" id="btnGoInt" onserverclick="btnGoInt_Click" validationgroup="btnGoInt" runat="server"
                                                type="button" causesvalidation="true" accesskey="I" title="Interest Schedule,Alt+I">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>Int</u>Schedule
                                            </button>

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
                                                                    OnRowCancelingEdit="gvBorrowerRepay_RowCancelingEdit" OnRowUpdating="gvBorrowerRepay_RowUpdating"
                                                                    CssClass="gird_details">
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
                                                                        <asp:TemplateField HeaderText="Principal Schedule">
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
                                                                                            <asp:RequiredFieldValidator ID="rfvRepayDate" runat="server" ControlToValidate="txtRepayDate"
                                                                                                ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRUpdate" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRepayAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                Text='<%#Eval("Repay_Amount") %>' runat="server" ToolTip="Repay Amount" />
                                                                                            <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                                                runat="server" Enabled="True" />
                                                                                            <asp:HiddenField ID="hdnRepayAmt" runat="server" Value='<%#Eval("Repay_Amount") %>' />
                                                                                            <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                                                ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRUpdate" />
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
                                                                                                ErrorMessage="Enter Repay Date" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRepayAmount" Width="100px" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                runat="server" ToolTip="Repay Amount" />
                                                                                            <cc1:FilteredTextBoxExtender ID="ftxtRepayAmt" TargetControlID="txtRepayAmount" FilterType="Numbers"
                                                                                                runat="server" Enabled="True" />
                                                                                            <asp:RequiredFieldValidator ID="rfvRepayAmount" runat="server" ControlToValidate="txtRepayAmount"
                                                                                                ErrorMessage="Enter Repay Amount" Display="None" SetFocusOnError="True" ValidationGroup="vgBRAdd" />
                                                                                        </td>
                                                                                    </tr>
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
                                                                                        <td colspan="2" align="center">Interest Schedule
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
                                                                                    <tr valign="top">
                                                                                        <td width="50%">&nbsp;
                                                                                        </td>
                                                                                        <td width="50%">&nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                                            <FooterStyle Width="15%" HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <%--Hedge Reference Number--%>
                                                                        <asp:TemplateField HeaderText="Hedge">
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

                                                                                <center>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlHedgeNo" runat="server"
                                                                                            class="md-form-control form-control">
                                                                                            <asp:ListItem Value="0" Text="--Select--" />

                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </center>

                                                                                <td width="50%">
                                                                                    <center>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtHedgeAmount" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                                onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" MaxLength="12"
                                                                                                runat="server" ToolTip="Hedge Amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                        </div>
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
                                                    </div>
                                                </asp:Panel>
                                                <asp:Label ID="lblTotRepay1" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlHedging" runat="server" Style="display: none;" BorderStyle="Solid"
                                                    BackColor="White" Width="70%">
                                                    <%--<asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                        <ContentTemplate>--%>
                                                    <div id="divTranNo" title="Hedging Details" style="height: 200px; overflow: auto">
                                                        <asp:Label ID="lblempty" runat="server" Font-Bold="False" Font-Size="Small" Text="No Trans Details Found"
                                                            Visible="False" />
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:GridView ID="grvHedging" runat="server" AutoGenerateColumns="False" Width="100%">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Code">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCode" runat="server" Text='<%#Eval("Code") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Due Date">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDueDate" runat="server" Text='<%#Eval("Due_Date") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Currency">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCurrency" runat="server" Text='<%#Eval("Currency") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Cover Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCoverAmt" runat="server" Text='<%#Eval("Cover_Amt") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Select">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkSelect" runat="server" Checked="false" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Label ID="lblmodalerror" runat="server" Visible="false" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Button ID="btnDEVModalCancel" runat="server" Text="Close" OnClick="btnDEVModalCancel_Click"
                                                                        ToolTip="Close" class="styleSubmitButton" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Label ID="lblmodal_Count" runat="server" Font-Bold="False" Font-Size="Small"
                                                            Visible="True" />
                                                    </div>
                                                    <%--</ContentTemplate>
                                                    </asp:UpdatePanel>--%>
                                                </asp:Panel>
                                                <cc1:ModalPopupExtender ID="ModalPopupExtenderHedging" runat="server" BackgroundCssClass="styleModalBackground"
                                                    TargetControlID="btnModal" PopupControlID="pnlHedging" DynamicServicePath=""
                                                    Enabled="true">
                                                </cc1:ModalPopupExtender>
                                                <asp:Label ID="lblPendings" runat="server" Font-Bold="False" Font-Size="Small" Visible="True" />
                                                <asp:Button ID="btnModal" runat="server" Style="display: none" />
                                            </div>
                                        </div>
                                        <tr>
                                            <td colspan="4">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="styleMandatoryLabel"
                                                    Enabled="true" />
                                            </td>
                                        </tr>

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
                                                                                <asp:DropDownList ID="ddlCashFlow" runat="server">
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
                                                                                <asp:DropDownList ID="ddlFrequency" runat="server">
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
                                                                                    CssClass="styleGridShortButton" Text="Add" ToolTip="Add,Alt+T" AccessKey="T"></asp:Button>
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
                                        <asp:Panel GroupingText="Condition" ID="pnlConditions" runat="server" CssClass="stylePanel"
                                            Visible="false">
                                            <table>
                                                <tr>
                                                    <td class="styleFieldLabel" width="10%">
                                                        <asp:Label runat="server" ID="lblFields" Text="Fields"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="25%">
                                                        <asp:DropDownList ID="ddlFields" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFields_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel" width="18%">
                                                        <asp:Label runat="server" ID="lblNumericOperator" Text="Numeric Operator"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="25%">
                                                        <asp:DropDownList ID="ddlNumericOperators" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlNumericOperators_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel" colspan="2">
                                                        <%--   <asp:Label runat="server" ID="lblValues" Text="Values"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign" width="25%">
                                            <asp:TextBox ID="txtValues" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                Style="text-align: right;" runat="server" ToolTip="Amount" />--%>
                                                    &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6">
                                                        <asp:TextBox ID="txtFormula" Width="100%" onmouseover="txt_MouseoverTooltip(this)"
                                                            runat="server" ToolTip="Formula" TextMode="MultiLine" Rows="5" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
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
                                                                <asp:TextBox ID="txtIntApplMoney" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
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
                                                                <asp:TextBox ID="txtApplMoneyISIN" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
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
                                                                <asp:TextBox ID="txtAvailmentAmount" Width="75%" onmouseover="txt_MouseoverTooltip(this)"
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
                                                                <asp:TextBox ID="txtAllotmentDate" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
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
                                        <asp:Panel GroupingText="CP Details" ID="pnlCP" runat="server" CssClass="stylePanel"
                                            Visible="false">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:CheckBox ID="chkCP" AutoPostBack="true" runat="server" OnCheckedChanged="chkCP_CheckedChanged" />

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblCP" Text="Roll Over"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlPrevFundTran" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPrevFundTran_SelectedIndexChanged">
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
                                        <asp:Panel GroupingText="Letter Credit Details" ID="pnlLC" runat="server" CssClass="stylePanel"
                                            Visible="false">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtLCAmount" onmouseover="txt_MouseoverTooltip(this)"
                                                            runat="server" ToolTip="Amount"
                                                            class="md-form-control form-control login_form_content_input requires_true" />
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
                                                            runat="server" ToolTip="Validity"
                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblLCValidity" Text="Validity"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFavouring_Of" Width="100px" onmouseover="txt_MouseoverTooltip(this)"
                                                            runat="server" ToolTip="Favouring Of"
                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" ID="lblFavouring_Of" Text="Favouring Of"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlLC_Type" runat="server" class="md-form-control form-control">
                                                            <asp:ListItem Value="0" Text="--Select--" />
                                                        </asp:DropDownList>
                                                        <%--class="md-form-control form-control login_form_content_input requires_true" />--%>
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
                                                        <asp:TextBox ID="txtPurpose" onmouseover="txt_MouseoverTooltip(this)"
                                                            runat="server" ToolTip="Purpose" TextMode="MultiLine" Rows="3"
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Save'))"
                    type="button" accesskey="S" causesvalidation="false" title="Save,Alt+S" validationgroup="Main">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if(return fnConfirmClear())"
                    type="button" accesskey="L" title="Clear_FA,Alt+L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                    type="button" accesskey="X" title="Exit,Alt+X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>

            </div>



            <%--<asp:Button ID="btnCalIRR" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Text="Calc COF" OnClick="btnCalIRR_Click" />--%>
        </div>
    </div>

    <asp:ValidationSummary ID="vsFunderTransaction" runat="server" ShowSummary="true"
        CssClass="styleMandatoryLabel" ValidationGroup="Main" ShowMessageBox="false"
        HeaderText="Correct the following validation(s):" />
    <asp:ValidationSummary ID="vsFunderTransactionR" runat="server" ShowSummary="true"
        CssClass="styleMandatoryLabel" ValidationGroup="btngo" ShowMessageBox="false"
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

        function FunClearTenure() {
            var txtTenure = document.getElementById('<%=txtTenure.ClientID%>');
            txtTenure.value = '';
        }

        function fnOnChange(dropdown) {

            var myindex = dropdown.selectedIndex;
            var SelValue = dropdown.options[myindex].value;

            var ddlNatureofFund = document.getElementById('<%=ddlNatureofFund.ClientID %>');
            var btnDrawdown = document.getElementById('<%=btnDrawdown.ClientID %>');
            var NatureofFund_index = ddlNatureofFund.selectedIndex;
            var NatureofFund_value = ddlNatureofFund.options[NatureofFund_index].value;
            var ddlNatureofFund_Text = ddlNatureofFund.options[NatureofFund_index].text;

            //if (SelValue == '3') {
                //document.getElementById('<%=pnlLetterNo.ClientID %>').style.display = 'block';
            //}
            //else
                //document.getElementById('<%=pnlLetterNo.ClientID %>').style.display = 'none';
            if (SelValue == '5' && ddlNatureofFund_Text.toLowerCase() != 'corporate deposit') {
                btnDrawdown.disabled = true;
            }
            else {
                btnDrawdown.disabled = false;
            }

        }
        //-->


    </script>
</asp:Content>
