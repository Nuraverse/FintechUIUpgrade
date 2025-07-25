<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptDemandCollectionRCCL, App_Web_dzryruu3" title="Demand Collection Region Customer Code Level" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="tab-pane fade in active show" id="tab1">
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Debt Collector Performance Report">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlDemand" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ErrorMessage="Select Line of Business."
                                        ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="ddlLOB"
                                        InitialValue="-1" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlRegion" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblRegion" Text="Branch" CssClass="styleMandatoryLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlBranch" runat="server"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblBranch" Text="Branch" CssClass="styleMandatoryLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtReportDate" AutoPostBack="false" runat="server"
                                    OnTextChanged="txtReportDate_TextChanged"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <asp:Image ID="imgReportDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtReportDate" PopupButtonID="imgReportDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvReportDate" runat="server" ErrorMessage="Select Report Date." ValidationGroup="Ok"
                                        Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtReportDate" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblReportDate" CssClass="styleReqFieldLabel" Text="Report Date"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlDenomination" runat="server"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Denomination" ID="lblDenomination" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlGroupingCriteria" runat="server" GroupingText="Grouping Criteria"
                    CssClass="stylePanel" Width="99%">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox ID="chkCustomerCodeLevel" runat="server" AutoPostBack="true"
                                    OnCheckedChanged="chkCustomerCodeLevel_CheckedChanged" />
                                <span class="highlight"></span>
                                <span class="bar"></span>

                                <asp:Label ID="lblCustomerCodeLevel" runat="server" Text="Customer Code level" CssClass="styleFieldLabel" Height="25%">
                                </asp:Label>

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox ID="ChkCustomerGroupCodeLevel" runat="server" AutoPostBack="true"
                                    OnCheckedChanged="ChkCustomerGroupCodeLevel_CheckedChanged" />
                                <span class="highlight"></span>
                                <span class="bar"></span>

                                <asp:Label ID="lblCustomerGroupCodeLevel" runat="server" Text="Customer Group Code level" CssClass="styleFieldLabel">
                                </asp:Label>

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox ID="ChkAccountLevel" runat="server" AutoPostBack="true"
                                    OnCheckedChanged="ChkAccountLevel_CheckedChanged" />
                                <span class="highlight"></span>
                                <span class="bar"></span>

                                <asp:Label ID="lblAccountLevel" runat="server" Text="Account level" CssClass="styleFieldLabel">
                                </asp:Label>

                            </div>
                        </div>
                    </div>
                </asp:Panel>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="PnlDemandData" runat="server" GroupingText="Demand Data" CssClass="stylePanel" Width="100%">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlFinacialYearBase" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlFinacialYearBase_SelectedIndexChanged" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years "></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlFromYearMonthBase" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlFromYearMonthBase_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlFromYearMonthBase" runat="server"
                                        ErrorMessage="Select From Year Month." ValidationGroup="Ok" Display="Dynamic"
                                        SetFocusOnError="True" ControlToValidate="ddlFromYearMonthBase" InitialValue="0"
                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblFromYearMonthBase" runat="server" Text="From Year Month" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlToYearMonthBase" runat="server"
                                    OnSelectedIndexChanged="ddlToYearMonthBase_SelectedIndexChanged" AutoPostBack="true"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlToYearMonthBase" runat="server"
                                        ErrorMessage="Select To Year Month." ValidationGroup="Ok" Display="Dynamic"
                                        SetFocusOnError="True" ControlToValidate="ddlToYearMonthBase" InitialValue="0"
                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblToYearMonthBase" runat="server" Text="To Year Month" CssClass="styleReqFieldLabel"> </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div style="display: none" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlFinancialYearCompare" runat="server" Visible="false"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlFinancialYearCompare_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblFinancialYearCompare" Visible="false" runat="server" Text="Financial Years "></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div style="display: none" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlFromYearMonthCompare" Visible="false" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlFromYearMonthCompare_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblFromYearMonthCompare" Visible="false" runat="server" Text="From Year Month"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div style="display: none" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlToYearMonthCompare" runat="server" Visible="false" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlToYearMonthCompare_SelectedIndexChanged" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblToYearMonthCompare" runat="server" Visible="false" Text="To Year Month"> </asp:Label>
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
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblCurrency" runat="server" Text="" Width="100%">
                </asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="PnlDemandCollectionCusomerCodeLevel" runat="server" GroupingText="Debt Collector Performance Details" CssClass="stylePanel" Width="100%">
                    <div id="divDemand" runat="server" style="overflow: auto; height: 300px; display: none">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvDemandCollectionCustomerCodeLevel" runat="server"
                                        Width="100%" AutoGenerateColumns="false"
                                        RowStyle-HorizontalAlign="Center" ShowFooter="true">
                                        <Columns>
                                            <%--  <asp:TemplateField HeaderText="Frequency" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblFrequency" runat="server" Text='<%# Bind("Frequency") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text="Total" align="center"></asp:Label>
                                    </FooterTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="center" />
                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Demand Month" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDemandMonth" runat="server" Text='<%# Bind("DemandMonth") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text="Grand Total"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LOB" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LineOfBusiness") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Region" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRegion" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerCode" runat="server"
                                                        Text='<%# Bind("CustomerName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Group Name"
                                                ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerGroupCode" runat="server"
                                                        Text='<%# Bind("CustomerGroupCode") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No"
                                                ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimeAccountNo" runat="server"
                                                        Text='<%# Bind("PrimeAccountNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <asp:Label ID="lblSubAccountNo" runat="server" 
                                        Text='<%# Bind("SubAccountNo") %>'></asp:Label>
                                </ItemTemplate>                               
                                <ItemStyle HorizontalAlign="Left" />                              
                            </asp:TemplateField>  --%>
                                            <asp:TemplateField HeaderText="Debt Collector" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDebtColl" runat="server"
                                                        Text='<%# Bind("DebtCollector") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opening Demand"
                                                ItemStyle-HorizontalAlign="right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOpeningDemand" runat="server"
                                                        Text='<%# Bind("OpeningDemand") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotOpeningDemand" runat="server" align="right"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opening Collection"
                                                ItemStyle-HorizontalAlign="right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOpeningCollection" runat="server"
                                                        Text='<%# Bind("OpeningCollection") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotOpeningCollection" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debt Collector Performance %"
                                                ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOpeningPercentage" runat="server"
                                                        Text='<%# Bind("OpeningPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotOpeningPercentage" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Monthly Demand"
                                                ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPeriodDemand" runat="server"
                                                        Text='<%# Bind("MonthlyDemand") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotMonthlyDemand" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Monthly Collection"
                                                ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPeriodCollection" runat="server"
                                                        Text='<%# Bind("MonthlyCollection") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotMonthlyCollection" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debt Collector Performance %"
                                                ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPeriodPercentage" runat="server"
                                                        Text='<%# Bind("MonthlyPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotMonthlyPercentage" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DC Target" ItemStyle-HorizontalAlign="right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClosingDemand" runat="server"
                                                        Text='<%# Bind("ClosingDemand") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotClosingDemand" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DC Collection"
                                                ItemStyle-HorizontalAlign="right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClosingCollection" runat="server"
                                                        Text='<%# Bind("ClosingCollection") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotClosingCollection" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Debt Collector Performance %"
                                                ItemStyle-HorizontalAlign="right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClosingPercentage" runat="server"
                                                        Text='<%# Bind("ClosingPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotClosingPercentage" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="right" />
                                                <FooterStyle HorizontalAlign="right" />
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
            <button class="css_btn_enabled" id="BtnPrint" onserverclick="BtnPrint_Click" runat="server"
                type="button" causesvalidation="true" accesskey="P" title="Go,Alt+P">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ID="vsDemandCollection" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true"
                    HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
            </div>
        </div>








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



            //    function fnScaleFactorX() {
            //    var nScaleFactor = screen.deviceXDPI / screen.logicalXDPI;
            //    return nScaleFactor; 

        </script>
        <style type="text/css">
            .Freezing
            {
                position: relative;
                top: auto;
                z-index: auto;
            }
        </style>
    </div>
</asp:Content>






