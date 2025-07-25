<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3G_LAD_TransactionApproval, App_Web_nqjy25qa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" language="javascript">
        function funPriCheckRevokeValidation() {

            if (confirm('Do you want to Revoke?')) {
                Page_BlockSubmit = false;
                var a = event.srcElement;

                if (a.type == "submit") {
                    a.style.display = 'none';
                }
                return true;
            }
            else {
                return false;
            }


        }
        function fnTrashCommonSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameLease.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameLease.ClientID %>').value = "";


                }
            }
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
        function checkDate_NextSystemDate_Request(sender, args) {

            var today = new Date();
            var todaydate = today;
            if (sender._selectedDate > Date.parse(todaydate)) {
                alert('Selected date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));
            }
            document.getElementById(sender._textbox._element.id).focus();
        }
        function GetFileE(fpath) {

            var filepath = document.getElementById(fpath.id.replace('imgDownLoadFileE', 'hdnFilePath'));
            if (document.getElementById(filepath.id).value != "")
                window.open('../Common/S3GDownloadPage.aspx?qsFileName=' + document.getElementById(filepath.id).value, 'newwindow', 'toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');
            else
                alert("File Not Found");
        }

        function fnLoadCust() {
            document.getElementById("<%= btnLoadCust.ClientID %>").click();
            //document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }

    </script>
    <asp:UpdatePanel ID="UPApprovals" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Approval Details" ID="pnlApprovalDetails" runat="server"
                                CssClass="stylePanel">
                                <%--<asp:Panel ID="pnlHeader" runat="server" ToolTip="Input Details"
                                GroupingText="Payment Information" CssClass="stylePanel">--%>
                                <div class="row">
                                    <div class="styleFieldLabel col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDocumentType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged" class="md-form-control form-control" ToolTip="Document Type">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVddlDocumentType" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlDocumentType"
                                                    Display="Dynamic" ErrorMessage="Select the Document Type" ValidationGroup="vggo" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblDocumentType" runat="server" CssClass="styleReqFieldLabel" Text="Document Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlAppStatus" runat="server" class="md-form-control form-control" ToolTip="Action Type" AutoPostBack="true" OnSelectedIndexChanged="ddlAppStatus_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RfvStatus" runat="server" ControlToValidate="ddlAppStatus"
                                                    Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select Action Type" ValidationGroup="vggo"
                                                    InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblAppstatus" runat="server" CssClass="styleReqFieldLabel" Text="Action Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" AutoPostBack="true" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleFieldLabel"
                                                    ToolTip="Line of Business"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="validation_msg_box_sapn" ID="RFVddlBranch"
                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlBranch" InitialValue="0"
                                                    ErrorMessage="Select Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                            </div>--%>
                                           <%-- <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="validation_msg_box_sapn" ID="RFVBranchGo"
                                                    SetFocusOnError="True" runat="server" ControlToValidate="ddlBranch" InitialValue="0"
                                                    ErrorMessage="Select Branch" ValidationGroup="vggo"></asp:RequiredFieldValidator>
                                            </div>--%>

                                            <%--<UC:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" ToolTip="Branch" AutoPostBack="true" />--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Branch" ToolTip="Branch" ID="lblBranch" CssClass="styleFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFromDate" ToolTip="From date" runat="server" AutoPostBack="true" OnTextChanged="txtFromDate_Changed" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                runat="server" Enabled="True" TargetControlID="txtFromDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ToolTip="From date" Text="From Date" ID="lblFromDate" CssClass="styleFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtToDate" ToolTip="To date" runat="server" AutoPostBack="true" OnTextChanged="txtToDate_Changed" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderToDate" runat="server" Enabled="True"
                                                TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ToolTip="To date" Text="To Date" ID="lblToDate" CssClass="styleFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" runat="server" id="dvEntityType" visible="false">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlPayTo" runat="server" ToolTip="Pay to" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ToolTip="Pay To" Text="Pay To" ID="lblPayTo" CssClass="styleFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <span class="highlight"></span>
                                            <asp:TextBox ID="txtCustomerNameLease" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="50"></asp:TextBox>
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" ToolTip="Customer/Entity" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="true" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" CssClass="validation_msg_box_sapn" ID="rfvtxtCustomerNameLease"
                                                    SetFocusOnError="True" runat="server" ControlToValidate="txtCustomerNameLease"
                                                    ErrorMessage="Select the Client" ValidationGroup="vggo"></asp:RequiredFieldValidator>
                                            </div>
                                            <label class="tess">
                                                <asp:Label runat="server" ToolTip="Cutomer or Entity" Text="Customer/Entity" ID="lblCustomerorEntity"
                                                    CssClass="styleMandatoryLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" runat="server" visible="false" id="dvDepositBank">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlDepositBank_SelectedIndexChanged" CssClass="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Deposit Bank" ID="lblDraweebank" CssClass="styleFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlDocumentNumber" runat="server" ServiceMethod="GetDocumentList"
                                                AutoPostBack="true" OnItem_Selected="ddlDocumentNo_Item_Selected" Enabled="false" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <label>
                                                <asp:Label ID="lblDocument_NoNew" runat="server" Text="Document No" CssClass="styleDisplayLabel" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <button class="css_btn_enabled" id="btnGo" title="GO,[Alt+G]" onclick="if(fnConfirmAdd('vggo','false'))" causesvalidation="false" onserverclick="btnGo_Click" runat="server"
                                        type="button" accesskey="G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>
                                    <asp:ValidationSummary ID="vsGo" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                                        ValidationGroup="vggo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                                    <asp:HiddenField ID="hdnid" runat="server" />
                                </div>




                                <div id="divFormatHelpBase" runat="server" class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnlClientOnlineStatus"
                                            ExpandControlID="divFormatHelp" CollapseControlID="divFormatHelp" Collapsed="True"
                                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="true" SkinID="CollapsiblePanelDemo" />

                                        <asp:Panel ID="divFormatHelp" runat="server" CssClass="accordionHeader" Width="98.5%" Visible="false">
                                            <div style="float: left;">
                                                Client Online Status?
                                            </div>
                                            <div style="float: left; margin-left: 20px;">
                                                <asp:Label ID="lblDetails" runat="server">(Show Details...)</asp:Label>
                                            </div>
                                            <div style="float: right; vertical-align: middle;">
                                                <asp:ImageButton ID="imgDetails" runat="server" ImageUrl="~/Images/expand_blue.jpg"
                                                    AlternateText="(Show Details...)" />
                                            </div>
                                        </asp:Panel>

                                    </div>

                                    <div class="row">
                                        <asp:Panel GroupingText="Client Online Status" ID="pnlClientOnlineStatus" runat="server" CssClass="stylePanel" Visible="false">
                                            <asp:Panel GroupingText="Limits" ID="pnlLimits" runat="server" CssClass="stylePanel">
                                                <div class="row">

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtPrepaymentLimit" Style="text-align: right" Enabled="false" runat="server" ToolTip="Pre Payment Limit" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblPrepaymentLimit" runat="server" Text="Pre Payment Limit" ToolTip="Pre Payment Limit" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtInvocieValueCap" Style="text-align: right" Enabled="false" runat="server" ToolTip="Invoice Value Cap" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblInvoiceValueCap" runat="server" Text="Invoice Value Cap" ToolTip="Invoice Value Cap" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtCrditPeriod" Style="text-align: right" Enabled="false" runat="server" ToolTip="Credit Period" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lbltxtCrditPeriod" runat="server" Text="Credit Period" ToolTip="Credit Period" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtGracePeriod" Style="text-align: right" Enabled="false" runat="server" ToolTip="Grace Period" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblGracePeriod" runat="server" Text="Grace Period" ToolTip="Grace Period" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                            </asp:Panel>

                                            <asp:Panel GroupingText="Current Values" ID="pnlCurValues" runat="server" CssClass="stylePanel">
                                                <div class="row">

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtDebtOutsatnding" Style="text-align: right" Enabled="false" runat="server" ToolTip="Debts Out Standing" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="Label2" runat="server" Text="Debts Out Standing" ToolTip="Debts Out Standing" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtDebtsUnApproved" Style="text-align: right" Enabled="false" runat="server" ToolTip="Debts Un Approved" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDebtsunApproved" runat="server" Text="Debts Un Approved" ToolTip="Debts Un Approved" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtDebtsApproved" Style="text-align: right" Enabled="false" runat="server" ToolTip="Debts Approved" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="Label3" runat="server" Text="Debts Approved" ToolTip="Debts Approved" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtDrawingPower" Style="text-align: right" Enabled="false" runat="server" ToolTip="Drawing Power" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblDebtsApproved" runat="server" Text="Drawing Power" ToolTip="Drawing Power" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtFundsInUse" Style="text-align: right" Enabled="false" runat="server" ToolTip="Funds In Use" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="Label4" runat="server" Text="Funds In Use" ToolTip="Funds In Use" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtFundsAvailable" Style="text-align: right" Enabled="false" runat="server" ToolTip="Funds Available" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblFundsAvailable" runat="server" Text="Funds Available" ToolTip="Funds Available" CssClass="styleDispalyLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>



                                                </div>
                                            </asp:Panel>
                                        </asp:Panel>



                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel GroupingText="Approver Details" ID="pnlAppDetails" runat="server" CssClass="stylePanel" Visible="false">
                                            <div class="row">

                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtApprovalDate" runat="server" ToolTip="Approval Date"
                                                            class="md-form-control form-control login_form_content_input requires_true"
                                                            OnTextChanged="txtApprovalDate_TextChanged" AutoPostBack="true"></asp:TextBox>

                                                        <cc1:CalendarExtender ID="calApprovalDate" runat="server" TargetControlID="txtApprovalDate">
                                                        </cc1:CalendarExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvApprovalDate" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtApprovalDate"
                                                                ValidationGroup="btnSave" Display="Dynamic" ErrorMessage="Select Approval Date"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblApprovalDate" runat="server" Text="Approval Date" ToolTip="Approval Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:Label ID="lblApproverName" runat="server" ToolTip="Approver Name"></asp:Label>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblhdrApproverName" runat="server" ToolTip="Approver Name" Text="Approver Name" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlAction" runat="server" class="md-form-control form-control" ToolTip="Action"></asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvddlAction" runat="server" ControlToValidate="ddlAction" ValidationGroup="btnSave"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Action"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label class="tess">
                                                            <asp:Label ID="lblAction" runat="server" ToolTip="Action" Text="Action" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" autocomplete="off" TextMode="Password" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Password"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtPassword" runat="server" TargetControlID="txtPassword"
                                                            FilterType="Custom" FilterMode="InvalidChars" InvalidChars=" ">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblPassword" runat="server" ToolTip="Password" Text="Password" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="btnSave"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                    <div class="md-input">
                                                        <asp:CheckBox ID="chkbxForceApproval" runat="server" />
                                                        <asp:Label ID="lblForceApproval" runat="server" ToolTip="Force Approval" Text="Force Approval" CssClass="styleDisplayLabel"></asp:Label>
                                                    </div>
                                                </div>

                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnltransaction" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Transaction Details">
                                            <div id="divTransaction" runat="server" class="gird">
                                                <asp:GridView ID="gvTransaction" runat="server" OnRowCommand="gvTransaction_RowCommand1" AutoGenerateColumns="False"
                                                    CssClass="styleInfoLabel" OnRowDataBound="gvTransaction_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl No">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvSlno" runat="server" Text="<%#Container.DataItemIndex+1%>" ToolTip="Sl No"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvApprovalSNO" Text='<%# Bind("Approval_Serial_Number")%>' runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="lblgvEntity" runat="server" Text='<%# Bind("Entity") %>' ToolTip="Customer Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="left" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Document Number" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:LinkButton Text='<%# Bind("Document_No") %>' CausesValidation="false" Style="color: red; text-underline-position: below;" runat="server" ID="Docid" OnClick="PaymentReqID_serverclick"></asp:LinkButton>
                                                                <asp:Label ID="lblgvDocument_No" runat="server" Text='<%# Bind("Document_No") %>'
                                                                    ToolTip="Document No" Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblInvoiceAmount" runat="server" Text='<%# Bind("Invoice_Amount") %>'
                                                                    ToolTip="Invoice Amount"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                        </asp:TemplateField>
                                                        <%--Added by Shibu 6-Jun-2013 --%>
                                                        <asp:TemplateField HeaderText="Approver">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvApprover" runat="server" Text='<%# Bind("Approver") %>'
                                                                    ToolTip="Approver Name"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Approval Date" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvApprovalDate" runat="server" Text='<%# Bind("Approval_Date") %>'
                                                                    ToolTip="Approver Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Upload" ItemStyle-Width="5%" HeaderStyle-Width="5%" FooterStyle-Width="5%" ItemStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgUpload" ToolTip="Upload Files" runat="server" Width="25px" Height="28px" OnClick="imgUpload_Click" ImageUrl="~/Images/upload_folder.PNG" />
                                                                <asp:HiddenField ID="hdnFilePath" runat="server" Value='<%# Eval("document_path") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="View Document">
                                                            <ItemTemplate>
                                                                <%--   <asp:ImageButton ID="imgView" ImageUrl="~/Images/ViewFile2_Enable.jpg" Width="30px" Height="30px" runat="server" ToolTip="View Document" Style="cursor: pointer;" onclick="GetFileE(this);" />--%>
                                                                <asp:ImageButton ID="imgView" ImageUrl="~/Images/ViewFile2_Enable.jpg" Width="30px" Height="30px" runat="server" ToolTip="View Document" OnClick="imgView_Click" Style="cursor: pointer;" />
                                                                <asp:Image ID="imgDownLoadFileE" ImageUrl="~/Images/downloadFile.PNG" Width="20px" Height="20px" runat="server" ToolTip="Download Document" Style="cursor: pointer;" onclick="GetFileE(this);" />
                                                                <asp:ImageButton ID="imgDelete" ImageUrl="~/Images/Delete_New.PNG" Width="20px" Height="20px" runat="server" ToolTip="Delete" OnClick="btnDelete_Click" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvstatus" runat="server" Text='<%# Bind("Approval_status") %>'
                                                                    ToolTip="Status"></asp:Label>
                                                                <asp:DropDownList ID="ddlStatus" runat="server" Visible="false" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true" ToolTip="Status"></asp:DropDownList>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="10%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Select">
                                                            <HeaderTemplate>
                                                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged"
                                                                    Text="Select All" ToolTip="Include" />
                                                            </HeaderTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelect" runat="server" OnCheckedChanged="chkSelect_CheckedChanged" AutoPostBack="true" ToolTip="Select" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgvRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(200)"
                                                                    MaxLength="200" Width="300px" Text='<%# Bind("remarks") %>' CssClass="lowercase" ToolTip="Remarks"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftegvRemarks" runat="server" TargetControlID="txtgvRemarks"
                                                                    FilterType="Numbers, LowercaseLetters,UppercaseLetters, Custom" ValidChars="!@#$%&*/|{}[]():;,. " Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Deviation Remarks">
                                                            <ItemTemplate>
                                                                <asp:Button ID="btnIDeviationRemarks" CssClass="css_btn_enabled" runat="server" Text="Deviation Remarks" Width="100px"
                                                                    OnClick="btnIDeviationRemarks_Click" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="UserId" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvuser_id" runat="server" Text='<%# Bind("user_id") %>'
                                                                    ToolTip="Document No"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imganimation" runat="server" Visible="false"
                                                                    ImageUrl="~/Images/animation_processing.gif" ToolTip="Start Date" ImageAlign="AbsMiddle" Height="40px" Width="40px" />
                                                                <asp:Label ID="lblgvstatus1" runat="server" Text='<%# Bind("status") %>'
                                                                    ToolTip="Document No"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sl.No" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvSl_no" runat="server" Text='<%# Bind("Sl_no") %>'
                                                                    ToolTip="Document No"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Id" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvid" runat="server" Text='<%# Bind("ID") %>'
                                                                    ToolTip="Document No"></asp:Label>
                                                                <asp:Label ID="lblgvAccountStatus" runat="server" Text='<%# Bind("ACCOUNTSTATUS") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblgvLOB" runat="server" Text='<%# Bind("lob_id") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblgv_ApprovalID" runat="server" Text='<%# Bind("APPROVAL_ID") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>

                                <input type="hidden" value="0" runat="server" id="hdnID1" />
                            </asp:Panel>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 styleFieldLabel">--%>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))"
                            causesvalidation="false" onserverclick="btnSave_Click"
                            runat="server" type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnTranWithdrawl" title="Withdraw[Alt+W]" onclick="if(fnConfirmWithdraw('btnSave'))"
                            causesvalidation="false" onserverclick="btnTranWithdrawl_ServerClick"
                            runat="server" type="button" accesskey="W">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>W</u>ithDraw
                        </button>
                        <button class="css_btn_enabled" id="btnRevoke" title="Revoke[Alt+R]" onclick="if(funPriCheckRevokeValidation())"
                            causesvalidation="false" onserverclick="btnRevoke_ServerClick"
                            runat="server" type="button" accesskey="R">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                            causesvalidation="false" onserverclick="btnCancel_Click"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <asp:HiddenField ID="hdnLobCode" runat="server" />
                    </div>
                    <%--  </div>
                    </div>--%>
                    <%-- <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>

                    <asp:HiddenField ID="hdnrow" runat="server" />
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:ValidationSummary ID="vsSave" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                        ValidationGroup="btnSave" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />

                    <%--                        <asp:ValidationSummary ValidationGroup="btnCust" ID="VSPayTo" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />--%>
                    <%-- </div>
                    </div>--%>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ddlDocumentNumber" />
        </Triggers>
    </asp:UpdatePanel>


    <asp:Label ID="lblfile" runat="server" Style="display: none;"></asp:Label>

    <cc1:ModalPopupExtender ID="MPUploadFiles" runat="server" PopupControlID="plUploadfiles" TargetControlID="lblfile"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="plUploadfiles" GroupingText="" Height="150px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">

        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="md-input">
                    <asp:FileUpload ID="fuOtherFiles" runat="server" Width="200px" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label class="tess">
                        <asp:Label ID="Label1" runat="server" Text="Upload File"></asp:Label>
                    </label>
                </div>
            </div>

        </div>
        <div class="row">
            <asp:UpdatePanel ID="updpnlPopup" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnOk" title="Ok[Alt+O]" causesvalidation="false" onserverclick="btnOk_Click"
                            runat="server" type="button" accesskey="O">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>O</u>k
                        </button>

                        <button class="css_btn_enabled" id="btnUploadCancel" title="Exit[Alt+I]" causesvalidation="false" onserverclick="btnUploadCancel_Click"
                            runat="server" type="button" accesskey="I">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                        </button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnOk" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlDeviationRemarks" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="PnlDeviationRemarks" Style="display: none; vertical-align: middle" runat="server" Visible="true"
        BorderStyle="Solid" BackColor="White">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvDevDtls" runat="server" AutoGenerateColumns="false" Height="150px" Visible="true"
                                    OnRowDataBound="grvDevDtls_RowDataBound" OnRowDeleting="grvDevDtls_RowDeleting" Width="100%" EmptyDataText="No Records Found"
                                    ShowFooter="true">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Serial Number" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSequenceNumber" ToolTip="Serial Number" Text='<% #Bind("SequenceNumber")%>'
                                                    runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Deviation Desc">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDevDesc" runat="server" Text='<% #Bind("DevDesc")%>' ToolTip="Deviation Desc">
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtIDevRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(200)"
                                                    MaxLength="200" Width="300px" Text='<%# Bind("Devremarks") %>' CssClass="lowercase" ToolTip="Remarks"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="fteIDevRemarks" runat="server" TargetControlID="txtIDevRemarks"
                                                    FilterType="Numbers, LowercaseLetters,UppercaseLetters, Custom" ValidChars="!@#$%&*/|{}[]():;,. " Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                            </ItemTemplate>

                                            <HeaderStyle HorizontalAlign="Center" Width="15%" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Center" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Deviation No" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDevNo" runat="server" Text='<% #Bind("Document_No")%>' ToolTip="Deviation Desc">
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row" style="float: right; margin-top: 5px;">
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-right: 35px;">
                                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                    <asp:Button ID="btnDEVModalAdd" runat="server" Text="Save" ToolTip="Save,Alt+V" AccessKey="V" class="css_btn_enabled"
                                        OnClick="btnDEVModalAdd_Click" />
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-right: 10px;">
                                    <i class="fa fa-reply btn_i" aria-hidden="true"></i>
                                    <asp:Button ID="btnDEVModalCancel" runat="server" Text="Exit" OnClick="btnDEVModalCancel_Click" AccessKey="T"
                                        ToolTip="Exit,ALt+T" class="css_btn_enabled" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <asp:Button ID="btnModal" Style="display: none" runat="server" />

</asp:Content>

