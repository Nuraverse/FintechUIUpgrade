<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_ExpenseBooking, App_Web_jj5zdzwe" title="Payment Request" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Expenses Booking" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
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
                            <asp:UpdatePanel ID="upMaindetails" runat="server">
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnldett" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Header Details">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlActivity" ValidationGroup="Header" runat="server" class="md-form-control form-control" AutoPostBack="true">
                                                                </asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Activity" CssClass="styleReqFieldLabel"
                                                                        ID="lblActivity"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                        ValidationGroup="Save" ControlToValidate="ddlLocation" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblLocation" Text="Branch" CssClass="styleReqFieldLabel" />

                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCode" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                    Style="display: none;" MaxLength="50" ContentEditable="false"></asp:TextBox>
                                                                <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" LOV_Code="FAENT" AutoPostBack="true" runat="server" DispalyContent="Name" ServiceMethod="GetEntityFunder" ShowHideAddressImageButton="false" HoverMenuExtenderLeft="true" OnItem_Selected="ucLov_Item_Selected" />
                                                                <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="false" Text="Create"
                                                                    Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                                    CausesValidation="false" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtCode" CssClass="validation_msg_box_sapn"
                                                                        runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Vendor"
                                                                        ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ToolTip="Entity" Text="Vendor" ID="lblVendor" CssClass="styleReqFieldLabel"></asp:Label>


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
                                                                <asp:TextBox ID="txtCreditAccounting" runat="server" ToolTip="Credit Accounting Entries" ReadOnly="true"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCreditAccounting" runat="server" Text="Credit Accounting Entries" CssClass="styleDisplayLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDocumentNo" runat="server" ToolTip="Document Number" class="md-form-control form-control login_form_content_input requires_true"
                                                                    ReadOnly="true" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDocumentNo" Text="PBJ No" CssClass="styleReqFieldLabel"></asp:Label>


                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtdocdate" runat="server" OnTextChanged="txtDocDate_TextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                                                    AutoPostBack="true"></asp:TextBox>
                                                                <%--<asp:Image ID="imgDocDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender ID="calDocDate" runat="server" Enabled="True" PopupButtonID="imgDocDate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtdocdate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtDocDate" CssClass="validation_msg_box_sapn"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtdocdate"
                                                                        ErrorMessage="Enter Document Date"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" ID="lblDocumentDate" Text="Document Date" CssClass="styleReqFieldLabel"></asp:Label>


                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtstatus" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Status" ToolTip="Status" ID="lbldocstatus"
                                                                        CssClass="styleReqFieldLabel"></asp:Label>


                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtValueDate" runat="server" class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true"></asp:TextBox>
                                                                <%--<asp:Image ID="imgValueDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender ID="CEValueDate" runat="server" Enabled="True" PopupButtonID="imgValueDate"
                                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtValueDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="dynamic" ID="RFVtxtValueDate" CssClass="validation_msg_box_sapn"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtValueDate"
                                                                        ErrorMessage="Enter PBJ Date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="PBJ Date" ToolTip="PBJ Date" ID="lblValueDate"
                                                                        CssClass="styleReqFieldLabel"></asp:Label>


                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlBillType" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBillType_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                    <asp:ListItem Value="1">Supply Bill</asp:ListItem>
                                                                    <asp:ListItem Value="2">Service Bill</asp:ListItem>

                                                                </asp:DropDownList>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Bill Type" ToolTip="Bill Type" ID="lblBillType"
                                                                        CssClass="styleDisplayLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtsuppliername" runat="server" ToolTip="Supplier Name" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVsupplierName" runat="server" ControlToValidate="txtsuppliername" CssClass="validation_msg_box_sapn"
                                                                        InitialValue="" ErrorMessage="Enter Supplier Name" Display="Dynamic" SetFocusOnError="True" Enabled="false"
                                                                        ValidationGroup="Save" />
                                                                </div>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Supplier Name" ID="lblsupplierName" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlVendorAddress" runat="server" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvVendorAddress" SetFocusOnError="True" runat="server"
                                                                        ValidationGroup="Save" ControlToValidate="ddlVendorAddress" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select Vendor Address" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Vendor Address" ToolTip="Vendor Address" ID="lblVendorAddress"
                                                                        CssClass="styleReqFieldLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9 col-md-6 col-sm-8 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRemarks" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                                                    TextMode="MultiLine" Rows="3" MaxLength="100" onkeyup="maxlengthfortxt(100);" class="md-form-control form-control uppercase">
                                                                </asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="dynamic" ID="rfvRemarks" CssClass="validation_msg_box_sapn"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" InitialValue="" ControlToValidate="txtRemarks"
                                                                        ErrorMessage="Enter Narration"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label runat="server" Text="Narration" ToolTip="Remarks" ID="lblRemarks"
                                                                        CssClass="styleReqFieldLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <asp:CheckBox ID="chkpo" runat="server" Text="From LPO" AutoPostBack="true" OnCheckedChanged="chkpo_OnCheckedChanged" />
                                                        </div>
                                                    </div>




                                                </asp:Panel>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="PnlLPO" runat="server" CssClass="stylePanel" GroupingText="PO Details" ToolTip="PO Details" Visible="false" Width="98%">

                                                    <div id="divpo" runat="server" style="overflow: auto; height: 150px; display: none">
                                                        <div class="gird">
                                                            <asp:GridView ID="grvpo" runat="server" AutoGenerateColumns="False" ToolTip="PO Details" Width="100%" CssClass="gird_details">

                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="PO Number">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLPOID" runat="server" Text='<%#Eval("LPO_ID")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblLPONo" runat="server" Text='<%#Eval("LPO_NO")%>' ToolTip="PO Number"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Select">
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkselect" runat="server" AutoPostBack="true" Checked='<%#DataBinder.Eval(Container.DataItem, "CHK").ToString().ToUpper() == "TRUE"%>' OnCheckedChanged="chkselect_OnCheckedChanged" ToolTip="Select" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div align="center">
                                                        <button class="grid_btn" id="btnGo" title="Alt+G" accesskey="G" runat="server" onserverclick="btnGo_OnClick"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>GO</button>


                                                    </div>

                                                </asp:Panel>
                                            </div>


                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlAssetDetails" runat="server" CssClass="stylePanel" GroupingText="Invoice Details" ToolTip="Expenses Details" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtinvoiceno" runat="server" MaxLength="20" Style="text-align: left;" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Invoice no" />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="reqinvoiceno" CssClass="validation_msg_box_sapn"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtinvoiceno"
                                                                        ErrorMessage="Enter Invoice No"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblinvoiceno" runat="server" Text="Invoice No" CssClass="styleReqFieldLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtinvoicedate" runat="server" MaxLength="20" Style="text-align: left;" AutoPostBack="true" OnTextChanged="txtinvoicedate_TextChanged"
                                                                    ToolTip="Invoice Date" class="md-form-control form-control login_form_content_input requires_true" />
                                                                <%--<asp:Image ID="imgcal" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender ID="calinvoice" runat="server" Enabled="True" PopupButtonID="imgcal"
                                                                    TargetControlID="txtinvoicedate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="Reqinvoicedate" CssClass="validation_msg_box_sapn"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtinvoicedate"
                                                                        ErrorMessage="Enter Invoice Date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <asp:HiddenField ID="hdncreditdays" runat="server" />
                                                                <asp:HiddenField ID="hdnDebitAccDesc" runat="server" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblinvoicedate" runat="server" Text="Invoice Date" CssClass="styleReqFieldLabel"></asp:Label>


                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtinvoiceamt" runat="server" MaxLength="20" ReadOnly="true" Style="text-align: right;" ToolTip="Invoice Amount" class="md-form-control form-control login_form_content_input requires_true" />


                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblinvoiceamt" runat="server" Text="Invoice Amount" CssClass="styleReqFieldLabel"></asp:Label>

                                                                </label>
                                                            </div>
                                                        </div>


                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtPaymentDueDate" runat="server" MaxLength="20" Style="text-align: left;" AutoPostBack="true" ToolTip="Payment Due Date" class="md-form-control form-control login_form_content_input requires_true" />

                                                                <cc1:CalendarExtender ID="cePaymentDate" runat="server" Enabled="True" PopupButtonID="imgcal"
                                                                    TargetControlID="txtPaymentDueDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn"
                                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtPaymentDueDate"
                                                                        ErrorMessage="Enter Payment Due Date"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblPaymentDueDate" runat="server" Text="Payment due Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    <UC:Suggest ID="ddlglcode" class="md-form-control form-control" runat="server" ServiceMethod="GetGLCodeList"
                                                                        ErrorMessage="Select GL Account" IsMandatory="false" Visible="false" AutoPostBack="true" ValidationGroup="VgAdd" />

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                <asp:HiddenField ID="hdnDescription" runat="server" />
                                                <asp:Panel GroupingText="Expense Details" ID="Panel3" runat="server" CssClass="stylePanel">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvexpbooking" runat="server" ShowFooter="true" CssClass="gird_details" HeaderStyle-CssClass="styleGridHeader"
                                                            AutoGenerateColumns="False" OnRowDataBound="grvexpbooking_RowDataBound" FooterStyle-CssClass="styleFooterInfo" OnRowDeleting="grvexpbooking_RowDeleting"
                                                            OnRowEditing="grvexpbooking_RowEditing" OnRowUpdating="grvexpbooking_RowUpdating" OnRowCancelingEdit="grvexpbooking_RowCancelingEdit"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="LPO ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_lpoid" runat="server" Text='<%#Eval("LPO_ID")%>' ToolTip="LPO ID" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="LPO DETAIL ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_lpocode" runat="server" Text='<%#Eval("LPO_DETAILS_ID")%>' ToolTip="LPO code" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Item Description">
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="txtdescription" runat="server" Width="180px"
                                                                            MaxLength="100" onkeyup="maxlengthfortxt(100);" Rows="2" Text='<%#Eval("model_description")%>'
                                                                            TextMode="MultiLine" Wrap="true" ReadOnly="true"></asp:TextBox>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtdescriptionF" runat="server" MaxLength="500" Width="180px" onmouseover="txt_MouseoverTooltip(this)" onkeyup="maxlengthfortxt(500);" Rows="2"
                                                                                class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <%-- <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtdescriptionE" runat="server" MaxLength="500" Width="180px" onmouseover="txt_MouseoverTooltip(this)" onkeyup="maxlengthfortxt(500);" Rows="2"
                                                                                class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </EditItemTemplate>--%>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Account No" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAccountNo" runat="server" Text='<%# Bind("PANUM") %>' Width="160px" ToolTip="GL Account" />

                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <FooterTemplate>

                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlAccountNoFooter" Width="120px" class="md-form-control form-control" runat="server" ServiceMethod="GetAccountList"
                                                                                ErrorMessage="Select Account Number" AutoPostBack="true" ValidationGroup="btnadd" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                        <asp:Label ID="lblAccountNoF" Font-Bold="false" runat="server" Text='<%# Bind("PANUM") %>' Visible="false" ToolTip="GL Account" />
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlAccountNoE" runat="server" Width="120px" class="md-form-control form-control" AutoPostBack="true"
                                                                                ServiceMethod="GetAccountList" ErrorMessage="Select Account Number" ValidationGroup="btnadd" />
                                                                        </div>
                                                                        <asp:HiddenField ID="hdn_PA_SA_REF_ID" runat="server" Value='<%#Eval("PA_SA_REF_ID") %>' />
                                                                        <asp:HiddenField ID="hdn_PANUM" runat="server" Value='<%#Eval("PANUM") %>' />

                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLocationgrid" runat="server" Text='<%# Bind("Location") %>' Width="90px" ToolTip="Location" />
                                                                        <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                        <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Location ID" Visible="false" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <%--<UC:Suggest ID="ddlLocation1" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" ItemToValidate="Value"
                                                                        WatermarkText="--Select--" ErrorMessage="Select Branch" />--%>
                                                                            <asp:DropDownList ID="ddlLocationF" runat="server" Width="90px" CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" OnSelectedIndexChanged="ddlLocationF_SelectedIndexChanged"></asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvgridLocation" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>

                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlLocationE" runat="server" Width="90px" CssClass="WindowsStyle" DropDownStyle="DropDownList" OnSelectedIndexChanged="ddlLocationE_SelectedIndexChanged"
                                                                                AutoPostBack="True"
                                                                                AppendDataBoundItems="True" AutoCompleteMode="SuggestAppend" MaxLength="0">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvLocationE" SetFocusOnError="True" runat="server" CssClass="validation_msg_box_sapn"
                                                                                    ControlToValidate="ddlLocationE" ValidationGroup="btnadd"
                                                                                    ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnLocationE" Value='<%#Eval("Location_Id") %>' runat="server" />
                                                                            <asp:TextBox ID="txtLocationE" runat="server" Visible="false" Text='<%#Eval("Location")%>'></asp:TextBox>
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Activity">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" ToolTip="Activity"></asp:Label>
                                                                        <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlActivityF" Width="90px"
                                                                                CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Acitvity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <%--<UC:Suggest ID="ddlLocationF" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChangedF" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                            <asp:DropDownList ID="ddlActivityE" Width="90px"
                                                                                CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvActivityE" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlActivityE" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                                                                            </div>
                                                                            <asp:HiddenField ID="hdnActivityE" Value='<%#Eval("Activity_ID") %>' runat="server" />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="GL Account" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGLAccount" runat="server" Text='<%# Bind("GL_Desc") %>' Width="170px" ToolTip="GL Account" />
                                                                        <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("GL_Code") %>' ToolTip="GL Code" Visible="false" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                    <FooterTemplate>
                                                                        <%--<asp:DropDownList ID="ddlGLAccountF" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlGLAccountF_SelectedIndexChanged" ToolTip="GL Account" ValidationGroup="btnSave">
                                                                </asp:DropDownList>--%>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlGLAccountFooter" Width="200px" class="md-form-control form-control" runat="server" ServiceMethod="GetGLCodeList" OnItem_Selected="ddlGLAccountF_Item_Selected"
                                                                                ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="btnadd" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                        <asp:Label ID="lblGLAccountF" Font-Bold="false" runat="server" Text='<%# Bind("GL_Desc") %>' Visible="false" ToolTip="GL Account" />
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlGLCode" runat="server" Width="200px" class="md-form-control form-control" IsMandatory="true" AutoPostBack="true"
                                                                                ServiceMethod="GetGLCodeEditList" OnItem_Selected="ddlGLCode_Edit" ErrorMessage="Select GL Account" ValidationGroup="btnadd" />
                                                                        </div>
                                                                        <%-- <asp:HiddenField ID="hdn_AccountLeg" runat="server" Value='<%#Eval("Acc_Leg") %>' />
                                                                        <asp:HiddenField ID="hdn_AccNature" runat="server" Value='<%#Eval("Acc_Nature") %>' />--%>
                                                                        <asp:HiddenField ID="hdn_GLCode" runat="server" Value='<%#Eval("GL_Code") %>' />
                                                                        <asp:HiddenField ID="hdn_GLDesc" runat="server" Value='<%#Eval("GL_Desc") %>' />

                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="SL code" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSL" runat="server" Text='<%#Eval("SL_CODE")%>' ToolTip="SL code"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="SL Account" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSldesc" runat="server" Text='<%#Eval("SL_DESC")%>' Width="170px" ToolTip="SL code"></asp:Label>
                                                                        <asp:Label ID="lblSLcode" runat="server" Text='<%#Eval("SL_CODE")%>' ToolTip="SL code" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlSlAccountF" runat="server" Width="200px" ServiceMethod="GetSLCodeList" ItemToValidate="Value"
                                                                                WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="btnadd" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlSLCode" Width="200px" runat="server" class="md-form-control form-control" IsMandatory="false" ServiceMethod="GetEditSLCodeList" AutoPostBack="true"
                                                                                ErrorMessage="Select SL Account" ItemToValidate="Value" ValidationGroup="btnadd" />
                                                                            <asp:HiddenField ID="hdn_SLCode" runat="server" Value='<%#Eval("SL_Code") %>' />
                                                                            <asp:HiddenField ID="hdn_SLDesc" runat="server" Value='<%#Eval("SL_Desc") %>' />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Debit Accounting" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbldebitAccdesc" runat="server" Width="80px" Text='<%#Eval("Debit_Account")%>' ToolTip="Debit Accounting"></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Product/Services">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("ProductService")%>' ID="lblProductServices" Width="150px" ToolTip="Product Services"></asp:Label>
                                                                        <asp:HiddenField ID="hdnProductServicesId" runat="server" Value='<%#Eval("ProductService_ID") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlProductServicesF" Width="100px"
                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesF_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlProductServices" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlProductServicesF" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <%--<UC:Suggest ID="ddlLocationF" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChangedF" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                            <asp:DropDownList ID="ddlProductServicesE" Width="90px"
                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesE_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlProductServicesE" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlProductServicesE" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnProductServicesE" Value='<%#Eval("ProductService_ID") %>' runat="server" />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center"/>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tax Type">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("TaxType")%>' ID="lblTaxType" ToolTip="Product Services"></asp:Label>
                                                                        <asp:HiddenField ID="hdnTaxTypeId" runat="server" Value='<%#Eval("TaxType_ID") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlTaxTypeF" Width="90px"
                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTaxTypeF_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlTaxTypeF" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlTaxTypeF" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlTaxTypeE" Width="90px"
                                                                                CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlTaxTypeE_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlTaxTypeE" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlTaxTypeE" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Tax Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                                                                            </div>
                                                                            <asp:HiddenField ID="hdnTaxTypeE" Value='<%#Eval("TaxType_ID") %>' runat="server" />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="ITC Applicability">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("ITCApplicability")%>' ID="lblITCApplicability" ToolTip="ITC Applicability"></asp:Label>
                                                                        <asp:HiddenField ID="hdnITCApplicabilityId" runat="server" Value='<%#Eval("ITCApplicability_ID") %>' />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlITCApplicabilityF" Width="95px"
                                                                                CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlITCApplicabilityF" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlITCApplicabilityF" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlITCApplicabilityE" Width="90px"
                                                                                CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlITCApplicabilityE" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlITCApplicabilityE" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                                                                            </div>
                                                                            <asp:HiddenField ID="hdnITCApplicability_IDE" Value='<%#Eval("ITCApplicability_ID") %>' runat="server" />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtRateL" runat="server" Width="70px" AutoPostBack="true" OnTextChanged="txtRate_TextChanged"
                                                                            Style="text-align: right;" Text='<%#Eval("Rate")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtRateF" runat="server" Width="70px" AutoPostBack="true" OnTextChanged="txtRateL_TextChanged" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtRateF" runat="server" Enabled="True" FilterType="Numbers,Custom" TargetControlID="txtRateF" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVrate" CssClass="validation_msg_box_sapn" runat="server" SetFocusOnError="True" ControlToValidate="txtRateF" ErrorMessage="Enter Rate"
                                                                                    ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtRateE" runat="server" Width="70px" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;" OnTextChanged="txtRateE_TextChanged"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtRateE" runat="server" Enabled="True" FilterType="Numbers,Custom" TargetControlID="txtRateE" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVrateE" CssClass="validation_msg_box_sapn" runat="server" SetFocusOnError="True" ControlToValidate="txtRateE" ErrorMessage="Enter Rate"
                                                                                    ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnRate" runat="server" Value='<%#Eval("Rate") %>' />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtQuantityL" runat="server" AutoPostBack="true" Width="40px" MaxLength="3" OnTextChanged="txtQuantityL_TextChanged" Style="text-align: right;"
                                                                            Text='<%#Eval("Asset_Quantity")%>'></asp:Label>
                                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Asset_Quantity")%>' ToolTip="Quantity" Visible="false" Width="100%"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtquantity" runat="server" Width="40px" AutoPostBack="true" MaxLength="3" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtQuantity_TextChanged" Style="text-align: right;"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtquantity" runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtquantity"></cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator Display="dynamic" ID="RFVquantity" CssClass="validation_msg_box_sapn" runat="server" SetFocusOnError="True" ControlToValidate="txtquantity" ErrorMessage="Enter Quantity"
                                                                                    ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RangeValidator ID="rngquantity" runat="server" Display="Dynamic" ValidationGroup="btnadd" Enabled="true"
                                                                                    ControlToValidate="txtquantity" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 999" Type="Double" MinimumValue="1" MaximumValue="999"></asp:RangeValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtquantityE" runat="server" Width="50px" AutoPostBack="true" MaxLength="3" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtquantityE_TextChanged" Style="text-align: right;"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtquantityE" runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtquantityE"></cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator Display="dynamic" ID="RFVquantityE" CssClass="validation_msg_box_sapn" runat="server" SetFocusOnError="True" ControlToValidate="txtquantityE" ErrorMessage="Enter Quantity"
                                                                                    ValidationGroup="btnadd"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RangeValidator ID="rngquantity" runat="server" Display="Dynamic" ValidationGroup="btnadd" Enabled="true"
                                                                                    ControlToValidate="txtquantityE" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 999" Type="Double" MinimumValue="1" MaximumValue="999"></asp:RangeValidator>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnAssetQuantity" runat="server" Value='<%#Eval("Asset_Quantity") %>' />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="UOM" HeaderStyle-CssClass="styleGridHeader">
                                                                    <ItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtUOMID" runat="server" Width="70px" Text='<%# Bind("UOM_ID") %>' ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                                                ToolTip="UOM ID" Visible="false"></asp:TextBox>
                                                                            <asp:Label ID="txtUOM" runat="server" ReadOnly="true" Text='<%# Bind("UOM") %>' class="md-form-control form-control login_form_content_input requires_true"
                                                                                ToolTip="UOM"></asp:Label>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                        <%--   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" TargetControlID="txtQuantity"
                                                FilterType="Numbers" ValidChars="" Enabled="True">onblur="fnBlur()"onblur="fnBlur()"
                                            </cc1:FilteredTextBoxExtender>--%>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlUOM" Width="70px" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">

                                                                                <asp:RequiredFieldValidator ID="rfvUOM" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlUOM" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select UOM" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>

                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlUOME" Width="70px" runat="server" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">

                                                                                <asp:RequiredFieldValidator ID="rfvUOME" SetFocusOnError="True" runat="server"
                                                                                    ValidationGroup="btnadd" ControlToValidate="ddlUOME" CssClass="validation_msg_box_sapn"
                                                                                    ErrorMessage="Select UOM" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnUOMID" runat="server" Value='<%#Eval("UOM_ID") %>' />
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Discount Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtdiscount" runat="server" Style="text-align: right;" Text='<%#Eval("UNITDISCOUNT")%>' OnTextChanged="txtdiscount_TextChanged" AutoPostBack="true"></asp:Label>
                                                                        <asp:Label ID="lbldiscount" runat="server" Text='<%#Eval("UNITDISCOUNT")%>' ToolTip="Discount" Visible="false" Width="100%"></asp:Label>
                                                                        <asp:Label ID="lbltotdiscnt" runat="server" Text='<%#Eval("DISCOUNT")%>' ToolTip="Discount" Visible="false" Width="100%"></asp:Label>

                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtdiscountF" Width="70px" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtdiscountF_TextChanged" Style="text-align: right;"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtdiscountF" runat="server" Enabled="True" FilterType="Numbers,Custom" TargetControlID="txtdiscountF" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtdiscountE" Width="70px" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtdiscountE_TextChanged" Style="text-align: right;"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtdiscountE" runat="server" Enabled="True" FilterType="Numbers,Custom" TargetControlID="txtdiscountE" ValidChars="."></cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                        <asp:HiddenField ID="hdnUNITDISCOUNT" runat="server" Value='<%#Eval("UNITDISCOUNT") %>' />
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Taxable Amount" ItemStyle-HorizontalAlign="Right">
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
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtamtE" runat="server" Width="90px" ReadOnly="true" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                        <asp:HiddenField ID="hdnAMOUNT" runat="server" Value='<%#Eval("AMOUNT") %>' />
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tax Rate" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                        <asp:Label ID="txtTAXPERCENTAGE" runat="server" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTAXPERCENTAGF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                         <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="VAT Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTAXAMOUNT" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                        <asp:Label ID="txtTAXAMOUNT" runat="server" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTAXAMOUNTF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                    </FooterTemplate>
                                                                       <EditItemTemplate>
                                                                         <asp:Label ID="lblTAXAMOUNTE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Total Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTOTALAMOUNT" runat="server" Width="90px" Style="text-align: right" ToolTip="Total Amount" Text='<%#Eval("TOTALAMOUNT")%>'></asp:Label>
                                                                        <asp:Label ID="txtTOTALAMOUNT" runat="server" Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblTOTALAMOUNTF" runat="server" Width="90px" Style="text-align: right" ToolTip="Total Amount" Text='<%#Eval("TOTALAMOUNT")%>'></asp:Label>
                                                                    </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                         <asp:Label ID="lblTOTALAMOUNTE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TOTALAMOUNT")%>'></asp:Label>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>

                                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" class="grid_btn"
                                                                            AccessKey="J" title="Edit[Alt+J]"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <%-- <FooterTemplate>
                                                                        <button class="grid_btn" id="lnkAdd" validationgroup="VgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="lnkAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                    </FooterTemplate>--%>
                                                                    <EditItemTemplate>
                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                                            ValidationGroup="btnadd" AccessKey="U" title="Update[Alt+U]"></asp:LinkButton>
                                                                    </EditItemTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="lnkRemove" runat="server" CssClass="grid_btn_delete" CausesValidation="false" CommandName="Delete" Text="Remove" ToolTip="Remove from the grid" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <button class="grid_btn" id="btnAdd" validationgroup="btnadd" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <%-- <asp:TemplateField HeaderText="Action">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn_delete" AccessKey="T" ToolTip="Delete, Alt+T" OnClientClick="return confirm('Do you want to delete this record?');" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="btnAdd" Text="Add" CommandName="ADDNEW" ToolTip="Add, Alt+A" ValidationGroup="Add" AccessKey="A" runat="server" CssClass="grid_btn" />
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>--%>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </asp:Panel>

                                            </div>
                                        </div>

                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>


                    </div>

                    <div class="btn_height"></div>
                    <div align="right">

                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>

                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>

                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>

                        <%--<asp:Button ID="btnPrint" OnClick="btnPrint_Click" runat="server" />--%>


                        <button class="css_btn_enabled" id="btnCancelTrans" title="PBJ Cancel[Alt+C]" onclick="if(fnCancelClick())" causesvalidation="false" onserverclick="btnCancelTrans_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;PBJ <u>C</u>ancel
                        </button>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>



    <div>
        <asp:HiddenField ID="hdnIB" runat="server" />
        <asp:ValidationSummary ValidationGroup="Save" ID="vs_AssetTransaction" runat="server" Visible="false"
            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
        <asp:ValidationSummary ValidationGroup="AssetcodeAdd" ID="VSAssetcodeAdd" runat="server" Visible="false"
            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
        &nbsp;
                <asp:ValidationSummary ValidationGroup="InvoiceAdd" ID="VSInvoiceAdd" runat="server" Visible="false"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
        <asp:ValidationSummary ValidationGroup="btnadd" ID="vs_expense_add" runat="server" Visible="false"
            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

        <asp:CustomValidator ID="CVAssetTransaction" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" />
    </div>








    <script type="text/javascript" language="javascript">


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




        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }



        function checkDate_NextSystemDate1(sender, args) {

            var today = new Date();
            if (sender._selectedDate > today) {

                //alert('You cannot select a date greater than system date');
                alert('PBJ Date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));

            }
            document.getElementById(sender._textbox._element.id).focus();

        }

        function checkDate_Nextinvoicedate(sender, args) {

            var today = "<%=getser_date%>";
            if (sender._selectedDate > today) {

                //alert('You cannot select a date greater than system date');
                alert('Invoice Date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));

            }
            document.getElementById(sender._textbox._element.id).focus();

        }


        function fnCancelClick() {

            if (confirm('Do you want to cancel PBJ?')) {
                return true;
            }
            else {
                return false;
            }
        }

        function fnTrashSuggest(e) {
            //Sathish R--13-11-2018
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

        function fnTrashCommonSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCode.ClientID %>').value = "";


                }
            }
        }

    </script>

</asp:Content>
