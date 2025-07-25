<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptPricing, App_Web_zznul5le" title="Pricing Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="CheckList Report">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlInward" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                    Width="100%">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" CausesValidation="true"
                                    OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line of Business"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select Line of Business"
                                        Display="Dynamic" ValidationGroup="Go">
                                    </asp:RequiredFieldValidator>
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
                                <asp:DropDownList ID="ddlLoc1" runat="server" AutoPostBack="true" CausesValidation="true"
                                    ToolTip="Location1" CssClass="WindowsStyle"
                                    OnSelectedIndexChanged="ddlLoc1_SelectedIndexChanged" class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvLoc1" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlLoc1" InitialValue="0" ErrorMessage="Select Branch" Display="Dynamic"
                                        ValidationGroup="Go">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Location1" ID="lblLoc1" CssClass="styleReqFieldLabel"
                                        ToolTip="Location1">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLoc2" runat="server" CausesValidation="true"
                                    ToolTip="Location2" CssClass="WindowsStyle" class="md-form-control form-control">
                                </asp:DropDownList>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Location2" ID="lblLoc2" CssClass="styleDisplayLabel"
                                        ToolTip="Location2">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlDenomination" runat="server" ToolTip="Denomination"
                                    CssClass="WindowsStyle" class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvDenomination" CssClass="validation_msg_box_sapn" runat="server"
                                        ControlToValidate="ddlDenomination" InitialValue="0" ErrorMessage="Select Denomination"
                                        Display="Dynamic" ValidationGroup="Go">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblDenomination" runat="server" Text="Denomination" CssClass="styleReqFieldLabel"
                                        ToolTip="Denomination">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtStartDate" runat="server" ToolTip="Start Date"
                                    class="md-form-control form-control login_form_content_input requires_true" autocomplete="off"></asp:TextBox>
                                <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender runat="server" TargetControlID="txtStartDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgStartDate" ID="CalendarExtender1">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Select Start Date"
                                        ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Start Date" ID="lblStartDate" CssClass="styleReqFieldLabel"
                                        ToolTip="Start Date">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEndDate" runat="server" ToolTip="End Date" autocomplete="off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender runat="server" TargetControlID="txtEndDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgEndDate" ID="CalendarExtender2">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Select End Date"
                                        ValidationGroup="Go" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate"
                                        CssClass="validation_msg_box_sapn">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel"
                                        ToolTip="End Date">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlCustomerType" runat="server" ToolTip="Customer Type"
                                    CssClass="WindowsStyle" class="md-form-control form-control">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Customer Type" ID="lblCustomerType" CssClass="styleDisplayLabel"
                                        ToolTip="Cutsomer Type">
                                    </asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnGo" onserverclick="btnOk_Click" validationgroup="Go" runat="server"
                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
            </button>
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
            <button class="css_btn_enabled" id="BtnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="BtnPrint_Click" runat="server"
                type="button" accesskey="P" visible="false">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlPricingDet" runat="server" CssClass="stylePanel" GroupingText="CheckList Report Details" Visible="false">
                    <div id="divPricing" runat="server" class="gird" style="height: 400px;">
                        <asp:GridView ID="grvPricingDet" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                            CssClass="styleInfoLabel" ShowFooter="true" ShowHeader="true" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Checklist Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCheckListStatus" runat="server" Text='<%# Bind("CheckListStatus") %>' ToolTip="Checklist Process status"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Checklist Date" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOffDate" runat="server" Text='<%# Bind("OFFER_DATE") %>' ToolTip="Checklist Date"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustName" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Customer Name"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CheckList Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOffNum" runat="server" Text='<%# Bind("OFFER_NUMBER") %>' ToolTip="CheckList Number"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Round No." Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoundNo" runat="server" Text='<%# Bind("ROUND_NO") %>' ToolTip="Round No."></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Valid Till" HeaderStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOffVldTl" runat="server" Text='<%# Bind("OFFER_VALID_TILL") %>' ToolTip="Valid Till"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Grand Total" Font-Bold="true"></asp:Label>
                                    </FooterTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Facility Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFacAmt" runat="server" Text='<%# Bind("FACILITY_AMOUNT1") %>' ToolTip="Facility Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotFacAmt" runat="server" ToolTip="Sum of Facility Amount" Font-Bold="true"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Credit Score" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalCreditScore" runat="server" Text='<%# Bind("Total_Credit_Score") %>' ToolTip="Total Credit Score"></asp:Label>
                                    </ItemTemplate>

                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cust. Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustomerType" runat="server" Text='<%# Bind("Customer_Type") %>' ToolTip="Customer Type"></asp:Label>
                                    </ItemTemplate>

                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <%--  <asp:TemplateField Visible="false" HeaderText="RV Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRVAmt" runat="server" Text='<%# Bind("RV_AMOUNT1") %>' ToolTip="RV Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotRVAmt" runat="server" ToolTip="Sum of RV Amount"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField Visible="false" HeaderText="LAN">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLAN" runat="server" Text='<%# Bind("LAN") %>' ToolTip="LAN"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField Visible="false" HeaderText="LAN Depreciation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLANDep" runat="server" Text='<%# Bind("LAN_DEPRECIATION") %>' ToolTip="LAN Depreciation"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Margin Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMrgnAmt" runat="server" Text='<%# Bind("MARGIN_AMOUNT1") %>' ToolTip="Margin Amount"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotMrgnAmt" runat="server" ToolTip="Sum of Margin Amount" Font-Bold="true"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tenure">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTenure" runat="server" Text='<%# Bind("TENURE") %>' ToolTip="Tenure"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Scheme">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTenure" runat="server" Text='<%# Bind("PRODUCT") %>' ToolTip="Scheme"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No of PDC">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNoofPDC" runat="server" Text='<%# Bind("NO_OF_PDC") %>' ToolTip="No of PDC"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PDC Start Date" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPDCStartDate" runat="server" Text='<%# Bind("PDC_STARTDATE") %>' ToolTip="PDC Start Date"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Insurance By">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInsuranceBy" runat="server" Text='<%# Bind("Insurance_By") %>' ToolTip="Insurance By"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Insurance Coverage">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInsuranceCoverage" runat="server" Text='<%# Bind("Insurance_Coverage") %>' ToolTip="Insurance Coverage"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Authorized on">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAuthorizedon" runat="server" Text='<%# Bind("AUTHORIZE_ON") %>' ToolTip="Authorized on"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <%--  <asp:TemplateField HeaderText="Sales Person">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalesPerson" runat="server" Text='<%# Bind("SALES_PERSON") %>' ToolTip="Sales Person"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Source">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSource" runat="server" Text='<%# Bind("Source_Name") %>' ToolTip="Source"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <%--    <asp:TemplateField HeaderText="Book Depreciation %" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBookDepPer" runat="server" Text='<%# Bind("BOOK_DEP_PER") %>' ToolTip="Book Depreciation %"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Company IRR" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompIRR" runat="server" Text='<%# Bind("COMPANY_IRR1") %>' ToolTip="Company IRR"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblTotCompIRR" runat="server" ToolTip="Average of Company IRR"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <%-- <button class="css_btn_enabled" id="BtnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="BtnPrint_Click" runat="server"
                type="button" accesskey="P" visible="false">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>--%>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ID="VSPricing" runat="server" CssClass="styleMandatoryLabel" Visible="false"
                    CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Go" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="cvPricing" runat="server" CssClass="styleMandatoryLabel" Display="None" Enabled="true" />
            </div>
        </div>
    </div>
</asp:Content>




















