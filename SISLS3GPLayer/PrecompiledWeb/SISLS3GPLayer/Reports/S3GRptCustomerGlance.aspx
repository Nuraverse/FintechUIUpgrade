<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptCustomerGlance, App_Web_zznul5le" title="Customer At a Glance" %>

<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%--Content--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleDisplayLabel"
                                    Text="Customer At a Glance-Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlHeaderDetails" runat="server" GroupingText="Input Criteria" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxLOBSearch" AutoPostBack="true" ValidationGroup="RFVPDCReminder"
                                                runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                                MaxLength="0" CssClass="md-form-control form-control" CausesValidation="true"
                                                OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged" ToolTip="Line of Business">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" ToolTip="Line of Business" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxRegion" AutoPostBack="true" runat="server" AutoCompleteMode="SuggestAppend"
                                                DropDownStyle="DropDownList" MaxLength="0" CssClass="md-form-control form-control" OnSelectedIndexChanged="ComboBoxRegion_SelectedIndexChanged"
                                                ToolTip="Location1">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Branch" ID="lblRegionSearch" CssClass="styleMandatoryLabel" ToolTip="Location1" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxProductCode" AutoPostBack="true" runat="server" AutoCompleteMode="SuggestAppend"
                                                DropDownStyle="DropDownList" MaxLength="0" CssClass="md-form-control form-control" OnSelectedIndexChanged="ComboBoxProductCode_SelectedIndexChanged" ToolTip="Product">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Scheme Name" ID="lblProductCodeSearch" CssClass="styleMandatoryLabel" ToolTip="Scheme" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="false" ToolTip="Start Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RfvStartDate" runat="server" ValidationGroup="RFVDTransLander"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Start Date"
                                                    SetFocusOnError="True" ControlToValidate="txtStartDateSearch">RfvStartDate</asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleReqFieldLabel" ToolTip="Start Date" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="false" ToolTip="End Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                            <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                                PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RfvEndDate" runat="server" ValidationGroup="RFVDTransLander"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select End Date"
                                                    SetFocusOnError="false" ControlToValidate="txtEndDateSearch">RfvEndDate</asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleReqFieldLabel" ToolTip="End Date" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:Panel ID="disp" runat="server" Height="300px" ScrollBars="Vertical" Style="display: none" />
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server"
                                                IsMandatory="true" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false"
                                                OnClick="btnLoadCust_Click" Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustID" runat="server" />
                                            <asp:Button ID="btncust" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btncust_Click"
                                                Style="display: none" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="display: none">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ComboBoxBranch" AutoPostBack="true" ValidationGroup="RFVDTransLander" Visible="false"
                                                runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                                MaxLength="0" CssClass="md-form-control form-control" OnSelectedIndexChanged="ComboBoxBranch_SelectedIndexChanged" ToolTip="Location2">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Location2" ID="lblBranchSearch" Visible="false" CssClass="styleMandatoryLabel" ToolTip="Location2" />
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel2" runat="server" GroupingText="Customer / Client Details" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="TxtLendingLimit" runat="server" ToolTip="Maximum Lending Limit" Enabled="false"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                style="text-align:right" ></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="LblLendingLimit" Text="Maximum Lending Limit"
                                                    CssClass="styleDisplayLabel" ToolTip="Maximum Lending Limit" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="TxtFacLimit" runat="server" ToolTip="Factoring Limit" Enabled="false"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                style="text-align:right" ></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="LblFacLimit" Text="Factoring Limit"
                                                    CssClass="styleDisplayLabel" ToolTip="Factoring Limit" />
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="TxtTotalLimit" runat="server" ToolTip="Total Customer Limit" Enabled="false"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                style="text-align:right" ></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="LblTotLimit" Text="Total Customer Limit"
                                                    CssClass="styleDisplayLabel" ToolTip="Total Customer Limit" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div style="margin-top: 10px" class="md-input">
                                            <button class="css_btn_enabled" id="btnViewCustomer" onserverclick="btnViewCustomer_Click" causesvalidation="false" runat="server"
                                                type="button" accesskey="M" title ="Click to View Customer details - Alt+M">
                                                <i class="fa fa-eye" aria-hidden="true"></i>&emsp;<u>M</u>ore View
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel1" runat="server" GroupingText="Account Details" CssClass="stylePanel">
                                <div id="divPASA" runat="server" style="height: 250px; overflow: auto; display: none">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvprimeaccount" runat="server" AutoGenerateColumns="False" ShowFooter="false"
                                                    BorderWidth="2" Width="100%" OnRowDataBound="grvprimeaccount_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="2%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="S.No"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No." ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMLA" runat="server" Text='<%#Eval("PRIMEACCOUNTNO")%>' ToolTip="Account No."></asp:Label>
                                                                <asp:Label ID="lblpa_sa_ref_id" runat="server" Text='<%# Bind("pa_sa_ref_id") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Application Process" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnApplication" runat="server" Text="Application" ToolTip="Application Process" CssClass="grid_btn" OnClick="BtnApplication_Click"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Activation" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnActivation" runat="server" Text="Activation" ToolTip="Activation Entries" OnClick="BtnActivation_Click" CssClass="grid_btn"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Journal Query" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnJournal" runat="server" Text="Journal" ToolTip="Journal Entries" OnClick="BtnJournal_Click" CssClass="grid_btn"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PDC" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnPDC" runat="server" Text="PDC" ToolTip="PDC" OnClick="BtnPDC_Click" CssClass="grid_btn"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ROP" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnROP" runat="server" Text="ROP" ToolTip="ROP" CssClass="grid_btn" OnClick="BtnROP_Click"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnCollection" runat="server" Text="Collection" ToolTip="Collection" CssClass="grid_btn" OnClick="BtnCollection_Click"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ODI" ItemStyle-HorizontalAlign="left" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BtnODI" runat="server" Text="ODI" ToolTip="ODI" CssClass="grid_btn" OnClick="BtnODI_Click"></asp:Button>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sub Account No." ItemStyle-Width="2%" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSLA" runat="server" Text='<%#Eval("SUBACCOUNTNO")%>' ToolTip="Sub Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Select All" SortExpression="Sellect All" ItemStyle-Width="2%">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lblSelectAll" runat="server" Text="Select All" ToolTip="Select All"></asp:Label>
                                                                <br />
                                                                <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="false" ToolTip="Select All" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelectAccount" runat="server" ToolTip="Select" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="RFVDTransLander" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" 
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="BtnPrint" onserverclick="BtnPrint_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="P" title="Go,Alt+P">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="LblCurrency" runat="server" Text="" ToolTip="Currency">
                            </asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="LblErrorText" runat="server" Text="">
                                <input type="hidden" id="hdnCustomerID" runat="server" />
                            </asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="PnlCustomerDetails" runat="server" GroupingText="Customer Account Details"
                                CssClass="stylePanel" Width="100%">

                                <div id="divCustomerGlance" runat="server" style="position: relative; height: 200px; width: 100%; overflow: scroll;" align="left">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvCustomer" runat="server" Width="100%" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <asp:BoundField DataField="LOB" HeaderText="LOB" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Location" HeaderText="Branch" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Left" ItemStyle-Width="130" />
                                                        <%--<asp:BoundField DataField="Branch" HeaderText="Location2" HeaderStyle-HorizontalAlign="center"
                                                                ItemStyle-HorizontalAlign="left" ItemStyle-Width="10%" />--%>
                                                        <%-- <asp:BoundField DataField="CustomerCode" HeaderText="Customer Name" HeaderStyle-HorizontalAlign="center" 
                                                                ItemStyle-HorizontalAlign="left" ItemStyle-Width="100" />--%>
                                                        <asp:BoundField DataField="Product" HeaderText="Scheme" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Primeac" HeaderText="Account No." HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Subac" HeaderText="Sub Account No." HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%" Visible="false" />
                                                        <asp:BoundField DataField="AppliedAmt" HeaderText="Applied Amt." HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="CollateralValue" HeaderText="Collateral Value" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="SancAmt" HeaderText="Sanctioned Amt." HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="DisbursedAmount" HeaderText="Disbursed Amt." HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="GrossExposure" HeaderText="Gross Exposure" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="NetExposure" HeaderText="Net Exposure" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Dues" HeaderText="Dues" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Collected" HeaderText="Collection" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <%-- <asp:BoundField DataField="Pending" HeaderText="Pending" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-HorizontalAlign="right" ItemStyle-Width="10%" />--%>
                                                        <asp:BoundField DataField="AverageDueDates" HeaderText="Avg. Delay Days" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="ODIDue" HeaderText="ODI Due" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="MemoDue" HeaderText="Memo Due" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%" />
                                                        <asp:BoundField DataField="Others" HeaderText="Other Charges" HeaderStyle-HorizontalAlign="center"
                                                            ItemStyle-HorizontalAlign="Right" ItemStyle-Width="50%" />
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
                            <asp:Panel ID="pnlasset" runat="server" CssClass="stylePanel" GroupingText="Asset Details"
                                Width="100%">
                                <div id="divAsset" runat="server" style="position: relative; overflow: scroll; width: 100%; height: 200px;"
                                    align="left">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="gvasset" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                                    ShowFooter="false" Style="margin-bottom: 0px" Width="100%" OnRowDataBound="gvasset_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="LOB">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLobid" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PRIMEACCOUNTNO") %>' ToolTip="Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SUBACCOUNTNO") %>' ToolTip="Sub Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Asset Details">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAsset" runat="server" Text='<%# Bind("AssetDesc") %>' ToolTip="Asset Description"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="SI/RegNo.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSINo" runat="server" Text='<%# Bind("RegNo") %>' ToolTip="SI.No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Terms">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblterms" runat="server" Text='<%# Bind("Terms") %>' ToolTip="Terms"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
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
                            <asp:Label ID="lblAmounts" runat="server" Text="All amounts are in" Visible="false"
                                CssClass="styleDisplayLabel"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAccountDetails" runat="server" CssClass="stylePanel" GroupingText="Asset Account Details"
                                Width="100%">
                                <div id="divAccount" runat="server" style="overflow: scroll; height: 200px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvAccount" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                                    ShowFooter="true" Style="margin-bottom: 0px" Width="100%" OnRowDataBound="grvAccount_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="LOB">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLobid" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line Of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PRIMEACCOUNTNO") %>' ToolTip="Prime Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SUBACCOUNTNO") %>' ToolTip="Sub Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Grand Total:"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account Creation Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccDate" runat="server" Text='<%# Bind("ACCOUNTDATE") %>' ToolTip="Account Creation Date"></asp:Label>
                                                            </ItemTemplate>
                                                            <%--<FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Grand Total:"></asp:Label>
                                                    </FooterTemplate>--%>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Maturity Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblMatuDate" runat="server" Text='<%# Bind("MATURITYDATE") %>' ToolTip="Maturity Date"></asp:Label>
                                                            </ItemTemplate>
                                                            <%--<FooterTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text="Grand Total:"></asp:Label>
                                                </FooterTemplate>--%>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount financed">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AmountFinanced") %>' ToolTip="Amount Financed"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalAmount" runat="server" ToolTip="sum of Total Amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField HeaderText="Terms">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblterms" runat="server" Text='<%# Bind("Terms") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="left" Width="10%" />
                                                </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Schedule B">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblYetbilled" runat="server" Text='<%# Bind("YetToBeBilled") %>' ToolTip="Schedule B"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalYetbilled" runat="server" ToolTip="sum of  Schedule B"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Billed">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbilled" runat="server" Text='<%# Bind("Billed") %>' ToolTip="Billed"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalbilled" runat="server" ToolTip="sum of   billed amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Installment Received">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbalance" runat="server" Text='<%# Bind("Balance") %>' ToolTip="Installment Received"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalbilledbalance" runat="server" ToolTip="sum of   Balance  amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
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
                            <asp:Panel ID="pnlTransactionDetails" runat="server" CssClass="stylePanel" GroupingText="Transaction Details"
                                Width="100%">
                                <asp:Label ID="lblOpeningBalance" runat="server"></asp:Label>

                                <div id="divTransaction" runat="server" style="height: 200px; overflow: scroll">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False" CssClass="styleInfoLabel"
                                                    Width="100%" ShowFooter="true" ShowHeader="true" OnRowDataBound="grvtransaction_RowDataBound" OnDataBound="grvtransaction_DataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Account No.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PrimeAccountNo") %>' ToolTip="Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNo") %>' ToolTip="Sub Account No."></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Doc Date">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDocDate" runat="server" Text='<%# Bind("DocumentDate") %>' ToolTip="Document Date"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cheque No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblvaluedate" runat="server" Text='<%# Bind("ValueDate") %>' ToolTip="Value Date"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Doc Ref.">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDocumentReference" runat="server" Text='<%# Bind("DocumentReference") %>' ToolTip="Document Reference"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Narration">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldesc" runat="server" Text='<%# Bind("Description") %>' ToolTip="Description"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" ToolTip="sum of  Dues amount" Text="Grand Total:"
                                                                    HorizontalAlign="center"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Debit">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDues" runat="server" Text='<%# Bind("Dues") %>' ToolTip="Dues"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalDues" runat="server" ToolTip="sum of  Dues amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="center" />
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Credit">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("Receipts") %>' ToolTip="Receipts"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalReceipts" runat="server" ToolTip="sum of  Receipts amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="center" />
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
                                                            <FooterStyle HorizontalAlign="right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Balance">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblbalance" runat="server" Text='<%# Bind("Balance_Str") %>' ToolTip="Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotalbalance" runat="server" ToolTip="sum of  Balance amount"></asp:Label>
                                                            </FooterTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="center" />
                                                            <ItemStyle HorizontalAlign="right" Width="10%" />
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
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsCustomerAtaGlance" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" ShowMessageBox="false" ValidationGroup="RFVDTransLander"
                                HeaderText="Correct the following validation(s):  " ShowSummary="true" Height="129px" />
                        </div>
                    </div>

                    <cc1:ModalPopupExtender ID="ModalPopupExtenderQuery" runat="server" TargetControlID="btnModal"
                        PopupControlID="PnlShowCustomerQuery" BackgroundCssClass="styleModalBackground" Enabled="true">
                    </cc1:ModalPopupExtender>


                    <asp:Panel ID="PnlShowCustomerQuery" Style="display: none; vertical-align: middle" runat="server" CssClass="stylePanel"
                        BorderStyle="Solid" BackColor="White" Width="850px" GroupingText="Query">
                        <div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird" id="divAcc" runat="server" style="height: 250px; width: 100%">
                                        <asp:GridView ID="grvQuery" runat="server" AutoGenerateColumns="true" 
                                            OnRowDataBound="grvQuery_DataBound" Visible="true" Width="100%">
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <button class="css_btn_enabled" id="BtnExport" title="Exit[Alt+E]" visible="false" causesvalidation="false"
                                        onserverclick="BtnExport_Click" runat="server" type="button" accesskey="E">
                                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport
                                    </button>
                                    <button class="css_btn_enabled" id="btnDEVModalCancel" title="Exit[Alt+I]" causesvalidation="false"
                                        onserverclick="btnCloseBreakUpModelPop_Click" runat="server" type="button" accesskey="I">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                                    </button>
                                    <asp:HiddenField ID="HdnOption" runat="server" />
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="btnModal" Style="display: none" runat="server" />
                    </asp:Panel>


                    <script language="javascript" type="text/javascript">
                        function fnLoadCust() {
                            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
                        }

                        //   function Resize()
                        //     {
                        //       if(document.getElementById('ctl00_ContentPlaceHolder1_divCustomerGlance') != null)
                        //       {
                        //         if(document.getElementById('divMenu').style.display=='none')
                        //            {
                        //             (document.getElementById('ctl00_ContentPlaceHolder1_divCustomerGlance')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                        //            }
                        //         else
                        //           {
                        //             (document.getElementById('ctl00_ContentPlaceHolder1_divCustomerGlance')).style.width = screen.width - 270;
                        //           }
                        //        }  
                        //      }


                    </script>
                    <style type="text/css">
                        .Freezing {
                            position: relative;
                            top: auto;
                            z-index: auto;
                        }
                    </style>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnExport" />
            <asp:PostBackTrigger ControlID="BtnPrint" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
