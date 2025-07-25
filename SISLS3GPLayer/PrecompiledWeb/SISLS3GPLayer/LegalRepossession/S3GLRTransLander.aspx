<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRTransLander, App_Web_prpaho0u" title="Untitled Page" %>


<%--Ajax Control Toolkit--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--Grid User Control--%>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%--Content--%>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC4" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc5" %>




<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--Design Started--%>
    <script language="javascript" type="text/javascript">
        function fnTrashAccountCommonSuggest(e) {
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";


                }
            }
        }
        function fnTrashCustCommonSuggest(e) {
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustNoDummy.ClientID %>').value = "";


                }
            }
        }
        function fnTrashSuggest(e) {
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
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
        function fnTrashCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById("<%= btncust.ClientID %>").click();
            }
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                //alert('test1');
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";

            }
            if (document.getElementById(e + '_TxtName').value == "") {
                //alert('test2');
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                //alert('test3');
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    //alert('test4');
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + 'ucCustomerCodeLov').value = "0";
                    document.getElementById('<%=ucCustomerCodeLov.ClientID %>').value = "";
                }
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>

                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divLOBSearch" runat="server">
                                <div class="md-input">
                                    <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" ToolTip="Line of Business" ValidationGroup="RFVDTransLander" class="md-form-control form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RFVComboLOB" ValidationGroup="RFVDTransLander" InitialValue="-- Select --"
                                            runat="server" ControlToValidate="ComboBoxLOBSearch" CssClass="validation_msg_box_sapn" ErrorMessage="Select Line of Business"
                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <%--    <cc1:ComboBox ID="ComboBoxLOBSearch" AutoPostBack="true" 
                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                        </cc1:ComboBox>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="divLawyerCode" visible="false">
                                <div class="md-input">
                                    <uc3:Suggest ID="ddlLawyerCode" ToolTip="Lawyer Code/Name" runat="server" AutoPostBack="true" IsMandatory="false"
                                        ServiceMethod="GetLawyerCode" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Lawyer Code/Name" ID="lblLawyerCode" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divShemeType" runat="server" visible="false">
                                <div class="md-input">
                                    <uc3:Suggest ID="ddlShemeType" ToolTip="Scheme Type" runat="server" IsMandatory="false" ServiceMethod="GetShemeType" />

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Scheme Type" runat="server" ID="lblSchemeType" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divBranchSearch" runat="server">
                                <div class="md-input">
                                    <asp:DropDownList ID="ComboBoxBranchSearch" runat="server" ToolTip="Branch" ValidationGroup="RFVDTransLander" class="md-form-control form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ComboBoxBranchSearch_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <%-- <cc1:ComboBox ID="ComboBoxBranchSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxBranchSearch_SelectedIndexChanged">
                        </cc1:ComboBox>--%>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                                            InitialValue="-- Select --" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxBranchSearch"
                                            SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtStartDateSearch" runat="server" AutoPostBack="True" ToolTip="Start Date" autoComplete="off"
                                        OnTextChanged="txtStartDateSearch_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                        TargetControlID="txtStartDateSearch">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="RFVDTransLander" CssClass="validation_msg_box_sapn"
                                            runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                            ErrorMessage="Enter a Start Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" ToolTip="Start Date" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEndDateSearch" runat="server" AutoPostBack="True" ToolTip="End Date" 
                                        class="md-form-control form-control login_form_content_input requires_true"
                                        OnTextChanged="txtEndDateSearch_TextChanged" autoComplete="off"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                        TargetControlID="txtEndDateSearch" >
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
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divDocNoSearch" runat="server">
                                <div class="md-input">
                                    <uc3:Suggest ID="ddlDocumentNumberSearch" ToolTip="Document Number" runat="server" AutoPostBack="true" IsMandatory="false" ServiceMethod="GetMultiDNCList"
                                        WatermarkText="--Select--" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>

                                    <label>
                                        <asp:Label Text="Document No" runat="server" ID="lblDocumentNo" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>




                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divMultipleDNC" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:DropDownList AutoPostBack="true" ID="ddlMultipleDNC" runat="server"
                                        OnSelectedIndexChanged="ddlMultipleDNC_SelectedIndexChanged">
                                    </asp:DropDownList>

                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Transaction" runat="server" ID="lblMultipleDNC"
                                            CssClass="styleDisplayLabel" />
                                    </label>

                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divDNCOption" runat="server">
                                <div class="md-input">
                                    <asp:DropDownList Visible="false" ID="ddlDNCOption" runat="server"
                                        OnSelectedIndexChanged="ddlDNCOption_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Select Status" runat="server" ID="lblDNCOption" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divInvoiceNo" runat="server">
                                <div class="md-input">
                                    <uc3:Suggest ID="cbxInvoiceNo" ToolTip="Invoice Number" runat="server" AutoPostBack="true" IsMandatory="false"
                                        ServiceMethod="GetInvoiceNumber"
                                        WatermarkText="--Select--" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Invoice No." ID="lblInvoiceNo" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divCasegeneration" runat="server">
                                <div class="md-input">
                                    <uc3:Suggest ID="ucCaseGenNo" ToolTip="Case Code" runat="server" IsMandatory="false"
                                        ServiceMethod="GetCaseGenNumber" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Case Code" runat="server" ID="lblCaseGenNo" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divTrackNo" runat="server">
                                <div class="md-input">
                                    <uc3:Suggest ID="ucTrackNo" ToolTip="Repossession Track Number" runat="server" IsMandatory="false"
                                        ServiceMethod="GetTrackNumber" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Repossession Track Number" runat="server" ID="lblTrackNo" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divNoticeNo" runat="server">
                                <div class="md-input">
                                    <uc3:Suggest ID="ucNoticeNo" ToolTip="Repossession Notice Number" runat="server" IsMandatory="false"
                                        ServiceMethod="GetNoticeNumber" AutoPostBack="true" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Repossession Notice Number" runat="server" ID="lblNoticeNo" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divAccNo" runat="server">
                                <div class="md-input">
                                    <uc3:Suggest ID="ucAccountNo" ToolTip="Account No" runat="server" IsMandatory="false" AutoPostBack="true"
                                        ServiceMethod="GetAccuntNoList" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Account Number" ToolTip="Account No" runat="server" ID="Label1" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divAccNoPopup" runat="server">
                                <div class="md-input">
                                    <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                        Style="display: none;" MaxLength="100"></asp:TextBox>
                                    <uc5:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                        strLOV_Code="ACC_LR_REPOREL" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                    <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                        Style="display: none" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="Account Number" runat="server" ID="Label2" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divProgramIDSearch" runat="server">
                                <div class="md-input">
                                    <asp:DropDownList ID="cmbDocumentNumberSearch" runat="server" ValidationGroup="RFVDTransLander" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <%--   <cc1:ComboBox ID="cmbDocumentNumberSearch" runat="server" AutoCompleteMode="SuggestAppend"
                            onkeyup="maxlengthfortxt(113)" DropDownStyle="DropDownList" MaxLength="0" CssClass="WindowsStyle">
                        </cc1:ComboBox>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label Text="" runat="server" ID="lblProgramIDSearch" CssClass="styleDisplayLabel" />
                                    </label>
                                </div>
                            </div>

                            <%--strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList"--%>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divCustomerCodeLov" runat="server">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustNoDummy" runat="server" CssClass="md-form-control form-control"
                                        Style="display: none;" MaxLength="100"></asp:TextBox>
                                    <uc5:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                        strLOV_Code="CUS_COM" ServiceMethod="GetCustomerCodeList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadCust_Click"
                                        Style="display: none" />
                                    <asp:Button ID="btncust" runat="server" CausesValidation="False" UseSubmitBehavior="False" OnClick="btncust_Click" Style="display: none" />
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:HiddenField ID="hdnCustomer_ID" runat="server" />
                                        <asp:Label ID="lblCustomerName" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label>
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divROPCancelNo" runat="server">
                                <div class="md-input">
                                    <UC4:AutoSugg ID="txtCancelNo" runat="server" ServiceMethod="GetCaseCancelNumber"  />
                                   
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCancelNo" runat="server" CssClass="styleDisplayLabel" Text="ROP Cancellation No" ToolTip="ROP Case Cancellation No" />
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" visible="false" id="divCaseNo" runat="server">
                                <div class="md-input">
                                    <UC4:AutoSugg ID="ddlCaseNo" runat="server" ServiceMethod="GetCaseGenNumber"  
                                        ErrorMessage="Select an ROP Case No" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblCaseNo" runat="server" Text="ROP Case No" ToolTip="ROP Case No" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="gird">
                    <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                        OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                        RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound" class="gird_details">
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

                <div class="row">
                    <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSearch" onserverclick="btnSearch_Click" runat="server" validationgroup="RFVDTransLander"
                        type="button" accesskey="S" title="Search, Alt+S">
                        <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>S</u>earch
                    </button>

                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Create, Alt+C">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" onclick="if(fnConfirmClear())" causesvalidation="false"
                        type="button" accesskey="L" title="Clear, Alt+L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                </div>
                <div class="row" style="display: none;">

                    <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />

                    <%--Hidden fields for grid usage--%>
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />

                    <asp:ValidationSummary ValidationGroup="RFVDTransLander" ID="vsTransLander" runat="server"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="true" />
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
