<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3G_ORG_CAPMaster_Add, App_Web_w304vrwx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updCAPMAst" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="stylePageHeading" width="100%">
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
                    <td valign="top">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <%-- <tr visible="false">
                                <td class="styleFieldLabel" width="25%">
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlLOB" runat="server" Width="196px" AutoPostBack="True">
                                    </asp:DropDownList>                                    
                                </td>
                            </tr>
                            <tr visible="false">
                                <td class="styleFieldLabel" width="25%">
                                    <asp:Label runat="server" Text="Constitution" ID="lblConstitution" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlConstitution" runat="server" Width="196px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr visible="false">
                                <td class="styleFieldLabel" width="25%">
                                    <asp:Label runat="server" Text="Scheme" ID="lblScheme" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlscheme" runat="server" Width="196px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr visible="false">
                                <td class="styleFieldLabel" width="25%">
                                    <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>&nbsp;
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:CheckBox ID="ChkActive" runat="server" Checked="True" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hdnCAPApp" runat="server" Visible="false" Value="0" />
                                    <asp:HiddenField ID="hdnDEV" runat="server" Visible="false" Value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" width="100%">
                                    <cc1:TabContainer ID="tcCAPMaster" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                        Width="100%" ScrollBars="Auto">
                                        <cc1:TabPanel runat="server" HeaderText="CAP Approval" ID="TabPanel1" CssClass="tabpan"
                                            BackColor="Red" Visible="false">
                                            <HeaderTemplate>
                                                CAP Approval
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table width="100%">
                                                    <tr>
                                                        <td width="100%">
                                                            <asp:Panel ID="panCAPApproval" class="container" GroupingText="CAP Approval Details"
                                                                runat="server" Width="100%" CssClass="stylePanel">
                                                                <asp:GridView runat="server" ShowFooter="True" ID="grvCAPApproval" AutoGenerateColumns="False"
                                                                    OnRowCommand="grvCAPApproval_RowCommand" OnRowDeleting="grvCAPApproval_RowDeleting"
                                                                    Width="100%" OnRowDataBound="grvCAPApproval_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="S.No.">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("SNo") %>' Width="150px" Visible="false"></asp:Label>
                                                                                <asp:Label runat="server" ID="Label1" Width="70%" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="From Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblFromAmount" runat="server" ToolTip="From Amount" Text='<%# Bind("From_Amount") %>'
                                                                                    Width="70%"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtFromAmount" MaxLength="9" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    runat="server" Width="70%" ToolTip="From Amount"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator Display="None" ID="rfvFFromAmount" ErrorMessage="Enter From Amount"
                                                                                    runat="server" ControlToValidate="txtFromAmount" ValidationGroup="Add">
                                                                                </asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtFFromAmount" runat="server" TargetControlID="txtFromAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:CompareValidator ID="cmpToAmount" Display="None" runat="server" ControlToValidate="txtFromAmount"
                                                                                    ControlToCompare="txtFToAmount" Operator="LessThan" Type="Double" ValidationGroup="Add"
                                                                                    ErrorMessage="To Amount should be greater than From Amount"></asp:CompareValidator>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="To Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIAmount" CssClass="styleTxtRightAlign" Text='<%# Bind("To_Amount")%>'
                                                                                    MaxLength="9" Width="70%" ToolTip="To Amount" runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtFToAmount" onkeypress="fnAllowNumbersOnly(true,false,this)" CssClass="styleTxtRightAlign"
                                                                                    MaxLength="9" Width="70%" ToolTip="To Amount" runat="server"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtFAmount" runat="server" TargetControlID="txtFToAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvtxtFAmount" Display="None" ErrorMessage="Enter To Amount"
                                                                                    runat="server" ControlToValidate="txtFToAmount" ValidationGroup="Add">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="No.of Approvals">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblINoofApprovals" ToolTip="No.of Approvals" CssClass="styleTxtRightAlign"
                                                                                    Text='<%# Bind("No_of_Approvals")%>' Width="50px" runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtFApprovalOrder" CssClass="styleTxtRightAlign" Enabled="true"
                                                                                    Width="50px" MaxLength="1" ToolTip="No.of Approvals" runat="server"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="fteFApprovalOrder" runat="server" TargetControlID="txtFApprovalOrder"
                                                                                    FilterType="Numbers,Custom" InvalidChars="0">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvtxtFApprovalOrder" Display="None" ErrorMessage="Enter No.of Approvals"
                                                                                    runat="server" ControlToValidate="txtFApprovalOrder" ValidationGroup="Add">
                                                                                </asp:RequiredFieldValidator>
                                                                                <asp:RangeValidator ID="rngCAPNoofApproval" runat="server" ControlToValidate="txtFApprovalOrder"
                                                                                    MinimumValue="1" MaximumValue="9" Type="Integer" Display="None" ValidationGroup="Add"
                                                                                    ErrorMessage="No.of Approvals should be from 1 to 9">
                                                                                </asp:RangeValidator>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Approver">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btnIApproverDesig" CssClass="styleSubmitShortButton" runat="server"
                                                                                    OnClick="btnIApproverDesig_Click" Text="Approver" ToolTip="Approver" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnFApproverDesig" CssClass="styleSubmitShortButton" OnClick="btnFApproverDesig_Click"
                                                                                    OnClientClick="return fnCheckPageValidators('Add',false);" runat="server" Text="Approver"
                                                                                    ValidationGroup="Add" ToolTip="Approver" />
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Active">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkCAPIActive" AutoPostBack="true" OnCheckedChanged="chkCAPIActive_CheckedChanged"
                                                                                    Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Active")))%>'
                                                                                    runat="server" Enabled="true" ToolTip="Active" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:CheckBox ID="chkCAPFActive" runat="server" ToolTip="Active" Checked="true" Enabled="false" />
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <%--<asp:LinkButton ID="LinkEdit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>--%>
                                                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" ToolTip="Delete" OnClientClick="return confirm('Are you sure want to Delete this record?');"
                                                                                    CommandName="Delete"></asp:LinkButton>
                                                                                <asp:Label ID="lblIsDelete" Visible="false" runat="server" Text='<%# Bind("Is_Delete") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAdd" CssClass="styleSubmitShortButton" CommandName="Add" runat="server"
                                                                                    OnClientClick="return fnCheckPageValidators('Add',false);" ToolTip="Add" Text="Add"
                                                                                    ValidationGroup="Add" />
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" ID="TabPanel2" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Deviation Approval
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%">
                                                            <%--<tr>
                                                                <td style="text-align: right" valign="bottom">
                                                                    <asp:Label ID="lblDevCurrency" runat="server" Text="[ All Amounts are in Indian Rupees ]"></asp:Label>
                                                                </td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td width="100%">
                                                                    <asp:Panel ID="panDeviationApproval" class="container" Width="100%" GroupingText="Deviation Approval Details"
                                                                        runat="server" CssClass="stylePanel">
                                                                        <div id="divAstGrid" runat="server" class="styleContentTable">
                                                                            <asp:GridView runat="server" ShowFooter="True" ID="grvCAPDeviation" OnRowDataBound="grvCAPDeviation_RowDataBound"
                                                                                AutoGenerateColumns="False" OnRowCommand="grvCAPDeviation_RowCommand" Width="100%" OnRowDeleting="grvCAPDeviation_RowDeleting">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                                            <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Repayment Culture" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblRepayCulture" Width="50px" ToolTip="Repayment Culture" runat="server"
                                                                                                Text='<%# Bind("RepayCulture") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:DropDownList ID="ddlRepayCulture" runat="server" ToolTip="Repayment Culture">
                                                                                            </asp:DropDownList>
                                                                                          <%--  <asp:RequiredFieldValidator ID="rfvRepayCulture"  Display="None" ErrorMessage=" Select Repayment Culture"
                                                                                                InitialValue="0" runat="server" ControlToValidate="ddlRepayCulture" ValidationGroup="Add1">
                                                                                            </asp:RequiredFieldValidator>--%>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="LTV %" ItemStyle-HorizontalAlign="Right">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblILTVPercentage" ToolTip="LTV %" Width="70px" runat="server" Text='<%# Bind("LTVPer") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtFLTVPercentage" ToolTip="LTV %" MaxLength="5" Width="70px" runat="server"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteFLTVPer" runat="server" TargetControlID="txtFLTVPercentage"
                                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <asp:RequiredFieldValidator ID="rfvFLTVPer" Display="None" ErrorMessage="Enter LTV %"
                                                                                                runat="server" ControlToValidate="txtFLTVPercentage" ValidationGroup="Add1">
                                                                                            </asp:RequiredFieldValidator>
                                                                                            <asp:RangeValidator ID="rngLTV" runat="server" ControlToValidate="txtFLTVPercentage"
                                                                                                ValidationGroup="Add1" Display="None" Type="Double" MaximumValue="100" MinimumValue="0"
                                                                                                ErrorMessage="LTV % should not exceed 100%"></asp:RangeValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="IRR %" ItemStyle-HorizontalAlign="Right">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblIIRRPercentage" ToolTip="IRR %" Width="70px" runat="server" Text='<%# Bind("IRRPer") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtFIRRPercentage" MaxLength="5" ToolTip="IRR %" ErrorMessage="Enter IRR %"
                                                                                                Width="70px" runat="server"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteFIRR" runat="server" TargetControlID="txtFIRRPercentage"
                                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <asp:RequiredFieldValidator Display="None" ID="rfvIRRPer" runat="server" ErrorMessage="Enter IRR %"
                                                                                                ControlToValidate="txtFIRRPercentage" ValidationGroup="Add1">
                                                                                            </asp:RequiredFieldValidator>
                                                                                            <asp:RangeValidator ID="rngIRR" runat="server" ControlToValidate="txtFIRRPercentage"
                                                                                                ValidationGroup="Add1" Display="None" Type="Double" MaximumValue="100" MinimumValue="0"
                                                                                                ErrorMessage="IRR % should not exceed 100%"></asp:RangeValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="IDV Amount" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblIIDV" Width="70px" ToolTip="IDV Amount" runat="server" Text='<%# Bind("IDVAmount") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtFIDV" ToolTip="IDV Amount" MaxLength="10" Width="70px" runat="server"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteFIDV" runat="server" TargetControlID="txtFIDV"
                                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <asp:RequiredFieldValidator Display="None" ID="rfvFIDV" ErrorMessage="Enter IDV Amount"
                                                                                                runat="server" ControlToValidate="txtFIDV" ValidationGroup="Add1">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Waiver Amount" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblIWaiverAmount" ToolTip="Waiver Amount" Text='<%# Bind("WaiverAmount")%>'
                                                                                                Width="70px" runat="server"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtFWaiverAmount" ToolTip="Waiver Amount" MaxLength="10" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                Width="70px" runat="server"></asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteFWaive" runat="server" TargetControlID="txtFWaiverAmount"
                                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <asp:RequiredFieldValidator Display="None" ID="rfvFWaive" ErrorMessage="Enter Waiver Amount"
                                                                                                runat="server" ControlToValidate="txtFWaiverAmount" ValidationGroup="Add1">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField  HeaderText="Approval of Rejected Proposals" Visible="false" >
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblARP" Width="70px" runat="server" ToolTip="Approval of Rejected Proposals"
                                                                                                Text='<%# Bind("ARP")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:DropDownList ToolTip="Approval of Rejected Proposals" runat="server" ID="ddlFRejectedProposal">
                                                                                                <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                            <asp:RequiredFieldValidator Display="None" ID="rfvRejectedProposal" ErrorMessage="Select Approval of Rejected Proposals"
                                                                                                ValidationGroup="Add1" runat="server" InitialValue="-1" ControlToValidate="ddlFRejectedProposal">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="false" HeaderText="Special Conditions Waiver">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSCW" ToolTip="Special Conditions Waiver" Width="70px" runat="server"
                                                                                                Text='<%# Bind("SCW")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:DropDownList runat="server" ToolTip="Special Conditions Waiver" ID="ddlFSpecialConditions">
                                                                                                <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                            <asp:RequiredFieldValidator Display="None" ID="rfvSpecialConditions" ErrorMessage="Select Special Conditions Waiver"
                                                                                                ValidationGroup="Add1" runat="server" InitialValue="-1" ControlToValidate="ddlFSpecialConditions">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="No.of Approvals" ItemStyle-HorizontalAlign="Right">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblNoofApproval" ToolTip="No.of Approvals" Width="70px" runat="server"
                                                                                                Text='<%# Bind("No_of_Approvals")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="txtNoofApproval" ToolTip="No.of Approvals" Width="70px" MaxLength="1"
                                                                                                runat="server">
                                                                                            </asp:TextBox>
                                                                                            <cc1:FilteredTextBoxExtender ID="fteNoofApproval" runat="server" TargetControlID="txtNoofApproval"
                                                                                                FilterType="Numbers" InvalidChars="0">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <asp:RequiredFieldValidator Display="None" ID="rfvNoofApproval" ErrorMessage="Enter No.of Approvals"
                                                                                                runat="server" ControlToValidate="txtNoofApproval" ValidationGroup="Add1">
                                                                                            </asp:RequiredFieldValidator>
                                                                                            <asp:RangeValidator ID="rngNoofApproval" runat="server" ControlToValidate="txtNoofApproval"
                                                                                                MinimumValue="1" ValidationGroup="Add1" MaximumValue="9" Display="None" Type="Integer"
                                                                                                ErrorMessage="No.of Approvals should be from 1 to 9">
                                                                                            </asp:RangeValidator>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Approver">
                                                                                        <ItemTemplate>
                                                                                            <asp:Button ID="btnIAssignApprover" CssClass="styleSubmitShortButton" runat="server"
                                                                                                ToolTip="Approver" Text="Approver" OnClick="btnIAssignApprover_Click" />
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Button ID="btnAssignApprover" CssClass="styleSubmitShortButton" runat="server"
                                                                                                Text="Approver" ToolTip="Approver" OnClick="btnAssignApprover_Click" ValidationGroup="Add1"
                                                                                                OnClientClick="return fnCheckPageValidators('Add1',false);" />
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Active">
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkActive" AutoPostBack="true" OnCheckedChanged="chkActive_CheckedChanged"
                                                                                                runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Active")))%>'
                                                                                                Enabled="true" ToolTip="Active" />
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:CheckBox ID="chkFActive" ToolTip="Active" runat="server" Checked="true" Enabled="false" />
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Action">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkCAPDelete" runat="server" OnClientClick="return confirm('Are you sure want to Delete this record?');"
                                                                                                Text="Delete" ToolTip="Delete,Alt+D" CommandName="Delete" AccessKey="D"></asp:LinkButton>
                                                                                            <asp:Label ID="lblDevIsDelete" Visible="false" runat="server" Text='<%# Bind("Is_Delete") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Button ID="btnAddCap" runat="server" CssClass="styleSubmitShortButton" Text="Add"
                                                                                                ToolTip="Add,Alt+A" AccessKey="A" CommandName="Add" ValidationGroup="Add1" OnClientClick="return fnCheckPageValidators('Add1',false);" />
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                        </table>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnSave" ToolTip="Save,Alt+S" runat="server" OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators('Submit');"
                                        CssClass="styleSubmitButton" Text="Save" AccessKey="S"/>
                                    <asp:Button ID="btnCancel" ToolTip="Exit,Alt+X" CssClass="styleSubmitButton" runat="server" OnClientClick="return fnConfirmExit();"
                                        Text="Exit" OnClick="btnCancel_Click" AccessKey="X" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vsCAPMAster" ValidationGroup="Add" runat="server" ShowSummary="true"
                            HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                        <asp:ValidationSummary ID="vsDEVMaster" ValidationGroup="Add1" runat="server" ShowSummary="true"
                            HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderDEVApprover" runat="server" TargetControlID="btnModal1"
        PopupControlID="PnlApprover1" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="530px">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div id="divTransaction" class="container" runat="server" style="height: 200px; width: auto;">
                                            <asp:GridView ID="grvApprover" runat="server" AutoGenerateColumns="false" Height="50px"
                                                OnRowDataBound="grvApprover_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Text='<% #Bind("SNo") %>' Visible="false" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber") %>'
                                                                runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approval Entity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalEntity" Visible="false" runat="server" Text='<% #Bind("ApprovEntity") %>'>
                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlApprovalEntity" ToolTip="Approval Entity" runat="server">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approval Authority">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalPerson" Visible="false" runat="server" Text='<% #Bind("ApprovPerson") %>'>
                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server"
                                                                Style="width: 340px">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnModalAdd" ToolTip="Save" runat="server" Text="Save" class="styleSubmitButton"
                                            OnClick="btnModalAdd_Click" />
                                        <asp:Button ID="btnModalCancel" runat="server" ToolTip="Close" Text="Close" class="styleSubmitButton"
                                            OnClick="btnModalCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="PnlApprover1" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="530px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div id="div1" class="container" runat="server" style="height: 200px; width: auto">
                                            <asp:GridView ID="grvDEVApprover" runat="server" Height="50px" AutoGenerateColumns="false"
                                                OnRowDataBound="grvDEVApprover_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Text='<% #Bind("SNo") %>' Visible="false" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber") %>'
                                                                runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approval Entity">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalEntity" Visible="false" runat="server" Text='<% #Bind("ApprovEntity") %>'>
                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlApprovalEntity" ToolTip="Approval Entity" runat="server">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approval Authority">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblApprovalPerson" Visible="false" runat="server" Text='<% #Bind("ApprovPerson") %>'>
                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server"
                                                                Style="width: 340px">
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnDEVModalAdd" runat="server" Text="Save" ToolTip="Save" class="styleSubmitButton"
                                            OnClick="btnDEVModalAdd_Click" />
                                        <asp:Button ID="btnDEVModalCancel" runat="server" Text="Close" ToolTip="Close" class="styleSubmitButton"
                                            OnClick="btnDEVModalCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />
    <asp:Button ID="btnModal1" Style="display: none" runat="server" />

    <script language="javascript" type="text/javascript">

        function FunCheckAmount() {
            var txtLTVPercentage = document.getElementById('ctl00$ContentPlaceHolder1$tcCAPMaster$TabPanel2$grvCAPDeviation$ctl14$txtFLTVPercentage');
            var txtIRRPercentage = document.getElementById('ctl00$ContentPlaceHolder1$tcCAPMaster$TabPanel2$grvCAPDeviation$ctl14$txtFIRRPercentage');
            var txtIDVAmount = document.getElementById('ctl00$ContentPlaceHolder1$tcCAPMaster$TabPanel2$grvCAPDeviation$ctl14$txtFIDV');
            var txtWaiverAmount = document.getElementById('ctl00$ContentPlaceHolder1$tcCAPMaster$TabPanel2$grvCAPDeviation$ctl14$txtFWaiverAmount');
            if ((parseFloat(txtLTVPercentage.value)) == 0 && (parseFloat(txtIRRPercentage.value)) == 0 && (parseFloat(txtIDVAmount.value)) == 0 && (parseFloat(txtWaiverAmount.value)) == 0) {
                alert('All values cannot be zero');
                Page_BlockSubmit = false;
                return false;
            }
        }

    </script>

</asp:Content>
