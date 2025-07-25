<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLegalRepossessionRepossession_Add, App_Web_5saef4xg" title="Untitled Page" %>



<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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

        .btn_lnk {
            color: red;
            text-decoration: underline;
            background-image: none !important;
        }
    </style>
    <script language="javascript" type="text/javascript">

        function fnConfirmCancelApprove() {

            if (confirm('Do you want to Revoke the Repossession?')) {
                return true;
            }
            else
                return false;

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

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcRepossession_tbRepossession_btnLoadAccount').click();
        }

        function pageLoad() {
            tab = $find('ctl00_ContentPlaceHolder1_tcRepossession');
            var querymode = location.search.split("qsMode=");

            if (querymode.length > 1) {
                if (querymode[1].length > 1) {
                    querymode = querymode[1].split("&");
                    querymode = querymode[0];
                }
                else {
                    querymode = querymode[1];
                }
                if (querymode != 'Q') {
                    tab.add_activeTabChanged(on_Change);
                    var newindex = tab.get_activeTabIndex(index);
                    var btnSave = document.getElementById('<%=btnSave.ClientID %>')
                    if (newindex == tab._tabs.length - 1)
                        btnSave.disabled = false;
                    else
                        btnSave.disabled = true;
                }
            }
        }
        var index = 0;
        function on_Change(sender, e) {

            var newindex = tab.get_activeTabIndex();
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            var btnclear = document.getElementById('<%=btnClear.ClientID %>')

            if (newindex == tab._tabs.length - 1)
                btnSave.disabled = false;
            else
                btnSave.disabled = true;
            if (newindex > index) {
                switch (newindex) {
                    case 1:
                        if (!Page_ClientValidate('tbRepossession')) {
                            tab.set_activeTabIndex(0);
                            index = 0;

                            break;
                        }
                        break;

                }
            }
            //       else
            //       {
            //            tab.set_activeTabIndex(newindex);
            //            index=tab.get_activeTabIndex(newindex);
            //       }     

            // Page_BlockSubmit = false;

            //    }


            //function trimStartingSpace(textbox) {
            //    var textValue = textbox.value;
            //    if (textValue.length == 0 && window.event.keyCode == 32) {
            //        window.event.keyCode = 0;
            //        return false;
            //    }
        }

        function fnMoveNextTab(Source_Invoker) {
            tab = $find('ctl00_ContentPlaceHolder1_tcRepossession');

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

                var TC = $find("<%=tcRepossession.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcRepossession.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossession');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }

        }
        //Tab index code end
    </script>
    <asp:UpdatePanel ID="udpInsDetails" runat="server">
        <ContentTemplate>
            <div class="tab-content">
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
                        <cc1:TabContainer ID="tcRepossession" runat="server" Width="100%" CssClass="styleTabPanel"
                            ActiveTabIndex="0">
                            <cc1:TabPanel ID="tbRepossession" runat="server" CssClass="tabpan" TabIndex="0"
                                BackColor="Red" Width="100%" Enabled="true" HeaderText="Repossession Details">
                                <HeaderTemplate>
                                    Repossession
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="LRNoteInfo" runat="server" GroupingText="Repossession Info"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLOB" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                            runat="server" AutoPostBack="True" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select Line of Business"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" ID="ddlBranch"
                                                                            runat="server" AutoPostBack="True" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Branch"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepLOB" runat="server" ControlToValidate="ddlBranch"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select Branch"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRepoDate" runat="server" ReadOnly="True" AutoPostBack="true"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRepoDate" runat="server" CssClass="styleDisplayLabel" Text="Repossession Docket Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRepoNo" runat="server" ReadOnly="True"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRepoDocNo" runat="server" Text="Repo Docket Number" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAccountDate" runat="server" ReadOnly="True"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblAccountDate" runat="server" Text="Account Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divLRNDate" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLRNDate" runat="server" ReadOnly="True"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label1" runat="server" Text="Account Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTenure" runat="server" ReadOnly="True" Style="text-align: right"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblTenure" runat="server" Text="Tenure" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAmtFinanced" runat="server" ReadOnly="True" Style="text-align: right"
                                                                            class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblAmtFinanced" runat="server" Text="Amount Financed" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc5:Suggest ID="ddlLRNNumber" ToolTip="Repossession Notice Number" OnItem_Selected="ddlLRNNumber_SelectedIndexChanged"
                                                                            ErrorMessage="Select Legal Reposession Number"
                                                                            AutoPostBack="true" runat="server" ServiceMethod="GetNoteNumber" IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLRNNumber" runat="server" CssClass="styleReqFieldLabel" Text="LRN Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                                            ValidationGroup="Go" strLOV_Code="ACC_REPOREL" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" Enabled="true" />
                                                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadAccount_Click"
                                                                            Style="display: none" />
                                                                        <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" Enabled="false" AccessKey="V" CausesValidation="false"
                                                                            ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click" Style="color: red; text-underline-position: below;"></asp:LinkButton>
                                                                        <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                                                        <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                                                        <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblMLA" runat="server" ToolTip="Account Number" CssClass="styleReqFieldLabel"
                                                                                Text="Account Number"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                                                SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divAccNo" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPANum" runat="server" ReadOnly="True" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblPANum" runat="server" CssClass="styleDisplayLabel" Text="Account Number"></asp:Label>
                                                                        </label>
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
                                                                        <asp:HiddenField ID="hdnCustomerId" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label5" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label></td>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="divviewAcc" runat="server" visible="false">
                                                <div align="right">
                                                    <asp:Button ID="btnViewAccount" runat="server" CssClass="grid_btn" Text="View Account" Visible="false"
                                                        OnClick="btnViewAccount_Click" CausesValidation="false" />
                                                    <asp:Button ID="btnLedgerView" runat="server" CssClass="grid_btn" Text="View Ledger"
                                                        CausesValidation="false" Visible="false" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel3" runat="server" CssClass="stylePanel" GroupingText="Asset Details" Visible="true" Width="100%">
                                                    <asp:Label ID="lblAsset" runat="server" Text="No Asset details Available"
                                                        Visible="False" />
                                                    <asp:GridView ID="gvAssetDetails" runat="server" AutoGenerateColumns="False" CssClass="gird_details"
                                                        DataKeyNames="Asset_Number" ToolTip="Asset Details" Width="100%" OnRowDataBound="gvAssetDetails_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetID" runat="server" Text='<%# Eval("Asset_Number") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="S.No."></asp:Label>
                                                                    <%---<asp:Label ID="lblProgramRefNo" runat="server" Text='<%# Eval("SerialNo") %>' />--%>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="5%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAsset_Type" runat="server" Text='<%# Eval("AssetType_ID") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asset Code">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetCode" runat="server" Text='<%# Eval("Asset_Code") %>' ToolTip="Asset Code" />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asset Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetDesc1" runat="server" Text='<%# Eval("Asset_Description") %>' ToolTip="Asset Description" />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Vehicle Registration">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEngineNumber" runat="server" Text='<%# Eval("REGN_NUMBER") %>' ToolTip="Vehicle Registration" />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="25%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Serial Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNumber" runat="server" Text='<%# Eval("SERIAL_NUMBER") %>' ToolTip="Serial Number" />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="25%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asset Value" ItemStyle-HorizontalAlign="Right">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetCost" runat="server" Text='<%# Eval("Asset_Cost") %>' ToolTip="Asset Value" />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle Width="25%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <%--   <table>
                                                                        <tr align="center">
                                                                            <td align="center">--%>
                                                                    <asp:UpdatePanel ID="updChk" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:CheckBox ID="CbAssets" runat="server" ToolTip="Select Asset" AutoPostBack="true"
                                                                                OnCheckedChanged="CbAssets_OnCheckedChanged" Enabled="true" />
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:PostBackTrigger ControlID="CbAssets" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                    <%--<asp:CheckBox ID="CbAssets" runat="server" ToolTip="Select Asset" AutoPostBack="true"
                                                                        OnCheckedChanged="CbAssets_OnCheckedChanged" Enabled="true" />--%>
                                                                    <asp:Label ID="lblAsset_ID" runat="server" Visible="false" />
                                                                    <%--</td>
                                                                        </tr>
                                                                    </table>--%>
                                                                </ItemTemplate>
                                                                <HeaderTemplate>
                                                                    <%--<table>
                                                                        <tr align="center">--%>
                                                                    <%--    <td align="center">--%>
                                                                                Select Asset
                                                                          <%--  </td>
                                                                        </tr>
                                                                    </table>--%>
                                                                </HeaderTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel GroupingText="Guarantor Details" ID="pnlGuarantorAddress" runat="server"
                                                    CssClass="stylePanel" Width="100%">
                                                    <asp:Label ID="lblGuarDetails" runat="server" Text="No Guarantor details Available"
                                                        Visible="False" />
                                                    <asp:GridView Width="100%" ID="gvGuarDetails" runat="server" AutoGenerateColumns="False" CssClass="gird_details">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="S.No."></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Guarantor Code">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGuarantorCode" runat="server" Text='<%# Eval("Guarantor_Code") %>' ToolTip="Guarantor Code"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Guarantor Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGuarantorName" runat="server" Text='<%# Eval("Guarantor_Name") %>' ToolTip="Guarantor Name"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Guarantor Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGuarantorAmount" runat="server" Text='<%# Eval("Guarantee_Amount") %>' ToolTip="Guarantor Amount"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>

                                                            <%--<asp:BoundField HeaderText="Guarantor Code" DataField="Guarantor_Code"/>
                                                            <asp:BoundField HeaderText="Guarantor Name" DataField="Guarantor_Name" />--%>
                                                            <%-- <asp:BoundField HeaderText="Guarantor Address" DataField="Guarantor_Address1" />--%>
                                                            <%-- <asp:BoundField HeaderText="Guarantee Amount" DataField="Guarantee_Amount" ItemStyle-HorizontalAlign="Right" />--%>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none" class="col">
                                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="False" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" />
                                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="False" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tbRepossessionDetails" runat="server" CssClass="tabpan"
                                TabIndex="1" BackColor="Red" Width="100%" HeaderText="Repossession Details">
                                <HeaderTemplate>
                                    Repossession Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="Panel4" runat="server" GroupingText="Repossession Info Details"
                                                    CssClass="stylePanel" Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRepossessionDate" runat="server" OnTextChanged="txtRepossessionDate_TextChanged" Enabled="true"
                                                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderRepossessionDate" runat="server" Enabled="True"
                                                                            TargetControlID="txtRepossessionDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRepossessionDate" runat="server" CssClass="styleReqFieldLabel"
                                                                                Text="Repossession Date"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepossDate" runat="server" ControlToValidate="txtRepossessionDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Repossession Date"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepRepossDate" runat="server" ControlToValidate="txtRepossessionDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Repossession Date"
                                                                                Visible="false" ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlRepossessionDoneBy" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRepossessionDoneBy_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblRepossessionDoneBy" runat="server" CssClass="styleReqFieldLabel"
                                                                                Text="Repossession Done By"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepDoneBy" runat="server" ControlToValidate="ddlRepossessionDoneBy"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Repossession Done By"
                                                                                ValidationGroup="Save" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfdRepdone" runat="server" ControlToValidate="ddlRepossessionDoneBy"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Repossession Done By" Visible="false"
                                                                                ValidationGroup="tbRepossessionDetails" InitialValue="0"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <%--    <asp:DropDownList ID="ddlAgentCode" runat="server" AutoPostBack="True"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>--%>
                                                                        <uc5:Suggest ID="ddlAgentCode" OnItem_Selected="ddlAgentCode_Item_Selected" ErrorMessage="Select Agent Name"
                                                                            AutoPostBack="true" runat="server" ServiceMethod="GetInspectorName" IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblEntity" runat="server" CssClass="styleReqFieldLabel" Text="Employee/Agent Code "></asp:Label>
                                                                        </label>
                                                                        <%-- <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvAgentCode" runat="server" ControlToValidate="ddlAgentCode"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select Employee/Agent Code"
                                                                        ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvRepAgent" runat="server" ControlToValidate="ddlAgentCode"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select Employee/Agent Code"
                                                                        ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlAgentCode"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Employee/Agent Code"
                                                                        ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlAgentCode"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Employee/Agent Code"
                                                                        ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                </div>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPlace" TextMode="MultiLine" MaxLength="200" onkeyup="maxlengthfortxt(200);" Enabled="true"
                                                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblPlace" runat="server" CssClass="styleReqFieldLabel" Text="Repossession Place"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvPlace" runat="server" ControlToValidate="txtPlace"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Repossession Place"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfdRepPlace" runat="server" ControlToValidate="txtPlace"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Repossession Place" Visible="false"
                                                                                ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCondition" TextMode="MultiLine" MaxLength="200" onkeyup="maxlengthfortxt(200);"
                                                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCondition" runat="server" CssClass="styleReqFieldLabel" Text="Condition of Asset"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvCondition" runat="server" ControlToValidate="txtCondition"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Condition of Asset"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfdRepCondi" runat="server" ControlToValidate="txtCondition"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Condition of Asset" Visible="false"
                                                                                ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divGarageCode" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlGarageCode" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGarageCode_SelectedIndexChanged"
                                                                            EnableTheming="True" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblGarageCode" runat="server" CssClass="styleReqFieldLabel" Text="Garage Code"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvGarageCode" runat="server" ControlToValidate="ddlGarageCode"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Garage Code"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlGarageCode"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" ErrorMessage="Select the Garage Code" Visible="false"
                                                                                ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divGaragein" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtGarageIn" runat="server" ReadOnly="True"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblGarageIn" runat="server" CssClass="styleDisplayLabel" Text="Garage In"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtInsuranceDate" runat="server" ReadOnly="true"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblInsuranceDate" runat="server" CssClass="styleDisplayLabel" Text="Insurance Valid Upto"></asp:Label>
                                                                        </label>
                                                                        <asp:Label ID="hdnInsurance_ID" Visible="false" runat="server"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCurrentMarket" runat="server" Style="text-align: right"
                                                                            class="md-form-control form-control login_form_content_input requires_true">
                                                                        </asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" FilterType="Numbers,Custom"
                                                                            TargetControlID="txtCurrentMarket" ValidChars=".">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCurrentMarketValue" runat="server" CssClass="styleReqFieldLabel"
                                                                                Text=" Current Market Value"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvCurrentMarket" runat="server" ControlToValidate="txtCurrentMarket"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Current Market Value"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepCurrent" runat="server" ControlToValidate="txtCurrentMarket"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Current Market Value" Visible="false"
                                                                                ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRemarks" runat="server" MaxLength="200" onkeyup="maxlengthfortxt(200);"
                                                                            TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRemarks" runat="server" CssClass="styleDisplayLabel" Text="Garage detail"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRepoExp" runat="server" MaxLength="300" onkeyup="maxlengthfortxt(300);"
                                                                            TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRepoExp" runat="server" CssClass="styleReqFieldLabel" Text="Expenses Incurred During Repossession"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtxtRepoExp" runat="server" ControlToValidate="txtRepoExp"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Expenses Incurred During Repossession"
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepRepEx" runat="server" ControlToValidate="txtRepoExp"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Expenses Incurred During Repossession" Visible="false"
                                                                                ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAssetInventory" runat="server" MaxLength="100" onkeyup="maxlengthfortxt(100);"
                                                                            TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblInventoryDetails" runat="server" CssClass="styleReqFieldLabel"
                                                                                Text="Asset Inventory Details"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvAssetInventory" runat="server" ControlToValidate="txtAssetInventory"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Asset Inventory Details "
                                                                                ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRepInv" runat="server" ControlToValidate="txtAssetInventory" Visible="false"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Asset Inventory Details "
                                                                                ValidationGroup="tbRepossessionDetails"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEDesignation" runat="server" TargetControlID="txtAssetInventory"
                                                                            FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" ValidChars="@#"
                                                                            Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:Label ID="lblPoliceStation" runat="server" CssClass="styleDisplayLabel" Text="Whether Nearest Police Station has been Informed in Writing"></asp:Label>
                                                                        <asp:RadioButton ID="rdoYes" AutoPostBack="true" GroupName="DocYes" runat="server"
                                                                            RepeatDirection="Horizontal" Text="Yes" CssClass="md-form-control form-control radio" />
                                                                        <asp:RadioButton ID="rdoNo" AutoPostBack="true" GroupName="DocYes" runat="server"
                                                                            Text="No" CssClass="md-form-control form-control radio" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="divGarage" runat="server" visible="false">
                                                <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Garage Details" Width="100%" Visible="false">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="md-input">
                                                                <uc1:S3GCustomerAddress ID="S3GGarageAddress" runat="server" FirstColumnStyle="styleFieldLabel"
                                                                    ShowCustomerCode="false" ShowCustomerName="false" Caption="Garage" ActiveViewIndex="1"
                                                                    FirstColumnWidth="20%" SecondColumnWidth="30%" ThirdColumnWidth="18%" FourthColumnWidth="32%" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <%--<asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="styleMandatoryLabel"
                                                    HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="tbRepossessionDetails" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:UpdatePanel ID="rdfgdfff343" runat="server">
                            <ContentTemplate>
                                <asp:ValidationSummary ID="vsRepossession1" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Correct the following validation(s):  " ValidationGroup="Save" ShowSummary="true" />
                                <%-- <asp:ValidationSummary ID="vsRepossession" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Correct the following validation(s):  " ValidationGroup="tbRepossession" />--%>
                                <asp:CustomValidator ID="cvRepossession" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <button class="css_btn_enabled" id="btnCancelApprove" onserverclick="btnCancelApprove_ServerClick" runat="server" title="Repossession Revoke,Alt+R"
                        type="button" accesskey="R" onclick="if(fnConfirmCancelApprove())" causesvalidation="false">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>R</u>epossession Revoke
                    </button>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
