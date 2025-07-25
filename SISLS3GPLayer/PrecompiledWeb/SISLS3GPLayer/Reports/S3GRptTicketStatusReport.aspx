<%@ page title="Ticket Status Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptTicketStatusReport, App_Web_zznul5le" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
    <%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
    <%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
    <%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<script type="text/javascript">
    
    function Prospect_ItemSelected(sender, e) {
        var hdnProspectID = $get('<%= hdnProspectID.ClientID %>');
        hdnProspectID.value = e.get_value();
     }
    function Prospect_ItemPopulated(sender, e) {
        var hdnProspectID = $get('<%= hdnProspectID.ClientID %>');
        hdnProspectID.value = '';
    }
    function Branch_ItemSelected(sender, e) {
        var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
        hdnBranchID.value = e.get_value();
    }
    function Branch_ItemPopulated(sender, e) {
        var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
        hdnBranchID.value = '';
    }
    </script>
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Ticket Status Report">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                    Width="100%">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel">
                                <asp:Label ID="lblProspect" runat="server" Text="Prospect/Customer" CssClass="styleDisplayLabel"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <%--<uc2:Suggest ID="ddlProspect" runat="server" ServiceMethod="GetProspectList" Width="200px" AutoPostBack="true" 
                                    ErrorMessage="Enter the Customer Name" ValidationGroup="RFVDTransLander" WatermarkText="--All--" />--%>
                                <asp:TextBox ID="txtProspect" runat="server" MaxLength="50" OnTextChanged="txtProspect_TextChanged"
                                            AutoPostBack="true" Width="182px"></asp:TextBox>
                            <cc1:AutoCompleteExtender ID="Autoprospect" MinimumPrefixLength="3" OnClientPopulated="Prospect_ItemPopulated"
                                 OnClientItemSelected="Prospect_ItemSelected" runat="server" TargetControlID="txtProspect"
                                 ServiceMethod="GetProspectList" Enabled="True" ServicePath="" CompletionSetCount="5"
                                 CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                 CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                 ShowOnlyCurrentWordInCompletionListItem="true">
                            </cc1:AutoCompleteExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtProspectExtender" runat="server" TargetControlID="txtProspect"
                                 WatermarkText="--All--">
                            </cc1:TextBoxWatermarkExtender>
                            <asp:HiddenField ID="hdnProspectID" runat="server" />
                            </td>
                            <td class="styleFieldLabel">
                                <asp:Label ID="lblLocation" runat="server" CssClass="StyleDisplaylabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                               <%-- <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" WatermarkText="--All--"
                                    Width="200px" IsMandatory="true" ValidationGroup="Save" ErrorMessage="Enter Location" />--%>
                                <asp:TextBox ID="txtBranchSearch" runat="server" MaxLength="50" OnTextChanged="txtBranchSearch_OnTextChanged"
                                            AutoPostBack="true" Width="182px"></asp:TextBox>
                            <cc1:AutoCompleteExtender ID="autoBranchSearch" MinimumPrefixLength="3" OnClientPopulated="Branch_ItemPopulated"
                                 OnClientItemSelected="Branch_ItemSelected" runat="server" TargetControlID="txtBranchSearch"
                                 ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="5"
                                 CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                 CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                 ShowOnlyCurrentWordInCompletionListItem="true">
                            </cc1:AutoCompleteExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="txtBranchSearch"
                                 WatermarkText="--All--">
                            </cc1:TextBoxWatermarkExtender>
                            <asp:HiddenField ID="hdnBranchID" runat="server" />
                            </td>
                            <td class="styleFieldLabel">
                                <asp:Label runat="server" Text="Ticket Status" ID="lblTicketStatus" CssClass="StyleDisplaylabel" ToolTip="Ticket Status">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:DropDownList ID="ddlTicketStatus" runat="server" Width="100px" AutoPostBack="true" CausesValidation="true"
                                    ToolTip="Status">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td height="8px"></td>
                        </tr>
                        <tr>
                            <td class="styleFieldAlign">
                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleDisplayLabel" Text="From" ToolTip="From date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign">
                                <input id="hidDate" runat="server" type="hidden" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="true" Width="80px"
                                    ToolTip="From date" OnTextChanged="txtStartDateSearch_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="None" ControlToValidate="txtStartDateSearch"
                                    ValidationGroup="Go" CssClass="styleMandatoryLabel" ErrorMessage="Select From date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious1" runat="server" Enabled="true" CommandName="Prev"
                                 ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious1_Command" />
                                <asp:ImageButton ID="btnNext1" runat="server" Enabled="true" CommandName="Next" 
                                 ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext1_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleDisplayLabel" Text="To" ToolTip="To date" />
                                <span class="styleMandatory">*</span>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="true" Width="80px"
                                    ToolTip="To date" OnTextChanged="txtEndDateSearch_TextChanged"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="None" ControlToValidate="txtEndDateSearch"
                                    ValidationGroup="Go" CssClass="styleMandatoryLabel" ErrorMessage="Select To date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <asp:ImageButton ID="btnPrevious2" runat="server" Enabled="true" CommandName="Prev"
                                 ImageUrl="../Images/blue-jelly-icon2.png" CausesValidation="false" OnCommand="btnPrevious2_Command" />
                                <asp:ImageButton ID="btnNext2" runat="server" Enabled="true" CommandName="Next" 
                                 ImageUrl="../Images/blue-jelly-icon1.png" CausesValidation="false" OnCommand="btnNext2_Command" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                             <td colspan="2">
                                <asp:Button runat="server" ID="btnGo" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators('Go',false);" Text="Go" 
                                CausesValidation="true" ValidationGroup="Go" ToolTip="Go" OnClick="btnGo_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td height="8px"></td>
                        </tr>
                        <tr>
                            <td class="styleFieldLabel">
                                <asp:Label runat="server" Text="Mode" ID="lblMode" CssClass="StyleDisplaylabel" ToolTip="Mode">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:DropDownList ID="ddlMode" runat="server" Width="80px" AutoPostBack="true" CausesValidation="true" ToolTip="Mode">
                                    <asp:ListItem Value="0" Text="All"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Computer"></asp:ListItem>
                                    <asp:ListItem Value="2" Text ="Mobile"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="styleFieldLabel">
                                <asp:Label runat="server" Text="Query Type" ID="lblQueryType" CssClass="StyleDisplaylabel" ToolTip="Query Type">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:DropDownList ID="ddlQueryType" runat="server" Width="150px" AutoPostBack="true" CausesValidation="true"
                                    ToolTip="Query Type">
                                </asp:DropDownList>
                            </td>
                            <td colspan="2">
                                <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                                Text="Clear" OnClientClick="return fnConfirmClear();" ToolTip="Clear" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td height="8px"></td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="styleFieldLabel" colspan="6" height="8px">
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign" colspan="6">
                <asp:Panel ID="PnlAbstract" runat="server" CssClass="stylePanel" GroupingText="Ticket Status">
                    <div id="divAbstract" runat="server" style="overflow: scroll;">
                        <asp:GridView ID="grvAbstract" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                            CssClass="styleInfoLabel" Style="margin-bottom: 0px" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%# Bind("SLNO") %>' ToolTip="S.No"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ticket Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTicketDt" runat="server" Text='<%# Bind("TICKET_DATE") %>' ToolTip="Ticket Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ticket No" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTicketNo" runat="server" Text='<%# Bind("TICKET_NO") %>' ToolTip="Ticket No"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prospect/Customer Name" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocNm" runat="server" Text='<%# Bind("PROSP_CUST_NAME") %>' ToolTip="Prospect/Customer Name"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lead Assigned To" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLdAssigned" runat="server" Text='<%# Bind("LEAD_ASSGN_TO") %>' ToolTip="Lead Assigned To"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("DESCRIPTION") %>' width="200px" Style="word-wrap: normal; word-break: break-all;"  ToolTip="Description"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Target Date" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTrgtDt" runat="server" Text='<%# Bind("TARGET_DATE") %>' ToolTip="Target Date"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TAT" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTAT" runat="server" Text='<%# Bind("TAT") %>' ToolTip="TAT"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ticket Status" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTicketStat" runat="server" Text='<%# Bind("TICKET_STATUS") %>' ToolTip="Ticket Status"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Query Type" ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQueryTyp" runat="server" Text='<%# Bind("QUERY_TYPE") %>' ToolTip="Query Type"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" Visible="true"></uc1:PageNavigator>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="6">
                <asp:Button ID="btnExport" CssClass="styleSubmitButton" runat="server" Text="Export" OnClick="btnExport_Click" ToolTip="Export" Visible="false" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ValidationSummary ID="VSUsrTrgt" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                    ShowSummary="true" ValidationGroup="Go" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="CVUsrTrgt" runat="server" Display="None" ValidationGroup="Go"></asp:CustomValidator>
            </td>
        </tr>
    </table>
</asp:Content>

