<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="S3G_Application_ProcessReports, App_Web_qvacefhr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="ContentTransLander" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <script language="javascript" type="text/javascript">
                function fnTrashCommonSuggestAccount(e) {

                    //Sathish R--13-11-2018
                    if (document.getElementById(e + '_txtItemName').value == "") {
                        document.getElementById(e + '_hdnSelectedValue').value = "0";
                        document.getElementById("<%= btnAcc.ClientID %>").click();
                    }
                    if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                        //alert('test1');
                        document.getElementById(e + '_txtItemName').value = "";
                        document.getElementById('<%=ddlPNum.ClientID %>').value = "";

                    }
                    if (document.getElementById(e + '_txtItemName').value == "") {
                        //alert('test2');
                        document.getElementById(e + '_hdnSelectedValue').value = "0";
                        document.getElementById('<%=ddlPNum.ClientID %>').value = "";
                    }
                    if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                        //alert('test3');
                        if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                            //alert('test4');
                            document.getElementById(e + '_txtItemName').value = "";
                            document.getElementById(e + 'ddlPNum').value = "0";
                            document.getElementById('<%=ddlPNum.ClientID %>').value = "";
                        }
                    }
                }

                function fnTrashCommonSuggestCustomer(e) {

                    //Sathish R--13-11-2018
                    if (document.getElementById(e + '_txtItemName').value == "") {
                        document.getElementById(e + '_hdnSelectedValue').value = "0";
                        document.getElementById("<%= btnClientCus.ClientID %>").click();
                           }
                           if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                               //alert('test1');
                               document.getElementById(e + '_txtItemName').value = "";
                               document.getElementById('<%=ddlPNum.ClientID %>').value = "";

                           }
                           if (document.getElementById(e + '_txtItemName').value == "") {
                               //alert('test2');
                               document.getElementById(e + '_hdnSelectedValue').value = "0";
                               document.getElementById('<%=ddlPNum.ClientID %>').value = "";
                           }
                           if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                               //alert('test3');
                               if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                                   //alert('test4');
                                   document.getElementById(e + '_txtItemName').value = "";
                                   document.getElementById(e + 'ddlPNum').value = "0";
                                   document.getElementById('<%=ddlPNum.ClientID %>').value = "";
                        }
                    }
                }
            </script>
            <script type="text/javascript">
