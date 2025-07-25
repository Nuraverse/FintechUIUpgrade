<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdCompensation, App_Web_razugfam" title="Compensation Calculation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Bill Generation" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel1" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0" Enabled="true" ErrorMessage="Select a Line of Business"
                                                ValidationGroup="Go"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFrequency" runat="server"
                                            onchange="AssignStartEndDate()"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFrequency" runat="server" ControlToValidate="ddlFrequency"
                                                Display="Dynamic" CssClass="validation_msg_box_sapn" InitialValue="0" Enabled="true" ErrorMessage="Select a Frequency"
                                                ValidationGroup="Go"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFrequency" runat="server" CssClass="styleReqFieldLabel" Text="Frequency"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMonthYear" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="calMonthYear" Format="MMM-yyyy" TodaysDateFormat="MMM-yyyy"
                                            OnClientDateSelectionChanged="AssignStartEndDate" OnClientShown="onShown" OnClientHidden="onHidden"
                                            runat="server" DefaultView="Months" Enabled="True" TargetControlID="txtMonthYear"
                                            PopupButtonID="imgMonthYear">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="imgMonthYear" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMonthYear" runat="server" CssClass="styleReqFieldLabel" Text="Month/Year"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDate" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="calStartDate" runat="server" TargetControlID="txtStartDate"
                                            PopupButtonID="imgStartDate" Enabled="false">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                                                Display="Dynamic" Enabled="true" ErrorMessage="Select a Start Date" ValidationGroup="Go" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDate" runat="server" CssClass="styleReqFieldLabel" Text="Start Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDate" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="calEndDate" runat="server" TargetControlID="txtEndDate"
                                            PopupButtonID="imgEndDate" Enabled="false">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="imgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                                                Display="Dynamic" Enabled="true" ErrorMessage="Select a End Date" ValidationGroup="Go"
                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>

                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEndDate" runat="server" CssClass="styleReqFieldLabel" Text="End Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnGo1" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="panSchedule" runat="server" GroupingText="Schedule Details" CssClass="stylePanel"
                            Width="99%" Visible="false">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButtonList ID="rbtnSchedule" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                            RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnSchedule_SelectedIndexChanged"
                                            CssClass="md-form-control form-control radio">
                                            <asp:ListItem Text="Schedule Now" Value="1"></asp:ListItem>
                                            <asp:ListItem Selected="True" Text="Schedule At :" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <label class="tess">
                                            <asp:Label ID="lblScheduleDate" runat="server" CssClass="styleReqFieldLabel" Text="Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtScheduleDate" runat="server" lass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="calScheduleDate" runat="server" Enabled="True" TargetControlID="txtScheduleDate"
                                            PopupButtonID="imgScheduleDate">
                                        </cc1:CalendarExtender>
                                        <asp:Image ID="imgScheduleDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblScheduleTime" runat="server" CssClass="styleReqFieldLabel" Text="Time (HH:MM AM)"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtScheduleTime" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="REVScheduleTime" ValidationGroup="Go" runat="server"
                                            ErrorMessage="Schedule Time Should be HH:MM AM Fomat(12 Hours)" ControlToValidate="txtScheduleTime"
                                            SetFocusOnError="True" ValidationExpression="^([0]?[1-9]|1[0-2])(:)[0-5][0-9]((:)[0-5][0-9])?( )?(AM|am|aM|Am|PM|pm|pM|Pm)$"></asp:RegularExpressionValidator>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel" Text="Time (HH:MM AM)"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                </button>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <asp:Panel runat="server" ID="pnlBranch" CssClass="stylePanel" GroupingText="Location Details"
                    Width="99%" Visible="false">
                    <br />
                    <div id="div1" style="overflow: auto; width: 100%; padding-left: 0%;" runat="server"
                        border="1">
                        <asp:GridView ID="gvBranchWise" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                            EmptyDataText="No Location Found for Compensation Charge calculation !...." Width="100%" OnRowDataBound="gvBranchWise_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" HeaderStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkSelectAllBranch" runat="server" onclick="javascript:fnSelectAll(this,'chkSelectBranch');" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelectBranch" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchId" runat="server" Text='<%#Bind("Location_Id") %>'></asp:Label>
                                        <asp:Label ID="lblLastFinMonth" runat="server" Text='<%#Bind("LastFinMonth") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Location" HeaderText="Location" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="30%" />
                                <asp:BoundField DataField="CC_Doc_Number" HeaderText="CC Document No." ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="AccountCount" HeaderText="Number of Accounts" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="CCAmount" HeaderText="Compensation Charge" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="20%" />
                                <%--<asp:BoundField DataField="JVReference" HeaderText="System JV Reference" />--%>
                                <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="30%">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRemarks" runat="server" Text='<%#Bind("Remarks") %>' MaxLength="100" Width="200px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="styleGridHeader" />
                            <RowStyle HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>

                </asp:Panel>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_OnClick" runat="server"
                        type="button" accesskey="S" causesvalidation="true" title="Save [Alt+S]" enabled="false" validationgroup="btnSave">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_OnClick" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                        type="button" causesvalidation="false" accesskey="G" title="Generate PDF,Alt+P">
                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>G</u>enerate PDF
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvBilling" runat="server" CssClass="styleMandatoryLabel"
                            Display="None" ValidationGroup="Submit"></asp:CustomValidator>
                        <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Go" HeaderText="Please correct the following validation(s):" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" src="../Scripts/jsBilling.js" type="text/javascript">
    </script>

    <script language="javascript" type="text/javascript">

        function AssignStartEndDate() {
            //debugger;
            var varFrequency = document.getElementById('ctl00_ContentPlaceHolder1_ddlFrequency');
            if (varFrequency.value == "4") {
                var varMonthYear = document.getElementById('ctl00_ContentPlaceHolder1_txtMonthYear').value;
                var varDateFormat = Date.parseInvariant(varMonthYear, "MMM-yyyy");

                var varGPSFormat = '<%=strDateFormat %>';
                var varStartDate = new Date(varDateFormat.getFullYear(), varDateFormat.getMonth(), 1);
                varStartDate = varStartDate.format(varGPSFormat);
                document.getElementById('ctl00_ContentPlaceHolder1_txtStartDate').value = varStartDate;
                var intLastDate = 28;
                if (varDateFormat.getMonth() == 0 || varDateFormat.getMonth() == 2 || varDateFormat.getMonth() == 4 || varDateFormat.getMonth() == 6 || varDateFormat.getMonth() == 7 || varDateFormat.getMonth() == 9 || varDateFormat.getMonth() == 11) {
                    intLastDate = 31;
                }
                else if (varDateFormat.getMonth() == 3 || varDateFormat.getMonth() == 5 || varDateFormat.getMonth() == 8 || varDateFormat.getMonth() == 10) {
                    intLastDate = 30;
                }
                else {
                    if (varDateFormat.getFullYear() % 4 == 0) {
                        intLastDate = 29;
                    }
                }
                var varEndDate = new Date(varDateFormat.getFullYear(), varDateFormat.getMonth(), intLastDate);
                varEndDate = varEndDate.format(varGPSFormat);
                document.getElementById('ctl00_ContentPlaceHolder1_txtEndDate').value = varEndDate;
            }
            else {

                document.getElementById('ctl00_ContentPlaceHolder1_txtStartDate').value = "";
                document.getElementById('ctl00_ContentPlaceHolder1_txtEndDate').value = "";
            }

        }

        function onShown() {
            var cal = $find("ctl00_ContentPlaceHolder1_calMonthYear");
            cal._switchMode("months", true);
            cal._today.innerText = "Current Month :" + cal._today.date.format("MMM-yyyy");
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.addHandler(row.cells[j].firstChild, "click", callMethod);
                    }
                }
            }
        }
        function onHidden() {
            var cal = $find("ctl00_ContentPlaceHolder1_calMonthYear");
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        Sys.UI.DomEvent.removeHandler(row.cells[j].firstChild, "click", callMethod);
                    }
                }
            }

        }

        function callMethod(eventElement) {
            var target = eventElement.target;
            var cal = $find("ctl00_ContentPlaceHolder1_calMonthYear");
            cal._visibleDate = target.date;
            cal.set_selectedDate(target.date);
            cal._switchMonth(target.date);
            cal._today.innerText = "Current Month :" + cal._today.date.format("MMM-yyyy");
            cal._blur.post(true);
            cal.raiseDateSelectionChanged();
        }

        ///Function for Select/Unselect All Branches
        function fnSelectAll(chkSelectAllBranch, chkSelectBranch) {
            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_gvBranchWise');
            var TargetChildControl = chkSelectBranch;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvBranchWise.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = chkSelectAllBranch.checked;
        }

        function fnSelectBranch(chkSelectBranch, chkSelectAllBranch) {

            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_gvBranchWise');
            var TargetChildControl = chkSelectAllBranch;
            var selectall = 0;
            var Inputs = gvBranchWise.getElementsByTagName("input");
            if (!chkSelectBranch.checked) {
                chkSelectAllBranch.checked = false;
            }
            else {
                for (var n = 0; n < Inputs.length; ++n) {
                    if (Inputs[n].type == 'checkbox') {
                        if (Inputs[n].checked) {
                            selectall = selectall + 1;
                        }
                    }
                }
                if (selectall == gvBranchWise.rows.length - 1) {
                    chkSelectAllBranch.checked = true;
                }
            }


        }

    </script>

</asp:Content>

