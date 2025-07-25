<%@ page language="C#" masterpagefile="~/Common/MasterPage.master" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_FARptTrialBalance, App_Web_ygb51gin" title="Trial Balance Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">

                                <asp:Label runat="server" Text="Trial Balance Report" ID="lblHeading" CssClass="styleDisplayLabel">
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
                                            <cc1:ComboBox ID="ddlActivity" runat="server" Width="145px" ToolTip="Activity" CssClass="WindowsStyle"
                                                DropDownStyle="DropDownList" AutoPostBack="true" AppendDataBoundItems="true"
                                                CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" ValidationGroup="btnGo"
                                                    runat="server" ControlToValidate="ddlActivity" SetFocusOnError="True" ErrorMessage="Select Activity"
                                                    InitialValue="--Select--" Display="Dynamic" CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" Width="145px" ToolTip="Location" OnTextChanged="ddlLocation_OnTextChanged"
                                                CssClass="WindowsStyle" DropDownStyle="DropDownList" AutoPostBack="true" AppendDataBoundItems="true"
                                                CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="btnGo"
                                                    runat="server" ControlToValidate="ddlLocation" SetFocusOnError="True" ErrorMessage="Select Branch"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="--Select--">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFrmMonthyr" runat="server" OnTextChanged="txtFrmMonthyr_OnTextChanged"
                                                AutoPostBack="true" ToolTip="From Month/Year" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="txtFrmMonthyr"
                                                BehaviorID="calendar1" Format="yyyyMM" TargetControlID="txtFrmMonthyr" OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="From Month/Year" ID="lblFrmMonth" CssClass="styleReqFieldLabel"
                                                    ToolTip="From Month/Year">
                                                </asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFrmMonthyr" runat="server" ErrorMessage="Select From Month/Year."
                                                    ValidationGroup="btnGo" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ControlToValidate="txtFrmMonthyr">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtToMonthyr" runat="server" AutoPostBack="true" OnTextChanged="txtToMonthyr_OnTextChanged"
                                                ToolTip="To Month/Year" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="calendar2"
                                                Format="yyyyMM" TargetControlID="txtToMonthyr" PopupButtonID="txtToMonthyr" OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEndMonth" runat="server" Text="To Month/Year" CssClass="styleDisplayLabel"
                                                    ToolTip="To Month/Year">
                                                </asp:Label>
                                            </label>
                                        </div>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvToMonthyr" runat="server" ErrorMessage="Select To Month/Year."
                                                ValidationGroup="btnGo" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ControlToValidate="txtToMonthyr">
                                            </asp:RequiredFieldValidator>
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
                        <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                            type="button" accesskey="L" title="Clear[Alt+L]" onserverclick="btnClear_Click">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server"
                            type="button" causesvalidation="true" accesskey="X" title="Exit,Alt+X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <button class="css_btn_enabled" id="btnExcel0" onserverclick="btnExcel0_Click" runat="server" visible="false"
                            type="button" causesvalidation="true" accesskey="E" title="Excel,Alt+Shift+E">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>
                        <button class="css_btn_enabled" id="BtnPrint" onserverclick="BtnPrint_Click" runat="server" visible="false"
                            type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>


                    <asp:Panel ID="pnlTrialbaldet" runat="server" CssClass="stylePanel" Visible="false"
                        GroupingText="Trial Balance Details" Width="100%">
                        <div id="divTrialbaldet" runat="server" style="overflow-x: hidden; overflow-y: auto; height: 200px; display: none; width: 100%">
                            <asp:GridView ID="grvTrialbaldet" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                Width="100%" ShowFooter="true" ShowHeader="true" OnRowDataBound="grvTrialbaldet_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Account Description">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkButton" Font-Underline="false" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Account_Description")  %>' OnClick="lnkAccount_Click" Visible="true"></asp:LinkButton>
                                            <asp:Label ID="lblbtn" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Account_Description")  %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="25%" HorizontalAlign="left" />
                                        <FooterTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="GL_CODE" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCod" runat="server" Text='<%# Bind("GL_CODE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Budget">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Dues"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        <FooterTemplate>
                                            <asp:Label ID="lblAmtbudget" runat="server" Text="" />
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Debit">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDues" runat="server" Text='<%# Bind("Debit1") %>' ToolTip="Dues"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        <FooterTemplate>
                                            <asp:Label ID="lblAmtDebit" runat="server" Text='<%#Eval("TotalDebit") %>' />
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("Credit1") %>' ToolTip="Receipts"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="12%" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterTemplate>
                                            <asp:Label ID="lblAmtCredit" runat="server" Text='<%#Eval("TotalCredit") %>' />
                                        </FooterTemplate>
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>

                    <asp:CustomValidator ID="cvTrialBal" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" />
                    <table width="100%">
                        <tr>
                            <td>
                                <a runat="server" id="lnkButton" visible="false" href="#">link</a>
                                <cc1:AnimationExtender ID="AnimationExtender2" runat="server" TargetControlID="btnModal">
                                </cc1:AnimationExtender>
                                <asp:Panel ID="PnlApprover" runat="server"
                                    Visible="false" BackColor="AliceBlue" Width="100%">
                                    <cc1:PopupControlExtender ID="PopupControlExtenderApprover" runat="server" TargetControlID="lnkButton" Position="Top" OffsetX="-100" OffsetY="-200" PopupControlID="PnlApprover"></cc1:PopupControlExtender>
                                    <cc1:DragPanelExtender ID="dre" runat="server" TargetControlID="PnlApprover" Enabled="true"></cc1:DragPanelExtender>
                                    <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                                    <div id="divTransaction" visible="true" class="Container" runat="server" style="height: 200px; overflow: scroll">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="gtView" Width="100%" runat="server" AutoGenerateColumns="false"
                                                        ShowFooter="false">

                                                        <Columns>

                                                            <asp:TemplateField HeaderText="Location">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblView" runat="server" Text='<%# Bind("LocationCat_Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="GL_CODE">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoc" runat="server" Text='<%# Bind("GL_CODE") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <%--   <asp:TemplateField HeaderText="SL_CODE">
                                                    <ItemTemplate>
                                                    <asp:Label ID="lblCode" runat="server" Text='<%# Bind("SL_CODE") %>'>
                                                    </asp:Label>
                                                    </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="Document Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDocDate" runat="server" Text='<%# Bind("Document_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="DOCNO">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldoc1" runat="server" Text='<%# Bind("Document_No") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Debit">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDebit" runat="server" Text='<%# Bind("Debit") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Credit">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCredit" runat="server" Text='<%# Bind("Credit") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div align="right">
                                    <button class="css_btn_enabled" id="btnExcel" runat="server" onserverclick="btnExcel_ServerClick"
                                        type="button" causesvalidation="false" accesskey="E" title="Excel,Alt+E" visible="false">
                                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                                    </button>
                                    <button class="css_btn_enabled" id="btClose" runat="server" visible="false"
                                        type="button" accesskey="C" title="Close,Alt+C">
                                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>lose
                                    </button>
                                    <%--onserverclick="btnCLose_Click"--%>
                                    <asp:Button ID="btnModal" Style="display: none" runat="server" />
                                    <asp:Button ID="btnDrop" Style="display: none" runat="server" />
                                </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel0" />
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
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
    <script type="text/javascript">
        function EnabledParent() {
            window.opener.document.body.disabled = true;
        }
    </script>
    <%--</head>--%>

    <%--<html>
<body>


<div>
         <input id="txtParent" type="text" />
        <input id="Button1" type="button" value="Open PopUp"  onclick = "popUp('FA_RPT_TrialBalance.aspx')" /><br />
        <input id="Button2" type="button" value="Call Child Function" onclick = "callChildFunc()" /><br />
        <input id="Button4" type="button" value="Get Child Control" onclick = "getChildControl()" /><br />
        <input id="Button3" type="button" value="Refresh Child" onclick = "refreshChild()" /><br />
    </div>
</body>
</html>--%>
</asp:Content>
