<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="FA_Reports_FAProfitLoss, App_Web_ygb51gin" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <%-- <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>--%>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Profit and Loss Report" ID="lblHeading" CssClass="styleDisplayLabel">
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
                                            <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlActivity" SetFocusOnError="True" ErrorMessage="Select Activity"
                                                    Display="Dynamic" InitialValue="--Select--">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                  
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation1" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlLocation1" SetFocusOnError="True" ErrorMessage="Select Location"
                                                    Display="Dynamic" InitialValue="--Select--">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDenomination" runat="server" ToolTip="Denomination" 
                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvDenomination" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlDenomination" SetFocusOnError="True" ErrorMessage="Select Denomination"
                                                    Display="Dynamic" InitialValue="0">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess" >
                                                <asp:Label runat="server" ID="lblDenomination" CssClass="styleReqFieldLabel" Text="Denomination"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFrmMonthyr" runat="server" ToolTip="From Month/Year"
                                                AutoPostBack="true" OnTextChanged="txtFromDate_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="txtFrmMonthyr"
                                                BehaviorID="calendar1" Format="MMM/yyyy" TargetControlID="txtFrmMonthyr" OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFrmMonthyr" runat="server" ErrorMessage="Select From Month/Year."
                                                    ValidationGroup="btnGo" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtFrmMonthyr"
                                                    CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Month/Year" ID="lblFrmMonth" CssClass="styleReqFieldLabel"
                                                    ToolTip="From Month/Year">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                 
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkschPL" runat="server" ToolTip="Scheduled PL"  />
                                            <asp:Label runat="server" ID="lblscheduledPL" Text="Scheduled P and L" />
                                        </div>
                                    </div>
                                
                                       <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtToMonthyr" runat="server" ToolTip="To Month/Year" Visible="false"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="calendar2"
                                                Format="MMM/yyyy" TargetControlID="txtToMonthyr" PopupButtonID="txtToMonthyr"
                                                OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvToMonthyr" runat="server" ErrorMessage="Select To Month/Year."
                                                    ValidationGroup="btnGo" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtToMonthyr"
                                                    CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="To Month/Year" ID="lblEndMonth" Visible="false" CssClass="styleDisplayLabel"
                                                    ToolTip="To Month/Year">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                 </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                            type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+N]" onclick="if(fnConfirmExit('btnCancel'))"
                            causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="N">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;Ca<u>n</u>cel
                        </button>

                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlexpense" runat="server" CssClass="stylePanel" Width="100%" Visible="false"
                                GroupingText="Expense">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlEXP" Height="200px" ScrollBars="Vertical" runat="server" HorizontalAlign="Center">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvexpense" runat="server" AutoGenerateColumns="False" Width="100%"
                                                            OnRowDataBound="gv_RowDataBound" CssClass="styleInfoLabel" ShowFooter="true">
                                                            <Columns>
                                                                <%--<asp:TemplateField HeaderText="Sl.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSlNo" Text='<%#Container.DataItemIndex+1%>' runat="server"  ToolTip="Serial Number" ></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left"  />
                                </asp:TemplateField>--%>
                                                                <%--         <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="28%" />
                                </asp:TemplateField>--%>
                                                                <asp:TemplateField HeaderText="Account">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("GL_CODE") %>' ToolTip="Account Code"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Description">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSLdesc" runat="server" Text='<%# Bind("GL_DESC") %>' ToolTip="Account Description"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblSubTotal" runat="server" Text="Total" ToolTip="Total Expenses"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="28%" />
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Budget" HeaderStyle-HorizontalAlign="Right" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblbudgetTotal" runat="server" ToolTip="Total Budget"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount" HeaderStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblEXPTotal" runat="server" ToolTip="Total Expenses"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Previous Year Amount" HeaderStyle-HorizontalAlign="Right" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPAmount" runat="server" Text='<%# Bind("col3") %>' ToolTip="Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblEXPPTotal" runat="server" ToolTip="Total Expenses"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlIncome" runat="server" CssClass="stylePanel" Visible="false" Width="100%"
                                GroupingText="Income">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlINC" Height="200px" ScrollBars="Vertical" runat="server" HorizontalAlign="Center" Width="100%">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvIncomeDetails" runat="server" AutoGenerateColumns="False" OnRowDataBound="gv_RowDataBound"
                                                            CssClass="styleInfoLabel" Width="97%" ShowFooter="true">
                                                            <Columns>

                                                                <asp:TemplateField HeaderText="Account">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("GL_CODE") %>' ToolTip="Account Code"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Description">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSLdesc" runat="server" Text='<%# Bind("GL_DESC") %>' ToolTip="Account Description"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="28%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblSubTotal" runat="server" Text="Total" ToolTip="Total Income"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Budget" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblbudgetTotal" runat="server" ToolTip="Total Budget"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Amount">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblINCTotal" runat="server" ToolTip="Total Income"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Previous Year Amount" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPAmount" runat="server" Text='<%# Bind("col3") %>' ToolTip="Amount"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    <FooterTemplate>
                                                                        <asp:Label ID="lblIncPTotal" runat="server" ToolTip="Total Income"></asp:Label>
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                       <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlscheduledPL" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Summarised Income Statement">
                                  <div id="divacc" runat="server" visible="false" style="height: 300px; overflow: scroll;">
                                    
                        <table width="100%">
                            <tr class="gird">
                                <td id="tdExportDtl" runat="server" visible="false" class="gird_details"></td>
                            </tr>
                        </table>
                                      </div>
                                </asp:Panel>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblGT" Visible="false" runat="server" Text="Grand Total :" />
                            <asp:Label ID="lblGTAmount" Visible="false" runat="server" Text="" />
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="E" title="Excel,Alt+Shift+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>
                        <button class="css_btn_enabled" id="btnEmail" onserverclick="btnEmail_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="M" title="e-Mail,Alt+M" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;e<u>M</u>ail
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="VSTrialBal" runat="server" CssClass="styleMandatoryLabel"
                                CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="btnGo" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="cvProfitLoss" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                </div>
            </div>
        <%--</ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>--%>
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


