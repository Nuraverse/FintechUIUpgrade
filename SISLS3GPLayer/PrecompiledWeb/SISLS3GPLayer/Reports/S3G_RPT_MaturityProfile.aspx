<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Reports_S3G_RPT_MaturityProfile, App_Web_zznul5le" %>


<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Maturity Profile Report" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <table cellpadding="0" cellspacing="0" style="width: 100%" border="0">
                        <tr>
                            <td class="styleFieldLabel" width="25%">
                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"
                                    ToolTip="Line of Business">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign" align="left" width="25%">
                                <asp:DropDownList ID="ddlLOB" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" runat="server" Width="75%" AutoPostBack="true" ToolTip="Line of Business">
                                </asp:DropDownList>
                            </td>

                            <td class="styleFieldLabel" style="width: 25%">
                                <asp:Label ID="lblregion" runat="server" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <UC:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                    IsMandatory="false" ErrorMessage="Select Location" />
                            </td>
                        </tr>
                        <tr>
                            <td class="styleFieldLabel" width="25%">
                                <asp:Label runat="server" Text="Product" ID="lblProduct" CssClass="styleDisplayLabel"
                                    ToolTip="Product">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign" align="left" width="25%">
                                <asp:DropDownList ID="ddlProduct" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" runat="server" Width="75%" AutoPostBack="true" ToolTip="Product">
                                </asp:DropDownList>
                            </td>

                            <td class="styleFieldLabel" width="25%">
                                <asp:Label runat="server" Text="Account Status" ID="lblAccountStatus" CssClass="styleReqFieldLabel"
                                    ToolTip="Account Status">
                                </asp:Label>
                            </td>
                            <td class="styleFieldAlign" align="left" width="25%">
                                <asp:DropDownList ID="ddlAccountStatus" runat="server" Width="75%" AutoPostBack="true" OnSelectedIndexChanged="ddlAccountStatus_SelectedIndexChanged" ToolTip="Account Status">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="All" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Live" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Closed" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvAccountStatus" runat="server" ControlToValidate="ddlAccountStatus" Display="None" ErrorMessage="Select Account Status" InitialValue="0" ValidationGroup="btnGo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="styleFieldLabel" style="width: 25%">
                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="From Date" ToolTip="From Date" />
                            </td>
                            <td class="styleFieldAlign">
                                <input id="hidDate" runat="server" type="hidden" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" Width="120" ToolTip="Start Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="None" ControlToValidate="txtStartDateSearch"
                                    ValidationGroup="btnGo" CssClass="styleMandatoryLabel" ErrorMessage="Select From Date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="styleFieldLabel" style="width: 25%">
                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="To Date" ToolTip="To Date" />
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" Width="120" ToolTip="End Date"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="None" ControlToValidate="txtEndDateSearch"
                                    ValidationGroup="btnGo" CssClass="styleMandatoryLabel" ErrorMessage="Select To Date"
                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                    PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitShortButton" Text="Go" OnClick="btnGo_Click"
                                    ValidationGroup="btnGo" OnClientClick="return fnCheckPageValidators('btnGo',false);" ToolTip="Go" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear" OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" ToolTip="Clear" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>

        <tr>

            <td>
                <asp:Panel ID="pnlGridDetails" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                    <table cellpadding="0" cellspacing="0" style="width: 100%" border="0">
                        <tr>
                            <td>
                                <div id="divCollection" runat="server" style="height: 200px; overflow: scroll">
                                    <asp:GridView ID="grvGridDetails" runat="server" AutoGenerateColumns="false" ShowFooter="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<% # Bind("SNo")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" runat="server" Text='<% # Bind("Customer_Name")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prime Account">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimeAccount" runat="server" Text='<% # Bind("PANum")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Finance Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFinanceAmount" runat="server" Text='<% # Bind("Finance_Amount")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IRR">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBusinessIRR" runat="server" Text='<% # Bind("Business_IRR")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Billed Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBilledAmount" runat="server" Text='<% # Bind("BilledAmount")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Collected Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCollectedAmount" runat="server" Text='<% # Bind("Collected")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBalance" runat="server" Text='<% # Bind("Balance")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Future Principal">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFuturePrincipal" runat="server" Text='<% # Bind("FuturePrincipal")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UMFC">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUMFC" runat="server" Text='<% # Bind("UMFC")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Maturity Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMaturityDate" runat="server" Text='<% # Bind("MaturityDate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ODI Received">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblODIReceived" runat="server" Text='<% # Bind("ODI_Received")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Other Balance">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOtherBalance" runat="server" Text='<% # Bind("OTHER_DUE")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
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

                <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" CssClass="styleSubmitButton" />                
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="styleSubmitButton" OnClientClick="parent.RemoveTab();" />

            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vs" runat="server" ValidationGroup="btnGo" DisplayMode="List" CssClass="styleSummaryStyle" HeaderText="correct the following validation(s):" ShowMessageBox="false" ShowSummary="true" />
            </td>

        </tr>
    </table>

</asp:Content>


