<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S3GORGTransLander.aspx.cs"
    MasterPageFile="~/Common/S3GMasterPageCollapse.master" Inherits="Origination_S3GORGTransLander" %>

<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%--Content--%>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC4" %>
<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--Design Started--%>
    <script type="text/javascript">
        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
        }
        function fnValidateEmpty() { }
        function fnValidateEmptyGotoPage() { }


        function Account_ItemSelected(sender, e) {
            var hdnaccnumber = $get('<%= hdnaccnumber.ClientID %>');
            hdnaccnumber.value = e.get_value();
        }
        function Account_ItemPopulated(sender, e) {
            var hdnaccnumber = $get('<%= hdnaccnumber.ClientID %>');
            hdnaccnumber.value = '';

        }

        function Customer_ItemSelected(sender, e) {
            var hdnCustomerId = $get('<%= hdnCustomerId.ClientID %>');
            hdnCustomerId.value = e.get_value();
        }
        function Customer_ItemPopulated(sender, e) {
            var hdnCustomerId = $get('<%= hdnCustomerId.ClientID %>');
            hdnCustomerId.value = '';

        }


        function Dealer_ItemSelected(sender, e) {
            var hdnDealerCodeName = $get('<%= hdnDealerCodeName.ClientID %>');
            hdnDealerCodeName.value = e.get_value();
        }
        function Dealer_ItemPopulated(sender, e) {
            var hdnDealerCodeName = $get('<%= hdnDealerCodeName.ClientID %>');
            hdnDealerCodeName.value = '';

        }

        function Mo_ItemSelected(sender, e) {
            var hdnMoId = $get('<%= hdnMoId.ClientID %>');
            hdnMoId.value = e.get_value();
        }
        function Mo_ItemPopulated(sender, e) {
            var hdnMoId = $get('<%= hdnMoId.ClientID %>');
            hdnMoId.value = '';

        }


        function fnTrashSuggest(e) {
            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

        function fnLoadCustomer() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }

        function fnLoadAccount() {
            document.getElementById('<%=btnLoadAccount.ClientID%>').click();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel21" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">

                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" EnableViewState="false">
                                </asp:Label>
                            </h6>

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divLOB" runat="server">
                            <div class="md-input">
                                <%-- <cc1:ComboBox ID="ComboBoxLOBSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                                    runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                    MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                </cc1:ComboBox>--%>

                                <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                                    CssClass="styleMandatoryLabel" runat="server" ControlToValidate="ComboBoxLOBSearch"
                                    SetFocusOnError="True" Display="None" ErrorMessage="Select the Line of Business"></asp:RequiredFieldValidator>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label style="top: -17px;">
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <input id="hidDate" type="hidden" runat="server" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="True"
                                    OnTextChanged="txtStartDateSearch_TextChanged" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                    TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                    runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                    ErrorMessage="Enter a Start Date" Display="None"></asp:RequiredFieldValidator>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_false"
                                    OnTextChanged="txtEndDateSearch_TextChanged"></asp:TextBox>
                                <%--  <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                    TargetControlID="txtEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="styleMandatoryLabel"
                                    runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a End Date"
                                    Display="None"></asp:RequiredFieldValidator>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divBranch" runat="server">
                            <div class="md-input">
                                <asp:TextBox ID="txtBranchSearch" runat="server" MaxLength="50" OnTextChanged="txtBranchSearch_OnTextChanged"
                                    AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                <cc1:AutoCompleteExtender ID="autoBranchSearch" MinimumPrefixLength="3" OnClientPopulated="Branch_ItemPopulated"
                                    OnClientItemSelected="Branch_ItemSelected" runat="server" TargetControlID="txtBranchSearch"
                                    ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="5"
                                    CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                    CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                </cc1:AutoCompleteExtender>
                                <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="txtBranchSearch"
                                    WatermarkText="--Select--">
                                </cc1:TextBoxWatermarkExtender>
                                <asp:HiddenField ID="hdnBranchID" runat="server" />
                                <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                                    InitialValue="" CssClass="styleMandatoryLabel" runat="server" ControlToValidate="txtBranchSearch"
                                    SetFocusOnError="True" Display="None" ErrorMessage="Select the Branch"></asp:RequiredFieldValidator>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" ToolTip="Branch" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" >
                            <div class="md-input">
                                <%-- <uc:Suggest ID="ddlDocumentNumb" runat="server" OnItem_Selected="ddlDocumentNumb_Item_Selected" AutoPostBack="true"
                                    ServiceMethod="GetDocumentNumberList" class="md-form-control form-control login_form_content_input requires_false" />--%>
                                <uc:Suggest ID="ddlDocumentNumb" runat="server" class="md-form-control form-control" AutoPostBack="true" 
                                    OnItem_Selected="ddlDocumentNumb_Item_Selected"
                                    ServiceMethod="GetDocumentNumberList" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label Text="" CssClass="styleDisplayLabel" runat="server" ID="lblProgramIDSearch" />
                                </label>
                            </div>
                        </div>

                        <%--   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvAccountNo" runat="server">
                            <div class="md-input">
                                <asp:TextBox ID="txtAccountNumber" runat="server" MaxLength="50" OnTextChanged="txtAccountNumber_TextChanged"
                                    AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" MinimumPrefixLength="1" OnClientPopulated="Account_ItemPopulated" OnClientItemSelected="Account_ItemSelected"
                                    runat="server" TargetControlID="txtAccountNumber"
                                    CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                    DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass" ServiceMethod="GetAccountList"
                                    CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                </cc1:AutoCompleteExtender>
                                <asp:HiddenField ID="hdnaccnumber" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="LPO NO/ Account No" runat="server" ID="lblaccountNumber" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>--%>


                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="dvAccountNo" runat="server" visible="false">
                            <div class="md-input">
                                <%--<uc:Suggest ID="ucAccountLov" runat="server" ServiceMethod="GetAccuntNoList" AutoPostBack="true" />--%>
                                <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                    Style="display: none;" MaxLength="100"></asp:TextBox>
                                <UC4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                    OnItem_Selected="ucAccountLov_Item_Selected" strLOV_Code="ACC_ASTIDN" ServiceMethod="GetAccountList" />
                                <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                    Style="display: none" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                    <asp:HiddenField ID="hdnaccnumber" runat="server" />
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divCustomerCodeName" runat="server">
                            <div class="md-input">
                                <%--                                <asp:TextBox ID="txtCustomerCodeName" runat="server" MaxLength="50" OnTextChanged="txtCustomerCodeName_TextChanged"
                                    AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                <cc1:AutoCompleteExtender ID="autotxtCustomerCodeName" MinimumPrefixLength="1" OnClientPopulated="Customer_ItemPopulated" OnClientItemSelected="Customer_ItemSelected"
                                    runat="server" TargetControlID="txtCustomerCodeName"
                                    CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                    DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass" ServiceMethod="GetCustomerList"
                                    CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                </cc1:AutoCompleteExtender>--%>


                                <UC4:ICM ID="ucCustomerCodeLov" ToolTip="Customer/Client Name" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" ShowHideAddressImageButton="true" AutoPostBack="true" DispalyContent="Both"
                                    strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />

                                <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                    Style="display: none" />

                                <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="Customer Code/Name" runat="server" ID="lblCustomerCodeName" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>


                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="div1" runat="server">
                            <div class="md-input">
                                <asp:TextBox ID="txtDealerCodeName" runat="server" MaxLength="50" OnTextChanged="txtDealerCodeName_TextChanged"
                                    AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                <cc1:AutoCompleteExtender ID="autotxtDealerCodeName" MinimumPrefixLength="1" OnClientPopulated="Dealer_ItemPopulated" OnClientItemSelected="Dealer_ItemSelected"
                                    runat="server" TargetControlID="txtDealerCodeName"
                                    CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                    DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass" ServiceMethod="GetDealerCodeNameList"
                                    CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                </cc1:AutoCompleteExtender>
                                <asp:HiddenField ID="hdnDealerCodeName" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="Dealer Code/Name" runat="server" ID="lblDealerCodeName" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="div2" runat="server">
                            <div class="md-input">
                                <asp:TextBox ID="txtMarktingOfficer" runat="server" MaxLength="50" OnTextChanged="txtMarktingOfficer_TextChanged"
                                    AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                <cc1:AutoCompleteExtender ID="autotxtMarktingOfficer" MinimumPrefixLength="1" OnClientPopulated="Mo_ItemPopulated" OnClientItemSelected="Mo_ItemSelected"
                                    runat="server" TargetControlID="txtMarktingOfficer"
                                    CompletionSetCount="5" Enabled="True" ServicePath="" CompletionListCssClass="CompletionList"
                                    DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass" ServiceMethod="GetMarketingOfficerList"
                                    CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                </cc1:AutoCompleteExtender>
                                <asp:HiddenField ID="hdnMoId" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label Text="Marketing Executive Name" runat="server" ID="lblMarketingExecutiveName" CssClass="styleDisplayLabel" />
                                </label>
                            </div>
                        </div>



                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server"
                                    OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged"
                                    class="md-form-control form-control requires_false">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label Visible="false" Text="Transaction" runat="server" ID="lblMultipleDNC" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server" Width="175px"
                                    OnSelectedIndexChanged="ddlDNCOption_SelectedIndexChanged" class="md-form-control form-control requires_false">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption" />
                                </label>
                            </div>
                        </div>
                    </div>




                    <%-- <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                    <asp:Button Text="Search" AccessKey="F" ToolTip="Search[Alt+F]" ValidationGroup="RFVDTransLander" ID="btnSearch" runat="server"
                                        CssClass="save_btn fa fa-search" UseSubmitBehavior="true" OnClick="btnSearch_Click" />--%>
                    <%--  <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                    <asp:Button Text="Create" ID="btnCreate" AccessKey="C" ToolTip="Search[Alt+C]" runat="server" CssClass="save_btn fa fa-floppy-o"
                                        UseSubmitBehavior="true" OnClick="btnCreate_Click" />--%>
                    <%--  <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                    <asp:Button Text="Clear" ID="btnClear" AccessKey="L" ToolTip="Search[Alt+L]" runat="server" CssClass="save_btn fa fa-eraser"
                                        UseSubmitBehavior="true" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />--%>
                    <div class="row">
                        <%-- <div style="width: 100%; left: 18px; top: 44px; float: left; overflow: auto">--%>
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvTransLander" AutoGenerateColumns="true"
                                OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader" class="gird_details"
                                RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                                <Columns>
                                    <%--Query Column--%>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblQuery" runat="server" Text="Query"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandArgument='<%# Bind("ID") %>' CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--Edit Column--%>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <HeaderTemplate>
                                            <asp:Label ID="lblEdit" runat="server" Text="Modify"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnEdit" CssClass="styleGridEdit" ImageUrl="~/Images/spacer.gif"
                                                CommandArgument='<%# Bind("ID") %>' CommandName="Modify" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--Created by - User ID Column--%>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserID" Visible="false" runat="server" Text='<%# Bind("Created_By") %>'></asp:Label>
                                            <asp:Label ID="lblUserLevelID" Visible="false" runat="server" Text='<%# Bind("User_Level_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                    </div>
                    <div class="row">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSearch" title="Search[Alt+S]" causesvalidation="false" onserverclick="btnSearch_Click" runat="server"
                            type="button" accesskey="S">
                            <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                        </button>
                        <button class="css_btn_enabled" id="btnCreate" title="Create[Alt+C]" causesvalidation="false" onserverclick="btnCreate_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>

                    </div>
                    <div class="row">
                        <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

