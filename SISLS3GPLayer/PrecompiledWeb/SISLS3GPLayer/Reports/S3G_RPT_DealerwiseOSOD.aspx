<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3G_RPT_DealerwiseOSOD, App_Web_zznul5le" title="Dealerwise OS/OD" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Dealerwise OS/OD">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <asp:Panel runat="server" ID="PnlDealerwise" CssClass="stylePanel" GroupingText="INPUT CRITERIA">
                        <div class="row">
                                                    
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlReportType"  AutoPostBack="true" runat="server" ToolTip="Report Type"
                                        class="md-form-control form-control login_form_content_input requires_true">
                                          <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Dealerwise Outstanding" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Dealerwise overdue" Value="2"></asp:ListItem>
                                       
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlcategory" runat="server" ErrorMessage="Select the ReportType" ValidationGroup="btnGo" InitialValue="0"
                                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlReportType"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCategory" runat="server" Text="Report Type" CssClass="styleDisplayLabel" ToolTip="Category"></asp:Label>
                                    </label>
                                </div>
                            </div>
                          
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtdate" runat="server"  AutoPostBack="true"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgStartMonth" BehaviorID="calendar1" Format="MM/yyyy" TargetControlID="txtdate" OnClientShown="onCalendarShown">
                                    </cc1:CalendarExtender>
                                    <asp:Image ID="imgStartMonth" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvcutoffmonth" runat="server" ErrorMessage="Select the Month" ValidationGroup="btnGo"
                                            Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtdate"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblReportDateSearch" runat="server" CssClass="styleDisplayLabel" Text="Month" ToolTip="Report Date" />
                                    </label>
                                </div>
                            </div>



                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnGo"  validationgroup="btnGo" runat="server" onserverclick="btnGo_ServerClick"
                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="true"  runat="server" onserverclick="btnClear_ServerClick"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
            </div>
           
          

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="true" ValidationGroup="btnGo" Visible="false" />
                </div>
            </div>
            <script type="text/javascript">

                var cal1;

                function pageLoad() {
                    cal1 = $find("calendar1");
                    modifyCalDelegates(cal1);
                }

                function modifyCalDelegates(cal) {
                    //we need to modify the original delegate of the month cell. 
                    cal._cell$delegates = {
                        mouseover: Function.createDelegate(cal, cal._cell_onmouseover),
                        mouseout: Function.createDelegate(cal, cal._cell_onmouseout),

                        click: Function.createDelegate(cal, function (e) {
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
                        if (cal1.get_selectedDate() && cal2.get_selectedDate() && cal1.get_selectedDate() > cal2.get_selectedDate()) {
                            alert('Start Month/Year cannot be Greater than the End Month/Year, please reselect!');
                            sender.show();
                            return;
                        }
                        //get the final date 
                        var finalDate = new Date(sender.get_selectedDate());
                        var selectedMonth = finalDate.getMonth();
                        finalDate.setDate(1);
                        if (sender == cal2) {
                            // set the calender2's default date as the last day 
                            finalDate.setMonth(selectedMonth + 1);
                            finalDate = new Date(finalDate - 1);
                        }
                        //set the date to the TextBox 
                        sender.get_element().value = finalDate.format(sender._format);
                    }
                }
                function Resize() {
                    if (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails') != null) {
                        if (document.getElementById('divMenu') != null) {
                            if (document.getElementById('divMenu').style.display == 'none') {
                                (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                            }
                            else {
                                (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails')).style.width = screen.width - 270;
                            }
                        }
                    }
                }


                function showMenu(show) {
                    if (show == 'T') {

                        if (document.getElementById('divGrid1') != null) {
                            document.getElementById('divGrid1').style.width = "800px";
                            document.getElementById('divGrid1').style.overflow = "scroll";
                        }

                        document.getElementById('divMenu').style.display = 'Block';
                        document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                        document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                        document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                        if (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails') != null)
                            (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails')).style.width = screen.width - 270;
                    }
                    if (show == 'F') {
                        if (document.getElementById('divGrid1') != null) {
                            document.getElementById('divGrid1').style.width = "960px";
                            document.getElementById('divGrid1').style.overflow = "auto";
                        }

                        document.getElementById('divMenu').style.display = 'none';
                        document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                        document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                        if (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails') != null)
                            (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                    }
                }


            </script>
        </div>
    </div>
</asp:Content>