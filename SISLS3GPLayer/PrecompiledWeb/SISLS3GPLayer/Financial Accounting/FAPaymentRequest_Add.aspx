<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAPaymentRequest_Add, App_Web_sravfnz4" title="Payment Request" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upMain" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">

                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Payment Request" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                    </div>

                    <div>
                        <cc1:TabContainer ID="TCPaymentRequest" runat="server" CssClass="styleTabPanel" Width="100%"
                            ScrollBars="None" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" ID="TPPaymentRequest" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Payment Request
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlPaymentInformation" Style="margin-bottom: -40px" runat="server" CssClass="stylePanel" GroupingText="Payment Information">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlActivity" ValidationGroup="Header" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                                            ErrorMessage="Select Activity" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        <%-- <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity2" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                                                ErrorMessage="Select Activity" ValidationGroup="btngo"></asp:RequiredFieldValidator>--%>
                                                                        <asp:HiddenField ID="hdnPrint" runat="server" />
                                                                        <asp:HiddenField ID="HdnActivity" runat="server" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Activity" ID="lblActivity" CssClass="styleReqFieldLabel"
                                                                            ToolTip="Activity"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtPaymentRequestNo" class="md-form-control form-control login_form_content_input requires_true" onmouseover="txt_MouseoverTooltip(this)"
                                                                        ReadOnly="true" runat="server"></asp:TextBox>
                                                                     <asp:HiddenField ID="hdndconumber" runat="server" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Payment Request Number" Text="Request No."
                                                                            ID="lblPaymentRequestNo" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:DropDownList>

                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlLocation" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="0"
                                                                            ErrorMessage="Select Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        <%-- <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlLocation2" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="0"
                                                                            ErrorMessage="Select Location" ValidationGroup="btngo"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Branch" ToolTip="Level" ID="lblLevel" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtPaymentRequestDate" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" OnTextChanged="txtDocDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                                    <%--<asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                    <cc1:CalendarExtender ID="CEPaymentRequestDate" runat="server" PopupButtonID="imgPaymentRequestDate"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtPaymentRequestDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtPaymentRequestDate" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtPaymentRequestDate"
                                                                            ErrorMessage="Enter Payment Request Date"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Request Date" ToolTip="Payment Request Date" ID="lblPaymentRequestDate"
                                                                            CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPaymentStatus" ToolTip="Payment Status" runat="server" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlPaymentStatus" CssClass="validation_msg_box_sapn"
                                                                            InitialValue="0" runat="server" SetFocusOnError="True" ControlToValidate="ddlPaymentStatus"
                                                                            ErrorMessage="Select Status" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Status" ToolTip="Payment Status" ID="lblPaymentStatus"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtValueDate" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        OnTextChanged="txtValueDate_TextChanged1" AutoPostBack="true"></asp:TextBox>
                                                                    <%--<asp:Image ID="imgValueDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                    <cc1:CalendarExtender ID="CEValueDate" runat="server" PopupButtonID="imgValueDate"
                                                                        TargetControlID="txtValueDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtValueDate" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtValueDate"
                                                                            ErrorMessage="Enter Value Date"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Value Date" ToolTip="Value date" ID="lblValueDate"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPayTo" runat="server" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control"
                                                                        OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged" AutoPostBack="True">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlPayTo" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayTo"
                                                                            ErrorMessage="Select Pay To" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        <%--<asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlPayTo2" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayTo"
                                                                            ErrorMessage="Select Pay To" ValidationGroup="btngo"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Pay To" ToolTip="Pay to" ID="lblPayTo" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPayMode" runat="server" OnSelectedIndexChanged="ddlPayMode_SelectedIndexChanged" class="md-form-control form-control"
                                                                        AutoPostBack="True" onmouseover="ddl_itemchanged(this)">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlPayMode" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlPayMode" InitialValue="0"
                                                                            ErrorMessage="Select Pay Mode" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Pay Mode" ToolTip="Pay mode" ID="lblPayMode" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlCurrency" runat="server" OnSelectedIndexChanged="ddlCurrency_SelectedIndexChanged"
                                                                        AutoPostBack="true" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlCurrency" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ControlToValidate="ddlCurrency" InitialValue="0"
                                                                            ErrorMessage="Select Currency" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Currency" ToolTip="Currency" ID="lblCurrency" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCurrencyValue" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        Enabled="false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Currency Value" ToolTip="Currency Value" ID="lblCurrencyValue"
                                                                            CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDocAmount" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        MaxLength="15" Style="text-align: right"></asp:TextBox><%--onfocusOut="Funcheckvaliddecimal(this);"--%>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtDocAmount" runat="server" TargetControlID="txtDocAmount"
                                                                        ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtDocAmount" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ValidationGroup="Save" ControlToValidate="txtDocAmount"
                                                                            ErrorMessage="Enter Doc Amount"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Document Amount" Text="Document Amount" ID="lblDocAmount"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">

                                                                    <asp:TextBox ID="txtCode" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control"
                                                                        Style="display: none;" MaxLength="50" ContentEditable="false"></asp:TextBox>
                                                                    <%-- <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code"
                                                                            TextWidth="65%" />--%>
                                                                    <asp:HiddenField ID="hdncode" Value="0" runat="server" />
                                                                    <asp:HiddenField ID="Hdngl_code" Value="0" runat="server" />
                                                                    <asp:HiddenField ID="Hdngl_desc" Value="0" runat="server" />
                                                                    <asp:HiddenField ID="Hdnsl_code" Value="0" runat="server" />
                                                                    <asp:HiddenField ID="Hdnsl_desc" Value="0" runat="server" />
                                                                    <uc2:LOV ID="ucLov" Enabled="false" onblur="fnLoadEntity()" LOV_Code="FAENT" AutoPostBack="true" runat="server" DispalyContent="Name" ServiceMethod="GetEntityFunder" ShowHideAddressImageButton="false" HoverMenuExtenderLeft="true" OnItem_Selected="ucLov_Item_Selected" />
                                                                    <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                                        Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                                        CausesValidation="false" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtCode" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Entity/Funder"
                                                                            ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" ToolTip="Entity" Text="Entity/Funder" ID="lblCode" CssClass="styleMandatoryLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtGlAccount" runat="server" ToolTip="GL Account" ReadOnly="true"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblGLAccount" runat="server" Text="GL Account" CssClass="styleDisplayLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSLAccount" runat="server" ToolTip="SL Account" ReadOnly="true"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblSLAccount" runat="server" Text="SL Account" CssClass="styleDisplayLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlReferenceType" runat="server" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlReferenceType_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ValidationGroup="btnFetch" InitialValue="0" ControlToValidate="ddlReferenceType"
                                                                            ErrorMessage="Select Reference Type"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Reference Type" ID="lblReferenceType" CssClass="styleDisplayLabel"
                                                                            ToolTip="Reference Type"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtVoucherPrintstatus" runat="server" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"
                                                                        class="md-form-control form-control login_form_content_input requires_true" />

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblvoucherprintstatus" runat="server" ToolTip="Voucher print Status" Text="Voucher Print Status"
                                                                            CssClass="styleDisplayLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFromDate" onmouseover="txt_MouseoverTooltip(this)" ToolTip="From Date"
                                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" ContentEditable="true" AutoPostBack="true" OnTextChanged="txtFromDate_TextChanged"></asp:TextBox>


                                                                    <cc1:CalendarExtender ID="CEFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                        runat="server" Enabled="True" PopupButtonID="imgFromDate" TargetControlID="txtFromDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtFromDate" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ValidationGroup="btnFetch" ControlToValidate="txtFromDate"
                                                                            ErrorMessage="Enter From Date"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="From date" Text="From Date" ID="lblFromDate" CssClass="styleFieldLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtToDate" onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" ToolTip="To Date"
                                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" ContentEditable="true" OnTextChanged="txtToDate_TextChanged"></asp:TextBox>


                                                                    <cc1:CalendarExtender ID="CEToDate" runat="server" Enabled="True" PopupButtonID="imgToDate"
                                                                        TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtToDate" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ValidationGroup="btnFetch" ControlToValidate="txtToDate"
                                                                            ErrorMessage="Enter To Date"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="To date" Text="To Date" ID="lblToDate" CssClass="styleFieldLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="chkIRS" runat="server" AutoPostBack="true" Text="IRS Receipt" OnCheckedChanged="chkIRS_OnCheckedChanged" />
                                                                <asp:HiddenField ID="hdncountry" runat="server" />
                                                                <asp:CheckBox ID="chkpayment" runat="server" Enabled="false" Text="Tax Payment" />
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTowards" runat="server" TextMode="MultiLine" ToolTip="Towards" MaxLength="100" onkeyup="maxlengthfortxt(100);"
                                                                        class="md-form-control form-control login_form_content_input lowercase"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Towards" ID="Label2" CssClass="styleDisplayLabel"
                                                                            ToolTip="Reference Type"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div align="center" style="margin-top: -38px">
                                                            <div class="md-input">
                                                                <button class="grid_btn" id="btnFetch" title="Alt+E" accesskey="E" runat="server" validationgroup="btnFetch" onserverclick="btnFetch_ServerClick">
                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>F<u>e</u>tch</button>

                                                                <button class="css_btn_enabled" id="btnCashDeposit" title="Cash Denomination[Alt+Shift+D]"
                                                                    causesvalidation="false" onserverclick="btnCashDeposit_OnClick" runat="server"
                                                                    type="button" accesskey="D">
                                                                    <i class="fa fa-money" aria-hidden="true"></i>&emsp;Cash <u>D</u>enomination
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="PnlPayType" Visible="false" runat="server" ToolTip="Pay Type" GroupingText="Pay Type"
                                                        CssClass="stylePanel">
                                                        <div class="row">


                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPayType" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input"
                                                                        runat="server" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator7" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayType"
                                                                            ErrorMessage="Select Pay Type" ValidationGroup="btngo"> </asp:RequiredFieldValidator>
                                                                    </div>


                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                                <label>
                                                                    <asp:Label runat="server" ToolTip="Pay Type" Text="Pay Type" ID="lblPayType" CssClass="styleFieldLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <asp:Button ID="btnGo" OnClick="btnGo_Click" runat="server" Text="Go"
                                                                    ToolTip="Go,Alt + G" AccessKey="G" CssClass="styleSubmitShortButton" ValidationGroup="btngo"
                                                                    OnClientClick="return fnCheckPageValidators('btngo',false)" />
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlInvoice" runat="server" CssClass="stylePanel" GroupingText="Reference Document Details" Width="99%" Visible="false">
                                                        <div class="gird">
                                                            <div id="divreference" style="height: 250px; overflow: auto">
                                                                <asp:GridView ID="GrvInvoice" runat="server"
                                                                    AutoGenerateColumns="False" FooterStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                                    RowStyle-HorizontalAlign="Center" ShowFooter="false" ToolTip="Reference Document Details" Width="100%"
                                                                    OnRowDataBound="grvInvoice_RowDataBound" CssClass="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField FooterStyle-Width="25%" HeaderText="Reference Transaction No." ItemStyle-HorizontalAlign="Left" ItemStyle-Width="25%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblid" runat="server" Text='<%#Eval("BD_LinkKey")%>' Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblInvoiceNo" runat="server" Text='<%#Eval("SequenceNo")%>' ToolTip="Invoice No." Width="100%"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddldocumentno" runat="server" AutoPostBack="true" onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlInvestmentSeqNo_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvddldocumentno" runat="server" ControlToValidate="ddldocumentno" CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select Invoice Number" InitialValue="0" SetFocusOnError="True" ValidationGroup="InvesmentAdd"></asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-Width="20%" HeaderText="Amount" ItemStyle-Width="20%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDocAmount" runat="server" Style="text-align: right" Text='<%#Eval("Doc_Amount")%>' ToolTip="Amount" Width="100%"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDocAmount" runat="server" MaxLength="12" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right" Width="75%"></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-Width="20%" HeaderText="Paid Amount" ItemStyle-Width="20%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblpaid" runat="server" Style="text-align: right" Text='<%#Eval("Paid_Amount")%>' ToolTip="Amount" Width="100%"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtpaid" runat="server" MaxLength="12" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right" Width="75%"></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-Width="10%" HeaderText="Invoice Number" ItemStyle-Width="10%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbllInvoiceNumber" runat="server" Text='<%#Eval("Invoice_Number")%>' ToolTip="GL Account" Width="100%"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>

                                                                                <asp:TextBox ID="txtInvoiceNumber" ReadOnly="true" runat="server"></asp:TextBox>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-Width="10%" HeaderText="Invoice Date" ItemStyle-Width="10%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbllInvoiceDate" runat="server" Text='<%#Eval("Invoice_Date")%>' ToolTip="GL Account" Width="100%"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>

                                                                                <asp:TextBox ID="txtInvoiceDate" runat="server" ReadOnly="true" AutoPostBack="True" onmouseover="txt_MouseoverTooltip(this)" ToolTip="MJV Date" Width="165px"></asp:TextBox>
                                                                                <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                                <cc1:CalendarExtender ID="calmjv" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate" OnClientShowing="funchangetoday" PopupButtonID="imgDate" TargetControlID="txtInvoiceDate">
                                                                                </cc1:CalendarExtender>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-Width="10%" HeaderText="Payment Amount" ItemStyle-Width="10%">
                                                                            <ItemTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtInvoiceamount" runat="server" Text='<%#Eval("Invoice_Amount")%>' Style="text-align: right" ToolTip="GL Account" Width="100%" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtInvoiceamount" runat="server" TargetControlID="txtInvoiceamount"
                                                                                        FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>

                                                                                <asp:TextBox ID="txtInvoiceamount" runat="server"></asp:TextBox>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-Width="10%" HeaderText="Select" ItemStyle-Width="10%">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkselect" runat="server" />
                                                                            </ItemTemplate>
                                                                            <%-- <FooterTemplate>
                                                                        <asp:Button ID="lnkInvesmentAdd" runat="server" CommandName="Add" CssClass="styleGridShortButton" Text="Add" ToolTip="Add to the grid" ValidationGroup="InvesmentAdd" />
                                                                    </FooterTemplate>--%>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>

                                                        <div align="center">
                                                            <button class="grid_btn" id="btnupdate" title="Alt+G" accesskey="G" runat="server" onserverclick="btnupdate_Click"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i><u>G</u>O</button>

                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:HiddenField ID="hdngvAccRowIndex" runat="server" />
                                                    <asp:Panel ID="PanelPaymentDetails" ToolTip="Payment Details" Width="99%" runat="server"
                                                        GroupingText="Payment Details" CssClass="stylePanel">
                                                        <div class="gird" style="max-height: 450px; overflow-y: scroll;">
                                                            <asp:GridView runat="server" ShowFooter="true" ID="grvPaymentDetails" Width="100%"
                                                                ToolTip="Payment Details" Visible="true" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                                AutoGenerateColumns="False" FooterStyle-HorizontalAlign="Center" OnRowDeleting="grvPaymentDetails_RowDeleting"
                                                                OnRowDataBound="grvPaymentDetails_RowDataBound" OnRowCommand="grvPaymentDetails_RowCommand" class="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Pay Type" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPayType" ToolTip="Pay Type" runat="server" Text='<%#Eval("PayType")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFooterPayType" runat="server" OnSelectedIndexChanged="ddlFooterPayType_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" onmouseover="ddl_itemchanged(this)">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                            <%-- <asp:RequiredFieldValidator Display="None" ID="RFVddlFooterPayType" CssClass="styleMandatoryLabel"
                                                                                    SetFocusOnError="True" ValidationGroup="GridPayment" runat="server" ControlToValidate="ddlFooterPayType"
                                                                                    InitialValue="0" ErrorMessage="Select Pay Type"></asp:RequiredFieldValidator>--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>' ToolTip="Branch" Width="100Px" />
                                                                            <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                            <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Branch ID" Visible="false" />
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location") %>' ToolTip="Branch" Visible="false" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlLocationF" runat="server" Width="100px" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnSelectedIndexChanged="ddlLocationF_SelectedIndexChanged"></asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">

                                                                                    <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="GridPayment" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Activity">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" ToolTip="Activity" Width="150Px"></asp:Label>
                                                                            <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlActivityF" Width="120Px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlActivityF_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="GridPayment" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Pay Type ID" Visible="false" HeaderStyle-Width="1%"
                                                                        FooterStyle-Width="1%" ItemStyle-Width="1%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPayTypeID" ToolTip="Pay Type ID" runat="server" Text='<%#Eval("PayTypeID")%>'></asp:Label>
                                                                            <asp:Label ID="lblPayTypeFlowID" ToolTip="Pay Type Flow ID" runat="server" Text='<%#Eval("PayTypeFlowID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblFlowID" ToolTip="Pay Type ID" runat="server"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="GL Account" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" Visible="false" ToolTip="Account" runat="server" Text='<%#Eval("GL_Code")%>'></asp:Label>
                                                                            <asp:Label ID="lblGLCodeDesc" ToolTip="Account" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>

                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlGLCodeF" class="md-form-control form-control" Width="150px" runat="server" ServiceMethod="GetGLCodeList" OnItem_Selected="ddlGLCodeF_SelectedIndexChanged"
                                                                                    ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="GridPayment" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SL Account" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSLCode" Visible="false" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Code")%>'></asp:Label>
                                                                            <asp:Label ID="lblSLCodeDesc" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlSLCodeF" runat="server" ServiceMethod="GetSLCodeList" Width="170px" ItemToValidate="Value" OnItem_Selected="ddlSLCodeF_Item_Selected"
                                                                                    WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="GridPayment" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Description" HeaderStyle-Width="25%" FooterStyle-Width="25%"
                                                                        ItemStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="lblDescription" onmouseover="txt_MouseoverTooltip(this)" runat="server" onkeyup="maxlengthfortxt(100);" Width="270px" Height="60px"
                                                                                TextMode="MultiLine" Rows="2" MaxLength="100" Text='<%#Eval("Description")%>'
                                                                                AutoPostBack="true" OnTextChanged="Desc_TextChanged"> </asp:TextBox><%--onkeyup="maxlengthfortxt(100);"--%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFooterDescription" onmouseover="txt_MouseoverTooltip(this)" TextMode="MultiLine" 
                                                                                    Width="270px" Height="60px" MaxLength="100" onkeyup="maxlengthfortxt(100);" runat="server"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtAmount" onmouseover="txt_MouseoverTooltip(this)" Width="100px" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    MaxLength="15" runat="server" Text='<%#Eval("Amount")%>' OnTextChanged="Amount_TextChanged"
                                                                                    AutoPostBack="true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtAmount" runat="server" TargetControlID="txtAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFooterAmount" onmouseover="txt_MouseoverTooltip(this)" Width="100px" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    MaxLength="15" Style="text-align: right"></asp:TextBox>
                                                                                <asp:Label ID="lblFooterActualAmount" runat="server" Visible="false"></asp:Label>
                                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtFooterAmount" runat="server" TargetControlID="txtFooterAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPayment" CssClass="validation_msg_box_sapn"
                                                                                        Display="Dynamic" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                                                </div>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Product/Services" Visible = "false">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("ProductService")%>' ID="lblProductServices" Width="150px" ToolTip="Product Services"></asp:Label>
                                                                            <asp:HiddenField ID="hdnProductServicesId" runat="server" Value='<%#Eval("ProductService_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlProductServicesF" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesF_SelectedIndexChanged">
                                                                                </asp:DropDownList> 
                                                                            </div>
                                                                        </FooterTemplate> 
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Type" Visible = "false">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("TaxType")%>' ID="lblTaxType" ToolTip="Product Services"></asp:Label>
                                                                            <asp:HiddenField ID="hdnTaxTypeId" runat="server" Value='<%#Eval("TaxType_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlTaxTypeF" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlTaxTypeF_SelectedIndexChanged">
                                                                                </asp:DropDownList> 
                                                                            </div>
                                                                        </FooterTemplate>                                                                        
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="ITC Applicability" Visible = "false">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("ITCApplicability")%>' ID="lblITCApplicability" ToolTip="ITC Applicability"></asp:Label>
                                                                            <asp:HiddenField ID="hdnITCApplicabilityId" runat="server" Value='<%#Eval("ITCApplicability_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlITCApplicabilityF" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                                </asp:DropDownList> 
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    

                                                                    <asp:TemplateField HeaderText="Taxable Amount(Excl. VAT)" ItemStyle-HorizontalAlign="Right" Visible = "false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount1" runat="server" Width="90px" Style="text-align: right" ToolTip="Amount" Text='<%#Eval("AMOUNT")%>'></asp:Label>
                                                                            <asp:Label ID="txtAmountL" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtamtF" runat="server" Width="90px" ReadOnly="true" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate> 
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Rate" ItemStyle-HorizontalAlign="Right" Visible = "false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                            <asp:Label ID="txtTAXPERCENTAGE" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                        </FooterTemplate> 
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="VAT Amount" ItemStyle-HorizontalAlign="Right" Visible = "false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNT" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                            <asp:Label ID="txtTAXAMOUNT" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNTF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                        </FooterTemplate> 
                                                                    </asp:TemplateField>
                                                                 
                                                                    
                                                                    <asp:TemplateField HeaderText="Total Amount"  HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                 <asp:Label ID="lblTotAmount" runat="server" Text='<%#Eval("TotalAmount")%>' ></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="DIM1" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("Dimension1_Code") %>' />
                                                                            <asp:Label runat="server" Text='<%#Eval("Dimension1_Desc")%>' ID="lblDDIM1" ToolTip="DIM1"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:DropDownList ID="TddlDim1" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                            <asp:HiddenField ID="hdn_Dim1" runat="server" Value="" />
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:DropDownList ID="TddlDim1" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                            <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("Dimension1_Code") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DIM2" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("Dimension2_Code") %>' />
                                                                            <asp:Label runat="server" Text='<%#Eval("Dimension2_Desc")%>' ID="lblDDIM2" ToolTip="DIM2"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value="" />
                                                                            <asp:DropDownList ID="TddlDim2" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("Dimension2_Code") %>' />
                                                                            <asp:DropDownList ID="TddlDim2" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                        </EditItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false" HeaderStyle-Width="5%" FooterStyle-Width="5%" ItemStyle-Width="5%">
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="lblDIM" runat="server" Text="DIM" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>

                                                                            <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show"
                                                                                ToolTip="Show DIM" />
                                                                            <%--      <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                    OnClick="lnk_Click1" ToolTip="Hide DIM" />--%>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show"
                                                                                ToolTip="Show DIM" />
                                                                            <%--  <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                    OnClick="lnk_Click1" ToolTip="Hide DIM" />--%>
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTran_det_Id1" runat="server" />
                                                                            <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show"
                                                                                ToolTip="Show DIM" />
                                                                            <%--  <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                    OnClick="lnk_Click1" ToolTip="Hide DIM" />--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderStyle-Width="5%" FooterStyle-Width="5%" ItemStyle-Width="5%" Visible="false">
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="lblDIMe" runat="server" Text="DIM" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTran_det_Id" runat="server" Visible="false" Text='<%#Eval("Tran_det_Id")%>' />
                                                                            <asp:ImageButton ID="imgbtn2" src="../Images/Dimm2.JPG" runat="server" OnClick="Show1"
                                                                                ToolTip="Show DIM" />

                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:ImageButton ID="imgbtn2" src="../Images/Dimm2.JPG" runat="server" OnClick="Show1"
                                                                                ToolTip="Show DIM" />

                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:ImageButton ID="imgbtn2" src="../Images/Dimm2.JPG" runat="server" OnClick="Show1F"
                                                                                ToolTip="Show DIM" />

                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Action">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="lnkRemove" ToolTip="Remove from the grid,Alt+E" AccessKey="E" runat="server" CausesValidation="false" OnClientClick="return confirm('Do you sure want to Remove?');"
                                                                                CommandName="Delete" Text="Remove" CssClass="grid_btn_delete"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <button class="grid_btn" id="lnkAdd" validationgroup="GridPayment" title="Alt+A" accesskey="A" runat="server" onserverclick="lnkAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                        <tr runat="server" id="Tr1" align="center">
                                                            <td align="center">
                                                                <table width="100%" class="stylePagingControl">
                                                                    <tr align="right" class="stylePagingControl">
                                                                        <td align="right" width="80%">
                                                                            <asp:Label ID="lblTotal" CssClass="styleDisplayLabel" runat="server" Text="Sub-Total"></asp:Label>
                                                                        </td>
                                                                        <td width="15%" align="right" colspan="2">
                                                                            <asp:Label ID="lblPaymentDetailsTotal" ToolTip="Total amount of payment details grid"
                                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                    </asp:Panel>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="PnlPaymentAdjustment" ToolTip="Payment Adjustment Informations" Width="99%"
                                                        runat="server" GroupingText="Payment Adjustment" CssClass="stylePanel">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ToolTip="Payment Adjustment grid" ShowFooter="true"
                                                                ID="grvPaymentAdjustment" Width="100%" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                                FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnRowDataBound="grvPaymentAdjustment_RowDataBound"
                                                                OnRowDeleting="grvPaymentAdjustment_RowDeleting" class="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Add or Less" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Left"
                                                                        FooterStyle-Width="5%" ItemStyle-Width="5%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAddOrLess" ToolTip="Add or Less" runat="server" Text='<%#Eval("AddOrLess")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFooterAddOrLess" AutoPostBack="true" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input"
                                                                                    OnSelectedIndexChanged="ddlFooterAddOrLess_SelectedIndexChanged" runat="server">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                    <asp:ListItem Value="1">Add</asp:ListItem>
                                                                                    <asp:ListItem Value="2">Less</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterAddOrLess" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPaymentadj" runat="server" ControlToValidate="ddlFooterAddOrLess"
                                                                                        InitialValue="0" ErrorMessage="Select Add/Less"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Section">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lbltdssectionID" Visible="false" ToolTip="Pay Type ID" runat="server" Text='<%#Eval("TDS_Section_Id")%>'></asp:Label>
                                                                            <asp:Label ID="lbltdssection" ToolTip="Pay Type Flow ID" runat="server" Text='<%#Eval("TDS_Section")%>'></asp:Label>
                                                                        </ItemTemplate>

                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Ref Doc No" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="15%"
                                                                        FooterStyle-Width="15%" ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRefNOID" Visible="false" ToolTip="Pay Type" Text='<%#Eval("Ref_NO_ID")%>' runat="server"></asp:Label>
                                                                            <asp:Label ID="lblRef_NO" ToolTip="Pay Type" Text='<%#Eval("Ref_NO")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlRef_NO" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlRef_NO_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>' ToolTip="Branch" />
                                                                            <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                            <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Branch ID" Visible="false" />
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location") %>' ToolTip="Branch" Visible="false" />
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlLocationF" runat="server" Width="100Px" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnSelectedIndexChanged="ddlLocationF_SelectedIndexChanged1"></asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">

                                                                                    <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="GridPaymentadj" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Activity">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" ToolTip="Activity"></asp:Label>
                                                                            <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>

                                                                            <div class="md-input" style="margin: 0px;">

                                                                                <asp:DropDownList ID="ddlActivityF" Width="120px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlActivityF_SelectedIndexChanged1">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">

                                                                                    <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="GridPaymentadj" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>


                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Pay Type" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="15%"
                                                                        FooterStyle-Width="15%" ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPayType" ToolTip="Pay Type" Text='<%#Eval("PayType")%>' runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFooterPayType" runat="server" OnSelectedIndexChanged="ddlFooterPayTypeA_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" onmouseover="ddl_itemchanged(this)">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Pay Type ID" Visible="false" HeaderStyle-Width="1%"
                                                                        FooterStyle-Width="1%" ItemStyle-Width="1%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPayTypeID" ToolTip="Pay Type ID" runat="server" Text='<%#Eval("PayTypeID")%>'></asp:Label>
                                                                            <asp:Label ID="lblPayTypeFlowID" ToolTip="Pay Type Flow ID" runat="server" Text='<%#Eval("PayTypeFlowID")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblFlowID" ToolTip="Pay Type ID" runat="server"></asp:Label>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="GL Account" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" Visible="false" ToolTip="GL Account" runat="server" Text='<%#Eval("GL_Code")%>'></asp:Label>
                                                                            <asp:Label ID="lblGLCodeDesc" ToolTip="GL Account" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlGLCodeF" class="md-form-control form-control" runat="server" ServiceMethod="GetPAGLCodeList" OnItem_Selected="ddlGLCodeFA_SelectedIndexChanged"
                                                                                    ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="GridPaymentadj" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>

                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SL Account" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSLCode" Visible="false" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Code")%>'></asp:Label>
                                                                            <asp:Label ID="lblSLCodeDesc" ToolTip="Account" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlSLCodeF" runat="server" ServiceMethod="GetPASLCodeList" ItemToValidate="Value" OnItem_Selected="ddlSLCodeF_Item_Selected1"
                                                                                    WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="GridPaymentadj" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>

                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <%-- <asp:TemplateField HeaderText="Description" HeaderStyle-Width="20%" FooterStyle-Width="20%"
                                                                            ItemStyle-Width="20%">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDescription" ToolTip="Description" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtFooterDescription" ToolTip="Description" TextMode="MultiLine"
                                                                                    Rows="2" Wrap="true" runat="server"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>--%>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Amount" HeaderStyle-Width="15%"
                                                                        FooterStyle-Width="15%" ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" ToolTip="Amount" runat="server" Text='<%#Eval("Amount")%>'
                                                                                Style="text-align: right"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFooterAmount" Width="85%" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    runat="server" MaxLength="15"></asp:TextBox>
                                                                                <asp:HiddenField ID="hdnfooteradjamt" runat="server" />
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtFooterAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPaymentadj" CssClass="validation_msg_box_sapn"
                                                                                        Display="Dynamic" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="AccNature" HeaderStyle-Width="15%"
                                                                        FooterStyle-Width="1%" ItemStyle-Width="1%" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_AccNature" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action" HeaderStyle-Width="9%" FooterStyle-Width="9%"
                                                                        ItemStyle-Width="9%">
                                                                        <ItemTemplate>

                                                                            <asp:Button ID="lnkRemove" ToolTip="Remove from the grid,Alt+R" AccessKey="R" runat="server" CommandName="Delete" OnClientClick="return confirm('Do you sure want to Remove?');"
                                                                                CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <button class="grid_btn" id="lnkAdd" validationgroup="GridPaymentadj" title="Alt+T" accesskey="T" runat="server" onserverclick="lnkAdd_PayAdj_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                        <tr runat="server" id="Tr2" align="center">
                                                            <td align="center">
                                                                <table width="100%" class="stylePagingControl">
                                                                    <tr align="right" class="stylePagingControl">
                                                                        <td align="right" width="80%">
                                                                            <asp:Label ID="Label3" CssClass="styleDisplayLabel" runat="server" Text="Sub Total"></asp:Label>
                                                                        </td>
                                                                        <td width="15%" align="right" colspan="2">
                                                                            <asp:Label ID="lblsubTotalPayadjmt" ToolTip="Sub Total amount of payment adjustment grid"
                                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        </table>
                                                    </asp:Panel>

                                                </div>
                                            </div>

                                            <tr runat="server" id="adjustmentGridtotal" align="center">
                                                <td align="center">
                                                    <table width="100%" class="stylePagingControl">
                                                        <tr align="right" class="stylePagingControl">
                                                            <td align="right" width="80%">
                                                                <asp:Label ID="lblPaymentAdjust" CssClass="styleDisplayLabel" runat="server" Text="Total"></asp:Label>
                                                            </td>
                                                            <td width="15%" align="right" colspan="2">
                                                                <asp:Label ID="lbltotalPaymentAdjust" ToolTip="Total amount of payment adjustment grid"
                                                                    CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TabPanelPBD" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Payment Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlBankDetails" runat="server" CssClass="stylePanel" GroupingText="Pay Bank Information">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlbankname" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control"
                                                                        OnSelectedIndexChanged="ddlbankname_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVBankname" runat="server" Display="Dynamic" ControlToValidate="ddlbankname"
                                                                            ValidationGroup="Print" InitialValue="0" ErrorMessage="Select Bank Name" CssClass="validation_msg_box_sapn"
                                                                            Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvbanknameC" runat="server" Display="Dynamic" ControlToValidate="ddlbankname"
                                                                            ValidationGroup="PrintC" ErrorMessage="Enter GL Code" CssClass="validation_msg_box_sapn"
                                                                            Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RFVBankNameSave" runat="server" Display="Dynamic" ControlToValidate="ddlbankname"
                                                                            ValidationGroup="Save" ErrorMessage="Select Bank Name" CssClass="validation_msg_box_sapn" InitialValue="0"
                                                                            Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblBankName" ToolTip="Bank Name" runat="server" Text="Bank Code/Name"
                                                                            CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlAcctNumber" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control"
                                                                        OnSelectedIndexChanged="ddlAcctNumber_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVAcctNumberC" runat="server" Display="Dynamic" ControlToValidate="ddlAcctNumber"
                                                                            ValidationGroup="PrintC" InitialValue="0" ErrorMessage="Select Account Number"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RFVAcctNumber" runat="server" Display="Dynamic" ControlToValidate="ddlAcctNumber"
                                                                            ValidationGroup="Print" InitialValue="0" ErrorMessage="Select Account Number"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblAcctnumber" ToolTip="Account Number" runat="server" Text="Account Number"
                                                                            CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtGLCode" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        ReadOnly="true" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtGLCode" runat="server" Display="Dynamic" ControlToValidate="txtGLCode"
                                                                            ValidationGroup="Print" ErrorMessage="Enter GL Code" CssClass="validation_msg_box_sapn"
                                                                            Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvtxtGLCodeC" runat="server" Display="Dynamic" ControlToValidate="txtGLCode"
                                                                            ValidationGroup="PrintC" ErrorMessage="Enter GL Code" CssClass="validation_msg_box_sapn"
                                                                            Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblGLcode" runat="server" ToolTip="GL Code" Text="Account" CssClass="styleReqFieldLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSLCode" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        ReadOnly="true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblSLcode" runat="server" ToolTip="SL Code" Text="Sub Account" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInstrumentNumber" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        ReadOnly="true" MaxLength="12" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtInstrumentNumber" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txtInstrumentNumber" ValidationGroup="Print" ErrorMessage="Enter Instrument Number"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="rfvtxtInstrumentNumberC" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txtInstrumentNumber" ValidationGroup="PrintC" ErrorMessage="Enter Instrument Number"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtInstrumentNumber"
                                                                        FilterType="Custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblInstrumentNumber" runat="server" ToolTip="Instrument Number" Text="Instrument Number"
                                                                            CssClass="styleReqFieldLabel" />
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInstrumentDate" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                        AutoPostBack="true" OnTextChanged="txtInstrumentDate_OnTextChanged" />
                                                                    <asp:HiddenField ID="hndInstrDate" runat="server" />

                                                                    <cc1:CalendarExtender ID="CEInstrumentDate" runat="server" Enabled="True" PopupButtonID="ImageInstrumentDate"
                                                                        TargetControlID="txtInstrumentDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxtInstrumentDate" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txtInstrumentDate" ValidationGroup="Print" ErrorMessage="Enter Instrument Date"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblInstrumentDate" runat="server" ToolTip="Instrument Date" Text="Instrument Date"
                                                                            CssClass="styleReqFieldLabel" />
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInstrumentAmount" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                        MaxLength="12" Style="text-align: right" ReadOnly="true" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVtxtInstrumentAmount1" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txtInstrumentAmount" ValidationGroup="Print" ErrorMessage="Enter Instrument Amount"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator ID="RFVtxtInstrumentAmount2" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txtInstrumentAmount" ValidationGroup="PrintC" ErrorMessage="Enter Instrument Amount"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtInstrumentAmount" runat="server" TargetControlID="txtInstrumentAmount"
                                                                        FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblInstrumentAmount" runat="server" ToolTip="Instrument Amount" Text="Instrument Amount"
                                                                            CssClass="styleReqFieldLabel" />
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFavouringName" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvfavouringname" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" InitialValue="" ControlToValidate="txtFavouringName"
                                                                            ErrorMessage="Enter Favouring Name" ValidationGroup="Save"> </asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblFavouringName" runat="server" ToolTip="Favouring Name" Text="Favouring Name"
                                                                            CssClass="styleDisplayLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="chkHoldcheque" runat="server" Text="Hold Cheque" OnCheckedChanged="chkHoldcheque_CheckedChanged" AutoPostBack="true" />
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlHoldCheque" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlHoldCheque_SelectedIndexChanged"
                                                                        AutoPostBack="true">
                                                                    </asp:DropDownList>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblHoldcheque" ToolTip="Hold Cheque" runat="server" Text="Hold Cheque(s)"
                                                                            CssClass="styleDisplayLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="chkReplaceInstrument" runat="server" Text="Cheque replace" Visible="false" AutoPostBack="true" OnCheckedChanged="chkReplaceInstrument_CheckedChanged" />


                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <button class="css_btn_enabled" id="btnupdatecheque" title="UpdateCheque[Alt+U]" onclick="if(fnConfirmInstrumentUpdate())" causesvalidation="false" onserverclick="btnupdatecheque_ServerClick" runat="server"
                                                                    type="button" accesskey="U">
                                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>U</u>pdate cheque
                                                                </button>

                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTransferDate" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                        AutoPostBack="true" />
                                                                    <asp:HiddenField ID="HiddenField1" runat="server" />

                                                                    <cc1:CalendarExtender ID="calTransferDate" runat="server" Enabled="True" PopupButtonID="imgTransferDate"
                                                                        TargetControlID="txtTransferDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvTransferDate" runat="server" Display="Dynamic"
                                                                            ControlToValidate="txtTransferDate" ValidationGroup="Save" ErrorMessage="Enter Transfer Date"
                                                                            CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTransferDate" runat="server" ToolTip="Transfer Date" Text="Transfer Date"
                                                                            CssClass="styleDisplayLabel" />
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlTransferType" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">

                                                                        <asp:RequiredFieldValidator ID="rfvTransferType" runat="server" Display="Dynamic" ControlToValidate="ddlTransferType"
                                                                            ValidationGroup="Save" ErrorMessage="Select Transfer Type" CssClass="validation_msg_box_sapn" InitialValue="0"
                                                                            Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTransferType" ToolTip="Transfer Type" runat="server" Text="Transfer Type"
                                                                            CssClass="styleDisplayLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtChequeprintStatus" runat="server" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblchequeprint" runat="server" ToolTip="Cheque print Status" Text="Cheque Print Status"
                                                                            CssClass="styleDisplayLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>





                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlCashDetails" runat="server" CssClass="stylePanel" GroupingText="Pay Cash Information">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlcashGLAccount" runat="server" AutoPostBack="true" class="md-form-control form-control" onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddlcashGLAccount_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVddlcashGLAccount" runat="server" ControlToValidate="ddlcashGLAccount" CssClass="validation_msg_box_sapn"
                                                                            Display="Dynamic" Enabled="false" ErrorMessage="Select Cash Account Number" InitialValue="0" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblcashGLAccount" runat="server" CssClass="styleReqFieldLabel" Text="Cash Account Number" ToolTip="Cash GL Account" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlcashSLAccount" runat="server" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVddlcashSLAccount" runat="server" ControlToValidate="ddlcashSLAccount" CssClass="validation_msg_box_sapn" Display="Dynamic" Enabled="false" ErrorMessage="Select Cash Sub Account Number" InitialValue="0" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblcashSubAccount" runat="server" CssClass="styleReqFieldLabel" Text="Sub Account Number" ToolTip=" Cash Sub Account" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtcashFavouringName" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" Enabled="false" InitialValue="" ControlToValidate="txtcashFavouringName"
                                                                            ErrorMessage="Enter Favouring Name" ValidationGroup="Save"> </asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="Label4" runat="server" ToolTip="Favouring Name" Text="Favouring Name"
                                                                            CssClass="styleDisplayLabel" />
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:Button ID="btncashpaid" runat="server" CssClass="styleGridShortButton" OnClick="btncashpaid_Click" Text="Paid Cash" ToolTip="paid cash" Visible="false" />
                                                            </div>
                                                        </div>


                                                    </asp:Panel>
                                                </div>
                                            </div>


                                            <div>
                                                <asp:ValidationSummary ValidationGroup="Print" ID="ValidationSummary4" runat="server" Visible="false"
                                                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TPOthers" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Others
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="PnlOthers" runat="server" GroupingText="Funder Information" CssClass="stylePanel"
                                                        Width="99%">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ToolTip="Funder Details" ShowFooter="true" ID="grvFunder" CssClass="gird_details"
                                                                Width="100%" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                                FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="grvFunder_RowCommand"
                                                                OnRowDeleting="grvFunder_RowDeleting" OnRowDataBound="grvFunder_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Funder Ref No." ItemStyle-HorizontalAlign="Left" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderRefNo" ToolTip="Funder Ref. Number" Text='<%#Eval("FunderRefNo")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFunderRefNo" onmouseover="ddl_itemchanged(this)" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFunderRefNo_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlFunderRefNo" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlFunderRefNo" InitialValue="0" ValidationGroup="FunderAdd"
                                                                                        ErrorMessage="Select Funder Ref No" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="10%" FooterStyle-Width="10%"
                                                                        FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlDueDate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDueDate_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlduedate" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlDueDate" InitialValue="0" ValidationGroup="FunderAdd"
                                                                                        ErrorMessage="Select Due Date" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("Due_Date") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                        ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtRemarks" TextMode="MultiLine" ReadOnly="true" Text='<%# Bind("Deal_Remarks") %>' runat="server"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtRemarksF" TextMode="MultiLine" class="md-form-control form-control login_form_content_input lowercase"
                                                                                    runat="server" ReadOnly="true" MaxLength="100" onkeyup="maxlengthfortxt(100);"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Funder Name" ItemStyle-HorizontalAlign="Left" FooterStyle-Width="10%"
                                                                        ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderName" ToolTip="Funder Name" Text='<%#Eval("Name")%>' Width="100%"
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFunderName" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    runat="server" ReadOnly="true"></asp:TextBox>

                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFunderName" runat="server" Display="Dynamic" ControlToValidate="txtFunderName"
                                                                                        ValidationGroup="FunderAdd" ErrorMessage="Enter Funder Name" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Funder Repayment" ItemStyle-HorizontalAlign="Left"
                                                                        FooterStyle-Width="10%" ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderRepayment" ToolTip="Funder Repayment" Text='<%#Eval("Repayment")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFunderRepayment" onmouseover="ddl_itemchanged(this)" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFunderRepayment_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                    <asp:ListItem Value="1">Loan</asp:ListItem>
                                                                                    <asp:ListItem Value="2">Interest</asp:ListItem>
                                                                                    <asp:ListItem Value="3">Others</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlFunderRepayment" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="ddlFunderRepayment" InitialValue="0" ValidationGroup="FunderAdd"
                                                                                        ErrorMessage="Select Funder Repayment" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount" FooterStyle-Width="15%" ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFunderAmount" Style="text-align: right" ToolTip="Amount" Width="100%"
                                                                                runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFunderAmount" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    MaxLength="12" runat="server"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                                <asp:HiddenField ID="hdnfunderamount" runat="server" />
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="RFVtxtFunderAmount" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="txtFunderAmount" ValidationGroup="FunderAdd" ErrorMessage="Enter Funder Amount"
                                                                                        CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Tax Section" ItemStyle-HorizontalAlign="Left" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTaxsection" ToolTip="Tax section" Text='<%#Eval("Tax_Section")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                            <asp:Label ID="lblTaxsectionID" ToolTip="Tax section" Visible="false" Text='<%#Eval("Tax_Section_ID")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlTaxsection" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input"
                                                                                    runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTaxsection_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Amount" FooterStyle-Width="15%" ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTaxAmount" Style="text-align: right" ToolTip="Amount" Width="100%"
                                                                                runat="server" Text='<%#Eval("Tax_Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtTaxamount" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" CssClass="md-form-control form-control login_form_content_input"
                                                                                    Width="75%" MaxLength="12" runat="server"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="lnkFunderRemove" ToolTip="Remove from the grid,Alt+M" AccessKey="M" runat="server" CommandName="Delete"
                                                                                CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="lnkFunderAdd" ToolTip="Add to the grid,Alt+W" AccessKey="W" runat="server" ValidationGroup="FunderAdd"
                                                                                Text="Add" CommandName="Add" CssClass="grid_btn"></asp:Button>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlInvestment" Visible="false" runat="server" GroupingText="Investment" CssClass="stylePanel"
                                                        Width="99%">
                                                        <asp:GridView runat="server" ToolTip="Investment Details" ShowFooter="true" ID="grvInvestment"
                                                            Width="100%" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                            FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="grvInvestment_RowCommand"
                                                            OnRowDeleting="grvInvestment_RowDeleting" OnRowDataBound="grvInvestment_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Investment Sequence No." ItemStyle-HorizontalAlign="Left"
                                                                    FooterStyle-Width="25%" ItemStyle-Width="25%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvestmentSeqNo" ToolTip="Investment Sequence No." Text='<%#Eval("SequenceNo")%>'
                                                                            Width="100%" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlInvestmentSeqNo" onmouseover="ddl_itemchanged(this)" runat="server"
                                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlInvestmentSeqNo_SelectedIndexChanged">
                                                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:RequiredFieldValidator ID="rfvddlInvestmentSeqNo" runat="server" Display="None"
                                                                            ControlToValidate="ddlInvestmentSeqNo" InitialValue="0" ValidationGroup="InvesmentAdd"
                                                                            ErrorMessage="Select Investment Sequence No" CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Investment Description" ItemStyle-HorizontalAlign="Left"
                                                                    FooterStyle-Width="25%" ItemStyle-Width="25%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvestmentDes" ToolTip="Investment Description" Text='<%#Eval("Description")%>'
                                                                            Width="100%" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtInvestmentDes" TextMode="MultiLine" Width="75%" Wrap="true" MaxLength="60"
                                                                            onmouseover="txt_MouseoverTooltip(this)" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RFVtxtInvestmentDes" runat="server" Display="None"
                                                                            ControlToValidate="txtInvestmentDes" ValidationGroup="InvesmentAdd" ErrorMessage="Enter Investment Description"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Investment Type" ItemStyle-HorizontalAlign="Left"
                                                                    FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvestmentType" ToolTip="Investment Type" Text='<%#Eval("Type")%>'
                                                                            Width="100%" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblInvestmentTypeF" ToolTip="Investment Type" Width="75%" runat="server"></asp:Label>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount" FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvesmentAmount" ToolTip="Amount" Style="text-align: right" Width="100%"
                                                                            runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtInvesmentAmount" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right"
                                                                            Width="75%" MaxLength="12" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RFVtxtInvesmentAmount" runat="server" Display="None"
                                                                            ControlToValidate="txtInvesmentAmount" ValidationGroup="InvesmentAdd" ErrorMessage="Enter Investment Amount"
                                                                            CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" FooterStyle-Width="10%" ItemStyle-Width="10%">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="lnkInvesmentRemove" ToolTip="Remove from the grid" runat="server"
                                                                            CommandName="Delete" CausesValidation="false" Text="Remove" CssClass="styleGridShortButton"></asp:Button>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="lnkInvesmentAdd" ToolTip="Add to the grid,Alt+U" AccessKey="U" runat="server" ValidationGroup="InvesmentAdd"
                                                                            Text="Add" CommandName="Add" CssClass="styleGridShortButton"></asp:Button>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="PnlDimension" Visible="false" runat="server" GroupingText="Dimension" CssClass="stylePanel">
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="styleReqFieldLabel" width="15%">
                                                                    <%--<span class="styleReqFieldLabel">Dimension1</span>--%>
                                                                    <asp:Label ID="lblHDIM1" runat="server" Text="Dimension1" />
                                                                </td>
                                                                <td class="styleFieldAlign" width="30%">
                                                                    <asp:DropDownList ID="ddlHeadDim1" runat="server" Width="170px" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:HiddenField ID="hdn_HDIM1" runat="server" />
                                                                    <%--  <asp:Button ID="btn_HDIM1" Text="" runat="server" Style="display: none" OnClick="btnLocationChange_Click" />--%>
                                                                    <asp:RequiredFieldValidator ID="rfvHDIM1" runat="server" ControlToValidate="ddlHeadDim1"
                                                                        InitialValue="0" Enabled="false" ErrorMessage="Select Dimension1" Display="None"
                                                                        SetFocusOnError="True" ValidationGroup="Main" />
                                                                </td>
                                                                <td class="styleReqFieldLabel" width="15%">
                                                                    <%-- <span class="styleReqFieldLabel">Dimension2</span>--%>
                                                                    <asp:Label ID="lblHDIM2" runat="server" Text="Dimension2" />
                                                                </td>
                                                                <td class="styleFieldAlign" width="30%">
                                                                    <asp:DropDownList ID="ddlHeadDim2" Width="170px" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlHeadDim2_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:HiddenField ID="hdn_HDIM2" Value="" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="rfvHDIM2" runat="server" ControlToValidate="ddlHeadDim2"
                                                                        InitialValue="0" Enabled="false" ErrorMessage="Select Dimension2" Display="None"
                                                                        SetFocusOnError="True" ValidationGroup="Main" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:HiddenField ID="hdn_DIM1_Type" runat="server" />
                                                        <asp:HiddenField ID="hdn_DIM2_Type" runat="server" />
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlLetterNo" runat="server" CssClass="stylePanel" GroupingText="Letter Number">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">


                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtLetterNumber" runat="server" ToolTip="Letter Number" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblLetterNumber" Text="Letter Number"></asp:Label>
                                                                    </label>
                                                                </div>



                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlReportType" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlReportType_OnSelectedIndexChanged" onchange="fnOnChange(this);" ToolTip="Report Type" Visible="false" AutoPostBack="true">
                                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Transfer of funds to overseas banks" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Transfer of funds to local banks" Value="2"></asp:ListItem>

                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblReportType" CssClass="styleReqFieldLabel" Text="Report Type" Visible="false"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>

                                            <div>
                                                <asp:Button ID="imgCheque" ToolTip="Print Cheque,ALt+P" AccessKey="P" Visible="false" runat="server"
                                                    OnClick="PrintCheque_Click" CssClass="grid_btn" CausesValidation="false"
                                                    Text="Print Cheque" />
                                                &nbsp;
                <asp:Button ID="imgCoveringLetter" ToolTip="Covering Letter,Alt+C" AccessKey="C" Visible="false" runat="server"
                    OnClick="PrintCoveringLetter_Click" Text="Covering Letter" CssClass="grid_btn"
                    CausesValidation="false" />

                                            </div>



                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlOverseasBankDetail" runat="server" CssClass="stylePanel" GroupingText="Overseas Bank Details">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtForexamount" runat="server" ToolTip="Forex amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblForexamount" Text="Forex amount"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDealref" runat="server" ToolTip="Deal ref" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblDealref" Text="Deal ref"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtIBANNO" runat="server" ToolTip="IBAN NO" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblIBANNO" Text="IBAN NO"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSwiftCodeNo" runat="server" ToolTip="Swift Code No" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblSwiftCodeNo" Text="Swift Code No"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtRef" runat="server" ToolTip="Ref." class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblRef" Text="Ref."></asp:Label>
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
                        </cc1:TabContainer>
                    </div>

                </div>
                  <div style="display: none" class="row">
                    <div class="col">
                        <iframe id="MyIframeOpenFile" visible="false" src="~/Common/S3GViewFileCheckList.aspx" runat="server" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100px; height: 21px;" allowtransparency="true"></iframe>
                    </div>
                </div>
            </div>

            <%--<div class="btn_height"></div>--%>
            <div align="right">
                <asp:HiddenField ID="hdndocexists" runat="server" />

                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" 
                    causesvalidation="false" validationgroup="Save" onserverclick="btnSave_Click"
                    runat="server"
                    type="button" accesskey="S">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>

                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" 
                    causesvalidation="false" onserverclick="btnClear_ServerClick" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>

                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" 
                    causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>

                <%--<asp:Button ID="btnPrint" OnClick="btnPrint_Click" runat="server" />--%>


                <button class="css_btn_enabled" id="btnCancelPayment" title="Payment Cancel[Alt+C]" 
                    onclick="if(fnConfirmCancelPayment())" causesvalidation="false" onserverclick="btnCancelPayment_Click" runat="server"
                    type="button" accesskey="C">
                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;Payment <u>C</u>ancel
                </button>
                <button class="css_btn_enabled" id="btnReport" title="Report[Alt+R]" causesvalidation="false" onserverclick="btnReport_Click" runat="server"
                    type="button" accesskey="R" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>R</u>eport
                </button>
                <button class="css_btn_enabled" id="imgVoucher" title="Voucher[Alt+V]" visible="false" causesvalidation="false" onserverclick="PrintVoucher_Click" runat="server"
                    type="button" accesskey="V">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;Print <u>V</u>oucher
                </button>
                 <button class="css_btn_enabled" id="btnhdnprint" title="Voucher[Alt+V]" onserverclick="btnhdnprint_ServerClick" runat="server"
                    type="button" accesskey="V" style="display:none;">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;Print <u>V</u>oucher
                </button>

            </div>




            <div>
                <asp:HiddenField ID="hdnIB" runat="server" Value="0" />
            </div>
            <div>
                <asp:Button ID="BtnHide" runat="server" Style="display: none;" />
                <cc1:ModalPopupExtender ID="mpeDimension" runat="server" TargetControlID="BtnHide"
                    PopupControlID="pnlDimension1" BackgroundCssClass="styleModalBackground" DropShadow="false" />
                <asp:Panel ID="pnlDimension1" runat="server" Width="40%" CssClass="stylePanel"
                    GroupingText="Dimension Details" Style="display: none; overflow: hidden;" BackColor="White"
                    BorderColor="WhiteSmoke">
                    <asp:UpdatePanel ID="pnlDim" runat="server">
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:GridView ID="grvDimGrid" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                            HeaderStyle-CssClass="styleGridHeader"
                                            FooterStyle-HorizontalAlign="Center" OnRowCommand="grvDimGrid_RowCommand"
                                            OnRowDeleting="grvDimGrid_RowDeleting" OnRowDataBound="grvDimGrid_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Tran_Det_Id" Visible="false" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                    FooterStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTran_Det_Id" ToolTip="Dim1" Text='<%#Eval("Tran_Det_Id")%>' Width="100%"
                                                            runat="server" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dim_Id" Visible="false" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                    FooterStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDim_Id" ToolTip="Dim_Id" Text='<%#Eval("Dim_Id")%>' Width="100%"
                                                            runat="server" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dim1" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                    FooterStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDim1" ToolTip="Dim1" Text='<%#Eval("Dim1")%>' Width="100%"
                                                            runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblDim1Desc" ToolTip="Dim1 Desc" Text='<%#Eval("Dim1_Desc")%>' Width="100%"
                                                            runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlDim1" runat="server"
                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged">
                                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvddlDim1" runat="server" Display="None" ControlToValidate="ddlDim1"
                                                            InitialValue="0" ValidationGroup="btnDimAdd" ErrorMessage="Select Dimension1"
                                                            CssClass="styleMandatoryLabel" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dim2" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%"
                                                    FooterStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDim2" ToolTip="Dim2" Text='<%#Eval("Dim2")%>' Width="100%"
                                                            runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblDim2Desc" ToolTip="Dim2 Desc" Text='<%#Eval("Dim2_Desc")%>' Width="100%"
                                                            runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlDim2" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvddlDim2" runat="server" Display="None" ControlToValidate="ddlDim2"
                                                            InitialValue="0" ValidationGroup="btnDimAdd" ErrorMessage="Select Dimension2"
                                                            CssClass="styleMandatoryLabel" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                    ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" ToolTip="Amount" Text='<%#Eval("Dim_Amount")%>' Width="100%"
                                                            runat="server" Style="text-align: right;"></asp:Label>
                                                        <%-- <asp:TextBox ID="txtAmount" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right"
                                                            MaxLength="15" runat="server" Text='<%#Eval("Amount")%>' OnTextChanged="Amount_TextChanged"
                                                            AutoPostBack="true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAmount" runat="server" TargetControlID="txtAmount"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>--%>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <%--<asp:Label ID="lblSLodeF" ToolTip="Pay Type ID" runat="server"></asp:Label>--%>
                                                        <asp:TextBox ID="txtFooterAmount" runat="server"
                                                            MaxLength="15" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtFooterAmount" runat="server" TargetControlID="txtFooterAmount"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="RFVtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                            SetFocusOnError="True" ValidationGroup="btnDimAdd" CssClass="styleMandatoryLabel"
                                                            Display="None" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action" FooterStyle-Width="10%" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Button ID="lnkDimRemove" ToolTip="Remove from the grid,Alt+R" AccessKey="R" runat="server"
                                                            CommandName="Delete" CausesValidation="false" Text="Remove" CssClass="styleGridShortButton"></asp:Button>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="lnkDimAdd" ToolTip="Add to the grid,Alt+O" AccessKey="O" runat="server" ValidationGroup="btnDimAdd"
                                                            Text="Add" CommandName="Add" CssClass="styleGridShortButton"></asp:Button>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">

                                        <asp:LinkButton ID="btnDimClose" runat="server" Text="Exit" CausesValidation="false"
                                            CssClass="styleGridShortButton" OnClick="btnDimClose_Click" />
                                        <asp:ValidationSummary ValidationGroup="btnDimAdd" ID="ValidationSummary8" runat="server" Visible="false"
                                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CustomValidator ID="CVDim" runat="server" CssClass="styleMandatoryLabel"
                                            Enabled="true" /></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>


            </div>
            <div>
                <asp:CustomValidator ID="CVPaymentRequest" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" />


                <asp:ValidationSummary ValidationGroup="Save" ID="vs_PaymentRequest" runat="server" Visible="true"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

                <asp:ValidationSummary ValidationGroup="btngo" ID="ValidationSummary5" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

                <asp:ValidationSummary ValidationGroup="GridPayment" ID="ValidationSummary1" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

                <asp:ValidationSummary ValidationGroup="GridPaymentadj" ID="ValidationSummary2" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

                <asp:ValidationSummary ValidationGroup="Print" ID="ValidationSummary3" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

                <asp:ValidationSummary ValidationGroup="FunderAdd" ID="ValidationSummary6" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

                <asp:ValidationSummary ValidationGroup="InvesmentAdd" ID="ValidationSummary7" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
            </div>

        </ContentTemplate>
        <Triggers>
            <%--<asp:PostBackTrigger ControlID="imgVoucher" />--%>
            <asp:PostBackTrigger ControlID="btnReport" />
            <asp:PostBackTrigger ControlID="btnSave" />
             <asp:PostBackTrigger ControlID="btnhdnprint" />


        </Triggers>
    </asp:UpdatePanel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />

    <asp:Label ID="lblCashDenoPop" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeCashDenoPop" runat="server" PopupControlID="dvInstallmentPop" TargetControlID="lblCashDenoPop"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInstallmentPop" style="display: none; width: 50%; height: 50%;">
        <div id="Div3" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
            <asp:ImageButton ID="imglblCashDenoPopPop" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imglblCashDenoPop_Click" />
        </div>
        <div>
            <asp:Panel ID="pnllblCashDenoPop" GroupingText="Cash Denomination Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updCashDenoPop" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 250px;">
                            <div>
                                <div class="row">
                                    <div class="gird">
                                        <asp:GridView ID="grvCashDenomination" runat="server" Width="100%" AutoGenerateColumns="false"
                                            RowStyle-HorizontalAlign="Center" ShowFooter="true" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="COMMON LOOKUP ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCOMMON_LOOKUP_ID" runat="server" Text='<%# Bind("COMMON_LOOKUP_ID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblCOMMON_CODE" runat="server" Text='<%# Bind("COMMON_CODE") %>' onmouseover="txt_MouseoverTooltip(this)"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RO" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCOMMON_FLAG" runat="server" Text='<%# Bind("COMMON_FLAG") %>' onmouseover="txt_MouseoverTooltip(this)"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="left">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtCOMMON_DESCRIPTION" runat="server" Text='<%# Bind("COMMON_DESCRIPTION") %>' Enabled="false" onmouseover="txt_MouseoverTooltip(this)"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Numbers" ItemStyle-HorizontalAlign="left">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtNumbers" runat="server" Text='<%# Bind("Numbers") %>' OnTextChanged="txtNumbers_TextChanged" onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="NumbersFileterExtndr" runat="server" TargetControlID="txtNumbers"
                                                            FilterType="Numbers,Custom" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotalDenAmount" runat="server" Text="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtCurrTOTAL_AMOUNT" runat="server" Text='<%# Bind("TOTAL_AMOUNT") %>' onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true"
                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="AmountFileterExtndr" runat="server" TargetControlID="txtCurrTOTAL_AMOUNT"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotDinAmount" runat="server" ReadOnly="true" onmouseover="txt_MouseoverTooltip(this)"
                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="AmountFileterExtndr" runat="server" TargetControlID="txtTotDinAmount"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row" align="center">

                                    <div align="center">
                                        <button class="css_btn_enabled" id="btnCashOk" title="Ok[Alt+O]" causesvalidation="false"
                                            onserverclick="btnCashOk_Click" runat="server"
                                            type="button" accesskey="o">
                                            <i class="fa fa-check" aria-hidden="true"></i>&emsp;<u>O</u>k
                                        </button>
                                    </div>

                                    <div align="center">
                                        <button class="css_btn_enabled" id="btnCashCancel" title="Close[Alt+C]" causesvalidation="false"
                                            onserverclick="btnCashCancel_Click" runat="server"
                                            type="button" accesskey="C">
                                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>lose
                                        </button>
                                    </div>

                                </div>
                            </div>


                            <%-- <div class="row">
                                    <asp:Button runat="server" ID="btnCashOk" CausesValidation="false"
                                        OnClick="btnCashOk_Click" Text="Ok" CssClass="grid_btn" />&nbsp;
                                        <asp:Button runat="server" ID="btnCashCancel" CausesValidation="false"
                                            OnClick="btnCashCancel_Click" Text="Exit" CssClass="grid_btn" />
                                </div>--%>
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>

    <script type="text/javascript" language="javascript">

        function fnConfirmInstrumentUpdate() {
            if (confirm('Do you want to Update Instrument Number?'))
                return true;
            else
                return false;
        }

        function fnConfirmCancelPayment() {

            if (confirm('Do you want to cancel Payment?')) {
                return true;
            }
            else
                return false;

        }

        function checkValueDate_NextSystemDate(sender, args) {

            debugger;
            var today = new Date();
            var currentyear = today.getYear();
            var currentmonth = today.getMonth() + 1;


            if (currentmonth > 3) {
                pastvalidyear = currentyear;
                futurevalidyear = currentyear + 1;

            }
            else {
                pastvalidyear = currentyear - 1;
                futurevalidyear = currentyear;

            }
            if ((sender._selectedDate.getMonth() + 1) > currentmonth && (sender._selectedDate.getYear() == currentyear))//Future month date cannot be selected
            {
                alert('You cannot select a date greater than the current month end and lesser than the current year');
                sender._textbox.set_Value(today.format(sender._format));
                return;
            }
            if (sender._selectedDate.getYear() == pastvalidyear || sender._selectedDate.getYear() == futurevalidyear) {
                if (sender._selectedDate.getYear() == futurevalidyear && (sender._selectedDate.getMonth() + 1) > 3) {
                    alert('You cannot select a date greater than the current month end and lesser than the current year');
                    sender._textbox.set_Value(today.format(sender._format));
                    return;
                }
                if (sender._selectedDate.getYear() == pastvalidyear && (sender._selectedDate.getMonth() + 1) <= 3) {
                    alert('You cannot select a date greater than the current month end and lesser than the current year');
                    sender._textbox.set_Value(today.format(sender._format));
                    return;
                }
            }
            else {
                alert('You cannot select a date greater than the current month end and lesser than the current year');
                sender._textbox.set_Value(today.format(sender._format));
                return;

            }

        }


        function checkInstDate_NextSystemDate(sender, args) {
            var today = new Date();
            if (sender._selectedDate > today) {
                alert('Selected date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));
            }
            else {
                var hndInstrDate = document.getElementById('<%=hndInstrDate.ClientID %>');
                var InstrDate = new Date();
                var duration = 90; //In Days

                if (hndInstrDate.value != null) {
                    if (hndInstrDate.value != '') {
                        duration = hndInstrDate.value;
                    }
                }
                InstrDate.setDate(InstrDate.getDate() - duration);
                if (sender._selectedDate <= InstrDate) {
                    alert('Selected date cannot be Lesser than instrument valid date');
                    sender._textbox.set_Value(today.format(sender._format));
                }
            }
        }


        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }



        function FuncheckZero(input) {
            if (input != null) {
                if (input.value != '') {
                    if (parseFloat(input.value) == 0) {
                        alert('Amount should be greater than zero');
                        input.value = '';
                        input.focus();
                    }
                }
            }

        }


        function funshowDim() {

            document.getElementById('ctl00_ContentPlaceHolder1_TCPaymentRequest_TPPaymentRequest_grvPaymentDetails_ctl03_btnDims').click();
            document.getElementById('ctl00_ContentPlaceHolder1_TCPaymentRequest_TPPaymentRequest_grvPaymentDetails_ctl03_cpeDimsDemo_ClientState').collapsed = !document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvAccount_ctl03_cpeDimsDemo_ClientState').collapsed;

        }


        function checkDate_NextSystemDate1(sender, args) {
            var today = new Date();
            if (sender._selectedDate > today) {

                //alert('You cannot select a date greater than system date');
                alert('Value Date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));

            }
            document.getElementById(sender._textbox._element.id).focus();

        }
        function fnOnChange(dropdown) {
            var myindex = dropdown.selectedIndex;
            var SelValue = dropdown.options[myindex].value;
        }


        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_TCPaymentRequest');




            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                if (btnActive_index != 0) {
                    newindex = btnActive_index - 1;
                }
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {


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
            else {
                tab.set_activeTabIndex(newindex);

                var TC = $find("<%=TCPaymentRequest.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlActivity.ClientID %>").focus();

                }


            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=TCPaymentRequest.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlActivity.ClientID %>").focus();

            }

            tab = $find('ctl00_ContentPlaceHolder1_TCPaymentRequest');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                debugger;
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);
                    btnActive_index = 0;
                    return;
                }
            }

        }

    </script>

</asp:Content>
