<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collateral_S3GCLTTransLander, App_Web_hnyhdk4t" title="Untitled Page" %>

<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%--Content--%>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function fnLoadAccount() {
            document.getElementById('<%=btnLoadAccount.ClientID%>').click();
        }
        function fnTrashAccountCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountCode.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountCode.ClientID %>').value = "";


                }
            }
        }
    </script>
    <%--Design Started--%>
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" AutoPostBack="true" class="md-form-control form-control">
                    </asp:DropDownList>
                    <%--  <cc1:ComboBox ID="ComboBoxLOBSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                        runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                        MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                    </cc1:ComboBox>--%>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                            CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxLOBSearch"
                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label class="tess">
                        <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                    </label>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <input id="hidDate" type="hidden" runat="server" />
                    <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="True"
                        OnTextChanged="txtStartDateSearch_TextChanged"
                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                    <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                        PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                    </cc1:CalendarExtender>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                            runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                            ErrorMessage="Enter a Start Date" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                    </label>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList ID="ComboBoxBranchSearch" runat="server" ToolTip="Branch">
                    </asp:DropDownList>
                    <%-- <uc2:Suggest ID="ComboBoxBranchSearch" runat="server" ServiceMethod="GetBranchList" />--%>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                            InitialValue="-- Select --" class="md-form-control form-control login_form_content_input" runat="server" ControlToValidate="txtStartDateSearch"
                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="True"
                        OnTextChanged="txtEndDateSearch_TextChanged"
                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                    <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                        PopupButtonID="imgEndDateSearch" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                        TargetControlID="txtEndDateSearch">
                    </cc1:CalendarExtender>
                    <div class="validation_msg_box">
                        <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                            runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter a End Date"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                    </label>

                </div>
            </div>
            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList Visible="false" AutoPostBack="true" ID="ddlMultipleDNC" runat="server"
                        Width="185px" OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Visible="false" Text="Transaction" runat="server" ID="lblMultipleDNC"
                            CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server" Width="175px"
                        OnSelectedIndexChanged="ddlDNCOption_SelectedIndexChanged">
                    </asp:DropDownList>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Visible="false" Text="Select Status" runat="server" ID="lblDNCOption"
                            CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <uc2:Suggest ID="cmbDocumentNumberSearch" runat="server" ServiceMethod="GetDocumentNumber" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divAccountLOV" runat="server">
                <div class="md-input">
                    <asp:TextBox ID="txtAccountCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                        Style="display: none;" MaxLength="100"></asp:TextBox>
                    <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                        OnItem_Selected="ucAccountLov_Item_Selected" strLOV_Code="ACC_ACCA" ServiceMethod="GetAccountList" ToolTip="Account Number" />
                    <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                        Style="display: none" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label runat="server" Text="Account Number" ToolTip="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                    </label>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="md-input">
                    <uc2:LOV ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" runat="server" strLOV_Code="CMB"
                        DispalyContent="Code" />

                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>
                        <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code" CssClass="styleDisplayLabel"
                            Visible="false">
                        </asp:Label>
                    </label>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="gird">
                    <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                        OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="gird_details"
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
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>

            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <input type="hidden" id="hdnSortDirection" runat="server" />
                <input type="hidden" id="hdnSortExpression" runat="server" />
                <input type="hidden" id="hdnSearch" runat="server" />
                <input type="hidden" id="hdnOrderBy" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                    ShowSummary="true" />
            </div>
        </div>
        <div align="right">
            <button id="btnSearch" runat="server" validationgroup="RFVDTransLander" title="Search[Alt+F]" accesskey="F"
                class="css_btn_enabled" onserverclick="btnSearch_Click" type="button">
                <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
            </button>
            <button id="btnCreate" runat="server" type="button" class="css_btn_enabled" title="Create[Alt+C]" accesskey="C"
                onserverclick="btnCreate_Click">
                <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
            </button>
            <button id="btnClear" runat="server" type="button" class="css_btn_enabled" title="Clear[Alt+L]" accesskey="L"
                onclick="if(fnConfirmClear())" onserverclick="btnClear_Click" causesvalidation="false">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
        </div>
    </div>
</asp:Content>
