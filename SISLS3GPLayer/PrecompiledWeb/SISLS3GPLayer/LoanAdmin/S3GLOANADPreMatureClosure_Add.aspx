<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLOANADPreMatureClosure_Add, App_Web_fteskag1" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx" TagName="CustomerDetails"
    TagPrefix="CD" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Enquiry Appraisal" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcEnquiryAppraisal" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                Width="100%" TabStripPlacement="top">
                                <cc1:TabPanel runat="server" HeaderText="General"
                                    ID="tbgeneral" CssClass="tabpan"
                                    BackColor="Red">
                                    <HeaderTemplate>
                                        Pre Mature Closure
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvLineOfBusiness" runat="server" Display="Dynamic"
                                                            ControlToValidate="ddlLOB" ValidationGroup="Pre Mature Closure" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlBranch" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                        runat="server" class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" ValidationGroup="Pre Mature Closure"
                                                            ErrorMessage="Select a Branch" CssClass="validation_msg_box_sapn" Display="Dynamic"
                                                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblBranch" Text="Location " CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPMCReqDate" runat="server" onchange="" autocomplete="off"
                                                        AutoPostBack="true" OnTextChanged="txtPMCReqDate_TextChanged" Enabled="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtPMCReqDate"
                                                        PopupButtonID="Image1" ID="CalendarExtender2" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvAccClosureDate" runat="server" Display="Dynamic"
                                                            ControlToValidate="txtPMCReqDate" ValidationGroup="Pre Mature Closure" ErrorMessage="Enter the Settlement Date"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Settlement Date" ID="lblAccountClosureDate"
                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtValidityDate" runat="server" ReadOnly="true"
                                                        autocomplete="off" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender runat="server" Format="dd-MM-yyyy" TargetControlID="txtValidityDate"
                                                        PopupButtonID="Image2" ID="CalendarExtender1" Enabled="True">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtValidityDate" runat="server" Display="Dynamic"
                                                            ControlToValidate="txtValidityDate" ValidationGroup="Pre Mature Closure" ErrorMessage="Enter the Validity Till Date"
                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Validity Till Date" ID="lblValidityDate"
                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:CheckBox ID="chkIgnoreLastCheques" runat="server" Enabled="false" onclick="fnIncludeLastCheque(this)"></asp:CheckBox>
                                                    <asp:Label ID="lblIgnoreLastCheqs" runat="server" Text="Ignore Last Cheques" CssClass="styleDisplayLabel"></asp:Label>

                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                        Style="display: none;" MaxLength="100"></asp:TextBox>
                                                    <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                        strLOV_Code="ACC_PMC" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                                    <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                        Style="display: none" />

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                            ValidationGroup="Pre Mature Closure" SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <%-- <uc2:Suggest ID="ddlMLA" runat="server" ServiceMethod="GetPANUM" AutoPostBack="true"
                                        OnItem_Selected="ddlMLA_SelectedIndexChanged" IsMandatory="true" ErrorMessage="Enter a Account Number" />--%>

                                                    <%-- <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch"
                            ErrorMessage="Select a Location" CssClass="styleMandatoryLabel" Display="None"
                            InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>

                                                    <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                    <asp:HiddenField ID="hdnTabChange" runat="server" />
                                                    <asp:HiddenField ID="hdnSaveSuccess" Value="1" runat="server" />
                                                     <asp:HiddenField ID="hdnAccountStatus" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPAN" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                                    <uc4:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" DispalyContent="Both" Enabled="false"
                                                        strLOV_Code="" ServiceMethod="GetDummyList" class="md-form-control form-control" />
                                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false"
                                                        Style="display: none" />
                                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <%--<div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer"
                                            ValidationGroup="Pre Mature Closure" SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>--%>
                                                    <label>
                                                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtnoticePeriod" Style="text-align: right" runat="server" MaxLength="3" Text="0" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtnoticePeriod" runat="server" TargetControlID="txtnoticePeriod"
                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvtxtnoticePeriod" runat="server" ErrorMessage="Enter Notice Period in Months" ControlToValidate="txtnoticePeriod"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Pre Mature Closure"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblNoticePeriod" runat="server" Text="Notice Period in Months" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlSLA" runat="server" Visible="false" AutoPostBack="True"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvSLA" Enabled="False" runat="server" ControlToValidate="ddlSLA" ErrorMessage="Select SLA"
                                                            CssClass="styleMandatoryLabel" Display="None" ValidationGroup="Pre Mature Closure" InitialValue="0"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblSLA" runat="server" Visible="false" Text="Sub Account Number" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlReason" runat="server"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlReason" runat="server" Display="Dynamic"
                                                            ControlToValidate="ddlReason" ErrorMessage="Select Reason for Pre Closure" ValidationGroup="Pre Mature Closure" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReason" runat="server" Text="Reason for Pre Closure" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:CheckBox ID="chkBoxWriteOff" AutoPostBack="true" Enabled="false" OnCheckedChanged="chkBoxWriteOff_CheckedChanged" runat="server"></asp:CheckBox>
                                                    <asp:Label ID="lblWriteOff" runat="server" Text="Write Off" CssClass="styleDisplayLabel"></asp:Label>

                                                </div>
                                            </div>
                                            <div id="divddlWriteOff" runat="server" visible="false" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlWriteOff" runat="server"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlWriteOff" runat="server" Display="Dynamic"
                                                            ControlToValidate="ddlWriteOff" ErrorMessage="Select Reason for Write off" ValidationGroup="Pre Mature Closure" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReasonWriteoff" runat="server" Text="Reason for Write off" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDiscountRate" ReadOnly="true" Style="text-align: right" onchange="funCheckRange();" runat="server" MaxLength="6"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftxtFinanceAmount" runat="server" TargetControlID="txtDiscountRate"
                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvDiscountRate" Enabled="false" ErrorMessage="Enter Discount Rate" runat="server" ControlToValidate="txtDiscountRate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Pre Mature Closure"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDiscountRate" runat="server" Text="Discount Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDrawingPower" runat="server" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDrawingPower" runat="server" Text="Drawing Power" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div id="divFunds" runat="server" visible="false" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFundsInUse" runat="server" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true">
                                                    </asp:TextBox>
                                                    <%--<div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtFundsInUse" Enabled="false" runat="server" ErrorMessage="Enter Funds in Use" ControlToValidate="txtFundsInUse"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Pre Mature Closure"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFundsInUse" runat="server" Text="Funds In Use" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtStatus" runat="server" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblStatus" Text="Status" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAccClosureNo" runat="server" Enabled="false"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:HiddenField ID="hidAccClosureNo" runat="server"></asp:HiddenField>
                                                    <asp:HiddenField ID="hidClosureDetailId" runat="server" Value="0"></asp:HiddenField>
                                                    <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" Text="Settlement Ref. No." ID="lblAccountClosureNo" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvprint" visible="true">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlTemplateType" Enabled="true" runat="server" ToolTip="Template Type" OnSelectedIndexChanged="ddlTemplateType_SelectedIndexChanged" AutoPostBack="true"
                                                        class="md-form-control form-control">
                                                        <asp:ListItem Text="-- Select --" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="PMC SETTLEMENT WORKSHEET" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="FORE CLOSURE REPORT" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblTemplateType" runat="server" CssClass="styleReqFieldLabel" Text="Template Type"
                                                            ToolTip="Template Type"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="dvprintLanguage" runat="server" visible="true">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlLanguage" AutoPostBack="false" runat="server" ToolTip="Language" class="md-form-control form-control  requires_false">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" CssClass="styleReqFieldLabel" Text="Language"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbAccDetails" CssClass="tabpan"
                                    BackColor="Red">
                                    <HeaderTemplate>
                                        Account Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row" runat="server" id="dvLeasing">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPrincipal" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPrincipal" runat="server" Text="Total Principal" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtIRR" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAccIRR" runat="server" Text="Accounting IRR" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFinanceCharge" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFinanceCharge" runat="server" Text="Total Finance Charge" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCompanyIRR" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCompanyIRR" runat="server" Text="Company IRR" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMatureDate" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMatureDate" runat="server" Text="Maturity Date" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBusinessIRR" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblBusinessIRR" runat="server" Text="Business IRR" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtTenure" runat="server" ReadOnly="True" Style="text-align: left;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblTenure" runat="server" Text="Tenure" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFlatRate" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFlatRate" runat="server" Text="Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="TxtAccStatus" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="LblAccStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMode" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMode" runat="server" Text="Repayment Mode" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAccDate" Visible="false" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAccDate" runat="server" Visible="false" Text="Account Date"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDebitRate" Style="text-align: right" ReadOnly="true" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDebitRate" runat="server" Text="ODI Debit Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtCreditRate" Style="text-align: right" ReadOnly="true" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblCreditRate" runat="server" Text="ODI Credit Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDelayDays" Style="text-align: right" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDelayDays" runat="server" Text="Delay Days" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtEarlyDays" Style="text-align: right" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblEarlyDays" runat="server" Text="Early Days" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlODIBasis" runat="server" AutoPostBack="True"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlODIBasis" runat="server" ControlToValidate="ddlODIBasis"
                                                            ValidationGroup="Pre Mature Closure" InitialValue="0" SetFocusOnError="True" ErrorMessage="Select ODI Basis"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="Label1" runat="server" Text="ODI Basis" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" id="dvFactoring" runat="server">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDebtPurchaseLimit" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDebtPurchaseLimit" runat="server" Text="Debt Purchase Limit" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMargin" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMargin" runat="server" Text="Margin" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPrepaymentLimit" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPrepaymentLimit" runat="server" Text="Prepayment Limit" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFundInUse" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFundInUse" runat="server" Text="Funds in Use" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFacilityEndDate" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFacilityEndDate" runat="server" Text="Facility End Date" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFundsAvailable" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFundsAvailable" runat="server" Text="Funds Available" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFacODIRate" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblODIRate" runat="server" Text="ODI Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFacDiscountRate" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFacDiscountRate" runat="server" Text="Discount Rate for Utilization" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFacStatus" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFacStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlFacODIBasis" runat="server"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvddlFacODIBasis" runat="server" ControlToValidate="ddlFacODIBasis"
                                                            ValidationGroup="Pre Mature Closure" InitialValue="0" SetFocusOnError="True" ErrorMessage="Select ODI Basis"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="Label7" runat="server" Text="ODI Basis" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFacForeClosureRate" runat="server" ReadOnly="True" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFacForeClosureRate" runat="server" Text="Fore Closure Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" id="dvAssetdtls" runat="server">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="Panel7" CssClass="stylePanel" GroupingText="Asset Details">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <div id="div3" style="overflow: auto; width: 100%;" runat="server">
                                                                    <asp:GridView ID="grvAsset" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="False" Width="100%">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sl.No.">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSlNo" Visible="true" runat="server" Text='<%#Container.DataItemIndex+1 %> '
                                                                                        Style="text-align: center;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAssetID" Visible="false" runat="server" Text='<%#Eval("Asset_ID")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:BoundField HeaderText="Asset Description" DataField="ASSET_DESCription" ItemStyle-HorizontalAlign="Left" />
                                                                            <asp:TemplateField HeaderText="Registration No">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblRegNo" MaxLength="20" Text='<%#Eval("REGN_NUMBER")%>' runat="server"
                                                                                        Style="text-align: left;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <RowStyle HorizontalAlign="Center" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Account Balance">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <div id="div1" style="overflow: auto; height: 200px; width: 100%" runat="server">
                                                                    <asp:GridView ID="grvAccountBalance" runat="server" ShowFooter="True" AutoGenerateColumns="False" Width="100%">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Account Description">
                                                                                <FooterTemplate>
                                                                                    <span>Total</span>
                                                                                </FooterTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDesc" MaxLength="20" Text='<%#Eval("Desc")%>' runat="server" Style="text-align: left;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Due">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDue" MaxLength="20" Text='<%#Eval("Due1")%>' runat="server" Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Received">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblReceived" MaxLength="20" Text='<%#Eval("Received1")%>' runat="server"
                                                                                        Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Outstanding">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblOutstanding" MaxLength="20" Text='<%#Eval("Outstanding1")%>' runat="server"
                                                                                        Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <RowStyle HorizontalAlign="Center" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbCashFlow" CssClass="tabpan"
                                    BackColor="Red" Enabled="false">
                                    <HeaderTemplate>
                                        Cash Flow Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPreAmount" runat="server" ReadOnly="True" Text="0" Style="text-align: right;"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvPreAmount" runat="server" ControlToValidate="txtPreAmount" Enabled="false"
                                                            ErrorMessage="Enter Preclosure Amount"
                                                            ValidationGroup="Pre Mature Closure" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPreAmount" runat="server" Text="Preclosure Amount" CssClass="styleDisplayLabel"></asp:Label><span
                                                            class="styleMandatory"> *</span>
                                                        <asp:HiddenField ID="HidPMCStatus" Value="Request" runat="server" />
                                                        <asp:HiddenField ID="HidPMC_Receipt_Amount" Value="0" runat="server" />
                                                        <asp:HiddenField ID="hdnQueryMode" runat="server" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtClosureBy" runat="server" ReadOnly="True"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblClosureBy" runat="server" Text="Preclosure Done By" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlPreType" runat="server" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlPreType_SelectedIndexChanged"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvPreType" runat="server" ControlToValidate="ddlPreType"
                                                            ValidationGroup="Pre Mature Closure" InitialValue="0" SetFocusOnError="True"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPreType" runat="server" Text="Closure Method" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPreRate" runat="server" MaxLength="7" ToolTip="Preclosure Rate"
                                                        AutoPostBack="True" Style="text-align: right;" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                        OnTextChanged="txtPreRate_TextChanged"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvPreRate" runat="server" Display="Dynamic"
                                                            ControlToValidate="txtPreRate" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPreRate" runat="server" Text="Preclosure Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtPreclosureDate" runat="server" ReadOnly="True" autocomplete="off"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:HiddenField ID="hdnIRR" runat="server" Value="0" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblPreCashDate" runat="server" Text="Preclosure Date" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="Panel2" CssClass="stylePanel" GroupingText="Cash Flow Details"
                                                    Width="90%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <div id="div2" style="overflow-x: hidden; overflow-y: scroll; width: 100%;"
                                                                    runat="server">
                                                                    <asp:GridView ID="grvCashFlow" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvCashFlow_RowDataBound"
                                                                        ShowFooter="True">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Cash flow description">
                                                                                <FooterTemplate>
                                                                                    <span>Total</span>
                                                                                </FooterTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCash" MaxLength="20" Text='<%#Eval("Description")%>' runat="server"
                                                                                        Style="text-align: left;"></asp:Label>
                                                                                    <asp:HiddenField ID="hdnCashFlowID" Value='<%#Eval("ID")%>' runat="server" />
                                                                                    <%--<asp:HiddenField ID="hdnClosureID" Value='<%#Eval("Closure_Details_ID")%>' runat="server" />--%>
                                                                                </ItemTemplate>
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Due Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblDue" MaxLength="20" Text='<%#Eval("Due1")%>' runat="server" Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Waived Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtWaived" MaxLength="10" Width="100px" class="md-form-control form-control login_form_content_input lowercase" OnTextChanged="txtWaived_TextChanged"
                                                                                        AutoPostBack="true" Style="text-align: right; border-color: White;" onkeypress="fnAllowNumbersOnly(true,false,this);"
                                                                                        Text='<%#Eval("Waived1")%>' runat="server"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtWaived" runat="server" FilterType="Numbers, Custom" ValidChars="."
                                                                                        TargetControlID="txtWaived">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Payable Amount" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblPayable" MaxLength="20" Text='<%#Eval("Payable1")%>' runat="server"
                                                                                        Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Account Closure Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblClosure" MaxLength="20" Text='<%#Eval("Closure1")%>' runat="server"
                                                                                        Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Received Amount" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblReceived" MaxLength="20" Text='<%#Eval("Received1")%>' runat="server"
                                                                                        Style="text-align: right;"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Workings" ItemStyle-VerticalAlign="Middle">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="btnViewWorkings" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                                        runat="server" AccessKey="D" OnClick="btnViewWorkings_OnClick" ToolTip='<%#Eval("Description")%>' />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Remarks">
                                                                                <ItemTemplate>
                                                                                    <asp:TextBox ID="txtRemarks" MaxLength="100" TextMode="MultiLine" Wrap="true" onkeyup="maxlengthfortxt(100);"
                                                                                        Rows="2" Columns="25" Text='<%#Eval("Remarks")%>' runat="server" Style="text-align: left; border-color: White;"
                                                                                        AutoPostBack="True" OnTextChanged="txtRemarks_TextChanged"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="fRemarks" runat="server" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers"
                                                                                        TargetControlID="txtRemarks" ValidChars=" ">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <RowStyle HorizontalAlign="Center" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Receipt Details" Visible="false" ID="tbReceipt"
                                    CssClass="tabpan" Enabled="false" BackColor="Red">
                                    <HeaderTemplate>
                                        Receipt Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtReceiptNo" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReceiptNo" runat="server" Text="Receipt No" CssClass="styleDisplayLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtReceiptDate" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReceiptDate" runat="server" Text="Receipt Date" CssClass="styleDisplayLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtChequeNumber" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblChequeNumber" runat="server" Text="Cheque Number" CssClass="styleDisplayLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDraweeBank" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblDraweeBank" runat="server" Text="Drawee Bank" CssClass="styleDisplayLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtReceiptAmount" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReceiptAmount" runat="server" Text="Receipt Amount" CssClass="styleDisplayLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtReceiptAmountWords" Rows="2" Columns="75" runat="server" ReadOnly="true"
                                                        TextMode="MultiLine"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblReceiptAmountWords" runat="server" Text="Receipt Amount in words"
                                                            CssClass="styleDisplayLabel">
                                                        </asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbAmortDet" CssClass="tabpan"
                                    BackColor="Red" Enabled="true">
                                    <HeaderTemplate>
                                        Amort Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="Panel3" CssClass="stylePanel" GroupingText="Amort Details">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <div id="div4" style="overflow: auto; width: 100%;" runat="server">
                                                                    <asp:GridView ID="grvAmortDet" runat="server" HeaderStyle-CssClass="styleGridHeader"
                                                                        RowStyle-HorizontalAlign="left" AutoGenerateColumns="False" Width="100%">
                                                                        <Columns>
                                                                            <asp:BoundField HeaderText="Instl.No." DataField="INSTALLMENT_NO" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Instl. Date" DataField="INSTALLMENTDATE" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Instl. Amount" DataField="INSTALLMENTAMOUNT" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Principal" DataField="PRINCIPALAMOUNT" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Income" DataField="FINANCECHARGES" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Insurance" DataField="INSURANCEAMOUNT" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Un-matured Income" DataField="UMFC" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField HeaderText="Principal. o/s" DataField="Principal_Out" ItemStyle-HorizontalAlign="right" />
                                                                            <asp:BoundField DataField="EMI" HeaderText="EMI" ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:BoundField DataField="INSURANCE_AMT" HeaderText="LIP Customer" ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:BoundField DataField="INSURANCE_PAYABLE" HeaderText="LIP Company" ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:BoundField HeaderText="Installment Status" DataField="Installment_Status" ItemStyle-HorizontalAlign="Left" />
                                                                            <asp:BoundField HeaderText="Voucher No" DataField="RECEIPT_NO" ItemStyle-HorizontalAlign="Left" />
                                                                            <asp:BoundField HeaderText="Receipt Mode" DataField="PAYMENT_MODE" ItemStyle-HorizontalAlign="Left" />
                                                                        </Columns>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <RowStyle HorizontalAlign="Center" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server" visible="false"
                            type="button" accesskey="O" causesvalidation="false" title="Go[Alt+O]" validationgroup="Pre Mature Closure"
                            onclick="if(fnCheckPageValidators('Pre Mature Closure',false))">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;G<u>o</u>
                        </button>

                        <button class="css_btn_enabled" id="btnSave" disabled="false" onclick="if(fnCheckPageValidators('Pre Mature Closure'))"
                            onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>

                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>

                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                            type="button" accesskey="X" title="Exit[Alt+X]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>

                        <i class="fa fa-envelope btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                        <button class="css_btn_enabled" id="btnEmail" onserverclick="btnEmail_Click" causesvalidation="false" runat="server"
                            type="button" accesskey="M" title="Email[Alt+M]" visible="false">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;E<u>m</u>ail
                        </button>

                        <i class="fa fa-file-pdf-o btn_i" aria-hidden="true" style="top: 26px !important;"></i>
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" causesvalidation="false" runat="server"
                            type="button" accesskey="P" title="Print[Alt+P]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                        <div style="display: none" class="row">
                            <div class="col">
                                <iframe id="MyIframeOpenFile" visible="false" src="~/Common/S3GViewFileKYC.aspx" runat="server" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100px; height: 21px;" allowtransparency="true"></iframe>
                            </div>
                        </div>
                        <button class="css_btn_enabled" id="btnClosure" onserverclick="btnClosure_Click"
                            causesvalidation="false" runat="server" onclick="if(fnConfirmClosureCancel())"
                            type="button" accesskey="N" title="Closure Cancellation[Alt+N]">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>losure Cancellation
                        </button>
                        <asp:Button runat="server" ID="btnPMC" Text="Print" CausesValidation="false" CssClass="styleSubmitButton"
                            OnClick="btnPMC_Click" Style="display: none;" />
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="false" ValidationGroup="Pre Mature Closure" />
                            <asp:CustomValidator ID="cvAccountPreClosure" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%">
                            </asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:HiddenField ID="hdnClosureNo" runat="server" />
                            <asp:Button ID="Button1" runat="server" Text="Closure Cancellation" CausesValidation="false"
                                OnClick="Button1_Click" Style="display: none;" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="btnPMC" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:Label ID="lblCommonPopup" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeCommonPopup" runat="server" PopupControlID="dvCommonPopup" TargetControlID="lblCommonPopup"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvCommonPopup" style="display: none; width: 80%; height: 40%; position: absolute; margin-top: -110px;">
        <div id="Div5" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
            <asp:ImageButton ID="imgCommonPopup" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imgCommonPopup_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlAccountDetails" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div>
                            <asp:Panel ID="pnlODICalc" GroupingText="Overdue Interest Calculation" CssClass="stylePanel" runat="server" Visible="false">
                                <div id="divODICalc" runat="server" style="height: 350px;">
                                    <asp:GridView ID="gvODICalc" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Installment No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentNo" Text='<%#Eval("INSTALLMENT_NO")%>' Width="80px" ToolTip="Installment No" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentDate" Text='<%#Eval("INSTALLMENTDATE")%>' Width="80px" ToolTip="Installment Date" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentAmount" Text='<%#Eval("INSTALLMENTAMOUNT")%>' Width="80px" ToolTip="Installment Amount" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Paid Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaidDate" Text='<%#Eval("PAID_DATE")%>' Width="80px" runat="server" ToolTip="Paid Date"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Paid Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaidAmount" Text='<%#Eval("PAID_AMOUNT")%>' Width="80px" runat="server" ToolTip="Paid Amount"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gap Days">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGapDays" Text='<%#Eval("GAP_DAYS")%>' Width="80px" runat="server" ToolTip="Gap Days"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="ODI Chargeable Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblODIChargeableAmt" Text='<%#Eval("ODI_CHARGBLE_AMOUNT")%>' Width="80px" ToolTip="ODI Chargeable Amount" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ODI Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblODIAmount" Text='<%#Eval("ODI_AMOUNT")%>' Width="80px" runat="server" ToolTip="ODI Amount"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ODI Interest Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblODIInterestRate" Text='<%#Eval("ODI_INTEREST_RATE")%>' Width="80px" runat="server" ToolTip="ODI Interest Rate"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAFCRecived" runat="server" ToolTip="Additional Finance Charges Received" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="AFC Received" ID="lblAFCReceived"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAFCWaiver" ToolTip="Additional Finance Charges Waiver" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="AFC Waiver" ID="lblAFCWaiver"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAFCBalanceDue" ToolTip="Additional Finance Charges Balance Due" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="AFC Balance Due" ID="lblAFCBalanceDue"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlFutPrin" GroupingText="Future Principal" CssClass="stylePanel" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLastBillInstallment" runat="server" ToolTip="Last Bill Installment" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Last Bill Installment" ID="lblLastBillInstallment"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtUnBilledInstallment" ToolTip="Unbilled Installment" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Unbilled Installment" ID="lblUnBilledInstallment"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTotalFuturePrinciple" ToolTip="Total Future Principle" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Total Principle" ID="lblTotalFuturePrinciple"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlBrokenPeriodInte" GroupingText="Broken Period Interest" CssClass="stylePanel" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBroFC" runat="server" ToolTip="Finance Charges" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Finance Charges" ID="lblBroFC"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBroTotalDays" ToolTip="Unbilled Installment" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Total Days" ID="lblBroTotalDays"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBroIntDays" ToolTip="Broken interest Days" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Broken interest Days" ID="lblBroIntDays"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtBroFormula" ToolTip="Formula" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Formula" ID="lblBroFormula"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlLIPPenality" GroupingText="LIP Penalty" CssClass="stylePanel" runat="server" Visible="false">
                                <div id="div6" runat="server" style="height: 350px;">
                                    <asp:GridView ID="grvLIPPenality" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Installment No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentNo" Text='<%#Eval("INSTALMENT_NO")%>' Width="80px" ToolTip="Installment No" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentDate" Text='<%#Eval("INSTALMENT_DATE")%>' Width="80px" ToolTip="Installment Date" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LIP Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallmentAmount" Text='<%#Eval("INSTALMENT_AMOUNT")%>' Width="80px" ToolTip="LIP Amount" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtTotalLipAmount" runat="server" ToolTip="Additional Finance Charges Received" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Total LIP Amount" ID="Label2"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtPrinciple_Rate" ToolTip="Principle Rate" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Principle Rate" ID="lblPrinciple_Rate"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtLIPPenaltyFormula" ToolTip="Formula" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="LIP Penalty" ID="lipLIP_Penalty"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlFutureInsurance" GroupingText="Life Insurance Company" CssClass="stylePanel" runat="server" Visible="false">
                                <div id="div7" runat="server" style="height: 350px;">
                                    <asp:GridView ID="grvFutureInsurance" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Installment No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFutureInstallmentNo" Text='<%#Eval("INSTALMENT_NO")%>' Width="80px" ToolTip="Installment No" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFutureInstallmentDate" Text='<%#Eval("INSTALMENT_DATE")%>' Width="80px" ToolTip="Installment Date" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Insurance Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFutureINSURANCEAMOUNT" Text='<%#Eval("INSURANCEAMOUNT")%>' Width="80px" ToolTip="Insurance Amount" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtTotalInsurance" runat="server" ToolTip="Additional Finance Charges Received" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Total Future Insurance Amount" ID="Label3"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlInstallmentDetails" GroupingText="Installment Details" CssClass="stylePanel" runat="server" Visible="false">
                                <div id="div8" runat="server" style="height: 350px;">
                                    <asp:GridView ID="grvInstallmentDetails" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField HeaderText="Document Reference" DataField="DOCUMENT_NUMBER" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Document Date" DataField="DOCUMENT_DATE" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField HeaderText="Transaction Type" DataField="Tran_Type" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Description" DataField="Description" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Amount" DataField="Amount" ItemStyle-HorizontalAlign="Right" />
                                        </Columns>
                                    </asp:GridView>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtInstallmentDue" runat="server" ToolTip="Installment Due" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Installment Due" ID="lblccInstallmentDue"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtInstallmentCredit" ToolTip="Installment Credit" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Installment Credit" ID="lblccInstallmentcredit"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtTotalInstallmentDue" ToolTip="Total Due" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Total Due" ID="lbltotInstallmentDue"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel ID="pnlCRCCharges" GroupingText="Cheque Return Charges" CssClass="stylePanel" runat="server" Visible="false">
                                <div id="div9" runat="server" style="height: 350px;">
                                    <asp:GridView ID="grvCRC" runat="server" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                        RowStyle-HorizontalAlign="Center" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField HeaderText="Document Reference" DataField="DOCUMENT_NUMBER" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Document Date" DataField="DOCUMENT_DATE" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField HeaderText="Transaction Type" DataField="Tran_Type" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Amount" DataField="Amount" ItemStyle-HorizontalAlign="Right" />
                                        </Columns>
                                    </asp:GridView>
                                    <div class="row">
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCRCDueAmount" runat="server" ToolTip="Due Amount" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Due Amount" ID="Label4"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCRCReceivedAmount" ToolTip="Received Amount" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Received Amount" ID="Label5"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCRCOverallDue" ToolTip="CRC Balance Due" runat="server" class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="CRC Balance Due" ID="Label6"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>

    <script language="javascript" type="text/javascript">

        function fnLoadAccount() {
            //debugger;
            document.getElementById('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal_tbgeneral_btnLoadAccount').click();

        }
        function fnLoadVendor() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadVendor').click();
        }
        function pageLoad() {
            //if (document.getElementById('divMenu').style.display == 'none') {
            //    (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            //}
            //else {
            //    (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - 280;
            //}
        }

        // Not Used
        function setRight() {
            var divx = document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid');
            divx.scrollTop = divx.scrollHeight;
        }

        function pageLoad() {

            tab = $find('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal');
            var querymode = location.search.split("qsMode=");
            var queryupload = location.search.split("AsyncFileUploadID=");
            if (querymode.length > 1) {
                if (querymode[1].length > 1) {
                    querymode = querymode[1].split("&");
                    querymode = querymode[0];
                }
                else {
                    querymode = querymode[1];
                }
                if (querymode != 'Q' && tab != null) {
                    tab.add_activeTabChanged(on_Change);
                    var newindex = tab.get_activeTabIndex(index);
                    var btnSave = document.getElementById('<%=btnSave.ClientID %>');
                    //var hdnSaveSucc = document.getElementById('<%=hdnSaveSuccess.ClientID %>');

                    var hdnSaveSucc = document.getElementById('<%=hdnSaveSuccess.ClientID %>');
                    //alert(newindex);
                    if (newindex == 2) {

                        btnSave.disabled = false;
                        btnSave.className = "css_btn_enabled";

                    }
                    else {
                        btnSave.disabled = true;
                        btnSave.className = "css_btn_disabled";
                    }
                }
            }

        }

        var index = 0;
        function on_Change(sender, e) {
            fnMoveNextTab('Tab');
        }

        function fnIncludeLastCheque(chkLastCheque) {

            document.getElementById('<%=hdnTabChange.ClientID %>').value = "1";

        }

        function fnMoveNextTab(Source_Invoker) {
            //alert('Debug--fnMoveNextTab-1');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var Valgrp = document.getElementById('<%=vsUTPA.ClientID %>')
            Valgrp.validationGroup = strValgrp;
            var newindex = tab.get_activeTabIndex(index);
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            var newindex = tab.get_activeTabIndex(index);
            //var btnGo = document.getElementById('<%=btnGo.ClientID %>');
            var hdnQueryModeVal = document.getElementById('<%=hdnQueryMode.ClientID %>').value;

            if (hdnQueryModeVal == "Q" || hdnQueryModeVal == "M") {
                btnSave.disabled = true;
                btnSave.className = "css_btn_disabled";

                btnGo.disabled = true;
                btnGo.className = "css_btn_disabled";
                return;
            }

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
                    //alert('Debug--fnMoveNextTab-5');
                    return;
                }

                //if (document.getElementById('<%=hdnTabChange.ClientID %>').value == "1")

                //{
                //    tab.set_activeTabIndex(index);
                //    alert('Click GO Button');
                //    return;
                //}
                //else {
                //    tab.get_activeTabIndex(newindex);
                //}

                tab.get_activeTabIndex(newindex);
            }

            //if (newindex == 0)
            // {
            //     btnGo.disabled = false;
            //     btnGo.className = "css_btn_enabled";
            // }
            // else
            // {
            //     btnGo.disabled = true;
            //     btnGo.className = "css_btn_disabled";
            // }

            if (hdnQueryModeVal != "Q") {
                btnSave.disabled = false;
                btnSave.className = "css_btn_enabled";
            }
            else {
                btnSave.disabled = true;
                btnSave.className = "css_btn_disabled";
            }
        }

        function showMenu(show) {
            if (show == 'T') {

                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "800px";
                    document.getElementById('divGrid1').style.overflow = "scroll";
                }

                document.getElementById('divMenu').style.display = 'Block';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - 280;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                (document.getElementById('ctl00_ContentPlaceHolder1_divAstGrid')).style.width = screen.width - document.getElementById('divMenu').style.width - 50;
            }
        }

        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }

        function FunCheckForZero(input, strName) {


            // debugger        
            var Score = document.getElementById(input).value;
            if (Score != '') {
                if (!isNaN(Score)) {
                    if (Score == 0) {
                        alert(strName + 'cannot be Zero');
                        document.getElementById(input).value = '';
                        document.getElementById(input).focus();
                    }
                }
                //            else
                //            {
                //                var IsSlashContains=true;
                //                while(IsSlashContains)
                //                {
                //                  if(Score.indexOf('/') == -1 && Score.indexOf('-') == -1)
                //                  {  
                //                    IsSlashContains = false;
                //                  }
                //                  else
                //                  {
                //                    Score = Score.replace('/','');
                //                    Score = Score.replace('-','');
                //                  }
                //                }               
                //                
                //                if(Score.trim() == '' || Score.trim() == 0)
                //                {
                //                    alert(strName + 'is not valid');
                //                    document.getElementById(input).value = '';
                //                    document.getElementById(input).focus();
                //                }                
                //            }
            }
        }

        function fnTrashCustomerSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            } s
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";


                }
            }
        }

        function fnTrashAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
                }
            }
        }


        function fnConfirmClosureCancel() {
            if (confirm('Do you want to cancel this record?'))
                return true;
            else
                return false;
        }


        function funCheckRange() {

            if (document.getElementById("<%= txtDiscountRate.ClientID %>").value != "") {
                if (parseFloat(document.getElementById("<%= txtDiscountRate.ClientID %>").value) > 100) {
                    alert('Discount Rate should not exeed 100');
                    document.getElementById("<%= txtDiscountRate.ClientID %>").value = "";
                }
            }
        }


        function checkDate_ApprovalDate() {

            document.getElementById('<%=hdnTabChange.ClientID %>').value = "1";
            //alert(document.getElementById('<%=hdnTabChange.ClientID %>').value);
            //document.getElementById('ctl00_ContentPlaceHolder1_tcEnquiryAppraisal_tbgeneral_txtAccountNoDummy').value = "";
            //tab.set_activeTabIndex(1);


        }

        <%--        function fnTrashVendorSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtVendorCodeDummy.ClientID %>').value = "";
                }
            }
        }--%>
    </script>

</asp:Content>


