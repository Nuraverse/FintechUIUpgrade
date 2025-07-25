<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Reports_FANatureWiseFundSummaryReport, App_Web_aagoig1p" title="" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td class="stylePageHeading">
                            <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                                <table width="100%">


                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label ID="lblFunder" ToolTip="Funder" runat="server" Text="Funder"
                                                CssClass="styleReqFieldLabel" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <cc1:ComboBox ID="cmbFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" Width="100px" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged">
                                            </cc1:ComboBox>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                                CssClass="styleReqFieldLabel" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:DropDownList ID="ddlNatureofFund" onmouseover="ddl_itemchanged(this)" runat="server" class="md-form-control form-control">
                                            </asp:DropDownList>
                                        </td>

                                    </tr>
                                    <tr>

                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblDate" Text="Start Date" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtdate" runat="server" Width="130px" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgStartDate" TargetControlID="txtdate">
                                            </cc1:CalendarExtender>
                                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtdate" runat="server" ControlToValidate="txtDate"
                                                    ErrorMessage="Select From Date" CssClass="validation_msg_box_sapn" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                                            </div>
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="Label1" Text="End Date" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:TextBox ID="txtenddate" runat="server" Width="130px" AutoPostBack="true" OnTextChanged="txtenddate_OnTextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="Image1" TargetControlID="txtenddate">
                                            </cc1:CalendarExtender>
                                            <asp:Image runat="server" ID="Image1" Visible="false" />
                                            <asp:RequiredFieldValidator ID="rfvtxtenddate" runat="server" ControlToValidate="txtenddate"
                                                ErrorMessage="Select End Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblfund" Text="Detail" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:CheckBox ID="chkfunder" runat="server" />
                                        </td>
                                        <td class="styleFieldLabel">
                                            <asp:Label runat="server" ID="lblSSL" Text="Include SSL" Visible="false" />
                                        </td>
                                        <td class="styleFieldAlign">
                                            <asp:CheckBox ID="chkSSL" runat="server" Visible="false" />
                                        </td>
                                    </tr>


                                </table>
                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <td align="center">
                            <asp:Button ID="btnGo" runat="server" Text="Go" ValidationGroup="vgGo"
                                class="css_btn_enabled" OnClick="btnGo_Click" ToolTip="Go,Alt+G" AccessKey="G" />
                            <asp:Button ID="btnClear" runat="server" class="css_btn_enabled" CausesValidation="False"
                                Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_OnClick"
                                ToolTip="Clear the Details,Alt+L" AccessKey="L" />
                            <asp:Button runat="server" ID="btnCancel" Text="Exit" CausesValidation="false" OnClientClick="return fnConfirmExit();"
                                class="css_btn_enabled" OnClick="btnCancel_Click" ToolTip="Exit the Page,Alt+X" AccessKey="X" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlSummary" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Nature of Fundwise Summary Report" Width="100%">
                                <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found" OnRowDataBound="grvtransaction_OnDataBound">
                                                    <%-- OnRowDataBound="grvtransaction_OnDataBound" OnRowCreated="grvtransaction_OnRowCreated" DataKeyNames="FUNDER_ID,funder_name" OnRowDataBound="grvtransaction_OnDataBound" --%>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Funder Name"></asp:Label>
                                                                <asp:Label ID="lblFunderID" runat="server" Text='<%# Bind("FUNDER_ID") %>' Visible="false"></asp:Label>
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
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="pnlDtl" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Nature of Fundwise Summary Report Details" Width="100%">
                                <div id="divDtls" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grvFundFlowDtl" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("FUND_NATURE") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Deal_Number"></asp:Label>
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
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="pnlSSL" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Nature of Fundwise Summary Report - SSL" Width="100%">
                                <div id="divSSL" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grvSSL" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%" EmptyDataText="No Detials Found">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Nature of Fund">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundType" runat="server" Text='<%# Bind("fund_nature") %>' ToolTip="Fund Type"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Deal_Number"></asp:Label>
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
                                                        <asp:TemplateField Visible="false" HeaderText="Receipts">
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
                                                        <asp:TemplateField Visible="false" HeaderText="Payments">
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
                                                        <asp:TemplateField Visible="false" HeaderText="Int Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblIntRate" runat="server" Style="text-align: right;" Text='<%# Bind("TOTAL_RATE1") %>' ToolTip="Interest Rate"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <br />
                            <%-- <asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Visible="false" Text="Print" OnClick="btnPrint_Click" />--%>
                            <asp:Button ID="btnexcel" runat="server" class="css_btn_enabled" CausesValidation="False"
                                Visible="false" Text="Excel" OnClick="FunExcelExport" ToolTip="Export Data to Excel.Alt+E" AccessKey="E" />
                            <asp:Button ID="btnexcelSSL" runat="server" class="css_btn_enabled" CausesValidation="False"
                                Visible="false" Text="Excel SSL" OnClick="FunExcelExportSSL" ToolTip="Export SSl Data,Alt+Q" AccessKey="Q" />
                            <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
                        </td>
                    </tr>
                    <%--                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Funder Details" Width="100%">
                                <div id="div1" runat="server" style="overflow: scroll; height: 200px; display:none" >
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Funder Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFunCode" runat="server" Text='<%# Bind("funder_Code") %>' ToolTip="Deal_Number"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Funder Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFunName" runat="server" Text='<%# Bind("funder_name") %>' ToolTip="Deal_Number"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Nature of Fund">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFunNat" runat="server" Text='<%# Bind("NATURE_OF_FUND") %>' ToolTip="Fund Type"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="A/C No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBankACNo" runat="server" Text='<%# Bind("BNK_ACCT_NUMB") %>' ToolTip="A/C No."></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Funder Limit Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFLAmt" runat="server" Style="text-align: right;" Text='<%# Bind("FUND_LIM_AMOUNT") %>' ToolTip="Facility Amount"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalFL" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Opening Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblopenbal" runat="server" Style="text-align: right;" Text='<%# Bind("OPEN_BAL") %>' ToolTip="Opening Balance"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipts">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRec" runat="server" Style="text-align: right;" Text='<%# Bind("RECEIPT") %>' ToolTip="Receipts"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalRec" runat="server" Style="text-align: right;" ToolTip="Total Receipts"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payments">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPayAmt" runat="server" Style="text-align: right;" Text='<%# Bind("PAYMENT") %>' ToolTip="Payments"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblPayAmt" runat="server" Style="text-align: right;" ToolTip="Total Payments"></asp:Label>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Closing Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcloseBal" runat="server" Style="text-align: right;" Text='<%# Bind("CLOSE_BAL") %>' ToolTip="Closing Balance"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            </asp:Panel>
                        </td>
                    </tr>--%>
                    <tr>
                        <td align="center">
                            <br />
                            <asp:Button ID="BtnExc" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                Visible="false" Text="Excel" OnClick="FunExcelExport" />
                            <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <asp:ValidationSummary ID="vsDealinflow" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                            <asp:CustomValidator ID="cvDealInflow" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </td>
                    </tr>

                </table>
            </td>
        </tr>

    </table>

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
</asp:Content>

