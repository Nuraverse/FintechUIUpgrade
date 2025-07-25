<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GCollectionEfficencyReport, App_Web_r4rfxxex" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Collection Efficiency Report">
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
                                            <asp:DropDownList ID="ddlbranch" runat="server" ToolTip="Branch"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblbranch" runat="server" Text="Branch" CssClass="styleDisplayLabel" ToolTip="Location1"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div id="Div1" class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddllocation2" runat="server" AutoPostBack="True" ValidationGroup="Header" ToolTip="Location2"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbllocation2" runat="server" Text="Location2" CssClass="styleDisplayLabel" ToolTip="Location2"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCategory" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlCategory" runat="server" ToolTip="Delinquent Category"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCategory" runat="server" Text="Delinquent Category" CssClass="styleDisplayLabel" ToolTip="Category"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div id="Div2" class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtdate" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgStartMonth" BehaviorID="calendar1" Format="MM/yyyy" TargetControlID="txtdate" OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgStartMonth" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvcutoffmonth" runat="server" ErrorMessage="Select the Month" ValidationGroup="btnGo" SetFocusOnError="True"
                                                    ControlToValidate="txtdate" Display="Dynamic" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblReportDateSearch" runat="server" CssClass="styleDisplayLabel" Text="Month" ToolTip="Report Date" />
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvStartDateSearch" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateSearch" runat="server" ValidationGroup="btnGo" autocomplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgStartDateSearch" runat="server"
                                                ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                                <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                    ErrorMessage="Enter the Start Date" Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvEndDateSearch" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateSearch" runat="server" ValidationGroup="btnGo" autocomplete="off"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgEndDateSearch" runat="server"
                                                ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                                <%-- OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter the End Date"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCreditApprovalRpt1" runat="server" visible="true">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFinacialYearBase" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlFinacialYearBase_SelectedIndexChanged"
                                                ToolTip="Financial Years" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" InitialValue="0"
                                                    runat="server" ControlToValidate="ddlFinacialYearBase" SetFocusOnError="True" ErrorMessage="Select the Start Month Year"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years " CssClass="styleReqFieldLabel" ToolTip="Financial Years"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCreditApprovalRpt2" runat="server" visible="true">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFromYearMonthBase" runat="server" InitialValue="0"
                                                ToolTip="Month" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlFromYearMonthBase" SetFocusOnError="True" ErrorMessage="Select the From Month Year"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFromYearMonthBase" runat="server" Text="From Month Year" CssClass="styleReqFieldLabel" ToolTip="From Month Year"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="Div3" runat="server" visible="true">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlToYearMonthBase" runat="server" InitialValue="0"
                                                ToolTip="Month" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlToYearMonthBase" SetFocusOnError="True" ErrorMessage="Select the To Month Year"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label4" runat="server" Text="To Month Year" CssClass="styleReqFieldLabel" ToolTip="To Month Year"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div id="divCurrency" runat="server" class="row">
                                    <div style="text-align: right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label ID="lblCurrecny" CssClass="styleDisplayLabel" runat="server" ToolTip="Currency" AutoPostBack="true">
                                            </asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_ServerClick" validationgroup="btnGo" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="ImgBtnExcel" onserverclick="ImgBtnExcel_ServerClick"
                            runat="server" visible="false"
                            type="button" causesvalidation="false" accesskey="A" title="Excel,Alt+A">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel
                    <%--onserverclick="ImgBtnExcel_Click"--%>
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_ServerClick" runat="server"
                            type="button" accesskey="X">
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
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line Of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Location">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Branch") %>' ToolTip="Branch"></asp:Label>
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
                                                        <asp:TemplateField HeaderText="Pincode">
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
                                                        <asp:TemplateField HeaderText="Debt Collector Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDebtCollectorCode" runat="server" Text='<%# Bind("DebtCollectorCode") %>' ToolTip="Debt Collector Code"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Category">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label3" runat="server" Style="text-align: right" Text='<%# Bind("Category") %>' ToolTip="Category"></asp:Label>
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
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Button ID="btnPrint" CssClass="styleSubmitButton" runat="server" Text="Print" ToolTip="Print" Visible="false" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                                    ShowSummary="false" />
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">

                        var cal1;
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
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImgBtnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

