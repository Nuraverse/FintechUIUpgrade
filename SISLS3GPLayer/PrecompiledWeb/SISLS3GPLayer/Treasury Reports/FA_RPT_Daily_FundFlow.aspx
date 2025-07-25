<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Reports_FA_RPT_Daily_FundFlow, App_Web_u0nem2mh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>

                    <%-- <div id="dvInvImgs" style="float: right; border-bottom: 1px; width: 130px; height: 0px; cursor: pointer; background-image: none; position: relative; margin-top: -5px; margin-right: -100px;">--%>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="cmbFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" Width="170px" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblFunder" ToolTip="Funder" runat="server" Text="Funder"
                                                    CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlNatureofFund" AutoPostBack="true" OnSelectedIndexChanged="ddlNatureofFund_SelectedIndexChanged" onmouseover="ddl_itemchanged(this)" runat="server"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                                    CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtdate" OnTextChanged="txtdate_TextChanged" AutoPostBack="true" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgStartDate" TargetControlID="txtdate">
                                            </cc1:CalendarExtender>
                                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtdate" runat="server" ControlToValidate="txtDate"
                                                    ErrorMessage="Select From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDate" Text="Start Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtenddate" runat="server" AutoPostBack="true" OnTextChanged="txtenddate_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image1" TargetControlID="txtenddate">
                                            </cc1:CalendarExtender>
                                            <asp:Image runat="server" ID="Image1" Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtenddate" runat="server" ControlToValidate="txtenddate"
                                                    ErrorMessage="Select End Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label1" Text="End Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div id="divchkfunder" style="display:none" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkfunder" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" ID="lblfund" Text="Detail" />
                                        </div>
                                    </div>
                                    <div id="divChkSSl" style="display:none" runat="server" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkSSL" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label runat="server" ID="lblSSL" Text="Include SSL" />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                            type="button" caccesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" visible="false" id="btnCancel" title="Cancel[Alt+X]"
                            causesvalidation="false" onserverclick="BtnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                        </button>

                        <button class="css_btn_enabled" id="btnexcel" runat="server"
                            type="button" caccesskey="E" onserverclick="FunExcelExport" title="Export to Excel,Alt+E">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport to Excel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlSummary" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fund Flow Summarry Report" Width="100%">
                                <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found" OnRowDataBound="grvtransaction_OnDataBound">
                                                    <%-- OnRowDataBound="grvtransaction_OnDataBound" OnRowCreated="grvtransaction_OnRowCreated" DataKeyNames="FUNDER_ID,funder_name" OnRowDataBound="grvtransaction_OnDataBound" --%>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Funder Name"></asp:Label>
                                                                <asp:Label ID="lblFunderID" runat="server" Text='<%# Bind("FUNDER_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="A/C No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAcctNum" runat="server" Text='<%# Bind("Acct_Number") %>' ToolTip="A/C No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>


                                                                <asp:Label ID="lblTot" runat="server" Style="text-align: left;" ToolTip="Total" Text="Total Borrowing"></asp:Label>

                                                            </FooterTemplate>
                                                            <FooterStyle CssClass="styleGridHeader" HorizontalAlign="Left" />

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                                <asp:Label ID="lblFacAmt1" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT") %>' ToolTip="Facility Amount" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>

                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>

                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                                <asp:Label ID="lblopeningbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance") %>' ToolTip="Opening Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>

                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>


                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Receipt"></asp:Label>
                                                                <asp:Label ID="lblReceipt1" runat="server" Style="text-align: right;" Text='<%# Bind("receipts") %>' ToolTip="Tranche" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>

                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>


                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPayment" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Payments"></asp:Label>
                                                                <asp:Label ID="lblPayment1" runat="server" Style="text-align: right;" Text='<%# Bind("payments") %>' ToolTip="Sanction number" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>

                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>

                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                                <asp:Label ID="lblclosingbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance") %>' ToolTip="Closing Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>

                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>

                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Weigh Ave. Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>

                                                                <asp:Label ID="lblWeigAvgF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>

                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="pnlBankBorrowerDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Bank Borrowings " Width="100%">
                                <div id="divBankBorrowerDetails" runat="server" style="overflow: scroll; height: 150px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvBorrowerBankDetails" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found" OnRowDataBound="grvtBankDetails_OnDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotall" runat="server" Style="text-align: right;" Text="Total" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                                <asp:Label ID="lblFacAmt1" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT") %>' ToolTip="Facility Amount" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                                <asp:Label ID="lblopeningbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance") %>' ToolTip="Opening Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Receipt"></asp:Label>
                                                                <asp:Label ID="lblReceipt1" runat="server" Style="text-align: right;" Text='<%# Bind("receipts") %>' ToolTip="Tranche" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPayment" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Payments"></asp:Label>
                                                                <asp:Label ID="lblPayment1" runat="server" Style="text-align: right;" Text='<%# Bind("payments") %>' ToolTip="Sanction number" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                                <asp:Label ID="lblclosingbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance") %>' ToolTip="Closing Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false" HeaderText="Weigh Ave. Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblWeigAvgF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="pnlbond" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fund Flow Summarry Report-CD" Width="100%">
                                <div id="div2bond" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvtransactionCD" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found" OnRowDataBound="grvtransactionCD_OnDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Funder Name"></asp:Label>
                                                                <asp:Label ID="lblFunderID" runat="server" Text='<%# Bind("FUNDER_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="A/C No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAcctNum" runat="server" Text='<%# Bind("Acct_Number") %>' ToolTip="A/C No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTot" runat="server" Style="text-align: left;" ToolTip="Total" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                                <asp:Label ID="lblFacAmt1" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT") %>' ToolTip="Facility Amount" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                                <asp:Label ID="lblopeningbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance") %>' ToolTip="Opening Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Receipt"></asp:Label>
                                                                <asp:Label ID="lblReceipt1" runat="server" Style="text-align: right;" Text='<%# Bind("receipts") %>' ToolTip="Tranche" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPayment" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Payments"></asp:Label>
                                                                <asp:Label ID="lblPayment1" runat="server" Style="text-align: right;" Text='<%# Bind("payments") %>' ToolTip="Sanction number" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                                <asp:Label ID="lblclosingbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance") %>' ToolTip="Closing Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Weigh Ave. Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                            <ItemStyle HorizontalAlign="Right" />

                                                            <FooterTemplate>
                                                                <asp:Label ID="lblWeigAvgF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fund Flow Summarry Report-Bond" Width="100%">
                                <div id="div2" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvtransactionbond" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found" OnRowDataBound="grvtransactionbond_OnDataBound">
                                                    <%-- OnRowDataBound="grvtransaction_OnDataBound" OnRowCreated="grvtransaction_OnRowCreated" DataKeyNames="FUNDER_ID,funder_name" OnRowDataBound="grvtransaction_OnDataBound" --%>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Funder Name"></asp:Label>
                                                                <asp:Label ID="lblFunderID" runat="server" Text='<%# Bind("FUNDER_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="A/C No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAcctNum" runat="server" Text='<%# Bind("Acct_Number") %>' ToolTip="A/C No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTot" runat="server" Style="text-align: left;" ToolTip="Total" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                                <asp:Label ID="lblFacAmt1" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT") %>' ToolTip="Facility Amount" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                                <asp:Label ID="lblopeningbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance") %>' ToolTip="Opening Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Receipt"></asp:Label>
                                                                <asp:Label ID="lblReceipt1" runat="server" Style="text-align: right;" Text='<%# Bind("receipts") %>' ToolTip="Tranche" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPayment" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Payments"></asp:Label>
                                                                <asp:Label ID="lblPayment1" runat="server" Style="text-align: right;" Text='<%# Bind("payments") %>' ToolTip="Sanction number" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                                <asp:Label ID="lblclosingbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance") %>' ToolTip="Closing Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Weigh Ave. Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblWeigAvgF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="pnlOverAllTotal" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Over All Total" Width="100%">
                                <div id="divOverAllTotal" runat="server" style="overflow: scroll; height: 150px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvOverallTotal" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found" OnRowDataBound="grvtBankDetails_OnDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotall" runat="server" Style="text-align: right;" Text="Total" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                                <asp:Label ID="lblFacAmt1" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT") %>' ToolTip="Facility Amount" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                                <asp:Label ID="lblopeningbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance") %>' ToolTip="Opening Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipt" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Receipt"></asp:Label>
                                                                <asp:Label ID="lblReceipt1" runat="server" Style="text-align: right;" Text='<%# Bind("receipts") %>' ToolTip="Tranche" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPayment" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Payments"></asp:Label>
                                                                <asp:Label ID="lblPayment1" runat="server" Style="text-align: right;" Text='<%# Bind("payments") %>' ToolTip="Sanction number" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                                <asp:Label ID="lblclosingbalance1" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance") %>' ToolTip="Closing Balance" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false" HeaderText="Weigh Ave. Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblWeigAvgF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Summary Details" Width="100%">
                                <div id="div1" runat="server" style="overflow: scroll; height: 200px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="gvSummary" runat="server" AutoGenerateColumns="False" BorderWidth="2" OnRowDataBound="gvSummary_OnDataBound"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblNatureofFund" runat="server" Text='<%# Bind("Nature_Fund") %>' ToolTip="Funder Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Style="text-align: right;" Text="Total" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblClosingBalence" runat="server" Text='<%# Bind("close_balance1") %>' ToolTip="Funder Name"></asp:Label>

                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Weigh Ave. Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblWeigAvg" runat="server" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Funder Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblWeigAvgF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>

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
                            <asp:Panel ID="pnlNoFacilityBanks" runat="server" CssClass="stylePanel" Visible="false" GroupingText="No Facility banks" Width="100%">
                                <div id="divNoFaciltiyBanks" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvNoFacilityBanks" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Banks" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("BankName") %>' ToolTip="Funder Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GL Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("GL_Account") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTot" runat="server" Style="text-align: left;" ToolTip="Total" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAcctNum" runat="server" Text='<%# Bind("Closing_Balance1") %>' ToolTip="A/C No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotlClosing" runat="server" Style="text-align: left;" ToolTip="Total" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="pnlDtl" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fund Flow Period Report Details" Width="100%">
                                <div id="divDtls" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvFundFlowDtl" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Deal_Number"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("FUND_NATURE") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="A/C No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAcctNum" runat="server" Text='<%# Bind("Acct_Number") %>' ToolTip="A/C No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tranche Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFundername" runat="server" Text='<%# Bind("FUND_TRANCHE_NO") %>' ToolTip="Funder name"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranche" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Tranche"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSanctionNumber" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Sanction number"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Int Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
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
                            <asp:Panel ID="pnlSSL" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fund Flow Period Report - SSL" Width="100%">
                                <div id="divSSL" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvSSL" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="gird_details" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Deal_Number"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="A/C No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAcctNum" runat="server" Text='<%# Bind("Acct_Number") %>' ToolTip="A/C No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Total" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Facility Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalFac" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Opening Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblopeningbalance" runat="server" Style="text-align: right;" Text='<%# Bind("open_balance1") %>' ToolTip="Opening Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotopeningbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Receipts">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranche" runat="server" Style="text-align: right;" Text='<%# Bind("receipts1") %>' ToolTip="Tranche"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Payments">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSanctionNumber" runat="server" Style="text-align: right;" Text='<%# Bind("payments1") %>' ToolTip="Sanction number"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalPayments" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Closing Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblclosingbalance" runat="server" Style="text-align: right;" Text='<%# Bind("close_balance1") %>' ToolTip="Closing Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotclosingbalance" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Int Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE1") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnexcelSSL" runat="server" visible="false"
                            type="button" caccesskey="Q" title="Excel SSL Data,Alt+Q">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u></u>Excel SSL Data
                        </button>
                        <button class="css_btn_enabled" id="BtnExc" runat="server" visible="false"
                            type="button" caccesskey="E" title="Excel,Alt+E">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsDealinflow" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:CustomValidator ID="cvDealInflow" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>


                    



                    <%--    <script type="text/javascript">

        var cal1;

        function pageLoad() {
            cal1 = $find("calendar1");
            modifyCalDelegates(cal1);
        }

        function modifyCalDelegates(cal) {
            //we need to modify the original delegate of the month cell. 
            cal._cell$delegates = {
                mouseover: Function.createDelegate(cal, cal._cell_onmouseover),
                mouseout: Function.createDelegate(cal, cal._cell_onmouseout),

                click: Function.createDelegate(cal, function (e) {
                    /// <summary>  
                    /// Handles the click event of a cell 
                    /// </summary> 
                    /// <param name="e" type="Sys.UI.DomEvent">The arguments for the event</param> 

                    e.stopPropagation();
                    e.preventDefault();

                    if (!cal._enabled) return;

                    var target = e.target;
                    var visibleDate = cal._getEffectiveVisibleDate();
                    Sys.UI.DomElement.removeCssClass(target.parentNode, "ajax__calendar_hover");
                    switch (target.mode) {
                        case "prev":
                        case "next":
                            cal._switchMonth(target.date);
                            break;
                        case "title":
                            switch (cal._mode) {
                                case "days": cal._switchMode("months"); break;
                                case "months": cal._switchMode("years"); break;
                            }
                            break;
                        case "month":
                            //if the mode is month, then stop switching to day mode. 
                            if (target.month == visibleDate.getMonth()) {
                                //this._switchMode("days"); 
                            } else {
                                cal._visibleDate = target.date;
                                //this._switchMode("days"); 
                            }
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                        case "year":
                            if (target.date.getFullYear() == visibleDate.getFullYear()) {
                                cal._switchMode("months");
                            } else {
                                cal._visibleDate = target.date;
                                cal._switchMode("months");
                            }
                            break;

                            //                case "day":                             
                            //                    this.set_selectedDate(target.date);                             
                            //                    this._switchMonth(target.date);                             
                            //                    this._blur.post(true);                             
                            //                    this.raiseDateSelectionChanged();                             
                            //                    break;                             
                        case "today":
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                    }

                })
            }

        }

        function onCalendarShown(sender, args) {
            //set the default mode to month 
            sender._switchMode("months", true);
            changeCellHandlers(cal1);
        }


     
        function changeCellHandlers(cal) {

            if (cal._monthsBody) {

                //remove the old handler of each month body. 
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $common.removeHandlers(row.cells[j].firstChild, cal._cell$delegates);
                    }
                }
                //add the new handler of each month body. 
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $addHandlers(row.cells[j].firstChild, cal._cell$delegates);
                    }
                }

            }
        }
      
      

    </script>--%>
                    </div>
                </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnexcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

