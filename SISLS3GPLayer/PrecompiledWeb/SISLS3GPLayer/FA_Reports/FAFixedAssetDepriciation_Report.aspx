<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FAFixedAssetDepriciation_Report, App_Web_upeq32zu" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="Fixed Asset Depreciation Report" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                            <table width="100%">
                                <tr>
                                    <td class="styleDisplayLabel" width="10%">
                                        <asp:Label runat="server" Text="Cut off Date" ID="lblToDate" CssClass="styleDisplayLabel" />
                                    </td>
                                    <td width="25%" class="styleFieldAlign" align="left">
                                        <asp:TextBox ID="txtToDateSearch" onmouseover="txt_MouseoverTooltip(this)"  OnTextChanged="txtToDateSearch_TextChanged" runat="server"
                                            AutoPostBack="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtToDate" runat="server" ControlToValidate="txtToDateSearch"
                                            Display="None" ErrorMessage="Select Cut off Date" SetFocusOnError="True"
                                            ValidationGroup="Main" />
                                        <asp:Image runat="server" ID="imgToDate" Visible="false" />
                                        <cc1:CalendarExtender ID="CEXtxtToDate" runat="server" Enabled="True"
                                            PopupButtonID="imgToDate" TargetControlID="txtToDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>

                                    </td>
                                    <td class="styleFieldLabel" width="10%">
                                        <asp:Label runat="server" Text="Cut off Date" Visible="false" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                    </td>
                                    <td width="25%" class="styleFieldAlign" align="left">
                                        <asp:TextBox ID="txtStartDateSearch" Visible="false" onmouseover="txt_MouseoverTooltip(this)" runat="server"
                                            AutoPostBack="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                            Display="None" ErrorMessage="Select Start Date" SetFocusOnError="True"
                                            ValidationGroup="Main" />
                                        <asp:Image runat="server" ID="imgStartDate" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>

                                    </td>


                                    <td class="styleFieldLabel" width="25%">
                                        <asp:Label runat="server" ID="lblAssetGroup" Visible="false" CssClass="styleReqFieldLabel" Text="Asset Group"></asp:Label>
                                    </td>
                                    <td class="styleFieldLabel" width="25%">
                                        <cc1:ComboBox ID="ddlAssetgroup" runat="server" Visible="false" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AutoPostBack="true"
                                            Width="170px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                        </cc1:ComboBox>
                                        <%--<asp:DropDownList ID="ddlLocation1" runat="server" ToolTip="Location1" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation1_SelectedIndexChanged"></asp:DropDownList>--%>
                         
                                    </td>

                                </tr>

                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>

                    <td align="center" colspan="4">
                        <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitButton" Text="Go"
                            ValidationGroup="Main" ToolTip="Go" OnClick="btnGo_Click" />&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnClear" OnClick="btnClear_Click" runat="server" CssClass="styleSubmitButton"
                        Text="Clear_FA" OnClientClick="return fnConfirmClear();" ToolTip="Clear_FA" />
                        <asp:Button ID="BtnCancel" OnClick="BtnCancel_Click" CssClass="styleSubmitButton" runat="server" Text="Exit" ToolTip="Cancel" />
                        <asp:ImageButton ID="BtnPrint" CssClass="styleDisplayLabel" Visible="false" OnClick="BtnPrint_Click" ImageUrl="~/Images/ExcelExport10.png"
                            Width="30px" Height="30px" runat="server" ToolTip="Export to Excel" />

                    </td>
                </tr>
                <tr>
                    <td class="styleFieldAlign" colspan="4">
                        <asp:Panel ID="pnlAssetDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Fixed Asset Depreciation Details">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: none">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="grvtransaction" OnRowDataBound="grvTransLander_RowDataBoundExcel" OnRowCreated="grvtransaction_RowCreated" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                            CssClass="styleInfoLabel" Width="100%" ShowFooter="false" ShowHeader="true">
                                                        </asp:GridView>
                                                    </td>
                                                </tr>

                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>



                <tr align="center">
                    <td>
                        <%--<asp:Button ID="BtnPrint" CssClass="styleSubmitButton" Visible="false" runat="server" Text="Print" ToolTip="Print" OnClick="BtnPrint_Click" />--%>

                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vsBankBook" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                            ValidationGroup="Main" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:CustomValidator ID="cvBankBook" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
