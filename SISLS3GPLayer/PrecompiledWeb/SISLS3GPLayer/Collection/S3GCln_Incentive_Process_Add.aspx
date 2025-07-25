<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Collection_S3GCln_Incentive_Process_Add, App_Web_la20gqab" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlInputCriteria" runat="server" ToolTip="Details" GroupingText="Input Criteria"
                            CssClass="stylePanel" Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" class="md-form-control form-control" ToolTip="Line of Business">
                                        </asp:DropDownList>
                                        <%--     <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" SetFocusOnError="true" ErrorMessage="Select Line of Business" ValidationGroup="GO"></asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lbllOB" runat="server" Text="Line of Business "></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <%--  <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" InitialValue="0" SetFocusOnError="true" ErrorMessage="Select the Branch" ValidationGroup="GO"></asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" Text="Branch" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFrmMonthyr" MaxLength="6" runat="server" OnTextChanged="txtFrmMonthyr_OnTextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                            AutoPostBack="true" ToolTip="From Month/Year"></asp:TextBox>
                                        <cc1:CalendarExtender ID="ceFromMonthYr" runat="server" BehaviorID="calendar1" Format="yyyyMM" TargetControlID="txtFrmMonthyr" OnClientShown="onCalendarShown" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <cc1:FilteredTextBoxExtender ID="ftFrmMonthyr" runat="server" FilterType="Numbers"
                                            TargetControlID="txtFrmMonthyr">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvFrmMonthyr" runat="server" ErrorMessage="Select From Month/Year."
                                                ValidationGroup="GO" Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ControlToValidate="txtFrmMonthyr">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDate" runat="server" Text="From Month/Year" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtToMonthyr" MaxLength="6" runat="server" AutoPostBack="true" OnTextChanged="txtToMonthyr_OnTextChanged"
                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="To Month/Year"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" BehaviorID="calendar2"
                                            Format="yyyyMM" TargetControlID="txtToMonthyr" OnClientShown="onCalendarShown" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <cc1:FilteredTextBoxExtender ID="fttxtToMonthyr" runat="server" FilterType="Numbers"
                                            TargetControlID="txtToMonthyr">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvToMonthyr" runat="server" ErrorMessage="Select To Month/Year."
                                                ValidationGroup="GO" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ControlToValidate="txtToMonthyr">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEndDate" runat="server" Text="To Month/Year" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDocNumber" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDocNo" runat="server" Text="Document Number" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                                    <div align="right">

                                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server" validationgroup="GO"
                                            type="button" accesskey="G" title="Go[Alt+G]">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                        </button>

                                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnclear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                                            type="button" accesskey="L">
                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                        </button>

                                        <button class="css_btn_enabled" id="btnPrint" title="Print [Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                                            type="button" accesskey="P" visible="false">
                                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                                        </button>

                                    </div>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:Panel ID="pnlIncentiveProcDetails" runat="server" CssClass="stylePanel" GroupingText="Incentive Process Details">
                            <div class="gird">
                                <asp:GridView ID="grvDetails" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                    Width="100%" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialNo" ToolTip="Serial No" runat="server" Text='<%#Eval("slno") %> '></asp:Label>
                                            </ItemTemplate>
                                            <%-- <ItemStyle Width="6%" HorizontalAlign="Center" />--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Lob ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLOB_ID" runat="server" Text='<%#Eval("LOB_ID") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Line of Business">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLOBName" runat="server" ToolTip="Line of Business" Text='<%#Eval("LOB_NAME") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Location ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation_ID" runat="server" Text='<%#Eval("LOCATION_ID") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Branch">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" runat="server" ToolTip="Branch" Text='<%#Eval("LOCATION_DESC") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="INC_MST_ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblINC_MST_ID" runat="server" Text='<%#Eval("INC_MST_ID") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Group Name">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnGroupName" runat="server" ToolTip="Group Name" Text='<%#Eval("Group_Name") %> ' ForeColor="Red" Font-Underline="true" Font-Bold="true" OnClick="lnkbtnGroupName_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Executive ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExecutive_ID" runat="server" Text='<%#Eval("Executive_ID") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Executive Name">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="lblExecutive_Code" Visible="false" runat="server" Text='<%#Eval("Executive_Code") %> '></asp:Label>--%>
                                                <asp:Label ID="lblExecutiveName" runat="server" ToolTip="Executive Name" Text='<%#Eval("Executive_Name") %> '></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Slab Det ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSlabDetID" runat="server" Text='<%#Eval("SLAB_DET_ID") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Target">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTarget" runat="server" ToolTip="Target" Text='<%#Eval("Target") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="Month Value">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMonthValue" runat="server" Text='<%#Eval("Month_Value") %> '></asp:Label>
                                                   
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Actual">
                                            <ItemTemplate>
                                                <asp:Label ID="lblActual" runat="server" ToolTip="Actual" Text='<%#Eval("Actual") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Appl. Slab Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblapplSlab" ToolTip="Applicable Slab" runat="server" Text='<%#Eval("Appl_Slab") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Appl. Rate(Percent/Amount)">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApplRate" runat="server" ToolTip="Applicable Rate" Text='<%#Eval("Appl_Rate") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Pay Type" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPay_Type" runat="server" ToolTip="Pay Type" Text='<%#Eval("Pay_Type") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Salary">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalary" runat="server" ToolTip="Basic Pay" Text='<%#Eval("Salary") %> '></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>

                                        <%-- <asp:TemplateField HeaderText="Eligible">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEligible" runat="server" Text='<%#Eval("Eligible") %> '></asp:Label>
                                                   
                                                </ItemTemplate>
                                                   <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Incentive">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIncentive" runat="server" ToolTip="Incentive" Text='<%#Eval("Incentive") %> '></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterTemplate>
                                                <asp:Label ID="lblTotIncentive" runat="server" Text="" ToolTip="Incentive" />
                                            </FooterTemplate>
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <br />
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12 gird">
                        <asp:Panel ID="pnlContractDetails" runat="server" GroupingText="Groupwise Contract Details" CssClass="stylePanel"
                            Width="50%" Height="300px" Visible="false">
                            <asp:GridView ID="gvContractDetails" runat="server" AutoGenerateColumns="False"
                                Width="100%" class="gird_details">
                                <Columns>
                                    <asp:TemplateField HeaderText="Inc MST ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblINC_MST_ID" runat="server" Text='<%#Eval("INC_MST_ID") %> '></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Group Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGroupName" runat="server" Text='<%#Eval("Group_Name") %> '></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAccountNo" runat="server" Text='<%#Eval("Panum") %> '></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount Financed">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmountFinanced" runat="server" Text='<%#Eval("Amount_Financed") %> '></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>

                <div align="right">

                    <button class="css_btn_enabled" id="btnSave" onclick="if(fnCheckPageValidators('Save'))" onserverclick="btnSave_Click" runat="server" validationgroup="Save"
                        type="button" accesskey="S" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btncancel" onserverclick="btncancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>

                <div style="display: none">
                    <asp:ValidationSummary ID="vsGp" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                        ValidationGroup="GO" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                </div>

            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
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
        function fnConfirmSave() {
            if (confirm('Are you sure want to save?')) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>

</asp:Content>


