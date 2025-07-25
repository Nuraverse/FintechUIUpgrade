<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_S3GRptCaseGenROPStatus, App_Web_zznul5le" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
          <%--  <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />--%>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="ROP - Case Generation Report">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel runat="server" ID="PnlRepreport" CssClass="stylePanel" GroupingText="INPUT CRITERIA" 
                            Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            AutoPostBack="True" ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
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
                                        <%--                <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" WatermarkText="--ALL--"
                                    OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                    IsMandatory="true" ErrorMessage="Select Location" />--%>
                                        <asp:DropDownList ID="ddlBranch" ToolTip="Branch" class="md-form-control form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                        <%--        <uc3:LOV ID="ucCustomerCodeLov" onblur="return fnLoadCustomer();" runat="server"
                                            strLOV_Code="CMD" />--%>
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" class="md-form-control form-control" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                            Style="display: none" />
                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                        <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%-- <asp:DropDownList ID="ddlPANUM" runat="server" OnSelectedIndexChanged="ddlPANUM_SelectedIndexChanged" AutoPostBack="True"
                                            ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
                                        </asp:DropDownList>--%>
                                        <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" ToolTip="Account Number" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                            strLOV_Code="ACC_LIVE" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblAccountNumber" CssClass="styleDisplayLabel" Text="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlReportType" runat="server" OnSelectedIndexChanged="ddlReportType_SelectedIndexChanged" AutoPostBack="True"
                                            ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlReportType"
                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Report Type"
                                                ValidationGroup="btnGo"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblReportType" runat="server" CssClass="styleReqFieldLabel" Text="Report Type" ToolTip="Report Type" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlCourt" runat="server" OnSelectedIndexChanged="ddlCourt_SelectedIndexChanged" AutoPostBack="True"
                                            ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCourtCode" runat="server" CssClass="styleDisplayLabel" Text="Court" ToolTip="Court" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDC" runat="server" OnSelectedIndexChanged="ddlDC_SelectedIndexChanged" AutoPostBack="True"
                                            ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDC" runat="server" CssClass="styleDisplayLabel" Text="Debt Collector" ToolTip="Debt Collector" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%--   <asp:DropDownList ID="ddlROPLOC" runat="server" OnSelectedIndexChanged="ddlROPLOC_SelectedIndexChanged"
                                            AutoPostBack="True" ValidationGroup="btnGo" ToolTip="Line of Business" class="md-form-control form-control">
                                             </asp:DropDownList>--%>
                                        <uc2:Suggest ID="ucFIRLocation" ToolTip="ROP Location" runat="server" ServiceMethod="GetROPLocation"
                                            class="md-form-control form-control" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblROPLocation" runat="server" CssClass="styleDisplayLabel" Text="ROP Location" ToolTip="ROP Location" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" ToolTip="Start Date" autocomplete = "off"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDateSearch"
                                                ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select From Date"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="From Date" ToolTip="From Date" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input"> 
                                        <asp:TextBox ID="txtEndDateSearch" runat="server" ToolTip="End Date" autocomplete = "off"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="Dynamic" ControlToValidate="txtEndDateSearch"
                                                ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select To Date"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="To Date" ToolTip="To Date" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div id="divCurrency" runat="server" class="row">
                    <div style="text-align: right" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:Label ID="lblCurrecny" CssClass="styleDisplayLabel" runat="server" ToolTip="Currency" AutoPostBack="true">
                            </asp:Label>
                        </div>
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
                        <asp:Panel ID="PnlDetailedView" runat="server" CssClass="stylePanel" GroupingText="Details" Width="100%">
                            <asp:Label ID="lblROP" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divDetails" runat="server" style="overflow: scroll; height: auto;">
                                            <%--  BorderWidth="2"OnRowDataBound="GrvDetails_OnRowDataBound"--%>
                                            <asp:GridView ID="GrvDetails" runat="server" AutoGenerateColumns="true" OnRowDataBound="GrvDetails_OnRowDataBound" Width="100%">
                                                <%--  <Columns>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblACCOUNTNO" runat="server" Text='<%# Bind("Pannum") %>' ToolTip="Customer"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Customer">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvCustomer" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Location">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvLOCATION" runat="server" Text='<%# Bind("Location_Name") %>' ToolTip="Asset Description"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debt Collector">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDEBTCOLLECTOR" runat="server" Text='<%# Bind("DEBT_COLLECTOR") %>' ToolTip="RepoDate"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--   <asp:TemplateField HeaderText="No of OD">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNOOVERDUE" runat="server" Text='<%# Bind("CNT_OVER") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OD Inst Amt">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOUTSTANDING" runat="server" Text='<%# Bind("Od_Instalemnt_Amt") %>' ToolTip="RepoPlace"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ODI">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgvODI" runat="server" Text='<%# Bind("Odi") %>' ToolTip="ODI"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Due">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNOOFCHEQUERTN" runat="server" Text='<%# Bind("Total_Due") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Future Due">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFutureDue" runat="server" Text='<%# Bind("Future_Due") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Bank Charge">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgvBankCharge" runat="server" Text='<%# Bind("Bank_Charges") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No of Chq rtn">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequereturns" runat="server" Text='<%# Bind("NO_CHQ_RTN") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque Amt">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeReturnAmount" runat="server" Text='<%# Bind("CHEQUE_AMOUNT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>--%>

                                                <%--         <asp:TemplateField HeaderText="Addl Chq Rtn">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddlChequeRtn" runat="server" Text='<%# Bind("Add_Chq_Rtn") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Addl Chq Rtn Chrg">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAddlChqRtnCharges" runat="server" Text='<%# Bind("Addl_Chq_Rtn_Chrges") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lblROPQuery" runat="server" Text="Details"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgbtnROPQuery" runat="server" CausesValidation="false" Text="View" OnClick="imgbtnROPQuery_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"></asp:ImageButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>--%>
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
                        <asp:Panel ID="pnlROP" runat="server" CssClass="stylePanel" GroupingText="ROP Details" Width="100%">
                            <asp:Label ID="lblROPDtls" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="div4" runat="server" style="overflow: scroll; height: auto">
                                            <asp:GridView ID="grvROP" runat="server" AutoGenerateColumns="False" BorderWidth="2" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANUMSum" runat="server" Text='<%# Bind("pannum") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCaseCode" runat="server" Text='<%# Bind("Case_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ROP Location">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblROPLocation" runat="server" Text='<%# Bind("ROP_LOCATION") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rop Case No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblROPCASENUM" runat="server" Text='<%# Bind("Rop_Case_No") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rop Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblROPCASENUM" runat="server" Text='<%# Bind("ROP_STATUS") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ROP Case Filed Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblROPFILEDDATE1" runat="server" Text='<%# Bind("Rop_Cas_Filed_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="No Cheque ROP Cheque Rtn">
                                    <ItemTemplate>
                                        <asp:Label ID="lblROPFILEDDATE" runat="server" Text='<%# Bind("Rop_Chq_Cnt") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ROP Cheque Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblROPFILEDDATE" runat="server" Text='<%# Bind("Rop_Cheque_Amt") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
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
                        <asp:Panel ID="pnlCourtDtls" runat="server" CssClass="stylePanel" GroupingText="Court Details" Width="100%">
                            <asp:Label ID="lblcourtDtls" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="div3" runat="server" style="overflow: scroll; height: auto;">
                                            <asp:GridView ID="grvCourt" runat="server" AutoGenerateColumns="False" BorderWidth="2" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANUMCort" runat="server" Text='<%# Bind("pannum") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCourtCaseCode" runat="server" Text='<%# Bind("Case_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Filed Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCourtCaseDate" runat="server" Text='<%# Bind("CASE_FILED_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status of Case">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCourtStatusofCase" runat="server" Text='<%# Bind("Case_Status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Court Level">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCOURTLEVEL" runat="server" Text='<%# Bind("Court_Level") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Court Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCOURTTYPE" runat="server" Text='<%# Bind("Court_Type") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Court Location">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbCOURTLOCATION" runat="server" Text='<%# Bind("Court_Loc") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case File No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCOURTCASENUMBER" runat="server" Text='<%# Bind("Court_Case_No") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Verdict Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCASE_VERDICT_DATE" runat="server" Text='<%# Bind("Court_Verdict_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Ordered Amt">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCASEORDEREDAMT" runat="server" Text='<%# Bind("Court_Ord_Amt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Court Ordered Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCOURTORDEREDDATE" runat="server" Text='<%# Bind("Court_Ord_Rcvd_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Exe Ord Letter Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblExeOrdLetterDate" runat="server" Text='<%# Bind("Exec_Ord_Ltr_Dt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Asset Repo Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAssetRepoDate" runat="server" Text='<%# Bind("Asset_Repo_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mor Exec Req Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMorExecReqDate" runat="server" Text='<%# Bind("Mor_Exec_Req_Dt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:TemplateField HeaderText="Court Ord No of Chq">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCourtOrdNoofChq" runat="server" Text='<%# Bind("Court_Ord_No_Chq") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                    <%-- <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCourtRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Verdict Remarks">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblVerdictRemarks" runat="server" Text='<%# Bind("Verdict_remarks") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlSummonDtls" runat="server" CssClass="stylePanel" GroupingText="Summon Details" Width="100%">
                            <asp:Label ID="lblSummondtls" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="div1" runat="server" style="overflow: scroll; height: auto;">
                                            <asp:GridView ID="grvSummon" runat="server" AutoGenerateColumns="False" BorderWidth="2" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSummonPANUMSum" runat="server" Text='<%# Bind("pannum") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSummonCaseCode" runat="server" Text='<%# Bind("Case_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Summon No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSummonSUMMONNO" runat="server" Text='<%# Bind("Summon_No") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Summon Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSUMMONDATE" runat="server" Text='<%# Bind("Summon_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Summon Details">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSUMMONDtls" runat="server" Text='<%# Bind("Summon_dtls") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
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
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlProsecution" runat="server" CssClass="stylePanel" GroupingText="Prosecution Details" Width="100%">
                            <asp:Label ID="lblProsecution" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="div2" runat="server" style="overflow: scroll; height: auto;">
                                            <asp:GridView ID="grvProsecution" runat="server" AutoGenerateColumns="False" BorderWidth="2" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProsecutionPANUMProce" runat="server" Text='<%# Bind("pannum") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Case Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProsecutionCaseCode" runat="server" Text='<%# Bind("Case_Code") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prosecution No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPROSECUTIONNO" runat="server" Text='<%# Bind("PROSECUTIONNO") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prosecution Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPROSECUTIONDAT11E" runat="server" Text='<%# Bind("Prosecution_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField HeaderText="Pros. No of Chq Rtn">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPROSECUTIONProsNoofChqRtn" runat="server" Text='<%# Bind("Pros_Cnt_Cheques") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pros_Cheq_Amt">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPROSECUTIONCheqAmt" runat="server" Text='<%# Bind("Pros_Cheq_Amt") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Right" />
                                </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Prosecution Value">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPROSECUTIONValue" runat="server" Text='<%# Bind("PROSECUTION_VAL") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Next Hearing Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNEXTHEARINGDATE" runat="server" Text='<%# Bind("NEXT_HEARING_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Prosecution Details">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNextHearingDate" runat="server" Text='<%# Bind("PROSECUTIONREMARKS") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
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
                    <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" causesvalidation="false" runat="server"
                        type="button" accesskey="P" title="Print[Alt+P]">
                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>

                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                            ShowSummary="true" ValidationGroup="btnGo" />
                    </div>
                </div>
                <script language="javascript" type="text/javascript">
                    function fnLoadCust() {
                        document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
                    }
                    function fnLoadAccount() {
                        document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
                    }

                </script>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

