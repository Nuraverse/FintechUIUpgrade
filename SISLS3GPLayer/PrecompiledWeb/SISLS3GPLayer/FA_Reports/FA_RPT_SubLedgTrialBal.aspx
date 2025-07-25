<%@ page title="Sub Ledger Trial Balance Report" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_SubLedgTrialBal, App_Web_ygb51gin" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Trial Balance(Group) Report" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                                <div class="row">
                                    <%--<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label ID="lblPeriod" runat="server" Text="Period:(Year/Month)"></asp:Label>
                                        </div>
                                    </div>--%>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlActivity" runat="server" Width="145px" ToolTip="Activity" CssClass="WindowsStyle"
                                                DropDownStyle="DropDownList" AppendDataBoundItems="true"
                                                CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" ToolTip="Branch"
                                                CssClass="WindowsStyle" DropDownStyle="DropDownList" AppendDataBoundItems="true"
                                                CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlLocation" SetFocusOnError="True" ErrorMessage="Select Location"
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
                                            <asp:TextBox ID="txtFrmMonthyr" runat="server"
                                                ToolTip="From Month/Year"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="txtFrmMonthyr"
                                                BehaviorID="calendar1" Format="yyyyMM" TargetControlID="txtFrmMonthyr" OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFrmMonthyr" runat="server" ErrorMessage="Select From Month/Year."
                                                    ValidationGroup="btnGo" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtFrmMonthyr"
                                                    CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="From" ID="lblFrmMonth" CssClass="styleReqFieldLabel"
                                                    ToolTip="From Month/Year">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtToMonthyr" runat="server"
                                                ToolTip="To Month/Year"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="calendar2"
                                                Format="yyyyMM" TargetControlID="txtToMonthyr" PopupButtonID="txtToMonthyr" OnClientShown="onCalendarShown">
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
                                                <asp:Label ID="lblEndMonth" runat="server" Text="To" CssClass="styleDisplayLabel"
                                                    ToolTip="To Month/Year">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                     <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkGrouP" runat="server" ToolTip="Remarks" AutoPostBack="true" />
                                            <asp:Label runat="server" ID="lblremarks" Text="Group Wise" />
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
                        <button class="css_btn_enabled" id="BtnExcel" onserverclick="BtnExcel_Click" validationgroup="btnGo" runat="server"
                            type="button" causesvalidation="true" accesskey="E" title="Excel,Alt+Shift+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" onserverclick="btnCancel_ServerClick" causesvalidation="false" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlsubledg" GroupingText="Trial Balance(Group)" CssClass="stylePanel" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                      <div class="Grid">
                                            <asp:GridView ID="gvParentGrid" runat="server" DataKeyNames="Gl_code" Width="100%"
                                                AutoGenerateColumns="false" OnRowDataBound="gvParentGrid_RowDataBound" OnRowCreated="gvParentGrid_RowCreated"
                                                FooterStyle-HorizontalAlign="Right" ShowFooter="true" HeaderStyle-CssClass="styleGridHeader">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="Add" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%--   <a href="JavaScript:divexpandcollapse('div<%# Eval("Gl_code")%>');" onclick="imgdiv_click">

                                                                    <img id='imgdiv<%# Eval("Gl_code")%>' alt="Add"  width="15px" onclick="imgdiv_click" border="0" src="../Images/plus.png" />
                                                                </a>--%>
                                                            <asp:ImageButton ID="imgexpand" ToolTip="Upload Files" runat="server" Width="25px" Height="28px" OnClick="imgdiv_click" ImageUrl="~/Images/plus.png" />
                                                            <asp:ImageButton ID="imgcollapse" ToolTip="Upload Files" runat="server" Width="25px" Height="28px" OnClick="ImageButton1_Click" Visible="false" ImageUrl="~/Images/minus.png" />
                                                            <%-- <asp:ImageButton id='img1'   width="15px" onclick="imgdiv_click" src="../Images/plus.png" />--%>
                                                            <asp:Label runat="server" Text='<%#Eval("Gl_code")%>' ID="lblgl_code" ToolTip="GL_Code" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                   
                                                    <asp:BoundField DataField="GL_code" HeaderText="GL Code" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" ItemStyle-Width="20%" />
                                                     <asp:BoundField DataField="GROUP_NAME" HeaderText="Group Name" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" ItemStyle-Width="20%" />
                                                    <asp:BoundField DataField="Gl_Desc" HeaderText="Gl Description" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" ItemStyle-Width="20%" />
                                                    <asp:BoundField DataField="OP_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="OP_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="TR_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="TR_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="CL_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="CL_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td colspan="100%">
                                                                    <asp:HiddenField ID="hdnfld" Value="0" runat="server" />
                                                                    <div id='div<%# Eval("Gl_code") %>' style="display: block; position: relative; left: 15px; overflow: auto">
                                                                        <asp:GridView ID="gvChildGrid" runat="server" AutoGenerateColumns="false"
                                                                            OnRowDataBound="gvChildGrid_RowDataBound" ShowHeader="true" Width="100%">

                                                                            <Columns>
                                                                                 <asp:BoundField DataField="Location" HeaderText="Branch" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="10%" ItemStyle-Width="20%" />
                                                                                 <asp:BoundField DataField="Activity" HeaderText="Activity" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="10%" ItemStyle-Width="20%" />
                                                                                <asp:BoundField DataField="SL_Code" HeaderText="SL Code" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="15%" ItemStyle-Width="20%" />
                                                                                <asp:BoundField DataField="SL_Desc" HeaderText="SL Desc" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
                                                                                <asp:BoundField DataField="OP_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="OP_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="TR_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="TR_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="CL_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Right"  ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                                                <asp:BoundField DataField="CL_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />

                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>


                            </asp:Panel>
                        </div>
                    </div>

                      <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlGroup" GroupingText="Trial Balance(Group)" CssClass="stylePanel" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvGroup" runat="server" DataKeyNames="GROUP_NAME" Width="100%"
                                                AutoGenerateColumns="false" OnRowDataBound="grvGroup_RowDataBound" OnRowCreated="grvGroup_RowCreated"
                                                FooterStyle-HorizontalAlign="Right" ShowFooter="true" HeaderStyle-CssClass="styleGridHeader">

                                                <Columns>
                                                 
                                                  
                                                     <asp:BoundField DataField="GROUP_NAME" HeaderText="Group Name" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
                                                   
                                                    <asp:BoundField DataField="OP_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" ItemStyle-Width="15%" />
                                                    <asp:BoundField DataField="OP_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" ItemStyle-Width="15%" />
                                                    <asp:BoundField DataField="TR_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="TR_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
                                                    <asp:BoundField DataField="CL_DBT_AMT" HeaderText="Debit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" ItemStyle-Width="15%" />
                                                    <asp:BoundField DataField="CL_CRD_AMT" HeaderText="Credit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" ItemStyle-Width="15%" />

                                                

                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>


                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="VSsubledg" runat="server" CssClass="styleMandatoryLabel"
                                CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="btnGo" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="CVsubledg" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <%--   <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .Grid td
        {
            background-color: #A1DCF2;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .Grid th
        {
            background-color: #3AC0F2;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid td
        {
            background-color: #eee !important;
            color: black;
            font-size: 10pt;
            line-height:200%
        }
        .ChildGrid th
        {
            background-color: #6C6C6C !important;
            color: White;
            font-size: 10pt;
            line-height:200%
        }
    </style>--%>
    <script type="text/javascript">

        var cal1;
        var cal2;

        function pageLoad() {
            cal1 = $find("calendar1");
            cal2 = $find("calendar2");

            modifyCalDelegates(cal1);
            modifyCalDelegates(cal2);
        }

        function divexpandcollapse(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);
            if (div.style.display == "none") {
                div.style.display = "inline-block";
                img.src = "../Images/minus.png";
            } else {
                div.style.display = "none";
                img.src = "../Images/plus.png";
            }
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
    </script>

</asp:Content>

