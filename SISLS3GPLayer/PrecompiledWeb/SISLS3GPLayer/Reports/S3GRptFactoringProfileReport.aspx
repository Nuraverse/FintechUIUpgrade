<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptFactoringProfileReport, App_Web_dzryruu3" title="Factoring Profile Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Factoring Profile Report">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel runat="server" ID="PnlHeaderDetails" CssClass="stylePanel" GroupingText="Input Criteria"
                        Width="100%">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business"
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
                                    <asp:DropDownList ID="ddlRegion" runat="server" ValidationGroup="Header"
                                        ToolTip="Location" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblregion" runat="server" Text="Location" CssClass="styleDisplayLabel" ToolTip="Location"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCutoffDateSearch" runat="server" ToolTip="Cut Off Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                        PopupButtonID="imgStartDateSearch" TargetControlID="txtCutoffDateSearch">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvcutoffdate" runat="server" ErrorMessage="Select Cutoff Date" ValidationGroup="btnGo"
                                            Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="txtCutoffDateSearch"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCutOffdate" runat="server" CssClass="styleReqFieldLabel" Text="Cutoff Date" ToolTip="CutOff Date" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <uc2:LOV ID="ucCustomerCodeLov" onblur="return fnLoadCustomer();" runat="server"
                                        strLOV_Code="CMD" />
                                    <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                        Style="display: none" /><input id="hdnCustID" type="hidden" runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" ValidationGroup="Header" ToolTip="Product"
                                        class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="LBLPRDT" runat="server" CssClass="styleDisplayLabel" Text="Product" ToolTip="Product" />
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
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="PnlDetailedView" runat="server" CssClass="stylePanel" GroupingText="Factoring Profile Details" Width="100%">
                        <asp:Label ID="LBLpay" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        <div id="divDetails" runat="server" style="overflow: scroll; height: auto;">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="GrvDetails" runat="server" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Prime Account No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblaccno" runat="server" Text='<%# Bind("Ac_No") %>' ToolTip="Account No"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Party Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpartyname" runat="server" Text='<%# Bind("Party_Name") %>' ToolTip="Party Name"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Party Sub limit ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpartylimit" runat="server" Text='<%# Bind("Party_Sub_Limit") %>' ToolTip="Party Sub limit "></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account Status ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblaccstatus" runat="server" Text='<%# Bind("Account_Status") %>' ToolTip="Account Status"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Margin Rate ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmargin_rate" runat="server" Text='<%# Bind("Margin_Rate") %>' ToolTip="Margin Rate"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Outstanding Debt ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbloutstand_debt" runat="server" Text='<%# Bind("Outstanding_Debt") %>' ToolTip="Outstanding Debt"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Regular Amount ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblregular_amt" runat="server" Text='<%# Bind("Regular_Amt") %>' ToolTip="Regular Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Over due Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbloverdue_amt" runat="server" Text='<%# Bind("Over_Due_Amt") %>' ToolTip="Over due Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Default Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldefault_amt" runat="server" Text='<%# Bind("Default_Amt") %>' ToolTip="Default Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Drawing Power">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldrawingpower" runat="server" Text='<%# Bind("Drawing_Power") %>' ToolTip="Drawing Power"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fund in Use">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblfund" runat="server" Text='<%# Bind("Fund_Use") %>' ToolTip="Fund in Use"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Maturity Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmaturitydate" runat="server" Text='<%# Bind("Maturity_Date") %>' ToolTip="Maturity Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
                    type="button" accesskey="P">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vsBranch" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                        ShowSummary="true" ValidationGroup="btnGo" />
                </div>
            </div>
            <script type="text/javascript">


                function fnLoadCustomer() {
                    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
                }


                function Resize() {
                    if (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount') != null) {
                        if (document.getElementById('divMenu').style.display == 'none') {
                            (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                        }
                        else {
                            (document.getElementById('ctl00_ContentPlaceHolder1_pnlAccount')).style.width = screen.width - 270;
                        }
                    }
                }
            </script>
        </div>
    </div>
</asp:Content>

