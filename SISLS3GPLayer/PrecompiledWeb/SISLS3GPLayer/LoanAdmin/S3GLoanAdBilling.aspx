<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GClnBilling, App_Web_yy0xp33b" title="Bill Generation" enableviewstate="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" language="javascript">
        var btnActive_index = 0;
        var index = 0;
        function pageLoad(s, a) {
            var TC = $find("<%=tcBilling.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }
            tab = $find('ctl00_ContentPlaceHolder1_tcBilling');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            function on_Change(sender, e) {
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }

        }

        function fnMoveNextTab(Source_Invoker) {
            tab = $find('ctl00_ContentPlaceHolder1_tcBilling');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            strValgrp = "btnSave"
            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;
            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {

                    switch (index) {
                        case 0:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 1:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                var TC = $find("<%=tcBilling.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=txtDataLOB.ClientID %>").focus();
                }
                if (TC.get_activeTab().get_tabIndex() == 2) {
                    $get("<%=txtBillLOB.ClientID %>").focus();
                }

                //Focus End
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <cc1:TabContainer ID="tcBilling" runat="server" CssClass="styleTabPanel" ScrollBars="None"
                            Width="100%" ActiveTabIndex="1">
                            <cc1:TabPanel ID="TabMainPage" runat="server" BackColor="Red" CssClass="tabpan" HeaderText="Process">
                                <HeaderTemplate>
                                    Process
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <asp:Panel ID="Panel1" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                                            Width="100%">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlLOB" runat="server" onchange="fnAssignLOB(this)" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                Display="Dynamic" InitialValue="0" SetFocusOnError="true" ErrorMessage="Select a Line of Business" ValidationGroup="Go"
                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMonthYear" runat="server" onchange="fnAssignMonthYear(this)"
                                                            class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="calMonthYear" Format="MMM-yyyy" TodaysDateFormat="MMM-yyyy"
                                                            OnClientDateSelectionChanged="AssignStartEndDate" OnClientShown="onShown" OnClientHidden="onHidden"
                                                            runat="server" DefaultView="Months" Enabled="True" TargetControlID="txtMonthYear"
                                                            PopupButtonID="imgMonthYear">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblMonthYear" runat="server" CssClass="styleReqFieldLabel" Text="Month/Year"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtStartDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="calStartDate" runat="server" Enabled="True" TargetControlID="txtStartDate"
                                                            PopupButtonID="imgStartDate">
                                                        </cc1:CalendarExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ControlToValidate="txtStartDate"
                                                                Display="Dynamic" ErrorMessage="Select a Start Date" ValidationGroup="Go" InitialValue="" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblStartDate" runat="server" CssClass="styleReqFieldLabel" Text="Start Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEndDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="calEndDate" runat="server" Enabled="True" TargetControlID="txtEndDate"
                                                            PopupButtonID="imgEndDate">
                                                        </cc1:CalendarExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ControlToValidate="txtEndDate"
                                                                Display="Dynamic" ErrorMessage="Select a End Date" ValidationGroup="Go" InitialValue="" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblEndDate" runat="server" CssClass="styleReqFieldLabel" Text="End Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="row">
                                        <asp:Panel ID="panSchedule" runat="server" GroupingText="Schedule Details" CssClass="stylePanel"
                                            Width="100%">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:RadioButtonList ID="rbtnSchedule" runat="server" AutoPostBack="True" AppendDataBoundItems="True"
                                                            RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnSchedule_SelectedIndexChanged" class="md-form-control form-control radio">
                                                            <asp:ListItem Text="Schedule Now" Value="1"></asp:ListItem>
                                                            <asp:ListItem Selected="True" Text="Schedule At :" Value="0"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtScheduleDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="calScheduleDate" runat="server" Enabled="True" TargetControlID="txtScheduleDate"
                                                            PopupButtonID="imgScheduleDate">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblScheduleDate" runat="server" Text="Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtScheduleTime" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <div class="validation_msg_box">
                                                            <asp:RegularExpressionValidator ID="REVScheduleTime" ValidationGroup="Go" runat="server"
                                                                Display="Dynamic" ErrorMessage="Time Should be HH:MM AM Fomat(12 Hours)"
                                                                ControlToValidate="txtScheduleTime" SetFocusOnError="True" ValidationExpression="^([0]?[1-9]|1[0-2])(:)[0-5][0-9]((:)[0-5][0-9])?( )?(AM|am|aM|Am|PM|pm|pM|Pm)$"
                                                                CssClass="validation_msg_box_sapn"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblScheduleTime" runat="server" Text="Time (HH:MM AM)"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="vertical-align: middle;">
                                                    <div class="md-input">
                                                        <button id="btnGo" runat="server" accesskey="O" visible="false" validationgroup="Go" class="css_btn_enabled"
                                                            onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                                            <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 md-input">
                                            <asp:Panel runat="server" ID="pnlCashFlow" CssClass="stylePanel" GroupingText="Cash Flows"
                                                Width="100%" Visible="False">
                                                <div class="gird">
                                                    <asp:GridView ID="grvCashFlow" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                        EmptyDataText="No Cashflow Found for Billing!...." Width="95%" OnRowDataBound="grvCashFlow_RowDataBound" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkSelectAllCF" runat="server" onclick="javascript:fnSelectAllCF(this,'chkSelectCF');" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelectCF" runat="server" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CashFlow_Flag_ID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCashFlowFlagID" runat="server" Text='<%#Bind("CashFlow_Flag_ID") %>'></asp:Label>
                                                                    <asp:Label ID="lblServiceTax" runat="server" Text='<%#Bind("Service_Tax") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="CashFlow" HeaderText="CashFlow">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <RowStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="col-md-6 md-input">
                                            <asp:Panel runat="server" ID="pnlBranch" CssClass="stylePanel" GroupingText="Branch Details"
                                                Width="100%" Visible="False">
                                                <div class="gird">
                                                    <asp:GridView ID="gvBranchWise" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                        EmptyDataText="No Branch Found for Billing!...." Width="100%" OnRowDataBound="gvBranchWise_RowDataBound" class="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkSelectAllBranch" runat="server" onclick="javascript:fnSelectAll(this,'chkSelectBranch');" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelectBranch" runat="server" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Branch Id" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBranchId" runat="server" Text='<%#Bind("Location_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Location" HeaderText="Branch">
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="AccountCount" HeaderText="Number of Accounts">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="DebitAmount" HeaderText="Debit Amount">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="JVReference" HeaderText="System JV Reference" />
                                                            <asp:TemplateField HeaderText="Remarks">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtRemarks" runat="server" Text='<%#Bind("Remarks") %>' MaxLength="100" CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <RowStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="row" align="center">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <button id="btnGonw" runat="server" accesskey="G" validationgroup="Go" class="css_btn_enabled" causesvalidation="true" onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                                <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                            </button>
                                        </div>
                                    </div>

                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabControlDataSheet" runat="server" BackColor="Red" CssClass="tabpan"
                                HeaderText="Process" Width="98%">
                                <HeaderTemplate>
                                    Control Data Sheet
                                </HeaderTemplate>
                                <ContentTemplate>

                                    <div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDataLOB" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblDataLOB" runat="server" CssClass="styleReqdFieldLabel" Text="Line of Business"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <%--<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDataFrequency" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="Label3" runat="server" CssClass="styleReqdFieldLabel" Text="Frequency"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>--%>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtDataMonthYear" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblDataMonthYear" runat="server" CssClass="styleReqdFieldLabel" Text="Month/Year"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="row">
                                            <asp:Panel runat="server" ID="pnlControlData" CssClass="stylePanel" GroupingText="Control Data for Billing"
                                                Width="100%" Visible="False">
                                                <div id="div2" style="overflow: auto; width: 98%; padding-left: 1%;" runat="server"
                                                    border="1">
                                                    <div class="gird">
                                                        <asp:GridView ID="gvControlDataSheet" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                            Width="100%" OnRowCommand="gvControlDataSheet_RowCommand" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Location" DataField="Location" />
                                                                <asp:BoundField HeaderText="Type of Billing" DataField="BillingType" />
                                                                <asp:BoundField HeaderText="No of Accounts" DataField="AccountCount">
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:BoundField HeaderText="Debit Amount" DataField="DebitAmount">
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="View" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                                            CommandArgument='<%# Bind("Billing_Control_Id") %>' CommandName="Query" runat="server" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="60px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                    <div class="gird">
                                                        <asp:GridView ID="gvBranchTotal" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                            Width="100%" class="gird_details">
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Location" DataField="Branch" />
                                                                <asp:BoundField HeaderText="Location Total Amount" DataField="BranchTotal">
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="gird">
                                                    <asp:GridView ID="grvAccounts" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False"
                                                        Width="100%" class="gird_details">
                                                        <Columns>
                                                            <asp:BoundField HeaderText="Type of Billing" DataField="BillingType" />
                                                            <asp:BoundField HeaderText="Account Number" DataField="PANum" />
                                                            <asp:BoundField HeaderText="Sub Account Number" DataField="SANum" Visible="false" />
                                                            <asp:BoundField HeaderText="Debit Amount" DataField="DebitAmount">
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                                <br />
                                                <div>
                                                    <div class="row">
                                                        <asp:UpdatePanel ID="upAccounts" runat="server">
                                                            <ContentTemplate>
                                                                <button class="css_btn_enabled" id="btnXLPorting" onserverclick="btnXLPorting_Click" runat="server" onclick="if(confirm('Do you want to Export the data?'))"
                                                                    type="button" accesskey="T" causesvalidation="true" title="Export Accounts[Alt+T]" validationgroup="btnSave">
                                                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Expor<u>t</u>
                                                                </button>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btnXLPorting" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>

                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabBillOutput" runat="server" BackColor="Red" CssClass="tabpan"
                                HeaderText="Process" Width="100%">
                                <HeaderTemplate>
                                    Bill Generation Output
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBillLOB" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblBillLOB" runat="server" CssClass="styleReqdFieldLabel" Text="Line of Business"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <%--<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBillFrequency" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblBillFrequency" runat="server" CssClass="styleReqdFieldLabel" Text="Frequency"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>--%>
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBillMonthYear" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblBillMonthYear" runat="server" CssClass="styleReqdFieldLabel" Text="Month/Year"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="row">
                                            <button class="css_btn_enabled" visible="false" id="btnBillPDF" onserverclick="btnBillPDF_Click" runat="server" onclick="if(fnCheckPageValidators())"
                                                type="button" accesskey="B" causesvalidation="true" title="Billing By PDF[Alt+B]" validationgroup="btnSave">
                                                <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>B</u>illing By PDF
                                            </button>
                                            <asp:Button ID="btnBillStatement" Visible="false" runat="server" CssClass="css_btn_enabled"
                                                Text="Billling By Statement" AccessKey="I" ToolTip="Billling By Statement,Alt+I" Enabled="false" />
                                            <button class="css_btn_enabled" id="btnBillEMail" title="Email [Alt+E]" causesvalidation="false" runat="server"
                                                type="button" accesskey="E" visible="false">
                                                <i class="fa fa-envelope-open" aria-hidden="true"></i>&emsp;<u></u>Email
                                            </button>
                                            <%--<asp:Button ID="btnBillEMail" runat="server" CssClass="css_btn_enabled" Text="Billing By EMail"
                                                        Enabled="false" AccessKey="M" ToolTip="Billing By EMail" />--%>
                                        </div>
                                    </div>

                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div>
                            <div class="row">
                                <div>
                                    <div class="btn_height"></div>
                                    <div align="right" class="fixed_btn">
                                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_OnClick" runat="server" onclick="if(fnCheckPageValidators())"
                                            type="button" accesskey="S" causesvalidation="true" title="Save the Details[Alt+S]" validationgroup="btnSave">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                        </button>
                                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_OnClick" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                                            type="button" accesskey="L">
                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                        </button>
                                        <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                                            type="button" accesskey="X">
                                            <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                        </button>

                                    </div>
                                    <div class="row" style="display: none" class="col">
                                        <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                        <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                            <asp:CustomValidator ID="cvBilling" runat="server" CssClass="styleMandatoryLabel"
                                                Display="None" ValidationGroup="Submit"></asp:CustomValidator>
                                            <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                                                ValidationGroup="Go" HeaderText="Please correct the following validation(s):" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" src="../Scripts/jsBilling.js" type="text/javascript">
    </script>

    <script language="javascript" type="text/javascript">
        function fnAssignLOB(ddlLOB) {
            var varLob = ddlLOB.selectedIndex;
            var txtBillLOB = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabBillOutput_txtBillLOB');
            if (txtBillLOB != null) {
                txtBillLOB.value = ddlLOB.options[varLob].innerText;
            }
            AssignStartEndDate();
        }
        function fnAssignFrequency(ddlFrequency) {
            var varFrequency = ddlFrequency.selectedIndex;
            var txtBillFrequency = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabBillOutput_txtBillFrequency');
            var txtDataFrequency = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabControlDataSheet_txtDataFrequency');
            if (txtBillFrequency != null && txtDataFrequency != null) {
                txtBillFrequency.value = ddlFrequency.options[varFrequency].innerText;
                txtDataFrequency.value = ddlFrequency.options[varFrequency].innerText;
            }
            AssignStartEndDate();
        }
        function AssignStartEndDate() {            
                var varMonthYear = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_txtMonthYear').value;
                var varDateFormat = Date.parseInvariant(varMonthYear, "MMM-yyyy");
                var varGPSFormat = '<%=strDateFormat %>';
                var varStartDate = new Date(varDateFormat.getFullYear(), varDateFormat.getMonth(), 1);
                varStartDate = varStartDate.format(varGPSFormat);
                document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_txtStartDate').value = varStartDate;
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
                document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_txtEndDate').value = varEndDate;           

        }

        function fnSelectCashFlow(chkSelectCashFlow, chkSelectAllCF) {

            var grvCashFlow = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_grvCashFlow');
            var TargetChildControl = chkSelectAllCF;
            var selectall = 0;
            var Inputs = grvCashFlow.getElementsByTagName("input");
            if (!chkSelectCashFlow.checked) {
                chkSelectAllCF.checked = false;
            }
            else {
                for (var n = 0; n < Inputs.length; ++n) {
                    if (Inputs[n].type == 'checkbox') {
                        if (Inputs[n].checked) {
                            selectall = selectall + 1;
                        }
                    }
                }
                if (selectall == grvCashFlow.rows.length - 1) {
                    chkSelectAllCF.checked = true;
                }
            }

        }

        ///Function for Select/Unselect All Branches
        function fnSelectAllCF(chkSelectAllCF, chkSelectCashFlow) {
            var grvCashFlow = document.getElementById('ctl00_ContentPlaceHolder1_tcBilling_TabMainPage_grvCashFlow');
            var TargetChildControl = chkSelectCashFlow;
            //Get all the control of the type INPUT in the base control.
            var Inputs = grvCashFlow.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = chkSelectAllCF.checked;
        }

    </script>

</asp:Content>
