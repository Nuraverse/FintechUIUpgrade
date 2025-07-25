<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_RPT_Repayment_Schedule, App_Web_u0nem2mh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <cc1:ComboBox ID="ddlFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                        AutoPostBack="true"
                                        AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="ddlFunder_OnSelectedIndexChanged">
                                    </cc1:ComboBox>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="ddlFunder"
                                            InitialValue="--Select--" ErrorMessage="Select Funder" Display="Dynamic" SetFocusOnError="True"
                                            ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblFunder" CssClass="styleReqFieldLabel" Text="Funder"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox runat="server"  ID="txtDate"
                                        AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDate"
                                        PopupButtonID="txtDate" ID="CalDate" Enabled="True">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate"
                                            ErrorMessage="Select Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                            CssClass="validation_msg_box_sapn" />
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblDate" Text="As On Date" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlNatureofFund" onmouseover="ddl_itemchanged(this)" runat="server"
                                        AutoPostBack="true" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                            CssClass="styleReqFieldLabel" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkReceiptPrint" runat="server" AutoPostBack="true" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <asp:Label runat="server" ID="lblReceiptPrint" Text="Payment Details" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkfunder" runat="server" AutoPostBack="true"
                                        OnCheckedChanged="chkfunder_OnCheckedChanged" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <asp:Label runat="server" ID="lblfund" Text="Funder Sort" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkdate" Checked="true" runat="server" AutoPostBack="true" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <asp:Label runat="server" ID="lblsortdate" Text="Date Sort" />
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                    type="button" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear the Details[Alt+L]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_ServerClick" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" visible="false" id="btnCancel" title="Exit[Alt+X]"
                    causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlDetails" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Repayment Schedule Details">
                        <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: none">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                            CssClass="gird_details" Width="100%" ShowFooter="true" ShowHeader="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>' ToolTip="Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Deal Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDealnumber" runat="server" Text='<%# Bind("Deal_Number") %>' ToolTip="Deal_Number"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Funder Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFundername" runat="server" Text='<%# Bind("Funder_name") %>' ToolTip="Funder name"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Nature of Fund">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNatoffund" runat="server" Text='<%# Bind("Nature_Of_Fund") %>' ToolTip="Nature of Fund"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tranche">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTranche" runat="server" Text='<%# Bind("Tranche") %>' ToolTip="Tranche"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sanction Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSanctionNumber" runat="server" Text='<%# Bind("Sanction_number") %>' ToolTip="Sanction number"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Due Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDueamount" runat="server" Text='<%# Bind("Due_Amount1") %>' ToolTip="Due Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblDueamountTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Interest Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDueamountI" runat="server" Text='<%# Bind("int_pay_amt1") %>' ToolTip="Due Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblDueamountItotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Currency">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcurrency" runat="server" Text='<%# Bind("Currency") %>' ToolTip="Currency"></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Base Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblbaserate" runat="server" Text='<%# Bind("Base_Rate1") %>' ToolTip="Base Rate"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblbaseratetotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Spread Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblspreadrate" runat="server" Text='<%# Bind("Spread_Rate1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblspreadratetotal" runat="server" ToolTip="sum of  Balance amount" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="COF%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcof" runat="server" Text='<%# Bind("COF1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblcoftotal" runat="server" ToolTip="sum of  Balance amount" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Payment Reference">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblreceiptref" runat="server" Text='<%# Bind("JV_No") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Payment Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblreceiptdate" runat="server" Text='<%# Bind("payment_Date") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Payment Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblreceiptAmount" runat="server" Text='<%# Bind("Payment_Amount1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblreceiptAmounttotal" runat="server" ToolTip="sum of  Balance amount" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Interest Payment Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblreceiptAmountI" runat="server" Text='<%# Bind("int_pay_amt1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblreceiptAmountItotal" runat="server" ToolTip="sum of  Balance amount" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
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
            <div align="right">
                <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                    type="button" accesskey="P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
                <button class="css_btn_enabled" id="btnEmail" title="Email[Alt+M]" causesvalidation="false" runat="server"
                    type="button" accesskey="M" visible="false">
                    <i class="fa fa-envelope" aria-hidden="true"></i>&emsp;E<u>m</u>ail
                </button>
                <button class="css_btn_enabled" style="display:none" id="btnexcel" runat="server"
                    type="button" caccesskey="E" title="Excel,Alt+E" visible="false">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsDealinflow" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                        ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                        CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                        HeaderText="Correct the following validation(s):" />
                    <asp:CustomValidator ID="cvDealInflow" runat="server" CssClass="styleMandatoryLabel"
                        Enabled="true" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>


