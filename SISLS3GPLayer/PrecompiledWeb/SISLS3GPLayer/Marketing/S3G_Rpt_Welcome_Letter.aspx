<%@ page title="Welcome Letter Generation" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3G_Rpt_Welcome_Letter, App_Web_ct41cc2n" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="Welcome Letter Generation" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <UC:Suggest ID="ddlLocationcode" runat="server" ServiceMethod="GetBranchCode" OnItem_Selected="ddlLocationcode_OnSelectedIndexChanged"
                                    AutoPostBack="true" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="Go" ErrorMessage="Select Location Code" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblLocationname" CssClass="styleReqFieldLabel" Text="Location Name"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <UC:Suggest ID="ddlAccountNo" runat="server" ServiceMethod="GetAccounts" OnItem_Selected="ddlAccountNo_OnSelectedIndexChanged"
                                    AutoPostBack="true" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="Go"
                                    ErrorMessage="Select Account No" Enabled="false" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblAccountNo" Text="Account No" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtStartDateSearch" runat="server"
                                    AutoPostBack="True" onmouseover="txt_MouseoverTooltip(this)"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <asp:Image ID="imgStartDate" runat="server" Visible="false" />
                                <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                    PopupButtonID="imgStartDate" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvFromdate" runat="server" ControlToValidate="txtStartDateSearch"
                                        Display="Dynamic" ErrorMessage="Select Start Date" SetFocusOnError="True"
                                        ValidationGroup="Go" CssClass="validation_msg_box_sapn" />
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="From Date" ID="lblStartDateSearch" CssClass="styleReqFieldLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="True"
                                    onmouseover="txt_MouseoverTooltip(this)"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <asp:Image runat="server" ID="imgEndDate" Visible="false" />
                                <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                    PopupButtonID="imgEndDate" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvenddate" runat="server" ControlToValidate="txtEndDateSearch"
                                        Display="Dynamic" ErrorMessage="Select End Date" SetFocusOnError="True"
                                        ValidationGroup="Go" CssClass="validation_msg_box_sapn" />
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblEndDateSearch" Text="To Date" CssClass="styleReqFieldLabel" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtCustomername" runat="server" ReadOnly="true"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblCustomername" Text="Customer Name"></asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
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
                <asp:Panel ID="pnlWelcome" runat="server" CssClass="stylePanel" GroupingText="Account Details"
                    Width="100%" Visible="false">
                    <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvWelcome" runat="server" AutoGenerateColumns="False"
                                    CssClass="styleInfoLabel" Width="99%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Customer Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCustName" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Customer Name"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAccount" runat="server" Text='<%# Bind("PANUM") %>' ToolTip="Account No"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Finance Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFinAmt" runat="server" Text='<%# Bind("FINANCE_AMOUNT") %>' ToolTip="Finance Amount"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Finance Charges">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFincharge" runat="server" Text='<%# Bind("UMFC") %>' ToolTip="Finance Charges"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSel" AutoPostBack="true"
                                                    runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                type="button" accesskey="P" visible="false">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary runat="server" ID="vsWelcome" HeaderText="Please correct the following validation(s):"
                    CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="Go" ShowSummary="true" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="CVWelcome" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
            </div>
        </div>
    </div>
</asp:Content>












