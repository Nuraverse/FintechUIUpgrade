<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptIncomeReport, App_Web_nmps0mjf" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Income Report">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <asp:Panel ID="pnlLOB" runat="server" CssClass="stylePanel" GroupingText="Line Of Business">
                                    <div style="height: 130px; display: block;">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="gvLoadLOB" runat="server" AutoGenerateColumns="false" Width="100%" OnRowDataBound="gvLoadLOB_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Line of Business">
                                                                <ItemTemplate>
                                                                    <asp:Label Text='<%#Eval("LOB_Name") %>' runat="server" ID="lblGvLob" />
                                                                    <asp:Label Text='<%#Eval("LOB_ID") %>' Visible="false" runat="server" ID="lblgvLOBID" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <asp:Label Text="Select" runat="server" ID="lblsel" />
                                                                    <br></br>
                                                                    <asp:CheckBox ID="chkSelectAll" ToolTip="Select All" runat="server" AutoPostBack="true" OnCheckedChanged="LOB_ChkChanged" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" ToolTip="Select" runat="server" AutoPostBack="true" OnCheckedChanged="LOB_ChkChanged" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation1" ToolTip="Location1" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLocation1_SelectedIndexChanged" runat="server" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label1" Text="Location1" CssClass="styleReqFieldLabel" runat="server" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation2" ToolTip="Location2" Enabled="false"
                                            OnSelectedIndexChanged="ddlLocation2_SelectedIndexChanged" AutoPostBack="true" runat="server"
                                            class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label2" Text="Location2" CssClass="styleReqFieldLabel" runat="server" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlReportType" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged" ToolTip="Report Type">
                                            <asp:ListItem Value="0" Text="--Select--" />
                                            <asp:ListItem Value="1" Text="Actual" />
                                            <asp:ListItem Value="2" Text="ForeCast" />
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                                InitialValue="0" ValidationGroup="btnGo" ErrorMessage="Select Report Type" ControlToValidate="ddlReportType"
                                                SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblRptType" Text="Report Type" CssClass="styleReqFieldLabel" runat="server" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">

                                        <asp:TextBox ID="txtCutoff" AutoPostBack="false" ToolTip="Cutoff Month" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgStartMonth" BehaviorID="calendar1"
                                            OnClientDateSelectionChanged="fnClearonCutoff" Format="MM/yyyy" TargetControlID="txtCutoff" OnClientShown="onCalendarShown">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvcutoffmonth" runat="server" ErrorMessage="Select cutoff month"
                                                ValidationGroup="btnGo" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtCutoff"
                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblcutoff" CssClass="styleReqFieldLabel" Text="Cut Off Month" runat="server" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDenomination" runat="server" OnSelectedIndexChanged="ddlDenomination_SelectedIndexChanged"
                                            AutoPostBack="true" ToolTip="Denomination" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAmtFin" CssClass="styleReqFieldLabel" Text="Denomination" runat="server" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlproduct" runat="server" ToolTip="Product" class="md-form-control form-control" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                InitialValue="0" ValidationGroup="btnGo" ErrorMessage="Select Product" ControlToValidate="ddlproduct"
                                                SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblprdt" CssClass="styleReqFieldLabel" Text="Product" runat="server" />
                                        </label>
                                    </div>
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

                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>

            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                    <%--<asp:Label ID="lblCurrency" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel runat="server" ID="pnlIncome" CssClass="stylePanel" GroupingText="Income Report"
                        Width="100%">
                        <div style="overflow: auto; height: 250px;" id="divDetails" runat="server">

                            <asp:Label ID="lblNoRecords" runat="server" Text="No Records Found" Visible="false" />
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="gvIncome" runat="server" AutoGenerateColumns="false"
                                            ShowFooter="true" Width="98%">
                                            <FooterStyle HorizontalAlign="Right" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Line Of Business">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLob" Text='<% #Eval("LOBName")%>' ToolTip="Line Of Business" runat="server" />
                                                        <asp:HiddenField ID="hdn_LOB_ID" runat="server" Value='<% #Eval("LOB_ID")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Method">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMethod" Text='<% #Eval("Method")%>' ToolTip="Method" runat="server" />
                                                        <asp:HiddenField ID="hdn_Method_Value" runat="server" Value='<% #Eval("DataRow1")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblprdtvalue" Text='<% #Eval("PRODUCTNAME")%>' ToolTip="Product" runat="server" />
                                                        <asp:HiddenField ID="hdn_prdtvalue" runat="server" Value='<% #Eval("Product")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <%-- <asp:TemplateField HeaderText="Period">
                             <ItemTemplate>
                                        <asp:Label ID="lblPeriod" Text='<% #Eval("Period")%>' ToolTip ="Period" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="14%" HorizontalAlign="Left" />
                                </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" Text='<% #Eval("LocationName1")%>' ToolTip="Location" runat="server" />
                                                        <asp:HiddenField ID="hdn_Location_ID1" runat="server" Value='<% #Eval("Location_ID1")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20%" HorizontalAlign="Left" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotDisplay" Text="Total" ToolTip="Total" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Finance Charges Month">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonth" Text='<% #Eval("Month")%>' ToolTip="Month Finance Charges" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotMonth" Text="" ToolTip="Total Month Finance Charges" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Finance Charges Year">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblYear" Text='<% #Eval("Year")%>' ToolTip="Year Finance Charges" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotYear" Text="" ToolTip="Total Year Finance Charges" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Future Finance Charges">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUMFC" Text='<% #Eval("DataRow2")%>' ToolTip="UMFC" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotUMFC" Text="" ToolTip="Total UMFC" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                            OnClick="FunProShow_AccountLevel" CommandName="Query" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="4%" HorizontalAlign="Center" />
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
                <button class="css_btn_enabled" id="Button1" onserverclick="btnPrint_Click" runat="server"
                    type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel runat="server" ID="pnlAccounts" CssClass="stylePanel" GroupingText="Account Level Income"
                        Visible="false" Width="100%">
                        <div style="overflow: auto; height: 250px;" id="div1" runat="server">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="false"
                                            ShowFooter="true" Width="100%">
                                            <FooterStyle HorizontalAlign="Right" />
                                            <Columns>

                                                <asp:TemplateField HeaderText="Line Of Business">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLob" Text='<% #Eval("LOB_Name")%>' ToolTip="Line Of Business" runat="server" />
                                                        <asp:HiddenField ID="hdn_LOB_ID" runat="server" Value='<% #Eval("LOB_ID")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Method">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMethod" Text='<% #Eval("Method")%>' ToolTip="Method" runat="server" />
                                                        <asp:HiddenField ID="hdn_Method_Value" runat="server" Value='<% #Eval("DataRow1")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <%-- <asp:TemplateField HeaderText="Period">
                             <ItemTemplate>
                                        <asp:Label ID="lblPeriod" Text='<% #Eval("Period")%>' ToolTip ="Period" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="14%" HorizontalAlign="Left" />
                                </asp:TemplateField>--%>

                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" Text='<% #Eval("LocationName")%>' ToolTip="Location" runat="server" />
                                                        <asp:HiddenField ID="hdn_Location_ID1" runat="server" Value='<% #Eval("Location_ID")%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblproduct" Text='<% #Eval("ProductName")%>' ToolTip="Product" runat="server" />

                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Left" />

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Account Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPANum" Text='<% #Eval("PRIMEACCOUNTNO")%>' ToolTip="Account Number" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Sub Account Number" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSANum" Text='<% #Eval("SUBACCOUNTNO")%>' ToolTip="Sub Account Number" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMaturityDate" Text='<% #Eval("DataRow2")%>' ToolTip="Customer Name" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Left" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotDisplay" Text="Total" ToolTip="Total" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Finance Charges Month">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonth" Text='<% #Eval("Month1")%>' ToolTip="Month Finance Charges" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotMonth" Text="" ToolTip="Total Month Finance Charges" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Finance Charges Year">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblYear" Text='<% #Eval("Year1")%>' ToolTip="Year Finance Charges" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="13%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotYear" Text="" ToolTip="Total Year Finance Charges" runat="server" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Future Finance Charges">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUMFC" Text='<% #Eval("UMFC1")%>' ToolTip="UMFC" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotUMFC" Text="" ToolTip="Total UMFC" runat="server" />
                                                    </FooterTemplate>

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
                <button class="css_btn_enabled" id="btnChart" onserverclick="btnChart_Click" runat="server"
                    type="button" causesvalidation="true" accesskey="C" title="Chart,Alt+C" visible="false">
                    <i class="fa fa-pie-chart" aria-hidden="true"></i>&emsp;<u>C</u>hart
                </button>
                <button class="css_btn_enabled" id="btnPrintDetails" onserverclick="btnPrintDetails_Click" runat="server"
                    type="button" causesvalidation="true" accesskey="D" title="Chart,Alt+D" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;Print<u>D</u>etails
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vgIncomeReport" runat="server" ValidationGroup="btnGo"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="true" />
                    <asp:CustomValidator ID="CVIncomeReport" runat="server" Display="None" ValidationGroup="btnGo"></asp:CustomValidator>
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
                        if (document.getElementById('divMenu').style.display == 'none') {
                            (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                        }
                        else {
                            (document.getElementById('ctl00_ContentPlaceHolder1_PnlDetails')).style.width = screen.width - 270;
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

                function checkDate_NextSystemDate1(sender, args) {
                    //    var today = new Date();
                    //    if (sender._selectedDate > today) {
                    //       
                    //        //alert('You cannot select a date greater than system date');
                    //        alert('Selected date cannot be greater than system date');
                    //        sender._textbox.set_Value(today.format(sender._format));

                    //    }
                    //    document.getElementById(sender._textbox._element.id).focus();

                    var pnlinc = document.getElementById('<%=pnlIncome.ClientID %>');
                     if (pnlinc != null)
                         pnlinc.style.display = "none";
                     //document.getElementById("pnlIncome").style.display="none";
                     alert('Grid Cleared');
                     //sender._textbox.set_Value(today.format(sender._format));

                 }


                 function fnClearonCutoff() {
                     //var gvinc=document .getElementById ('<%=gvIncome.ClientID %>');
                    var pnlinc = document.getElementById('<%=pnlIncome.ClientID %>');
                    var btnvc = document.getElementById('<%=btnChart.ClientID %>');
                    <%--var btnPri = document.getElementById('<%=btnPrint.ClientID %>');--%>
                    var lblamt = document.getElementById('<%=lblAmounts.ClientID %>');
                    var ddlDenom = document.getElementById('<%=ddlDenomination.ClientID %>');

                    if (pnlinc != null)
                        pnlinc.style.display = "none";
                    //         if(pnlinc !=null )
                    //            pnlinc.style.display="none";
                    if (btnvc != null)
                        btnvc.style.display = "none";
                    if (btnPri != null)
                        btnPri.style.display = "none";
                    if (lblamt != null)
                        lblamt.style.display = "none";
                }
            </script>
        </div>
    </div>
</asp:Content>










