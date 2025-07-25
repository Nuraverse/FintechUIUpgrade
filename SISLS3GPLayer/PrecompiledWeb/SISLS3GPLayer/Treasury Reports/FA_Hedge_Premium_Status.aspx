<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" enableeventvalidation="false" autoeventwireup="true" inherits="Reports_FA_Hedge_Premium_Status, App_Web_u0nem2mh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="stylePageHeading">
                <asp:Label runat="server" Text="Hedge Premium Status Report" ID="lblHeading" CssClass="styleDisplayLabel">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlHedgePremium" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <table width="100%">
                        <tr>
                            <td class="styleFieldLabel" width="17%">
                                <asp:Label runat="server" ID="lblHedgeDateFrom" CssClass="styleReqFieldLabel" Text="Hedge Date From"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtHedDateFrom" runat="server" Width="170px" ToolTip="Hedge Date From"
                                AutoPostBack="True" OnTextChanged="txtHedDateFrom_OnTextChanged"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtnHedFromDate" runat="server" PopupButtonID="txtHedDateFrom"
                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" BehaviorID="calendar1"
                                    Format="DD/MM/yyyy" TargetControlID="txtHedDateFrom" OnClientShown="onCalendarShown">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="rfvHedDateFrom" runat="server" ErrorMessage="Select Hedge Date From"
                                    ValidationGroup="btnGo" Display="None" SetFocusOnError="True" ControlToValidate="txtHedDateFrom">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td class="styleFieldLabel" width="17%">
                                <asp:Label runat="server" ID="lblHedDateTo" CssClass="styleReqFieldLabel" Text="Hedge Date To"></asp:Label>
                            </td>
                            <td class="styleFieldAlign">
                                <asp:TextBox ID="txtHedDateTo" runat="server" Width="170px" ToolTip="Hedge Date To"
                                AutoPostBack="True"  OnTextChanged="txtHedDateTo_OnTextChanged"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtnHedToDate" runat="server" PopupButtonID="txtHedDateTo"
                                    OnClientDateSelectionChanged="checkDate_NextSystemDate" BehaviorID="calendar2"
                                    Format="DD/MM/yyyy" TargetControlID="txtHedDateTo" OnClientShown="onCalendarShown">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="rfvHedDateTo" runat="server" ErrorMessage="Select Hedge Date To"
                                    ValidationGroup="btnGo" Display="None" SetFocusOnError="True" ControlToValidate="txtHedDateTo">
                                </asp:RequiredFieldValidator>
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
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Panel ID="pnlHedgePreStaHeader" runat="server" CssClass="stylePanel" Width="99%"
                                Visible="true" GroupingText="Hedge Premium Status Report">
                                <asp:GridView ID="grvHedgePreStausHeader" runat="server" AutoGenerateColumns="False"
                                    Width="100%" CssClass="styleInfoLabel" OnRowDataBound="grvHedgePreStausHeader_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Hedging Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeDate" runat="server" Text='<%# Bind("Hedging_Date") %>' ToolTip="Hedge Date"></asp:Label>
                                                <asp:HiddenField ID="hdn_Hedge_ID" runat="server" Value='<% #Eval("Hedge_ID")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Agent Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeAgeName" runat="server" Text='<%# Bind("Agent_Name") %>' ToolTip="Hedge Agent Name"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hedge Ref.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeRefNo" runat="server" Text='<%# Bind("Hedge_Ref_No") %>' ToolTip="Hedge Ref No."></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Currency Desc">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeCurrency" runat="server" Text='<%# Bind("Currency_Desc") %>'
                                                    ToolTip="Hedge Currency"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hedge Value">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeAmount" runat="server" Text='<%# Bind("Hedge_Value") %>' ToolTip="Hedge Amount"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblHedgeAmntTotal" runat="server" ToolTip="Hedge Amount"></asp:Label>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium Rate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgePremium" runat="server" Text='<%# Bind("Premium_Rate") %>'
                                                    ToolTip="Hedge Premium"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                    OnClick="FunProShow_Details" CommandName="Query" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="4%" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlHedgePreStaDetails" runat="server" CssClass="stylePanel" Width="99%"
                                Visible="true" GroupingText="Hedge Premium Status Details">
                                <asp:GridView ID="grvHedgePreStausDetails" runat="server" AutoGenerateColumns="False"
                                    Width="100%" CssClass="styleInfoLabel" ShowFooter="true" OnRowDataBound="grvHedgePreStausDetails_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Hedge Ref.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeRefNo" runat="server" Text='<%# Bind("Hedge_Ref_No") %>' ToolTip="Hedge Ref.No"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium Due Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPremiumDueDate" runat="server" Text='<%# Bind("Premium_Due_Date") %>'
                                                    ToolTip="Premium Due Date"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Premium Due Amt">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPremiumDueAmt" runat="server" Text='<%# Bind("Premium_Due_Amt") %>'
                                                    ToolTip="Premium Due Amt"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Paid Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeCurrency" runat="server" Text='<%# Bind("Paid_Date") %>' ToolTip="Paid Date"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment JV">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHedgeAmount" runat="server" Text='<%# Bind("Payment_JV") %>' ToolTip="Payment JV"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotal" runat="server" ToolTip="Total" Text="Total"></asp:Label>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Amt">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPaymentAmt" runat="server" Text='<%# Bind("Payment_Amt") %>'
                                                    ToolTip="Payment Amt"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblPaymntAmntTotal" runat="server" ToolTip="Payment Amount"></asp:Label>
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnPrint" CssClass="styleSubmitButton" runat="server" Text="Print"
                    OnClick="btnPrint_Click" Visible="false" ToolTip="Print" />
                <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Visible="false" Text="Excel" OnClick="FunExcelExport"  />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="vsHedgPreStatusetails" runat="server" ValidationGroup="btnGo"
                    HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel"
                    Width="100%" />
            </td>
        </tr>
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
