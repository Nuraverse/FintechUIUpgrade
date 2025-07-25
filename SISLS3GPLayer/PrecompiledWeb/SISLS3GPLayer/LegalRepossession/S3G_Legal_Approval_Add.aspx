<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3G_Legal_Approval_Add, App_Web_prpaho0u" title="Legal Approval" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UPApprovals" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr> 
                    <td class="stylePageHeading">
                        <%--  <table>
                    <tr>
                        <td>--%>
                        <asp:Label runat="server" Text="Approval" ID="lblHeading" CssClass="styleInfoLabel">
                        </asp:Label>
                        <%--  </td>
                    </tr>
                </table>--%>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <div style="margin-top: 0px; margin-bottom: 10px;">
                            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel GroupingText="Approval Details" ID="pnlApprovalDetails" runat="server"
                                            CssClass="stylePanel">
                                            <table width="100%" border="0">
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Approval Status</span>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="RBLApproved" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                            OnSelectedIndexChanged="RBLApproved_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="UnApproved" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="All"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td>
                                                        <asp:DropDownList ID="ddlActivity" Visible="false" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>

                                                    <td>
                                                        <asp:DropDownList ID="ddlDocumentType" Visible="false" runat="server" Width="200px" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVddlDocumentType" runat="server" ControlToValidate="ddlDocumentType"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Document Type"
                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel" Text="Lawyer Code"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <UC:Suggest ID="ddlLawyerCode" ToolTip="Lawyer Code" OnItem_Selected="ddlLawyerCode_Item_Selected" ErrorMessage="Select the Lawyer" runat="server" AutoPostBack="true" IsMandatory="true" ValidationGroup="btnGo" ServiceMethod="GetLawyerCode" />

                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblShemeType" runat="server" CssClass="styleReqFieldLabel" Text="Sheme Type"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlSchemeType" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvSchemeType" ValidationGroup="btnGo" runat="server" ControlToValidate="ddlSchemeType"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Scheme Type"
                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblDocument_No" runat="server" CssClass="styleReqFieldLabel" Text="Filter [ Invoice No. ]"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <UC:Suggest ID="ddlDocument_No" OnItem_Selected="ddlDocument_No_Item_Selected" ToolTip="Invoice Document No" runat="server" AutoPostBack="false" IsMandatory="false" ValidationGroup="Show" ServiceMethod="GetInvoiceNo" />
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Approval Status</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDocStatus" ReadOnly="true" runat="server" Width="90px">
                                                        </asp:TextBox>
                                                        <input type="hidden" value="0" runat="server" id="hdnID" />
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Approval Date</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDocumentDate" runat="server" Width="90px" ReadOnly="true"></asp:TextBox>
                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDocumentDate"
                                                            PopupButtonID="txtDocumentDate"
                                                            ID="CalendarExtender1">
                                                        </cc1:CalendarExtender>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td colspan="4">&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="center">
                                                        <asp:Button ID="btnGo" ValidationGroup="btnGo" CssClass="styleSubmitShortButton" runat="server"
                                                            Text="Go" OnClick="btnGo_Click" ToolTip="Go,Alt+G" AccessKey="G" />
                                                        <asp:LinkButton Text="View Details" CausesValidation="false"  runat="server" ID="ReqID"
                                                            ToolTip="View Document details" OnClick="ReqID_serverclick" Visible="false"></asp:LinkButton>
                                                        <%--  --%>
                                                        <asp:HiddenField ID="hdnTotalNoApproval" runat="server" />
                                                    </td>
                                                </tr>

                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" style="width: 100%">
                                        <asp:GridView ID="grvApprovalDetails" runat="server" AutoGenerateColumns="false"
                                            ShowFooter="true" Width="100%" OnRowDataBound="grvApprovalDetails_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Approval No" ItemStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApprovalSNO" Text='<%# Bind("Approval_SlNo")%>' runat="server"></asp:Label>
                                                        <asp:Label ID="lblApproval_ID" Text='<%# Bind("Approval_ID")%>' Visible="false" runat="server"></asp:Label>
                                                        <asp:Label ID="lblTotalNoApproval" Text='<%# Bind("TotalNoApproval")%>' Visible="false"
                                                            runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Approver Name" ItemStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApprovarName" Text='<%# Bind("User_Name") %>' runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlstatus" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rvfNo" runat="server" ControlToValidate="ddlstatus"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Status"
                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Password" ItemStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="12" TextMode="Password"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rvfNo2" runat="server" ControlToValidate="txtPassword"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Approval Date" ItemStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApprovalDate" Text='<%# Bind("Task_StatusDate") %>' runat="server"
                                                            MaxLength="6"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="45%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>' Height="60px"
                                                            Width="100%" onkeyup="maxlengthfortxt(100)" TextMode="MultiLine" onkeypress="//wraptext(this,'20')"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label runat="server" ID="sdsD"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlInvoicedtls" HorizontalAlign="Center" GroupingText="Invoice Details" runat="server"
                                            Width="100%" CssClass="stylePanel">
                                            <asp:GridView ID="grvInvoiceDetails" runat="server" AutoGenerateColumns="false"
                                                ShowFooter="false" OnRowDataBound="grvInvoiceDetails_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sno">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsno" Text='<%# Bind("Sno")%>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInvoiceNo" Visible="false" Text='<%# Bind("INVOICE_NO")%>' runat="server"></asp:Label>
                                                            <asp:LinkButton ID="lblViewInvoiceNo" OnClick="lblViewInvoiceNo_Click" Text='<%# Bind("INVOICE_NO")%>' runat="server"></asp:LinkButton>
                                                            <asp:Label ID="lblInvoiceId" Visible="false" Text='<%# Bind("INVOICE_ID")%>' runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Over All Expense Spent to the Lawyer">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtOverAllExpense" Style="text-align: right; width: 100px" Text='<%# Bind("OVER_ALL_EXPENSE")%>' runat="server">
                                                            </asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Percentage Reached Charges">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtPer" Style="text-align: right; width: 100px" Text='<%# Bind("PER_RECHED")%>' runat="server">
                                                            </asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice Amount">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtInvoiceAmount" Style="text-align: right; width: 100px" Text='<%# Bind("INVOICE_AMOUNT")%>' runat="server">
                                                            </asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtRemarks" Text='<%# Bind("REMARKS")%>' Width="200px" TextMode="MultiLine" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chqSelect" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" align="center">
                                        <div style="margin-bottom: 10px; margin-top: 10px;">
                                            <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Approve" ToolTip="Approve,Alt+A" AccessKey="A"
                                                OnClientClick="return fnCheckPageValidators();" ValidationGroup="btnSave" OnClick="btnSave_Click" />
                                            &nbsp;
                                            <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear" ToolTip="Clear,Alt+L" AccessKey="L"
                                                OnClientClick="return fnConfirmClear();" CausesValidation="False" OnClick="btnClear_Click" />
                                            &nbsp;
                                            <asp:Button ID="btnRevoke" runat="server" CssClass="styleSubmitButton" Text="Revoke" ToolTip="Revoke,Alt+R" AccessKey="R"
                                                OnClick="btnRevoke_Click" Enabled="false" CausesValidation="False" OnClientClick="return confirm('Are you sure want to revoke this record?');" />
                                            &nbsp;
                                            <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Exit" ToolTip="Exit,Alt+X" AccessKey="X"
                                                OnClick="btnCancel_Click" CausesValidation="False" OnClientClick="return fnConfirmExit();"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:ValidationSummary ID="VSApproval" runat="server" CssClass="styleMandatoryLabel"
                                            HeaderText="Correct the following validation(s):" ShowSummary="true" />

                                        <asp:CustomValidator ID="CVApproval" runat="server" CssClass="styleMandatoryLabel"
                                            Height="50px">                                    
                                        </asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:ValidationSummary ID="vsHdr" ValidationGroup="btnGo" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

