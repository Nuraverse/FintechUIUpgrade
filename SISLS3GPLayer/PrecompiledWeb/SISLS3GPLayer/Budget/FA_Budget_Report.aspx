<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FA_Budget_Report, App_Web_rj0nx3uf" title="Budget Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="Budget Report" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <cc1:ComboBox ID="ddlItemHeader" runat="server" Width="145px" ToolTip="Location"
                                        CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                        AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                    </cc1:ComboBox>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                            runat="server" ControlToValidate="ddlItemHeader" SetFocusOnError="True"
                                            ErrorMessage="Select Item Header" Display="Dynamic" InitialValue="--Select--">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Item Header"></asp:Label>
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtFrmMonthyr" autocomplete="off" runat="server" MaxLength="8" ToolTip="From Month/Year"
                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="txtFrmMonthyr"
                                        BehaviorID="calendar1" OnClientDateSelectionChanged="checkMonthYear_Fromsysdate" Format="MMM/yyyy" TargetControlID="txtFrmMonthyr" OnClientShown="onCalendarShown">
                                    </cc1:CalendarExtender>
                                   
                                     <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFrmMonthyr"
                                            ErrorMessage="Select Month/Year" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnGo"
                                            CssClass="validation_msg_box_sapn" />
                                    </div>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Month/Year" ID="lblFrmMonth" CssClass="styleReqFieldLabel"
                                            ToolTip="Month/Year">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox runat="server" Visible="false"  ID="txtDate" autocomplete="off"
                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                        PopupButtonID="txtDate" ID="CalFromDate" Enabled="True">
                                    </cc1:CalendarExtender>
                                   
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                    <label>
                                        <asp:Label runat="server" Visible="false" ID="lblFromDate" Text="Date" />
                                    </label>
                                </div>
                            </div>

                        </div>
                    </asp:Panel>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="gird">
                        <asp:GridView ID="grvprint" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#029961" OnRowDataBound="grvprint_RowDataBound" ShowFooter="true"
                            RowStyle-Width="0" Width="100%">

                            <Columns>
                                <asp:TemplateField HeaderText="Particulars" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" ForeColor="Black" Font-Bold='<%# Eval("IS_HEADER").ToString() == "1" ? true : false %>' Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- <asp:BoundField DataField="DESCRIPTION" HeaderText="Particulars" />
                                <asp:BoundField DataField="IS_HEADER" Visible="false" HeaderText="HEAD" />--%>

                                <asp:BoundField DataField="ACCUTAL_AMT" HeaderText="Actual" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="CUURENT_AMT" HeaderText="Current" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="BUDGET_AMT" HeaderText="Budget" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />

                                <asp:BoundField DataField="ACCUTAL_AMT1" Visible="false" HeaderText="Actual1" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="CUURENT_AMT1" HeaderText="Current1" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="BUDGET_AMT1" HeaderText="Budget1" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />

                                <asp:BoundField DataField="ACCUTAL_AMT2" Visible="false" HeaderText="Actual2" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="CUURENT_AMT2" HeaderText="Current2" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="BUDGET_AMT2" HeaderText="Budget2" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />

                                <asp:BoundField DataField="ACCUTAL_AMT3" Visible="false" HeaderText="Actual3" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="CUURENT_AMT3" HeaderText="Current3" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="BUDGET_AMT3" HeaderText="Budget3" HeaderStyle-BackColor="#029961" HeaderStyle-ForeColor="White" />



                                <%--                                        <asp:TemplateField HeaderStyle-BackColor="#cccccc" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblActual" runat="server" Text='<%#Eval("CUURENT_AMT1") %>' ToolTip="Document Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                        </asp:TemplateField>--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>


            <div align="right">
                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+C]" visible="false" onclick="if(fnConfirmExit('btnCancel'))"
                    causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                    type="button" accesskey="C">
                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                </button>

            </div>

        </div>
    </div>

    <%--        <Triggers>
            <asp:PostBackTrigger ControlID="BtnPrint" />
        </Triggers>--%>
    <script type="text/javascript">

        var cal1;
        var cal2;

        function pageLoad() {
            cal1 = $find("calendar1");
            cal2 = $find("calendar2");

            modifyCalDelegates(cal1);
            modifyCalDelegates(cal2);
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
            if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null) {
                if (document.getElementById('divMenu').style.display == 'none') {
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                }
                else {
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
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

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
        }

    </script>
</asp:Content>

