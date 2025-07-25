<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptDemandStatement, App_Web_nmps0mjf" title="Demand Statement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Demand Statement">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <asp:Panel runat="server" ID="PnlDemandStatement" CssClass="stylePanel" GroupingText="INPUT CRITERIA">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" AutoPostBack="true" ToolTip="Line of Business"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel" ToolTip="Line of Business"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlbranch" OnSelectedIndexChanged="ddlbranch_SelectedIndexChanged" AutoPostBack="true" runat="server" ToolTip="Branch"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="req_loc1" runat="server" ErrorMessage="Select Location" ValidationGroup="btnGo"
                                            Display="Dynamic" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True" ControlToValidate="ddlbranch" InitialValue="-1"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblbranch" runat="server" Text="Branch" CssClass="styleDisplayLabel" ToolTip="Branch"></asp:Label>
                                    </label>
                                </div>
                            </div>                           
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" runat="server" ToolTip="Category"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCategory" runat="server" Text="Category" CssClass="styleDisplayLabel" ToolTip="Category"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDebtCollectorType" runat="server" OnSelectedIndexChanged="ddlDebtCollectorType_SelectedIndexChanged" AutoPostBack="true"
                                        ToolTip="Debt Collector Type" class="md-form-control form-control">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDebtCollector" runat="server" Text="Debt Collector" CssClass="styleDisplayLabel" ToolTip="Debt Collector"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlAgeing" runat="server" OnSelectedIndexChanged="ddlAgeing_SelectedIndexChanged" AutoPostBack="true" ToolTip="Ageing"
                                        class="md-form-control form-control">
                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="0-30 Days" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="31-60 Days" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="61-90 Days" Value="2"></asp:ListItem>
                                        <asp:ListItem Text=">90 Days" Value="3"></asp:ListItem>
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblageing" runat="server" Text="Ageing" CssClass="styleDisplayLabel" ToolTip="Ageing"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtdate" runat="server" OnTextChanged="txtdate_OnTextChanged" AutoPostBack="true"
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
                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PnlDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Demand Statement">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div id="divDemand" runat="server" style="overflow: auto; height: 400px; display: none">

                                        <asp:GridView ID="grvDemand" runat="server" AutoGenerateColumns="False"
                                            CssClass="styleInfoLabel" ShowFooter="true" Style="margin-bottom: 0px" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Line Of Business">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line Of Business"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>' ToolTip="Branch"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcustomer" runat="server" Text='<%# Bind("CustomerCode") %>' ToolTip="Customer Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Postal Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPincode" runat="server" Text='<%# Bind("Pincode") %>' ToolTip="Pincode"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText=" Loan No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PrimeAccountNo") %>' ToolTip="Account NO"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%--<asp:TemplateField HeaderText="Sub Account No.">
                                <ItemTemplate>
                                    <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNo") %>' ToolTip="Sub Account No"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left"  />
                            </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Debt Collector Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDebtCollectorCode" runat="server" Text='<%# Bind("DebtCollectorCode") %>' ToolTip="Debt Collector Code"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Category">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCategory" runat="server" Style="text-align: right" Text='<%# Bind("Category") %>' ToolTip="Category"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblgrandtotal" runat="server" ToolTip="Grand Total" Text="Grand Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Dues Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDuesDescription" runat="server" Text='<%# Bind("DueDescription") %>' ToolTip="Dues Description"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <%--   <asp:TemplateField HeaderText="Bill Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblBillDate" runat="server" style="text-align:right" Text='<%# Bind("BillDate") %>'></asp:Label>
                                </ItemTemplate>
                                  <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                 </asp:TemplateField>
                           <asp:TemplateField HeaderText="Value Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblValueDate" runat="server" style="text-align:right" Text='<%# Bind("ValueDate") %>'></asp:Label>
                                </ItemTemplate>
                                  <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                 </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Collection Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcollectionAmount" runat="server" Style="text-align: right" Text='<%# Bind("Collection") %>' ToolTip="Collection Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblcollectionAmountf" runat="server" ToolTip="Sum of Collection Amount"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Due Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDueAmount" runat="server" Style="text-align: right" Text='<%# Bind("DueAmount") %>' ToolTip="Due Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblDueamountf" runat="server" ToolTip="sum of Due Amount"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Ageing 0-30 Days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblageing0days" runat="server" Style="text-align: right" Text='<%# Bind("ageing0days") %>' ToolTip="Ageing0-30Days"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblageing0daysf" runat="server" ToolTip="sum of Ageing 0-30 Days"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Ageing 31-60 days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblageing30days" runat="server" Style="text-align: right" Text='<%# Bind("ageing30days") %>' ToolTip="Ageing31-60days"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblageing30daysf" runat="server" ToolTip="sum of Ageing 31-60 Days"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Ageing 61-90 days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblageing60days" runat="server" Style="text-align: right" Text='<%# Bind("ageing60days") %>' ToolTip="Ageing61-90days"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblageing60daysf" runat="server" ToolTip="sum of Ageing 61-90 Days"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Ageing >90 days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblageingabove90days" runat="server" Style="text-align: right" Text='<%# Bind("ageingabove90days") %>' ToolTip="Ageing>90days"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblageingabove90daysf" runat="server" ToolTip="sum of Ageing Above 90 Days"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                    type="button" accesskey="P">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>

            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="true" ValidationGroup="btnGo" />
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
