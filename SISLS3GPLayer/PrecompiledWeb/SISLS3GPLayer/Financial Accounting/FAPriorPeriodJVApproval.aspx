<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAPriorPeriodJVApproval, App_Web_mv5fp02i" title="Untitled Page" %>


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
                                                        <%--<asp:CheckBox ID="chkUnapproval" AutoPostBack="true" Text="Unapproved" runat="server"
                                                            Checked="true" OnCheckedChanged="chkUnapproval_CheckedChanged" />
                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender2" TargetControlID="chkUnapproval"
                                                            Key="1" runat="server">
                                                        </cc1:MutuallyExclusiveCheckBoxExtender>
                                                        &nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkApproved" Text="All" runat="server" OnCheckedChanged="chkApproved_CheckedChanged"
                                                            AutoPostBack="true" />
                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender1" TargetControlID="chkApproved"
                                                            Key="1" runat="server">
                                                        </cc1:MutuallyExclusiveCheckBoxExtender>--%>
                                                        <asp:RadioButtonList ID="RBLApproved" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                            OnSelectedIndexChanged="RBLApproved_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="UnApproved" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="All"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Activity</span>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlActivity" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Location</span>
                                                    </td>
                                                    <td>
                                                       <%-- <asp:DropDownList ID="ddlLocation" runat="server" Width="200px" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                        </asp:DropDownList>--%>
                                                        <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack ="true" OnItem_Selected="ddlLocation_SelectedIndexChanged"  ItemToValidate ="Value" IsMandatory="true" ErrorMessage="Select Location" />
                                                       <%-- <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Location"
                                                            InitialValue="0"></asp:RequiredFieldValidator>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblDocumentType" runat="server" CssClass="styleReqFieldLabel" Text="Document Type"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlDocumentType" runat="server" Width="200px" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged">
                                                            <asp:ListItem Value ="PPJV" Text ="Prior Period JV Approval" />
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVddlDocumentType" runat="server" ControlToValidate="ddlDocumentType"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Document Type"
                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblDocument_No" runat="server" CssClass="styleReqFieldLabel" Text="Document No"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlDocument_No" runat="server" Width="200px" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlDocument_No_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RFVddlDocument_No" runat="server" ControlToValidate="ddlDocument_No"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Document Number"
                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Date</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDocumentDate" runat="server" Width="90px" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <span class="styleReqFieldLabel">Status</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDocStatus" ReadOnly="true" runat="server" Width="90px">
                                                        </asp:TextBox>
                                                        <input type="hidden" value="0" runat="server" id="hdnID" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="center">
                                                        <asp:Button Enabled="false" ID="btnGo" CssClass="styleSubmitShortButton" runat="server"
                                                            Text="Go" OnClick="btnGo_Click" />
                                                        <asp:LinkButton Text="View Details" CausesValidation="false" runat="server" ID="ReqID"
                                                            ToolTip="View Document details" OnClick="ReqID_serverclick" Visible="false"></asp:LinkButton>
                                                        <%--  --%>
                                                        <asp:HiddenField ID="hdnTotalNoApproval" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
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
                                                        <asp:DropDownList ID="ddlstatus" runat="server" AutoPostBack ="true" >
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rvfNo" runat="server" ControlToValidate="ddlstatus"
                                                            CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select the Status"
                                                            InitialValue="0"></asp:RequiredFieldValidator>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Password" ItemStyle-Width="15%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="6" TextMode="Password"
                                                            onCopy="return false" onDrag="return false" onDrop="return false" onPaste="return false" autocomplete="off" ></asp:TextBox>
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
                                    <td align="center">
                                        <div style="margin-bottom: 10px; margin-top: 10px;">
                                            <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" Text="Save"
                                                OnClientClick="return fnCheckPageValidators();" ValidationGroup="btnSave" OnClick="btnSave_Click" />
                                            &nbsp;
                                            <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear_FA"
                                                OnClientClick="return fnConfirmClear();" CausesValidation="False" OnClick="btnClear_Click" />
                                            &nbsp;
                                            <asp:Button ID="btnRevoke" runat="server" CssClass="styleSubmitButton" Text="Revoke"
                                                OnClick="btnRevoke_Click" Enabled="false" CausesValidation="False" OnClientClick="return confirm('Are you sure want to revoke this record?');" />
                                            &nbsp;
                                            <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" Text="Cancel"
                                                OnClick="btnCancel_Click" CausesValidation="False" />
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
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

