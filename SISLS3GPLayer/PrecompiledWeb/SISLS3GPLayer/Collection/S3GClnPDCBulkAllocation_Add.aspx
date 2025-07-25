<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnPDCBulkAllocation_Add, App_Web_f2u5fcxj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();
        }
        function fnNewLoadCustomer() {
            document.getElementById("<%= btnToCustomer.ClientID %>").click();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleInfoLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px">
                        <asp:Panel ID="pnlGeneral" runat="server" CssClass="stylePanel" GroupingText="General"
                            Width="99%">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            ToolTip="Line of Business">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="None" InitialValue="0"
                                            ErrorMessage="Select the Line of Business" ControlToValidate="ddlLOB" SetFocusOnError="True"
                                            ValidationGroup="GenRcpt"></asp:RequiredFieldValidator>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" AutoPostBack="True" OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                            ServiceMethod="GetBranchList" IsMandatory="true" ValidationGroup="GenRcpt" ErrorMessage="Select a Location" WatermarkText="--Select--" />
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code/Name" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                        <asp:Label ID="lblInclude" runat="server" Text="Include Past" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtCustomerCode" runat="server" MaxLength="50" Style="display: none;"></asp:TextBox>
                                        <uc3:ICM ID="ucCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" TextWidth="122px" DispalyContent="Both" onblur="return fnLoadCustomer();" strLOV_Code="CMDFOUR" />
                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_Click"
                                            Style="display: none" /><input id="Hidden2" type="hidden" runat="server" />
                                        <asp:CheckBox ID="CbxInclude" runat="server" AutoPostBack="True" OnCheckedChanged="CbxInclude_CheckedChanged" Visible="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblPDCDate" runat="server" Text="Banking From Date" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox runat="server" ID="txtDate" AutoPostBack="True" ToolTip="Banking From Date"
                                            OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                        <asp:Image ID="imgPDCDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Banking From Date" Width="18px" />
                                        <asp:RequiredFieldValidator ID="RFVPDCDate" CssClass="styleMandatoryLabel" runat="server"
                                            ControlToValidate="txtDate" Display="None" ErrorMessage="Select the PDC Banking Date"
                                            ValidationGroup="GenRcpt"></asp:RequiredFieldValidator>
                                        <cc1:CalendarExtender ID="CECPDCdate" runat="server" Enabled="True"
                                            PopupButtonID="imgPDCDate" TargetControlID="txtDate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblBankToDate" runat="server" Text="Banking To Date" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" style="padding-left: 7px">
                                        <asp:TextBox runat="server" ID="txtBankTodate" AutoPostBack="True" ToolTip="Banking To Date"
                                            OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                                        <asp:Image ID="imgBankToDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Banking To Date" Width="18px" />
                                        <cc1:CalendarExtender ID="calBankToDate" runat="server" Enabled="True"
                                            PopupButtonID="imgBankToDate" TargetControlID="txtBankTodate" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Clearing Type" ID="lblClearing_Type" CssClass="styleDisplayLabel" ToolTip="Clearing Type"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlClearingType" runat="server" ToolTip="Issuer By">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Drawee Bank & Place" ID="lblDraweeBank" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlDraweeBank" runat="server" ToolTip="Drawee Bank"
                                            onchange="itemchanged()">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Deposit Bank" ID="Label1" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Drawee Bank Account No" ID="lblAccountNumber" CssClass="styleDisplayLabel" ToolTip="Drawee Bank Account No"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtAccountNumber" runat="server" ToolTip="Drawee Bank Account No">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="height: 10px">
                                    <td colspan="6"></td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="center">
                                        <asp:Button runat="server" ID="btnGetLines" CssClass="styleSubmitButton" Text="Get Cheques" AccessKey="Q" ToolTip="Get Cheques,Alt+Q"
                                            OnClick="btnGetLines_Click" ValidationGroup="GenRcpt" />
                                    </td>                                    
                                </tr>
                                <tr style="height: 10px">
                                    <td colspan="6"></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlCheque" runat="server" CssClass="stylePanel" GroupingText="Cheque Details"
                            Width="99%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td colspan="4 " width="100%">
                                        <asp:GridView ID="gvPDCReceipts" runat="server" CssClass="styleInfoLabel" AutoGenerateColumns="False"
                                            Width="100%" OnRowDataBound="gvPDCReceipts_RowDataBound" ToolTip="Cheque Details">
                                            <Columns>                                                
                                                <asp:TemplateField HeaderText="Prime Account No" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPAN" runat="server" Text='<%# Eval("PANum")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                </asp:TemplateField>                                               
                                                <asp:TemplateField HeaderText="Customer Name" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustID" runat="server" Text='<%# Eval("Customer_ID") %>' Visible="false" />
                                                        <asp:Label ID="lblCustomer" runat="server" Text='<%# Eval("Customer")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Installment No" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblINSTALLMENTNUMBER" runat="server" Text='<%# Eval("InstallmentNumber")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="4%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Installment Date" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentDate" runat="server" Text='<%# Eval("InstallmentDate")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="8%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Instrument Date" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrumentDate" runat="server" Text='<%# Eval("Instrument_Date")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Bank Date" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRevisedBankDate" runat="server" Text='<%# Eval("REVISED_BANKDATE")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="8%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Drawee Bank" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <%-- <asp:HiddenField ID="hidBankID" runat="server" Value='<%# Eval("Drawee_Bank_ID") %>' />--%>
                                                        <asp:Label ID="lblBank" runat="server" Text='<%# Eval("Drawee_Bank_Name")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="MICR" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMICR" runat="server" Text='<%# Eval("MICR")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Instrument No" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrumentNo" runat="server" Text='<%# Eval("Instrument_No")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="8%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Installment Amount" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstrumentAmount" runat="server" Text='<%# Eval("Instrument_Amount")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Others Charges" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblothers" runat="server" Text='<%# Eval("Others_Amount")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Receipt No" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceiptNo" runat="server" Text='<%# Eval("Receipt_No")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%--Columns newly added - Kuppu - June 13 - Starts---%>
                                                <asp:TemplateField HeaderText="Insurance" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInsurance" runat="server" Text='<%# Eval("Insurance")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tax" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTax" runat="server" Text='<%# Eval("Tax")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Cheque Type" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCheque_Type" runat="server" Text='<%# Eval("Cheque_Type")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Cheque Status" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCheque_Status" runat="server" Text='<%# Eval("Cheque_Status")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Clearing Type" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClearing_Type" runat="server" Text='<%# Eval("Clearing_Type")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotalAmount" runat="server" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%--Columns newly added - Kuppu - June 13 - Ends---%>
                                                <asp:TemplateField HeaderText="Exclude" HeaderStyle-CssClass="styleGridHeader">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CbxExculde" runat="server" />
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle Width="5%" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr style="height: 10px">
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlAllocation" runat="server" CssClass="stylePanel" GroupingText="Allocation Details"
                            Width="99%">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblNewCustomerName" runat="server" Text="Customer Code/Name" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtToCustomerName" runat="server" MaxLength="50" Style="display: none;"></asp:TextBox>
                                        <uc3:ICM ID="ucNewCustomerCodeLov" HoverMenuExtenderLeft="true" runat="server" TextWidth="122px" DispalyContent="Both" onblur="return fnNewLoadCustomer();" strLOV_Code="CMDFOUR" />
                                        <asp:Button ID="btnToCustomer" runat="server" Text="Load Customer" OnClick="btnToCustomer_Click"
                                            Style="display: none" /><input id="Hidden1" type="hidden" runat="server" />
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Operating Branch" ID="lblNewDraweeBank" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                         <uc:Suggest ID="suOperatingBranch" ToolTip="Location" runat="server" 
                                            ServiceMethod="GetBranchList" IsMandatory="false" ValidationGroup="GenRcpt" ErrorMessage="Select Operating Branch"
                                              WatermarkText="--Select--" />
                                    </td>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="New Deposit Bank & Place" ID="Label10" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:DropDownList ID="ddlNewDepositBank" ToolTip="New Deposit Bank & Place" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label runat="server" Text="Given By" ID="Label11" CssClass="styleDisplayLabel" ToolTip="Given By"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtGivenBy" runat="server" ToolTip="Given By">
                                        </asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel"></td>
                                    <td class="styleFieldAlign"></td>
                                    <td class="styleFieldLabel"></td>
                                    <td class="styleFieldAlign"></td>
                                </tr>
                                <tr style="height: 10px">
                                    <td colspan="6"></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGetLines" />
            <asp:PostBackTrigger ControlID="txtDate" />
        </Triggers>
    </asp:UpdatePanel>
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <asp:Button runat="server" ID="btnGetRec" CssClass="styleSubmitButton" Text="Generate  Receipts" AccessKey="R" ToolTip="Generate  Receipts,Alt+R"
                    ValidationGroup="GenRcpt" OnClick="btnGetRec_Click" OnClientClick="return fnCheckPageValidators('GenRcpt');"
                    Enabled="false" />
                <asp:Button runat="server" ID="btnXLPorting" Text="Export" CssClass="styleSubmitLongButton"
                    OnClick="btnXLPorting_Click" ToolTip="Export Cheque Details,Alt+E" AccessKey="E" />
                <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                    Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" AccessKey="L"
                    ToolTip="Clear,Alt+L" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Exit" AccessKey="X" ToolTip="Exit,Alt+X" OnClick="btnCancel_Click" OnClientClick="return fnConfirmExit();" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary runat="server" ID="vsPDC" HeaderText="Correct the following validation(s):"
                    Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                    ShowSummary="true" ValidationGroup="GenRcpt" />
                <asp:CustomValidator ID="cvPDC" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblErrorMessage" runat="server" Style="color: Red; font-size: medium"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