</script>
            <div class="tab-pane fade in active show" id="tab1">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" EnableViewState="false" CssClass="styleInfoLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlAppProcessRpt" runat="server" GroupingText="Common Report Screen" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%-- <cc1:ComboBox ID="cmbddlModule" AutoPostBack="true" ValidationGroup="GO"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ddlModuleName_SelectedIndexChanged">
                                        </cc1:ComboBox>--%>

                                        <asp:DropDownList ID="cmbddlModule" runat="server" ToolTip="Module" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlModuleName_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvcmbddlModule" ValidationGroup="GO" InitialValue="0"
                                                CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select the Module Name" ControlToValidate="cmbddlModule"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Module Name" ID="lblModuleName" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <%-- <cc1:ComboBox ID="ddlReportName" AutoPostBack="true" ValidationGroup="GO"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ddlReportName_SelectedIndexChanged">
                                        </cc1:ComboBox>--%>
                                        <asp:DropDownList ID="ddlReportName" runat="server" ToolTip="Report Name" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlReportName_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>

                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvReportName" ValidationGroup="GO" InitialValue="0"
                                                CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select the Report Name" ControlToValidate="ddlReportName"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Report Name" ID="lblReportName" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvStartDateSearch" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDateSearch" runat="server" ValidationGroup="GO" autocomplete="off"
                                            OnTextChanged="txtStartDateSearch_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderStartDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                            <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVStartDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtStartDateSearch" SetFocusOnError="True"
                                                ErrorMessage="Enter the Start Date" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Start Date" ID="lblStartDateSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvEndDateSearch" runat="server">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDateSearch" runat="server" ValidationGroup="GO"
                                            OnTextChanged="txtEndDateSearch_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgEndDateSearch" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="End Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtenderEndDateSearch" runat="server" Enabled="True"
                                            PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                            <%-- OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVEndDate" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtEndDateSearch" SetFocusOnError="True" ErrorMessage="Enter the End Date"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblEndDateSearch" Text="End Date" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLOB">
                                    <div class="md-input">
                                        <%--<cc1:ComboBox ID="ComboBoxLOBSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged">
                                        </cc1:ComboBox>--%>
                                        <asp:DropDownList ID="ComboBoxLOBSearch" runat="server" ToolTip="Line of Business" AutoPostBack="true"
                                            OnSelectedIndexChanged="ComboBoxLOBSearch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOBSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvLocation">
                                    <div class="md-input">
                                        <%--  <cc1:ComboBox ID="ComboBoxBranchSearch" AutoPostBack="true" ValidationGroup="RFVDTransLander"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" CssClass="WindowsStyle" OnSelectedIndexChanged="ComboBoxBranchSearch_SelectedIndexChanged">
                                        </cc1:ComboBox>--%>

                                        <asp:DropDownList ID="ComboBoxBranchSearch" runat="server" ToolTip="Branch" AutoPostBack="true"
                                            OnSelectedIndexChanged="ComboBoxBranchSearch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVComboBranch" ValidationGroup="RFVDTransLander"
                                                InitialValue="-- Select --" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ComboBoxBranchSearch"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Branch" runat="server" ID="lblBranchSearch" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="Div_ddlPNum" runat="server">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlPNum" runat="server" ToolTip="Account Number" ServiceMethod="GetAccountNo" OnItem_Selected="ddlPNum_Item_Selected" AutoPostBack="true" class="md-form-control form-control" />
                                        <asp:Button ID="btnAcc" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnAcc_Click"
                                            Style="display: none" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblPNum" CssClass="styleDisplayLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divPropsalNo" visible="false" runat="server">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlProposalNo" runat="server" ToolTip="Proposal Number" ServiceMethod="GetProposalNo" OnItem_Selected="ddlProposal_Number_Selected" AutoPostBack="true" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label21" CssClass="styleDisplayLabel" Text="Proposal Number" ToolTip="Proposal Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>


                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divCutoffDay" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCutoffDay" runat="server" MaxLength="3" ToolTip="Factored Amount"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftCutoffDay" runat="server" TargetControlID="txtCutoffDay"
                                            FilterType="Numbers" ValidChars="" Enabled="true">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfCutoffDay" runat="server" ErrorMessage="Enter Cutoff Day"
                                                ValidationGroup="PDF" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtCutoffDay"
                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblCutoffday" runat="server" CssClass="styleFieldLabel" Text="Cutoff Day"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divClient" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ucClientName" runat="server" ServiceMethod="GetClientName" ToolTip="Client Name" ReadOnly="true" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblClientName" CssClass="styleDisplayLabel" Text="Client Name" ToolTip="Client Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvBasedonClient" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlCleintCustomer" runat="server" ServiceMethod="GetClientCustomerListName" ToolTip="Customer Name" class="md-form-control form-control" />
                                        <asp:Button ID="btnClientCus" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnClientCus_Click"
                                            Style="display: none" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label20" CssClass="styleDisplayLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divClientNameFact" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ucFactClientName" runat="server" ServiceMethod="GetClientListName" ToolTip="Client Name" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label18" CssClass="styleDisplayLabel" Text="Client Name" ToolTip="Client Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="Div_ddlEntityName" runat="server">
                                    <div class="md-input">
                                        <%--<cc1:ComboBox ID="ddlEntityName" AutoPostBack="false" Visible="true" ValidationGroup="GO"
                                            runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList"
                                            MaxLength="0" CssClass="WindowsStyle">
                                        </cc1:ComboBox>--%>
                                        <uc:Suggest ID="ddlEntityName" runat="server" ServiceMethod="GetVendorsList"
                                            ToolTip="Client Name" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Entity Name" ID="lblEntityName" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divClientDetails" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlClient" runat="server" ServiceMethod="GetClientNameList" ToolTip="Client Name" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label1" CssClass="styleDisplayLabel" Text="Client Name" ToolTip="Client Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 styleFieldLabel" id="divCustomerName" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ucCustomerName" runat="server" ToolTip="Customer Name" ServiceMethod="GetClientCodeList" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divAccountFact" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ucAccountFact" runat="server" ServiceMethod="GetAccountNoFact" ToolTip="Account Number" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label17" CssClass="styleDisplayLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divStatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlStatus" runat="server" ToolTip="Branch" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Status" runat="server" ID="lblStatus" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divChequeBookNumber" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlChequeBookNumber" runat="server" ServiceMethod="GetChequeBookNoList" ToolTip="From Cheque Book No" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblChequeBookNo" CssClass="styleDisplayLabel" Text="From Cheque Book No" ToolTip="From Cheque Book No"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divChequeBookToNumber" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlChequeBookToNumber" runat="server" ServiceMethod="GetChequeBookNoList" ToolTip="To Cheque Book No" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label11" CssClass="styleDisplayLabel" Text="To Cheque Book No" ToolTip="To Cheque Book No"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divComplianceType" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlComplianceType" runat="server" ToolTip="Compliance Amount Type" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Compliance Amount Type" runat="server" ID="lblComplianceType" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divMonth" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlMonth" runat="server" ServiceMethod="GetDeliquentMonthList" ToolTip="Month/Year[Ex :YYYYMM]" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblMonth" CssClass="styleReqFieldLabel" Text="Month/Year" ToolTip="Cheque Book No"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divChequeMovementStatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlChequeMovementStatus" runat="server" ToolTip="Status" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Status" runat="server" ID="Label2" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCreditApprovalRpt1" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFinacialYearBase" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlFinacialYearBase_SelectedIndexChanged"
                                            ToolTip="Financial Years" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFinancialYearBase" runat="server" Text="Financial Years " CssClass="styleReqFieldLabel" ToolTip="Financial Years"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvCreditApprovalRpt2" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFromYearMonthBase" runat="server"
                                            ToolTip="Month" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFromYearMonthBase" runat="server" Text="Month" CssClass="styleReqFieldLabel" ToolTip="Month"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divChequeBookBankBranch" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlChequeBookBankBranch" runat="server" ServiceMethod="GetChequeBookBankBranchList" ToolTip="Bank Branch Name" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="Label3" CssClass="styleDisplayLabel" Text="Bank Branch Name" ToolTip="Bank Branch Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divChequeBookStatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlChequeBookStatus" runat="server" ToolTip="Cheque Leaf Status" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Cheque Leaf Status" runat="server" ID="Label6" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divlawyer" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ddlawyerCode" runat="server" ServiceMethod="GetLawyerCode" ToolTip="Bank Branch Name" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLawyerCode" runat="server" Text="Lawyer Code/Name" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divCaseStatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlCaseStatus" runat="server" ToolTip="ROP Case Status" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="ROP Case Status" runat="server" ID="Label8" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divCourtCaseStatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlCourtCaseStatus" runat="server" ToolTip="Case Status" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Court Case Status" runat="server" ID="Label10" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divAccountStatus" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAccountStatus" runat="server" ToolTip="Case Status" class="md-form-control form-control">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="All" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Live" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Closed" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Account Status" runat="server" ID="Label12" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divProgramName" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlProgramName" runat="server" ToolTip="Branch" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Program Name" runat="server" ID="Label13" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvReportMonth" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtReportMonth" runat="server" ValidationGroup="GO" autocomplete="off"
                                            OnTextChanged="txtReportMonth_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgReportMonth" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="calReportMonth" runat="server" Enabled="True"
                                            PopupButtonID="imgReportMonth" Format="MMM-yyyy" TargetControlID="txtReportMonth">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvReportMonth" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtReportMonth" SetFocusOnError="True"
                                                ErrorMessage="Enter the Report Month" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Report Month" ID="Label14" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="divFinYear" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFinYear" runat="server" ToolTip="Branch"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVFinYear" ValidationGroup="GO" ErrorMessage="Select Financial year"
                                                InitialValue="0" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="ddlFinYear"
                                                SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Financial Year" runat="server" ID="lblFinYear" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvFromMonth" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFromMonth" runat="server" ValidationGroup="GO" autocomplete="off"
                                            OnTextChanged="txtFromMonth_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="Image1" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                            PopupButtonID="imgReportMonth" Format="MMM-yyyy" TargetControlID="txtFromMonth">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtFromMonth" SetFocusOnError="True"
                                                ErrorMessage="Enter the From Month" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="From Month" ID="Label15" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvToMonth" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtToMonth" runat="server" ValidationGroup="GO" autocomplete="off"
                                            OnTextChanged="txtToMonth_TextChanged" AutoPostBack="True"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="Image2" runat="server"
                                            ImageUrl="~/Images/calendaer.gif" ToolTip="Start Date" Visible="false" />
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                            PopupButtonID="imgReportMonth" Format="MMM-yyyy" TargetControlID="txtToMonth">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="GO" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtToMonth" SetFocusOnError="True"
                                                ErrorMessage="Enter the To Month" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="To Month" ID="Label16" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvODLOBCheckBox" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:Label runat="server" Text="Report Type:   " ID="Label19" CssClass="styleDisplayLabel" />
                                        <asp:CheckBox ID="chkLOBWise" runat="server" OnCheckedChanged="chkLOBWise_CheckedChanged" AutoPostBack="true" />

                                        <asp:Label runat="server" Text="Line Of Business Wise" ID="lblcbxLob" CssClass="styleDisplayLabel" />

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvODLOCTCheckBox" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkBranchWise" runat="server" OnCheckedChanged="chkBranchWise_CheckedChanged" AutoPostBack="true" />
                                        <asp:Label runat="server" Text="Branch Wise" ID="lblcbxLocation" CssClass="styleDisplayLabel" />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="dvDCName" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDCName" runat="server" ToolTip="Debt Collector" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label Text="Debt Collector" runat="server" ID="lblDebtCollector" CssClass="styleDisplayLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divFlatRate" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtFlatRate" runat="server" MaxLength="2" ToolTip="Flat Rate"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="ftbeFlatRate" runat="server" TargetControlID="txtFlatRate"
                                            FilterType="Numbers" ValidChars="" Enabled="true">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFlatRate" runat="server" CssClass="styleDisplayLabel" Text="Flat Rate"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" id="divDealer" runat="server" visible="false">
                                    <div class="md-input">
                                        <uc:Suggest ID="ucDealer" runat="server" ServiceMethod="GetDealerName" ToolTip="Dealer Name/Code" class="md-form-control form-control" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblDealer" CssClass="styleDisplayLabel" Text="Dealer Name/Code" ToolTip="Dealer Name/Code"></asp:Label>
                                        </label>
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
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel GroupingText="Function Type" ID="pnlFnType" runat="server" CssClass="stylePanel">
                            <asp:GridView runat="server" ID="grvFunctionType" Width="100%" HeaderStyle-CssClass="styleGridHeader"
                                OnRowDataBound="grvFunctionType_RowDataBound" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Function Type"
                                        HeaderStyle-Width="100%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFNTypeDesc" runat="server" ToolTip='<%#Eval("Name")%>' Text='<%#Eval("Name")%>'></asp:Label>
                                            <asp:Label ID="lblFNTypeID" runat="server" Visible="false" Text='<%#Eval("Value")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-Width="30%">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkSelectAllFT" runat="server"></asp:CheckBox>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelectFT" runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">

                    <button class="css_btn_enabled" id="btnSearch" onclick="if(fnCheckPageValidators('GO',false))"
                        onserverclick="btnSearch_Click" validationgroup="GO" runat="server"
                        type="button" causesvalidation="false" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnCreate" onserverclick="btnCreate_Click" runat="server"
                        type="button" accesskey="C" title="Create, Alt+C" visible="false">
                        <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>C</u>reate
                    </button>

                    <button class="css_btn_enabled" id="ImgBtnExcel" onserverclick="ImgBtnExcel_Click"
                        runat="server" visible="false"
                        type="button" causesvalidation="false" accesskey="A" title="Excel,Alt+A">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel
                    </button>

                    <button class="css_btn_enabled" id="BtnPDF" onserverclick="BtnPDF_Click"
                        runat="server" visible="false" validationgroup="PDF"
                        type="button" causesvalidation="true" accesskey="P" title="PDF,Alt+P">
                        <i class="fa fa-file-pdf-o" aria-hidden="true"></i></i>&emsp;<u>P</u>DF
                    </button>

                    <button class="css_btn_enabled" id="btnSaleRegPrint" onserverclick="BtnPDF_Click"
                        runat="server" visible="false" validationgroup="GO"
                        type="button" causesvalidation="true" accesskey="P" title="PDF,Alt+P">
                        <i class="fa fa-file-pdf-o" aria-hidden="true"></i></i>&emsp;<u>P</u>DF
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L" title="Clear, Alt+L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>
                <%--<div align="center">

                    <asp:ImageButton ID="ImgBtnExcel" CssClass="styleDisplayLabel" OnClientClick="return fnCheckPageValidators('GO',false);" 
                        Visible="false" OnClick="ImgBtnExcel_Click" ImageUrl="~/Images/ExcelExport10.png"
                        Width="50px" Height="50px" runat="server" AccessKey="X" ToolTip="Export to Excel[Alt+X]" />
                </div>--%>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvTransLander" Width="100%" AutoGenerateColumns="true"
                                OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                                RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBound">
                            </asp:GridView>
                            <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div style="display: none;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView runat="server" ID="grvTransLanderExcel" Width="100%" AutoGenerateColumns="true"
                                OnRowCommand="grvTransLander_RowCommand" HeaderStyle-CssClass="styleGridHeader"
                                RowStyle-HorizontalAlign="Left" OnRowDataBound="grvTransLander_RowDataBoundExcel">
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <asp:Panel ID="pnlCustomerStatementOfAccount" runat="server" CssClass="stylePanel" Visible="false"
                        Width="100%">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvCustomerSOA" runat="server" AutoGenerateColumns="False" ToolTip="Customer Statement Of Account" EmptyDataText="No Records Found"
                                        OnRowDataBound="grvCustomerSOA_RowDataBound" Width="100%" ShowFooter="true">
                                        <Columns>
                                            <%--buckets--%>
                                            <asp:TemplateField HeaderText="Voucher Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVoucherNo" runat="server" Text='<%# Bind("VoucherNo")  %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" Width="150px" />
                                            </asp:TemplateField>
                                            <%--From Days--%>
                                            <asp:TemplateField HeaderText="Voucher Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVoucherDate" runat="server" Text='<%# Bind("VoucherDate")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <%--To days--%>
                                            <asp:TemplateField HeaderText="Voucher Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblVoucherType" runat="server" Text='<%# Bind("VoucherType")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <%--Select NO OF DAYS CHKBOX--%>
                                            <asp:TemplateField HeaderText="Instrument Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstType" runat="server" Text='<%# Bind("InstType")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Account Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBankAccount" runat="server" Text='<%# Bind("BankAccount")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Instrument Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="InstrumentNo" runat="server" Text='<%# Bind("InstrumentNo")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Narration">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNarration" runat="server" Text='<%# Bind("Narration")%>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalF" Text="Total :" runat="server" ToolTip="Total"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Debit" ItemStyle-HorizontalAlign="Right"
                                                FooterStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDebt" runat="server" Text='<%# Bind("Debit") %>'
                                                        ToolTip="Debit"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblDebtF" Text="Total :" runat="server" ToolTip="Total"></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>

                                            <%--<asp:TemplateField HeaderText="Debit">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDebt" runat="server" Text='<%# Bind("Debit")%>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblDebtF" Text="Total Debt" runat="server" ToolTip="Total Debt"></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Credit" ItemStyle-Width="90px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCredit" runat="server" Text='<%# Bind("Credit")%>'
                                                        Width="150px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="90px" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblCreditF" Text="Total Credit" runat="server" ToolTip="Total Credit"></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance" ItemStyle-Width="90px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance")%>'
                                                        Width="150px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" Width="90px" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblBalanceF" Text="Total Balance" runat="server" ToolTip="Total Credit"></asp:Label>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="" ItemStyle-Width="90px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldrcr" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbldrcrF" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <asp:Panel runat="server" ID="pnlProposalStatusQueryHeader" Visible="false" CssClass="stylePanel" GroupingText="Count Details" Width="100%">
                        <div>
                            <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div align="right">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:Label ID="lblLevel" Text="Level Description :" CssClass="styleDisplayLabel" runat="server" ToolTip="Level Description">
                                                </asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:Label ID="lblApproved" Text="Approved Status :" CssClass="styleDisplayLabel" runat="server">
                                                </asp:Label>
                                                <asp:Label ID="lblApprovedValue" CssClass="styleDisplayLabel" runat="server">
                                                </asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:Label ID="lblCancelled" Text="Rejected and Cancelled Status :" CssClass="styleDisplayLabel" runat="server">
                                                </asp:Label>
                                                <asp:Label ID="lblCancelledValue" CssClass="styleDisplayLabel" runat="server">
                                                </asp:Label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:Label ID="lblProgress" Text="Progress Status :" CssClass="styleDisplayLabel" runat="server">
                                                </asp:Label>
                                                <asp:Label ID="lblProgressValue" CssClass="styleDisplayLabel" runat="server">
                                                </asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">

                    <asp:Panel ID="pnlProposalStatusQuery" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Proposal Status Query Details"
                        Width="100%">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <asp:GridView ID="grvProposalStatusQuery" runat="server" AutoGenerateColumns="true"
                                        ToolTip="Proposal Status Query" EmptyDataText="No Records Found" Width="100%" ShowFooter="true"
                                        OnRowDataBound="grvProposalStatusQuery_RowDataBound">
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <asp:Panel runat="server" ID="pnlSummary" Visible="false" CssClass="stylePanel" GroupingText="Summary" Width="100%">
                        <div align="right">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="md-input">
                                    <asp:Label ID="Label7" Text="Opening Balance :" CssClass="styleDisplayLabel" runat="server" ToolTip="Opening Balance" Visible="false">
                                    </asp:Label>
                                    <asp:Label ID="lblOpeningBalanceAmt" CssClass="styleDisplayLabel" runat="server" ToolTip="Opening Balance">
                                    </asp:Label>
                                </div>
                                <div class="md-input">
                                    <asp:Label ID="Label9" Text="Closing Balance :" CssClass="styleDisplayLabel" runat="server" ToolTip="Closing Balance" Visible="false">
                                    </asp:Label>
                                    <asp:Label ID="lblClosingBalanceAmt" CssClass="styleDisplayLabel" runat="server" ToolTip="Closing Balance">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="md-input">
                                    <asp:Label ID="lblClient" Text="Total for Account / Client(Dr) :" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Client">
                                    </asp:Label>
                                    <asp:Label ID="lblClientAmount" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Client">
                                    </asp:Label>
                                </div>
                                <div class="md-input">
                                    <asp:Label ID="lblCustomer" Text="Total for Customer(Dr) :" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Customer">
                                    </asp:Label>
                                    <asp:Label ID="lblCustomerAmount" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Customer">
                                    </asp:Label>
                                </div>
                            </div>
                        </div>
                        <div align="right">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="md-input">
                                    <asp:Label ID="Label4" Text="Total for Account / Client(Cr) :" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Client">
                                    </asp:Label>
                                    <asp:Label ID="lblClientAmountcr" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Client">
                                    </asp:Label>
                                </div>
                                <div class="md-input">
                                    <asp:Label ID="Label5" Text="Total for Customer(Cr) :" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Customer">
                                    </asp:Label>
                                    <asp:Label ID="lblCustomerAmountcr" CssClass="styleDisplayLabel" runat="server" ToolTip="Total for Customer">
                                    </asp:Label>
                                </div>
                                <button class="css_btn_enabled" id="btnExcel" title="Export to Excel[Alt+A]" causesvalidation="false" visible="false"
                                    onserverclick="btnExcel_ServerClick" runat="server"
                                    type="button" accesskey="A">
                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;E<u>x</u>cel
                                </button>
                            </div>
                        </div>
                    </asp:Panel>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
                        <input type="hidden" id="hdnSortDirection" runat="server" />
                        <input type="hidden" id="hdnSortExpression" runat="server" />
                        <input type="hidden" id="hdnSearch" runat="server" />
                        <input type="hidden" id="hdnOrderBy" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ValidationGroup="GO" ID="vsTransLander" runat="server" Visible="false" Enabled="false"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                    </div>
                </div>

            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImgBtnExcel" />
            <asp:PostBackTrigger ControlID="btnExcel" />
            <asp:PostBackTrigger ControlID="BtnPDF" />
            <asp:PostBackTrigger ControlID="btnSaleRegPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

