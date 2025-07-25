<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRRepossessionRelease, App_Web_prpaho0u" title="Untitled Page" %>

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
    </style>
    <script type="text/jscript" language="javascript">

        //Tab index code starts
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


        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossessionRelease');

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

                var TC = $find("<%=tcRepossessionRelease.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=txtReleaseDate.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcRepossessionRelease.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=txtReleaseDate.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossessionRelease');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                debugger;
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

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcRepossessionRelease_tplRepossessionDetails_btnLoadAccount').click();
        }

    </script>

    <asp:UpdatePanel ID="udpInsDetails" runat="server">
        <ContentTemplate>
            <div class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Repossession Note" ID="lblHeading"> </asp:Label>
                            <input id="HidConfirm" type="hidden" runat="server" />
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcRepossessionRelease" runat="server" Width="100%" CssClass="styleTabPanel"
                            ActiveTabIndex="0" AutoPostBack="True">
                            <cc1:TabPanel ID="tplRepossessionDetails" runat="server" CssClass="tabpan" TabIndex="0"
                                BackColor="Red" Width="100%" Enabled="true" HeaderText="Repossession Details">
                                <HeaderTemplate>
                                    Repossession Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlGeneralDetails" runat="server" CssClass="stylePanel" GroupingText="General Details"
                                                    Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtReleaseDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calReleaseDate" runat="server" Enabled="False"
                                                                            TargetControlID="txtReleaseDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblReleaseDate" runat="server" Text="Release Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div2" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRRNo" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRRNo" runat="server" Text="RR No" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="divRepo" runat="server" visible="False">
                                                                    <div class="md-input">
                                                                        <button class="css_btn_enabled" id="btnRepo" title="Repo Details[Alt+R]" causesvalidation="False" onserverclick="btnRepo_Click" runat="server"
                                                                            type="button" accesskey="R" visible="False">
                                                                            <i class="fa fa-search-plus" aria-hidden="true"></i>&emsp;R<u></u>epo Details
                                                                        </button>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div3" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAction" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblAction" runat="server" Text="Action" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div4" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRepoDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRepoDate" runat="server" Text="Docket Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div5" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLOB" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Bunsiness" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div6" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtBranch" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div7" runat="server">
                                                                    <div class="md-input">
                                                                        <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                                            ValidationGroup="Go" strLOV_Code="ACC_REPOREL" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" Enabled="true" />
                                                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadAccount_Click"
                                                                            Style="display: none" />
                                                                        <asp:LinkButton ID="lnkViewAccountDetails" runat="server" Text="View Account" CssClass="styleDisplayLabel" Enabled="false" AccessKey="V"
                                                                            ToolTip="View the account Details, ALT+V" OnClick="lnkViewAccountDetails_Click"></asp:LinkButton>
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
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div8" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAmountFinanced" runat="server" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblAmountFinanced" runat="server" Text="Amount Financed" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12" id="div9" runat="server">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTenure" runat="server" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Button AccessKey="V" ToolTip="View Ledger,Alt+V"
                                                                            ID="btnLedger" runat="server" CssClass="styleSubmitButton" Text="View Ledger"
                                                                            Visible="False" class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblTenure" runat="server" Text="Tenure"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            Enabled="false" class="md-form-control form-control" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="False" UseSubmitBehavior="False" OnClick="btnLoadCust_Click"
                                                                            Style="display: none" />
                                                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"
                                                                            class="md-form-control form-control login_form_content_input requires_true"
                                                                            ValidationGroup="Go"></asp:TextBox>
                                                                        <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="Label3" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label></td>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" runat="server">
                                                                    <div class="md-input">
                                                                        <uc5:Suggest ID="ucNoteNumber" ToolTip="Repossession Notice Number" OnItem_Selected="ucNoteNumber_Item_Selected" ErrorMessage="Select Legal Reposession Number"
                                                                            ValidationGroup="Submit" AutoPostBack="true" runat="server" ServiceMethod="GetNoteNumber" IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label Text="Repossession Notice Number" runat="server" ID="lblNoticeNo" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlDocketNo" runat="server" AutoPostBack="True" class="md-form-control form-control"
                                                                            OnSelectedIndexChanged="ddlDocketNo_SelectedIndexChanged">
                                                                        </asp:DropDownList>

                                                                        <asp:LinkButton ID="lnkViewRepossessiontTrack" runat="server" Text="View Repossesion Track" CssClass="styleDisplayLabel" AccessKey="V"
                                                                            ToolTip="View the Repossession Track Details, ALT+V" OnClick="lnkViewRepossessiontTrack_Click"></asp:LinkButton>

                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRepoDocketNo" runat="server" Text="Docket Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDocketNo" runat="server" ControlToValidate="ddlDocketNo"
                                                                                Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn" ErrorMessage="Select a Docket Number" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="pnlAssetDetails" runat="server" CssClass="stylePanel" GroupingText="Asset Details"
                                                    Width="100%">
                                                    <asp:GridView ID="grvRepossessionAssetDetails" runat="server" AutoGenerateColumns="False"
                                                        EmptyDataText="Data Not Found" Width="99%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Asset Code">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetCode" runat="server" Text='<%#Bind("Asset_Code") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Asset Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Bind("Asset_Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Serial Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNumber" runat="server" Text='<%#Bind("Serial_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Registration Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRegistrationNo" runat="server" Text='<%#Bind("REGN_No") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Repossession Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRepossessionDate" runat="server" Text='<%#Bind("Repossession_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
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
                            <cc1:TabPanel ID="tplGuarantorDetails" runat="server" CssClass="tabpan"
                                TabIndex="1" BackColor="Red" Width="100%" HeaderText="Guarantor Details">
                                <HeaderTemplate>
                                    Guarantor Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="PnlGuarantor" runat="server" CssClass="stylePanel" GroupingText="Guarator Details" Visible="true"
                                                    Width="100%">
                                                    <asp:Label ID="lblEmpty" runat="server" Visible="False" Text="No Guarantor Details Available "></asp:Label>
                                                    <asp:GridView ID="grvGuarantor" runat="server" AutoGenerateColumns="False" Width="99%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Guarantor Code" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGuarantorCode" runat="server" Text='<%#Bind("Guarantor_Code") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Guarantor Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGuarantorName" runat="server" Text='<%#Bind("Guarantor_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" Width="15%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Guarantor Code">
                                                                <ItemTemplate>
                                                                    <%--<asp:Label ID="lblCustId" runat="server" Text='<%#Eval("Customer_ID")%>' Visible="false" />--%>
                                                                    <asp:Label ID="lblCustId" runat="server" Text='<%#Eval("Customer_ID")%>' Visible="false" />
                                                                    <asp:LinkButton ID="lnkAddress" runat="server" CausesValidation="false" OnClick="lnkAddress_Click" ToolTip="Guarantor Address" CssClass="grid_btn_link" Text='<%#Eval("Customer_Code")%>'></asp:LinkButton>
                                                                    <asp:TextBox ID="txtGuarantorAddress" runat="server" TextMode="MultiLine" Text='<%#Bind("Guarantor_Address1") %>'
                                                                        ReadOnly="true" BorderStyle="None" Width="200px" Visible="false"></asp:TextBox>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Guarantee Amount">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGuaranteeAmount" runat="server" Text='<%#Bind("Guarantee_Amount") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Right" Width="15%" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tplGarageDetails" Enabled="true" runat="server" CssClass="tabpan"
                                TabIndex="2" BackColor="Red" Width="100%" HeaderText="Garage Details" Visible="false">
                                <HeaderTemplate>
                                    Garage Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td valign="top">
                                                <asp:Panel ID="PnlGarageDetails" runat="server" CssClass="stylePanel" GroupingText="Garage Details">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblGarageCode" runat="server" Text="Garage Code" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel" rowspan="1">
                                                                <asp:TextBox ID="txtGarageCode" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblAssetCondition" runat="server" Text="Condition of Asset" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtAssetCondition" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblGarageAddress" runat="server" Text="Garage Address" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtGarageAddress" runat="server" Width="255px" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblAssetInventory" runat="server" Text="Asset Inventory" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtAssetInventory" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldAlign">
                                                                <asp:Label ID="lblInsuranceValidUpto" runat="server" Text="Insurance Validity Upto"
                                                                    CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:TextBox ID="txtInsuranceValidUpto" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td class="styleFieldLabel"></td>
                                                            <td class="styleFieldLabel"></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="btn_height"></div>
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
                <asp:Label ID="lblCustAddress" runat="server" Style="display: none;"></asp:Label>
                <cc1:ModalPopupExtender ID="mpeCustAddress" runat="server" PopupControlID="dvCustAddress" TargetControlID="lblCustAddress"
                    BackgroundCssClass="modalBackground" Enabled="true" />
                <div runat="server" id="dvCustAddress" style="display: none; width: 50%; height: 50%;">
                    <div id="Div5" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
                        <asp:ImageButton ID="imgCustAddress" runat="server" Width="50px" CausesValidation="false" ToolTip=" Close,Alt+I" AccessKey="I" Height="50px" ImageUrl="~/Images/close.png"
                            OnClick="imgCustAddress_Click" />
                    </div>
                    <div>
                        <asp:Panel ID="Panel2" GroupingText="Guarantor Address Details" CssClass="stylePanel" runat="server"
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
                                                <asp:Label ID="lblAddress" runat="server" Text="Address" Visible="false"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </div>
                </div>
                <%--<asp:ValidationSummary ID="vsSave" runat="server" CssClass="styleMandatoryLabel"
                    ValidationGroup="Submit" HeaderText="Correct the following validation(s):" />--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
