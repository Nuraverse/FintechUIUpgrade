<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAFinancialYearOpening_Add, App_Web_4hds5vgj" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="3" cellspacing="0">
        <tr>
            <td class="stylePageHeading" colspan="4">
                <asp:Label runat="server" Text="Financial Year Opening" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" align="center">
        <tr>
            <td>
                <asp:Panel ID="pnlOpenyearProcess" runat="server" ToolTip="Open Year Process" GroupingText="Open Year Process"
                    Width="99%" CssClass="stylePanel">
                    <table width="100%" align="center">
                        <tr>
                            <td style="width:15%;">
                                <asp:Label runat="server" Text="Open Year" ID="lblOpenYear" CssClass="styleReqFieldLabel"></asp:Label>
                            </td>
                            <td style="width:15%;">
                                <asp:TextBox ID="txtOpenYear" runat="server" Width="75%" ContentEditable="False" ToolTip="Open Year"></asp:TextBox>
                            </td>
                            <td style="width:15%;">
                                <asp:Label runat="server" Text="User Name" ID="lblUserName" CssClass="styleReqFieldLabel"></asp:Label>
                            </td>
                            <td style="width:20%;">
                                <asp:TextBox ID="txtUserName" runat="server" ContentEditable="False" ToolTip="Open Year"></asp:TextBox>
                            </td>
                            <td style="width:15%;">
                                <asp:Label runat="server" Text="Open Date" ID="lblOpenDate" CssClass="styleReqFieldLabel"></asp:Label>
                            </td>
                            <td style="width:20%;">
                                <asp:TextBox ID="txtOpenDate" runat="server" Width="50%" ContentEditable="False" ToolTip="Open Year"></asp:TextBox>
                                <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtOpenDate"
                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgDate"
                                    ID="CEtxtOpenDate" Enabled="True">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="Current Year" ID="Label1" CssClass="styleReqFieldLabel"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCurrentYear" runat="server" Width="75%" ContentEditable="False" ToolTip="Current Year"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="User Name" ID="lblCurrentUserName" CssClass="styleReqFieldLabel"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCurrentUserName" runat="server" ContentEditable="False" ToolTip="Current User Name"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="Open Date" ID="lblCurrentOpenDate" CssClass="styleReqFieldLabel"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCurrentOpenDate" Width="50%" runat="server" ContentEditable="False" ToolTip="Current Open Date"></asp:TextBox>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtCurrentOpenDate"
                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgDate"
                                    ID="CEtxtCurrentOpenDate" Enabled="True">
                                </cc1:CalendarExtender>
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
                <cc1:TabContainer ID="TCDebitCreditNote" runat="server" CssClass="styleTabPanel"
                    Width="100%" ScrollBars="None">
                    <cc1:TabPanel runat="server" ID="TPDebitCreditNote" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Database Replication
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <cc1:TabContainer ID="TCDatabaseReplication" runat="server" CssClass="styleTabPanel"
                                        Width="100%" ScrollBars="None">
                                        <cc1:TabPanel runat="server" ID="TabPanel1" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Current DB
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" align="center">
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="Database Name" ID="lblDatabaseNameCB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtDatabaseNameCB" runat="server" ToolTip="Database Name"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="Schema Name" ID="lblSchemaNameCB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtSchemaNameCB" runat="server" ToolTip="Schema Name"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="User Name" ID="lblUserNameCB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtUserNameCB" runat="server" ToolTip="User Name"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" ID="TabPanel2" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                New DB
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" align="center">
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="Database Name" ID="lblDatabaseNameNDB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtDatabaseNameNDB" runat="server" ToolTip="Database Name"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="Schema Name" ID="lblSchemaNameNDB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtSchemaNameNDB" runat="server" ToolTip="Schema Name"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="User Name" ID="lblUserNameNDB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtUserNameNDB" runat="server" ToolTip="User Name"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 25%;">
                                                                    <asp:Label runat="server" Text="Password" ID="lblPasswordNDB" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td style="width: 25%;">
                                                                    <asp:TextBox ID="txtPasswordNDB" runat="server" ToolTip="Password"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel runat="server" ID="TabPanel3" CssClass="tabpan" BackColor="Red">
                                            <HeaderTemplate>
                                                Current DB Tables
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" align="center">
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:GridView ID="grvCurrenDBtables" runat="server" AutoGenerateColumns="false" BorderWidth="2px"
                                                                        HeaderStyle-CssClass="styleGridHeader" Width="50%">
                                                                        <Columns>
                                                                            <asp:BoundField DataField="CurrentDBTables" HeaderText="Current DB Tables" ItemStyle-HorizontalAlign="Center" />
                                                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkSelTables" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabPanelApproval" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Document Number
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td style="width: 25%;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 25%;">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 25%;">
                                                <asp:Label runat="server" Text="Document Number of the Year" ID="lblDNY" CssClass="styleDisplayLabel"></asp:Label>
                                            </td>
                                            <td style="width: 25%;">
                                                <asp:TextBox ID="txtDNY" runat="server" ToolTip="Document Number of the Year"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnCopyNumbers" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                                    Text="Copy Numbers" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:GridView ID="grvDocumentNoDetails" runat="server" AutoGenerateColumns="false"
                                                    BorderWidth="2px" HeaderStyle-CssClass="styleGridHeader" Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="slNo" HeaderText="SL.No" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="DocumentTypeDesc" HeaderText="Document Type Desc" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="LocationDesc" HeaderText="Location Desc" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="CurrentBatch" HeaderText="Current Batch" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="LastUsedNo" HeaderText="Last Used No" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField HeaderText="New Batch">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtNewBatch" runat="server"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Start Number">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtStartNumber" runat="server"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="End Number">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtEndNumber" runat="server"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel runat="server" ID="TabPanelDim" CssClass="tabpan" BackColor="Red">
                        <HeaderTemplate>
                            Opening Balances
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <table width="100%" align="center">
                                        <tr>
                                            <td style="width: 25%;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 25%;">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 25%;">
                                                <asp:Label runat="server" Text="Opening Balnace of the Year" ID="lblOBY" CssClass="styleDisplayLabel"></asp:Label>
                                            </td>
                                            <td style="width: 25%;">
                                                <asp:TextBox ID="txtOBY" runat="server" ToolTip="Opening Balnace of the Year"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnFetchData" runat="server" CausesValidation="true" CssClass="styleSubmitButton"
                                                    Text="Fetch Data" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:GridView ID="grvOpeningBalDetails" runat="server" AutoGenerateColumns="false"
                                                    BorderWidth="2px" HeaderStyle-CssClass="styleGridHeader" Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="Accountdesc" HeaderText="Account Description" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="GLAccount" HeaderText="GL Account" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="SubGLAccount" HeaderText="Sub GL Account" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="PreOpenBalance" HeaderText="Previous Open Balance" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="CurrentYear" HeaderText="Current Year" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField DataField="CurrentOpenBalance" HeaderText="Current Open Balance"
                                                            ItemStyle-HorizontalAlign="Center" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
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
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;
                <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="styleSubmitButton"
                    ValidationGroup="Save" />
                &nbsp;
                <asp:Button runat="server" ID="btnCleart" ToolTip="Clear_FA" Text="Clear_FA" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClientClick="return confirm('Are you sure want to Clear_FA?');" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                    CssClass="styleSubmitButton" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
