<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GExceptionReport, App_Web_523fo0sd" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <asp:Panel ID="pnlInput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                        Width="100%">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlExcDesc" runat="server" ToolTip="Exception Description" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Exception Description" ID="lblExcDesc" CssClass="styleReqFieldLabel" ToolTip="Exception Description">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMonth" runat="server" OnTextChanged="txtMonth_OnTextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM/yyyy" TargetControlID="txtMonth">
                                        </cc1:CalendarExtender>
                                        <%--<asp:Image ID="imgStartMonth" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvcutoffmonth" Display="Dynamic" runat="server"
                                                ErrorMessage="Select Month" ValidationGroup="Go" CssClass="validation_msg_box_sapn" SetFocusOnError="True" ControlToValidate="txtMonth"></asp:RequiredFieldValidator>
                                        </div>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Month" ID="lblMonth" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div align="right">
                    <button id="btnGo" runat="server" onclick="if(fnCheckPageValidators('Go',false))" title="Go[Alt+G]" causesvalidation="false" accesskey="G"
                        validationgroup="Go" type="button" onserverclick="btnOk_Click" class="css_btn_enabled">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button id="btnClear" runat="server" class="css_btn_enabled" causesvalidation="false" accesskey="L" title="Clear[Alt+L]"
                        onclick="if(fnConfirmClear())" onserverclick="btnClear_Click" type="button">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                </div>
                <div class="row">
                    <div class="col-md-12 ">
                        <asp:Panel ID="pnlExcepReport" runat="server" GroupingText="Exception Report Details" CssClass="stylePanel" Width="100%" Visible="false">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="GRVExcepReport" runat="server" AutoGenerateColumns="False" ShowFooter="true" class="gird_details"
                                        ToolTip="Exception Report Details" OnRowDataBound="GRVExcepReport_OnRowDataBound">
                                        <Columns>
                                            <%-- LOB NAME--%>
                                            <asp:TemplateField HeaderText="Line of Business">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOB" runat="server" Text='<%#Eval("LOB_NAME")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%-- LOCATION NAME--%>
                                            <asp:TemplateField HeaderText="Location">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("LOCATION_NAME")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%--Customer Name--%>
                                            <asp:TemplateField HeaderText="Customer">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCUSTOMER_NAME" runat="server" Text='<%#Eval("CUSTOMER_NAME")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%--Prime A/c No--%>
                                            <asp:TemplateField HeaderText="Document Ref No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPANUM" runat="server" Text='<%#Eval("DOC_NUMBER")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%--Installment Date--%>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("DATE")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%--User ID--%>
                                            <asp:TemplateField HeaderText="Created User">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("USER_NAME")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%-- LOB ID--%>
                                            <asp:TemplateField HeaderText="LOB ID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOBID" runat="server" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%-- LOCATION CODE--%>
                                            <asp:TemplateField HeaderText="LOC CODE" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOCCODE" runat="server" Text='<%#Eval("LOCATION_CODE")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%-- CUSTOMER ID--%>
                                            <asp:TemplateField HeaderText="CUST ID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCUSTID" runat="server" Text='<%#Eval("CUSTOMER_ID")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%--Description--%>
                                            <asp:TemplateField HeaderText="Exception Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExcepDescc" runat="server" Text='<%#Eval("DESC")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                            </asp:TemplateField>
                                            <%-- Check Box--%>
                                            <asp:TemplateField HeaderText="Select">
                                                <HeaderTemplate>
                                                    <asp:Label ID="HlblSelect" runat="server" Text="Override" />
                                                    <br />
                                                    <asp:CheckBox ID="chkSelectAll" Checked="false" runat="server" ToolTip="Select All" AutoPostBack="true" OnCheckedChanged="chkSelectAll_OnCheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkselect" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "DOC_NUMBER").ToString().ToUpper() == "TRUE"%>' ToolTip="Select" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="Location Id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocationId" runat="server" Text='<%#Eval("LOCATION_ID")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Program Id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProgramId" runat="server" Text='<%#Eval("PROGRAM_ID")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Document Transaction Id" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocTranId" runat="server" Text='<%#Eval("DOC_TRAN_ID")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnExcel" runat="server" accesskey="X" title="Exit[Alt+X]" class="css_btn_enabled" type="button"
                        validationgroup="Go" tooltip="Excel" onserverclick="btnExcel_Click" visible="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;E<u>x</u>cel    
                    </button>
                    <button id="btnSave" runat="server" accesskey="S" title="Save[Alt+S]" causesvalidation="true" class="css_btn_enabled" validationgroup="Submit"
                        onclick="if(fnCheckPageValidators('Submit'))" onserverclick="btnSave_OnClick" visible="false" type="button">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">
        var cal1;
        //function pageLoad() {
        //    cal1 = $find("calendar1");
        //    modifyCalDelegates(cal1);
        //}

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
    </script>
</asp:Content>

