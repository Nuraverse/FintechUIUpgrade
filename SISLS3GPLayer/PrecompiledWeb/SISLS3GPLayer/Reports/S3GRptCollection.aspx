<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" title="Collection Report" inherits="Reports_S3GRptCollection, App_Web_qvacefhr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="ContentCollection" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="updCollection" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Collection Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="DdlLOB" ToolTip="Line of Business" runat="server"
                                                AutoPostBack="true" OnSelectedIndexChanged="DdlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <%-- <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVLOB" runat="server" ErrorMessage="Select a Line Of Business."
                                                    ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="DdlLOB"
                                                    InitialValue="-1" CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Line Of Business" ToolTip="Line of Business" ID="LblLOB" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLocation1" runat="server" AutoPostBack="true"
                                                ToolTip="Location 1" class="md-form-control form-control"
                                                OnSelectedIndexChanged="ddlLocation1_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Branch" ToolTip="Branch" ID="lblLocation1"
                                                    CssClass="styleMandatoryLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="DdlLocation2" ToolTip="Branch2" runat="server"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Branch2" ToolTip="Branch2" ID="LblLocation2"
                                                    CssClass="styleMandatoryLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkAccountLevel" OnCheckedChanged="chkAccountLevel_CheckedChanged" AutoPostBack="true" runat="server" ToolTip="Account Level" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" Text="Account Level" ToolTip="Account Level" ID="LblAccountLevel">
                                            </asp:Label>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="DdlDenomination" runat="server" ToolTip="Denomination" AutoPostBack="true"
                                                OnSelectedIndexChanged="DdlDenomination_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RfvDenomination" runat="server" ErrorMessage="Select a Denomination."
                                                    ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True"
                                                    ControlToValidate="DdlDenomination" InitialValue="-1" CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Denomination" ToolTip="Denomination" ID="LblDenomination" CssClass="styleReqFieldLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFromDateSearch" runat="server" AutoPostBack="true" ToolTip="From Date"
                                                OnTextChanged="txtFromDateSearch_TextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgFromDateSearch" ToolTip="From Date" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderFromDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgFromDateSearch" TargetControlID="txtFromDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVFromDate" ValidationGroup="Ok" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtFromDateSearch" SetFocusOnError="True"
                                                    ErrorMessage="Select From Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="From Date" ID="lblFromDateSearch"
                                                    ToolTip="From Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtToDateSearch" runat="server" AutoPostBack="true" ToolTip="To Date"
                                                OnTextChanged="txtToDateSearch_TextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgToDateSearch" runat="server" ToolTip="To Date" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderToDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgToDateSearch" TargetControlID="txtToDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVToDate" ValidationGroup="Ok" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtToDateSearch" SetFocusOnError="True" ErrorMessage="Select To Date"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblToDateSearch" Text="To Date" ToolTip="To Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDebtCollectorType" runat="server" OnSelectedIndexChanged="ddlDebtCollectorType_SelectedIndexChanged"
                                                AutoPostBack="true" class="md-form-control form-control"
                                                ToolTip="Debt Collector Type">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDebtCollector" runat="server" Text="Debt Collector" CssClass="styleDisplayLabel"
                                                    ToolTip="Debt Collector"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDraweeBank" runat="server" ToolTip="Drawee Bank" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlDraweeBank_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Drawee Bank" ToolTip="" ID="lblDraweeBank" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlReceiptMode" runat="server" ToolTip="Receipt Mode" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlReceiptMode_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Receipt Mode" ToolTip="" ID="lblMode" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSMECustomers" runat="server" ToolTip="SME Customers" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlSMECustomers_SelectedIndexChanged" class="md-form-control form-control">
                                                <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="SME Customers" ToolTip="SME Customers" ID="lblSMECustomers" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlCompliance" runat="server" ToolTip="Compliance" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlCompliance_SelectedIndexChanged" class="md-form-control form-control">
                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="No" Selected="True" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Compliance" ToolTip="Compliance" ID="lblCompliance" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlNTDType" runat="server" ToolTip="NTD Type" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlNTDType_SelectedIndexChanged" class="md-form-control form-control">
                                                <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="NTD" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="PNTD" Value="10"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="NTD Type" ToolTip="Compliance" ID="lblNTDType" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLegalType" runat="server" ToolTip="Legal Type" class="md-form-control form-control">
                                                <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Collection against Court cases" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Collection against ROP cases" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Legal Type" ToolTip="Legal Type" ID="lblLegalType" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCashRangeFrom" runat="server" Style="text-align: right" AutoPostBack="false" ToolTip="Cash Range From"
                                                            OnTextChanged="txtCashRangeFrom_TextChanged"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtCashRangeFrom" runat="server" ValidChars="." FilterType="Numbers,Custom"
                                                            TargetControlID="txtCashRangeFrom">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCashRangeTo" runat="server" Style="text-align: right" AutoPostBack="false" ToolTip="Cash Range To"
                                                            OnTextChanged="txtCashRangeTo_TextChanged"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="flttxtCashRangeTo" ValidChars="." runat="server" FilterType="Numbers,Custom"
                                                            TargetControlID="txtCashRangeTo">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Cash Range" ToolTip="Cash Range" ID="lblCashRange" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkChequeReturn" runat="server" ToolTip="Cheque Return" AutoPostBack="true" OnCheckedChanged="chkChequeReturn_CheckedChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" Text="Cheque Return" ToolTip="Cheque Return" ID="lblChequeReturn">
                                            </asp:Label>

                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkDCWise" runat="server" ToolTip="DC Wise Cheque Return" AutoPostBack="true" OnCheckedChanged="chkDCWise_CheckedChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" Text="DC Wise Cheque Return" ToolTip="DC Wise Cheque Return" ID="lblDCWiseReturn">
                                            </asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onclick="if(fnCheckPageValidators('Ok',false))" onserverclick="btnGo_Click" validationgroup="Ok" runat="server"
                            type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>

                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="imgExcel" visible="false" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrintExcel_Click" runat="server"
                            type="button" accesskey="P">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>


                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblCurrency" runat="server" ToolTip="Currency"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="PnlCollectionDetails" runat="server" CssClass="stylePanel" Width="100%">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <div id="divCollection" runat="server" style="height: 300px; overflow: scroll">
                                                <asp:GridView ID="grvCollection" runat="server"
                                                    Width="100%" AutoGenerateColumns="false" OnRowDataBound="grvCollection_RowDataBound" CssClass="styleInfoLabel" Style="margin-bottom: 0px"
                                                    ShowFooter="true" HeaderStyle-CssClass="Freezing">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchName" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" ToolTip="Total" runat="server" Text="Total" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomerName" ToolTip="Customer Name" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            <%--<FooterStyle HorizontalAlign="center" />--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Mobile Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMobile" ToolTip="Moble Number" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            <%--<FooterStyle HorizontalAlign="center" />--%>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No."
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrimeAccountNo" runat="server" ToolTip="Account No."
                                                                    Text='<%# Bind("PrimeAccountNumber") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>

                                                        <%--<asp:TemplateField HeaderText="Sub Account No." ItemStyle-HorizontalAlign="center">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubAccountNo" runat="server" ToolTip="Sub Account No." 
                                        Text='<%# Bind("SubAccountNumber") %>'></asp:Label>
                                </ItemTemplate>                               
                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                            </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Debt Collector" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDebtCollector" runat="server" ToolTip="Debt Collector"
                                                                    Text='<%# Bind("Debtcollectorcode") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceiptNumber" runat="server" ToolTip="Receipt No." Text='<%# Bind("ReceiptNumber") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt Date" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceiptDate" ToolTip="Receipt Date" runat="server" Text='<%# Bind("ReceiptDate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt Amount" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceiptAmount" runat="server" Text='<%# Bind("ReceiptAmount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceiptAmount" ToolTip="Receipt Amount" runat="server" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Collection Amount" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTotalCollection" ToolTip="Total Collection Amount" runat="server" Text='<%# Bind("TotalCollectionAmount") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalCollection" ToolTip="Total Collection Amount" runat="server" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Instrument Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInstrument" ToolTip="Instrument Number" runat="server" Text='<%# Bind("Instrument_Number") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bank Name" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBank" ToolTip="Bank" runat="server" Text='<%# Bind("Bank") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque Return Advice Date" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCheckReturnDate" ToolTip="Check Return Date" runat="server" Text='<%# Bind("CHK_RETDATE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <%--   <asp:TemplateField HeaderText="Total Collection Amount" ItemStyle-HorizontalAlign="center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalCollection" ToolTip="Total Collection Amount" runat="server" Text='<%# Bind("TotalCollectionAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalCollection" ToolTip="Total Collection Amount" runat="server" align="center"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" Width="10%" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Installment" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCurrentCollection" ToolTip="Current Collection" runat="server" Text='<%# Bind("CurrentCollection") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalCurrentCollection" ToolTip="Current Collection" runat="server" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="15%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Arrears Collection" ItemStyle-HorizontalAlign="center" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblArrearsCollection" runat="server" ToolTip="Arrears Collection" Text='<%# Bind("ArrearsCollection") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalArrearsCollection" runat="server" ToolTip="Arrears Collection" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Insurance" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInsurance" ToolTip="Insurance" runat="server" Text='<%# Bind("Insurance") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalInsurance" ToolTip="Total Insurance Amount" runat="server" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterest" runat="server"
                                                                    Text='<%# Bind("Interest") %>' ToolTip="Interest"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalInterest" runat="server" ToolTip="Total Interest Amount" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ODI"
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblODI" runat="server" ToolTip="ODI."
                                                                    Text='<%# Bind("OverDueInterest") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalODI" runat="server" ToolTip="Total ODI Amount" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Memo Charges"
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMemoCharges" runat="server"
                                                                    Text='<%# Bind("MemoCharges") %>' ToolTip="Memo Charges"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalMemoCharges" runat="server" ToolTip="Total Memo Charges" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="CRC" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCRC" runat="server" ToolTip="CRC"
                                                                    Text='<%# Bind("CRC") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalCRC" runat="server" align="center" ToolTip="CRC"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="LIP" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLIP" runat="server" ToolTip="CRC"
                                                                    Text='<%# Bind("LIP") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalLIP" runat="server" align="center" ToolTip="LIP"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Others" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblOthers" runat="server" ToolTip="Others"
                                                                    Text='<%# Bind("Others") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalOthers" runat="server" align="center" ToolTip="Total Other Charges"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <div id="divCheque" runat="server" style="height: 300px; overflow: scroll">
                                                <asp:GridView ID="grvDCCheque" runat="server" OnRowDataBound="grvDCCheque_RowDataBound"
                                                    Width="100%" AutoGenerateColumns="false" CssClass="styleInfoLabel" Style="margin-bottom: 0px"
                                                    ShowFooter="true" HeaderStyle-CssClass="Freezing">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S No" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" ToolTip="Account No" runat="server" Text='<%# Bind("SNO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLobName" ToolTip="Line of Business" runat="server" Text='<%# Bind("Lob_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLocation" ToolTip="Branch" runat="server" Text='<%# Bind("Location_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountNo" ToolTip="Account No" runat="server" Text='<%# Bind("ACCOUNT_NO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCUSTOMER_NAME" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Location"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" ToolTip="Total" runat="server" Text="Total" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Officer" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSHORT_NAME" ToolTip="Marketing Officer" runat="server" Text='<%# Bind("SHORT_NAME") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblINSTALLMENT_NO" runat="server" Text='<%# Bind("INSTALLMENT_NO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Appro Amount" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblINSTALL_RCPT_AMT" ToolTip="Installment Appro Amount" runat="server" Text='<%# Bind("INSTALL_RCPT_AMT") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Date" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDUE_DATE" runat="server" ToolTip="Receipt No." Text='<%# Bind("DUE_DATE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt No." ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceiptNo" runat="server" ToolTip="Receipt No." Text='<%# Bind("RECEIPT_NO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipt Date" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceiptDate" runat="server" ToolTip="Receipt Date" Text='<%# Bind("Receipt_Date") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Doc Type" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDocType" ToolTip="Doc Type" runat="server" Text='<%# Bind("Doc_Type") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque Return Advice Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCHEQUE_RETURN_ADVICE_NO" ToolTip="Cheque Number" runat="server" Text='<%# Bind("CHEQUE_RETURN_ADVICE_NO") %>'></asp:Label>
                                                                <asp:Label ID="lblCHEQUE_CNt_TOT" Text='<%# Bind("Cheque_Cnt") %>' runat="server" align="center" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Cheque Amount" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCHEQUE_AMOUNT" ToolTip="Cheque Amount" runat="server" Text='<%# Bind("CHEQUE_AMOUNT") %>'></asp:Label>
                                                                <asp:Label ID="lblCHEQUE_AMOUNT_TOT" Text='<%# Bind("Cheque_Amt_TOT") %>' runat="server" align="center" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalCHEQUE_AMOUNT" ToolTip="Total Cheque Amount" runat="server" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="15%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                         <asp:TemplateField HeaderText="Cheque Date" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCheckReturnDate" ToolTip="Check Return Date" runat="server" Text='<%# Bind("RETURN_DATE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCHEQUE_NO" ToolTip="CHEQUE_NO" runat="server" Text='<%# Bind("CHEQUE_NO") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalCHEQUE_COUNT" ToolTip="Total Cheque Count" runat="server" align="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Reason" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReason" runat="server"
                                                                    Text='<%# Bind("REASON") %>' ToolTip="Reason"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Debt Collector"
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDC_NAME" runat="server" ToolTip="DC NAME"
                                                                    Text='<%# Bind("DC_NAME") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Over Due"
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblARREAR_DUES" runat="server"
                                                                    Text='<%# Bind("ARREAR_DUES") %>' ToolTip="Memo Charges"></asp:Label>
                                                                <asp:Label ID="lblArrear_Dues_Decimal_TOT" Text='<%# Bind("Arrear_Dues_Decimal_TOT") %>' runat="server" align="center" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalARREAR_DUES" runat="server" ToolTip="Total Over Due" align="center"></asp:Label>

                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Over Due days before colln"
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbloverdue_before" runat="server"
                                                                    Text='<%# Bind("overdue_before") %>' ToolTip="Over Due days before colln"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Over Due days after colln"
                                                            ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbloverdue_after" runat="server"
                                                                    Text='<%# Bind("overdue_after") %>' ToolTip="Over Due days after colln"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCREMARKS" runat="server" ToolTip="CRC"
                                                                    Text='<%# Bind("REMARKS") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Mobile Number" ItemStyle-HorizontalAlign="center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMobileNo" runat="server" ToolTip="CRC"
                                                                    Text='<%# Bind("MOBILE_NUMBER") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="left" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" visible="false" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                            type="button" accesskey="P">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>

















                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td width="50%" align="center">
                                        <asp:ValidationSummary ValidationGroup="Ok" ID="vsCollection" runat="server"
                                            CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                                            ShowSummary="true" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <%--<script language="javascript" type="text/javascript">
 function Resize()
     {
       if(document.getElementById('ctl00_ContentPlaceHolder1_divCollection') != null)
       {
         if(document.getElementById('divMenu').style.display=='none')
            {
             (document.getElementById('ctl00_ContentPlaceHolder1_divCollection')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
         else
           {
             (document.getElementById('ctl00_ContentPlaceHolder1_divCollection')).style.width = screen.width - 270;
           }
        }  
      }
    </script>   --%>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="imgExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
