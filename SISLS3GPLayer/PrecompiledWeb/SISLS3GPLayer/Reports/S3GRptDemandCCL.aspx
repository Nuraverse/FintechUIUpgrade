<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptDemandCCL, App_Web_nmps0mjf" title="Demand Collection Customer Level" %>

<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Demand Collection Customer Level Report">
                        </asp:Label>
                    </h6>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlDemand" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" CausesValidation="true"
                                        OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line ofBusiness"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlLOB" InitialValue="-1" ErrorMessage="Select Line of Business"
                                            Display="Dynamic" ValidationGroup="Ok">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="Label1" CssClass="styleReqFieldLabel" ToolTip="Line ofBusiness">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerName" runat="server" Style="display: none;"
                                        class="md-form-control form-control login_form_content_input requires_true"
                                        CausesValidation="true"></asp:TextBox>
                                    <uc2:LOV ID="ucCustomerCodeLov" onfocus="return fnLoadCustomer();" runat="server"
                                        strLOV_Code="CMD" />
                                    <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" Style="display: none"
                                        OnClick="btnLoadCustomer_OnClick" ToolTip="Customer Name" />
                                    <input id="hdnCustID" type="hidden" runat="server" />
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvcustname" runat="server"
                                            ControlToValidate="txtCustomerName" InitialValue="-1" ErrorMessage="Select a Customer Name"
                                            Display="Dynamic" ValidationGroup="Ok" Enabled="false" CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblCustomerName" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlCustomerGroup" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlCustomerGroup_SelectedIndexChanged" ToolTip="Customer Group Name"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvcustgroup" runat="server"
                                            ControlToValidate="ddlCustomerGroup" InitialValue="-1" ErrorMessage="Select a Customer Group Name"
                                            Display="Dynamic" ValidationGroup="Ok" Enabled="false" CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblCustomerGroup" Text="Customer Group Name" ToolTip="Customer Group Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlPNum" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlPNum_SelectedIndexChanged" ToolTip="Account Number"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvpanum" runat="server"
                                            ControlToValidate="ddlPNum" InitialValue="-1" ErrorMessage="Select a Prime Account Number"
                                            Display="Dynamic" ValidationGroup="Ok" Enabled="false" CssClass="validation_msg_box_sapn">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblPNum" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDenomination" runat="server" class="md-form-control form-control" ToolTip="Denomination">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Denomination" ID="lblDenomination" CssClass="styleReqFieldLabel" ToolTip="Denomination">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtReportDate" runat="server" ToolTip="Report Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgReportDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" TargetControlID="txtReportDate"
                                        PopupButtonID="imgReportDate" Format="dd/MM/yyyy" ID="CalendarExtender1"
                                        OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvReportDate" runat="server" ControlToValidate="txtReportDate"
                                            Display="Dynamic" ValidationGroup="Ok" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                            ErrorMessage="Select Report Date"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblReportDate" CssClass="styleReqFieldLabel" Text="Report Date" ToolTip="Report Date"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PnlDemandData" runat="server" GroupingText="Compare Data" CssClass="stylePanel" Width="100%">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFinacialYearBase" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlFinacialYearBase_SelectedIndexChanged"
                                        ToolTip="Financial Years" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years " ToolTip="Financial Years"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFromYearMonthBase" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlFromYearMonthBase_SelectedIndexChanged" ToolTip="From Year Month"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlFromYearMonthBase" runat="server" ErrorMessage="Select From Year Month"
                                            ValidationGroup="Ok" Display="None" SetFocusOnError="True" ControlToValidate="ddlFromYearMonthBase"
                                            InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFromYearMonthBase" runat="server" Text="From Year Month" CssClass="styleReqFieldLabel" ToolTip="From Year Month"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlToYearMonthBase" runat="server" OnSelectedIndexChanged="ddlToYearMonthBase_SelectedIndexChanged" ToolTip="To Year Month"
                                        AutoPostBack="true" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlToYearMonthBase" runat="server" ErrorMessage="Select To Year Month"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlToYearMonthBase"
                                            InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblToYearMonthBase" runat="server" Text="To Year Month" CssClass="styleReqFieldLabel" ToolTip="To Year Month"> </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFinancialYearCompare" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlFinancialYearCompare_SelectedIndexChanged" ToolTip="Financial Years "
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFinancialYearCompare" runat="server" Text="Financial Years " ToolTip="Financial Years"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFromYearMonthCompare" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlFromYearMonthCompare_SelectedIndexChanged"
                                        ToolTip="From Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblToYearMonthCompare" runat="server" Text="To Year Month" ToolTip="To Year Month"> </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlToYearMonthCompare" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlToYearMonthCompare_SelectedIndexChanged"
                                        ToolTip="To Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="Label2" runat="server" Text="To Year Month" ToolTip="To Year Month"> </asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnOk" onserverclick="btnOk_Click" validationgroup="Ok" runat="server"
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
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlDemandCollection" runat="server" GroupingText="Demand Vs Collection Customer Level" CssClass="stylePanel" Width="100%" Visible="false">
                        <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        <div id="divDemand" runat="server" style="overflow: auto; height: 300px; display: none">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="grvDemand" runat="server" Width="98%" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ShowFooter="true" OnRowDataBound="grvDemand_RowDataBound">
                                            <Columns>
                                                <%-- <asp:TemplateField HeaderText="Frequency" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFrequency" runat="server" Text='<%# Bind("Frequency") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text="Grand Total"></asp:Label>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Month" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMonth" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Demand Month" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDemandMonth" runat="server" Text='<%# Bind("DemandMonth") %>' ToolTip="Demand Month"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbllocation" runat="server" Text='<%# Bind("Branch") %>' ToolTip="Location"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomerCode" runat="server" Text='<%# Bind("CustomerName") %>' ToolTip="Customer Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account No" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrime" runat="server" Text='<%# Bind("PrimeAccountNo") %>' ToolTip="Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSub" runat="server" Text='<%# Bind("SubAccountNo") %>' ToolTip="Sub Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Opening Demand" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpeningDemand" runat="server" Text='<%# Bind("OpeningDemand") %>' ToolTip="Opening Demand"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotOpeningDemand" runat="server" ToolTip="Total Opening Demand"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Opening Collection" ItemStyle-HorizontalAlign="Right"
                                                    FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpeningCollection" runat="server" Text='<%# Bind("OpeningCollection") %>' ToolTip="Opening Collection"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotOpeningCollection" runat="server" ToolTip="Total Opening Collection"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection %" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpeningPercentage" runat="server" Text='<%# Bind("OpeningPercentage") %>' ToolTip="Opening %"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotOpeningPercentage" runat="server" ToolTip="Total Opening percentage"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monthly Demand" ItemStyle-HorizontalAlign="Right"
                                                    FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyDemand" runat="server" Text='<%# Bind("MonthlyDemand") %>' ToolTip="Monthly Demand"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotMonthlyDemand" runat="server" ToolTip="Total Monthly Demand"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monthly Collection" ItemStyle-HorizontalAlign="Right"
                                                    FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyCollection" runat="server" Text='<%# Bind("MonthlyCollection") %>' ToolTip="Monthly Collection"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotMonthlyCollection" runat="server" ToolTip="Total Monthly Collection"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection %" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyPercentage" runat="server" Text='<%# Bind("MonthlyPercentage") %>' ToolTip="Monthly %"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotMonthlyPercentage" runat="server" ToolTip="Total Monthly %"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cumulative Demand" ItemStyle-HorizontalAlign="Right"
                                                    FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClosingDemand" runat="server" Text='<%# Bind("ClosingDemand") %>' ToolTip="Closing Demand"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotClosingDemand" runat="server" ToolTip="Total Closing Demand"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cumulative Collection" ItemStyle-HorizontalAlign="Right"
                                                    FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClosingCollection" runat="server" Text='<%# Bind("ClosingCollection") %>' ToolTip="ClosingCollection"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotClosingCollection" runat="server" ToolTip="Total ClosingCollection"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection %" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClosingPercentage" runat="server" Text='<%# Bind("ClosingPercentage") %>' ToolTip="Closing %"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotClosingPercentage" runat="server" ToolTip="Total Closing %"></asp:Label>
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
                <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" validationgroup="Print" runat="server"
                    type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsDemandCollection" runat="server" CssClass="styleMandatoryLabel"
                        CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:CustomValidator ID="CVDemandCollection" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                    <asp:CustomValidator ID="CVAssetClass" runat="server" Display="None" ValidationGroup="Ok"></asp:CustomValidator>
                    <asp:CustomValidator ID="CVFrequency" runat="server" Display="None" ValidationGroup="Ok"></asp:CustomValidator>
                </div>
            </div>
            <script language="javascript" type="text/javascript">
                function fnLoadCustomer() {
                    document.getElementById('<%=btnLoadCustomer.ClientID%>').click();
                }
            </script>
            <script language="javascript" type="text/javascript">
                function Resize() {
                    if (document.getElementById('ctl00_ContentPlaceHolder1_divDemand') != null) {
                        if (document.getElementById('divMenu').style.display == 'none') {
                            (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                        }
                        else {
                            (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - 270;
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

                        if (document.getElementById('ctl00_ContentPlaceHolder1_divDemand') != null)
                            (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - 270;
                    }
                    if (show == 'F') {
                        if (document.getElementById('divGrid1') != null) {
                            document.getElementById('divGrid1').style.width = "960px";
                            document.getElementById('divGrid1').style.overflow = "auto";
                        }

                        document.getElementById('divMenu').style.display = 'none';
                        document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                        document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                        if (document.getElementById('ctl00_ContentPlaceHolder1_divDemand') != null)
                            (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                    }
                }

            </script>
        </div>
    </div>
</asp:Content>







