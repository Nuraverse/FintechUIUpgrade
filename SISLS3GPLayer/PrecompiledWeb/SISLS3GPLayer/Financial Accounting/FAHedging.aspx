<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAHedging, App_Web_4hds5vgj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td valign="top" colspan="2" style="width: 50%">
                                                <asp:Panel ID="pnlAgentDetails" runat="server" ToolTip="Agent Details" GroupingText="Agent Details"
                                                    CssClass="stylePanel" Width="100%">
                                                    <table cellspacing="0">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblAgentCode" runat="server" Text="Agent Code" CssClass="styleReqFieldLabel" />
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <asp:TextBox ID="txtAgentCode" runat="server" />
                                                                <asp:RequiredFieldValidator ID="rfvAgentCode" runat="server" ControlToValidate="txtAgentCode"
                                                                    ValidationGroup="VgSave" SetFocusOnError="true" ErrorMessage="Enter Agent Code"
                                                                    Display="None" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label runat="server" ID="lblAgentName" Text="Agent Name" />
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <%--   <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" />--%>
                                                                <asp:TextBox ID="txtAgentName" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                    ToolTip="Agent Name" ReadOnly="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="styleReqFieldLabel" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table>
                                                                    <tr>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:Label ID="lblPhone" runat="server" Text="Phone" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtPhone" runat="server" Width="100px" />
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPhone"
                                                                                FilterType="Numbers" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:Label ID="lblMobile" runat="server" Text="[M]" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtMobile" runat="server" Width="100px" />
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMobile"
                                                                                FilterType="Numbers" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td valign="top" colspan="2">
                                                <asp:Panel ID="pnlAccountDetails" Width="100%" GroupingText="Account Details" runat="server"
                                                    ToolTip="Account Details" CssClass="stylePanel">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="50%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblAccountNo" runat="server" Text="Account Number" CssClass="styleReqFieldLabel" />
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <asp:TextBox ID="txtAccountNo" runat="server" Width="50%" />
                                                                <asp:RequiredFieldValidator ID="rfvAccountNo" runat="server" ControlToValidate="txtAccountNo"
                                                                    ValidationGroup="VgSave" SetFocusOnError="true" ErrorMessage="Enter Account No"
                                                                    Display="None" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%" style="padding-bottom: 0px">
                                                                <asp:Label ID="lblAccountDesc" runat="server" Text="Account Description" CssClass="styleReqFieldLabel" />
                                                            </td>
                                                            <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                <asp:TextBox ID="txtAccountDesc" runat="server" Width="80%" />
                                                                <asp:RequiredFieldValidator ID="rfvAccountDesc" runat="server" ControlToValidate="txtAccountDesc"
                                                                    ValidationGroup="VgSave" SetFocusOnError="true" ErrorMessage="Enter Account Description"
                                                                    Display="None" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblIncomeTaxNo" runat="server" Text="Income Tax Number" CssClass="styleReqFieldlabel" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtIncomeTaxNo" runat="server" Width="60%" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblRegistrationNo" runat="server" Text="Registration Number" CssClass="styleReqFieldLabel" />
                                                            </td>
                                                            <td class="styleFieldAlign">
                                                                <asp:TextBox ID="txtRegistrationNo" runat="server" Width="60%" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlBankDetails" runat="server" ToolTip="Bank Details" GroupingText="Bank Details"
                                        CssClass="stylePanel">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="gvBankDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                                                        ShowFooter="true" OnRowDataBound="gvBankDetails_RowDataBound" OnRowCommand="gvBankDetails_RowCommand"
                                                        OnRowDeleting="gvBankDetails_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Bank Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBankName" runat="server" Text=' <%# Bind("BankName") %> ' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtBankName" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ControlToValidate="txtBankName"
                                                                        SetFocusOnError="true" ValidationGroup="VgAdd" ErrorMessage="Enter Bank Name"
                                                                        Display="None" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Bank Address">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBankAddress" runat="server" Text=' <%# Bind("BankAddress") %> ' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtBankAddress" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="rfvBankAddress" runat="server" ControlToValidate="txtBankAddress"
                                                                        SetFocusOnError="true" ValidationGroup="VgAdd" ErrorMessage="Enter Bank Address"
                                                                        Display="None" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IFS Code">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblIFSCode" runat="server" Text=' <%# Bind("IFSCode") %> ' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtIFSCode" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="rfvIFSCode" runat="server" ControlToValidate="txtIFSCode"
                                                                        SetFocusOnError="true" ValidationGroup="VgAdd" ErrorMessage="Enter IFS Code"
                                                                        Display="None" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountType" runat="server" Text=' <%# Bind("AccountType") %> ' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAccountType" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="rfvAccountType" runat="server" ControlToValidate="txtAccountType"
                                                                        SetFocusOnError="true" ValidationGroup="VgAdd" ErrorMessage="Enter Account Type"
                                                                        Display="None" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountNumber" runat="server" Text=' <%# Bind("AccountNumber") %> ' />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:TextBox ID="txtAccountNumber" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" ControlToValidate="txtAccountNumber"
                                                                        SetFocusOnError="true" ValidationGroup="VgAdd" ErrorMessage="Enter Account Number"
                                                                        Display="None" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Action">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="VgAdd" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:TabContainer ID="tcHedging" runat="server" CssClass="styleTabPanel" Width="100%"
                                        ScrollBars="None" ActiveTabIndex="0">
                                        <cc1:TabPanel runat="server" ID="tpMainPage" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Main Page
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Panel ID="pnlMainPage" runat="server" CssClass="stylePanel">
                                                                        <table width="100%" align="center">
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Hedge Ref. Number" CssClass="styleReqFieldLabel"
                                                                                        ID="lblHedgeRefNo" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtHedgeRefNo" runat="server" ToolTip="Hedge Ref No" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Hedge Status" ID="lblHedgeStatus" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtHedgeStatus" runat="server" ToolTip="Hedge Status" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Hedge Date" ID="lblHedgeDate" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtHedgeDate" runat="server" Width="40%" />
                                                                                    <cc1:CalendarExtender ID="CEHedgeDate" runat="server" TargetControlID="txtHedgeDate"
                                                                                        PopupButtonID="txtHedgeDate" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Premium Unit" ID="lblPremiumUnit" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtPremiumUnit" runat="server" ToolTip="Date" Width="34%" />
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtPremiumUnit"
                                                                                        FilterType="Numbers,Custom" ValidChars="." />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Hedge Location" ID="lblHedgeLocation" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtHedgeLocation" runat="server" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Premium Rate" ID="lblPremiumRate" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtPremiumRate" runat="server" ToolTip="Premium Rate" Width="34%" />
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtPremiumRate"
                                                                                        FilterType="Numbers,Custom" ValidChars="." />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Hedge Due Date" ID="lblHedgeDueDate" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtHedgeDueDate" runat="server" Width="40%" />
                                                                                    <cc1:CalendarExtender ID="CEHedgeDueDate" runat="server" TargetControlID="txtHedgeDueDate"
                                                                                        PopupButtonID="txtHedgeDueDate" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Premium Date" ID="lblPremiumDate" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtPremiumDate" runat="server" Width="40%" />
                                                                                    <cc1:CalendarExtender ID="CEPremiumDate" runat="server" TargetControlID="txtPremiumDate"
                                                                                        PopupButtonID="txtPremiumDate" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label runat="server" Text="Hedge Currency" ID="lblHedgeCurrency" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:DropDownList ID="ddlHedgeCurrency" runat="server" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label ID="lblPremiumFreq" runat="server" Text="Premium Frequency" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:DropDownList ID="ddlPremiumFreq" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label ID="lblHedgeCoverAmount" runat="server" Text="Hedge Cover Amount" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtHedgeCoverAmount" runat="server" Width="34%" />
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtHedgeCoverAmount"
                                                                                        FilterType="Numbers,Custom" ValidChars="." />
                                                                                </td>
                                                                                <td colspan="2">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </asp:Panel>
                                                                </td>
                                                                <td>
                                                                    <asp:Panel ID="pnlMainPageRemarks" runat="server" CssClass="stylePanel">
                                                                        <table width="100%" align="center">
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label ID="lblRemarks" runat="server" Text="Remarks" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Height="100%" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                    <asp:Label ID="lblHedgingScan" runat="server" Text="Hedging Scan" CssClass="styleReqFieldLabel" />
                                                                                </td>
                                                                                <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                    <asp:Button ID="btnBrowse" runat="server" Text="Browse..." />
                                                                                </td>
                                                                            </tr>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" HeaderText="History" ID="tpHistory" CssClass="tabpan"
                                            BackColor="Red">
                                            <ContentTemplate>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr align="center">
                                            <td>
                                                <asp:Button ID="btnSave" CssClass="styleSubmitButton" runat="server" OnClientClick="return fnCheckPageValidators('VgSave',false);"
                                                    Text="Save" OnClick="btnSave_Click" CausesValidation="false" />
                                                <asp:Button ID="btnClear" CssClass="styleSubmitButton" runat="server" Text="Clear_FA"
                                                    OnClientClick="return fnConfirmClear();" CausesValidation="False" OnClick="btnClear_Click" />
                                                <asp:Button ID="btnCancel" CssClass="styleSubmitButton" runat="server" CausesValidation="False"
                                                    Text="Cancel" OnClick="btnCancel_Click" />
                                            </td>
                                        </tr>
                                        <tr class="styleButtonArea">
                                            <td>
                                                <asp:ValidationSummary runat="server" ID="VSSave" HeaderText="Correct the following validation(s):"
                                                    Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgSave" Width="500px"
                                                    ShowMessageBox="false" ShowSummary="true" />
                                            </td>
                                        </tr>
                                        <tr class="styleButtonArea">
                                            <td>
                                                <asp:ValidationSummary runat="server" ID="VSAdd" HeaderText="Correct the following validation(s):"
                                                    Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgAdd" Width="500px"
                                                    ShowMessageBox="false" ShowSummary="true" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
