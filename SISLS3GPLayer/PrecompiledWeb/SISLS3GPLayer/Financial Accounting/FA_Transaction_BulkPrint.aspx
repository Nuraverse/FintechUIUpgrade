<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_Transaction_BulkPrint, App_Web_4hds5vgj" title="" %>

<%@ Register TagPrefix="uc3" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Document Type" ID="pnlDocumentType" runat="server" CssClass="stylePanel"
                                ToolTip="Lessee / Vendor Details">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddldocumentType" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddldocumentType_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvDocumentType" ValidationGroup="Search" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddldocumentType"
                                                    ErrorMessage="Select Document Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDocumentType" runat="server" Text="Document Type" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Payment Details" ID="pnlPayment" runat="server" CssClass="stylePanel"
                                ToolTip="Payment Details" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtpmtfromdate" runat="server" ToolTip="From Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgpmtfromdate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CEFromdate" runat="server" Enabled="True"
                                                PopupButtonID="imgpmtfromdate" TargetControlID="txtpmtfromdate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
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
                                            <asp:TextBox ID="txtpmttodate" runat="server" ToolTip="To Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgpmttodate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CETodate" runat="server" Enabled="True"
                                                PopupButtonID="imgpmttodate" TargetControlID="txtpmttodate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label2" CssClass="styleDisplayLabel" Text="To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="uctrans" runat="server" ServiceMethod="GetLSQNo"
                                                class="md-form-control form-control" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label4" CssClass="styleDisplayLabel" Text="Transaction Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Check List Search Details" ID="pnlPOSearch" runat="server" CssClass="stylePanel"
                                ToolTip="Check List Search Details" Style="display: none">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPO_From_Date" runat="server" ToolTip="From Date"
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
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPO_To_Date" runat="server" ToolTip="To Date"
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
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlPOCustomerName" runat="server" ServiceMethod="GetCustomerNameDetails"
                                                class="md-form-control form-control" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPOCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlPOLoadSequenceNo" runat="server" ServiceMethod="GetLSQNo"
                                                class="md-form-control form-control" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblPOLoadSequenceNo" CssClass="styleDisplayLabel" Text="Proposal Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server" validationgroup="Search"
                            type="button" accesskey="S" title="Search [Alt+S]">
                            <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Payment Details" ID="pnlpaymentdetails" runat="server" Visible="false" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="gvPayment" runat="server" AutoGenerateColumns="False" DataKeyNames="RowNumber" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SL.No." HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPOSlNo" runat="server" Text='<%# Eval("RowNumber") %>' />
                                                            <asp:Label ID="lblPO_dtl_ID" runat="server" Text='<%# Eval("Tran_Header_ID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Voucher Number" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Number" runat="server" Text='<%# Eval("voucher_No") %>' ToolTip="Proposal Number" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Voucher  Date" HeaderStyle-CssClass="styleGridHeader">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPO_Date" runat="server" Text='<%# Eval("Voucher_Date") %>'
                                                                ToolTip="Proposal  Date" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

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
                            <asp:Panel GroupingText="Print Details" ID="pnlPrintDetails" runat="server" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPrintType" runat="server" class="md-form-control form-control">
                                                <asp:ListItem Value="P" Text="PDF"></asp:ListItem>
                                                <asp:ListItem Value="W" Text="WORD"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPrintType" runat="server" Text="Print Type" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server" validationgroup="Print"
                            type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" enabled="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>
                    <div class="row">
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
</asp:Content>

