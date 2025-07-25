<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_HedgingReport, App_Web_aagoig1p" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Hedging Report" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel" width="17%">
                                <asp:Label runat="server" ID="lblAgentName" CssClass="styleReqFieldLabel" Text="Agent Name"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <cc1:ComboBox ID="ddlAgentName" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    Width="145px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                    AutoPostBack="true">
                                </cc1:ComboBox>
                                <asp:RequiredFieldValidator ID="rfvAgentName" ValidationGroup="btnGo" CssClass="styleMandatoryLabel"
                                    runat="server" ControlToValidate="ddlAgentName" SetFocusOnError="True" ErrorMessage="Select Agent Name"
                                    Display="None" InitialValue="--Select--">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="styleFieldLabel" width="17%">
                                <asp:Label runat="server" ID="lblHedgeDateFrom" CssClass="styleReqFieldLabel" Text="Hedge Date From"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtHedDateFrom" runat="server" Width="170px" ToolTip="Hedge Date From"
                                    AutoPostBack="True" OnTextChanged="txtHedDateFrom_OnTextChanged"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtnHedFromDate" runat="server" PopupButtonID="txtHedDateFrom" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    BehaviorID="calendar1" Format="DD/MM/yyyy" TargetControlID="txtHedDateFrom" OnClientShown="onCalendarShown">
                                </cc1:CalendarExtender>
                               <%-- <asp:RequiredFieldValidator ID="rfvHedDateFrom" runat="server" ErrorMessage="Select Hedge Date From"
                                    ValidationGroup="btnGo" Display="None" SetFocusOnError="True" ControlToValidate="txtHedDateFrom">
                                </asp:RequiredFieldValidator>--%>
                            </td>
                            <td class="styleFieldLabel" width="17%">
                                <asp:Label runat="server" ID="lblHedDateTo" CssClass="styleReqFieldLabel" Text="Hedge Date To"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtHedDateTo" runat="server" Width="170px" ToolTip="Hedge Date To"
                                    AutoPostBack="True"  OnTextChanged="txtHedDateTo_OnTextChanged"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtnHedToDate" runat="server" PopupButtonID="txtHedDateTo" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    BehaviorID="calendar2" Format="DD/MM/yyyy" TargetControlID="txtHedDateTo" OnClientShown="onCalendarShown">
                                </cc1:CalendarExtender>
                               <%-- <asp:RequiredFieldValidator ID="rfvHedDateTo" runat="server" ErrorMessage="Select Hedge Date To"
                                    ValidationGroup="btnGo" Display="None" SetFocusOnError="True" ControlToValidate="txtHedDateTo">
                                </asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="styleFieldLabel" height="8px">
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitButton" Text="Go" OnClick="btnGo_Click"
                    ValidationGroup="btnGo" ToolTip="Go" />&nbsp;
                <asp:Button ID="btnClear" runat="server" CssClass="styleSubmitButton" Text="Clear_FA"
                    OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" ToolTip="Clear_FA" />
                &nbsp;
                <asp:Button runat="server" ID="btnCancel" Text="Cancel" CausesValidation="false"
                    CssClass="styleSubmitButton" ToolTip="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign">
            </td>
        </tr>
        <tr>
            <td class="styleFieldAlign">
                <asp:Panel ID="pnlHedgingRptDetails" runat="server" CssClass="stylePanel" Width="99%"
                    Visible="true" GroupingText="Hedging Report Details">
                    <asp:GridView ID="grvHedgingRptDetails" runat="server" AutoGenerateColumns="False"
                        Width="100%" CssClass="styleInfoLabel" ShowFooter="true" OnRowDataBound="grvHedgingRptDetails_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Hedge Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblHedgeDate" runat="server" Text='<%# Bind("Hedge_Date") %>' ToolTip="Hedge Date"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hedge Agent Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblHedgeAgeName" runat="server" Text='<%# Bind("Hedge_Agent_Name") %>'
                                        ToolTip="Hedge Agent Name"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hedge Ref No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblHedgeRefNo" runat="server" Text='<%# Bind("Hedge_Ref_No") %>' ToolTip="Hedge Ref No."></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hedge Currency">
                                <ItemTemplate>
                                    <asp:Label ID="lblHedgeCurrency" runat="server" Text='<%# Bind("Hedge_Currency") %>'
                                        ToolTip="Hedge Currency"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                 <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" ToolTip="Hedge Amount" Text="Total"></asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hedge Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblHedgeAmount" runat="server" Text='<%# Bind("Hedge_Amount") %>'
                                        ToolTip="Hedge Amount"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                                <FooterTemplate>
                                    <asp:Label ID="lblHedgeAmntTotal" runat="server" ToolTip="Hedge Amount"></asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hedge Premium">
                                <ItemTemplate>
                                    <asp:Label ID="lblHedgePremium" runat="server" Text='<%# Bind("Hedge_Premium") %>'
                                        ToolTip="Hedge Premium"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Funder Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFunderName" runat="server" Text='<%# Bind("Funder_Name") %>' ToolTip="Funder Name"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fund Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblFundType" runat="server" Text='<%# Bind("Fund_Type") %>' ToolTip="Fund Type"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Repay Due Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblRepayDueDt" runat="server" Text='<%# Bind("Repay_Due_Date") %>'
                                        ToolTip="Repay Due Date"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Repay Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblRepayType" runat="server" Text='<%# Bind("Repay_Type") %>' ToolTip="Repay Type"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Repay Due Amt">
                                <ItemTemplate>
                                    <asp:Label ID="lblRepayDueAmt" runat="server" Text='<%# Bind("Repay_Due_Amt") %>'
                                        ToolTip="Repay Due Amt" Width="100px"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="50%" />
                                <FooterTemplate>
                                    <asp:Label ID="lblRepayTotalAmnt" runat="server" ToolTip="Total Repay Amount"></asp:Label>
                                </FooterTemplate>
                                <FooterStyle HorizontalAlign="Right" Width="50%" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnPrint" CssClass="styleSubmitButton" runat="server" Text="Print"
                    OnClick="btnPrint_Click" Visible="false" ToolTip="Print" />
                <asp:Button ID="btnEmail" CssClass="styleSubmitButton" runat="server" Text="e-Mail"
                    OnClick="btnEmail_Click" Visible="false" ToolTip="e-Mail" />
                <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
            </td>
        </tr>
        <tr><td>
        <asp:ValidationSummary ID="vsHedgRptDetails" runat="server" ValidationGroup="btnGo" 
        HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" Width="100%"/> 
        </td></tr>
    </table>

    <script type="text/javascript">
        function onCalendarShown(sender, args) {
            //set the default mode to month 
            sender._switchMode("days", true);
            //changeCellHandlers(cal);
        }


        function changeCellHandlers(cal) {

            if (cal._monthsBody) {

                //remove the old handler of each month body. 
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $common.removeHandlers(row.cells[j].firstChild, cal._cell$delegates);
                    }
                }
                //add the new handler of each month body. 
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $addHandlers(row.cells[j].firstChild, cal._cell$delegates);
                    }
                }

            }
        } 
        
    </script>

</asp:Content>
