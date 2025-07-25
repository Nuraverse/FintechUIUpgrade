<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdFactoringInvoiceRetirement, App_Web_yy0xp33b" title="Factoring Invoice Retirement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
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
                        <asp:Panel ID="pnlFactoringDetails" runat="server" CssClass="stylePanel" GroupingText="Factoring Invoice Details"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlBranch" runat="server" ToolTip="Location" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                            ValidationGroup="VGFIL" ErrorMessage="Select a Location" IsMandatory="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Location" ID="lblBranch" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFactdocno" runat="server" AutoPostBack="True" ToolTip="Factoring Invoice No"
                                            OnSelectedIndexChanged="ddlFactdocno_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVFactDocNo" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlFactdocno" InitialValue="0" ValidationGroup="VGFIL" ErrorMessage="Select a Factoring Invoice No"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Factoring Invoice No" ID="lblFactdocno" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtPAN" ReadOnly="True" ToolTip="Prime Account Number"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:DropDownList ID="ddlPAN" WidthVisible="false" runat="server" OnSelectedIndexChanged="ddlPAN_SelectedIndexChanged"
                                            AutoPostBack="True" ToolTip="Prime Account Number" Visible="false" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVMLA" Enabled="false" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="ddlPAN" InitialValue="0" ValidationGroup="VGFIL"
                                                ErrorMessage="Select a Prime Account Number" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Prime Account Number" ID="lblprimeaccno"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtSAN" ReadOnly="True" ToolTip="Sub Account Number" Visible="false"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:DropDownList ID="ddlSAN" Visible="false" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlSAN_SelectedIndexChanged" ToolTip="Sub Account Number" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVSLA" Enabled="False" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="ddlSAN" InitialValue="0" ValidationGroup="VGFIL"
                                                ErrorMessage="Select a Sub Account Number" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVSLA1" Enabled="False" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="ddlSAN" InitialValue="0" ValidationGroup="VGFILAdd"
                                                ErrorMessage="Select a Sub Account Number" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Sub Account Number" ID="lblsubAccno" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtFILNo" ReadOnly="True" ToolTip="FIL Number"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="FIL Number" ID="lblFILNo" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtFILDate" ReadOnly="true" ToolTip="FIL Date"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgFILDate" runat="server" Visible="False" ImageUrl="~/Images/calendaer.gif"
                                            ToolTip="FIL Date" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Enabled="False" CssClass="validation_msg_box_sapn"
                                                runat="server" ValidationGroup="VGFILAdd" ControlToValidate="txtFILDate" Display="Dynamic"
                                                ErrorMessage="Select Factoring Invoice Loading Date"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Enabled="False" CssClass="validation_msg_box_sapn"
                                                runat="server" ValidationGroup="VGFIL" ControlToValidate="txtFILDate" Display="Dynamic"
                                                ErrorMessage="Select Factoring Invoice Loading Date"></asp:RequiredFieldValidator>
                                        </div>
                                        <cc1:CalendarExtender ID="CECFILDATE" runat="server" Enabled="False" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgFILDate" TargetControlID="txtFILDate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="FIL Date" ID="lblFILRDate">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtStatus" ReadOnly="True" ToolTip="Status"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Status" ID="lblStatus" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtMargin" ReadOnly="True" Style="text-align: right"
                                            ToolTip="Margin %" class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Margin %" ID="lblMargin" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtCreditLimit" ReadOnly="True" Style="text-align: right"
                                            ToolTip="Credit Limit" class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Credit Limit" ID="lblCreditLimit" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtCreditAvailable" ReadOnly="true"
                                            Style="text-align: right" ToolTip="Credit Available"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Credit Available" ID="lblCreditAvailable" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtOutStandingAmount" Style="text-align: right"
                                            ToolTip="Outstanding amount" ReadOnly="true"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Outstanding Amount" ID="lblOutStandAmount" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtInvoiceLoadValue" ReadOnly="True"
                                            Style="text-align: right" ToolTip="Invoice Load Value"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="false" CssClass="validation_msg_box_sapn"
                                                runat="server" ValidationGroup="VGFILAdd" ControlToValidate="txtInvoiceLoadValue"
                                                Display="Dynamic" ErrorMessage="Enter the Invoice Load Value "></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Enabled="false" CssClass="validation_msg_box_sapn"
                                                runat="server" ValidationGroup="VGFIL" ControlToValidate="txtInvoiceLoadValue"
                                                Display="None" ErrorMessage="Enter the Invoice Load Value "></asp:RequiredFieldValidator>
                                        </div>
                                        <cc1:FilteredTextBoxExtender ID="fteAmount1" runat="server" TargetControlID="txtInvoiceLoadValue"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="False">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Invoice Load Value" ID="lblInvoiceloadvalue">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md- col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCreditDays" runat="server" MaxLength="3" Style="text-align: right"
                                            ToolTip="Credit Days" ReadOnly="true"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FTECreditDays" runat="server" Enabled="false" TargetControlID="txtCreditDays"
                                            FilterType="Numbers">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCreditDays" runat="server" CssClass="styleDisplayLabel" Text="Credit Days"> </asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="VGFILAdd" runat="server"
                                    type="button" accesskey="G" title="Go,Alt+G" visible="false">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlCommAddress" runat="server" CssClass="stylePanel" GroupingText="Customer Information"
                            Width="99%">
                            <asp:HiddenField ID="hidcuscode" runat="server" />
                            <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" ActiveViewIndex="1"
                                FirstColumnWidth="20%" SecondColumnWidth="30%" ThirdColumnWidth="20%" FourthColumnWidth="30%" />
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlInvDtl" runat="server" CssClass="stylePanel" GroupingText="Invoice Details"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="GRVFIL" AutoGenerateColumns="False" OnRowDataBound="GRVFIL_RowDataBound"
                                            Width="100%" CssClass="gird_details">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="40px" HeaderText="SI No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsno" runat="server" Text='<%# Bind("SNo")%>' Width="30px" ToolTip="SI No."></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="40px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Invoice No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("InvoiceNO")%>' Rows="2"
                                                            ToolTip="Invoice No"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceDate" runat="server" Text='<%# Bind("InvoiceDate")%>' ToolTip="Date"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Party Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPartyName" runat="server" Text='<%# Bind("PartyName")%>' ToolTip="Party Name"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Maturity Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Bind("MaturityDate")%>'
                                                            ReadOnly="true" ToolTip="Maturity Date" Style="border-color: White"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Invoice Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceAmount" runat="server" Text='<%# Bind("InvoiceAmount")%>'
                                                            ToolTip="Invoice Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Eligible Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEligibleAmount" runat="server" Text='<%# Bind("EligibleAmount")%>'
                                                            ToolTip="Eligible Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Received Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceivedAmount" runat="server" Text='<%# Bind("ReceivedAmount")%>'
                                                            ToolTip="Received Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlReceiptDtl" runat="server" CssClass="stylePanel" GroupingText="Receipt Information"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView runat="server" ID="grvMapping" AutoGenerateColumns="False" ShowFooter="true"
                                            Width="100%" OnRowCommand="grvMapping_RowCommand" OnRowDataBound="grvMapping_RowDataBound"
                                            OnRowDeleting="grvMapping_RowDeleting" CssClass="gird_details">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="40px" HeaderText="SI No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtsno" runat="server" Text='<%# Bind("SNo")%>' Width="30px" ToolTip="SI No."></asp:Label>
                                                        <asp:Label ID="lblFT_Retirement_Dtl_ID" runat="server" Visible="false"
                                                            Text='<%# Bind("FT_Retirement_Dtl_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="40px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Invoice No" ItemStyle-Width="140px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Bind("InvoiceNO")%>' ToolTip="Invoice Number"></asp:Label>
                                                        <asp:Label ID="lblInvoiceID" runat="server" Rows="2" Visible="false" ToolTip="Invoice No"
                                                            Text='<%# Bind("Factoring_Inv_Load_Details_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlInvoiceNo" runat="server" AutoPostBack="True" ToolTip="Invoice No"
                                                            OnSelectedIndexChanged="ddlInvoiceNo_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvInvoiceNo" runat="server" ErrorMessage="Select the Invoice Number"
                                                            ValidationGroup="vgGridMapp" CssClass="styleLoginLabel" ControlToValidate="ddlInvoiceNo"
                                                            InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="140px" HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Balance Amount" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUnreceivedAmount" runat="server" Text='<%# Bind("UnreceivedAmount")%>'
                                                            Style="text-align: right;" ToolTip="Balance Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblUnreceivedAmountF" runat="server" ToolTip="Balance Amount" Style="text-align: right;"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Receipt No" ItemStyle-Width="140px">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptNo" runat="server" Text='<%# Bind("ReceiptNO")%>' ToolTip="Invoice Number"></asp:Label>
                                                        <asp:Label ID="lblReceiptID" runat="server" Rows="2" Visible="false" ToolTip="Receipt No"
                                                            Text='<%# Bind("Receipt_Details_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:DropDownList ID="ddlReceiptNo" runat="server" AutoPostBack="True" ToolTip="Invoice No"
                                                            OnSelectedIndexChanged="ddlReceiptNo_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvReceiptNo" runat="server" ErrorMessage="Select the Receipt Number"
                                                            ValidationGroup="vgGridMapp" CssClass="styleLoginLabel" ControlToValidate="ddlReceiptNo"
                                                            InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="140px" HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Receipt Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptDate" runat="server" Text='<%# Bind("ReceiptDate")%>' ToolTip="Receipt Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblReceiptDateF" runat="server" ToolTip="Receipt Date"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Receipt Amount" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptAmount" runat="server" Text='<%# Bind("ReceiptAmount")%>'
                                                            Style="text-align: right;" ToolTip="Receipt Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblReceiptAmountF" runat="server" ToolTip="Receipt Amount" Style="text-align: right;"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unused Amount" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUnusedAmount" runat="server" Text='<%# Bind("UnusedAmount")%>'
                                                            Style="text-align: right;" ToolTip="Unused Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblUnusedAmountF" runat="server" ToolTip="Unused Amount" Style="text-align: right;"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Appropriation Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApprAmount" runat="server" Text='<%# Bind("App_Amount")%>' Style="text-align: right;"
                                                            ToolTip="Appropriation Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtApprAmountF" runat="server" MaxLength="13" Style="text-align: right;"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)" Width="90px" ToolTip="Appropriation Amount"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="fextxtApprAmountF" runat="server" TargetControlID="txtApprAmountF"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="rfvApprAmountF" runat="server" ErrorMessage="Enter the Appropriation Amount"
                                                            ValidationGroup="vgGridMapp" CssClass="styleLoginLabel" ControlToValidate="txtApprAmountF"
                                                            Display="None"></asp:RequiredFieldValidator>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action" HeaderStyle-Width="50px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnRemove" Text="Delete" CommandName="Delete" runat="server"
                                                            CausesValidation="false" ToolTip="Delete" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnAddrow" OnClientClick="return fnCheckPageValidators('vgGridMapp',false);"
                                                            runat="server" CommandName="AddNew" CssClass="styleGridShortButton" Text="Add"
                                                            ValidationGroup="vgGridMapp" ToolTip="Add"></asp:Button>
                                                    </FooterTemplate>
                                                    <ControlStyle Width="50px" />
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
                    <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvCustomerMaster" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(Return fnCheckPageValidators('VGFIL')"
                        onserverclick="btnSave_Click" runat="server" type="button" accesskey="S" validationgroup="VGFIL">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvFactoring" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Visible="false" Width="98%" ValidationGroup="VGFIL" />
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="VGFIL" />
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinfAdd" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="vgGridMapp" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary2" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="VGFILAdd" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="98%" ShowMessageBox="false" ShowSummary="true"
                            ValidationGroup="vgGridAdd" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        function SumScore(sufLen) {

            if (parseInt(sufLen) > 2) {
                sufLen = 2;
            }
            (document.getElementById('ctl00_ContentPlaceHolder1_txtTotalInvoiceAmt')).style.left = (document.getElementById('ctl00_ContentPlaceHolder1_GRVFIL_ctl02_txtInvoiceAmount').clientLeft);
            var TargetBaseControl = document.getElementById('ctl00_ContentPlaceHolder1_GRVFIL');
            var Inputs = TargetBaseControl.getElementsByTagName("input");
            var TotalInvoiceScore = 0;
            var TotalEligibleScore = 0;
            var MarginPer = 0;
            var InvoiceAmt = 0;
            MarginPer = document.getElementById('<%=txtMargin.ClientID%>').value;
            for (var n = 0; n < Inputs.length; ++n) {
                if (Inputs[n].type == 'text') {
                    if (Inputs[n].value != '') {
                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 13) == 'InvoiceAmount') {
                            TotalInvoiceScore = (parseFloat(TotalInvoiceScore) + parseFloat(Inputs[n].value)).toFixed(parseInt(sufLen));
                            InvoiceAmt = (parseFloat(Inputs[n].value)).toFixed(parseInt(sufLen));
                        }

                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 14) == 'EligibleAmount') {
                            Inputs[n].value = (parseFloat(InvoiceAmt - (InvoiceAmt * MarginPer) / 100)).toFixed(parseInt(sufLen));
                            TotalEligibleScore = (parseFloat(TotalEligibleScore) + parseFloat(Inputs[n].value)).toFixed(parseInt(sufLen));
                        }
                    }
                }

            }

        }




        function Resize() {
            if (document.getElementById('divMenu').style.display == 'none') {
                (document.getElementById('ctl00_ContentPlaceHolder1_tdEmpty')).style.width = screen.width - document.getElementById('divMenu').style.width - 500;
            }
            else {
                (document.getElementById('ctl00_ContentPlaceHolder1_tdEmpty')).style.width = '55px';
            }
        }

    </script>

</asp:Content>
