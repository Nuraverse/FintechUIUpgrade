<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptStatementOfAccounts, App_Web_dzryruu3" title="SOA" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">

                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Statement Of Prepayment Accounts">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlCustomerInformation" runat="server" Visible="false" GroupingText="Customer Informations"
                            CssClass="stylePanel">
                            <div class="row">
                            </div>

                            <uc1:S3GCustomerAddress ID="ucCustDetails" ShowCustomerName="false" Visible="false" runat="server" FirstColumnStyle="styleFieldLabel"
                                SecondColumnStyle="styleFieldAlign" />

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlStatementOfAccounts" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                    <div class="md-input">
                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadCustomer_OnClick"
                                            Style="display: none" />
                                        <%--  <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" UseSubmitBehavior="False" OnClick="btnLoadCustomer_OnClick"
                                            Style="display: none" /><input id="hdnCustID" type="hidden" runat="server" />--%>
                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"></asp:TextBox>
                                        <asp:HiddenField ID="hdnCustID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <input type="hidden" id="hdnCustomerID" runat="server" />
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleReqFieldLabel" Text="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line of Business"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleMandatoryLabel" ToolTip="Line of Business"></asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlRegion" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                            OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" ToolTip="Location1"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblregion" runat="server" Text="Location1" CssClass="styleDisplayLabel" ToolTip="Location1"></asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlbranch" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                            OnSelectedIndexChanged="ddlbranch_SelectedIndexChanged" ToolTip="Location2"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblbranch" runat="server" Text="Location2" CssClass="styleDisplayLabel" ToolTip="Location2"></asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlproduct" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlproduct_SelectedIndexChanged" ValidationGroup="Header"
                                            ToolTip="Product" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblproduct" runat="server" Text="Product" CssClass="styleDisplayLabel" ToolTip="Product"></asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkPoff" runat="server" TextAlign="Right" ToolTip="Print Off" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <asp:Label runat="server" ID="lblPoff" CssClass="styleDisplayLabel" Text="Print Off" ToolTip="Print Off"></asp:Label>


                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <input id="hidDate" runat="server" type="hidden" />
                                        <asp:TextBox ID="txtStartDateSearch" AutoPostBack="true" runat="server" ToolTip="Start Date" OnTextChanged="txtStartDateSearch_OnTextChanged"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDateSearch" ToolTip="Start Date"
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
                                        <input id="Hidden1" runat="server" type="hidden" />
                                        <asp:TextBox ID="txtEndDateSearch" AutoPostBack="true" runat="server" OnTextChanged="txtEndDateSearch_OnTextChanged" ToolTip="End Date"
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
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <div id="divacc" runat="server" style="height: 150px;">
                                <asp:GridView ID="grvprimeaccount" runat="server" AutoGenerateColumns="False"
                                    BorderWidth="2" OnRowDataBound="grvprimeaccount_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl.No." ItemStyle-Width="2%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="SI.NO"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account No." ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMLA" runat="server" Text='<%#Eval("PRIMEACCOUNTNO")%>' ToolTip="Account No"></asp:Label>
                                                <asp:Label ID="lblPASA" runat="server" Text='<%#Eval("PA_SA_REF_ID")%>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Account No." ItemStyle-HorizontalAlign="Left" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSLA" runat="server" Text='<%#Eval("SUBACCOUNTNO")%>' ToolTip="Sub Account No"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Status" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAccountStatus" runat="server" Text='<%#Eval("ACCOUNTSTATUS")%>' ToolTip="Account Status"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select All" SortExpression="Sellect All">
                                            <HeaderTemplate>
                                                <asp:Label ID="lblSelectAll" runat="server" Text="Select All" ToolTip="Select All"></asp:Label>
                                                <br />
                                                <asp:CheckBox ID="chkSelectAll" runat="server" OnCheckedChanged="chkSelectAll_CheckedChanged" AutoPostBack="true" />
                                            </HeaderTemplate>
                                            <HeaderStyle />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelectAccount" runat="server" OnCheckedChanged="chkSelectAll_CheckedChanged" AutoPostBack="true" ToolTip="Select Account" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div align="right">

                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnclear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnclear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblAmounts" runat="server" Text="All amounts are in" Visible="false" CssClass="styleDisplayLabel"></asp:Label>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="divAssetview" runat="server" CssClass="accordionHeader" Width="98.5%" Visible="false">
                            <div style="float: left;">
                                Asset Details
                            </div>
                            <div style="float: left; margin-left: 20px;">
                                <asp:Label ID="lblDetails" runat="server" onclick='funshowaddless()'>(Show Details...)</asp:Label>
                            </div>
                            <div style="float: right; vertical-align: middle;">
                                <asp:ImageButton ID="imgDetails" runat="server" OnClientClick="funshowaddless()" ImageUrl="~/Images/expand_blue.jpg"
                                    AlternateText="(Show Details...)" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlasset" runat="server" CssClass="stylePanel" GroupingText="Asset Details">
                            <div id="divAsset" runat="server" style="overflow: scroll; height: 100px; display: block">
                                <asp:GridView ID="gvasset" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                    CssClass="styleInfoLabel" OnRowDataBound="gvasset_RowDataBound" ShowFooter="true" Style="margin-bottom: 0px" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Line Of Business">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLobid" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line Of Business"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PRIMEACCOUNTNO") %>' ToolTip="Prime Account No"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SUBACCOUNTNO") %>' ToolTip="Sub Account No"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Asset Details">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAsset" runat="server" Text='<%# Bind("AssetDesc") %>' ToolTip="Asset Description"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SI/Reg No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSINo" runat="server" Text='<%# Bind("RegNo") %>' ToolTip="Reg No"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Terms">
                                            <ItemTemplate>
                                                <asp:Label ID="lblterms" runat="server" Text='<%# Bind("Terms") %>' ToolTip="Terms"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnlasset"
                            ExpandControlID="divAssetview" CollapseControlID="divAssetview" Collapsed="True"
                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="false" SkinID="CollapsiblePanelDemo" />

                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="divAccountsummary" runat="server" CssClass="accordionHeader" Width="98.5%" Visible="false">
                            <div style="float: left;">
                                Account Summary Details
                            </div>
                            <div style="float: left; margin-left: 20px;">
                                <asp:Label ID="lblaccountsummary" runat="server" onclick='funshowaddless1()'>(Show Details...)</asp:Label>
                            </div>
                            <div style="float: right; vertical-align: middle;">
                                <asp:ImageButton ID="imgDetails1" runat="server" OnClientClick="funshowaddless1()" ImageUrl="~/Images/expand_blue.jpg"
                                    AlternateText="(Show Details...)" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlAccountDetails" runat="server" CssClass="stylePanel" GroupingText="Account Summary Details">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divAccount" runat="server" style="overflow: scroll; height: 100px; display: block">
                                            <asp:GridView ID="grvAccount" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                CssClass="gird_details" ShowFooter="true" OnRowDataBound="grvAccount_RowDataBound" Style="margin-bottom: 0px" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Line of Business">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLobid" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line of Business"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText=" Account No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PRIMEACCOUNTNO") %>' ToolTip="Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SUBACCOUNTNO") %>' ToolTip="Sub Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount Financed" FooterStyle-HorizontalAlign="Right">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AmountFinanced") %>' ToolTip="Amount Financed"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalAmountFinanced" runat="server" ToolTip="Total Finance Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>                                                    
                                                    <asp:TemplateField HeaderText="Yet To be billed">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblYetbilled" runat="server" Text='<%# Bind("YetToBeBilled") %>' ToolTip="Yet To be billed"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalYetbilled" runat="server" ToolTip="sum of  Yet to be billed amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unbilled Principal">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUnbilledPrincipal" runat="server" Text='<%# Bind("Unbilled_Principal") %>' ToolTip="Unbilled Principal"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalUnbilledPrincipal" runat="server" ToolTip="Sum of  Unbilled Principal amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Unbilled Interest">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUnbilledInterest" runat="server" Text='<%# Bind("Unbilled_Interest") %>' ToolTip="Unbilled Interest"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalUnbilledInterest" runat="server" ToolTip="Sum of  Unbilled Interest amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
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
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installment Received">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbalance" runat="server" Text='<%# Bind("Balance") %>' ToolTip="Balance"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalbilledbalance" runat="server" ToolTip="sum of   Balance  amount"></asp:Label>
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
                        <cc1:CollapsiblePanelExtender ID="cpeDemo1" runat="Server" TargetControlID="pnlAccountDetails"
                            ExpandControlID="divAccountsummary" CollapseControlID="divAccountsummary" Collapsed="True"
                            TextLabelID="lblaccountsummary" ImageControlID="imgDetails1" ExpandedText="(Hide Details...)"
                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="false" SkinID="CollapsiblePanelDemo" />

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlTransactionDetails" runat="server" CssClass="stylePanel" GroupingText="Transaction Details">
                            <asp:Label ID="lblOpeningBalance" runat="server"></asp:Label>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: block">
                                            <asp:GridView ID="grvtransaction" runat="server" AutoGenerateColumns="False" BorderWidth="2"
                                                CssClass="gird_details" Width="100%" OnRowDataBound="grvtransaction_RowDataBound" ShowFooter="true" ShowHeader="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Account No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PrimeAccountNo") %>' ToolTip="Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Sub Account No." Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNo") %>' ToolTip="Sub Account No"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Document Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDocDate" runat="server" Text='<%# Bind("DocumentDate") %>' ToolTip="Document Date"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Value Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblvaluedate" runat="server" Text='<%# Bind("ValueDate") %>' ToolTip="Value Date"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Document Reference">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDocumentReference" runat="server" Text='<%# Bind("DocumentReference") %>' ToolTip="Document Reference"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeNo" runat="server" Text='<%# Bind("Chequeno") %>' ToolTip="Cheque No."></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeDate" runat="server" Text='<%# Bind("Chequedate") %>' ToolTip="Cheque Date"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Narration">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNarration" runat="server" Text='<%# Bind("Narration") %>' ToolTip="Narration"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldesc" runat="server" Text='<%# Bind("Description") %>' ToolTip="Description"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDues" runat="server" Text='<%# Bind("Dues") %>' ToolTip="Dues"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalDues" runat="server" ToolTip="sum of  Dues amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("Receipts") %>' ToolTip="Receipts"></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalReceipts" runat="server" ToolTip="sum of  Receipts amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbalance" runat="server" Text='<%# Bind("Balance_Str") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalbalance" runat="server" ToolTip="sum of  Balance amount"></asp:Label>
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
                        <asp:Panel ID="pnlsummary" runat="server" CssClass="stylePanel" GroupingText="summary Details"
                            Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInstallmentDues" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Installment Dues"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInstallmentDues" runat="server" Text="Installment Due" ToolTip="Installment Dues"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInterestDues" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Interest Dues"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInterestDues" runat="server" Text="Interest Due" ToolTip="Interest Dues"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInsuranceDues" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Insurance Dues"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInsuranceDues" runat="server" Text="Insurance Due" ToolTip="Insurance Dues"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtODIDues" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="ODI Dues"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblODIDues" runat="server" Text="ODI Due" ToolTip="ODI Dues"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtOtherDues" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Other Dues"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblOtherDues" runat="server" Text="Other Due" ToolTip="Other Dues"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="PnlMemorandum" runat="server" CssClass="stylePanel" GroupingText="Memorandum Details">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtChequeReturnDue" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Cheque Return Due"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblChequeReturnDue" runat="server" Text="Cheque Return Due" ToolTip="Cheque Return Due"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDocumentChargesDue" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Document Charges Due"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblDocumentDue" runat="server" Text="Document Charges Due" ToolTip="Document Charges Due "> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtODIDue" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="ODI Due"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblODIDue" runat="server" Text="ODI Due" ToolTip="ODI Due"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtverifiDue" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Verification Due"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblVerifiDue" runat="server" Text="Verification Due" ToolTip="Verification Due"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMemoOtherDues" runat="server" Style="text-align: Right" ReadOnly="True" ToolTip="Other Due"
                                            class="md-form-control form-control login_form_content_input requires_true">
                                        </asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMemoOtherDues" runat="server" Text="Other Due" ToolTip="Other Due"> </asp:Label>
                                        </label>

                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="BtnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                        type="button" accesskey="P">
                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>

                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsSOA" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):"
                            ShowSummary="true" ValidationGroup="btnGo" />
                    </div>
                </div>

                <script language="javascript" type="text/javascript">

                    function fnLoadCust() {
                        document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
                    }
                    function fnSelectUser(chkSelect, chkSelectAll) {

                        var grvprimeaccount = document.getElementById('ctl00_ContentPlaceHolder1_divacc_grvprimeaccount');
                        var TargetChildControl = chkSelectAll;
                        var selectall = 0;
                        var Inputs = gvmail.getElementsByTagName("input");
                        if (!chkSelectAccount.checked) {
                            chkSelectAll.checked = false;
                        }
                        else {
                            for (var n = 0; n < Inputs.length; ++n) {
                                if (Inputs[n].type == 'checkbox') {
                                    if (Inputs[n].checked) {
                                        selectall = selectall + 1;
                                    }
                                }
                            }
                            if (selectall == grvprimeaccount.rows.length - 1) {
                                chkSelectAll.checked = true;
                            }
                        }


                    }
                    function funshowaddless() {

                        //document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnAddLess').click();
                        document.getElementById('<%=divAssetview.ClientID%>').collapsed = !document.getElementById('<%=divAssetview.ClientID%>').collapsed;

                    }
                    function funshowaddless1() {

                        //document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnAddLess').click();
                        document.getElementById('<%=divAccountsummary.ClientID%>').collapsed = !document.getElementById('<%=divAccountsummary.ClientID%>').collapsed;

            }

                </script>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BtnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
