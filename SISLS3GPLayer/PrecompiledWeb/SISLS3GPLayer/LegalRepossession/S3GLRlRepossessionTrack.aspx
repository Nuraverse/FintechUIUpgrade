<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRlRepossessionTrack, App_Web_5iqva5p4" title="Untitled Page" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register TagPrefix="uc5" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .btn_5_disabled {
            width: 27px !important;
            height: 27px !important;
            border-radius: 0px;
            box-shadow: none !important;
            border: none !important;
            line-height: 14px !important;
            background-color: #D7D7D7 !important;
            color: white !important;
            background-image: none !important;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcRepossTrack_tbgeneral_btnLoadAccount').click();
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
        //Tab index code starts
        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossTrack');

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                if (btnActive_index != 0) {
                    newindex = btnActive_index - 1;
                }
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {


                switch (index) {

                    case 0:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;
                    case 1:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        // btnSave.setAttribute("class", "css_btn_enabled");
                        break;
                    case 2:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
                        btnActive_index = index;
                        break;


                }
            }
            else {
                tab.set_activeTabIndex(newindex);

                var TC = $find("<%=tcRepossTrack.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=txtTrackDate.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcRepossTrack.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=txtTrackDate.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossTrack');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                debugger;
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);
                    btnActive_index = 0;
                    return;
                }
                <%--  var btnSave = document.getElementById('<%=btnSave.ClientID %>');
                if (newindex = 1) {
                    btnSave.removeAttribute("disabled");
                    btnSave.setAttribute("class", "css_btn_enabled");
                }
                else {
                    btnSave.setAttribute("disabled", "disabled");
                    btnSave.setAttribute("class", "css_btn_disabled");
                }--%>
            }

        }

    </script>
    <asp:UpdatePanel ID="udpInsDetails" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div>
                        <div class="row">
                            <div class="col">
                                <h6 class="title_name">
                                    <asp:Label runat="server" Text="Repossession Note" ID="lblHeading"> </asp:Label>
                                    <input id="HidConfirm" type="hidden" runat="server" />
                                </h6>
                            </div>
                        </div>
                        <div class="row" style="display: none">
                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                        <div class="row">

                            <cc1:TabContainer ID="tcRepossTrack" runat="server" CssClass="styleTabPanel" Width="99%"
                                ScrollBars="None" ActiveTabIndex="1">
                                <cc1:TabPanel runat="server" HeaderText="General" ID="tbgeneral" CssClass="tabpan"
                                    BackColor="Red" ToolTip="General" Width="99%">
                                    <HeaderTemplate>
                                        General
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div>
                                                    <div class="row">
                                                        <asp:Panel ID="pnlGeneralDetails" runat="server" CssClass="stylePanel" GroupingText="General Details"
                                                            Width="99%">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTrackDate" runat="server" ContentEditable="False" Enabled="false"
                                                                                ToolTip="Repossession Track Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Repossession Track Date" ID="Label4" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" runat="server">
                                                                        <div class="md-input">
                                                                            <uc5:Suggest ID="ucNoteNumber" OnItem_Selected="ucNoteNumber_Item_Selected" ErrorMessage="Select Legal Repossession Number"
                                                                                ValidationGroup="Submit" AutoPostBack="true" runat="server" ServiceMethod="GetNoteNumber" IsMandatory="true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label Text="Legal Repossession Number" runat="server" ID="lblNoticeNo" CssClass="styleReqFieldLabel" />
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtAction" runat="server" ContentEditable="False" ToolTip="Action" Enabled="false"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Action" ID="lblAction" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlDocketno" runat="server" AutoPostBack="true" ToolTip="Legal Docket Number"
                                                                                OnSelectedIndexChanged="ddlDocketno_SelectedIndexChanged">
                                                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Repossession Docket Number" ID="lblDocketno" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvddlDocketno" runat="server" ControlToValidate="ddlDocketno"
                                                                                    SetFocusOnError="True" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Repossession Docket Number"
                                                                                    InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlDocketno"
                                                                        SetFocusOnError="True" CssClass="styleMandatoryLabel" Display="None" InitialValue="0"
                                                                        ErrorMessage="Select Repossession Docket Number" ValidationGroup="Submit"></asp:RequiredFieldValidator>--%>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtDocketdate" runat="server" ContentEditable="False" Enabled="false"
                                                                                ToolTip="Repossession Docket Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Repossession Docket Date" ID="lblDocketdate" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTrackNo" runat="server" ContentEditable="False" Enabled="false"
                                                                                ToolTip="Repossession Track Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Repossession Track Number" ID="Label3" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtLOB" runat="server" ContentEditable="False" ToolTip="Line of Business" Enabled="false"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtBranch" runat="server" ContentEditable="False" ToolTip="Location" Enabled="false"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Location" ID="lblBranch" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <%--<asp:TextBox ID="txtPANum" runat="server" ContentEditable="False" ToolTip="Prime Account Number"
                                                                        class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblPANum" runat="server" Text="Prime Account Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>--%>
                                                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                                                ValidationGroup="Go" strLOV_Code="ACC_REPOTRACK" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" Enabled="true" />
                                                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                                Style="display: none" />
                                                                            <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                                                            <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblMLA" runat="server" ToolTip="Account Number" CssClass="styleDisplayLabel"
                                                                                    Text="Account Number"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divSANum" runat="server" visible="false">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtSANum" runat="server" ContentEditable="False" ToolTip="Sub Account Number"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblSLA" runat="server" Text="Sub Account Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtAcconutDate" runat="server" ContentEditable="False" ToolTip="Account Date" Enabled="false"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Account Date" ID="lblAccountDate" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtFinAmount" runat="server" ContentEditable="False" ToolTip="Amount Financed" Enabled="false"
                                                                                Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Amount Financed" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtTenure" runat="server" ContentEditable="False" ToolTip="Tenure" Enabled="false"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Tenure" ID="lblTenure" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divView" runat="server" visible="false">
                                                                        <div class="md-input">
                                                                            <asp:Label runat="server" Text="View" ID="lblView" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                                                            <asp:Button ID="btnViewAccount" Enabled="false" runat="server" CssClass="styleGridShortButton" AccessKey="A" ToolTip="Account,Alt+A"
                                                                                Text="Account" Visible="false" />
                                                                            <asp:Button ID="btnViewLedger" Enabled="false" runat="server" CssClass="styleGridShortButton" AccessKey="D" ToolTip="Ledger,Alt+D"
                                                                                Text="Ledger" Visible="false" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                                Enabled="false" class="md-form-control form-control" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                                                Style="display: none" Enabled="false" />
                                                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"
                                                                                class="md-form-control form-control login_form_content_input requires_true" Enabled="false"
                                                                                ValidationGroup="Go">  </asp:TextBox>
                                                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="Label5" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label></td>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div style="display: none" class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:Panel ID="pnlGuarantor" runat="server" ToolTip="Guarantor Information" GroupingText="Guarantor Information"
                                                                                CssClass="stylePanel" Visible="false">
                                                                                <asp:GridView ID="grvGuarantor" runat="server" Width="100%" AutoGenerateColumns="false"
                                                                                    HeaderStyle-CssClass="styleGridHeader">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="S.No" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1 %> '></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="Guarantor Code" DataField="Guarantor_Code" ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField HeaderText="Guarantor Name" DataField="Guarantor_Name" ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField HeaderText="Guarantor Address" DataField="Guarantor_Address1" ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField HeaderText="Guarantor Amount" DataField="Guarantee_Amount" ItemStyle-HorizontalAlign="Right" />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </asp:Panel>
                                                                        </div>
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
                                <cc1:TabPanel runat="server" HeaderText="Track Details" ID="tbTrack" CssClass="tabpan" Visible="true"
                                    BackColor="Red" ToolTip="Track Details" Width="99%">
                                    <HeaderTemplate>
                                        Track Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="row">
                                                <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Track Details"
                                                    Width="99%">
                                                    <div class="row">
                                                        <asp:Panel ID="LRNoteInfo" Width="99%" runat="server" GroupingText="Repossession Track Info"
                                                            CssClass="stylePanel">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:Label runat="server" Text="Inspection done by" ID="tblInspecby" CssClass="styleDisplayLabel"></asp:Label>
                                                                            <asp:RadioButtonList runat="server" AutoPostBack="True" RepeatDirection="Horizontal" class="md-form-control form-control radio"
                                                                                ToolTip="Inspection done by" ID="RDInsBy" OnSelectedIndexChanged="RDInsBy_SelectedIndexChanged">
                                                                                <asp:ListItem Text="Agency" Value="1" Selected="True"></asp:ListItem>
                                                                                <asp:ListItem Text="Employee" Value="2"></asp:ListItem>
                                                                            </asp:RadioButtonList>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <button class="css_btn_enabled" id="BtnNewInspection" title="New Inspection[Alt+I]" causesvalidation="False"
                                                                                onserverclick="BtnNewInspection_Click" runat="server"
                                                                                type="button" accesskey="I">
                                                                                <i class="fa fa-file" aria-hidden="true"></i>&emsp;New <u>I</u>nspection
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel ID="pnlTrack" Width="99%" runat="server" ToolTip="Inspection Information"
                                                            GroupingText="Asset Inspection Information" CssClass="stylePanel">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                        <div class="md-input">
                                                                            <uc5:Suggest ID="ddlInspecBy" OnItem_Selected="ddlInspecBy_SelectedIndexChanged" ErrorMessage="Select Agent Name"
                                                                                ValidationGroup="Submit" AutoPostBack="true" runat="server" ServiceMethod="GetInspectorName" IsMandatory="true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Agent Name" ID="lblInspecBy" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtInspecDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                ToolTip="Inspector On" AutoPostBack="True" OnTextChanged="txtInspecDate_TextChanged"></asp:TextBox>
                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtInspecDate"
                                                                                ID="CalendarExtender1" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Inspected On " ID="lblInspecDate" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtInspecDate"
                                                                                    CssClass="validation_msg_box_sapn" ErrorMessage="Select Inspection On Date" Display="Dynamic"
                                                                                    SetFocusOnError="True" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel ID="Panel1" Width="99%" runat="server" ToolTip="Asset Relocated Details"
                                                            GroupingText="Asset Relocated Details" CssClass="stylePanel">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divddlNewGarage" runat="server" visible="False">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlNewGarage" runat="server" AutoPostBack="True" ToolTip="New Garage Code"
                                                                                OnSelectedIndexChanged="ddlNewGarage_SelectedIndexChanged">
                                                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="New Garage Code" ID="lblGarageCode" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlNewGarage"
                                                                                    CssClass="validation_msg_box_sapn" ErrorMessage="Select New Garage Code" Display="Dynamic"
                                                                                    InitialValue="0" SetFocusOnError="True" ValidationGroup="tbTrack"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divtxtGarageName" runat="server" visible="False">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtGarageName" runat="server" ContentEditable="False" ToolTip="New Garage Name"
                                                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="New Garage Name" ID="lblGarageName" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divtxtGarageAddress" runat="server" visible="False">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtGarageAddress" runat="server" TextMode="MultiLine" ContentEditable="False"
                                                                                ToolTip="New Garage Address" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="New Garage Address" ID="lblGarageAddress" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(200)"
                                                                                ToolTip="Remarks" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Remarks" ID="lblRemarks" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divtxtOldGarageOut" runat="server" visible="False">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtOldGarageOut" runat="server" AutoPostBack="True" class="md-form-control form-control login_form_content_input requires_true"
                                                                                ToolTip="Old Garage out Date" OnTextChanged="txtOldGarageOut_TextChanged"></asp:TextBox>
                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtOldGarageOut"
                                                                                OnClientDateSelectionChanged="checkDate_NextSystemDate" ID="CalendarExtender2" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Old Garage Out Date" ID="lblOldGarageOut" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOldGarageOut" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                    ErrorMessage="Select Old Garage OutDate" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divtxtNewGarageIn" runat="server" visible="False">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtNewGarageIn" runat="server" ToolTip="New Garage In date"
                                                                                AutoPostBack="True" OnTextChanged="txtNewGarageIn_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:CalendarExtender runat="server" TargetControlID="txtNewGarageIn"
                                                                                OnClientDateSelectionChanged="checkDate_NextSystemDate" ID="CalendarExtender3" Enabled="True">
                                                                            </cc1:CalendarExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="New Garage In date" ID="lblNewGarageIn" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtNewGarageIn" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                    ErrorMessage="Select New Garage InDate" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtCondAsset" TextMode="MultiLine" runat="server" MaxLength="200"
                                                                                onkeyup="maxlengthfortxt(200)" ToolTip="Condition of asset" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            
                                                                             <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtCondAsset" runat="server" ControlToValidate="txtCondAsset" CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                                    ErrorMessage="Enter the Asset Condition" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Condition of asset" ID="lblCondAsset" CssClass="styleReqFieldLabel"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel Style="display: none" runat="server" HeaderText="Repossessed Asset Details" ID="tbAsset" Visible="true"
                                    CssClass="tabpan" BackColor="Red" ToolTip="Asset Details" Width="99%">
                                    <HeaderTemplate>
                                        Repossessed Asset details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpAssed" runat="server">
                                            <ContentTemplate>
                                                <div>
                                                    <div class="row">
                                                        <asp:Panel ID="pnlAsset" Width="99%" runat="server" ToolTip="Repossessed Asset Information" Visible="false"
                                                            GroupingText="Repossessed Asset Information" CssClass="stylePanel">
                                                            <asp:Label ID="lblAssetDetails" runat="server" Text="No Repossessed Asset details Available"
                                                                Visible="false" />
                                                            <asp:GridView ID="grvAsset" Width="100%" runat="server" AutoGenerateColumns="false"
                                                                HeaderStyle-CssClass="styleGridHeader">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-Width="50px">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1 %> '></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAssetID" Visible="false" runat="server" Text='<%#Bind("AssetID") %> '></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Asset Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAssetCode" runat="server" Text='<%#Bind("Asset_Code") %> '></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField HeaderText="Asset Description" DataField="Asset_Description" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="Vehicle Registration Number" DataField="REGN_No" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="Vehicle Serial Number" DataField="Serial_No" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="Repossession date" DataField="Repossession_Date" ItemStyle-HorizontalAlign="Left" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel ID="Panel3" Width="99%" runat="server" ToolTip="Asset Information" Visible="false"
                                                            GroupingText="Asset Details" CssClass="stylePanel">
                                                            <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAssetInventory" runat="server" TextMode="MultiLine" ContentEditable="False"
                                                                        ToolTip="Asset Inventory details" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Asset Inventory details" ID="lblAssetInventory" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInsValid" runat="server" ContentEditable="False"
                                                                        ToolTip="Insurance Validity Upto" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Insurance Validity Upto" ID="lblInsValid" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row">
                                                        <asp:Panel ID="pnlGarage" Width="99%" runat="server" ToolTip="Garage Information" Visible="false"
                                                            GroupingText="Garage Information" CssClass="stylePanel">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtGID" runat="server" Visible="false" ContentEditable="False" ToolTip=""></asp:TextBox>
                                                                            <asp:TextBox ID="txtGcode" runat="server" ContentEditable="False" ToolTip="Garage Code"
                                                                                Width="100px"></asp:TextBox>
                                                                            <asp:Label runat="server" Text="Garage Code " ID="lblGcode" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtGIn" runat="server" ContentEditable="False" ToolTip="Garage InDate"
                                                                                Width="80px"></asp:TextBox>
                                                                            <asp:Label runat="server" Text="Garage InDate" ID="lblGname" CssClass="styleDisplayLabel"></asp:Label>

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtGaddress" runat="server" ContentEditable="False" TextMode="MultiLine"
                                                                                ToolTip="Garage Address"></asp:TextBox>
                                                                            <asp:Label runat="server" Text="Garage Address " ID="lblGaddress" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </div>
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
                                <cc1:TabPanel Style="display: none" runat="server" HeaderText="History Details" ID="tbHistroy" CssClass="tabpan" Visible="false"
                                    BackColor="Red" ToolTip="History Details" Width="99%">
                                    <HeaderTemplate>
                                        History Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upHistory" runat="server">
                                            <ContentTemplate>
                                                <div>
                                                    <div class="row">
                                                        <div class="gird">
                                                            <asp:GridView ID="GrvHistory" Width="100%" runat="server" AutoGenerateColumns="false"
                                                                HeaderStyle-CssClass="styleGridHeader">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-Width="50px">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1 %> '></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField HeaderText="Repossession Track Number" DataField="LR_Track_No" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="Inspector Name" DataField="Inspector_Name" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="Inspected on" DataField="Inspected_Date" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="Repossession Track Date" DataField="Repossesion_Track_Date"
                                                                        ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="New Garage Code" DataField="Garage_Code" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:BoundField HeaderText="New Garage Address" DataField="Address" ItemStyle-HorizontalAlign="Left" />
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtRemarks" runat="server" Text='<%#Bind("Remarks") %>' Style="text-align: Left"
                                                                                Width="112px" TextMode="MultiLine" ReadOnly="true" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>

                            </cc1:TabContainer>

                        </div>
                        <%--<div class="btn_height"></div>--%>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false"
                                onserverclick="btnSave_Click" runat="server"
                                type="button" accesskey="S" validationgroup="Submit">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                                runat="server" type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>

                        <%--  <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
                HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="tbGeneral" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="styleMandatoryLabel"
                HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="tbTrack" />--%>
                        <asp:UpdatePanel ID="msg" runat="server">
                            <ContentTemplate>
                                <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="Submit" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../Content/Scripts/UserScript.js" type="text/javascript"></script>
</asp:Content>
