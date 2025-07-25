<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAHedging, App_Web_ezlcepmc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td valign="top">
                                                <asp:Panel ID="pnlAgentDetails" runat="server" ToolTip="Agent Details" GroupingText="Agent Details"
                                                    CssClass="stylePanel" Width="100%">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <table cellspacing="0">
                                                                    <tr>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label ID="lblAgentCode" runat="server" Text="Agent Code" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                            <asp:TextBox ID="txtAgentCode" runat="server" MaxLength="12" AutoPostBack="true"
                                                                                OnTextChanged="txtAgentCode_TextChanged" />
                                                                            <asp:RequiredFieldValidator ID="rfvAgentCode" runat="server" ControlToValidate="txtAgentCode"
                                                                                ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Agent Code"
                                                                                Display="None" />
                                                                            <cc1:AutoCompleteExtender runat="server" ID="autoComplete1" TargetControlID="txtAgentCode"
                                                                                ServiceMethod="GetAgentCodeList" ServicePath="" MinimumPrefixLength="0" EnableCaching="true"
                                                                                Enabled="True" CompletionSetCount="20" CompletionInterval="200">
                                                                            </cc1:AutoCompleteExtender>
                                                                        </td>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label ID="lblAccountNo" runat="server" Text="Account Number" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                            <%--<asp:TextBox ID="txtAccountNo" runat="server" />--%>
                                                                            <cc1:ComboBox ID="ddlGLCodeF" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                                                <%--AutoPostBack="true" OnSelectedIndexChanged="ddlGLCodeF_SelectedIndexChanged"--%>
                                                                            </cc1:ComboBox>
                                                                            <asp:RequiredFieldValidator ID="rfvAccountNo" runat="server" ControlToValidate="ddlGLCodeF"
                                                                                InitialValue="--Select--" ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Account Number"
                                                                                Display="None" />
                                                                        </td>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label ID="lblBankName" runat="server" Text="Bank Name" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                            <asp:TextBox ID="txtBankName" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="Bank Name" MaxLength="60" />
                                                                            <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ControlToValidate="txtBankName"
                                                                                SetFocusOnError="true" ValidationGroup="save" ErrorMessage="Enter Bank Name"
                                                                                Display="None" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label runat="server" ID="lblAgentName" Text="Agent Name" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <%--   <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" />--%>
                                                                            <asp:TextBox ID="txtAgentName" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="Agent Name" MaxLength="60" />
                                                                            <asp:RequiredFieldValidator ID="RFVtxtAgentName" runat="server" ControlToValidate="txtAgentName"
                                                                                ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Agent Name"
                                                                                Display="None" />
                                                                        </td>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label ID="lblIncomeTaxNo" runat="server" Text="Income Tax Number" CssClass="styleReqFieldlabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtIncomeTaxNo" runat="server" MaxLength="20" />
                                                                        </td>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label ID="lblIFSCode" runat="server" Text="IFS Code" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                            <asp:TextBox ID="txtIFSCode" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="IFSCode" MaxLength="30" />
                                                                            <asp:RequiredFieldValidator ID="RFVtxtIFSCode" runat="server" ControlToValidate="txtIFSCode"
                                                                                ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter IFS Code" Display="None" />
                                                                            <asp:RegularExpressionValidator ID="revtxtPanNumber" runat="server" Display="None"
                                                                                ValidationGroup="save" ErrorMessage="Enter the valid IFS Code(like AAAA1234567)"
                                                                                ControlToValidate="txtIFSCode" ValidationExpression="[a-zA-Z]{4}[0-9]{7}"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" MaxLength="100"
                                                                                onkeyup="maxlengthfortxt(100);" Wrap="true" />
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblRegistrationNo" runat="server" Text="Registration Number" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtRegistrationNo" runat="server" MaxLength="20" />
                                                                        </td>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                            <asp:Label ID="lblBankAccountNumber" runat="server" Text="Bank Account Number" />
                                                                        </td>
                                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                            <asp:TextBox ID="txtBankAccountNumber" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                                                ToolTip="Bank Account Number" MaxLength="20" />
                                                                            <asp:RequiredFieldValidator ID="RFVtxtBankAccountNumber" runat="server" ControlToValidate="txtBankAccountNumber"
                                                                                ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Bank Account Number"
                                                                                Display="None" />
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
                                                                                        <asp:TextBox ID="txtPhone" runat="server" Width="100px" MaxLength="20" />
                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPhone"
                                                                                            FilterType="Numbers" />
                                                                                    </td>
                                                                                    <td class="styleFieldAlign">
                                                                                        <asp:Label ID="lblMobile" runat="server" Text="[M]" CssClass="styleReqFieldLabel" />
                                                                                    </td>
                                                                                    <td class="styleFieldAlign">
                                                                                        <asp:TextBox ID="txtMobile" runat="server" Width="100px" MaxLength="20" />
                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMobile"
                                                                                            FilterType="Numbers" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblEmailId" runat="server" Text="Email Id" CssClass="styleReqFieldLabel" />
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:TextBox ID="txtEmailId" runat="server" MaxLength="50" />
                                                                            <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtEmailId"
                                                                                ValidationGroup="save" Display="None" ErrorMessage="Enter a valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                                        </td>
                                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                                        </td>
                                                                    </tr>
                                                                </table>
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
                                                                <td valign="top">
                                                                    <table width="100%" align="center">
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Hedge Ref. Number" CssClass="styleReqFieldLabel"
                                                                                    ID="lblHedgeRefNo" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtHedgeRefNo" runat="server" ToolTip="Hedge Ref No" ReadOnly="true" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Hedge Status" ID="lblHedgeStatus" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtHedgeStatus" runat="server" ToolTip="Hedge Status" ReadOnly="true" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Hedge Date" ID="lblHedgeDate" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtHedgeDate" runat="server" Width="60%" />
                                                                                <cc1:CalendarExtender ID="CEHedgeDate" runat="server" TargetControlID="txtHedgeDate"
                                                                                    PopupButtonID="txtHedgeDate" />
                                                                                <asp:RequiredFieldValidator ID="RFVtxtHedgeDate" runat="server" ControlToValidate="txtHedgeDate"
                                                                                    ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Hedge Date"
                                                                                    Display="None" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Premium Unit" ID="lblPremiumUnit" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtPremiumUnit" runat="server" ToolTip="Date" Width="34%" Style="text-align: right" />
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtPremiumUnit"
                                                                                    FilterType="Numbers,Custom" ValidChars="." />
                                                                                <asp:RequiredFieldValidator ID="RFVtxtPremiumUnit" runat="server" ControlToValidate="txtPremiumUnit"
                                                                                    ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Premium Unit"
                                                                                    Display="None" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Hedge Location" ID="lblHedgeLocation" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <%-- <asp:TextBox ID="txtHedgeLocation" runat="server" />--%>
                                                                               <%-- <cc1:ComboBox ID="ddlLocation" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                                                                    CssClass="WindowsStyle" MaxLength="0">
                                                                                </cc1:ComboBox>--%>
                                                                                <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" ItemToValidate ="Value" ValidationGroup="save" IsMandatory="true" ErrorMessage="Select Location" />
                                                                               <%-- <asp:RequiredFieldValidator ID="RFVddlLocation" runat="server" ControlToValidate="ddlLocation"
                                                                                    InitialValue="--Select--" ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Select Hedge Location"
                                                                                    Display="None" />--%>
                                                                            </td>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Premium Rate" ID="lblPremiumRate" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtPremiumRate" runat="server" ToolTip="Premium Rate" Width="34%"
                                                                                    Style="text-align: right" />
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtPremiumRate"
                                                                                    FilterType="Numbers,Custom" ValidChars="." />
                                                                                <asp:RequiredFieldValidator ID="RFVtxtPremiumRate" runat="server" ControlToValidate="txtPremiumRate"
                                                                                    ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Premium Rate"
                                                                                    Display="None" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Hedge Due Date" ID="lblHedgeDueDate" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtHedgeDueDate" runat="server" Width="60%" />
                                                                                <cc1:CalendarExtender ID="CEHedgeDueDate" runat="server" TargetControlID="txtHedgeDueDate"
                                                                                    PopupButtonID="txtHedgeDueDate" />
                                                                                <asp:RequiredFieldValidator ID="RFVtxtHedgeDueDate" runat="server" ControlToValidate="txtHedgeDueDate"
                                                                                    ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Hedge Due Date"
                                                                                    Display="None" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Premium Date" ID="lblPremiumDate" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtPremiumDate" runat="server" Width="60%" />
                                                                                <cc1:CalendarExtender ID="CEPremiumDate" runat="server" TargetControlID="txtPremiumDate"
                                                                                    PopupButtonID="txtPremiumDate" />
                                                                                <asp:RequiredFieldValidator ID="RFVtxtPremiumDate" runat="server" ControlToValidate="txtPremiumDate"
                                                                                    ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Premium Date"
                                                                                    Display="None" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label runat="server" Text="Hedge Currency" ID="lblHedgeCurrency" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:DropDownList ID="ddlHedgeCurrency" runat="server" />
                                                                                <asp:RequiredFieldValidator ID="RFVddlHedgeCurrency" runat="server" ControlToValidate="ddlHedgeCurrency"
                                                                                    InitialValue="0" ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Select Hedge Currency"
                                                                                    Display="None" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label ID="lblPremiumFreq" runat="server" Text="Premium Frequency" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:DropDownList ID="ddlPremiumFreq" runat="server" />
                                                                                <asp:RequiredFieldValidator ID="RFVddlPremiumFreq" runat="server" ControlToValidate="ddlPremiumFreq"
                                                                                    InitialValue="0" ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Select Premium Frequency"
                                                                                    Display="None" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label ID="lblHedgeCoverAmount" runat="server" Text="Hedge Cover Amount" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtHedgeCoverAmount" runat="server" Width="80%" Style="text-align: right" />
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtHedgeCoverAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars="." />
                                                                                <asp:RequiredFieldValidator ID="RFVtxtHedgeCoverAmount" runat="server" ControlToValidate="txtHedgeCoverAmount"
                                                                                    ValidationGroup="save" SetFocusOnError="true" ErrorMessage="Enter Hedge Cover Amount"
                                                                                    Display="None" />
                                                                            </td>
                                                                            <td colspan="2">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td valign="top">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label ID="lblRemarks" runat="server" Text="Remarks" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Height="100%" Rows="3" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left" class="styleFieldLabel" style="width: 15%">
                                                                                <asp:Label ID="lblHedgingScan" runat="server" Text="Hedging Scan" CssClass="styleReqFieldLabel" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign" style="width: 20%">
                                                                                <cc1:AsyncFileUpload ID="asyFileUpload" runat="server" Width="175px" OnClientUploadComplete="uploadComplete" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:HiddenField runat="server" ID="hdnThrobber" />
                                                                                <asp:Label runat="server" ID="lblDocScan" />
                                                                            </td>
                                                                            <td align="left" class="styleFieldAlign">
                                                                                <asp:LinkButton ID="hyplnkView" OnClick="hyplnkView_Click" Text="View Document" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
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
                                                <asp:GridView ID="grvhedgeHistory" runat="server" AutoGenerateColumns="false" Width="100%"
                                                    ShowFooter="true" OnRowCommand="grvhedgeHistory_RowCommand">
                                                    <Columns>
                                                        <%--Serial Number--%>
                                                        <asp:TemplateField HeaderText="Sl No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="4%" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Hedge Tran Number" DataField="HT_NO" />
                                                        <asp:BoundField HeaderText="Hedge Date" DataField="Hedge_Date" />
                                                        <asp:BoundField HeaderText="Hedge Currency" DataField="Hedge_Currency" />
                                                        <asp:BoundField HeaderText="Hedge Amount" DataField="Hedge_Cover_Amt" ItemStyle-HorizontalAlign="Right" />
                                                        <asp:BoundField HeaderText="Rate" DataField="Head_Premim_Per_HCC" ItemStyle-HorizontalAlign="Right" />
                                                        <asp:BoundField HeaderText="Premium units" DataField="Hedge_Premim" ItemStyle-HorizontalAlign="Right" />
                                                        <asp:BoundField HeaderText="Due date" DataField="Hedge_Due_Date" />
                                                        <asp:BoundField HeaderText="Utilized Amount" DataField="Utilized_Amount" ItemStyle-HorizontalAlign="Right" />
                                                        <%--<asp:BoundField HeaderText="Funder Tran no" DataField="Funder_Tran_No" />--%>
                                                        <asp:TemplateField HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkView" runat="server" Text="View" 
                                                                    CommandName="View">
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Premium Paid" DataField="Premium_Paid" ItemStyle-HorizontalAlign="Right" />
                                                        <asp:BoundField HeaderText="Remarks" DataField="Hedge_Rem" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlTranNo" runat="server" BackColor="White" Width="70%" Height="20%">
                                        <div id="divTranNo" title="Funder Trans Details" style="height: 80px; overflow: auto">
                                            <asp:Label ID="lblempty" runat="server" Font-Bold="False" Font-Size="Small" Text="No Trans Details Found"
                                                Visible="False" />
                                            <table width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <asp:GridView ID="grvTranNo" runat="server" AutoGenerateColumns="False" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Funder Name">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFunderName" runat="server" Text='<%#Eval("Funder_Name") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Deal No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblDealNo" runat="server" Text='<%#Eval("Deal_No") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tranche No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblTrancheId" runat="server" Text='<%#Eval("Fund_Tranche_No") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Funder Tran No">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFunderTranNo" runat="server" Text='<%#Eval("Funder_Tran_No") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Availment Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAvailDate" runat="server" Text='<%#Eval("Avail_Date") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Availment Amount">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAvailAmount" runat="server" Text='<%#Eval("Avail_Amount") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Maturity Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblMatDate" runat="server" Text='<%#Eval("Mat_Date") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="lblmodalerror" runat="server" Visible="false" />
                                                        <br />
                                                        <a id="hideModalPopupClientButton" href="#" onclick="hideModalPopupViaClient();">Close</a>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="lblmodal_Count" runat="server" Font-Bold="False" Font-Size="Small"
                                                Visible="True" />
                                        </div>
                                    </asp:Panel>
                                    <cc1:ModalPopupExtender ID="ModalPopupExtenderTranNo" runat="server" BackgroundCssClass="styleModalBackground"
                                        BehaviorID="programmaticModalPopupBehavior" DynamicServicePath="" Enabled="True"
                                        PopupControlID="pnlTranNo" TargetControlID="btnModal">
                                    </cc1:ModalPopupExtender>
                                    <asp:Label ID="lblPendings" runat="server" Font-Bold="False" Font-Size="Small" Visible="True" />
                                    <asp:Button ID="btnModal" runat="server" Style="display: none" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr align="center">
                                            <td>
                                                <asp:Button ID="btnSave" CssClass="styleSubmitButton" runat="server" OnClientClick="return fnCheckPageValidators('save',false);"
                                                    Text="Save" OnClick="btnSave_Click" CausesValidation="false" />
                                                <asp:Button ID="btnClear" CssClass="styleSubmitButton" runat="server" Text="Clear_FA"
                                                    OnClientClick="return fnConfirmClear();" CausesValidation="False" OnClick="btnClear_Click" />
                                                <asp:Button ID="btnCancel" CssClass="styleSubmitButton" runat="server" CausesValidation="False"
                                                    Text="Cancel" OnClick="btnCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ValidationSummary runat="server" ID="Vgsave" HeaderText="Correct the following validation(s):"
                                        CssClass="styleMandatoryLabel" ValidationGroup="save" Width="500px" ShowMessageBox="false"
                                        ShowSummary="true" />
                                    <asp:CustomValidator ID="CVHedging" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <script type="text/javascript">

        function uploadComplete(sender, args) {
            var obj = args._fileName.split("\\");
            var hdnThrobber = document.getElementById('<%=hdnThrobber.ClientID%>');
            if (hdnThrobber != null) {
                hdnThrobber.value = args._fileName;
            }

        }

        function pageLoad() {
            $addHandler($get("hideModalPopupClientButton"), 'click', hideModalPopupViaClient);

        }
        function hideModalPopupViaClient() {
            //ev.preventDefault();        
            var modalPopupBehavior = $find('programmaticModalPopupBehavior');
            modalPopupBehavior.hide();
        }

    </script>

</asp:Content>
