<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAReceiptProcessing_Add, App_Web_jj5zdzwe" title="Untitled Page" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagPrefix="cc1" TagName="Address" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagPrefix="cc1" TagName="LOV" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Receipt Processing" ID="lblHeading" CssClass="styleDisplayLabel"> 
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcReceipt" runat="server" CssClass="styleTabPanel" ScrollBars="None"
                                Width="100%" ActiveTabIndex="0" AutoPostBack="false">


                                <cc1:TabPanel ID="TabMainPage" runat="server" BackColor="Red" CssClass="tabpan" HeaderText="General">
                                    <HeaderTemplate>
                                        General
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="PnlReceiptInfo" runat="server" GroupingText="Receipt Information"
                                                                    CssClass="stylePanel">
                                                                    <div class="row">

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlActivity" runat="server" AutoPostBack="true"
                                                                                    onmouseover="ddl_itemchanged(this)" class="md-form-control form-control" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvActivity" CssClass="validation_msg_box_sapn" runat="server"
                                                                                        SetFocusOnError="true" InitialValue="0" ControlToValidate="ddlActivity" Text="Select the Activity"
                                                                                        ErrorMessage="Select the Activity" Display="Dynamic" ValidationGroup="BtnSave">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblActivity" CssClass="styleDisplaylabel" Text="Activity"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtDocumentNumber" runat="server" onmouseover="txt_MouseoverTooltip(this)" TabIndex="-1"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblDocumentNumber" CssClass="styleDisplaylabel" Text="Document Number"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"
                                                                                    onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                                </asp:DropDownList>

                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Branch"
                                                                                        InitialValue="0" SetFocusOnError="true" ValidationGroup="BtnSave">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblLocation" CssClass="styleDisplaylabel" Text="Branch"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtDocumentDate" OnTextChanged="txtDocDate_TextChanged" AutoPostBack="true"
                                                                                    runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="ceDocumentDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                                    PopupButtonID="imgDocumentDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                                    TargetControlID="txtDocumentDate">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:Image ID="imgDocumentDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvDocumentDate" runat="server" ControlToValidate="txtDocumentDate"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Document Date"
                                                                                        SetFocusOnError="True" ValidationGroup="BtnSave">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label class="tess">
                                                                                    <asp:Label runat="server" ID="lblDocumentDate" CssClass="styleDisplaylabel" Text="Document Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlEntityType" AutoPostBack="true" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                                    OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged" class="md-form-control form-control">
                                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvEntityType" runat="server" ControlToValidate="ddlEntityType"
                                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select the Entity type" InitialValue="0"
                                                                                        ValidationGroup="BtnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblEntityType" CssClass="styleDisplaylabel" Text="EntityType/General"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtValueDate"
                                                                                    runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="ceValueDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                                    PopupButtonID="imgValueDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                                    TargetControlID="txtValueDate">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:Image ID="imgValueDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvValueDate" runat="server" ControlToValidate="txtValueDate"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Value Date"
                                                                                        SetFocusOnError="True" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblValueDate" CssClass="styleDisplaylabel" Text="Value Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlPaymentMode" AutoPostBack="true" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                                    OnSelectedIndexChanged="ddlPaymentMode_SelectedIndexChanged">
                                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvMode" runat="server" ControlToValidate="ddlPaymentMode"
                                                                                        Display="Dynamic" ErrorMessage="Select the Mode" SetFocusOnError="true" InitialValue="0"
                                                                                        ValidationGroup="BtnSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblMode" CssClass="styleDisplaylabel" Text="Mode"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>



                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlCurrencyName" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCurrencyName_SelectedIndexChanged"
                                                                                    class="md-form-control form-control">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvCurrencyCode" runat="server" ControlToValidate="ddlCurrencyName"
                                                                                    CssClass="grid_validation_msg_box" Display="Dynamic" ErrorMessage="Enter the Currency Name/Code"
                                                                                    InitialValue="0" SetFocusOnError="true" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblCurrencyName" CssClass="styleDisplaylabel" Text="Currency"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtDocumentAmount" runat="server" Style="text-align: left;" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtDocumentAmount_TextChanged" AutoPostBack="true"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvDocAmount" runat="server" ControlToValidate="txtDocumentAmount"
                                                                                        CssClass="grid_validation_msg_box" Display="Dynamic" ErrorMessage="Enter the Document Amount"
                                                                                        InitialValue="" SetFocusOnError="true" ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtDocumentAmount" runat="server" TargetControlID="txtDocumentAmount"
                                                                                    ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblDocumentAmount" CssClass="styleDisplaylabel" Text="Document Amount"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAuthorizationDate" runat="server" ContentEditable="false"
                                                                                    onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAuthorizationDate" CssClass="styleDisplaylabel" Text="Authorization Date"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:CheckBox ID="chkIRS" runat="server" AutoPostBack="true" OnCheckedChanged="chkIRS_OnCheckedChanged" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                                <asp:Label runat="server" ID="lblIRSReceipt" CssClass="styleDisplaylabel" Text="IRS Receipt"></asp:Label>

                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAuthorizationStatus" runat="server" ReadOnly="true"
                                                                                    onmouseover="txt_MouseoverTooltip(this)"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblAuthorizationStatus" CssClass="styleDisplaylabel" Text="Authorization Status"></asp:Label>

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

                                                                                <uc2:LOV ID="ucEntityLOV" Enabled="false" onblur="fnLoadEntity()" LOV_Code="FAENT" AutoPostBack="true" runat="server" DispalyContent="Name" ServiceMethod="GetEntityFunder" ShowHideAddressImageButton="false" HoverMenuExtenderLeft="true" OnItem_Selected="ucLov_Item_Selected" />
                                                                                <asp:Button ID="btnLoadCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                                                    Style="display: none;" OnClick="btnLoadCustomer_OnClick" CssClass="styleSubmitShortButton"
                                                                                    CausesValidation="false" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtCode" CssClass="validation_msg_box_sapn"
                                                                                        runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Entity/Funder"
                                                                                        ValidationGroup="BtnSave"></asp:RequiredFieldValidator>
                                                                                </div>

                                                                                <asp:HiddenField ID="hdnEntityID" runat="server" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <%--<asp:Button ID="btnLoadCustomer" runat="server" OnClick="btnLoadCustomer_OnClick"
                                                                            Style="display: none;" ToolTip="Load Customer" Text="Load Customer" CausesValidation="false" />
                                                                        <cc1:LOV ButtonEnabled="true" TextWidth="70%" LOV_Code="ENTREC" DispalyContent="Code"
                                                                            runat="server" ID="ucEntityLOV"></cc1:LOV>
                                                                       
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>--%>
                                                                                <label>
                                                                                    <asp:Label runat="server" ID="lblEntityCode" Text="Entity Code" CssClass="styleDisplayLabel"></asp:Label>
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
                                                                                <asp:DropDownList ID="ddlReferenceType" runat="server" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control" OnSelectedIndexChanged="ddlReferenceType_SelectedIndexChanged"
                                                                                    AutoPostBack="true">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="rfvReferenceType" CssClass="validation_msg_box_sapn" Enabled="false"
                                                                                        runat="server" SetFocusOnError="True" ValidationGroup="BtnSave" InitialValue="0" ControlToValidate="ddlReferenceType"
                                                                                        ErrorMessage="Select Reference Type"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" Text="Reference Type" ID="lblReferenceType" CssClass="styleReqFieldLabel"
                                                                                        ToolTip="Reference Type"></asp:Label>

                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtreceivedFrom" runat="server" ToolTip="Received From" MaxLength="50"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="rfvrecfrom" CssClass="validation_msg_box_sapn" Enabled="false"
                                                                                        runat="server" SetFocusOnError="True" ValidationGroup="BtnSave" InitialValue="" ControlToValidate="txtreceivedFrom"
                                                                                        ErrorMessage="Enter Received From"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <label>
                                                                                    <asp:Label ID="lblReceivedfrom" runat="server" Text="Received From" CssClass="styleDisplayLabel"></asp:Label>

                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtRecaddress" runat="server" ToolTip="Received Address" TextMode="MultiLine" onkeyup="maxlengthfortxt(100);"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="rfvrecaddress" CssClass="validation_msg_box_sapn" Enabled="false"
                                                                                        runat="server" SetFocusOnError="True" ValidationGroup="BtnSave" InitialValue="" ControlToValidate="txtRecaddress"
                                                                                        ErrorMessage="Enter Received Address"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblRecAddress" runat="server" Text="Address" CssClass="styleDisplayLabel"></asp:Label>

                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <UC:Suggest ID="ddlpostalcode" class="md-form-control form-control" runat="server" ValidationGroup="BtnSave"
                                                                                    ErrorMessage="Select postal Code" IsMandatory="false" ServiceMethod="GetPostalcode" AutoPostBack="true" />

                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code" CssClass="styleDisplayLabel"></asp:Label>

                                                                                </label>
                                                                            </div>
                                                                        </div>


                                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <button class="css_btn_enabled" id="btnCashDeposit" title="Cash Denomination[Alt+D]"
                                                                                    causesvalidation="false" onserverclick="btnCashDeposit_OnClick" runat="server"
                                                                                    type="button" accesskey="D">
                                                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Cash <u>D</u>enomination
                                                                                </button>
                                                                            </div>
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
                                                                                RowStyle-HorizontalAlign="Center" ShowFooter="false" ToolTip="Invoice Details" Width="100%"
                                                                                OnRowDataBound="grvInvoice_RowDataBound" CssClass="gird_details">
                                                                                <Columns>
                                                                                    <asp:TemplateField FooterStyle-Width="25%" HeaderText="Reference Transaction No." ItemStyle-HorizontalAlign="Left" ItemStyle-Width="25%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("BD_LinkKey")%>' Visible="false"></asp:Label>
                                                                                            <asp:Label ID="lblInvoiceNo" runat="server" Text='<%#Eval("SequenceNo")%>' ToolTip="Invoice No." Width="100%"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:DropDownList ID="ddldocumentno" runat="server" AutoPostBack="true" onmouseover="ddl_itemchanged(this)">
                                                                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                            <asp:RequiredFieldValidator ID="rfvddldocumentno" runat="server" ControlToValidate="ddldocumentno" CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select Invoice Number" InitialValue="0" SetFocusOnError="True" ValidationGroup="InvesmentAdd"></asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="20%" HeaderText="Amount" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblDocAmount" runat="server" Style="text-align: left" Text='<%#Eval("Doc_Amount")%>' ToolTip="Amount" Width="100%"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtDocAmount" runat="server" MaxLength="12" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" Style="text-align: right" Width="75%"></asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="20%" HeaderText="Paid Amount" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblpaid" runat="server" Style="text-align: left" Text='<%#Eval("Paid_Amount")%>' ToolTip="Amount" Width="100%"></asp:Label>
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
                                                                                            <asp:TextBox ID="txtInvoiceamount" runat="server" Text='<%#Eval("Invoice_Amount")%>' Style="text-align: right" ToolTip="GL Account" Width="100%"></asp:TextBox>
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
                                                                <asp:Panel ID="pnlAccount" runat="server" CssClass="stylePanel" GroupingText="Account Details">

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="grid">
                                                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <asp:GridView ID="gvAccount" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                                                                            ShowFooter="True" OnRowDataBound="gvAccount_RowDataBound"
                                                                                            OnRowDeleting="gvAccount_RowDeleting" class="gird_details">
                                                                                            <Columns>
                                                                                                <asp:TemplateField HeaderText="Receipt Description" FooterStyle-HorizontalAlign="Center"
                                                                                                    ItemStyle-HorizontalAlign="Center">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblReceiptdescription" runat="server" Text='<%#Bind("ReceiptDescription") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <asp:DropDownList ID="ddlreceiptDescription" runat="server" AppendDataBoundItems="True"
                                                                                                            onmouseover="ddl_itemchanged(this)" AutoPostBack="true" OnSelectedIndexChanged="ddlAccreceiptDescription_SelectedIndexChanged"
                                                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <%-- <asp:RequiredFieldValidator ID="rfvreceiptDescription" runat="server" ControlToValidate="ddlreceiptDescription"
                                                                                            Display="None" SetFocusOnError="true" InitialValue="0" ErrorMessage="Select the Receipt Description"
                                                                                            ValidationGroup="AccountDetails"></asp:RequiredFieldValidator>--%>
                                                                                                        <%--<asp:RequiredFieldValidator ID="rfvDimReceiptDesc" runat="server" ControlToValidate="ddlreceiptDescription"
                                                                                            Display="None" SetFocusOnError="true" InitialValue="0" ErrorMessage="Select the Receipt Description"
                                                                                            ValidationGroup="AccountDimDetails"></asp:RequiredFieldValidator>--%>
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>' ToolTip="Branch" Width="90px" />
                                                                                                        <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                                                        <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Branch ID" Visible="false" />
                                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location") %>' ToolTip="Branch" Visible="false" />
                                                                                                    </ItemTemplate>
                                                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:DropDownList ID="ddlLocationF" runat="server"  Width="90px" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true"></asp:DropDownList>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                            <div class="grid_validation_msg_box">

                                                                                                                <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                                                    ValidationGroup="AccountDetails" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
                                                                                                                    ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </FooterTemplate>

                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Activity">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" Width="90px" ToolTip="Activity"></asp:Label>
                                                                                                        <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>

                                                                                                        <div class="md-input" style="margin: 0px;">

                                                                                                            <asp:DropDownList ID="ddlActivityF" Width="90px"
                                                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true">
                                                                                                            </asp:DropDownList>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                            <div class="grid_validation_msg_box">

                                                                                                                <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                                                    ValidationGroup="AccountDetails" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                                                    ErrorMessage="Select Acitvity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                                            </div>
                                                                                                        </div>


                                                                                                    </FooterTemplate>

                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Account" FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblGLAccountCode" runat="server" Text='<%#Bind("GLAccountDesc") %>' Width="150px"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <%-- <asp:Label ID="lblFGLAccountCode" runat="server"></asp:Label>--%>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:HiddenField ID="hdn_AccNature" runat="server" />
                                                                                                            <UC:Suggest ID="ddlGLCodeF" runat="server" class="md-form-control form-control" ServiceMethod="GetGLCodeList" OnItem_Selected="ddlGLCodeF_SelectedIndexChanged"
                                                                                                                ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="AccountDetails" />



                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Sub Account" FooterStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblSLAccountCode" runat="server" Text='<%#Bind("SLAccountDesc") %>' Width="150px"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <%-- <asp:Label ID="lblSLAccountCode" runat="server"></asp:Label>--%>
                                                                                                            <UC:Suggest ID="ddlSLCodeF" runat="server" ServiceMethod="GetSLCodeList" ItemToValidate="Value" OnItem_Selected="ddlSLCodeF_Item_Selected"
                                                                                                                WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="AccountDetails" />

                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Remarks"
                                                                                                    FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                                    <ItemTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="lblRemarks" runat="server" TextMode="MultiLine" Width="250px" Height="50px" Text='<%#Bind("Remarks") %>' 
                                                                                                                OnTextChanged="lblRemarks_TextChanged" AutoPostBack="true" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                                Style="border-color: White;" onkeyup="maxlengthfortxt(100);">
                                                                                                            </asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Style="border-color: White;" Width="250px" Height="50px" onmouseover="txt_MouseoverTooltip(this)" onkeyup="maxlengthfortxt(100);">
                                                                                                            </asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Total Amount" FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                                    <ItemTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtAmount" runat="server" Text='<%#Bind("TOTALAMOUNT") %>' Width="90px"
                                                                                                                OnTextChanged="txtAmount_TextChanged" AutoPostBack="true" Style="text-align: right; border-color: White;" class="md-form-control form-control login_form_content_input requires_true"
                                                                                                                onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly('false',false,this)"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtAccountAmount" runat="server" Style="text-align: right;" Width="90px"
                                                                                                                onkeypress="fnAllowNumbersOnly('false',false,this)" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                            <div class="grid_validation_msg_box">
                                                                                                                <asp:RequiredFieldValidator ID="rfvAcAmount" runat="server" ControlToValidate="txtAccountAmount"
                                                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter the Amount" ValidationGroup="AccountDetails"
                                                                                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                                                <asp:RequiredFieldValidator ID="rfvDimAcAmount" runat="server" ControlToValidate="txtAccountAmount"
                                                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter the Amount" ValidationGroup="AccountDimDetails"
                                                                                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                                            </div>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>

                                                                                                <%--  VAT Changes--%>
                                                                                                <asp:TemplateField HeaderText="Product/Services" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label runat="server" Text='<%#Eval("ProductService")%>' ID="lblProductServices" Width="120px" ToolTip="Product Services"></asp:Label>
                                                                                                        <asp:HiddenField ID="hdnProductServicesId" runat="server" Value='<%#Eval("ProductService_ID") %>' />
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:DropDownList ID="ddlProductServicesF" Width="120px"
                                                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesF_SelectedIndexChanged">
                                                                                                            </asp:DropDownList>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Tax Type" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label runat="server" Text='<%#Eval("TaxType")%>' ID="lblTaxType" ToolTip="Product Services"></asp:Label>
                                                                                                        <asp:HiddenField ID="hdnTaxTypeId" runat="server" Value='<%#Eval("TaxType_ID") %>' />
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:DropDownList ID="ddlTaxTypeF" Width="120px"
                                                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlTaxTypeF_SelectedIndexChanged">
                                                                                                            </asp:DropDownList>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="ITC Applicability" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label runat="server" Text='<%#Eval("ITCApplicability")%>' ID="lblITCApplicability" ToolTip="ITC Applicability"></asp:Label>
                                                                                                        <asp:HiddenField ID="hdnITCApplicabilityId" runat="server" Value='<%#Eval("ITCApplicability_ID") %>' />
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:DropDownList ID="ddlITCApplicabilityF" Width="120px"
                                                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                                                            </asp:DropDownList>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="Taxable Amount(Excl. VAT)" 
                                                                                                    ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblAmount1" runat="server" Width="90px" Style="text-align: right" ToolTip="Amount" Text='<%#Eval("Amount")%>'></asp:Label>
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

                                                                                                <asp:TemplateField HeaderText="Tax Rate" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                                                        <asp:Label ID="txtTAXPERCENTAGE" runat="server" Visible="false"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <asp:Label ID="lblTAXPERCENTAGF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="VAT Amount" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblTAXAMOUNT" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                                                        <asp:Label ID="txtTAXAMOUNT" runat="server" Visible="false"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <asp:Label ID="lblTAXAMOUNTF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>

                                                                                                <asp:TemplateField HeaderText="DIM1" Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("Dimension1_Code") %>' />
                                                                                                        <asp:Label runat="server" Text='<%#Eval("Dimension1_Desc")%>' ID="lblDDIM1" ToolTip="DIM1"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <asp:DropDownList ID="TddlDim1" runat="server" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged"
                                                                                                            CssClass="md-form-control form-control login_form_content_input" />
                                                                                                        <asp:HiddenField ID="hdn_Dim1" runat="server" Value="" />
                                                                                                    </FooterTemplate>
                                                                                                    <EditItemTemplate>
                                                                                                        <asp:DropDownList ID="TddlDim1" runat="server" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged"
                                                                                                            CssClass="md-form-control form-control login_form_content_input" />
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
                                                                                                <asp:TemplateField Visible="false">
                                                                                                    <HeaderTemplate>
                                                                                                        <asp:Label ID="lblDIM" runat="server" Text="DIM" />
                                                                                                    </HeaderTemplate>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM1"
                                                                                                            ToolTip="Show DIM" />
                                                                                                        <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                                            OnClick="lnk_Click1" ToolTip="Hide DIM" />
                                                                                                    </ItemTemplate>
                                                                                                    <EditItemTemplate>
                                                                                                        <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM1"
                                                                                                            ToolTip="Show DIM" />
                                                                                                        <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                                            OnClick="lnk_Click1" ToolTip="Hide DIM" />
                                                                                                    </EditItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM1"
                                                                                                            ToolTip="Show DIM" />
                                                                                                        <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                                            OnClick="lnk_Click1" ToolTip="Hide DIM" />
                                                                                                    </FooterTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderStyle-Width="5%" FooterStyle-Width="5%" ItemStyle-Width="5%" Visible="false">
                                                                                                    <HeaderTemplate>
                                                                                                        <asp:Label ID="lblDIMe" runat="server" Text="DIM" />
                                                                                                    </HeaderTemplate>
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblTran_det_Id" Visible="false" runat="server" Text='<%#Eval("Tran_det_Id")%>' />
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

                                                                                                <asp:TemplateField HeaderText="Action" FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                                                                    ItemStyle-Width="6%" FooterStyle-Width="6%">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="Delete"
                                                                                                            Text="Remove" CssClass="grid_btn_delete" AccessKey="E" ToolTip="Alt+E"></asp:LinkButton>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <button class="grid_btn" id="btnAdd" validationgroup="AccountDetails" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>

                                                                                            </Columns>

                                                                                        </asp:GridView>

                                                                                    </ContentTemplate>
                                                                                </asp:UpdatePanel>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row" align="right">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                                            <asp:Label ID="lblTotal" CssClass="styleDisplayLabel" runat="server" Text="Sub-Total"></asp:Label>

                                                                            <asp:Label ID="lblAccountDetailsTotal" ToolTip="Total amount of account details grid"
                                                                                CssClass="styleDisplayLabel" runat="server" Text="0"></asp:Label>
                                                                        </div>
                                                                    </div>

                                                                </asp:Panel>
                                                            </div>
                                                        </div>


                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlAddLess" runat="server" CssClass="stylePanel" GroupingText="Account Adjustment">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="grid">
                                                                                <asp:GridView ID="gvAddLess" ShowFooter="true" runat="server" AutoGenerateColumns="False"
                                                                                    OnRowDataBound="gvAddLess_RowDataBound" OnRowCommand="gvAddLess_RowCommand"
                                                                                    OnRowDeleting="gvAddLess_RowDeleting" class="gird_details">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-Width="10%" FooterStyle-Width="10%" ItemStyle-HorizontalAlign="Left"
                                                                                            FooterStyle-HorizontalAlign="Center" HeaderText="Add or Less">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAddLessId" runat="server" Text='<%# Bind("AddLessId") %>' Visible="false" />
                                                                                                <asp:Label ID="lblAddLess" runat="server" Text='<%# Bind("AddLess") %>' />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlAddLess" runat="server" Width="98%" onmouseover="ddl_itemchanged(this)"
                                                                                                    OnSelectedIndexChanged="ddlAddLess_SelectedIndexChanged" AutoPostBack="true"
                                                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                                                    <asp:ListItem Selected="True" Text="--Select--" Value="0">
                                                                                                    </asp:ListItem>
                                                                                                    <asp:ListItem Text="Add" Value="1">
                                                                                                    </asp:ListItem>
                                                                                                    <asp:ListItem Text="Less" Value="2">
                                                                                                    </asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                <div class="grid_validation_msg_box">
                                                                                                    <asp:RequiredFieldValidator ID="rfvAddLess" runat="server" ControlToValidate="ddlAddLess"
                                                                                                        Display="Dynamic" SetFocusOnError="true" InitialValue="0" ErrorMessage="Select a Add or Less"
                                                                                                        ValidationGroup="AddLess" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
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
                                                                                                    <asp:DropDownList ID="ddlLocationF" runat="server" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnSelectedIndexChanged="ddlLocationF_SelectedIndexChanged"></asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">

                                                                                                        <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                                            ValidationGroup="AddLess" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
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

                                                                                                    <asp:DropDownList ID="ddlActivityF"
                                                                                                        CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlActivityF_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">

                                                                                                        <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                                            ValidationGroup="AddLess" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                                            ErrorMessage="Select Acitvity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>


                                                                                            </FooterTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left"
                                                                                            FooterStyle-HorizontalAlign="Left" HeaderText="Receipt Description">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblReceiptDecription" runat="server" Text='<%# Bind("ReceiptDescription") %>' />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlReceiptDecription" runat="server" AutoPostBack="true"
                                                                                                    onmouseover="ddl_itemchanged(this)" OnSelectedIndexChanged="ddladdLessReceiptDecription_SelectedIndexChanged"
                                                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                                                </asp:DropDownList>
                                                                                                <%--<asp:RequiredFieldValidator ID="rfvReceiptDecription" runat="server" ControlToValidate="ddlReceiptDecription"
                                                                                Display="None" InitialValue="0" SetFocusOnError="true" ErrorMessage="Select the Receipt Description"
                                                                                ValidationGroup="AddLess"></asp:RequiredFieldValidator>--%>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left"
                                                                                            FooterStyle-HorizontalAlign="Left" HeaderText="Account ">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblGLAccountCode" runat="server" Text='<%# Bind("GLAccountDesc") %>' />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">

                                                                                                    <%--<asp:Label ID="lblALFAccount" runat="server"></asp:Label>--%>
                                                                                                    <UC:Suggest ID="ddlGLCodeF" class="md-form-control form-control" runat="server" ServiceMethod="GetPAGLCodeList" OnItem_Selected="ddlGLCodeFA_SelectedIndexChanged"
                                                                                                        ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="AddLess" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left"
                                                                                            FooterStyle-HorizontalAlign="Left" HeaderText="Sub Account">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSLAccountCode" runat="server" Text='<%# Bind("SLAccountDesc") %>'
                                                                                                    Width="100px"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <%--<asp:Label ID="ALFSubAccount" runat="server"></asp:Label>--%>
                                                                                                    <UC:Suggest ID="ddlSLCodeF" runat="server" ServiceMethod="GetPASLCodeList" ItemToValidate="Value" OnItem_Selected="ddlSLCodeF_Item_Selected1"
                                                                                                        WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="AddLess" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <%-- <asp:DropDownList ID="ddlSLCodeF" onmouseover="ddl_itemchanged(this)"
                                                                                                    runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                                </asp:DropDownList>
                                                                                                <div class="validation_msg_box">
                                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlSLCodeF" Enabled="false" CssClass="grid_validation_msg_box"
                                                                                                        SetFocusOnError="True" ValidationGroup="AddLess" runat="server" ControlToValidate="ddlSLCodeF"
                                                                                                        InitialValue="0" ErrorMessage="Select SubAccount in account adjustment"></asp:RequiredFieldValidator>--%>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="TaxId" Visible="False">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblTaxId" runat="server" Text='<%# Bind("TaxId") %>' />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Tax Type" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblTaxType" runat="server" Text='<%# Bind("TaxType") %>' />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:DropDownList ID="ddlTaxType" runat="server" AutoPostBack="false"
                                                                                                    onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input">
                                                                                                </asp:DropDownList>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Amount"
                                                                                            ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox ID="txtALAmount" runat="server" AutoPostBack="true" Text='<%# Bind("Amount") %>'
                                                                                                    onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                                                    OnTextChanged="txtALAmount_TextChanged" Style="text-align: right;"></asp:TextBox>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:TextBox ID="txtAddLessAmount" Style="text-align: right;" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                                    onkeypress="fnAllowNumbersOnly('false',false,this)" />
                                                                                                <asp:RequiredFieldValidator ID="rfvAddAmount" runat="server" ControlToValidate="txtAddLessAmount"
                                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter the Amount" ValidationGroup="AddLess"></asp:RequiredFieldValidator>
                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-Width="5%" FooterStyle-Width="5%" HeaderText="Action">
                                                                                            <ItemTemplate>
                                                                                                <asp:LinkButton ID="lbtnRemove" runat="server" CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"
                                                                                                    CommandName="Delete"></asp:LinkButton>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <button class="grid_btn" id="btnAdd" validationgroup="AddLess" title="Alt+T" accesskey="T" runat="server" onserverclick="btnAdd_ServerClick1"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                                                            </FooterTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                                <%-- <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnlAddLess"
                                                            ExpandControlID="divRoiRules" CollapseControlID="divRoiRules" Collapsed="true"
                                                            ExpandDirection="Vertical" TextLabelID="lblDetails" ImageControlID="imgDetails"
                                                            ExpandedText="(Hide Details...)" CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="false" SkinID="CollapsiblePanelDemo" />--%>
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

                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="tpBankDetails" runat="server" BackColor="Red" CssClass="tabpan"
                                    HeaderText="Bank Details" Width="100%">
                                    <HeaderTemplate>
                                        Bank Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlBankDetails" runat="server" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBKInstrumentNumber" runat="server" MaxLength="10" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                    onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:RangeValidator ID="rvBKInstrumentNo" runat="server" ControlToValidate="txtBKInstrumentNumber"
                                                                    Display="Dynamic" ValidationGroup="BtnSave" SetFocusOnError="true" MinimumValue="100000" MaximumValue="9999999999"
                                                                    Type="String" ErrorMessage="Instrument Number Should be 10 Digits"></asp:RangeValidator>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBKInstrumentNo" runat="server" ControlToValidate="txtBKInstrumentNumber"
                                                                        Display="Dynamic" InitialValue="" ValidationGroup="BtnSave" SetFocusOnError="true"
                                                                        ErrorMessage="Enter the Instrument Number" CssClass="validation_msg_box_sapn"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtBKInstrumentNumber" runat="server" TargetControlID="txtBKInstrumentNumber"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInstrumentNumber" ToolTip="Instrument No" runat="server" Text="Instrument No"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBKInstrumentDate" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgBKInstrumentDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                    Visible="false" />
                                                                <cc1:CalendarExtender ID="ceBKInstrumentDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                    PopupButtonID="imgBKInstrumentDate" TargetControlID="txtBKInstrumentDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBKInstrumentDate" runat="server" ControlToValidate="txtBKInstrumentDate"
                                                                        Display="Dynamic" InitialValue="" ValidationGroup="BtnSave" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Enter the Instrument Date"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtBKInstrumentNumber"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInstrumentDate" ToolTip="Instrument Date" runat="server" Text="Instrument Date"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <%-- <asp:TextBox ID="txtBKDraweeBankName_Code" MaxLength="40" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="rfvBKDraweeBankName_Code" runat="server" ControlToValidate="txtBKDraweeBankName_Code"
                                                                    Display="None" InitialValue="" ValidationGroup="BtnSave" SetFocusOnError="true"
                                                                    ErrorMessage="Enter the Drawee Bank Name and Code"> </asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="ftbeBKDraweeBankName_Code" runat="server" TargetControlID="txtBKDraweeBankName_Code"
                                                                    FilterType="UppercaseLetters, LowercaseLetters, Numbers, Custom" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <UC:Suggest ID="txtBKDraweeBankName_Code" class="md-form-control form-control" runat="server" ServiceMethod="GetDraweeBankList" OnItem_Selected="txtBKDraweeBankName_Code_Item_Selected"
                                                                    ErrorMessage="Select the Drawee Bank Name" IsMandatory="false" AutoPostBack="true" ValidationGroup="BtnSave" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDraweeBankName_Code" ToolTip="Drawee Bank Name" runat="server" Text="Drawee Bank Name &amp; Code"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <%--<asp:TextBox ID="txtBKLocation" runat="server" MaxLength="40" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBKLocation" runat="server" ControlToValidate="txtBKLocation"
                                                                        Display="Dynamic" InitialValue="" ValidationGroup="BtnSave" SetFocusOnError="true"
                                                                        ErrorMessage="Enter the Bank Location" CssClass="validation_msg_box_sapn"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="ftbeBKLocation" runat="server" TargetControlID="txtBKLocation"
                                                                    FilterType="UppercaseLetters, LowercaseLetters, Numbers, Custom" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&"
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <UC:Suggest ID="txtBKLocation" class="md-form-control form-control" runat="server" ServiceMethod="GetDraweeBankLocaList" OnItem_Selected="txtBKDraweeBankName_Code_Item_Selected"
                                                                    ErrorMessage="Select the Drawee Bank Location" IsMandatory="false" AutoPostBack="true" ValidationGroup="BtnSave" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblBKLocation" ToolTip="Location" runat="server" Text="Location"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDraweeBankAccountnumber" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtDraweeBankAccountnumber"
                                                                    FilterType="Numbers, Custom" ValidChars=" &()-.><:]["
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDraweeBankAccountnumber"
                                                                        Display="Dynamic" InitialValue="" ValidationGroup="BtnSave" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Enter the Drawee bank Account Number"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <label>
                                                                    <asp:Label ID="lblDraweebankaccount" ToolTip="Drawee Bank Account Number" runat="server" Text="Drawee Bank Account Number"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBKPaymentGetway_Ref" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftbeBKPaymentGetway_Ref" runat="server" TargetControlID="txtBKPaymentGetway_Ref"
                                                                    FilterType="UppercaseLetters, LowercaseLetters, Numbers, Custom" ValidChars=" &()-.><:]["
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblPaymentGetway_Ref" ToolTip="Payment Gateway Ref" runat="server" Text="Payment Gateway Ref"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBKRealization_Date" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgBKRealization_Date" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                    Visible="false" />
                                                                <cc1:CalendarExtender ID="ceBKRealization_Date" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                    PopupButtonID="imgBKRealization_Date" TargetControlID="txtBKRealization_Date">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblRealization_Date" ToolTip="Realization Date" runat="server" Text="Realization Date"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtInstrumentAmt" runat="server" Style="text-align: right;" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                    onmouseover="txt_MouseoverTooltip(this)" MaxLength="15"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvInstrumentAmt" runat="server" ControlToValidate="txtInstrumentAmt"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="" ValidationGroup="BtnSave" SetFocusOnError="true"
                                                                        ErrorMessage="Enter the Instrument Amount"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInstrumentAmt" ToolTip="Instrument Amount" runat="server" Text="Instrument Amount"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBKBankcharges" runat="server" Style="text-align: right;" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                    onmouseover="txt_MouseoverTooltip(this)" MaxLength="15"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblBankCharges" ToolTip="Bank Charges" runat="server" Text="Bank Charges"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBKDepositedIn" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBKDepositedIn_SelectedIndexChanged"
                                                                    onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvBKDepositedIn" runat="server" ControlToValidate="ddlBKDepositedIn"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="BtnSave" SetFocusOnError="true"
                                                                        ErrorMessage="Select the Deposited In"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDepositedIn" ToolTip="Deposited In" runat="server" Text="Deposited In"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBKAccountDesc" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="rtbeAccountDesc" runat="server" TargetControlID="txtBKAccountDesc"
                                                                    FilterType="UppercaseLetters, LowercaseLetters, Numbers, Custom" ValidChars=" &()-.><:]["
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAccountDesc" ToolTip="Account Description" runat="server" Text="Account Description"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>



                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                <asp:Panel ID="pnlCashDetails" runat="server" Width="100%" Visible="false">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCHAccount" runat="server" AutoPostBack="true" class="md-form-control form-control" OnSelectedIndexChanged="ddlCHAccount_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCHAccount" runat="server" ControlToValidate="ddlCHAccount"
                                                                        Display="Dynamic" InitialValue="0" ValidationGroup="BtnSave" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select the Account in Bank Details Tab"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAccount" ToolTip="Account" runat="server" Text="Account"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCHSubAccount" runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCHSubAccount" runat="server" ControlToValidate="ddlCHSubAccount"
                                                                        Display="Dynamic" InitialValue="0" ValidationGroup="BtnSave" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select the Sub Account in Bank Details Tab"> </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label2" ToolTip="Account" runat="server" Text="Sub Account"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </asp:Panel>
                                            </div>
                                        </div>

                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="tpothers" runat="server">
                                    <HeaderTemplate>
                                        Others
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="gvOthers" Width="100%" runat="server" AutoGenerateColumns="false"
                                                        ShowFooter="true" OnRowCommand="gvOthers_RowCommand" OnRowDataBound="gvOthers_RowDataBound"
                                                        OnRowDeleting="gvOthers_RowDeleting" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Funder_ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblFunder_ID" runat="server" Visible="false" Text='<%# Bind("Entity_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Funder Ref No" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRefDocumentNo" runat="server" Text='<%# Bind("Ref_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlORefDocumentNo" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlORefDocumentNo_SelectedIndexChanged"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvORefDocumentNo" runat="server" ControlToValidate="ddlORefDocumentNo"
                                                                            Display="Dynamic" InitialValue="0" ErrorMessage="Select the Ref Document Number"
                                                                            ValidationGroup="OthersDetails" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                <FooterTemplate>
                                                                    <asp:DropDownList ID="ddlDueDate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDueDate_SelectedIndexChanged"
                                                                        CssClass="md-form-control form-control login_form_content_input">
                                                                    </asp:DropDownList>
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
                                                                    <asp:TextBox ID="txtRemarksF" TextMode="MultiLine"
                                                                        runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Description" ItemStyle-Width="30%" FooterStyle-Width="30%"
                                                                FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Ref_Name") %>' Style="text-align: left;"></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Label ID="lblODesciption" Width="96%" runat="server" Style="text-align: left;"></asp:Label>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Amount" ItemStyle-Width="15%" FooterStyle-Width="15%"
                                                                FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount") %>' OnTextChanged="txtOthersAmount_TextChanged"
                                                                        onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                        AutoPostBack="true" Style="text-align: right;" ValidationGroup="vgTMPAmount"></asp:TextBox>
                                                                    <asp:RangeValidator ID="rgITMAmount" runat="server" ControlToValidate="txtAmount"
                                                                        Display="None" MinimumValue="1" MaximumValue='<%# Bind("Total_Amount") %>' Type="Double"
                                                                        SetFocusOnError="true" ValidationGroup="vgTMPAmount">                                                                    
                                                                    </asp:RangeValidator>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtOAmount" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                        onkeypress="fnAllowNumbersOnly('false',false,this)" Style="text-align: right;"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvOAmount" runat="server" ControlToValidate="txtOAmount"
                                                                            Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="OthersDetails"
                                                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <asp:RangeValidator ID="rgFTRTXAmount" runat="server" ControlToValidate="txtOAmount"
                                                                        Display="None" MinimumValue="1" MaximumValue="1" Type="Double" SetFocusOnError="true">                                                                    
                                                                    </asp:RangeValidator>
                                                                    <asp:RangeValidator ID="rgFTRBTAmount" runat="server" ControlToValidate="txtOAmount"
                                                                        Display="None" MinimumValue="1" MaximumValue="1" Type="Double" SetFocusOnError="true">                                                                    
                                                                    </asp:RangeValidator>
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action" ItemStyle-Width="5%" FooterStyle-Width="5%"
                                                                FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete" CssClass="gird_btn_delete"
                                                                        Text="Remove"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <button class="grid_btn" id="btnOthersAdd" validationgroup="OthersDetails" title="Alt+D" accesskey="D" runat="server" onserverclick="btnOthersAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlInvestment" runat="server" CssClass="stylePanel" GroupingText="Investment Details" Width="99%" Visible="false">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvOthersInvestment" Width="100%" runat="server" AutoGenerateColumns="false"
                                                            ShowFooter="true" OnRowCommand="gvOthersInvestment_RowCommand" OnRowDataBound="gvOthersInvestment_RowDataBound"
                                                            OnRowDeleting="gvOthersInvestment_RowDeleting">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Investment_ID" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvestment_ID" runat="server" Visible="false" Text='<%# Bind("Entity_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Investment Ref No" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                    FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblRefDocumentNo" runat="server" Text='<%# Bind("Ref_No") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlINVRefDocumentNo" runat="server" onmouseover="ddl_itemchanged(this)"
                                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlINVRefDocumentNo_SelectedIndexChanged"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvORefDocumentNo" runat="server" ControlToValidate="ddlINVRefDocumentNo"
                                                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select the Ref Document Number"
                                                                                ValidationGroup="OthersDetailsInvest" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="20%" FooterStyle-Width="20%"
                                                                    FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlDueDate" runat="server" OnSelectedIndexChanged="ddlDueDate_SelectedIndexChanged"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                        </asp:DropDownList>
                                                                    </FooterTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("Due_Date") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Description" ItemStyle-Width="30%" FooterStyle-Width="30%"
                                                                    FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Ref_Name") %>' Style="text-align: left;"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblODesciption" Width="96%" runat="server" Style="text-align: left;"></asp:Label>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Investment Repayment" ItemStyle-HorizontalAlign="Left"
                                                                    FooterStyle-Width="17%" ItemStyle-Width="17%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvestmentRepayment" Text='<%#Eval("Repayment")%>' Width="100%"
                                                                            runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlInvestmentRepayment" onmouseover="ddl_itemchanged(this)"
                                                                            runat="server" AutoPostBack="true" Width="100%" OnSelectedIndexChanged="ddlInvestmentRepayment_SelectedIndexChanged"
                                                                            CssClass="md-form-control form-control login_form_content_input">
                                                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                            <asp:ListItem Value="1">Loan</asp:ListItem>
                                                                            <asp:ListItem Value="2">Interest</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvInvestmentRepayment" runat="server" Display="Dynamic"
                                                                                ControlToValidate="ddlInvestmentRepayment" InitialValue="0" ValidationGroup="OthersDetailsInvest"
                                                                                ErrorMessage="Select Investment Repayment" CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount" ItemStyle-Width="15%" FooterStyle-Width="15%"
                                                                    FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtINVAmount" runat="server" Text='<%# Bind("Amount") %>' OnTextChanged="txtINVOthersAmount_TextChanged"
                                                                            AutoPostBack="true" Style="text-align: right;" ValidationGroup="vgTMPAmount" ReadOnly="true"
                                                                            onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly('false',false,this)"></asp:TextBox>
                                                                        <asp:RangeValidator ID="rgITMAmount" runat="server" ControlToValidate="txtINVAmount"
                                                                            Display="None" MinimumValue="1" MaximumValue='<%# Bind("Total_Amount") %>' Type="Double"
                                                                            SetFocusOnError="true" ValidationGroup="vgTMPAmount">                                                                    
                                                                        </asp:RangeValidator>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:TextBox ID="txtOAmount" runat="server" Width="96%" onmouseover="txt_MouseoverTooltip(this)"
                                                                            onkeypress="fnAllowNumbersOnly('false',false,this)" Style="text-align: right;"
                                                                            ValidationGroup="vgBTAmount" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvOAmount" runat="server" ControlToValidate="txtOAmount"
                                                                                Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="OthersDetailsInvest"
                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <asp:RangeValidator ID="rgFTRTXAmount" runat="server" ControlToValidate="txtOAmount"
                                                                            Display="None" MinimumValue="1" MaximumValue="1" Type="Double" SetFocusOnError="true"
                                                                            ValidationGroup="vgBTAmount">                                                                    
                                                                        </asp:RangeValidator>
                                                                        <asp:RangeValidator ID="rgFTRBTAmount" runat="server" ControlToValidate="txtOAmount"
                                                                            Display="None" MinimumValue="1" MaximumValue="1" Type="Double" SetFocusOnError="true"
                                                                            ValidationGroup="OthersDetailsInvest">                                                                    
                                                                        </asp:RangeValidator>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="5%" FooterStyle-Width="5%"
                                                                    FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                                            Text="Remove"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <button class="grid_btn" id="btnOthersAdd" validationgroup="OthersDetailsInvest" title="Alt+K" accesskey="K" runat="server" onserverclick="btnOthersAdd_ServerClick1"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

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
                                                <asp:Panel ID="PnlDimension" runat="server" GroupingText="Dimension" CssClass="stylePanel" Visible="false">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md- col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlHeadDim1" runat="server" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:HiddenField ID="hdn_HDIM1" runat="server" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvHDIM1" runat="server" ControlToValidate="ddlHeadDim1"
                                                                        InitialValue="0" Enabled="false" ErrorMessage="Select Dimension1" Display="Dynamic"
                                                                        SetFocusOnError="True" ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblHDIM1" runat="server" Text="Dimension1" />
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-6 col-md- col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlHeadDim2" runat="server" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlHeadDim2_SelectedIndexChanged"
                                                                    CssClass="md-form-control form-control login_form_content_input">
                                                                </asp:DropDownList>
                                                                <asp:HiddenField ID="hdn_HDIM2" Value="" runat="server" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvHDIM2" runat="server" ControlToValidate="ddlHeadDim2"
                                                                        InitialValue="0" Enabled="false" ErrorMessage="Select Dimension2" Display="Dynamic"
                                                                        SetFocusOnError="True" ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblHDIM2" runat="server" Text="Dimension2" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:HiddenField ID="hdn_DIM1_Type" runat="server" />
                                                    <asp:HiddenField ID="hdn_DIM2_Type" runat="server" />
                                                </asp:Panel>
                                            </div>
                                        </div>

                                    </ContentTemplate>

                                </cc1:TabPanel>

                            </cc1:TabContainer>
                            <div>
                                <asp:HiddenField ID="hdnIB" runat="server" Value="0" />
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('BtnSave'))"
                                    type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" validationgroup="BtnSave">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                                <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                                    type="button" accesskey="L" title="Clear[Alt+L]">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                                <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if( fnConfirmExit())"
                                    type="button" accesskey="X" title="Exit[Alt+X]">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                                <button class="css_btn_enabled" id="btnReceiptCancel" onserverclick="btnReceiptCancel_Click" causesvalidation="false" runat="server"
                                    type="button" accesskey="R" title="Receipt Cancel[Alt+R]">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>R</u>eceipt Cancel
                                </button>

                            </div>

                        </div>
                    </div>

                    <div>
                        <asp:CustomValidator ID="cvReceiptProcessing" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true">
                        </asp:CustomValidator>
                        <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="BtnSave" ShowSummary="false" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsAddless" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="AddLess" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsAccountDetails" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="AccountDetails" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsDimAccountDetails" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="AccountDimDetails" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsOthers" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="OthersDetails" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsOthersDetailsInvest" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="OthersDetailsInvest" HeaderText="Correct the following validation(s):" />
                        <asp:HiddenField ID="hdvAmount" runat="server" />
                        <asp:HiddenField ID="hvfGLPostingCode" runat="server" />
                        <asp:HiddenField ID="hvfCashFlowID" runat="server" />
                        <asp:HiddenField ID="hvfCustomerID" runat="server" />
                    </div>
                </div>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>


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
                                            <asp:Button ID="lnkDimRemove" ToolTip="Remove from the grid" runat="server"
                                                CommandName="Delete" CausesValidation="false" Text="Remove" CssClass="styleGridShortButton"></asp:Button>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="lnkDimAdd" ToolTip="Add to the grid,Alt+U" AccessKey="U" runat="server" ValidationGroup="btnDimAdd"
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
                            <asp:ValidationSummary ValidationGroup="btnDimAdd" ID="ValidationSummary8" runat="server"
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
                                                        <asp:Label ID="lblCOMMON_CODE" runat="server" Text='<%# Bind("COMMON_CODE") %>' ToolTip="Value"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RO" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCOMMON_FLAG" runat="server" Text='<%# Bind("COMMON_FLAG") %>' ToolTip="O/S Amount"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="left">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtCOMMON_DESCRIPTION" runat="server" Text='<%# Bind("COMMON_DESCRIPTION") %>' Enabled="false"
                                                            ToolTip="Installment Amount" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Numbers" ItemStyle-HorizontalAlign="left">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtNumbers" runat="server" ToolTip="Numbers" Text='<%# Bind("Numbers") %>' OnTextChanged="txtNumbers_TextChanged" AutoPostBack="true"
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
                                                        <asp:TextBox ID="txtCurrTOTAL_AMOUNT" runat="server" Text='<%# Bind("TOTAL_AMOUNT") %>' ToolTip="Amount"
                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="AmountFileterExtndr" runat="server" TargetControlID="txtCurrTOTAL_AMOUNT"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotDinAmount" runat="server" ToolTip="Total Amount"
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
                                <div class="row">
                                    <asp:Button runat="server" ID="btnCashOk" CausesValidation="false"
                                        OnClick="btnCashOk_Click" Text="Ok" CssClass="grid_btn" />&nbsp;
                                        <asp:Button runat="server" ID="btnCashCancel" CausesValidation="false"
                                            OnClick="btnCashCancel_Click" Text="Exit" CssClass="grid_btn" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>


    <script language="javascript" type="text/javascript">
        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcReceipt');




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

                var TC = $find("<%=tcReceipt.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlActivity.ClientID %>").focus();

                }


            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcReceipt.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlActivity.ClientID %>").focus();

            }

            tab = $find('ctl00_ContentPlaceHolder1_tcReceipt');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

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

        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnLoadCustomer').click();
        }
        function fnLoadEntity() {
            document.getElementById('<%=btnLoadCustomer.ClientID %>').click();
        }
        function funshowaddless() {

            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnAddLess').click();
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_cpeDemo_ClientState').collapsed = !document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_cpeDemo_ClientState').collapsed;

        }

        function funshowDim() {

            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvAccount_ctl03_btnDims').click();
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvAccount_ctl03_cpeDimsDemo_ClientState').collapsed = !document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvAccount_ctl03_cpeDimsDemo_ClientState').collapsed;

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


    </script>

</asp:Content>
