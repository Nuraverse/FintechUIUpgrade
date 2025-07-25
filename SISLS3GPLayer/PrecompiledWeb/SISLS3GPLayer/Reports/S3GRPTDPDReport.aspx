<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRPTDPDReport, App_Web_dzryruu3" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Days Past Dues Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="PnlInputCriteria" runat="server" CssClass="stylePanel" Width="100%"
                                GroupingText="Input Criteria">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlheader" runat="server" GroupingText="Input Details">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                            class="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFVLOB" Enabled="true" CssClass="validation_msg_box_sapn"
                                                                runat="server" InitialValue="0" ControlToValidate="ddlLOB" ValidationGroup="vsDPD"
                                                                ErrorMessage="Select a Line of Business" Display="Dynamic">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlRegion" ToolTip="Branch" runat="server" AutoPostBack="True"
                                                            OnSelectedIndexChanged="DDRegion_SelectedIndexChanged"
                                                            class="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFVBranch" Enabled="true" CssClass="validation_msg_box_sapn"
                                                                runat="server" InitialValue="0" ControlToValidate="ddlRegion" ValidationGroup="vsDPD"
                                                                ErrorMessage="Select a Branch" Display="Dynamic">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblregion" runat="server" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="display: none;">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlBranch" runat="server" Enabled="false" ToolTip="Branch2" AutoPostBack="True"
                                                            class="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Branch2" ID="lblBranch" AutoPostBack="True"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="TxtCutOff" runat="server" ToolTip="Demand Month" ContentEditable="false"
                                                            Style="text-align: right" OnTextChanged="TxtCutOff_TextChanged" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="CalCutOff" runat="server" PopupButtonID="imgMonthYear"
                                                            BehaviorID="calendar1" Format="yyyyMM" TargetControlID="TxtCutOff" OnClientShown="onCalendarShown">
                                                        </cc1:CalendarExtender>
                                                        <cc1:FilteredTextBoxExtender ID="fltTxtCutOff" runat="server" ValidChars="" FilterType="Numbers"
                                                            TargetControlID="TxtCutOff">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:Image ID="imgMonthYear" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RqvTxtCutOff" Enabled="true" runat="server" ControlToValidate="TxtCutOff"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Demand Month"
                                                                ValidationGroup="vsDPD">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblcut" runat="server" CssClass="styleReqFieldLabel" Text="Demand Month"> </asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlDenomination" runat="server" ToolTip="Denomination"
                                                            OnSelectedIndexChanged="ddlDenomination_SelectedIndexChanged" AutoPostBack="true"
                                                            class="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFdeno" Enabled="true" CssClass="validation_msg_box_sapn"
                                                                runat="server" ControlToValidate="ddlDenomination" InitialValue="-1" ValidationGroup="vsDPD"
                                                                ErrorMessage="Select the Denomination" Display="Dynamic">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Denomination" ID="Lblden" CssClass="styleReqFieldLabel">
                                                            </asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlAccountStatus" runat="server" ToolTip="Account Status"
                                                            class="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Account Status" ID="LblAccountStatus">
                                                            </asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="display: none">
                                                    <div class="md-input">
                                                        <asp:RadioButtonList ID="Rdreport" runat="server" class="styleFieldLabel" ToolTip="Report Basis"
                                                            RepeatDirection="Horizontal" Visible="false">
                                                            <asp:ListItem Text="Asset Class" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Account Number" Value="1"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Report Basis" ID="LblReportType" CssClass="styleReqFieldLabel"
                                                                Visible="false">
                                                            </asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:CheckBox ID="ChkSubRep" runat="server" AutoPostBack="true"
                                                            OnCheckedChanged="ChkSubRep_CheckedChanged"></asp:CheckBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <asp:Label runat="server" Text="Include Subsequent Receipts" ID="lblSubRep">
                                                        </asp:Label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="TxtRcptDate" runat="server"
                                                            AutoPostBack="true" ToolTip="Receipt Date" OnTextChanged="TxtRcptDate_TextChanged"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender runat="server" TargetControlID="TxtRcptDate" ID="CalendarExtenderSD_TxtRcptDate"
                                                            Enabled="True" Format="dd/MM/yyyy" PopupButtonID="ImgRcpt">
                                                        </cc1:CalendarExtender>
                                                        <asp:Image ID="ImgRcpt" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RqvTxtRcptDate" Enabled="true" CssClass="validation_msg_box_sapn"
                                                                runat="server" ControlToValidate="TxtRcptDate" ValidationGroup="vsDPD" ErrorMessage="Enter the Receipt Date"
                                                                Display="Dynamic">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="LblRcptDate" runat="server" Text="Receipt Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlDPDParamDetails" runat="server" CssClass="stylePanel" GroupingText="DPD Parameter Setup"
                                            Width="100%">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView ID="GRVbucket" runat="server" AutoGenerateColumns="False" ToolTip="DPD Parameter Setup"
                                                            Width="100%">
                                                            <Columns>
                                                                <%--buckets--%>
                                                                <asp:TemplateField HeaderText="Buckets" ItemStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblbucket" runat="server" Text='<%# Bind("Bucket")  %>' Width="30px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle  HorizontalAlign="Right" Width="30px"/>
                                                                </asp:TemplateField>
                                                                <%--From Days--%>
                                                                <asp:TemplateField HeaderText="From(Days)" ItemStyle-Width="150px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblFromDays" runat="server" MaxLength="3" Text='<%# Bind("Bucket_From")%>'
                                                                            Width="150px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="150px" />
                                                                </asp:TemplateField>
                                                                <%--To days--%>
                                                                <asp:TemplateField HeaderText="To(Days)" ItemStyle-Width="90px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblToDays" runat="server" MaxLength="3" Text='<%# Bind("Bucket_To")%>'
                                                                            Width="150px"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="90px" />
                                                                </asp:TemplateField>
                                                                <%--Select NO OF DAYS CHKBOX--%>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkAll" runat="server"
                                                                            Text="Select All" ToolTip="Select All" AutoPostBack="true" TextAlign="Right" OnCheckedChanged="chkAll_CheckedChanged" />
                                                                    </HeaderTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="ChkSelect" runat="server" ToolTip="Select" AutoPostBack="true" OnCheckedChanged="ChkSelect_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="90px" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div align="right">
                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vsDPD" runat="server"
                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>
                                    <button class="css_btn_enabled" id="btnReset" onserverclick="btnReset_Click" runat="server"
                                        type="button" causesvalidation="true" accesskey="R" title="Reset,Alt+R">
                                        <i class="fa fa-recycle" aria-hidden="true"></i>&emsp;<u>R</u>eset
                                    </button>
                                </div>


                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td class="styleFieldAlign">
                                                    <asp:ValidationSummary ID="vsDPDRep" runat="server" CssClass="styleMandatoryLabel" Enabled="false"
                                                        CausesValidation="true" HeaderText="Correct the following validation(s):" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldAlign">
                                                    <asp:CustomValidator ID="CVDPD" runat="server" Display="None" ValidationGroup="btnGo"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <%--   </ContentTemplate>
                </asp:UpdatePanel>--%>
                    <asp:Panel ID="PnlAsstDPDReport" runat="server" CssClass="stylePanel" GroupingText="Asset Class Details">
                        <asp:GridView ID="GrvAsstDPDReport" runat="server" AutoGenerateColumns="False" ToolTip="DPD Report Details">
                            <Columns>
                                <asp:TemplateField HeaderText="Asset Class Types">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnkAssetClass" runat="server" Text='<%# Eval("CATEGORY_DESCRIPTION") %>'
                                            CommandArgument='<%# Eval("ASSET_CATEGORY_ID") %>' OnClick="LnkAssetClass_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                    <AlternatingItemTemplate>
                                        <asp:LinkButton ID="LnkAssetClass" runat="server" Text='<%# Eval("CATEGORY_DESCRIPTION") %>'
                                            CommandArgument='<%# Eval("ASSET_CATEGORY_ID") %>' OnClick="LnkAssetClass_Click"></asp:LinkButton>
                                    </AlternatingItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <asp:Panel ID="PnlAccDPDReport" runat="server" CssClass="stylePanel" GroupingText="DPD Report Details" ToolTip="DPD Report Details"
                        HorizontalAlign="Center" ScrollBars="Auto">
                        <div>
                            <div class="row">
                                <asp:Label runat="server" ID="LblDenomination" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divdpd" runat="server" style="height: auto; width: 100%; overflow-x: auto; overflow-y: auto;">
                                            <asp:GridView ID="GrvAccDPDReport" runat="server" ToolTip="DPD Report Details" AllowPaging="true" OnRowDataBound="GrvAccDPDReport_RowDataBound"
                                                OnPageIndexChanging="GrvAccDPDReport_PageIndexChanging" PageSize="100">
                                                <%-- <HeaderStyle CssClass="FrozenHeader" />--%>
                                                <%-- <RowStyle HorizontalAlign="Right" />--%>
                                            </asp:GridView>
                                        </div>
                                        <asp:HiddenField ID="HdnValue" runat="server" />
                                        <asp:Label ID="lblEmptyMessege" Visible="false" runat="server"></asp:Label></td>
                                    </div>
                                </div>
                            </div>
                            <%-- <tr>
                                    <td>
                                        <div id="dvPostCAPFL"  runat="server" style="overflow: scroll; height:400px;">
                                            <table class='styleGridHeader' bordercolor='#77B6E9' cellpadding='1' cellspacing='0' border='1'>
                                                <tr id="trcompanyName" runat="server">
                                                    <td align="center" style="font-weight: bold;">
                                                        <asp:Label ID="lblCompanyName" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr id="trlblDesc" runat="server">
                                                    <td align="center" style="font-weight: bold;">
                                                        <asp:Label ID="lblDesc" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr id="trlblDeno" runat="server">
                                                    <td align="right" style="font-weight: bold;">
                                                        <asp:Label ID="lblDeno" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                    
                                                        <asp:GridView ID="GrvAccDPDReport" runat="server" ToolTip="DPD Report Details">
                                                        </asp:GridView>
                                                  
                                                        <asp:Label ID="lblEmptyMessege" Visible="false" runat="server"></asp:Label></td>
                                                    </td>
                                                </tr>--%>
                        </div>
                        <div align="right">

                            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                <ContentTemplate>
                                    <%--              <button class="css_btn_enabled" id="btnExcel" title="Export to Excel[Alt+X]" causesvalidation="false" onclick="ExportDivDataToExcel()"
                                        onserverclick="btnExcel_Click" runat="server"
                                        type="button" accesskey="X">
                                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;E<u>x</u>cel
                                    </button>--%>
                                    <div align="right">


                                        <button class="css_btn_enabled" id="btnExcel" title="Export to Excel[Alt+A]" causesvalidation="false" onclick="ExportDivDataToExcel();"
                                            onserverclick="btnExcel_Click" runat="server"
                                            type="button" accesskey="A">
                                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;E<u>x</u>cel
                                        </button>

                                        <%-- <asp:Button ID="btnExcel" runat="server" CausesValidation="true" CssClass="css_btn_enabled" ToolTip="Excel,Alt+A" AccessKey="A"
                                            Text="Excel" ValidationGroup="Excel" OnClick="btnExcel_Click" OnClientClick="ExportDivDataToExcel()" />--%>
                                        <%--OnClientClick="return fnCheckPageValidators('Excel',false)"--%>
                                        <asp:Button ID="btnPDF" runat="server" Visible="false" CausesValidation="true" CssClass="styleSubmitButton"
                                            Text="PDF" OnClientClick="return fnCheckPageValidators('Excel',false)"
                                            OnClick="btnPDF_Click" />
                                        <%--<i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel--%>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnExcel" />
                                    <asp:PostBackTrigger ControlID="btnPDF" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <%--<asp:Button ID="btnPrintExcel" runat="server"  Text="Export to Excel"
                        OnClick="btnPrintExcel_Click" Visible ="false" />--%>
                    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--<input type="hidden" runat="server" id="HTxtMonths" name="HTxtMonths" />--%>

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

        function ExportDivDataToExcel() {
            myDivObj = document.getElementById("ctl00_ContentPlaceHolder1_divdpd");
            myhidden = document.getElementById("ctl00_ContentPlaceHolder1_HdnValue");
            var html = myDivObj.innerHTML;
            //html = $.trim(html);
            //html = html.replace(/>/g, '&gt;');
            //html = html.replace(/</g, '&lt;');
            myhidden.value = html;
        }

    </script>

</asp:Content>
