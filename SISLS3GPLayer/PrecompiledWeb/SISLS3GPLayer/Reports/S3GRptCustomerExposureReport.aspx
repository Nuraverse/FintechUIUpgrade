<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Reports_S3GRptCustomerExposureReport, App_Web_zznul5le" title="Customer Exposure" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function fnLoadCustomer() {
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }


    </script>
    <asp:UpdatePanel ID="updPanel" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Customer Exposure Statement">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlHeaderDetails" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlPNum" WatermarkText="--All--" AutoPostBack="true" ValidationGroup="Ok" runat="server" OnItem_Selected="ddlPNum_Item_Selected" ServiceMethod="GetAccountNo" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblPNum" CssClass="styleDisplayLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCustomerNameLease" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                        <UC6:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" ButtonVisible="true" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                            ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                            Style="display: none" />
                                        <input id="hdnCustID" type="hidden" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtCustomerNameLease" runat="server" ErrorMessage="Select the Customer"
                                                SetFocusOnError="true" ControlToValidate="txtCustomerNameLease" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Customer Name" ID="lblCustFilter" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlNID" WatermarkText="--All--" runat="server" ServiceMethod="GetNID" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblNID" CssClass="styleDisplayLabel" Text="NID" ToolTip="NID"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" ToolTip="Line of Business"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <%--  <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ErrorMessage="Select Line of Business"
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="-1"
                                                ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel" ToolTip="Line of Business">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" ToolTip="Branch"
                                            OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Branch" ID="lblBranch" ToolTip="Branch" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation2" runat="server" AutoPostBack="true" ToolTip="Location2"
                                            Enabled="false" OnSelectedIndexChanged="ddlLocation2_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Location2" ID="lblLocation2" ToolTip="Location2" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDate" AutoPostBack="true" OnTextChanged="txtStartDate_TextChanged"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtStartDate" PopupButtonID="imgStartDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Enter the As on Date."
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="As on Date" ID="lblStartDate" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDate" AutoPostBack="true" OnTextChanged="txtEndDate_TextChanged" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtEndDate"
                                            PopupButtonID="imgEndDate" ID="CalendarExtender2" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <%-- <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Enter the End Date."
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate"
                                                CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>--%>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>


                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlCustomerGroup" WatermarkText="--All--" runat="server" ServiceMethod="GetCustomerGroup" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerGroup" CssClass="styleDisplayLabel" Text="Customer Group" ToolTip="Customer Group"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButton ID="rbtnCust" Text="Customer" AutoPostBack="true" OnCheckedChanged="rbtnCust_CheckedChanged" GroupName="rbtn" runat="server"
                                            class="md-form-control form-control radio" RepeatDirection="Horizontal" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButton ID="rbtnEntity" Text="Entity" AutoPostBack="true" OnCheckedChanged="rbtnEntity_CheckedChanged" GroupName="rbtn" runat="server"
                                            class="md-form-control form-control radio" RepeatDirection="Horizontal" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <%--  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <uc2:LOV ID="ucCustomerCodeLov" TextWidth="70px" ButtonEnabled="false" onblur="return fnLoadCustomer();" runat="server" />
                                <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_OnClick"
                                    Style="display: none" /><input id="hdnCustID" type="hidden" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                </label>
                            </div>
                        </div>--%>

                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkGuar" Text="Guar" runat="server" 
                                            OnCheckedChanged="chkGuar_CheckedChanged" AutoPostBack="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                    <div style="display: none" class="md-input">
                                        <asp:CheckBox ID="chkGuarGroup" Text="GuarGroup" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkCustGroup" Text="Customer Group" runat="server" 
                                            OnCheckedChanged="chkCustGroup_CheckedChanged" AutoPostBack="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkGloExp" Text="Indirect Exposure" runat="server" 
                                            OnCheckedChanged="chkGloExp_CheckedChanged" AutoPostBack="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
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
                    <button style="display: none" class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                        type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>
                    <button class="css_btn_enabled" id="btnPdf" onserverclick="btnPdf_ServerClick" runat="server"
                        type="button" causesvalidation="true" accesskey="V" title="Pdf,Alt+V">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u></u>Pdf
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlJournalDetails" runat="server" CssClass="stylePanel" GroupingText="Customer Exposure Statement" Width="100%" Visible="false">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divJournalDetails" runat="server" style="overflow: auto; height: 300px; display: none">

                                            <asp:GridView ID="grvCustomerDetails" runat="server" Width="100%" OnRowDataBound="grvCustomerDetails_OnRowDataBound" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" CellPadding="0" CellSpacing="0" ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Agreement No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PANUM") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="First Installment Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFIRSTINSTALMENTDATE" runat="server" Text='<%# Bind("FIRST_INSTALMENT_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Last Installment Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMATURITYDATE" runat="server" Text='<%# Bind("MATURITY_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Cost">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblASSETCOST" runat="server" Text='<%# Bind("ASSETCOST") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalAssetCost" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Facility Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFacilityAmount" runat="server" Text='<%# Bind("FINANCE_AMOUNT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFacilityAmountF" runat="server" ToolTip="Total Facility Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Principal Os">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPos" runat="server" Text='<%# Bind("POS") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalPos" runat="server" ToolTip="POS"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Arrears">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblArrears" runat="server" Text='<%# Bind("Arrears") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblArrearsF" runat="server" ToolTip="Total Arrears"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fut.Due">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFutDue" runat="server" Text='<%# Bind("FUTURE_DUE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblFutDueF" runat="server" ToolTip="Future Due"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Total Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotalAmount" runat="server" Text='<%# Bind("TOTAL_AMOUNT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalAmountF" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Curr.Month Due">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCurrMonthDue" runat="server" Text='<%# Bind("CURR_MONTH_DUE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="TotallblCurrMonthDue" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Closed Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClosedDate" runat="server" Text='<%# Bind("ACCOUNT_CLOSED_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Tenure">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTenure" runat="server" Text='<%# Bind("TENURE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="WDV">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblWDV" runat="server" Text='<%# Bind("WDV") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblWDVF" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Asset Market Value">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblASSETMARKETVAL" runat="server" Text='<%# Bind("ASSET_MARKET_VAL") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblASSETMARKETVALF" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ODI Charges">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblODICharges" runat="server" Text='<%# Bind("ODI_CHARGES") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblODIChargesF" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="UMFC">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUMFC" runat="server" Text='<%# Bind("UMFC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblUMFCF" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Insurance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInsurance" runat="server" Text='<%# Bind("Insurance") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblInsuranceF" runat="server" ToolTip="Total Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Income Suspended">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIncomeSuspended" runat="server" Text='<%# Bind("INCOME_SUSPENED") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblIncomeSuspendedF" runat="server" ToolTip="Total Amount"></asp:Label>
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlSummary" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Summary" Width="100%">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtScheduleB" ReadOnly="true" Style="text-align: right" ToolTip="A)Schedule B" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="A)Schedule B" ID="lblScheduleB" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDemandRaised" ReadOnly="true" Style="text-align: right" ToolTip="B)Demand Raised" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="B)Demand Raised" ID="lblDemandRaised" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFutureDues" ReadOnly="true" Style="text-align: right" ToolTip="C)Future Dues" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="C)Future Dues" ID="lblFutureDues" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtOverDue" ReadOnly="true" Style="text-align: right" ToolTip="OverDue" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="D)Over Due" ID="lblOverDue" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtOtherCharges" ReadOnly="true" Style="text-align: right" ToolTip="E)Other Charges" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="E)Other Charges" ID="lblOtherCharges" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtPenalInterest" ReadOnly="true" Style="text-align: right" ToolTip="F)Penal Interest" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="F)Penal Interest" ID="lblPenalInterest" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMaximumLendingLimit" ReadOnly="true" Style="text-align: right" ToolTip="G)Maximum Lending Limit" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="G)Maximum Lending Limit" ID="lblMaximumLendingLimit" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCreditLimitUtilized" ReadOnly="true" Style="text-align: right" ToolTip="H)Credit Limit Utilized" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="H)Credit Limit Utilized" ID="lblCreditLimitUtilized" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtBalanceCreditLimit" ReadOnly="true" Style="text-align: right" ToolTip="I)Balance Credit Limit" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="I)Balance Credit Limit(G-H)" ID="lblBalanceCreditLimit" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtTotalUMFC" ReadOnly="true" Style="text-align: right" ToolTip="J)Total UMFC" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="J)Total UMFC" ID="lblTotalUMFC" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFundsInUse" ReadOnly="true" Style="text-align: right" ToolTip="K)Funds In Use" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="K)Funds In Use" ID="lblFundsInUse" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtTotalLIp" ReadOnly="true" Style="text-align: right" ToolTip="L)Total LIP" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="L)Total LIP" ID="lblTotalLip" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtTotalOverdue" ReadOnly="true" Style="text-align: right" ToolTip="M)TotalOverDue" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="M)TotalOverDue(D+E+F)" ID="lblTotalOverDue" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtTotalExposure" ReadOnly="true" Style="text-align: right" ToolTip="N)Total Exposure" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="N)Total Exposure(C+M-J+K-L)" ID="lblTotalExposure" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="row" style="border: thin">
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <label>
                                            <asp:Label runat="server" Text="Customer has Repaid" ID="lblCustomerhasRepaid" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>

                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtperAgainsttotalCommitmentamount" ReadOnly="true" Style="text-align: right" ToolTip="% against Total Commitment and" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="% against Total Commitment and" ID="lblperagainstCommitmentant" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtPerPastDueCommitment" ReadOnly="true" Style="text-align: right" ToolTip="% of past due Commitment" AutoPostBack="false"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="% of past due Commitment" ID="lblperagainstCommitmentand" CssClass="styleDisplayLabel">
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
                        <asp:ValidationSummary ID="vsJournal" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
            <asp:PostBackTrigger ControlID="btnPdf" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>













