<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FATransLander, App_Web_kopy3kxt" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function Location_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Location_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnCommonID.ClientID %>');
            hdnCommonID.value = '';
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
    <%--Design Started--%>
    <table width="100%" cellpadding="0" cellspacing="2px" border="0">
        <tr>
            <td colspan="4" class="stylePageHeading">
                <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="0" cellspacing="2px" border="0">
                    <%--Row -1 with 1 columns--%>
                    <tr width="100%">
                        <%--Spacer--%>
                        <td width="100%" colspan="4" align="center">&nbsp;
                        </td>
                    </tr>
                    <%--Row 1 with 4 columns--%>
                    <tr width="100%">
                        <%--Location--%>
                        <td width="15%">
                            <asp:Label Text="Branch" runat="server" ID="lblLocationSearch" CssClass="styleReqFieldLabel" />
                        </td>
                        <td width="35%" align="left">
                            <%-- <cc1:ComboBox ID="ComboBoxLocationSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                                runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLocationSearch_SelectedIndexChanged">
                            </cc1:ComboBox>--%>
                            <%--<asp:TextBox ID="ComboBoxLocationSearch" runat="server" MaxLength="50" OnTextChanged="txtBranchSearch_OnTextChanged"
                                AutoPostBack="true" Width="182px"></asp:TextBox>
                            <cc1:AutoCompleteExtender ID="autoBranchSearch" MinimumPrefixLength="3" OnClientPopulated="Branch_ItemPopulated"
                                OnClientItemSelected="Branch_ItemSelected" runat="server" TargetControlID="ComboBoxLocationSearch"
                                ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="5"
                                CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                ShowOnlyCurrentWordInCompletionListItem="true">
                            </cc1:AutoCompleteExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="ComboBoxLocationSearch"
                                WatermarkText="--Select--">
                            </cc1:TextBoxWatermarkExtender>
                            
                            <asp:RequiredFieldValidator ID="RFVComboLocation" ValidationGroup="RFVDTransLander"
                                InitialValue="--Select--" CssClass="styleMandatoryLabel" runat="server" ControlToValidate="ComboBoxLocationSearch"
                                SetFocusOnError="True" Display="None"></asp:RequiredFieldValidator>--%>
                            <asp:DropDownList ID="ComboBoxLocationSearch" runat="server"></asp:DropDownList>
                            <asp:HiddenField ID="hdnBranchID" runat="server" />
                        </td>
                        <%--Start Date--%>
                        <td width="10%">
                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="25%" align="left">
                            <asp:TextBox ID="txtStartDateSearch" runat="server" Width="150px" OnTextChanged="txtStartDateSearch_TextChanged"
                                AutoPostBack="True"></asp:TextBox>
                            <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                            </cc1:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                Enabled="false" runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                ErrorMessage="Enter a Start Date" Display="None">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--Row 2 with 4 columns--%>
                    <tr width="100%">
                        <%--Branch--%>
                        <td width="15%">
                            <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                            <asp:Label Text="Journal Type" Visible="false" runat="server" ID="lblJVType" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="35%" align="left" align="left">
                            <asp:RadioButton ID="rdoManual" AutoPostBack="true" CssClass="styleDisplayLabel"
                                OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" Checked="true" runat="server"
                                GroupName="DocYes" Text="Manual Journal" />
                            <asp:RadioButton ID="rdoSystem" AutoPostBack="true" CssClass="styleDisplayLabel"
                                OnCheckedChanged="Journal_OnCheckedChanged" Visible="false" GroupName="DocYes"
                                runat="server" Text="System Journal" />
                            <%--<cc1:ComboBox ID="cmbDocumentNumberSearch" runat="server" AutoCompleteMode="SuggestAppend"
                                onkeyup="maxlengthfortxt(113)" DropDownStyle="DropDownList" MaxLength="0" CssClass="WindowsStyle">
                            </cc1:ComboBox>--%>
                            <UC:Suggest ID="cmbDocumentNumberSearch" runat="server" ServiceMethod="GetDocNumber" />
                        </td>
                        <%--End Date--%>
                        <td width="10%">
                            <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="25%" align="left">
                            <asp:TextBox ID="txtEndDateSearch" runat="server" Width="150px" OnTextChanged="txtEndDateSearch_TextChanged"
                                AutoPostBack="True"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                            </cc1:CalendarExtender>
                            <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                            <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                Enabled="false" runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True"
                                ErrorMessage="Enter a End Date" Display="None">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td width="15%">
                            <asp:Label Text="Journal Number" Visible="false" runat="server" ID="lblJVNo" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="35%" align="left">
                            <asp:TextBox ID="cmbJournalNo" runat="server" OnTextChanged="cmbJournalNo_OnTextChanged"
                                AutoPostBack="true">
                            </asp:TextBox>
                            <cc1:AutoCompleteExtender ID="autoLocationSearch" MinimumPrefixLength="3" OnClientPopulated="Location_ItemPopulated"
                                OnClientItemSelected="Location_ItemSelected" runat="server" TargetControlID="cmbJournalNo"
                                ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="5"
                                CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                ShowOnlyCurrentWordInCompletionListItem="true" CompletionInterval="0">
                            </cc1:AutoCompleteExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtJournalNumberExtender" runat="server" TargetControlID="cmbJournalNo"
                                WatermarkText="--Select--">
                            </cc1:TextBoxWatermarkExtender>
                            <asp:HiddenField ID="hdnCommonID" runat="server" />
                            <%--   <cc1:ComboBox ID="cmbJournalNo" runat="server" AutoCompleteMode="SuggestAppend" Visible="false"
                                onkeyup="maxlengthfortxt(113)" DropDownStyle="DropDownList" MaxLength="0" CssClass="WindowsStyle">
                            </cc1:ComboBox>--%>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <%--Row 3 with 4 columns--%>
                    <tr width="100%">
                        <%--Multiple Document Number --%>
                        <td width="15%">
                            <asp:Label Visible="false" Text="Transaction" runat="server" ID="lblMultipleDNC"
                                CssClass="styleDisplayLabel" />
                        </td>
                        <td width="35%" valign="baseline" align="left">
                            <asp:DropDownList Visible="false" ID="ddlMultipleDNC" runat="server" Width="185px">
                            </asp:DropDownList>
                        </td>
                        <td width="10%">
                            <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption"
                                CssClass="styleDisplayLabel" />
                        </td>
                        <td width="25%">
                            <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server" Width="175px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <%--Row 3 with 4 columns--%>
                    <tr width="100%">
                        <%--Document Number--%>
                        <td width="15%">
                            <asp:Label Visible="false" Text="Transaction" runat="server" ID="Label1" CssClass="styleDisplayLabel" />
                        </td>
                        <td width="35%" align="left" align="left"></td>
                        <td colspan="2"></td>
                    </tr>
                    <%--Row 4 with 1 columns--%>
                    <tr width="100%">
                        <%--Spacer--%>
                        <td width="100%" colspan="4" align="center">&nbsp;
                        </td>
                    </tr>
                    <%--Row 5 with 1 columns--%>
                    <tr width="100%">
                        <%--Search Records--%>
                        <td width="100%" colspan="4" align="center">
                            <asp:Button Text="Search" AccessKey="S" ValidationGroup="RFVDTransLander" ID="btnSearch" runat="server"
                                CssClass="styleSubmitButton" UseSubmitBehavior="true" OnClick="btnSearch_Click"
                                ToolTip="Search,Alt+S" />
                            <asp:Button Text="Create" ID="btnCreate" runat="server" CssClass="styleSubmitButton"
                                UseSubmitBehavior="true" OnClick="btnCreate_Click" ToolTip="Create,Alt+C" AccessKey="C" />
                            <asp:Button Text="Clear_FA" ID="btnClear" runat="server" CssClass="styleSubmitButton"
                                UseSubmitBehavior="true" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                                ToolTip="Clear_FA,Alt+L" AccessKey="L" />
                        </td>
                    </tr>
                    <%--Row 6 with 1 columns--%>
                    <tr width="100%">
                        <%--Spacer--%>
                        <td width="100%" colspan="4" align="center">&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--Row 7 with 1 columns--%>
        <tr width="100%">
            <%--Grid--%>
            <td width="100%" colspan="4" align="center">
                <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                    OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                    RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                    <Columns>
                        <%--Query Column--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle CssClass="styleGridHeader" />
                            <HeaderTemplate>
                                <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                    CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Edit Column--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle CssClass="styleGridHeader" />
                            <HeaderTemplate>
                                <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                    CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" Visible="false">
                            <HeaderStyle CssClass="styleGridHeader" />
                            <HeaderTemplate>
                                <asp:Label ID="lblPrint" runat="server" Text="Print"></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnPrint" CssClass="styleGridEdit" ImageUrl="~/Images/pdf.png"
                                    CommandArgument='<%# Bind("ID") %>' CommandName="Print" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--Created by - User ID Column--%>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <%--Row 8 with 1 columns--%>
        <tr width="100%">
            <%--Grid--%>
            <td width="100%" colspan="4" align="center">
                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
            </td>
        </tr>
        <%--Row 9 with 1 columns--%>
        <tr width="100%">
            <%--Spacer--%>
            <td width="100%" colspan="4" align="center">&nbsp;
            </td>
        </tr>
        <%--Row 10 with 1 columns--%>
        <%-- <tr width="100%">--%>
        <%--Search Records--%>
        <%-- <td width="100%" colspan="4" align="center">
                        <asp:Button Text="Show All" ID="btnShowAll" runat="server" CssClass="styleSubmitButton"
                            UseSubmitBehavior="true" OnClick="btnShowAll_Click" />
                    </td>
                </tr>--%>
        <%--Row 11 with 1 columns--%>
        <tr width="100%">
            <%--Error Message--%>
            <td width="100%" colspan="4" align="center">
                <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
            </td>
        </tr>
        <%--Row 12 with 1 columns--%>
        <tr>
            <td colspan="4">
                <%--Hidden fields for grid usage--%>
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
                <input id="hidDate" type="hidden" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                    ShowSummary="true" />
            </td>
        </tr>
    </table>
</asp:Content>
