<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_FAInterestProvisionProcess, App_Web_zogfwrp2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table width="100%">
                            <tr>
                                <td class="stylePageHeading">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="stylePageHeading">
                                                <asp:Label ID="lblHeading" runat="server" CssClass="styleDisplayLabel">
                                                </asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td width="25%">
                                                <asp:Label ID="lblLastCalcDate" runat="server" Text="Last Calculated Date" CssClass="styleDisplayLabel" />
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtLastCalcDate" runat="server" ReadOnly="true" />
                                                <%--<cc1:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="txtLastCalcDate"
                                                    TargetControlID="txtLastCalcDate" />--%>
                                            </td>
                                            <td width="25%">
                                                <asp:Label ID="lblDate" runat="server" Text="Current Date" CssClass="styleDisplayLabel" />
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtCurrentDate" runat="server" MaxLength="6"/>
                                                <cc1:CalendarExtender ID="CEtxtCurrentDate" runat="server" PopupButtonID="txtCurrentDate"
                                                    BehaviorID="calendar1" Format="yyyyMM" TargetControlID="txtCurrentDate" OnClientShown="onCalendarShown">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="rfvDate" ControlToValidate="txtCurrentDate" runat="server"
                                                    CssClass="styleMandatoryLabel" ErrorMessage="Enter Current Date" ValidationGroup="btnPost"
                                                    Display="None" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revtxtCurrentDate" runat="server" Display="None"
                                                    ValidationGroup="btnPost" ErrorMessage="Enter the valid Current Date(like YYYYMM)"
                                                    ControlToValidate="txtCurrentDate" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="25%">
                                                <asp:Label ID="lblLstCalcNo" runat="server" CssClass="styleDisplayLabel" Text="Last Calculated Number" />
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="txtLstCalcNo" runat="server" ReadOnly="true" />
                                            </td>
                                            <td width="25%">
                                                <asp:Label ID="lblCurrentNo" runat="server" CssClass="styleDisplayLabel" Text="Current Number" />
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="txtCurrentNo" runat="server" ReadOnly="true" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td align="center">
                        <asp:Button ID="btnPost" runat="server" Text="Post" OnClick="btnPost_Click" OnClientClick="return fnCheckPageValidators('btnPost',false);"
                            CssClass="styleSubmitButton" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear_FA" OnClick="btnClear_Click" CssClass="styleSubmitButton" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                            CssClass="styleSubmitButton" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="VSbtnPost" runat="server" ValidationGroup="btnPost" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        <asp:CustomValidator ID="CVProvisionProcess" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        var cal1;
        var cal2;

        function pageLoad() {
            cal1 = $find("calendar1");

            modifyCalDelegates(cal1);
        }

        function modifyCalDelegates(cal) {
            //we need to modify the original delegate of the month cell. 
            cal._cell$delegates = {
                mouseover: Function.createDelegate(cal, cal._cell_onmouseover),
                mouseout: Function.createDelegate(cal, cal._cell_onmouseout),

                click: Function.createDelegate(cal, function(e) {
                    /// <summary>  
                    /// Handles the click event of a cell 
                    /// </summary> 
                    /// <param name="e" type="Sys.UI.DomEvent">The arguments for the event</param> 

                    e.stopPropagation();
                    e.preventDefault();

                    if (!cal._enabled) return;

                    var target = e.target;
                    var visibleDate = cal._getEffectiveVisibleDate();
                    Sys.UI.DomElement.removeCssClass(target.parentNode, "ajax__calendar_hover");
                    switch (target.mode) {
                        case "prev":
                        case "next":
                            cal._switchMonth(target.date);
                            break;
                        case "title":
                            switch (cal._mode) {
                                case "days": cal._switchMode("months"); break;
                                case "months": cal._switchMode("years"); break;
                            }
                            break;
                        case "month":
                            //if the mode is month, then stop switching to day mode. 
                            if (target.month == visibleDate.getMonth()) {
                                //this._switchMode("days"); 
                            } else {
                                cal._visibleDate = target.date;
                                //this._switchMode("days"); 
                            }
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                        case "year":
                            if (target.date.getFullYear() == visibleDate.getFullYear()) {
                                cal._switchMode("months");
                            } else {
                                cal._visibleDate = target.date;
                                cal._switchMode("months");
                            }
                            break;

                        //                case "day":                               
                        //                    this.set_selectedDate(target.date);                               
                        //                    this._switchMonth(target.date);                               
                        //                    this._blur.post(true);                               
                        //                    this.raiseDateSelectionChanged();                               
                        //                    break;                               
                        case "today":
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                    }

                })
            }

        }

        function onCalendarShown(sender, args) {
            //set the default mode to month 
            sender._switchMode("months", true);
            changeCellHandlers(cal1);
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

        function onCalendarHidden(sender, args) {

            if (sender.get_selectedDate()) {

                //get the final date 
                var finalDate = new Date(sender.get_selectedDate());
                var selectedMonth = finalDate.getMonth();
                finalDate.setDate(1);
                if (sender == cal1) {
                    // set the calender2's default date as the last day 
                    finalDate.setMonth(selectedMonth + 1);
                    finalDate = new Date(finalDate - 1);
                }
                //set the date to the TextBox 
                sender.get_element().value = finalDate.format(sender._format);
            }
        }
    </script>

</asp:Content>
