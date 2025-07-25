<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgEntityMaster, App_Web_54a2gfky" enableeventvalidation="false" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="NameSetup" Src="~/UserControls/NameSetup.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc3" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>

            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcEntityMaster" runat="server" ActiveTabIndex="1" CssClass="styleTabPanel"
                            ScrollBars="Auto" meta:resourcekey="tcEntityMasterResource1">
                            <cc1:TabPanel runat="server" HeaderText="Entity Details" ID="tbEntity" CssClass="tabpan"
                                BackColor="Red" meta:resourcekey="tbEntityResource1">
                                <HeaderTemplate>
                                    Entity Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row" style="margin-top: 10px;">
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlEntityType" runat="server" AutoPostBack="true" ToolTip="Entity Type" OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvEntitytype" runat="server" ErrorMessage="Select an Entity Type"
                                                                    ValidationGroup="Submit" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                    ControlToValidate="ddlEntityType" meta:resourcekey="rfvEntitytypeResource1"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEntityType" runat="server" Text="Entity Type" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                            <asp:CheckBox runat="server" ID="chkTradeAdvance" Text="Trade Advance" Visible="false" />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlCustomerType" runat="server" OnSelectedIndexChanged="ddlCustomerType_OnSelectedIndexChanged" ToolTip="Constitution Type"
                                                                InitialValue="----Select----" AutoPostBack="True" class="md-form-control form-control">
                                                            </asp:DropDownList>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Submit" ID="rfvCustomerType" runat="server"
                                                                    ControlToValidate="ddlCustomerType" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Constitution Type"
                                                                    InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblCustomerType" CssClass="styleReqFieldLabel" Text="Constitution Type"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="ddlNationality" runat="server" ServiceMethod="GetNationalityList" IsMandatory="true" ToolTip="Nationality" AutoPostBack="true" OnItem_Selected="ddlNationality_Item_Selected" class="md-form-control form-control"
                                                                ValidationGroup="Submit" ErrorMessage="Select the Nationality" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblNationality" CssClass="styleReqFieldLabel"
                                                                    Text="Nationality"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlConstitutionName" runat="server" InitialValue="----Select----" ToolTip="Constitution Name"
                                                                OnSelectedIndexChanged="ddlConstitutionName_OnSelectedIndexChanged" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Submit" ID="rfvConstitutionName" runat="server"
                                                                    ControlToValidate="ddlConstitutionName" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Constitution Name"
                                                                    InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblConstitutionName" CssClass="styleReqFieldLabel"
                                                                    Text="Constitution Name"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEntityName" runat="server" ToolTip="Entity Name" MaxLength="100" onfocusOut="fnvalidEntityname(this);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtCustomerName" ValidChars=" .&" TargetControlID="txtEntityName"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Submit" ID="rfvtxtEntityName" runat="server"
                                                                    ControlToValidate="txtEntityName" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Entity Name"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblEntityName" CssClass="styleReqFieldLabel" Text="Entity Name"></asp:Label>
                                                            </label>

                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEntityCode" runat="server" ToolTip="Entity Code" Enabled="false" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEntityCode" runat="server" CssClass="styleReqFieldLabel" Text="Entity Code"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="divDealerName" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="ddlDealer" runat="server" ToolTip="Dealer" ServiceMethod="GetDealerList" IsMandatory="true" AutoPostBack="true" ValidationGroup="Submit" ErrorMessage="Select the Dealer" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDealerName" runat="server" Text="Dealer" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="divDealerGroup" runat="server">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="ddlDealer_Group" runat="server" ToolTip="Dealer Group" ServiceMethod="GetDealerGroupList" IsMandatory="false" />


                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDealer_Group" runat="server" Text="Dealer Group"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="divSupplierGroup" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="ddlSupplier_Group" runat="server" ToolTip="Supplier Group" ServiceMethod="GetSupplierGroupList" IsMandatory="false" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblSupplierGroup" runat="server" Text="Supplier Group"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:Panel GroupingText="Entity Names" ID="pnlEntityNames" runat="server" Visible="false" Width="100%"
                                                                CssClass="stylePanel">
                                                                <uc1:NameSetup ID="ucEntityNamesSetup" runat="server" Ontext_changed="NameChange" />
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" id="trEmployeedetails" runat="server" visible="false">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="ddlEmployeeName" runat="server" ServiceMethod="GetEmployeNameList" IsMandatory="false" ToolTip="Employee Code"
                                                                ValidationGroup="Submit" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEmployeeName" runat="server" Text="Employee Code">
                                                                </asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlEmployeeRating" runat="server" InitialValue="--Select--" ToolTip="Employer Rating" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEmployeeRating" runat="server" Text="Employee Rating">
                                                                </asp:Label>
                                                            </label>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEntity_Abbr" MaxLength="50" runat="server" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Abbreviation"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtEntity_Abbr" runat="server" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True" TargetControlID="txtEntity_Abbr">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEntity_Abbr" runat="server" Text="Abbr."></asp:Label>
                                                            </label>

                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtIdentityColumn" runat="server" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true" ToolTip=""></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteIdentityColumn" runat="server" FilterType="Numbers" Enabled="True" TargetControlID="txtIdentityColumn">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Submit" ID="rfvIdentityColumn" runat="server"
                                                                    ControlToValidate="txtIdentityColumn" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                                    SetFocusOnError="True" ErrorMessage="Enter Reference Number">
                                                                </asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="revCRNumber" runat="server" ControlToValidate="txtIdentityColumn" CssClass="validation_msg_box_sapn"
                                                                    ValidationGroup="Submit" Display="Dynamic" ErrorMessage="Enter a valid CR Number" ValidationExpression="" Enabled="false"></asp:RegularExpressionValidator>

                                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtIdentityColumn" ID="RevIdentityColumn" ValidationExpression="^[\s\S]{8,12}$" runat="server"
                                                                    ErrorMessage="Minimum 8 and Maximum 12 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Submit" Enabled="false"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtIdentityColumn" ID="RevCRNUMBERVal" ValidationExpression="^[\s\S]{7,11}$" runat="server"
                                                                    ErrorMessage="Minimum 7 and Maximum 11 characters required." CssClass="validation_msg_box_sapn" SetFocusOnError="true" ValidationGroup="Submit" Enabled="false"></asp:RegularExpressionValidator>

                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblIdentityColumn" CssClass="styleReqFieldLabel" Text="Identity Column"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" runat="server">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlServiceBranch" runat="server" class="md-form-control form-control" ToolTip="MFC Branch" AutoPostBack="true" OnSelectedIndexChanged="ddlServiceBranch_SelectedIndexChanged"></asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblServiceBranch" runat="server" Text="MFC Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlGLPostingCode" runat="server" AutoPostBack="true" ToolTip="GL Posting Code" OnSelectedIndexChanged="ddlGLPostingCode_SelectedIndexChanged" class="md-form-control form-control">
                                                            </asp:DropDownList>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvGlCode" runat="server" ErrorMessage="Select a GL Posting Code"
                                                                    ValidationGroup="Submit" Display="Dynamic" SetFocusOnError="True" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                    ControlToValidate="ddlGLPostingCode" Enabled="false"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblGLPostingCode" runat="server" Text="GL Posting Code"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlSLPostingCode" runat="server" Enabled="false" class="md-form-control form-control" ToolTip="SL Posting Code">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblSLPostingCode" runat="server" Text="SL Posting Code"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtVAT" runat="server" MaxLength="20" ToolTip="TAX Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtVAT" runat="server" FilterType="Numbers" Enabled="True" TargetControlID="txtVAT">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblVAT" runat="server" Text="TAX Number" meta:resourcekey="lblMobileResource1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtTaxNumber" runat="server" ToolTip="VAT Regn. No" MaxLength="10" meta:resourcekey="txtTaxNumberResource1" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <div class="validation_msg_box">
                                                                <asp:RegularExpressionValidator ID="revtxtPanNumber" runat="server" Display="Dynamic" Enabled="false"
                                                                    ValidationGroup="Submit" ErrorMessage="Enter the valid VAT Regn. No."
                                                                    ControlToValidate="txtTaxNumber" ValidationExpression="[a-zA-Z_0-9](\w|\W)" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RegularExpressionValidator>
                                                                <asp:RegularExpressionValidator ID="revtxtPanNumber_Submit" runat="server" ValidationGroup=""
                                                                    ErrorMessage="Enter the valid VAT Regn. No." Display="Dynamic" ControlToValidate="txtTaxNumber"
                                                                    Enabled="false" ValidationExpression="[a-zA-Z_0-9](\w|\W)" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RegularExpressionValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FTBEtaxnumber" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                    TargetControlID="txtTaxNumber" runat="server" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblTaxNumber" runat="server" Text="VAT Regn. No." meta:resourcekey="lblTaxNumberResource1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtROC" runat="server" MaxLength="20" ToolTip="ROC Number" Visible="false"></asp:TextBox>
                                                            <asp:TextBox ID="txtIMPEXP" runat="server" MaxLength="20" ToolTip="IMPEXP Code" Visible="false"></asp:TextBox>
                                                            <asp:DropDownList ID="ddlDeliveryLocation" runat="server" Enabled="false" class="md-form-control form-control" ToolTip="Delivery Branch"></asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDeliveryLocation" runat="server" Text="Delivery Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCreditPeriodAllowed" MaxLength="3" runat="server" ToolTip="Credit Period Allowed" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fttxtCreditPeriodAllowed" FilterType="Numbers"
                                                                TargetControlID="txtCreditPeriodAllowed" runat="server" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblCreditPeriodAllowed" runat="server" Text="Credit Period Allowed"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtColChargesPerMonth" runat="server" ToolTip="Col Charges Per Month" MaxLength="7" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fttxtColChargesPerMonth" FilterType="Numbers, Custom" ValidChars="."
                                                                TargetControlID="txtColChargesPerMonth" runat="server" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblColChargesPerMonth" runat="server" Text="Col Charges Per Month"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:CheckBox ID="cbRelatedParIndic" runat="server" />
                                                            <asp:Label ID="lblRelatedPartyIndicator" runat="server" Text="Related Party Indicator"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:CheckBox ID="cbConsumerDealer" runat="server" Enabled="false" />
                                                            <asp:Label ID="lblConsumerDealer" runat="server" Text="Consumer Dealer"></asp:Label>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:CheckBox ID="chkIs_Active" runat="server" />
                                                            <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEffectiveFrom" runat="server" ToolTip="Effective From" AutoPostBack="true" OnTextChanged="txtEffectiveFrom_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="ceFromDate" runat="server" Enabled="True"
                                                                TargetControlID="txtEffectiveFrom">
                                                            </cc1:CalendarExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtEffectiveFrom" runat="server" ControlToValidate="txtEffectiveFrom" ErrorMessage="Select Effective From"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <input id="hidDate" type="hidden" runat="server" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEffectiveFrom" CssClass="styleReqFieldLabel" runat="server" Text="Effective From"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtEffectiveTo" runat="server" ToolTip="Effective To" AutoPostBack="true" OnTextChanged="txtEffectiveTo_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="ceToDate" runat="server" Enabled="True"
                                                                TargetControlID="txtEffectiveTo">
                                                            </cc1:CalendarExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtEffectiveTo" runat="server" ControlToValidate="txtEffectiveTo" ErrorMessage="Select Effective To"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblEffectiveTo" CssClass="styleReqFieldLabel" runat="server" Text="Effective To"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="divTIN">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtVATIN" runat="server" MaxLength="12" ToolTip="Entity VAT TIN" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblVATIN" CssClass="styleReqFieldLabel" Text="Entity VAT TIN"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="gird col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvOperationHistoryDetails" runat="server" class="gird_details" AutoGenerateColumns="false"
                                                            ShowFooter="true" OnRowCommand="gvOperationHistoryDetails_RowCommand" OnRowDataBound="gvOperationHistoryDetails_RowDataBound"
                                                            OnRowDeleting="gvOperationHistoryDetails_RowDeleting" Visible="false">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                        <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Operation History ID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblOperation_Hist_ID" runat="server" Visible="false" Text='<%#Eval("Operation_Hist_ID")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="From Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblOperationFromDate" runat="server" Text='<%#Eval("FromDate")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtOperationFromDate" runat="server" ToolTip="From Date"></asp:TextBox>

                                                                        <cc1:CalendarExtender ID="ceOperationFromDate" runat="server" Enabled="True"
                                                                            TargetControlID="txtOperationFromDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="To Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblOperationToDate" runat="server" Text='<%#Eval("ToDate")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtOperationToDate" runat="server" ToolTip="To Date"></asp:TextBox>

                                                                        <cc1:CalendarExtender ID="ceOperationToDate" runat="server" Enabled="True"
                                                                            TargetControlID="txtOperationToDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                            CausesValidation="false" />
                                                                        <asp:Label ID="lblRowStatus" runat="server" Text='<%# Bind("RowStatus")%>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    <FooterTemplate>
                                                                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                        <asp:Button ID="btnDetails" Text="Add" CssClass="save_btn fa fa-floppy-o"
                                                                            CommandName="AddNew" runat="server" CausesValidation="false" ToolTip="Add, Alt+D" AccessKey="D" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <RowStyle HorizontalAlign="Center" />

                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlEmpHistoryDetails" GroupingText="Employee History Details" runat="server" Visible="false" CssClass="stylePanel">
                                                        <div class="gird">
                                                            <asp:GridView class="gird_details" ID="gvEmployeeHistoryDet" runat="server" ShowFooter="true" AutoGenerateColumns="false" Width="100%" OnRowCommand="gvEmployeeHistoryDet_RowCommand"
                                                                OnRowDataBound="gvEmployeeHistoryDet_RowDataBound" OnRowDeleting="gvEmployeeHistoryDet_RowDeleting">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Employee History ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblEmployee_Hist_ID" runat="server" Visible="false" Text='<%#Eval("Employee_Hist_ID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="From Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblEmpHistoryFromDate" runat="server" Text='<%#Eval("FromDate")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtEmpHistoryFromDate" runat="server" ToolTip="From Date" CssClass="md-form-control form-control"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="ceEmpHistoryFromDate" runat="server" Enabled="True"
                                                                                    TargetControlID="txtEmpHistoryFromDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="To Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblEmpHistoryToDate" runat="server" Text='<%#Eval("ToDate")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtEmpHistoryToDate" runat="server" ToolTip="To Date" CssClass="md-form-control form-control"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="ceEmpHistoryToDate" runat="server" Enabled="True"
                                                                                    TargetControlID="txtEmpHistoryToDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                                CausesValidation="false" />
                                                                            <asp:Label ID="lblRowStatus" runat="server" Text='<%# Bind("RowStatus")%>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                        <FooterTemplate>
                                                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                            <asp:Button ID="btnDetails" Text="Add" CssClass="grid_btn"
                                                                                CommandName="AddNew" runat="server" CausesValidation="false" ToolTip="Add, Alt+T" AccessKey="T" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <RowStyle HorizontalAlign="Center" />

                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>

                                                <div class="gird col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlInsPolicyDetails" GroupingText="Insurance Policy Details" runat="server" Visible="false" CssClass="stylePanel">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvInsurancePolicyDet" class="gird_details" runat="server" ShowFooter="true" AutoGenerateColumns="false" OnRowCommand="gvInsurancePolicyDet_RowCommand"
                                                                OnRowDataBound="gvInsurancePolicyDet_RowDataBound" OnRowDeleting="gvInsurancePolicyDet_RowDeleting">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Policy Rate ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPolicy_Rate_ID" runat="server" Visible="false" Text='<%#Eval("PolicyRateID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Company Rate">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCompanyRate" runat="server" Text='<%#Eval("CompanyRate")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtCompanyRate" runat="server" Style="text-align: right" MaxLength="6" ToolTip="Company Rate" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fttxtCompanyRate" FilterType="Numbers, Custom" ValidChars="."
                                                                                    TargetControlID="txtCompanyRate" runat="server" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Customer Rate">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblCustomerRate" runat="server" Text='<%#Eval("CustomerRate")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtCustomerRate" runat="server" Style="text-align: right" MaxLength="6" ToolTip="Customer Rate" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fttxtCustomerRate" FilterType="Numbers, Custom" ValidChars="."
                                                                                    TargetControlID="txtCustomerRate" runat="server" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="From Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblInsuranceDetFromDate" runat="server" Text='<%#Eval("FromDate")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtInsuranceDetFromDate" runat="server" ToolTip="From Date" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="ceInsuranceDetFromDate" runat="server" Enabled="True"
                                                                                    TargetControlID="txtInsuranceDetFromDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="To Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblInsuranceDetToDate" runat="server" Text='<%#Eval("ToDate")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtInsuranceDetToDate" runat="server" ToolTip="To Date" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="ceInsuranceDetToDate" runat="server" Enabled="True"
                                                                                    TargetControlID="txtInsuranceDetToDate">
                                                                                </cc1:CalendarExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="btnRemove" Text="Delete" CommandName="Delete" runat="server" CssClass="grid_btn_delete"
                                                                                CausesValidation="false" AccessKey="E" OnClientClick="return confirm('Do you want to delete this record?');" ToolTip="Delete,Alt+Shift+E" />

                                                                            <asp:Label ID="lblRowStatus" runat="server" Text='<%# Bind("RowStatus")%>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="btnDetails" Text="Add" AccessKey="I" ToolTip="Add,Alt+I"
                                                                                CommandName="AddNew" runat="server" CssClass="grid_btn" CausesValidation="false" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle Width="15%" HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <RowStyle HorizontalAlign="Center" />

                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Branch Details" ID="pnlBranchDetails" runat="server" Visible="false"
                                                            CssClass="stylePanel">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtBranch_Code" MaxLength="20" ToolTip="Branch Code" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftetxtBranch_Code" ValidChars=" /|" TargetControlID="txtBranch_Code"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                                                                            Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtBranch_Code" runat="server" ControlToValidate="txtBranch_Code" ErrorMessage="Enter the Branch Code"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Add_Address" Enabled="false"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblBranch_Code" runat="server" Text="Branch Code"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtBranch_Name" MaxLength="60" runat="server" ToolTip="Branch Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtBranch_Name" runat="server" ControlToValidate="txtBranch_Name" ErrorMessage="Enter the Branch Name"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Add_Address" Enabled="false"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblBranch_Name" runat="server" Text="Branch Name"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>

                                                <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="row">
                                                        <asp:Panel GroupingText="Address Details" ID="pnlAddressDetails" runat="server"
                                                            CssClass="stylePanel" Width="100%">

                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <uc3:AddSetup ID="ucAddressDetailsSetup" runat="server" />
                                                                </div>
                                                            </div>

                                                            <div align="right">

                                                                <button class="css_btn_enabled" id="btnAddAddress" onserverclick="btnAddAddress_Click" runat="server" validationgroup="Add_Address"
                                                                    type="button" accesskey="A" causesvalidation="false" title="Add[Alt+A]" onclick="if(fnConfirmAdd('Add_Address'))">
                                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                </button>

                                                                <button class="css_btn_enabled" id="btnModifyAddress" onserverclick="btnModifyAddress_Click" runat="server" causesvalidation="false" title="Modify[Alt+M]"
                                                                    type="button" accesskey="M" visible="false" onclick="if(fnCheckPageValidators('Add_Address',false))">
                                                                    <i class="fa fa-floppy" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                                </button>
                                                                <asp:HiddenField ID="hdnAddressId" runat="server" />
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div id="divGridAddress" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="" ID="pnlAddressDetailsGrid" runat="server"
                                                            CssClass="stylePanel" ScrollBars="Horizontal" Width="100%">
                                                            <asp:GridView ID="gvAddressDetails" class="gird_details" runat="server" AllowPaging="True" Visible="false" AutoGenerateColumns="False"
                                                                OnRowDataBound="gvAddressDetails_RowDataBound" OnSelectedIndexChanged="gvAddressDetails_SelectedIndexChanged"
                                                                OnRowDeleting="gvAddressDetails_RowDeleting">
                                                                <HeaderStyle CssClass="FrozenHeader" />
                                                                <Columns>

                                                                    <%--      <asp:BoundField DataField="Address_ID" HeaderText="S.No">
                                                                        <ItemStyle Width="5%" Wrap="True" />
                                                                    </asp:BoundField>--%>


                                                                    <asp:TemplateField HeaderText="Address_ID" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAddress_ID" Text='<%#Eval("Address_ID")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:BoundField DataField="Branch_Code" HeaderText="Branch Code" NullDisplayText="">
                                                                        <ItemStyle Width="10%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Branch_Name" HeaderText="Branch Name" NullDisplayText="">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>

                                                                    <asp:TemplateField HeaderText="Postal Code Value" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPostalCodeValue" Text='<%#Eval("Postal_Code_Value")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <%--  <asp:BoundField DataField="Postal_Code_Value" HeaderText="Postal Code Value" Visible="false">
                                                                        <ItemStyle Width="3%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>--%>

                                                                    <asp:BoundField DataField="Postal_Code_Text" HeaderText="Postal Code">
                                                                        <ItemStyle Width="25%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Post_Box_No" HeaderText="PostBox No">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>

                                                                    <asp:BoundField DataField="Way_No" HeaderText="Way No">
                                                                        <ItemStyle Width="20%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="House_No" HeaderText="House No">
                                                                        <ItemStyle Width="20%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Block_No" HeaderText="Block No">
                                                                        <ItemStyle Width="20%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Flat_No" HeaderText="Flat No">
                                                                        <ItemStyle Width="20%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Landmark" HeaderText="Landmark">
                                                                        <ItemStyle Width="20%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>

                                                                    <%--     <asp:BoundField DataField="Area_Sheik_Value" HeaderText="AreaSheik Value" Visible="false">
                                                                        <ItemStyle Width="3%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>--%>



                                                                    <asp:BoundField DataField="Area_Sheik" HeaderText="AreaSheik">
                                                                        <ItemStyle Width="20%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Residence_Phone_No" HeaderText="Res Phone No">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Residence_Fax_No" HeaderText="Res Fax No">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Mobile_No" HeaderText="Mobile No">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>

                                                                    <asp:BoundField DataField="Contact_Name" HeaderText="Contact Name">
                                                                        <ItemStyle Width="25%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Contact_No" HeaderText="Contact No">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Office_Phone_No" HeaderText="Office Phone No">
                                                                        <ItemStyle Width="15 %" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>
                                                                    <asp:BoundField DataField="Office_Fax_No" HeaderText="Office Fax No">
                                                                        <ItemStyle Width="15%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>

                                                                    <asp:BoundField DataField="Email" HeaderText="Email">
                                                                        <ItemStyle Width="25%" Wrap="True" CssClass="wraptext" />
                                                                    </asp:BoundField>

                                                                    <%--            <asp:TemplateField HeaderText="Email">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="txtgvEmail" Text='<%#Eval("Email")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>--%>


                                                                    <asp:TemplateField HeaderText="Delete" meta:resourcekey="TemplateFieldResource1" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkbtnDelete" runat="server" Text="Delete"
                                                                                CommandName="Delete"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="ID" Visible="False">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblEntity_Add_Mapping_ID" runat="server" Text='<%#Bind("Entity_Add_Mapping_ID") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="10%" />
                                                                    </asp:TemplateField>

                                                                    <%--                                                                    <asp:TemplateField HeaderText="S.No" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>' ToolTip="Sl.No."></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle Width="1%" HorizontalAlign="Right" />
                                                                    </asp:TemplateField>--%>
                                                                </Columns>
                                                            </asp:GridView>

                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 10px;">
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Bank Details" ID="tpBankdetails" CssClass="tabpan"
                                BackColor="Red" meta:resourcekey="tpBankdetailsResource1">
                                <HeaderTemplate>
                                    Bank Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Panel ID="pnlBankDetails" runat="server">
                                                <div class="row">

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlAccountType" runat="server" meta:resourcekey="ddlAccountTypeResource1" ToolTip="Account Type" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlAccountType" runat="server" ErrorMessage="Select an Account Type" CssClass="validation_msg_box_sapn"
                                                                    ValidationGroup="Add" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlAccountType"
                                                                    InitialValue="0"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAccountType" runat="server" Text="Account Type" CssClass="styleReqFieldLabel"
                                                                    meta:resourcekey="lblAccountTypeResource1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAccountNumber" runat="server" ToolTip="Account Number" MaxLength="16" meta:resourcekey="txtAccountNumberResource1" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteAccountNumber" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                TargetControlID="txtAccountNumber" runat="server" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>

                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvAccountType" runat="server" ErrorMessage="Enter the Account Number" CssClass="validation_msg_box_sapn"
                                                                    ValidationGroup="Add" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtAccountNumber"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblAccountNumber" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"
                                                                    meta:resourcekey="lblAccountNumberResource1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMICRCode" runat="server" MaxLength="25" ToolTip="MICR Code"
                                                                meta:resourcekey="txtMICRCodeResource1" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftexMICRCode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                TargetControlID="txtMICRCode" runat="server" Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMICRCode" runat="server" ErrorMessage="Enter the MICR Code"
                                                                    ValidationGroup="Add" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtMICRCode"
                                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblMICRCode" runat="server" Text="MICR Code" CssClass="styleReqFieldLabel"
                                                                    meta:resourcekey="lblMICRCodeResource1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <uc2:Suggest ID="txtBankName" runat="server" ServiceMethod="GetBankList" ToolTip="Bank Name" IsMandatory="true"
                                                                ValidationGroup="Add" ErrorMessage="Select Bank Name" AutoPostBack="true" OnItem_Selected="txtBankName_Item_Selected" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblBankName" runat="server" Text="Bank Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <%--                 <asp:TextBox ID="txtBranchName" runat="server" Columns="20" MaxLength="40" Wrap="true"
                                                                onkeyup="maxlengthfortxt(40)" onchange="maxlengthfortxt(40)" TextMode="MultiLine"
                                                                meta:resourcekey="txtBranchNameResource1" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fteBranchName" FilterType="Custom" FilterMode="InvalidChars"
                                                                TargetControlID="txtBranchName" runat="server" InvalidChars="!,@,#,$,%,^,&,*,(,),_,-,+,~,`,?,.,:,;,/,\,},{,[,],|,',=,'<','>'"
                                                                Enabled="True">
                                                            </cc1:FilteredTextBoxExtender>--%>

                                                            <asp:DropDownList ID="ddlBankBranch" runat="server" ToolTip="Bank Branch" CssClass="md-form-control form-control"></asp:DropDownList>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ValidationGroup="Add" ID="rfvBankBranch" runat="server" ErrorMessage="Select the Bank Branch"
                                                                    ControlToValidate="ddlBankBranch" InitialValue="0" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" ID="lblBankBranch" CssClass="styleReqFieldLabel" Text="Bank Branch"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="divBankAddress" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtBankAddress" runat="server" MaxLength="300" onkeyup="maxlengthfortxt(300)" ToolTip="Address"
                                                                onchange="maxlengthfortxt(300)" TextMode="MultiLine" Wrap="true" Columns="20"
                                                                meta:resourcekey="txtBankAddressResource1" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtBankAddress" runat="server" ControlToValidate="txtBankAddress"
                                                                    Display="Dynamic" ErrorMessage="Enter the Address" SetFocusOnError="True" ValidationGroup="Add"
                                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblBankAddress" runat="server" CssClass="styleReqFieldLabel" Text="Address"
                                                                    meta:resourcekey="lblBankAddressResource1"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="divIsDefaultAccount" runat="server" visible="false">
                                                        <asp:CheckBox runat="server" ID="chkDefaultAccount" CssClass="styleDisplayLabel"
                                                            Text="Default Account" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                                    </div>
                                                </div>

                                                <div align="right">

                                                    <button class="css_btn_enabled" id="btnAdd" onserverclick="btnAdd_Click" runat="server" validationgroup="Add"
                                                        type="button" accesskey="D" causesvalidation="false" title="Add[Alt+Shift+D]" onclick="if(fnConfirmAdd('Add'))">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;A<u>d</u>d
                                                    </button>

                                                    <button class="css_btn_enabled" id="btnModify" onserverclick="btnModify_Click" runat="server" causesvalidation="false" title="Modify[Alt+O]"
                                                        type="button" accesskey="O" visible="false" onclick="if(fnCheckPageValidators('Add',false))">
                                                        <i class="fa fa-floppy" aria-hidden="true"></i>&emsp;M<u>o</u>dify
                                                    </button>
                                                    <button class="css_btn_enabled" id="btnBnkClear" onserverclick="btnBnkClear_Click" runat="server" visible="false"
                                                        type="button" accesskey="L" causesvalidation="false" title="Clear[Alt+L]">
                                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                                    </button>

                                                    <input id="hdnBankId" runat="server" type="hidden" />
                                                </div>

                                            </asp:Panel>

                                            <div id="divGrid" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="grvBankDetails" runat="server" AllowPaging="True" class="gird_details" AutoGenerateColumns="False"
                                                        OnRowDataBound="grvBankDetails_RowDataBound" Width="100%" meta:resourcekey="grvBankDetailsResource1"
                                                        OnSelectedIndexChanged="grvBankDetails_SelectedIndexChanged" OnRowDeleting="grvBankDetails_RowDeleting">
                                                        <HeaderStyle />
                                                        <Columns>
                                                            <%--<asp:CommandField ShowSelectButton="True" ShowDeleteButton="true" meta:resourcekey="CommandFieldResource1" />--%>

                                                            <%--<asp:BoundField DataField="BankMapping_ID" HeaderText="ID" meta:resourcekey="BoundFieldResource1">
                                                                <ItemStyle Width="5%" Wrap="True" /></asp:BoundField>
                                                            <asp:BoundField DataField="Master_ID" HeaderText="Entity ID" meta:resourcekey="BoundFieldResource2">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="AccountType" Visible="false" HeaderText="Location" meta:resourcekey="BoundFieldResource3">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="AccountType" Visible="false" HeaderText="OwnBranch_ID"
                                                                meta:resourcekey="BoundFieldResource4">
                                                                <ItemStyle Width="5%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="AccountType" HeaderText="Account Type" meta:resourcekey="BoundFieldResource5">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Account_Number" HeaderText="Account Number" meta:resourcekey="BoundFieldResource7">
                                                                <ItemStyle Width="5%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Bank_Name" HeaderText="Bank Name" meta:resourcekey="BoundFieldResource8">
                                                                <ItemStyle Width="10%" Wrap="True" CssClass="wraptext" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Branch_Name" HeaderText="Branch Name" meta:resourcekey="BoundFieldResource9">
                                                                <ItemStyle Width="10%" Wrap="True" CssClass="wraptext" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="MICR_Code" HeaderText="MICR Code" meta:resourcekey="BoundFieldResource10">
                                                                <ItemStyle Width="10%" Wrap="True" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Bank_Address" HeaderText="Bank Address" meta:resourcekey="BoundFieldResource11"
                                                                Visible="false">
                                                                <ItemStyle Width="10%" Wrap="True" CssClass="wraptext" />
                                                            </asp:BoundField>--%>
                                                            <asp:TemplateField HeaderText="Entity_Bank_Mapping_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEntity_BankMapping_ID" runat="server" Text='<%#Eval("Entity_BankMapping_ID")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="BankMapping_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBankMapping_ID" runat="server" Text='<%#Eval("BankMapping_ID")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Entity ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMaster_ID" runat="server" Text='<%#Eval("Master_ID")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Location" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("AccountType")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="OwnBranch_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblOwnBranch_ID" runat="server" Text='<%#Eval("AccountType")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AccountType_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGAccountType_ID" Text='<%#Eval("AccountType_ID")%>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGAccountType" runat="server" Text='<%#Eval("AccountType")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Account Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGAccountNumber" Text='<%#Eval("Account_Number")%>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Bank ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGBank_ID" runat="server" Text='<%#Bind("Bank_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Bank Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGBank_Name" Text='<%#Eval("Bank_Name")%>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Branch ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGBranch_ID" runat="server" Text='<%#Bind("Branch_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Branch Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGBranch_Name" Text='<%#Eval("Branch_Name")%>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="MICR Code">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGMICR_Code" Text='<%#Eval("MICR_Code")%>' runat="server"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Bank Address" Visible="false">
                                                                <ItemTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtgvBankAddress" Text='<%#Eval("Bank_Address")%>' runat="server"
                                                                            ReadOnly="true" Style="border: none" CssClass="md-form-control form-control"></asp:TextBox>
                                                                        <asp:Label ID="lblgvContd" runat="server" Text="......." Visible="false"></asp:Label>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Default Account" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkDefaultAccount" Enabled="false" runat="server" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="10%" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Delete" meta:resourcekey="TemplateFieldResource1">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkbtnDelete" runat="server" Text="Delete" CssClass="grid_btn_delete"
                                                                        CommandName="Delete" AccessKey="B" ToolTip="Delete,Alt+B"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabConstitution" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Additional Parameter Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upConstitution" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <div id="div2" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12" border="1">
                                                <br />
                                                <asp:GridView ID="gvConstitutionalDocuments" runat="server" AutoGenerateColumns="False" Visible="false"
                                                    OnRowDataBound="gvConstitutionalDocuments_RowDataBound" class="gird_details">
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="ID" />
                                                        <asp:BoundField DataField="DocumentFlag" HeaderText="Document Flag"></asp:BoundField>
                                                        <asp:BoundField DataField="DocumentDescription" HeaderText="Document Description"></asp:BoundField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td colspan="2">Mandatory</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left">Doc</td>
                                                                        <td align="right">Image Copy</td>
                                                                    </tr>
                                                                </table>


                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <table>
                                                                    <tr>
                                                                        <td align="left"><%--<%# Bind("IsMandatory") %>--%>
                                                                            <asp:CheckBox ID="chkIsMandatory" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsMandatory")))%>'></asp:CheckBox></td>
                                                                        <td align="right"><%--<%# Bind("IsNeedImageCopy") %>--%>
                                                                            <asp:CheckBox ID="chkIsNeedImageCopy" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "IsNeedImageCopy")))%>'></asp:CheckBox></td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Remark" HeaderText="Remarks"></asp:BoundField>
                                                        <asp:TemplateField HeaderText="Collected">
                                                            <ItemTemplate>
                                                                <%--<%# Bind("Collected") %>--%>
                                                                <asp:CheckBox ID="chkCollected" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Collected")))%>'></asp:CheckBox>
                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Values">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtValues" ValidationGroup="Customer" runat="server" MaxLength="30" class="md-form-control form-control login_form_content_input requires_true"
                                                                    Text='<%# Bind("Values") %>'></asp:TextBox>

                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Scanned">
                                                            <ItemTemplate>
                                                                <%--<%# Bind("Scanned") %>--%>
                                                                <asp:CheckBox ID="chkScanned" AutoPostBack="true" OnCheckedChanged="chkScanned_CheckedChanged" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Scanned")))%>'></asp:CheckBox>
                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField HeaderText="File Upload" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txOD" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                                    Visible="false"></asp:TextBox><cc1:AsyncFileUpload ID="asyFileUpload" runat="server"
                                                                        Width="175px" OnClientUploadComplete="uploadComplete" OnUploadedComplete="asyncFileUpload_UploadedComplete" />
                                                                <asp:Label runat="server" ID="myThrobber" Visible="false" Text='<%# Bind("Document_Path") %>'></asp:Label><asp:HiddenField
                                                                    ID="hidThrobber" runat="server" />
                                                                <asp:TextBox ID="txthidden" runat="server" Width="100px" MaxLength="500" Text='<%# Bind("Document_Path") %>'
                                                                    Visible="false"></asp:TextBox><input id="bOD" onclick="return openFileDialog(this.id, 'bOD', 'fileOpenDocument', 'txOD', 'paper')"
                                                                        style="width: 17px; height: 22px" type="button" runat="server" title="Click to browse file"
                                                                        value="..." visible="False" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="File Upload">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblActualPath" runat="server" Visible="false" Text='<%# Bind("Document_Path") %>'></asp:Label>
                                                                <asp:UpdatePanel ID="tempUpdate" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>

                                                                        <asp:TextBox ID="txtFileupld" runat="server" ReadOnly="true" />
                                                                        <asp:Button ID="btnBrowse" runat="server" OnClick="btnBrowse_OnClick" Style="display: none" CssClass="cancel_btn fa fa-times"></asp:Button>
                                                                        <asp:FileUpload runat="server" ID="flUpload" ToolTip="Upload File" />


                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="btnBrowse" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="View">
                                                            <ItemTemplate>
                                                                <%--<%# Bind("IsNeedImageCopy") %>--%>
                                                                <%-- <asp:LinkButton ID="hlnkView" runat="server" OnClick="hlnkView_Click" Text="View"></asp:LinkButton>--%>
                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" Visible="false" />
                                                    </Columns>
                                                </asp:GridView>
                                                <br />
                                            </div>
                                            <div class="row" style="margin-top: 10px;">
                                            </div>
                                            <div class="gird col-lg-6 col-md-9 col-sm-12 col-xs-12">
                                                <asp:GridView ID="grvAdditionalInfo" runat="server" AutoGenerateColumns="False"
                                                    OnRowDataBound="grvAdditionalInfo_RowDataBound" class="gird_details">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Parameter Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblParamName" runat="server" Text='<%# Bind("Param_Name") %>'></asp:Label>
                                                                <asp:Label ID="lblParamType" runat="server" Text='<%# Bind("Param_Type") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblLookupType" runat="server" Text='<%# Bind("Lookup_Type") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblParamSize" runat="server" Text='<%# Bind("Param_Size") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Values">
                                                            <ItemTemplate>
                                                                <div class="md-input" style="margin: 0px;">
                                                                    <asp:TextBox ID="txtValues" runat="server" Visible="false" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("PARAM_VALUES") %>'></asp:TextBox>
                                                                    <asp:DropDownList ID="ddlValues" runat="server" Visible="false" class="md-form-control form-control"></asp:DropDownList>
                                                                    <asp:Label ID="lblParamValues" Text='<%#Eval("PARAM_VALUES")%>' runat="server" Visible="false"></asp:Label>
                                                                    <cc1:FilteredTextBoxExtender ID="fteValues" runat="server" FilterType="Custom"
                                                                        Enabled="True" TargetControlID="txtValues">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtValues"
                                                                        Format="dd/MM/YYYY" ID="calAddValues" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                </div>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PARAM_ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPARAM_ID" runat="server" Text='<%# Bind("PARAM_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PARAM_DET_ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPARAM_DET_ID" runat="server" Text='<%# Bind("PARAM_DET_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="CONSTANT_TRAN_ID" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCONSTANT_TRAN_ID" runat="server" Text='<%# Bind("CONSTANT_TRAN_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>

                <%--  <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="save_btn fa fa-floppy-o"
                            OnClientClick="return fnCheckPageValidators('Submit');" Text="Save" ValidationGroup="Submit" ToolTip="Save,Alt+S" AccessKey="S"
                            meta:resourcekey="btnSaveResource1" />
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="cancel_btn fa fa-times"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" ToolTip="Clear,Alt+L" AccessKey="L"
                            meta:resourcekey="btnClearResource1" />
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnCancel" runat="server" CssClass="cancel_btn fa fa-times" CausesValidation="False" ToolTip="Exit,Alt+X" AccessKey="X"
                            Text="Exit" OnClientClick="return fnConfirmExit();" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                    </div>
                </div>--%>

                <div class="btn_height"></div>
                <div align="right">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Submit'))" validationgroup="Submit"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>

                </div>
                <div class="row" style="display: none" class="col">


                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                </div>

                <div class="row" style="display: none;">
                    <div class="col-lg-6 col-md-9 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsEntityMaster" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ValidationGroup="Add2" meta:resourcekey="vsEntityMasterResource1" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ValidationGroup="Submit" meta:resourcekey="vsEntityMasterResource1" />
                        <asp:ValidationSummary ID="vsEntityMaster_bank" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ValidationGroup="Add" meta:resourcekey="vsEntityMaster_bankResource1" />
                        <asp:CustomValidator ID="cvEntity" runat="server" CssClass="styleMandatoryLabel"
                            Display="None" HeaderText="Correct the following validation(s): " />
                        <asp:CustomValidator ID="cvEntity_Add" runat="server" CssClass="styleMandatoryLabel"
                            Display="None" HeaderText="Correct the following validation(s): " />
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnID" runat="server" />
            <input type="hidden" id="hdnDefaultdate" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>



    <script language="javascript" type="text/javascript">

        var tab;


        //function jsMICRvaildate(txtMICRCode) {



        //    if (txtMICRCode.value.length > 0) {

        //        if (!isNaN(txtMICRCode.value)) {
        //            if (parseFloat(txtMICRCode.value) == "0") {
        //                alert('MICR Code cannot be zero');
        //                txtMICRCode.value = '';
        //                document.getElementById(txtMICRCode.id).focus();
        //                return;
        //            }
        //        }

        //        if (txtMICRCode.value.length < txtMICRCode.maxLength) {
        //            //--Added by Guna on 19th-Oct-2010 to address the bug 1790                
        //            alert('MICR Code should not be less than ' + txtMICRCode.maxLength + ' digits');
        //            ////alert('Please enter a valid MICR Code');
        //            //--Ends Here

        //            //alert("max" + txtMICRCode.maxLength+"valu len" + txtMICRCode.value.length);
        //            document.getElementById(txtMICRCode.id).focus();


        //        }

        //    }
        //}
        var index = 0;

        function funCheckFirstLetterisNumeric(textbox, msg) {

            var FieldValue = new Array();
            FieldValue = textbox.value.trim();
            if (FieldValue.length > 0 && FieldValue.value != '') {
                if (isNaN(FieldValue[0])) {
                    return true;
                }
                else {
                    alert(msg + ' name cannot begin with a number');
                    textbox.focus();
                    textbox.value = '';
                    event.returnValue = false;
                    return false;
                }
            }
        }
        //Added By Thangam M on 13/Feb/2012 to make the address lable as textbox
        function funSetColor(textbox, option) {
            //debugger;
            var txt = document.getElementById(textbox)
            if (option == 1) {
                txt.style.backgroundColor = 'yellow';
                txt.style.cursor = 'hand';
            }
            else {
                txt.style.backgroundColor = 'white';
                txt.style.textDecoration = 'none';
            }
        }

        function fnvalidEntityname(txtEntityName) {
            if (txtEntityName.value == "0") {
                alert('Entity Name should not be 0');
                document.getElementById(txtEntityName.id).focus();
            }

            if (txtEntityName.value.split('  ')[1] != null) {
                alert('Entity Name should not carry more than one space between two words');
                document.getElementById(txtEntityName.id).value = "";
                document.getElementById(txtEntityName.id).focus();
            }
        }

        //Tab index code starts

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {
            var TC = $find("<%=tcEntityMaster.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlEntityType.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcEntityMaster');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')

            function on_Change(sender, e) {

                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }
        }

        <%--   function NameChange(sender, e) {
            var txtFirstName = $get('<%= ucEntityNamesSetup.FirstName %>');
            var txtSecondName = $get('<%= ucEntityNamesSetup.SecondName%>');
            var txtThirdName = $get('<%= ucEntityNamesSetup.ThirdName %>');
            var txtFourthName = $get('<%= ucEntityNamesSetup.FourthName %>');
            var txtFifthName = $get('<%= ucEntityNamesSetup.FifthName %>');
            var txtSixthName = $get('<%= ucEntityNamesSetup.SixthName%>');
            var txtEntityName = $get('<%= txtEntityName.ClientID %>');
            txtCustomerName.value = txtFirstName.value + ' ' + txtSecondName.value + ' ' + txtThirdName.value + ' ' + txtFourthName.value + ' ' + txtFifthName.value + ' ' + txtSixthName.value;
        }--%>

        //function fnCheckPageValidation() {

        //    if ((!fnCheckPageValidators('Add', 'false'))) {
        //        if (Page_ClientValidate() == false) {
        //            Page_BlockSubmit = false;
        //            return false;
        //        }
        //    }
        //    if (Page_ClientValidate('Add')) {
        //        //Starting


        //        if (confirm('Do you want to Add?')) {
        //            return true;
        //        }
        //        else
        //            return false;
        //    }
        //    return true;
        //}




        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcEntityMaster');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
       <%--var Valgrp = document.getElementById('<%=vsCompanyAdd.ClientID %>')--%>
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')

            //btnSave.disabled=true;

            strValgrp = "Submit";
            //  Valgrp.validationGroup = strValgrp;

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {

                    switch (index) {

                        case 0:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 1:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                //index = tab.get_activeTabIndex(newindex);
                //Focus Start
                var TC = $find("<%=tcEntityMaster.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlEntityType.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=ddlAccountType.ClientID %>").focus();
                }

                //Focus End
            }
        }
        //Tab index code end

        function fnTrashSuggest(e) {
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

        //function fnConfirmModify() {

        //    if (confirm('Do you want to modify?')) {
        //        return true;
        //    }
        //    else
        //        return false;

        //}

    </script>

    <style type="text/css">
        .wraptext {
            word-wrap: break-word;
        }
    </style>
</asp:Content>
