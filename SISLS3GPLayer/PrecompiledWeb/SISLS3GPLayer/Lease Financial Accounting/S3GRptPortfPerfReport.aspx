<%@ page title="Porfolio Performance Report" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptPortfPerfReport, App_Web_523fo0sd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Portfolio Performance Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel runat="server" ID="PnlHeaderDetails" CssClass="stylePanel" GroupingText="Input Criteria"
                                Width="100%">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server"
                                                OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" AutoPostBack="True"
                                                ToolTip="Line of Business" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" Display="Dynamic" ControlToValidate="ddlLOB"
                                                    InitialValue="-1" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select Line Of Business"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel" ToolTip="Line of Business"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlRegion" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                                OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" ToolTip="Location1" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblregion" runat="server" Text="Location1" CssClass="styleDisplayLabel" ToolTip="Location1"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlbranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlbranch_SelectedIndexChanged"
                                                ValidationGroup="Header" ToolTip="Location2" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblbranch" runat="server" Text="Location2" CssClass="styleDisplayLabel" ToolTip="Location2"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlfilterBy" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlfilterBy_SelectedIndexChanged" ValidationGroup="Header"
                                                ToolTip="Location2" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvfilterBy" runat="server" Display="Dynamic" ControlToValidate="ddlfilterBy"
                                                    InitialValue="0" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select Filter By"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblfilterby" CssClass="styleReqFieldLabel" Text="Filter By"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDenomination" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlDenomination_SelectedIndexChanged"
                                                ValidationGroup="Header" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDenomination" runat="server" CssClass="styleDisplayLabel" Text="Denomination"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCutoffMonthSearch" runat="server" OnTextChanged="txtCutoffMonthSearch_OnTextChanged" AutoPostBack="true"
                                                ToolTip="Cut Off Month" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgStartMonth" BehaviorID="calendar1" Format="yyyyMM" TargetControlID="txtCutoffMonthSearch" OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgStartMonth" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvcutoffmonth" runat="server"
                                                    ErrorMessage="Select Cutoff Month" ValidationGroup="btnGo"
                                                    Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                    ControlToValidate="txtCutoffMonthSearch"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCutOffMonth" runat="server" CssClass="styleDisplayLabel" Text="Cutoff Month" ToolTip="Cut Off Month" />
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
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="imgExcel" onserverclick="btnExport_Click" runat="server"
                            type="button" causesvalidation="true" accesskey="E" title="Excel,Alt+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblAmounts" runat="server" Text="" Visible="false" />
                            <asp:HiddenField ID="hdn1" runat="server" />
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="HiddenField2" runat="server" />
                            <asp:HiddenField ID="hdnoption" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel runat="server" ID="pnlpayment" CssClass="stylePanel" GroupingText="Business Information"
                                Width="100%">
                                <div id="divmainnn" runat="server" style="overflow: auto; height: 200px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvpayment" runat="server" AutoGenerateColumns="False" ShowHeader="false" OnRowDataBound="grvpayment_RowDataBound" OnRowCreated="grvpayment_RowCreated"
                                                    BorderWidth="2" Width="100%" ShowFooter="true">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Right" Visible="false" FooterStyle-Font-Bold="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOB_ID" runat="server" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Right" Visible="false" FooterStyle-Font-Bold="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOCATION_ID" runat="server" Text='<%#Eval("LOCATION_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Right" Visible="false" FooterStyle-Font-Bold="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPRODUCT_ID" runat="server" Text='<%#Eval("PRODUCT_ID")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbranch" runat="server" Text='<%#Eval("Location_NAME")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFilter_Name" runat="server" Text='<%#Eval("Filter_Name")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFooterFilter_Name" runat="server" class="styleGridHeader" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName1" Text="Payment" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPAYMENT_1" runat="server" Text='<%#Eval("PAYMENT_ONE")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot1" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName2" Text="Collection" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCOLLECTION_1" runat="server" Text='<%#Eval("COLLECTION_ONE")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot2" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName3" Text="Payment" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPAYMENT_2" runat="server" Text='<%#Eval("PAYMENT_TWO")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot3" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName4" Text="Collection" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("COLLECTION_TWO")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot4" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName5" Text="Payment" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2s" runat="server" Text='<%#Eval("PAYMENT_TH")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot5" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName6" Text="Collection" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("COLLECTION_TH")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot6" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName7" Text="Payment" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCurMthDue1" runat="server" Text='<%#Eval("PAYMENT_FR")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot7" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName8" Text="Collection" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCurMthDue" runat="server" Text='<%#Eval("COLLECTION_FR")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot8" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName9" Text="Payment" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrevMth1Due1" runat="server" Text='<%#Eval("PAYMENT_FV")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot9" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName10" Text="Collection" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrevMth1Due" runat="server" Text='<%#Eval("COLLECTION_FV")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot10" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName11" Text="Payment" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrevMth2Due1" runat="server" Text='<%#Eval("PAYMENT_SIX")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot11" runat="server" class="styleGridHeader"></asp:Label>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" FooterStyle-Font-Bold="true">
                                                            <%--<HeaderTemplate>
                                                <asp:Label ID="lblGoldName12" Text="Collection" runat="server" class="styleGridHeader"></asp:Label>
                                            </HeaderTemplate>--%>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrevMth2Due" runat="server" Text='<%#Eval("COLLECTION_SIX")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFootTot12" runat="server" class="styleGridHeader"></asp:Label>
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
                        <button class="css_btn_enabled" id="btnExport" onserverclick="btnExport_Click" runat="server"
                            type="button" causesvalidation="true" accesskey="E" title="Excel,Alt+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsBranch" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                                ShowSummary="true" ValidationGroup="btnGo" />
                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="imgExcel" />
        </Triggers>
    </asp:UpdatePanel>
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
            if (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount') != null) {
                if (document.getElementById('divMenu').style.display == 'none') {
                    (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                }
                else {
                    (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount')).style.width = screen.width - 270;
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

                if (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount')).style.width = screen.width - 270;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                if (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
        }

        function NewWindow() {
            window.open('../Reports/S3GRptBranchPerformanceReport.aspx', 'newwindow', 'toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');
        }

    </script>
</asp:Content>

