<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collateral_S3GCLTCollateralRelease, App_Web_hnyhdk4t" title="Collateral Release" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/PageNavigator.ascx" TagName="PageNavigator" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        // function window.onerror()    {        return true;    }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                            <asp:Panel ID="PnlCollateralInfo" runat="server" CssClass="stylePanel" GroupingText="Collateral Information">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCollateralSaleNo" runat="server" ContentEditable="false"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCollateralSaleNo" runat="server" CssClass="styleDisplayLabel" Text="Collateral Release Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCollateralSaleDate" runat="server" Contenteditable="false"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblCollateralSaleDate" runat="server" CssClass="styleDisplayLabel"
                                                    Text="Collateral Release Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="TxtColTranNo" runat="server" Contenteditable="false"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="LblColTranNo" runat="server" CssClass="styleDisplayLabel" Text="Collateral Transaction Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcCollateralSale" runat="server" CssClass="styleTabPanel" Width="100%"
                                TabStripPlacement="top" ActiveTabIndex="2" OnClientActiveTabChanged="ActiveTabChange">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" HeaderText="Customer / Agent" ID="tpColCustAgnt" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Customer / Agent
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="upColCustAgnt" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:RadioButton ID="rbtCustomer" runat="server" AutoPostBack="True" Checked="True"
                                                                        class="styleFieldLabel" OnCheckedChanged="GetCust" Text="Customer"
                                                                        CssClass="md-form-control form-control radio" RepeatDirection="Horizontal" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:RadioButton ID="rbtAgent" runat="server" AutoPostBack="True" class="styleFieldLabel" OnCheckedChanged="GetAgent"
                                                                        Text="Collection Agent" CssClass="md-form-control form-control radio" RepeatDirection="Horizontal" />

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvPaging" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                        CssClass="gird_details">
                                                                        <Columns>
                                                                            <asp:TemplateField Visible="False">
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="imgbtnQuery" runat="server" CommandArgument='<%# Bind("Collateral_Capture_ID") %>'
                                                                                        CommandName="Query" CssClass="styleGridQuery" ImageUrl="~/Images/spacer.gif" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Modify" SortExpression="Customer_ID" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="imgbtnEdit" runat="server" AlternateText="Modify" CommandArgument='<%# Bind("Collateral_Capture_ID") %>'
                                                                                        CommandName="Modify" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif" />
                                                                                </ItemTemplate>
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="lblModify" runat="server" CssClass="styleGridHeader" Text="Modify"></asp:Label>
                                                                                </HeaderTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Name">
                                                                                <HeaderTemplate>
                                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                                        <thead>
                                                                                            <tr align="center">
                                                                                                <th style="padding: 0px !important; background: none !important;">
                                                                                                    <asp:LinkButton ID="lnkbtnSort1" runat="server" OnClick="FunProSortingColumn"
                                                                                                        Text="Name" ToolTip="Sort By Customer Name"> </asp:LinkButton>
                                                                                                    <asp:Button ID="imgbtnSort1"
                                                                                                        runat="server" CssClass="styleImageSortingAsc" ImageAlign="Middle" />
                                                                                                </th>
                                                                                            </tr>
                                                                                            <tr align="left">
                                                                                                <th style="padding: 0px !important; background: none !important;">
                                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                                        <asp:TextBox ID="txtHeaderSearch1" runat="server" AutoCompleteType="None" AutoPostBack="true"
                                                                                                            OnTextChanged="FunProHeaderSearch" class="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                    </div>
                                                                                                </th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                    </table>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label><asp:HiddenField
                                                                                        ID="hidCA_ID" runat="server" Value='<%# Eval("CA_ID")%>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Collateral Capture Number">
                                                                                <HeaderTemplate>
                                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                                        <thead>
                                                                                            <tr align="center">
                                                                                                <th style="padding: 0px !important; background: none !important;">
                                                                                                    <asp:LinkButton ID="lnkbtnSort2" runat="server" OnClick="FunProSortingColumn"
                                                                                                        Text="Collateral Capture Number" ToolTip="Sort By Collateral Capture Number"> </asp:LinkButton>
                                                                                                    <asp:Button
                                                                                                        ID="imgbtnSort2" runat="server" CssClass="styleImageSortingAsc" ImageAlign="Middle" />
                                                                                                </th>
                                                                                            </tr>
                                                                                            <tr align="left">
                                                                                                <th style="padding: 0px !important; background: none !important;">
                                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                                        <asp:TextBox ID="txtHeaderSearch2" runat="server" AutoCompleteType="None" AutoPostBack="true"
                                                                                                            class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                    </div>
                                                                                                </th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                    </table>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCType_No" runat="server" Text='<%# Bind("Collateral_Tran_No") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Captured Date">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCreatedOn" runat="server" Text='<%# Eval("Captured_Date")%>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Select">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkIsActive" runat="server" AutoPostBack="true" OnCheckedChanged="Move" /><asp:HiddenField
                                                                                        ID="hidCLT_ID" runat="server" Value='<%# Eval("Collateral_Capture_ID")%>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblUserID" runat="server" Text='<%#Eval("Created_By")%>' Visible="false"></asp:Label><asp:Label
                                                                                        ID="lblUserLevelID" runat="server" Text='<%#Eval("User_Level_ID")%>' Visible="false"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>

                                                                    <input type="hidden" id="hdnSortDirection" runat="server">
                                                                    <input id="hdnSortExpression" runat="server" type="hidden"></input>
                                                                    <input id="hdnSearch" runat="server" type="hidden"></input>
                                                                    <input id="hdnOrderBy" runat="server" type="hidden"></input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <uc3:PageNavigator ID="ucCustomPaging" runat="server"></uc3:PageNavigator>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" HeaderText="General" ID="tpColGeneral" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                General
                                            </HeaderTemplate>
                                            <ContentTemplate>

                                                <asp:UpdatePanel ID="UpdColGen" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlHeader" Width="99%" runat="server" GroupingText="Customer Details"
                                                                    CssClass="stylePanel">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" ActiveViewIndex="1" runat="server"
                                                                                FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlAgent" Width="99%" runat="server" GroupingText="Collection Agent Details"
                                                                    CssClass="stylePanel">
                                                                    <div class="row">
                                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtACode" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="Label1" runat="server" Text="Collection Agent Code" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAName" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblAName" runat="server" Text="Collection Agent Name" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAaddress" TextMode="MultiLine" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="Label2" runat="server" Text="Collection Agent Address" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAcity" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="Label3" runat="server" Text="City" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtAState" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="Label4" runat="server" Text="State" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtACountry" runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="Label5" runat="server" Text="Country" />
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlAccDetails" Width="99%" runat="server" GroupingText="Account Details"
                                                                    Visible="False" Height="10%" ScrollBars="Vertical" CssClass="stylePanel">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="gird">
                                                                                <asp:GridView ID="gvAccDetails" runat="server" AutoGenerateColumns="False" Width="99%"
                                                                                    CssClass="gird_details">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSNoMedium" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="Line of Business" DataField="LOB_Code" />
                                                                                        <asp:BoundField HeaderText="Prime Account Number" DataField="Prime_Account_Number" />
                                                                                        <asp:BoundField HeaderText="Sub Account Number" DataField="Sub_Account_Number" />
                                                                                        <asp:BoundField HeaderText="Account Creation Date" DataField="Account_Date" />
                                                                                        <asp:BoundField HeaderText="Finance Amount" DataField="Original_Amount_Financed">
                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                        </asp:BoundField>
                                                                                        <asp:BoundField HeaderText="Maturity Date" DataField="Maturity_Date" />
                                                                                    </Columns>
                                                                                    <RowStyle HorizontalAlign="Left" />
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:TabPanel runat="server" HeaderText="Collateral Details" ID="tpColDtl" CssClass="tabpan"
                                            BackColor="Red">
                                            <HeaderTemplate>
                                                Collateral Details
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:UpdatePanel ID="UpdColDtl" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:CheckBox ID="ChkHS" runat="server" OnCheckedChanged="ChkHS_CheckedChanged" Text="High Liquid Security Details"
                                                                            AutoPostBack="True" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="gvHighLiqDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                                ShowFooter="True" OnDataBound="gvHighLiqDetails_DataBound" CssClass="gird_details">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Serial No" DataField="SLNo" />
                                                                                    <asp:BoundField HeaderText="Issued By" DataField="Issue_By" />
                                                                                    <asp:BoundField HeaderText="Acquisition Date" DataField="Maturity_Date" />
                                                                                    <asp:BoundField HeaderText="Maturity Date" DataField="Maturity_Date" />
                                                                                    <asp:BoundField HeaderText="Face Value" DataField="Unit_Face_Value" />
                                                                                    <asp:TemplateField HeaderText="Available Units">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblAvlUnits" runat="server" Style="text-align: right" Text='<% #Bind("No_Of_Units")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblAvlUnits" runat="server" Style="text-align: right" Text='<% #Bind("No_Of_Units")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField HeaderText="Current Unit Value" DataField="CURRENT_UNIT_VALUE" />
                                                                                    <asp:TemplateField HeaderText="Current Market Value">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Style="text-align: right" Text='<% #Bind("Valuation_Current_Market_Value")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Style="text-align: right" Text='<% #Bind("Valuation_Current_Market_Value")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Label ID="LblTotal" runat="server" Text="Grand Total"></asp:Label>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Release Unit">
                                                                                        <ItemTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="txtHigSaleUnit" MaxLength="10" runat="server" Style="text-align: right"
                                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" OnTextChanged="txtHigSaleUnit_TextChanged"
                                                                                                    AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                                <cc1:FilteredTextBoxExtender ID="FtxtHigSaleUnit" runat="server"
                                                                                                    Enabled="true" FilterType="Numbers,Custom" TargetControlID="txtHigSaleUnit" ValidChars="., ">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="TxtTotalUnits" MaxLength="10" runat="server" ContentEditable="false"
                                                                                                    Style="text-align: right"
                                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </FooterTemplate>
                                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select Release Asset">
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkHigSale" runat="server" AutoPostBack="True" OnCheckedChanged="chkHigSale_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:CheckBox ID="chkHigSale" runat="server" AutoPostBack="True" OnCheckedChanged="chkHigSale_CheckedChanged" />
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:CheckBox runat="server" ID="ChkMS" Text="Medium Liquid Security Details" OnCheckedChanged="ChkMS_CheckedChanged"
                                                                            AutoPostBack="True"></asp:CheckBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="gvMedLiqDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                                ShowFooter="True" OnDataBound="gvMedLiqDetails_DataBound" CssClass="gird_details">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Serial No" DataField="SLNo" />
                                                                                    <asp:BoundField HeaderText="Description" DataField="Description" />
                                                                                    <asp:BoundField HeaderText="Model" DataField="Model" />
                                                                                    <asp:BoundField HeaderText="Year" DataField="Year" />
                                                                                    <asp:BoundField HeaderText="Reg No" DataField="Registration_No" />
                                                                                    <asp:BoundField HeaderText="Serial Number" DataField="Serial_No" />
                                                                                    <asp:BoundField HeaderText="Original Value" DataField="Value" />
                                                                                    <asp:BoundField HeaderText="Last Valuation Date" DataField="Valuation_Date" />
                                                                                    <asp:TemplateField HeaderText="Valuation Amount">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Label ID="LblTotal" runat="server" Text="Grand Total"></asp:Label>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Release Unit">
                                                                                        <ItemTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="txtMedSaleUnit" MaxLength="10" runat="server" ContentEditable="false"
                                                                                                    AutoPostBack="true" OnTextChanged="txtMedSaleUnit_TextChanged" Style="text-align: right"
                                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                                <cc1:FilteredTextBoxExtender ID="FtxtMedSaleUnit"
                                                                                                    Enabled="true" runat="server" FilterType="Numbers,Custom" TargetControlID="txtMedSaleUnit"
                                                                                                    ValidChars="., ">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="TxtTotalUnits" runat="server" ContentEditable="false" Style="text-align: right"
                                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </FooterTemplate>
                                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select Release Asset">
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkMedSale" runat="server" AutoPostBack="True" OnCheckedChanged="chkMedSale_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:CheckBox ID="chkMedSale" runat="server" AutoPostBack="True" OnCheckedChanged="chkMedSale_CheckedChanged" />
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:CheckBox runat="server" ID="ChkLS" Text="Low Liquid Security Details" OnCheckedChanged="ChkLS_CheckedChanged"
                                                                            AutoPostBack="True"></asp:CheckBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="gvLowLiqDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                                ShowFooter="True" OnDataBound="gvLowLiqDetails_DataBound" CssClass="gird_details">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Serial No" DataField="SLNo" />
                                                                                    <asp:BoundField HeaderText="Location Details" DataField="Location_Details" />
                                                                                    <asp:TemplateField HeaderText="Measurement">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblAvlUnits" runat="server" Style="text-align: right" Text='<% #Bind("Measurement")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblAvlUnits" runat="server" Style="text-align: right" Text='<% #Bind("Measurement")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField HeaderText="Unit Rate" DataField="Unit_Rate" />
                                                                                    <asp:BoundField HeaderText="Value" DataField="Value" />
                                                                                    <asp:BoundField HeaderText="Current Unit Value" DataField="CURRENT_UNIT_VALUE" />
                                                                                    <asp:TemplateField HeaderText="Current Market Value">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Label ID="LblTotal" runat="server" Text="Grand Total"></asp:Label>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Release Unit">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtLowSaleUnit" MaxLength="10" runat="server" Style="text-align: right"
                                                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" OnTextChanged="txtLowSaleUnit_TextChanged"
                                                                                                AutoPostBack="True" /><cc1:FilteredTextBoxExtender ID="ftxtLowSaleUnit" runat="server"
                                                                                                    Enabled="true" FilterType="Numbers,Custom" TargetControlID="txtLowSaleUnit" ValidChars="., ">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="TxtTotalUnits" MaxLength="10" runat="server" ContentEditable="false"
                                                                                                Style="text-align: right"></asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select Release Asset">
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkLowSale" runat="server" AutoPostBack="True" OnCheckedChanged="chkLowSale_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:CheckBox ID="chkLowSale" runat="server" AutoPostBack="True" OnCheckedChanged="chkLowSale_CheckedChanged" />
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:CheckBox runat="server" ID="ChkCOM" Text="Commodity Details" OnCheckedChanged="ChkCOM_CheckedChanged"
                                                                            AutoPostBack="True"></asp:CheckBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="gvCommoDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                                ShowFooter="True" OnDataBound="gvCommoDetails_DataBound" CssClass="gird_details">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Serial No" DataField="SLNo" />
                                                                                    <asp:BoundField HeaderText="Description" DataField="Description" />
                                                                                    <asp:BoundField HeaderText="Unit of Measurement" DataField="Unit_Of_Measure" />
                                                                                    <asp:BoundField HeaderText="Unit Quantity" DataField="Unit_Quantity" />
                                                                                    <asp:BoundField HeaderText="Unit Price" DataField="UNIT_MARKET_PRICE" />
                                                                                    <asp:TemplateField HeaderText="Total Quantity">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblAvlUnits" runat="server" Style="text-align: right" Text='<% #Bind("TotalQuantity")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblAvlUnits" runat="server" Style="text-align: right" Text='<% #Bind("TotalQuantity")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:BoundField HeaderText="Current Unit Value" DataField="CURRENT_UNIT_VALUE" />
                                                                                    <asp:TemplateField HeaderText="Current Market Value">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Label ID="LblTotal" runat="server" Text="Grand Total"></asp:Label>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Release Unit">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtCommSaleUnit" MaxLength="10" runat="server" Style="text-align: right"
                                                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" AutoPostBack="true" OnTextChanged="txtCommSaleUnit_TextChanged" /><cc1:FilteredTextBoxExtender
                                                                                                    ID="FtxtCommSaleUnit" Enabled="true" runat="server" FilterType="Numbers,Custom"
                                                                                                    TargetControlID="txtCommSaleUnit" ValidChars="., ">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:TextBox ID="TxtTotalUnits" MaxLength="10" runat="server" ContentEditable="false"
                                                                                                Style="text-align: right"></asp:TextBox>
                                                                                        </FooterTemplate>
                                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select Release Asset">
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkCommSale" runat="server" OnCheckedChanged="chkCommSale_CheckedChanged"
                                                                                                AutoPostBack="True" />
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:CheckBox ID="chkCommSale" runat="server" OnCheckedChanged="chkCommSale_CheckedChanged"
                                                                                                AutoPostBack="True" />
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <asp:CheckBox runat="server" ID="ChkFS" Text="Financial Investment Details" OnCheckedChanged="ChkFS_CheckedChanged"
                                                                            AutoPostBack="True"></asp:CheckBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>

                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="gvFinDetails" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                                ShowFooter="True" OnDataBound="gvFinDetails_DataBound">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Serial No" DataField="SLNo" />
                                                                                    <asp:BoundField HeaderText="Policy Issued By" DataField="Insurance_Issued_By" />
                                                                                    <asp:BoundField HeaderText="Policy No" DataField="Policy_No" />
                                                                                    <asp:BoundField HeaderText="Policy Value" DataField="Policy_Value" />
                                                                                    <asp:BoundField HeaderText="Maturity Date" DataField="Maturity_Date" />
                                                                                    <asp:BoundField HeaderText="Last Valuation Date" DataField="Valuation_Date" />
                                                                                    <asp:TemplateField HeaderText="Valuation Amount">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblValAmnt" runat="server" Text='<% #Bind("Valuation_Current_Market_Value")%>'
                                                                                                Style="text-align: right"></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <asp:Label ID="LblTotal" runat="server" Text="Grand Total"></asp:Label>
                                                                                        </FooterTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Release Unit">
                                                                                        <ItemTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="txtFinSaleUnit" MaxLength="10" runat="server" ContentEditable="false"
                                                                                                    Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)" AutoPostBack="True"
                                                                                                    OnTextChanged="txtFinSaleUnit_TextChanged" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                                <cc1:FilteredTextBoxExtender ID="FtxtFinSaleUnit"
                                                                                                    Enabled="true" FilterType="Numbers,Custom" TargetControlID="txtFinSaleUnit" runat="server"
                                                                                                    ValidChars="., ">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                        <FooterTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="TxtTotalUnits" MaxLength="10" runat="server" ContentEditable="false"
                                                                                                    Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </FooterTemplate>
                                                                                        <FooterStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select Release Asset">
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkFinSale" runat="server" OnCheckedChanged="chkFinSale_CheckedChanged"
                                                                                                AutoPostBack="True" />
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:CheckBox ID="chkFinSale" runat="server" OnCheckedChanged="chkFinSale_CheckedChanged"
                                                                                                AutoPostBack="True" />
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblItemRefNo" runat="server" Text='<% #Bind("COLLATERAL_ITEM_REF_NO")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="LblIsSold" runat="server" Text='<% #Bind("Is_Release")%>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </div>
                                </div>
                            </cc1:TabContainer>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <span id="lblErrorMessage" runat="server" style="color: Red; font-size: medium"></span>
                            <asp:TextBox ID="txthiddenfield" runat="server" Style="display: none;"></asp:TextBox>
                            <div style="visibility: hidden">
                                <asp:Button runat="server" ID="btnTab" OnClick="btnTab_Click" />
                            </div>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]"  causesvalidation="false"
                            onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" >
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button id="btnClear" runat="server" onclick="if(fnConfirmClear())" accesskey="L" title="Clear[Alt+L]"
                            causesvalidation="false" class="css_btn_enabled" type="button" onserverclick="btnClear_Click">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                        </button>
                        <button id="btnCancel" runat="server" causesvalidation="false" accesskey="X" title="Exit[Alt+X]"
                            onclick="if(fnConfirmExit())" class="css_btn_enabled" type="button" onserverclick="btnCancel_Click">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsColSale" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ShowMessageBox="false" HeaderText="Correct the following validation(s):" DisplayMode="List" />
                            <asp:ValidationSummary ID="vs1" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ShowMessageBox="false" HeaderText="Correct the following validation(s):" DisplayMode="List"
                                ValidationGroup="Collateral Release Details" />
                            <asp:CustomValidator ID="cvColSale" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">

        function ActiveTabChange() {
            var tabclickbutton = document.getElementById("<%=btnTab.ClientID  %>")
            if (tabclickbutton != null) {
                tabclickbutton.click();
            }
        }

        function AddGrid(rows, Grid, textbox, txttotal, Chk) {
            var tab = document.getElementById(Grid);
            var GridText = Grid + '_ctl0';
            var total;
            total = 0;
            for (var index = 2; index <= rows + 1 ; index++) {
                if (index >= 10) {
                    GridText = Grid + '_ctl';
                }
                if (document.getElementById(GridText + index + '_' + Chk).checked == true) {
                    var search = GridText + index + '_' + textbox;
                    var val = document.getElementById(search).value;
                    if (val != "") {
                        total = parseFloat(total) + parseFloat(val);
                    }
                }

            }

            document.getElementById(txttotal).value = total;


        }
        function CalcSaleAmt(SaleUnit, NoUnits, ValAmnt) {
            var NoUnits;
            NoUnits = parseFloat(NoUnits);
            var Sal;
            Sal = parseFloat(document.getElementById(SaleUnit).value);
            var MrktVal
            MrktVal = parseFloat(ValAmnt);
            var Tot;
            if (Sal > NoUnits) {
                alert('The Release Unit should not be greater than the Available Units');
                //            document.getElementById(SaleUnit).focus();
                document.getElementById(SaleUnit).clear();
                return;
            }
            else {
                Tot = Sal * MrktVal;
                //        document.getElementById(TxtAmnt).value= Tot.toString();
            }

            document.getElementById('<%= btnSave.ClientID %>').disabled = false;

            return;

        }

    </script>
</asp:Content>
