<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GLoanAdTransferofAccounts_Master_Add, App_Web_fteskag1" title="Transfer of Accounts" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="mbcbb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <script type="text/javascript">
                function fnLoadAccount() {
                    document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
                }

                function fnTrashCommonSuggest(e) {


                    //Sathish R--13-11-2018
                    if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                        document.getElementById(e + '_TxtName').value = "";
                        document.getElementById('<%=txtAccountLov.ClientID %>').value = "";
                    }
                    if (document.getElementById(e + '_TxtName').value == "") {
                        document.getElementById(e + '_hdnSelectedValue').value = "0";
                        document.getElementById('<%=txtAccountLov.ClientID %>').value = "";
                    }
                    if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                        if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                            document.getElementById(e + '_TxtName').value = "";
                            document.getElementById(e + '_hdnSelectedValue').value = "0";
                            document.getElementById('<%=txtAccountLov.ClientID %>').value = "";


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
            </script>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Transfer Information">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAccountStatus" class="md-form-control form-control" OnSelectedIndexChanged="ddlAccountStatus_SelectedIndexChanged" AutoPostBack="true"
                                            runat="server" ToolTip="Account Status" Visible="true">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvAccountStatus" runat="server" SetFocusOnError="true"
                                                InitialValue="-1" Display="Dynamic" ErrorMessage="Select the Account Status" ValidationGroup="Header" CssClass="validation_msg_box_sapn"
                                                ControlToValidate="ddlAccountStatus"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Account Status" ID="lblAccountStatus" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOBAccTras" runat="server" OnSelectedIndexChanged="ddlLOBAccTras_SelectedIndexChanged" AutoPostBack="true" class="md-form-control form-control" ToolTip="Line of Business">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvLineofBusiness" runat="server" ControlToValidate="ddlLOBAccTras" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Line of Business" InitialValue="-1" SetFocusOnError="True" ValidationGroup="Header"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Panel ID="pnlFrom" runat="server" CssClass="stylePanel" GroupingText="Transfer From">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFromBranchCode" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlFromBranchCode_SelectedIndexChanged1" AutoPostBack="true" ToolTip="From Branch"></asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlFromBranchCode" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the From Branch" InitialValue="0" SetFocusOnError="True" ValidationGroup="Header"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="From Branch" ID="lblBranchCode" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>


                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">

                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" ToolTip="Account No." DispalyContent="Both"
                                            strLOV_Code="ACC_ACCTRA" ServiceMethod="GetAccuntNoList" OnItem_Selected="ucAccountLov_Item_Selected" />
                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                            Style="display: none" />
                                        <asp:TextBox ID="txtAccountLov" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;"></asp:TextBox>
                                        <asp:HiddenField ID="hdnRecordsCount" runat="server" />
                                        <%-- <span class="highlight"></span>
                                        <span class="bar"></span>--%>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtAccountLov" runat="server" ErrorMessage="Select the Account No"
                                                SetFocusOnError="true" ControlToValidate="txtAccountLov" CssClass="validation_msg_box_sapn" ValidationGroup=""
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label ID="lblAccountNo" runat="server" Text="Account No."> </asp:Label>
                                        </label>
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFromDepostBank" runat="server" CssClass="md-form-control form-control" ToolTip="From Deposit Bank">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblFromDepostBank" runat="server" Text="Deposit Bank"> </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <UC3:AutoSugg ID="ddlFromSupervisor" ToolTip="Supervisor" class="md-form-control form-control login_form_content_input requires_true" runat="server" ServiceMethod="GetsSupervisorList"
                                            WatermarkText="--Select--" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Supervisor" ID="lblSupervisor"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <UC3:AutoSugg ID="ddlFromDebt" ToolTip="Dept Collector" class="md-form-control form-control login_form_content_input requires_true" runat="server" ServiceMethod="GetsDeptCollectorList"
                                            WatermarkText="--Select--" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Dept Collector" ID="lblDeptCollector"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <%--          <UC3:AutoSugg ID="ddlFromBranchCode" ToolTip="Location" runat="server" ServiceMethod="GetBranchList"
                                                            ValidationGroup="submit" ErrorMessage="Select a Location"
                                                            WatermarkText="--Select--" />--%>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="col-md-6">
                        <asp:Panel ID="pnlTo" runat="server" CssClass="stylePanel" GroupingText="Transfer To">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlToBranchCode" runat="server" CssClass="md-form-control form-control" ToolTip="To Branch"></asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvToBranchCode" runat="server" ControlToValidate="ddlToBranchCode" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the To Branch" InitialValue="0" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="To Branch" ID="lblToBranchCode" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <UC3:AutoSugg ID="ddlToSupervisor" ToolTip="Supervisor" runat="server" class="md-form-control form-control login_form_content_input requires_true" ServiceMethod="GetsSupervisorList"
                                            ValidationGroup="submit" ErrorMessage="Select a To Supervisor"
                                            WatermarkText="--Select--" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Supervisor" ID="lbltoSupervisor" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <UC3:AutoSugg ID="ddlToDeptCollector" ToolTip="Dept Collector" runat="server" class="md-form-control form-control login_form_content_input requires_true" ServiceMethod="GetsDeptCollectorList"
                                            ValidationGroup="submit" ErrorMessage="Select a Dept Collector"
                                            WatermarkText="--Select--" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Dept Collector" ID="lblToDebt" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12" style="display: none;">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlToDepostBank" runat="server" ToolTip="To Deposit Bank" CssClass="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvToDepostBank" runat="server" CssClass="styleMandatoryLabel"
                                                SetFocusOnError="true" InitialValue="0" ErrorMessage="Select the To Deposit Bank" Display="None"
                                                ValidationGroup="Add" ControlToValidate="ddlToDepostBank"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label ID="lblToDepostBank" runat="server" Text="Deposit Bank" CssClass="styleReqFieldLabel"> </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-9 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffDate" runat="server" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true" ToolTip="Effective Date"> </asp:TextBox>
                                        <cc1:CalendarExtender ID="CEEffDate" runat="server"
                                            TargetControlID="txtEffDate">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvtxtEffDate" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="txtEffDate"
                                                Display="Dynamic" ErrorMessage="Select the Effective Date" SetFocusOnError="True"
                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label ID="lblEffectiveDate" runat="server" CssClass="styleReqFieldLabel" Text="Effective Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right" style="margin-top: 15px;">
                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Header" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                </div>
                <div class="row">
                    <asp:Panel GroupingText="Account Details" ID="pnlContract" runat="server" CssClass="stylePanel" ToolTip="Account Details"
                        Width="99%">
                        <asp:Label ID="lblAccountDetails" runat="server" Text="No Contract details Available"
                            Visible="False" />
                        <div class="gird">
                            <asp:GridView Width="100%" ID="gvContractDetails" runat="server" AutoGenerateColumns="False" ToolTip="Account Details"
                                OnRowDataBound="gvContractDetails_RowDataBound" OnRowCommand="gvContractDetails_RowCommand" class="gird_details">
                                <Columns>
                                    <asp:TemplateField HeaderText="Account Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpanum" runat="server" Text='<%#Eval("panum")%>' />
                                            <asp:Label ID="lblPA_SA_REF_ID" Visible="false" runat="server" Text='<%#Eval("PA_SA_REF_ID")%>' />
                                            <asp:Label ID="lblPriceChk" Visible="false" runat="server" Text='<%#Eval("PriceChk")%>' />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <table cellpadding="0" cellspacing="0" border="0">
                                                <thead>
                                                    <tr align="center">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <asp:LinkButton ID="lnkbtnSortCode" runat="server" Text="Account Number" ToolTip="Sort By Account Number"
                                                                OnClick="FunProSortingColumn" Style="text-decoration: none;">
                                                            </asp:LinkButton>
                                                            <asp:Button ID="imgbtnSortCode" runat="server" ImageAlign="Middle" CssClass="styleImageSortingAsc" Visible="false" />
                                                        </th>
                                                    </tr>
                                                    <tr align="left">
                                                        <th style="padding: 0px !important; background: none !important;">
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server" AutoPostBack="true" ToolTip="Account Number"
                                                                    class="md-form-control form-control login_form_content_input" OnTextChanged="FunProHeaderSearch" MaxLength="15"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtHeaderSearch1"
                                                                    FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" Enabled="True" ValidChars=" /">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemStyle Width="20%" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Dept Collector">
                                            <ItemTemplate>
                                                <UC3:AutoSugg ID="ddlDebtCollector" ToolTip="Dept Collector" class="md-form-control form-control login_form_content_input requires_true" runat="server" ServiceMethod="GetsDeptCollectorList"
                                            WatermarkText="--Select--" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>--%>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblpanumhear" runat="server" Text='<%#Eval("panum")%>' />
                                            <asp:CheckBox ID="chkAll" runat="server"
                                                Text="Select All" ToolTip="Include" AutoPostBack="true" TextAlign="Right" OnCheckedChanged="chkAll_CheckedChanged" />
                                        </HeaderTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />

                                        <ItemTemplate>
                                            <asp:CheckBox ID="CbAccount" runat="server" Style="text-align: center;" ToolTip="Select Account Number" AutoPostBack="true" OnCheckedChanged="CbAccount_OnCheckedChanged" />
                                            <asp:Label ID="lblAccount_ID" runat="server" Visible="false" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Customer Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCustId" runat="server" Text='<%#Eval("Customer_ID")%>' Visible="false" />
                                            <asp:LinkButton ID="lnkAddress" runat="server" CausesValidation="false" OnClick="lnkAddress_Click" ToolTip="Customer Details" CssClass="grid_btn_link" Text='<%#Eval("Customer_Code")%>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                        <asp:Button ID="btnHidden" runat="server" Text="Button" Style="Display: none;" />
                    </asp:Panel>

                </div>
                <div class="row" style="text-align:right;">
                    <div class="col">
                        <div>
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-12">
                                <div class="md-input">
                                    <asp:Label ID="lblReordsCount" runat="server" CssClass="styleDisplayLabel" Font-Bold="true" Text="Records Selected :" Visible="false"></asp:Label>
                                    <asp:Label ID="lblReordsCountValue" runat="server" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-9 col-sm-9 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtReason" runat="server" MaxLength="500" onkeyup="maxlengthfortxt(500)" TextMode="MultiLine" CssClass="md-form-control form-control login_form_content_input lowercase" ToolTip="Reason for transfer"> </asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <div class="validation_msg_box" style="top: 40px !important;">
                                        <asp:RequiredFieldValidator ID="rfvtxtReason" CssClass="validation_msg_box_sapn" runat="server" Width="400px" ControlToValidate="txtReason"
                                            Display="Dynamic" ErrorMessage="Enter the Reason for transfer" SetFocusOnError="True"
                                            ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <label>
                                        <asp:Label ID="lblReason" runat="server" CssClass="styleReqFieldLabel" Text="Reason for transfer"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnTransfer" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnTransfer_Click"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                        onserverclick="btnClear_Click"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnExit_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div>
                    <asp:ValidationSummary ID="valbtnTransfer" runat="server" ValidationGroup="Add"
                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                        ShowSummary="false" />
                </div>
            </div>
            <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
            <input type="hidden" id="hdnID" runat="server" />
            <asp:Label ID="lblCustAddress" runat="server" Style="display: none;"></asp:Label>
            <cc1:ModalPopupExtender ID="mpeCustAddress" runat="server" PopupControlID="dvCustAddress" TargetControlID="lblCustAddress"
                BackgroundCssClass="modalBackground" Enabled="true" />
            <div runat="server" id="dvCustAddress" style="display: none; width: 50%; height: 50%;">
                <div id="Div5" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
                    <asp:ImageButton ID="imgCustAddress" runat="server" Width="50px" CausesValidation="false" ToolTip=" Close,Alt+I" AccessKey="I" Height="50px" ImageUrl="~/Images/close.png"
                        OnClick="imgCustAddress_Click" />
                </div>
                <div>
                    <asp:Panel ID="Panel2" GroupingText="Address Details" CssClass="stylePanel" runat="server"
                        BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="container" style="height: 250px;">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAddress" runat="server" ReadOnly="true" Enabled="false" Width="250px" Height="150px" MaxLength="250" class="md-form-control form-control login_form_content_input requires_true" TextMode="MultiLine"
                                                    onkeyup="maxlengthfortxt(250);"></asp:TextBox>
                                            </div>
                                        </div>
                                        <label>
                                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <%-- <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                                        <td colspan="2">
                                            <asp:Button runat="server" ID="btnAdCancel" CausesValidation="false"
                                                OnClick="btnAdCancel_Click" Text="Exit" CssClass="grid_btn" />
                                        </td>
                                    </tr>--%>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="imgCustAddress" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
