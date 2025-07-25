<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="UnderWriting_S3GORGUnderWritingApproval_MST, App_Web_1grzfuxm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <script language="javascript" type="text/javascript">
        function FunSaveMsg() {
            if (confirm('Are you sure want to save?')) {
                return true;
            }
            else
                return false;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="99%" align="center" cellpadding="0" cellspacing="0">
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
                    <td valign="top">
                           <asp:Panel ID="PnlSearchCriteria" runat="server" BackColor="White" GroupingText="Search Criteria"
                            CssClass="stylePanel" Width="99%">
                               <table>
                                   <tr>
                                       <td class="styleFieldAlign">
                                           <asp:RadioButtonList ID="rdbLevel" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdbLevel_SelectedIndexChanged">
                                               <asp:ListItem Text="Transaction Level" Value="1" Selected="True"></asp:ListItem>
                                               <asp:ListItem Text="Customer Level" Value="2"></asp:ListItem>
                                           </asp:RadioButtonList>

                                       </td>
                                   </tr>
                               </table>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="styleFieldLabel" style="width:15%;">Short Name*
                                </td>
                                <td class="styleFieldAlign" style="width:21%;">
                                    <uc2:Suggest ID="txtShortName" runat="server" ServiceMethod="GetShortnameList" AutoPostBack="true"
                                        OnItem_Selected="txtShortName_SelectedIndexChanged" ErrorMessage="Select Short Name" 
                                        ValidationGroup="Go" IsMandatory="true" Width="180px" />
                                  
                                </td>
                                <td class="styleFieldLabel" style="width:20%;">Line of Business
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlLOB" AutoPostBack="true" Width="180px"
                                        OnSelectedIndexChanged="ddlLOB_OnSelectedIndexChanged"
                                        runat="server" ToolTip="Line of Business">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvLOB" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select the Line of Business"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel" style="width:15%;">Product
                                </td>
                                <td class="styleFieldAlign" style="width:21%;">
                                    <asp:DropDownList ID="ddlProductCode" Width="180px" runat="server" ToolTip="Product">
                                    </asp:DropDownList>
                                </td>
                                <td class="styleFieldLabel" style="width:20%;">Constitution*
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlConstitution" Width="180px" runat="server" ToolTip="Constitution">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvConstitution" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="ddlConstitution" InitialValue="0" ErrorMessage="Select the Constitution"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel" style="width:15%;">Active
                                </td>
                                <td class="styleFieldAlign" style="width:21%;">
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" TabIndex="3" />
                                </td>
                                <td class="styleFieldAlign" colspan="2">
                                    <asp:Button ID="btnGo" runat="server" CssClass="styleGridShortButton" Text="Go"
                                        ToolTip="Go" OnClick="btnGo_Click"></asp:Button>
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
                    <td>
                        <table cellpadding="0" cellspacing="0" width="99%">
                            <tr>
                                <td>
                                    <cc1:TabContainer ID="TabGroupDetails" runat="server" CssClass="styleTabPanel"
                                        ScrollBars="None" TabStripPlacement="top" ActiveTabIndex="0">
                                        <cc1:TabPanel ID="tpARC" runat="server" CssClass="tabpan" HeaderText="Main Page"
                                            BackColor="Red" Style="padding: 0px">
                                            <HeaderTemplate>
                                                Authorization Rule Card
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td valign="top">
                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td colspan="3">
                                                                                <asp:Panel ID="panDateFormat" GroupingText="Authorization Rule Card Details" runat="server"
                                                                                    Width="100%" CssClass="stylePanel">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td class="styleFieldLabel" style="font-weight:bold;">Final Approver*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                            &nbsp;&nbsp;&nbsp;
                                                                                                        </td>
                                                                                                        <td class="styleFieldLabel">
                                                                                                            <uc2:Suggest ID="ddlFinalApprover" runat="server" ServiceMethod="GetFinalApproverList" 
                                                                                                               Width="180px" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:GridView ID="grvAuthorizationrulecardDetail" ShowFooter="true" AutoGenerateColumns="false"
                                                                                                    runat="server" OnRowCommand="grvAuthorizationrulecardDetail_RowCommand"
                                                                                                    OnRowDataBound="grvAuthorizationrulecardDetail_RowDataBound"
                                                                                                    OnRowDeleting="grvAuthorizationrulecardDetail_RowDeleting">
                                                                                                    <Columns>
                                                                                                        <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%" HeaderStyle-Width="3%" FooterStyle-Width="3%">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                                                                                <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Group Name" HeaderStyle-Width="120px" ItemStyle-Width="120px" FooterStyle-Width="120px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lbldrpGroupName" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                                                <asp:Label ID="lblGroupId" runat="server" Visible="false" Text='<%# Bind("Group_Code") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlGroupF" runat="server" Width="120px"></asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvGroupF" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="ddlGroupF" InitialValue="0" ErrorMessage="Select Group Name"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Location" HeaderStyle-Width="80px" Visible="false" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("LocationName") %>'></asp:Label>
                                                                                                                <asp:Label ID="lblLocaionId" Visible="false" runat="server" Text='<%# Bind("LocationId") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <uc2:Suggest ID="txtLocationF" OnItem_Selected="txtLocationF_SelectedIndexChanged"
                                                                                                                    AutoPostBack="true" runat="server" ServiceMethod="GetBranchList" />
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Approval Type" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblApprType" runat="server" Text='<%# Bind("ApprovalType") %>'></asp:Label>
                                                                                                                <asp:Label ID="lblAprTypeId" Visible="false" runat="server" Text='<%# Bind("ApprovalTypeId") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlEntityTypeF" OnSelectedIndexChanged="ddlEntityTypeF_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                                                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="User Level" Value="1"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="User Designation" Value="2"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="User Name" Value="3"></asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvEntityTypeF" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="ddlEntityTypeF" InitialValue="0" ErrorMessage="Select Approval Type"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Score From" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblScore_From" runat="server" Text='<%# Bind("Score_From") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtScoreFrF" runat="server" MaxLength="8" Width="80px" Style="text-align: right"></asp:TextBox>
                                                                                                                <asp:RequiredFieldValidator ID="rfvScoreFrF" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="txtScoreFrF" InitialValue="" ErrorMessage="Enter Score From"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteScoreFrF" runat="server" TargetControlID="txtScoreFrF"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Score To" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblScore_To" runat="server" Text='<%# Bind("Score_To") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtScoreToF" runat="server" MaxLength="8" Width="80px" Style="text-align: right"></asp:TextBox>
                                                                                                                <asp:RequiredFieldValidator ID="rfvScoreToF" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="txtScoreToF" InitialValue="" ErrorMessage="Enter Score To"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteScoreToF" runat="server" TargetControlID="txtScoreToF"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Sanction From" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txtFromAmount" MaxLength="12" EnableViewState="true" Text='<%# Bind("From_Amount")%>'
                                                                                                                    Style="text-align: right" runat="server" Width="80px" ContentEditable="false"></asp:TextBox>
                                                                                                                <%--<asp:Label ID="lblRulecardDetailID" runat="server" Text='<%# Bind("AUTH_RULE_CARD_DET_ID")%>'
                                                                                                                    Visible="false"></asp:Label>--%>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteFromAmount" runat="server" TargetControlID="txtFromAmount"
                                                                                                                    FilterType="Numbers" Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtAddFromAmount" MaxLength="12" runat="server" Style="text-align: right" Width="80px"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteAfrAmt" runat="server" TargetControlID="txtAddFromAmount"
                                                                                                                    FilterType="Numbers" Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <%--<asp:RequiredFieldValidator ID="rfvFromAmount" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="txtAddFromAmount" InitialValue="" ErrorMessage="Enter Sanction From"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>--%>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Sanction To" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txtToAmount" MaxLength="12" Style="text-align: right"
                                                                                                                    Text='<%# Bind("To_Amount")%>' runat="server" Width="80px" ContentEditable="false"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteToAmt" runat="server" TargetControlID="txtToAmount"
                                                                                                                    FilterType="Numbers" Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtAddToAmount" MaxLength="12" runat="server" Style="text-align: right" Width="80px">
                                                                                                                </asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteAtoAmt" runat="server" TargetControlID="txtAddToAmount"
                                                                                                                    FilterType="Numbers" Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <%--<asp:RequiredFieldValidator ID="rfvToAmount" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="txtAddToAmount" InitialValue="" ErrorMessage="Enter Sanction To"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>--%>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Hygiene From" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txthygen_From" MaxLength="8" Style="text-align: right"
                                                                                                                    Text='<%# Bind("hygen_From")%>' runat="server" Width="80px" ContentEditable="false"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="ftehygen_From" runat="server" TargetControlID="txthygen_From"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txthygen_Frm_FG" runat="server" MaxLength="8" Width="80px" Style="text-align: right"></asp:TextBox>
                                                                                                                <%--<asp:RequiredFieldValidator ID="rfvHyFrom" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="txthygen_Frm_FG" InitialValue="" ErrorMessage="Enter Hygiene From"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>--%>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteHyFrom" runat="server" TargetControlID="txthygen_Frm_FG"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Hygiene To" HeaderStyle-Width="80px" ItemStyle-Width="80px" FooterStyle-Width="80px">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:TextBox ID="txthygen_to" MaxLength="8" Style="text-align: right"
                                                                                                                    Text='<%# Bind("hygen_to")%>' runat="server" Width="80px" ContentEditable="false"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="ftehygen_to" runat="server" TargetControlID="txthygen_to"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txthygen_To_FG" MaxLength="8" runat="server" Width="80px" Style="text-align: right"></asp:TextBox>
                                                                                                                <%--<asp:RequiredFieldValidator ID="rfvHyTo" CssClass="styleMandatoryLabel" runat="server"
                                                                                                                    ControlToValidate="txthygen_To_FG" InitialValue="" ErrorMessage="Enter Hygiene To"
                                                                                                                    Display="None" ValidationGroup="btnAdd">
                                                                                                                </asp:RequiredFieldValidator>--%>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteHyTo" runat="server" TargetControlID="txthygen_To_FG"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Approver" HeaderStyle-Width="5%" ItemStyle-Width="5%" FooterStyle-Width="5%">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Button ID="btnIApprover" CssClass="styleSubmitShortButton" runat="server" Text="Approver"
                                                                                                                    OnClick="btnIApprover_Click" />
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:Button ID="btnFApprover" CssClass="styleSubmitShortButton" runat="server" Text="Approver"
                                                                                                                    OnClick="btnFApprover_Click" ValidationGroup="btnAdd" />
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="5%" FooterStyle-Width="5%">
                                                                                                            <ItemTemplate>
                                                                                                                <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                                                                                    CausesValidation="false" />
                                                                                                                <asp:Label ID="lblRowStatus" runat="server" Text='<%# Bind("RowStatus")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:Button ID="btnDetails" Enabled="false" Text="Add" CommandName="AddNew" runat="server" CssClass="styleGridShortButton" />
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                    </Columns>
                                                                                                </asp:GridView>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" colspan="3">
                                                                                                <asp:Button ID="btnReset" Visible="false" CssClass="styleSubmitButton" Text="Reset"
                                                                                                    runat="server" CausesValidation="false" OnClick="btnReset_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr class="styleButtonArea">
                                                                            <td colspan="4">
                                                                                <asp:Label ID="Label6" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:ValidationSummary ID="AuthorizationRulecardAdd" ValidationGroup="Save" runat="server"
                                                                                ShowSummary="true" HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                                                            <input id="hdnGrvCnt" runat="server" value="0" type="hidden" />
                                                                        </td>
                                                                    </tr>
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
                    </td>
                </tr>
                <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                    <td>
                        <br />
                        <asp:Button runat="server" ID="btnSave" CausesValidation="false"
                            CssClass="styleSubmitButton" Text="Save" ToolTip="Save" OnClientClick="return FunSaveMsg();"
                            Enabled="false" OnClick="btnSave_Click" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();"
                            ToolTip="Clear" OnClick="btnClear_Click" />
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" ToolTip="Cancel" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="AddNumber" />
                    </td>
                </tr>

                <tr class="styleButtonArea">
                    <td>
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="VSCSM" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAdd"
                            ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary2" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnEdit"
                            ShowSummary="true" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" value="0" runat="server" id="hdnCreditScoreID" />
                        <input type="hidden" value="0" runat="server" id="hdnDelete" />
                        <input type="hidden" value="0" runat="server" id="hdnFooterAdd" />
                        <input type="hidden" value="0" runat="server" id="hdnCreditScoreUpdatedID" />
                        <input type="hidden" value="0" runat="server" id="hdnCanEdit" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="450px">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:GridView ID="grvApprover" runat="server" AutoGenerateColumns="false" Height="50px"
                                OnRowDataBound="grvApprover_RowDataBound" OnRowCommand="grvApprover_RowCommand" OnRowDeleting="grvApprover_RowDeleting"
                                ShowFooter="true" Width="445px">
                                <Columns>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber")%>'
                                                runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <FooterStyle Width="3%" HorizontalAlign="Center" />
                                        <ItemStyle Width="3%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Location" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLocation" runat="server" Text='<% #Bind("Location")%>'>
                                            </asp:Label>
                                            <asp:Label ID="lblLocationID" runat="server" Visible="false" Text='<% #Bind("LocationID")%>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <uc2:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                OnItem_Selected="ddlLocation_Item_Selected" Width="150px" />
                                        </FooterTemplate>
                                        <FooterStyle Width="3%" HorizontalAlign="Left" />
                                        <ItemStyle Width="3%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approval Authority" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApprovalPerson" runat="server" Text='<% #Bind("ApprovPerson")%>'>
                                            </asp:Label>
                                            <asp:Label ID="ApprovPersonID" runat="server" Visible="false" Text='<% #Bind("ApprovPersonID")%>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server"
                                                Style="width: 150px">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfvApprovalPerson" runat="server" ValidationGroup="PopUpAdd"
                                                ControlToValidate="ddlApprovPerson" Display="None" InitialValue="0" ErrorMessage="Select Approval Authority"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                        <FooterStyle Width="3%" HorizontalAlign="Left" />
                                        <ItemStyle Width="3%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" Text="Delete" CommandName="Delete" runat="server"
                                                CausesValidation="false" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                        <FooterTemplate>
                                            <asp:Button ID="btnDetails" Text="Add" ValidationGroup="PopUpAdd" CommandName="AddApr"
                                                runat="server" CssClass="styleGridShortButton" CausesValidation="false" />
                                        </FooterTemplate>
                                        <FooterStyle Width="3%" HorizontalAlign="Center" />
                                        <ItemStyle Width="3%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnDEVModalAdd" runat="server" Text="Save" ToolTip="Save" class="styleSubmitButton"
                                OnClick="btnDEVModalAdd_Click" />
                            <asp:Button ID="btnDEVModalCancel" runat="server" Text="Close" OnClick="btnDEVModalCancel_Click"
                                ToolTip="Close" class="styleSubmitButton" CausesValidation="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                            <asp:CustomValidator ID="cvPopUp" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />
</asp:Content>

