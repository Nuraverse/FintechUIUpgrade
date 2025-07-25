<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3G_LOANAD_BulkPrint, App_Web_kvnfu4pv" enableeventvalidation="false" %>

<%@ Register TagPrefix="uc3" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
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
                            <asp:Panel GroupingText="Document Type" ID="pnlDocumentType" runat="server" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddldocumentType" runat="server" AutoPostBack="true" ToolTip="Document Type"
                                                OnSelectedIndexChanged="ddldocumentType_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvDocumentType" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddldocumentType" SetFocusOnError="true"
                                                    ErrorMessage="Select Document Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDocumentType" runat="server" Text="Document Type" ToolTip="Document Type" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlLOB" SetFocusOnError="true"
                                                    ErrorMessage="Select Line of Business" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel" ToolTip="Line of Business"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Check List Search Details" ID="pnlPOSearch" runat="server" CssClass="stylePanel" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPO_From_Date" runat="server" ToolTip="From Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgPOFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderPOFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgPOFromDate" TargetControlID="txtPO_From_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPO_From_Date" CssClass="styleDisplayLabel" Text="From Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvToDate" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPO_To_Date" runat="server" ToolTip="To Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgPOToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderPOToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgPOToDate" TargetControlID="txtPO_To_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPO_To_Date" CssClass="styleDisplayLabel" Text="To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="dvcustomerName">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="50"></asp:TextBox>
                                            <uc4:ICM ID="ddlPOCustomerName" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both" OnItem_Selected="ucCustomerCodeLov_Item_Selected"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" class="md-form-control form-control" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Submit"
                                                    SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvrfvtxtCustomerNameDummy1" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Add"
                                                    SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblPOCustomerName" runat="server" Text="Customer Name/Code" ToolTip="Customer Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <%--<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlPOCustomerName" runat="server" ServiceMethod="GetCustomerList" AutoPostBack="true" OnItem_Selected="ddlPOCustomerName_SelectedIndexChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPOCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>--%>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLoadSequenceNo">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlPOLoadSequenceNo" runat="server" ServiceMethod="GetDocumentNumberList" AutoPostBack="true" Text="Check List Number" ToolTip="Check List Number"
                                                OnItem_Selected="ddlPOLoadSequenceNo_SelectedIndexChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPOLoadSequenceNo" CssClass="styleDisplayLabel" ToolTip="Check List Number" Text="Check List Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvClientName" visible="false">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlClientName" runat="server" ServiceMethod="GetClientNameList" Text="Client Name" ToolTip="Client Name" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label5" CssClass="styleDisplayLabel" ToolTip="Client Name" Text="Client Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvAccountNumber" visible="false">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlAccountNumber" runat="server" ServiceMethod="GetAccountNo" Text="Account Number" ToolTip="Account Number" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label6" CssClass="styleDisplayLabel" ToolTip="Account Number" Text="Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="OverDue List Search Details" ID="pnlodSearch" runat="server" CssClass="stylePanel" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtod_From_Date" runat="server" ToolTip="From Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                                PopupButtonID="imgPOFromDate" TargetControlID="txtod_From_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label1" CssClass="styleDisplayLabel" Text="From Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtod_To_Date" runat="server" ToolTip="To Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                                PopupButtonID="imgPOToDate" TargetControlID="txtod_To_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label2" CssClass="styleDisplayLabel" Text="To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="OverDue Invoice List Search Details" ID="pnlOverDueInvoiceSearch" runat="server" CssClass="stylePanel" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtodi_From_Date" runat="server" ToolTip="From Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True"
                                                PopupButtonID="imgPOFromDate" TargetControlID="txtodi_From_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label3" CssClass="styleDisplayLabel" Text="From Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtodi_To_Date" runat="server" ToolTip="To Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True"
                                                PopupButtonID="imgPOToDate" TargetControlID="txtodi_To_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label4" CssClass="styleDisplayLabel" Text="To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Rental Achedule Aggrement Search Details" ID="pnlRSASearch" runat="server" CssClass="stylePanel"
                                ToolTip="Rental Achedule Aggrement Search Details" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRS_From_Date" runat="server" ToolTip="RS From Date"></asp:TextBox>
                                            <asp:Image ID="imgRSFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderRSFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgRSFromDate" TargetControlID="txtRS_From_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvRSFromDate" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtRS_From_Date"
                                                    ErrorMessage="Enter RS From Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblRSFromDate" CssClass="styleReqFieldLabel" Text="RS From Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRS_To_Date" runat="server" ToolTip="RS To Date"></asp:TextBox>
                                            <asp:Image ID="imgRSToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderRSToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgRSToDate" TargetControlID="txtRS_To_Date" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvRSToDate" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtRS_To_Date"
                                                    ErrorMessage="Enter RS To Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblRSToDate" CssClass="styleReqFieldLabel" Text="RS To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlRSAccountNumber" runat="server" ServiceMethod="GetRSNo" />

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblRSAccountNumber" CssClass="styleDisplayLabel" Text="Account No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlRSCustomerName" runat="server" ServiceMethod="GetCustomerNameDetails" />

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblRSCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="MRA Search Details" ID="pnlMRASearch" runat="server" CssClass="stylePanel"
                                ToolTip="MRA Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblMRAFromDate" CssClass="styleReqFieldLabel" Text="MRA From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtMRAFromDate" runat="server" ToolTip="MRA From Date"></asp:TextBox>
                                            <asp:Image ID="imgMRAFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderMRAFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgMRAFromDate" TargetControlID="txtMRAFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvMRAFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtMRAFromDate"
                                                ErrorMessage="Enter MRA From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblMRAToDate" CssClass="styleReqFieldLabel" Text="MRA To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtMRAToDate" runat="server" ToolTip="MRA To Date"></asp:TextBox>
                                            <asp:Image ID="imgMRAToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderMRAToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgMRAToDate" TargetControlID="txtMRAToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvMRAToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtMRAToDate"
                                                ErrorMessage="Enter MRA To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>

                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblMRACustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <uc2:Suggest ID="ddlMRACustomerName" runat="server" ServiceMethod="GetCustomerNameDetails" />
                                            </td>
                                        </tr>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Pricing Search Details" ID="pnlPricingSearch" runat="server" CssClass="stylePanel"
                                ToolTip="Pricing Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblPricingFromDate" CssClass="styleReqFieldLabel" Text="Pricing From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtPricingFromDate" runat="server" ToolTip="Pricing From Date"></asp:TextBox>
                                            <asp:Image ID="imgPricingFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderPricingFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgPricingFromDate" TargetControlID="txtPricingFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvPricingFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtPricingFromDate"
                                                ErrorMessage="Enter Pricing From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblPricingToDate" CssClass="styleReqFieldLabel" Text="Pricing To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtPricingToDate" runat="server" ToolTip="Pricing To Date"></asp:TextBox>
                                            <asp:Image ID="imgPricingToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderPricingToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgPricingToDate" TargetControlID="txtPricingToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvPricingToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtPricingToDate"
                                                ErrorMessage="Enter Pricing To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>

                                        <tr>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblPricingNumber" CssClass="styleDisplayLabel" Text="Pricing No."></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <uc2:Suggest ID="ddlPricingNo" runat="server" ServiceMethod="GetPricingNo" />
                                            </td>
                                            <td class="styleFieldLabel">
                                                <asp:Label runat="server" ID="lblPricingCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                            </td>
                                            <td class="styleFieldAlign">
                                                <uc2:Suggest ID="ddlPricingCustomerName" runat="server" ServiceMethod="GetCustomerNameDetails" />
                                            </td>
                                        </tr>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="NOA Search Details" ID="pnlNOASearch" runat="server" CssClass="stylePanel"
                                ToolTip="NOA Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblNOAFromDate" CssClass="styleReqFieldLabel" Text="Deal From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtNOAFromDate" runat="server" ToolTip="Deal From Date"></asp:TextBox>
                                            <asp:Image ID="imgNOAFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderNOAFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgNOAFromDate" TargetControlID="txtNOAFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvNOAFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtNOAFromDate"
                                                ErrorMessage="Enter Deal From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblNOAToDate" CssClass="styleReqFieldLabel" Text="Deal To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtNOAToDate" runat="server" ToolTip="Deal To Date"></asp:TextBox>
                                            <asp:Image ID="imgNOAToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderNOAToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgNOAToDate" TargetControlID="txtNOAToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvNOAToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtNOAToDate"
                                                ErrorMessage="Enter Deal To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblNoaNumber" CssClass="styleDisplayLabel" Text="Deal No."></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlDealNo" runat="server" ServiceMethod="GetDealNo" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblNOACustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlNOACustomerName" runat="server" ServiceMethod="GetCustomerNameDetails" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblReportFormatType" CssClass="styleReqFieldLabel" Text="Report Format Type"></asp:Label>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:DropDownList ID="ddlReportFormatType" runat="server">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvNOAReportFormat" InitialValue="0" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="ddlReportFormatType"
                                                ErrorMessage="Select Report Format" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Debit/Credit Note Search Details" ID="pnlDCSearch" runat="server" CssClass="stylePanel"
                                ToolTip="Debit/Credit Note Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblDCFromDate" CssClass="styleReqFieldLabel" Text="Debit/Credit From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtDCFromDate" runat="server" ToolTip="Debit/Credit From Date"></asp:TextBox>
                                            <asp:Image ID="imgDCFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderDCFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgDCFromDate" TargetControlID="txtDCFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvDCFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtDCFromDate"
                                                ErrorMessage="Enter Debit/Credit From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblDCToate" CssClass="styleReqFieldLabel" Text="Debit/Credit To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtDCToDate" runat="server" ToolTip="Debit/Credit To Date"></asp:TextBox>
                                            <asp:Image ID="imgDCToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderDCToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgDCToDate" TargetControlID="txtDCToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvDCToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtDCToDate"
                                                ErrorMessage="Enter Debit/Credit To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblDCEntityName" CssClass="styleDisplayLabel" Text="Entity Name"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlDCEntityName" runat="server" ServiceMethod="GetDCEntityName" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblDCNo" CssClass="styleDisplayLabel" Text="Debit/Credit No"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlDCNo" runat="server" ServiceMethod="GetDCNo" />
                                        </td>
                                    </tr>

                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Credit Note Search Details" ID="pnlCNSearch" runat="server" CssClass="stylePanel"
                                ToolTip="Credit Note Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblCNFromDate" CssClass="styleReqFieldLabel" Text="Credit Note From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtCNFromDate" runat="server" ToolTip="Credit Note From Date"></asp:TextBox>
                                            <asp:Image ID="imgCNFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderCNFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgCNFromDate" TargetControlID="txtCNFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvCNFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtCNFromDate"
                                                ErrorMessage="Enter Credit Note From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblCNToate" CssClass="styleReqFieldLabel" Text="Credit Note To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtCNToDate" runat="server" ToolTip="Credit Note To Date"></asp:TextBox>
                                            <asp:Image ID="imgCNToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderCNToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgCNToDate" TargetControlID="txtCNToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvCNToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtCNToDate"
                                                ErrorMessage="Enter Credit Note To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Other CashFlow Search Details" ID="pnlOCPSearch" runat="server" CssClass="stylePanel"
                                ToolTip="Other CashFlow Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblOCPFromDate" CssClass="styleReqFieldLabel" Text="From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtOCPFromdate" runat="server" ToolTip="From Date"></asp:TextBox>
                                            <asp:Image ID="imgOCPFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderOCPFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgOCPFromDate" TargetControlID="txtOCPFromdate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvOCPFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtOCPFromdate"
                                                ErrorMessage="Enter From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblOCPToDate" CssClass="styleReqFieldLabel" Text="To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtOCPTodate" runat="server" ToolTip="To Date"></asp:TextBox>
                                            <asp:Image ID="imgOCPToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderOCPToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgOCPToDate" TargetControlID="txtOCPTodate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvOCPToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtOCPTodate"
                                                ErrorMessage="Enter To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Rental Invoice Search Details" ID="pnlRISearch" runat="server" CssClass="stylePanel"
                                ToolTip="Rental Invoice Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblRIFromDate" CssClass="styleReqFieldLabel" Text="From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtRIFromDate" runat="server" ToolTip="From Date"></asp:TextBox>
                                            <asp:Image ID="imgRIFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderRIFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgRIFromDate" TargetControlID="txtRIFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvRIFromDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtRIFromDate"
                                                ErrorMessage="Enter From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblRIToDate" CssClass="styleReqFieldLabel" Text="To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtRIToDate" runat="server" ToolTip="To Date"></asp:TextBox>
                                            <asp:Image ID="imgRIToDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderRIToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgRIToDate" TargetControlID="txtRIToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvRIToDate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtRIToDate"
                                                ErrorMessage="Enter To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblRIBillNumber" CssClass="styleDisplayLabel" Text="Bill No."></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlRIBillNumber" runat="server" ServiceMethod="GetBillNo" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblRILocation" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlRILocation" runat="server" ServiceMethod="GetLocation" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Interim Invoice Search Details" ID="pnlIISearch" runat="server" CssClass="stylePanel"
                                ToolTip="Interim Invoice Search Details" Style="display: none">
                                <table width="100%" align="center" border="0" cellspacing="0">
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblIIFromDate" CssClass="styleReqFieldLabel" Text="From Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtIIFromDate" runat="server" ToolTip="From Date"></asp:TextBox>
                                            <asp:Image ID="imgIIFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderIIFromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgIIFromDate" TargetControlID="txtIIFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvIIFromdate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtIIFromDate"
                                                ErrorMessage="Enter From Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblIIToDate" CssClass="styleReqFieldLabel" Text="To Date"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtIIToDate" runat="server" ToolTip="To Date"></asp:TextBox>
                                            <asp:Image ID="imgToFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                            <cc1:CalendarExtender ID="CalendarExtenderIIToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgToFromDate" TargetControlID="txtIIToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="rfvIITodate" ValidationGroup="Search" CssClass="styleMandatoryLabel"
                                                runat="server" ControlToValidate="txtIIToDate"
                                                ErrorMessage="Enter To Date" Display="None"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblDocNumber" CssClass="styleDisplayLabel" Text="Document Number"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlIIDocNumber" runat="server" ServiceMethod="GetDocNo" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblAccNumber" CssClass="styleDisplayLabel" Text="Account Number"></asp:Label>
                                        </td>
                                        <td class="styleFieldAlign">
                                            <uc2:Suggest ID="ddlIIAccNumber" runat="server" ServiceMethod="GetAccountNumber" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Factoring Invoice Search Details" ID="pnlFactoring" runat="server" CssClass="stylePanel" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLocation">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxBranchSearch" runat="server" ToolTip="Branch"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                                                    InitialValue="-- Select --" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxBranchSearch"
                                                    SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFact_FromDate" runat="server" ToolTip="From Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalFact_FromDate" runat="server" Enabled="True"
                                                PopupButtonID="imgFromDate" TargetControlID="txtFact_FromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblFact_FromDate" CssClass="styleReqFieldLabel" Text="From Date"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFromDate" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtFact_FromDate"
                                                    ErrorMessage="Enter From Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="Div1" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFact_ToDate" runat="server" ToolTip="To Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalFact_ToDate" runat="server" Enabled="True"
                                                PopupButtonID="imgToDate" TargetControlID="txtFact_ToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblFact_Todate" CssClass="styleReqFieldLabel" Text="To Date"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvToDate" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtFact_ToDate"
                                                    ErrorMessage="Enter To Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="Div4">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ucClient" runat="server" ServiceMethod="GetClientNameList" Text="Client Name" ToolTip="Client Name" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label11" CssClass="styleDisplayLabel" ToolTip="Client Name" Text="Client Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Receipt Search Details" ID="pnlReceipt" runat="server" CssClass="stylePanel" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ucReceiptNo" runat="server" ServiceMethod="GetReceiptNo" AutoPostBack="true" Text="Check List Number" ToolTip="Receipt No." />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label7" CssClass="styleDisplayLabel" ToolTip="Receipt No." Text="Receipt No."></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFrom_ReceiptDate" runat="server" ToolTip="From Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalFromReceiptDate" runat="server" Enabled="True"
                                                PopupButtonID="imgFromDate" TargetControlID="txtFrom_ReceiptDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label8" CssClass="styleDisplayLabel" Text="From Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="Div3" runat="server">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTo_ReceiptDate" runat="server" ToolTip="To Date" AutoComplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalToReceiptDate" runat="server" Enabled="True"
                                                PopupButtonID="imgToDate" TargetControlID="txtTo_ReceiptDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label9" CssClass="styleDisplayLabel" Text="To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server"
                            type="button" title="Search[Alt+S]" validationgroup="Search" accesskey="S">
                            <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Check List Proposal Details" ID="pnlPO" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView ID="gvCheckList" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%" OnRowDataBound="gvCheckList_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPOSlNo" runat="server" Text='<%# Eval("RowNumber") %>' ToolTip="S.No." />
                                                            <asp:Label ID="lblPO_dtl_ID" runat="server" Text='<%# Eval("Pricing_Id") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Check List Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Number" runat="server" Text='<%# Eval("BUSINESS_OFFER_NUMBER") %>' ToolTip="Check List Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Check List Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Date" runat="server" Text='<%# Eval("Created_On") %>'
                                                                ToolTip="Check List Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("CUSTOMER_CODE") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Vendor Name" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEntity_Name" runat="server" Text='<%# Eval("CUSTOMER_CODE") %>'
                                                            ToolTip="Entity Name" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="Amount" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal_Bill_Amount" runat="server" Text='<%# Eval("Total_Bill_Amount") %>'
                                                            ToolTip="Total Bill Amount" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                ToolTip="Status" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucPOCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="NOC Details" ID="pnlNOC" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView ID="grvNOC" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%" OnRowDataBound="grvNOC_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPOSlNo" runat="server" Text='<%# Eval("RowNumber") %>' ToolTip="S.No." />
                                                            <asp:Label ID="lblPO_dtl_ID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="NOC Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Number" runat="server" Text='<%# Eval("NOC_Number") %>' ToolTip="NOC Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Release Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Date" runat="server" Text='<%# Eval("Release_Date") %>'
                                                                ToolTip="Release Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("CUSTOMER_CODE") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Vendor Name" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEntity_Name" runat="server" Text='<%# Eval("CUSTOMER_CODE") %>'
                                                            ToolTip="Entity Name" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="Amount" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal_Bill_Amount" runat="server" Text='<%# Eval("Total_Bill_Amount") %>'
                                                            ToolTip="Total Bill Amount" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                ToolTip="Status" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucNOCCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="LPO Details" ID="pnlLPODetails" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView ID="grvLPODetails" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%" OnRowDataBound="grvLPODetails_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPOSlNo" runat="server" Text='<%# Eval("RowNumber") %>' ToolTip="S.No." />
                                                            <asp:Label ID="lblPO_dtl_ID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Number" runat="server" Text='<%# Eval("APPLICATION_NUMBER") %>' ToolTip="NOC Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Created Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Date" runat="server" Text='<%# Eval("CREATED_ON") %>'
                                                                ToolTip="Release Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("Customer") %>'
                                                                ToolTip="Customer Name" />
                                                            <asp:Label ID="lblVendor_Id" runat="server" Text='<%# Eval("VENDOR_ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Vendor Name" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEntity_Name" runat="server" Text='<%# Eval("CUSTOMER_CODE") %>'
                                                            ToolTip="Entity Name" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>--%>
                                                    <%--<asp:TemplateField HeaderText="Amount" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal_Bill_Amount" runat="server" Text='<%# Eval("Total_Bill_Amount") %>'
                                                            ToolTip="Total Bill Amount" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'
                                                                ToolTip="Status" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucLPOCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="OverDue Details" ID="pnlLODDetails" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView ID="grvODDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%" OnRowDataBound="grvODDetails_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblODSlNo" runat="server" Text='<%# Eval("RowNumber") %>' ToolTip="S.No." />
                                                            <asp:Label ID="lblPA_SA_REF_ID" runat="server" Text='<%# Eval("PA_SA_REF_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("CUSTOMER_NAME") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccountNumber" runat="server" Text='<%# Eval("ACCOUNT_NO") %>'
                                                                ToolTip="Account Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="OverDue Amount" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotal_Bill_Amount" runat="server" Text='<%# Eval("OVERDUEAMOUNT") %>'
                                                                ToolTip="Total Bill Amount" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucLODCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="OverDue Invoice Details" ID="pnlLODIDetails" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="grid">
                                            <asp:GridView ID="grvODIDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%" OnRowDataBound="grvODIDetails_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblODSlNo" runat="server" Text='<%# Eval("RowNumber") %>' ToolTip="S.No." />
                                                            <asp:Label ID="lblPA_SA_REF_ID" runat="server" Text='<%# Eval("PA_SA_REF_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblCLIENT_ID" runat="server" Text='<%# Eval("CLIENT_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblCUSTOMER_ID" runat="server" Text='<%# Eval("CUSTOMER_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Client Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("CLIENT_NAME") %>'
                                                                ToolTip="Client Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("customer_name") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccountNumber" runat="server" Text='<%# Eval("ACCOUNT_NO") %>'
                                                                ToolTip="Account Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="OverDue Amount" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotal_Bill_Amount" runat="server" Text='<%# Eval("OD_Amt") %>'
                                                                ToolTip="Total Bill Amount" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucODICustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Rental Schedule Details" ID="pnlRS" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvRS" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvRS_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRSSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblRS_ID" runat="server" Text='<%# Eval("RS_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblCustomer_ID" runat="server" Text='<%# Eval("Customer_ID") %>' Visible="false" />

                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRS_Number" runat="server" Text='<%# Eval("RS_Number") %>' ToolTip="Account Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccount_Date" runat="server" Text='<%# Eval("Account_Date") %>'
                                                                ToolTip="Account Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("Customer_Name") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucRSCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="MRA Details" ID="pnlMRA" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvMRA" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvMRA_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMRASlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblMRA_ID" runat="server" Text='<%# Eval("MRA_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="MRA Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMRA_Number" runat="server" Text='<%# Eval("MRA_Number") %>' ToolTip="Account Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("MRA_Date") %>'
                                                                ToolTip="Account Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("Customer_Name") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucMRACustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Pricing Details" ID="pnlPricing" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvPricing" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvPricing_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPRCSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblPricing_ID" runat="server" Text='<%# Eval("Pricing_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblCustomer_ID" runat="server" Text='<%# Eval("Customer_ID") %>' Visible="false" />

                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Pricing Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPricing_Number" runat="server" Text='<%# Eval("Pricing_Number") %>' ToolTip="Pricing Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Offer Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOffer_Date" runat="server" Text='<%# Eval("Offer_Date") %>'
                                                                ToolTip="Offer Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("Customer_Name") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucPricingCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Deal Details" ID="pnlNOA" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvNOA" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvNOA_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNOASlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblDeal_ID" runat="server" Text='<%# Eval("Deal_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Deal Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDeal_Number" runat="server" Text='<%# Eval("Deal_Number") %>' ToolTip="Deal Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Deal Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOffer_Date" runat="server" Text='<%# Eval("Deal_Date") %>'
                                                                ToolTip="Deal Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tranche Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTranche_Name" runat="server" Text='<%# Eval("Tranche_Name") %>'
                                                                ToolTip="Tranche Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("Customer_Name") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucNOACustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Debit/Credit Details" ID="pnlDC" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvDC" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvDC_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDCSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblDC_ID" runat="server" Text='<%# Eval("DC_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit/Credit Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDC_Number" runat="server" Text='<%# Eval("DC_Number") %>' ToolTip="Debit/Credit Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit/Credit Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDC_Date" runat="server" Text='<%# Eval("DC_Date") %>'
                                                                ToolTip="Debit/Credit Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Location" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDCLocation" runat="server" Text='<%# Eval("Location") %>'
                                                                ToolTip="Location" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Entity Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer_Name" runat="server" Text='<%# Eval("Entity_Name") %>'
                                                                ToolTip="Entity Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucDCCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Credit Note Details" ID="pnlCN" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvCN" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvCN_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCNSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblRS_ID" runat="server" Text='<%# Eval("PASA_Ref_id") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Document Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCN_Number" runat="server" Text='<%# Eval("CN_Number") %>' ToolTip="Document Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Customer Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCust_Name" ToolTip="Customer Name" runat="server" Text='<%#Bind("Customer_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Account Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRS_Number" ToolTip="Account Number" runat="server" Text='<%#Bind("PANum") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" HeaderText="Installment Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallment_No" ToolTip="Invoice Date" runat="server" Text='<%#Bind("instal_no") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" HeaderText="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" ToolTip="Amount" runat="server" Text='<%#Bind("TotalVATAmount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Invoice Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoice_Date" ToolTip="Invoice Date" runat="server" Text='<%#Bind("Invoice_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucCNCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Other CashFlow Details" ID="pnlOCP" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvOCP" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvOCP_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDCSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblCashflow" Visible="false" runat="server" Text='<%# Eval("cashflow_id") %>' />
                                                            <asp:Label ID="lblCashflowFlag" Visible="false" runat="server" Text='<%# Eval("CashFlow_Flag_ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Tranche Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTranche_Name" ToolTip="Tranche Name" runat="server" Text='<%#Bind("TRANCHE_NAME") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Cashflow">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCashflowDescription" ToolTip="Cashflow" runat="server" Text='<%#Bind("CashFlow_Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Invoice Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceDate" ToolTip="Invoice Date" runat="server" Text='<%#Bind("Invoice_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucOCPCustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Rental Invoice Details" ID="pnlRI" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvRI" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvRI_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRISlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblBillId" Visible="false" runat="server" Text='<%# Eval("Billing_ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Location">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLocation" ToolTip="Location" runat="server" Text='<%#Bind("Location_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Bill Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBillNumber" ToolTip="Bill Number" runat="server" Text='<%#Bind("Billing_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Account Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccNumber" ToolTip="Account Number" runat="server" Text='<%#Bind("PANum") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucRICustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Rental Invoice Details" ID="pnlII" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvII" runat="server" AutoGenerateColumns="False" DataKeyNames="SNo" Width="100%"
                                                OnRowDataBound="gvII_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIISlNo" runat="server" Text='<%# Eval("[SNo]") %>' />
                                                            <asp:Label ID="lblInterimId" Visible="false" runat="server" Text='<%# Eval("ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Document Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDocNumber" ToolTip="Document Number" runat="server" Text='<%#Bind("[Document Number]") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Customer">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCustomer" ToolTip="Customer" runat="server" Text='<%#Bind("Customer") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Account Number">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccNumber" ToolTip="Account Number" runat="server" Text='<%#Bind("[Rent Sch No]") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderText="Pre EMI Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPreEMIDate" ToolTip="Pre EMI Date" runat="server" Text='<%#Bind("[Pre EMI Date]") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" ToolTip="Select All" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucIICustomPaging" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Factoring Invoice Details" ID="pnlFactoringGrid" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvFactoring" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="gvFactoring_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblPA_SA_REF_ID" runat="server" Text='<%# Eval("PA_SA_REF_ID") %>' Visible="false" />
                                                            <%-- <asp:Label ID="lblCLIENT_ID" runat="server" Text='<%# Eval("CLIENT_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblCUSTOMER_ID" runat="server" Text='<%# Eval("CUSTOMER_ID") %>' Visible="false" />
                                                            <asp:Label ID="lblFACTORING_INV_LOAD_ID" runat="server" Text='<%# Eval("FACTORING_INV_LOAD_ID") %>' Visible="false" />--%>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccount_Number" runat="server" Text='<%# Eval("Account_Number") %>' ToolTip="Pricing Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Invoice Number" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoice_Number" runat="server" Text='<%# Eval("Invoice_Number") %>' ToolTip="Invoice Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Batch Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApproval_Date" runat="server" Text='<%# Eval("Approval_Date") %>'
                                                                ToolTip="Approval Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Client Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClient_Name" runat="server" Text='<%# Eval("Client_Name") %>'
                                                                ToolTip="Client Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Batch Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBatch_Number" runat="server" Text='<%# Eval("Batch_Number") %>'
                                                                ToolTip="Batch Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucpageNavigator" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Receipt Details" ID="pnlBulkReceipt" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvBulkReceipt" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%"
                                                OnRowDataBound="grvBulkReceipt_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSlNo" runat="server" Text='<%# Eval("ROWNUMBER") %>' />
                                                            <asp:Label ID="lblRECEIPT_ID" runat="server" Text='<%# Eval("RECEIPT_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipt Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAccount_Number" runat="server" Text='<%# Eval("RECEIPTNO") %>' ToolTip="Pricing Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Invoice Number" HeaderStyle-CssClass="styleGridHeader" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoice_Number" runat="server" Text='<%# Eval("Invoice_Number") %>' ToolTip="Invoice Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCUSTOMER" runat="server" Text='<%# Eval("CUSTOMER") %>'
                                                                ToolTip="Customer Name" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipt Amount" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReceipt_Amount" runat="server" Text='<%# Eval("Receipt_Amount") %>'
                                                                ToolTip="Receipt Amount" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipt Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReceipt_Date" runat="server" Text='<%# Eval("Receipt_Date") %>'
                                                                ToolTip="Batch Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td>Select All
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chkAll" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="chkSelected" ToolTip="select" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                            <uc3:PageNavigator ID="ucReceiptpageNavigator" runat="server"></uc3:PageNavigator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Print Details" ID="pnlPrintDetails" runat="server" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPrintType" runat="server" class="md-form-control form-control" ToolTip="Print Type">
                                                <asp:ListItem Value="P" Text="PDF"></asp:ListItem>
                                                <asp:ListItem Value="W" Text="WORD"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPrintType" runat="server" Text="Print Type" ToolTip="Print Type" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLanguage" AutoPostBack="false" ToolTip="Language" runat="server"
                                                class="md-form-control form-control  requires_false">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" Text="Language"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div align="right">
                        <button class="css_btn_enabled" id="btnEmail" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnEmail_ServerClick" runat="server"
                            type="button" accesskey="E" enabled="false">
                            <i class="fa fa-envelope" aria-hidden="true"></i>&emsp;<u>E</u>mail
                        </button>
                        <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                            type="button" accesskey="P" enabled="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="l">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsSearch" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):  " ValidationGroup="Search" />
                            <asp:ValidationSummary ID="vsPrint" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):  " ValidationGroup="Print" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <%--added for print--%>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
    </script>
</asp:Content>









