<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptDemandCollection, App_Web_dzryruu3" title="Demand VS Collection" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Demand Collection Report">
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
                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" class="md-form-control form-control"
                                        OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line of Business">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ErrorMessage="Select Line of Business"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlLOB"
                                            InitialValue="-1" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel" ToolTip="Line of Business">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlRegion" runat="server" class="md-form-control form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" ToolTip="Location1">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblRegion" Text="Location1" CssClass="styleDisplayLabel" ToolTip="Location1"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" ToolTip="Location2" Enabled="false">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblBranch" Text="Location2" CssClass="styleDisplayLabel" ToolTip="Location2"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtReportDate" ContentEditable="true" runat="server" ToolTip="Report Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgReportDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReportDate" PopupButtonID="imgReportDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvReportDate" runat="server" ErrorMessage="Select Report Date"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True"
                                            ControlToValidate="txtReportDate" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblReportDate" CssClass="styleReqFieldLabel" Text="Report Date" ToolTip="Report Date"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDenomination" class="md-form-control form-control" runat="server" ToolTip="Denomination">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Denomination" ID="lblDenomination" CssClass="styleReqFieldLabel" ToolTip="Denomination">
                                        </asp:Label>
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
                                        ToolTip="Base Financial Years" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years " ToolTip="Base Financial Years"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFromYearMonthBase" runat="server"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlFromYearMonthBase_SelectedIndexChanged"
                                        ToolTip="Base From Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlFromYearMonthBase" runat="server" CssClass="validation_msg_box_sapn"
                                            ErrorMessage="Select From Year Month" ValidationGroup="Ok" Display="Dynamic"
                                            SetFocusOnError="True" ControlToValidate="ddlFromYearMonthBase" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFromYearMonthBase" runat="server" Text="From Year Month" CssClass="styleReqFieldLabel" ToolTip="Base From Year Month"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlToYearMonthBase" runat="server"
                                        OnSelectedIndexChanged="ddlToYearMonthBase_SelectedIndexChanged" AutoPostBack="true"
                                        ToolTip="Base To Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvddlToYearMonthBase" runat="server" ErrorMessage="Select To Year Month"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlToYearMonthBase"
                                            InitialValue="0" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblToYearMonthBase" runat="server" Text="To Year Month" CssClass="styleReqFieldLabel" ToolTip="Base To Year Month"> </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFinancialYearCompare" runat="server" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlFinancialYearCompare_SelectedIndexChanged"
                                        ToolTip="Compare Financial Years" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFinancialYearCompare" runat="server" Text="Financial Years " ToolTip="Compare Financial Years"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlFromYearMonthCompare" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlFromYearMonthCompare_SelectedIndexChanged"
                                        ToolTip="Compare From Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblFromYearMonthCompare" runat="server" Text="From Year Month" ToolTip="Compare From Year Month"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlToYearMonthCompare" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlToYearMonthCompare_SelectedIndexChanged"
                                        ToolTip="Compare To Year Month" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblToYearMonthCompare" runat="server" Text="To Year Month" ToolTip="Compare To Year Month"> </asp:Label>
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
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
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
                    <asp:Panel ID="pnlDemandCollection" runat="server" GroupingText="Demand Vs Collection" CssClass="stylePanel" Width="100%" Visible="false">
                        <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        <div id="divDemand" runat="server" style="overflow: auto; height: 300px; width: 100%; display: none">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="grvDemand" runat="server" Width="100%" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader"
                                            RowStyle-HorizontalAlign="Center" ShowFooter="true" OnRowDataBound="grvDemand_RowDataBound">
                                            <Columns>
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
                                                        <asp:Label ID="lblRegion" runat="server" Text='<%# Bind("Region") %>' ToolTip="Location"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <%-- <asp:TemplateField HeaderText="Location2" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDemandBranch" runat="server" Text='<%# Bind("Location2") %>' ToolTip="Branch"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Opening Demand" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpeningDemand" runat="server" Text='<%# Bind("OpeningDemand") %>' ToolTip="Opening Demand"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotOpeningDemand" runat="server" ToolTip="Total Opening Demand"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Opening Collection" ItemStyle-HorizontalAlign="Right" Visible="false" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpeningCollection" runat="server" Text='<%# Bind("OpeningCollection") %>' ToolTip="Opening Collection"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotOpeningCollection" runat="server" ToolTip="Total Opening Collection"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection %" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOpeningPercentage" runat="server" Text='<%# Bind("OpeningPercentage") %>' ToolTip="Opening Percentage"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotOpeningPercentage" runat="server" ToolTip="Total Opening Percentage"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monthly Demand" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyDemand" runat="server" Text='<%# Bind("MonthlyDemand") %>' ToolTip="Monthly Demand"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotMonthlyDemand" runat="server" ToolTip="Total Monthly Demand"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monthly Collection" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyCollection" runat="server" Text='<%# Bind("MonthlyCollection") %>' ToolTip="Monthly Collection"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotMonthlyCollection" runat="server" ToolTip="Total Monthly Collection"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection %" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyPercentage" runat="server" Text='<%# Bind("MonthlyPercentage") %>' ToolTip="Monthly Percentage"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotMonthlyPercentage" runat="server" ToolTip="Total Monthly Percentage"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Closing Demand" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClosingDemand" runat="server" Text='<%# Bind("ClosingDemand") %>' ToolTip="Closing Demand"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotClosingDemand" runat="server" ToolTip="Total Closing Demand"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cumulative Collection" ItemStyle-HorizontalAlign="Right" Visible="false" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClosingCollection" runat="server" Text='<%# Bind("ClosingCollection") %>' ToolTip="Closing Collection"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotClosingCollection" runat="server" ToolTip="Total Closing Collection"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection %" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClosingPercentage" runat="server" Text='<%# Bind("ClosingPercentage") %>' ToolTip="Closing Percentage"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lbltotClosingPercentage" runat="server" ToolTip="Total Closing Percentage"></asp:Label>
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
                <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server" visible="false" validationgroup="Print"
                    type="button" causesvalidation="false" accesskey="P" title="Go,Alt+P">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
                <button class="css_btn_enabled" id="btnExcel" onserverclick="btnExcel_Click" runat="server" visible="false" validationgroup="Excel"
                    type="button" causesvalidation="false" accesskey="E" title="Excel,Alt+E">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsDemandCollection" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:CustomValidator ID="CVDemandCollection" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                    <asp:CustomValidator ID="CVAssetClass" runat="server" Display="None" ValidationGroup="Ok"></asp:CustomValidator>
                    <asp:CustomValidator ID="CVFrequency" runat="server" Display="None" ValidationGroup="Ok"></asp:CustomValidator>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

