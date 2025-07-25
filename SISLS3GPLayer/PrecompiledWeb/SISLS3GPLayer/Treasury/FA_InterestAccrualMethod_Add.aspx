<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" enableeventvalidation="false" autoeventwireup="true" inherits="Financial_Accounting_FA_InterestAccrualMethod_Add, App_Web_zogfwrp2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upIntMthd" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">

                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlActivity" runat="server" ToolTip="Activity"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity" CssClass="validation_msg_box_sapn"
                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                    ErrorMessage="Select Activity" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Activity" ID="lblActivity" CssClass="styleReqFieldLabel"
                                                    ToolTip="Activity"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDate" runat="server" ToolTip="Date" ReadOnly="true" AutoPostBack="true" onmouseover="txt_MouseoverTooltip(this)"
                                                OnTextChanged="txtDate_OnTextChanged" class="md-form-control form-control login_form_content_input requires_true" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="txtDate"
                                                ID="caldate" Enabled="false">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvdate" runat="server" ControlToValidate="txtDate"
                                                    ErrorMessage="Select  Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Main"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDate" Text="Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvlocation" runat="server" ControlToValidate="ddlLocation"
                                                    InitialValue="--select--" ErrorMessage="Select Branch" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="Main" CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" Text="Branch" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFundType" onmouseover="ddl_itemchanged(this)" runat="server"
                                                AutoPostBack="false" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVFundType" CssClass="validation_msg_box_sapn"
                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlFundType" InitialValue="0"
                                                    ErrorMessage="Select Funder Type" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblFunderType" ToolTip="Funder Type" runat="server" Text="Funder Type"
                                                    CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCode" ToolTip="Funder Code" runat="server" Style="display: none;"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code" />
                                            <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                CausesValidation="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ToolTip="Funder" Text="Funder" ID="Label1" CssClass="styleMandatoryLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtfunderdate" runat="server" Visible="false" ToolTip="Funderdate"
                                                class="md-form-control form-control login_form_content_input requires_true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblfunderdate" Visible="false" Text="Funder Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkIRSTransaction" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label runat="server" ToolTip="IRS Transaction" Text="IRS Transaction" ID="lblIRSTransaction" CssClass="styleMandatoryLabel"></asp:Label>

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="center">

                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Main" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go, Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                          
                        </button>
                        <asp:ImageButton ID="btnPrint" CssClass="styleSubmitButton" ImageUrl="~/Images/ExcelExport10.png"
                            Width="22px" Height="22px" runat="server" OnClick="btnPrint_Click" ToolTip="Export to Excel,Alt+P" AccessKey="P" />
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlLaoding" runat="server" GroupingText="Details" CssClass="stylePanel">
                                <asp:Panel ID="pnlDetail" runat="server" GroupingText="" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="grid">
                                                <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                    OnRowDataBound="gvDetail_RowDataBound" Width="99%">
                                                    <Columns>
                                                        <%--Serial Number--%>
                                                        <asp:TemplateField HeaderText="Sl No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Funder Tran Id--%>
                                                        <asp:TemplateField HeaderText="Funder Tran Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranid" runat="server" Text='<%#Eval("Funder_Tran_ID") %>' ToolTip="Funder Reference Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFunder_Name" runat="server" Text='<%#Eval("Funder_Name") %>' ToolTip="Funder Name" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Deal No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeal_No" runat="server" Text='<%#Eval("Deal_No") %>' ToolTip="Deal No" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Funder Reference Number --%>
                                                        <asp:TemplateField HeaderText="Funder Reference Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Funder Reference Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fund Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_Type" runat="server" Text='<%#Eval("Fund_Type") %>' ToolTip="Fund Type" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder/IRS Tran No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_TRan_No" runat="server" Text='<%#Eval("Fund_TRan_No") %>'
                                                                    ToolTip="Fund Type" />
                                                                <%-- <asp:Label ID="lblIRSLinkKey" Visible="false" runat="server" Text='<%#Eval("IRS_LINK_KEY") %>'--%>
                                                                <%--/>--%>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Total" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount Outstanding">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAmountOutstanding" runat="server" Text='<%#Eval("AmountOutstanding") %>'
                                                                    ToolTip="Amount Outstanding" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblfooterAmountOutstanding" runat="server" Text="" ToolTip="Amount Outstanding" />
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Principal Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrincipalAmount" runat="server" Text='<%#Eval("PrincipalAmount") %>'
                                                                    ToolTip="Principal Amount" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblPrincipalAmountFT" runat="server" Text='<%#Eval("PrincipalAmount") %>'
                                                                    ToolTip="Principal Amount" />

                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField HeaderText="Rate Of Interest" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblROI" runat="server" Text='<%#Eval("RateOfInterest") %>' ToolTip="Rate Of Interest" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Due Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDue_Date" runat="server" Text='<%#Eval("Due_Date") %>' ToolTip="Rate Of Interest" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Amount">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtInterestAmount" class="md-form-control form-control login_form_content_input requires_true" runat="server" Text='<%#Eval("InterestAmount") %>'
                                                                    ToolTip="Interest Amount" Style="text-align: right;" Width="90%" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtInterestAmountFT" class="md-form-control form-control login_form_content_input requires_true" Width="90%" Style="text-align: right" runat="server" Text='<%#Eval("InterestAmount") %>'
                                                                    ToolTip="Interest Amount" HorizontalAlign="Right" ReadOnly="false"/>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TDS Amount">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="lblTDS_Amount" class="md-form-control form-control login_form_content_input requires_true" Width="90%" runat="server" Text='<%#Eval("TDS_Amount") %>' Style="text-align: right;" ToolTip="TDS Amount" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtTDSAmountFT" class="md-form-control form-control login_form_content_input requires_true" Width="90%" runat="server" Style="text-align: right" Text='<%#Eval("TDS_Amount") %>'
                                                                    ToolTip="TDS Amount" HorizontalAlign="Right" ReadOnly="false"/>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fund Nature" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_Nature" runat="server" Text='<%#Eval("Fund_Nature") %>' ToolTip="Fund Nature" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tds Section" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTds_Section" runat="server" Text='<%#Eval("Tds_Section") %>' ToolTip="Tax Id" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <%--<asp:TemplateField HeaderText="Last calculated Date">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtLastCalculatedDate" runat="server" ReadOnly="true" Text='<%#Eval("LastCalculateddate") %>'
                                                                    ToolTip="Last Calculated Date"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Select All">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblselectAll" runat="server" Text="Select All" ToolTip="Select"></asp:Label>
                                                                <br />
                                                                <asp:CheckBox ID="chkAll" runat="server" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkbox" runat="server" ToolTip="Select" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="JV No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtJVNo" runat="server" Text='<%#Eval("JVNo") %>'
                                                                    ToolTip="JV No."></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkDelete" runat="server" ToolTip="Delete" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel1" runat="server" GroupingText="Details" CssClass="stylePanel">
                                <asp:Panel ID="Panel2" runat="server" GroupingText="" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="grid">
                                                <asp:GridView ID="GvPrint" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                    OnRowDataBound="gvDetail1_RowDataBound" Width="99%">
                                                    <Columns>
                                                        <%--Serial Number--%>
                                                        <asp:TemplateField HeaderText="Sl No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Funder Tran Id--%>
                                                        <asp:TemplateField HeaderText="Funder Tran Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranid" runat="server" Text='<%#Eval("Funder_Tran_ID") %>' ToolTip="Funder Reference Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Funder Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFunder_Name" runat="server" Text='<%#Eval("Funder_Name") %>' ToolTip="Funder Name" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Deal No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeal_No" runat="server" Text='<%#Eval("Deal_No") %>' ToolTip="Deal No" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--Funder Reference Number --%>
                                                        <asp:TemplateField HeaderText="Funder Reference Number">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRefNo" runat="server" Text='<%#Eval("Fund_Ref_No") %>' ToolTip="Funder Reference Number" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fund Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_Type" runat="server" Text='<%#Eval("Fund_Type") %>' ToolTip="Fund Type" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fund Tran No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_TRan_No" runat="server" Text='<%#Eval("Fund_TRan_No") %>'
                                                                    ToolTip="Fund Type" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Total" />
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount Outstanding">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAmountOutstanding" runat="server" Text='<%#Eval("AmountOutstanding") %>'
                                                                    ToolTip="Amount Outstanding" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblfooterAmountOutstanding" runat="server" Text="" ToolTip="Amount Outstanding" />
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Principal Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrincipalAmount" runat="server" Text='<%#Eval("PrincipalAmount") %>'
                                                                    ToolTip="Principal Amount" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblPrincipalAmountFT" runat="server" Text='<%#Eval("PrincipalAmount") %>'
                                                                    ToolTip="Principal Amount" />

                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField HeaderText="Rate Of Interest" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblROI" runat="server" Text='<%#Eval("RateOfInterest") %>' ToolTip="Rate Of Interest" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Due Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDue_Date" runat="server" Text='<%#Eval("Due_Date") %>' ToolTip="Rate Of Interest" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInterestAmount" runat="server" Text='<%#Eval("InterestAmount") %>'
                                                                    ToolTip="Interest Amount" Style="text-align: right;" Width="90%" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblInterestAmountFT" runat="server" Text='<%#Eval("InterestAmount") %>'
                                                                    ToolTip="Interest Amount" />
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                      <%--  <asp:TemplateField HeaderText="Rate">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtRate" runat="server" Text='<%#Eval("ROI") %>'
                                                                    ToolTip="Rate" Style="text-align: right;" Width="90%" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="TDS Amount">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTDS_Amount" Width="90%" runat="server" Text='<%#Eval("TDS_Amount") %>' Style="text-align: right;" ToolTip="TDS Amount" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTDS_AmountFT" Width="90%" runat="server" Text='<%#Eval("TDS_Amount") %>' Style="text-align: right;" ToolTip="TDS Amount" />
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Fund Nature" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFund_Nature" runat="server" Text='<%#Eval("Fund_Nature") %>' ToolTip="Fund Nature" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Tds Section" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTds_Section" runat="server" Text='<%#Eval("Tds_Section") %>' ToolTip="Tax Id" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <%--<asp:TemplateField HeaderText="Last calculated Date">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtLastCalculatedDate" runat="server" ReadOnly="true" Text='<%#Eval("LastCalculateddate") %>'
                                                                    ToolTip="Last Calculated Date"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>
                                                        <%--  <asp:TemplateField HeaderText="Select All">
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblselectAll" runat="server" Text="Select All" ToolTip="Select"></asp:Label>
                                                    <br />
                                                    <asp:CheckBox ID="chkAll" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkbox" runat="server" ToolTip="Select" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="JV No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtJVNo" runat="server" Text='<%#Eval("JVNo") %>'
                                                                    ToolTip="JV No."></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <%--    <asp:TemplateField HeaderText="Delete">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkDelete" runat="server" ToolTip="Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                         <button class="css_btn_enabled" id="btnPost" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S" causesvalidation="false" title="Post[Alt+S]" validationgroup="Main">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>P</u>ost
                    </button>
                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                        type="button" accesskey="L" title="Clear_FA,Alt+L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if( fnConfirmExit())"
                    type="button" accesskey="X" title="Exit,Alt+X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
                    </div>






                   
                    <%--<asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                            Text="Print" OnClick="btnPrint_Click" />--%>
                    <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>

                    <tr align="Left">
                        <td>
                            <asp:ValidationSummary ID="Main" runat="server" ValidationGroup="Main" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        </td>
                    </tr>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript" language="javascript">
        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }
        function fnSelectUser(grdid, chkAll, chkbox) {

            var gvDetail = document.getElementById('ctl00_ContentPlaceHolder1_pnlDetail_gvDetail');
            var TargetChildControl = chkSelectAll;
            var selectall = 0;
            var Inputs = gvDetail.getElementsByTagName("input");
            if (!chkbox.checked) {
                chkAll.checked = false;
            }
            else {
                for (var n = 0; n < Inputs.length; ++n) {
                    if (Inputs[n].type == 'checkbox') {
                        if (Inputs[n].checked) {
                            selectall = selectall + 1;
                        }
                    }
                }
                if (selectall == gvDetail.rows.length - 1) {
                    chkAll.checked = true;
                }
            }


        }
    </script>

</asp:Content>
