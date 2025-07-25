<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptDisbursementReport, App_Web_prcfklo5" title="Disbursement Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upd1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btndtlExcel" />
        </Triggers>
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Disbursement Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel runat="server" ID="PnlDisbursementreport" CssClass="stylePanel" GroupingText="INPUT CRITERIA"
                                Width="100%">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkAbstract" runat="server" Checked="true" OnCheckedChanged="chkAbstract_CheckedChanged" AutoPostBack="true" ToolTip="Abstract" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label ID="lblAbstract" runat="server" CssClass="styleDisplayLabel" Text="Abstract" ToolTip="Abstract"></asp:Label>

                                            <asp:CheckBox ID="chkDetailed" runat="server" OnCheckedChanged="chkDetailed_CheckedChanged" AutoPostBack="true" ToolTip="Detailed" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <asp:Label ID="lblDetailed" runat="server" CssClass="styleDisplayLabel" Text="Detailed" ToolTip="Detailed"></asp:Label>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblDisbursementReport" runat="server" CssClass="styleDisplayLabel" Text="Disbursement Report" ToolTip="Disbursement Report"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                AutoPostBack="True" ValidationGroup="Header" ToolTip="Line of Business" class="md-form-control form-control">
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
                                            <asp:DropDownList ID="ddlRegion" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                                OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" ToolTip="Location1" class="md-form-control form-control">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblregion" runat="server" CssClass="styleDisplayLabel" Text="Location1" ToolTip="Location1"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlbranch" runat="server" AutoPostBack="True"
                                                ValidationGroup="Header" ToolTip="Location2" class="md-form-control form-control">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblbranch" runat="server" CssClass="styleDisplayLabel" Text="Location2" ToolTip="Location2"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" ValidationGroup="Header"
                                                ToolTip="Product" class="md-form-control form-control">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblProduct" runat="server" Text="Product" CssClass="styleDisplayLabel" ToolTip="Product"></asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <input id="hidDate" runat="server" type="hidden" />
                                            <asp:TextBox ID="txtStartDateSearch" runat="server" OnTextChanged="txtStartDateSearch_TextChanged"
                                                AutoPostBack="true" ToolTip="Start Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDateSearch"
                                                    ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select Start Date"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleDisplayLabel" Text="Start Date" ToolTip="Start Date" />
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <asp:TextBox ID="txtEndDateSearch" runat="server" OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="true" ToolTip="End Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="Dynamic" ControlToValidate="txtEndDateSearch"
                                                    ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select End Date"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleDisplayLabel" Text="End Date" ToolTip="End Date" />
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">

                                            <uc2:Suggest ID="ddlMarkettingOfficer" runat="server" ServiceMethod="GetSalePersonList" 
                                                  class="md-form-control form-control"/>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblMarkettingOfficer" runat="server" Text="Marketing Officer" CssClass="styleDisplayLabel" ToolTip="Marketing Officer"></asp:Label>
                                            </label>

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
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblAmounts" runat="server" Text="[All amounts are in" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                            <asp:Label ID="lblCurrency" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="PnlAbstract" runat="server" CssClass="stylePanel" GroupingText="Abstract Report">
                                <div id="divAbstract" runat="server" style="overflow: scroll; height: 200px; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvAbstract" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="styleInfoLabel" ShowFooter="true" Style="margin-bottom: 0px" Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Line Of Business">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOBGA" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line Of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField HeaderText="Region">
                                <ItemTemplate>
                                    <asp:Label ID="lblRegion" runat="server" Text='<%# Bind("Region") %>' ToolTip="Region"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Location">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchGA" runat="server" Text='<%# Bind("Branch") %>' ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Product">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProductGA" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Approved Amount" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblApprovedAmountA" runat="server" Style="text-align: right" Text='<%# Bind("ApprovedAmount") %>' ToolTip="Approved Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFApprovedAmountA" runat="server" ToolTip="sum of  Approved Amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Paid Amount" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaidAmountA" runat="server" Style="text-align: right" Text='<%# Bind("PaidAmount") %>' ToolTip="Paid Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFPaidAmountA" runat="server" ToolTip="sum of  Paid Amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remaining Amount" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRemainingAmountA" runat="server" Style="text-align: right" Text='<%# Bind("RemainingAmount") %>' ToolTip="Remaining Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFRemainingAmountA" runat="server" ToolTip="sum of  Remaining Amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account Not Yet Created " ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountYetToBeCreatedA" runat="server" Style="text-align: right" Text='<%# Bind("AccountYetToBeCreated") %>' ToolTip="Account Yet To Be Created"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblFAccountYetToBeCreatedA" runat="server" ToolTip="sum of Account Yet to be Created Amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Ageing 0-30 Days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblageing0days" runat="server" Style="text-align: right" Text='<%# Bind("ageing0days") %>' ToolTip="Ageing0-30Days"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblageing0daysf" runat="server" ToolTip="sum of Ageing 0-30 Days"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Ageing 31-60 days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblageing30days" runat="server" Style="text-align: right" Text='<%# Bind("ageing30days") %>' ToolTip="Ageing31-60days"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblageing30daysf" runat="server" ToolTip="sum of Ageing 31-60 Days"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Ageing Above 60 days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblageing60days" runat="server" Style="text-align: right" Text='<%# Bind("ageing60days") %>' ToolTip="Ageing61-90days"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblageing60daysf" runat="server" ToolTip="sum of Ageing 61-90 Days"></asp:Label>
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
                            <asp:Panel ID="PnlDetailedView" runat="server" CssClass="stylePanel" GroupingText="Detailed Report">
                                <div id="divDetails" runat="server" style="overflow: scroll; height: 200px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="GrvDetails" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                    CssClass="styleInfoLabel" Style="margin-bottom: 0px" Width="100%">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="Line Of Business">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOBGD" runat="server" Text='<%# Bind("LINE_OF_BUSINESS") %>' ToolTip="Line Of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <%--   <asp:TemplateField HeaderText="Region">
                                <ItemTemplate>
                                    <asp:Label ID="lblRegionGD" runat="server" Text='<%# Bind("Region") %>' ToolTip="Region"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                            </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Location">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchGD" runat="server" Text='<%# Bind("LOCATION") %>' ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Product">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblProductGD" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Application No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblApplicationNo" runat="server" Text='<%# Bind("APPLICATION_NO") %>' ToolTip="Application No"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer" runat="server" Text='<%# Bind("CUSTOMER") %>' ToolTip="Customer"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrimeAccount" runat="server" Text='<%# Bind("Account_No") %>' ToolTip="Account No"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Asset Cost" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAssetCost" runat="server" Text='<%# Bind("ASSET_COST") %>' ToolTip="Asset Cost"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount Financed" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAmount_Financed" runat="server" Text='<%# Bind("Amount_Financed") %>' ToolTip="Amount Financed"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tenure" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTenure" runat="server" Text='<%# Bind("TENURE") %>' ToolTip="Tenure"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Marketing Officer" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMofficer" runat="server" Text='<%# Bind("MARKETING_OFFICER") %>' ToolTip="Marketing Officer"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Rate of Interest" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRateOfInt" runat="server" Text='<%# Bind("Rate_of_Interest") %>' ToolTip="Marketing Officer"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Company IRR" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCompanyIRR" runat="server" Text='<%# Bind("COMPANY_IRR") %>' ToolTip="Marketing Officer"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Approved Amount" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblApprovedAmountGD" runat="server" Style="text-align: right" Text='<%# Bind("APPROVED_AMOUNT") %>' ToolTip="Approved Amount"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Paid Amount" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPaidAmountGD" runat="server" Style="text-align: right" Text='<%# Bind("PAID_AMOUNT") %>' ToolTip="Paid Amount"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remaining Amount" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRemainingAmountGD" runat="server" Style="text-align: right" Text='<%# Bind("REMAINING_AMOUNT") %>' ToolTip="Remaining Amount"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account Not Yet Created" ItemStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountYetToBeCreatedGD" runat="server" Style="text-align: right" Text='<%# Bind("ACCOUNT_YET_AMOUNT") %>' ToolTip="Account Yet To Be Created"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Ageing 0-30 Days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblageing0days" runat="server" Style="text-align: right" Text='<%# Bind("AGEING_0_DAYS") %>' ToolTip="Ageing0-30Days"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Ageing 31-60 days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblageing30days" runat="server" Style="text-align: right" Text='<%# Bind("AGEING_30_DAYS") %>' ToolTip="Ageing31-60days"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Ageing Above 60 days">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblageing60days" runat="server" Style="text-align: right" Text='<%# Bind("AGEING_60_DAYS") %>' ToolTip="Ageing61-90days"></asp:Label>
                                                            </ItemTemplate>

                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" />

                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                    <uc1:PageNavigator ID="ucCustomPagingDet" runat="server"></uc1:PageNavigator>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                            type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" visible="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btndtlExcel" onserverclick="btndtlExcel_Click" runat="server"
                            type="button" causesvalidation="true" accesskey="E" title="Excel,Alt+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                                ShowSummary="true" ValidationGroup="btnGo" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="CVDisbursement" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
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

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
        }

    </script>
</asp:Content>













