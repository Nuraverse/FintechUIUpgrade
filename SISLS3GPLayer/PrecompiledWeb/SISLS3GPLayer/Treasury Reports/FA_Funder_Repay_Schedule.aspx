<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/FAMasterPageCollapse.master" inherits="Reports_FA_Funder_Repay_Schedule, App_Web_aagoig1p" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Funder Repay Schedule" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel" style="width: 7%">
                                <asp:Label ID="lblFunder" runat="server" Text="Funder">
                                </asp:Label>
                            </td>
                            <td class="styleFieldLabel" style="width: 7%">
                                <cc1:ComboBox ID="cmbFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" Width="170px" AppendDataBoundItems="true" CaseSensitive="false"
                                    AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="cmbFunder"
                                    InitialValue="--Select--" Display="None" ErrorMessage="Select Funder" ValidationGroup="Header"></asp:RequiredFieldValidator>
                            </td>
                            <td class="styleFieldLabel" style="width: 7%">
                                <asp:Label runat="server" ID="lblReceiptPrint" Text="Receipt Details" />
                            </td>
                            <td class="styleFieldLabel" width="7%">
                                <asp:CheckBox ID="chkReceiptPrint" runat="server" AutoPostBack="true" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" CssClass="styleSubmitButton"
                    ValidationGroup="Header" />
                <asp:Button ID="btnClear" runat="server" Text="Clear_FA" OnClientClick="return fnConfirmClear();"
                    OnClick="btnClear_Click" CssClass="styleSubmitButton" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="styleSubmitButton"
                    OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGridDetails" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: block">
                                    <asp:GridView ID="grvGridDetails" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                        CssClass="styleInfoLabel" OnRowDataBound="grvGridDetails_DataBound" Width="100%" ShowFooter="true" ShowHeader="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Deal No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDealNo" runat="server" Text='<%# Bind("Deal_No") %>' ToolTip="Deal No"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Tranche Ref">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTrancheRef" runat="server" Text='<%# Bind("Tranche_ref") %>' ToolTip="Tranche Ref"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Funder Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFunderName" runat="server" Text='<%# Bind("Funder_Name") %>' ToolTip="Funder Name"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sanction Ref">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSanctionRef" runat="server" Text='<%# Bind("Sanction_ref") %>'
                                                        ToolTip="Sanction ref"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction Ref">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTransactionRef" runat="server" Text='<%# Bind("Transaction_ref") %>'
                                                        ToolTip="Transaction ref"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text="Total:"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <FooterStyle Font-Bold="true" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTransactionAmt" runat="server" Text='<%# Bind("Transaction_Amt") %>'
                                                        ToolTip="Transaction Amount"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalTransactionAmount" runat="server" Text=""></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Currency">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCurrency" runat="server" Text='<%# Bind("Currency") %>' ToolTip="Currency"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="From Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFromDate" runat="server" Text='<%# Bind("From_Date") %>' ToolTip="From Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblToDate" runat="server" Text='<%# Bind("To_Date") %>' ToolTip="To Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Interest Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInterestRate" runat="server" Text='<%# Bind("Interest_Rate") %>'
                                                        ToolTip="To Date"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalInterestrate" runat="server" Text=""></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Receipt Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceiptDate" runat="server" Text='<%# Bind("Receipt_Date") %>'
                                                        ToolTip="To Date"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Receipt Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceiptAmount" runat="server" Text='<%# Bind("Receipt_Amount") %>'
                                                        ToolTip="Receipt Amount"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalReceiptAmount" runat="server" Text=""></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle Font-Bold="true" HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="Print" CssClass="styleSubmitButton" />
                <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vs" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                    ValidationGroup="Header" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
            </td>
        </tr>
    </table>
</asp:Content>
