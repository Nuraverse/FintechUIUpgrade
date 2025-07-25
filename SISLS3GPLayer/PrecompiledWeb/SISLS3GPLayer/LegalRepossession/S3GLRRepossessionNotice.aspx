<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LegalRepossession_S3GLRRepossessionNotice, App_Web_5saef4xg" title="Untitled Page" %>

<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>

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

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcRepossessNotice_tbgeneral_btnLoadCust').click();
        }

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcRepossessNotice_tbgeneral_btnLoadAccount').click();
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

        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossessNotice');

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

                var TC = $find("<%=tcRepossessNotice.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();
                }
            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {

            var TC = $find("<%=tcRepossessNotice.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }

            tab = $find('ctl00_ContentPlaceHolder1_tcRepossessNotice');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                //  debugger;
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

        function fn_IsLetterExists(strValGrp, blnConfirm) {
            if (Page_ClientValidate(strValGrp)) {
                if (blnConfirm == undefined) {
                    var Mlink = document.getElementById('<%=hl_magistrate.ClientID%>');
                    var Plink = document.getElementById('<%=hl_police.ClientID%>');
                    var Clink = document.getElementById('<%=hl_customer.ClientID%>');

                    var Mchk = document.getElementById('<%=chkMagistrate.ClientID%>');
                    var Pchk = document.getElementById('<%=chkPolice.ClientID%>');
                    var Cchk = document.getElementById('<%=chkCustomer.ClientID%>');

                    if (Mlink != null && Mchk.checked == true) {
                        if (confirm('Repossession Notice Already Exists. Do you want to Regenerate?')) {
                            var a = event.srcElement;
                            if (a.type == "submit") {
                                a.style.display = 'none';
                            }
                            document.getElementById('<%=btnPDF.ClientID%>').click();
                            return true;
                        }
                        else
                            return false;
                    }
                    else if (Plink != null && Pchk.checked == true) {
                        if (confirm('Repossession Notice Already Exists. Do you want to Regenerate?')) {
                            var a = event.srcElement;
                            if (a.type == "submit") {
                                a.style.display = 'none';
                            }
                            document.getElementById('<%=btnPDF.ClientID%>').click();
                            return true;
                        }
                        else
                            return false;
                    }
                    else if (Clink != null && Cchk.checked == true) {
                        if (confirm('Repossession Notice Already Exists. Do you want to Regenerate?')) {
                            var a = event.srcElement;
                            if (a.type == "submit") {
                                a.style.display = 'none';
                            }
                            document.getElementById('<%=btnPDF.ClientID%>').click();
                            return true;
                        }
                        else
                            return false;
                    }
                    else {
                        //return true;
                        if (confirm('Are you sure? Want to Generate Notice?')) {
                            var a = event.srcElement;
                            if (a.type == "submit") {
                                a.style.display = 'none';
                            }
                            document.getElementById('<%=btnPDF.ClientID%>').click();
                            return true;
                        }
                        else
                            return false;
                    }
        }
        else {
            Page_BlockSubmit = false;
            return true;
        }
    }
}


function fn_IsLetterExistsWord(strValGrp, blnConfirm) {
    if (Page_ClientValidate(strValGrp)) {

        if (blnConfirm == undefined) {
            var Mlink_word = document.getElementById('<%=hl_magistrate_word.ClientID%>');
            var Plink_word = document.getElementById('<%=hl_police_word.ClientID%>');
            var Clink_word = document.getElementById('<%=hl_customer_word.ClientID%>');

            var Mchk_word = document.getElementById('<%=chkMagistrate.ClientID%>');
            var Pchk_word = document.getElementById('<%=chkPolice.ClientID%>');
            var Cchk_word = document.getElementById('<%=chkCustomer.ClientID%>');

            if (Mlink_word != null && Mchk_word.checked == true) {
                if (confirm('Repossession Notice Already Exists. Do you want to Regenerate?')) {
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    document.getElementById('<%=btnMSword.ClientID%>').click();
                    return true;
                }
                else
                    return false;
            }
            else if (Plink_word != null && Pchk_word.checked == true) {
                if (confirm('Repossession Notice Already Exists. Do you want to Regenerate?')) {
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    document.getElementById('<%=btnMSword.ClientID%>').click();
                    return true;
                }
                else
                    return false;
            }
            else if (Clink_word != null && Cchk_word.checked == true) {
                if (confirm('Repossession Notice Already Exists. Do you want to Regenerate?')) {
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    document.getElementById('<%=btnMSword.ClientID%>').click();
                    return true;
                }
                else
                    return false;
            }
            else {
                //return true;
                if (confirm('Are you sure? Want to Generate Notice?')) {
                    document.getElementById('<%=btnMSword.ClientID%>').click();
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    return true;
                }
                else
                    return false;
            }
}
else {
    Page_BlockSubmit = false;
    return true;
}
}


}</script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="Repossession Notice" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                            <input id="HidConfirm" type="hidden" runat="server" />
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <cc1:TabContainer ID="tcRepossessNotice" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                        Width="99%" ScrollBars="None">
                        <cc1:TabPanel runat="server" HeaderText="General" ID="tbgeneral" CssClass="tabpan"
                            BackColor="Red" ToolTip="General" Width="99%">
                            <HeaderTemplate>
                                General
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">
                                                    <div id="Div1" class="col-lg-4 col-md-6 col-sm-6 col-xs-12" runat="server">
                                                        <div class="md-input">
                                                            <uc3:Suggest ID="ucNoticeNumber" OnItem_Selected="ucNoticeNumber_Item_Selected" ErrorMessage="Legal Repossession Note Number"
                                                                ValidationGroup="Submit" AutoPostBack="true" runat="server" ServiceMethod="GetNoteNumber" IsMandatory="true" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label Text="Legal Repossession Note Number" runat="server" ID="lblNoticeNo" CssClass="styleReqFieldLabel" />
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" Enabled="false"
                                                                AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                            <%-- <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                                    ValidationGroup="Submit" ErrorMessage="Select Line of Business" ControlToValidate="ddlLob"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Location" AutoPostBack="True" Enabled="false"
                                                                OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                            <%--  <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"
                                                                    ValidationGroup="Submit" ErrorMessage="Select Branch" ControlToValidate="ddlBranch"
                                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAmtFin" runat="server" ReadOnly="true" ToolTip="Amount Financed" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true" Enabled="false" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Amount Financed" ID="lblAmtFin" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divAcc" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtPANum" runat="server" ReadOnly="true" ToolTip="Account Number"
                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Account Number" ID="lblPANum" CssClass="styleDisplayLabel"></asp:Label>
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
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtTenure" runat="server" ReadOnly="true" ToolTip="Tenure" Style="text-align: right"
                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Tenure" ID="lblTenure" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divSubNo" runat="server" visible="false">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtSANum" runat="server" ReadOnly="true" ToolTip="Sub Account Number"
                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Sub Account Number" ID="lblSANum" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtAccDate" runat="server" ReadOnly="true" ToolTip="Account Date"
                                                                class="md-form-control form-control login_form_content_input requires_true" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Account Date" ID="lblAccDate" CssClass="styleDisplayLabel"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                Enabled="false" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" strLOV_Code="CUS_COM" />
                                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                                Style="display: none" Enabled="false" />
                                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" Enabled="false"
                                                                class="md-form-control form-control login_form_content_input requires_true" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code"></asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <asp:Panel ID="pnlCustDetails" runat="server" GroupingText="Customer Information" Width="100%"
                                                    CssClass="stylePanel" Visible="false">
                                                    <asp:HiddenField ID="hdnCustID" runat="server" Value="" />
                                                    <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" ActiveViewIndex="1" runat="server"
                                                        FirstColumnStyle="styleFieldLabel" SecondColumnStyle="styleFieldAlign" />
                                                </asp:Panel>
                                                <asp:Panel Width="100%" ID="pnlGuarDetails" runat="server" GroupingText="Guarantor Information"
                                                    CssClass="stylePanel" Visible="false">
                                                    <asp:Label ID="lblGuarDetails" runat="server" Text="No Guarantor details Available"
                                                        Visible="false" />
                                                    <asp:GridView Width="100%" ID="gvGuarDetails" runat="server" AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Guarantor Code" DataField="Guarantor_Code" ItemStyle-HorizontalAlign="Left" />
                                                            <asp:BoundField HeaderText="Guarantor Name" DataField="Guarantor_Name" ItemStyle-HorizontalAlign="Left" />
                                                            <%-- <asp:BoundField HeaderText="Guarantor Address" DataField="Guarantor_Address1" ItemStyle-HorizontalAlign="Left" />--%>
                                                            <asp:BoundField HeaderText="Guarantee Amount" DataField="Guarantee_Amount" ItemStyle-HorizontalAlign="Right" />

                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:Panel>
                                                <asp:Panel runat="server" ID="pnlGenerateNotice" CssClass="stylePanel" GroupingText="Generate Letter"
                                                    Width="100%">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:Label ID="lblMagistrate" runat="server" Text="Letter To Magistrate before Repossession" />
                                                                        <asp:CheckBox ID="chkMagistrate" runat="server" ToolTip="Genarete Letter to Magistrate" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" id="divCust" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:Label ID="Label3" runat="server" Text="Letter To Customer after Repossession" />
                                                                        <asp:CheckBox ID="chkCustomer" runat="server" ToolTip="Genarete Letter to Customer" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:Label ID="Label2" runat="server" Text="Letter To ROP before Repossession" />
                                                                        <asp:CheckBox ID="chkPolice" runat="server" ToolTip="Genarete Letter to ROP" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:HyperLink ID="hl_magistrate" runat="server" AlternateText="View Letter" ToolTip="Open Letter in PDF format"
                                                                            Target="_blank" Visible="false">
                                                                            <asp:Image ImageUrl="~/Images/pdf.png" AlternateText="View Letter" ID="img_magistrate"
                                                                                runat="server" Visible="false" />
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:HyperLink ID="hl_magistrate_word" runat="server" AlternateText="View Letter"
                                                                            ToolTip="Open Letter in Ms Word format" Target="_blank" Visible="false">
                                                                            <asp:Image ImageUrl="~/Images/word.png" AlternateText="View Letter" ID="img_magistrate_word"
                                                                                runat="server" Visible="false" />
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:HyperLink ID="hl_police" runat="server" AlternateText="View Letter" Target="_blank"
                                                                            Visible="false" ToolTip="Open Letter in PDF format">
                                                                            <asp:Image ImageUrl="~/Images/pdf.png" AlternateText="View Letter" ID="img_police"
                                                                                runat="server" />
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:HyperLink ID="hl_police_word" runat="server" AlternateText="View Letter" Target="_blank"
                                                                            Visible="false" ToolTip="Open Letter in MS Word format">
                                                                            <asp:Image ImageUrl="~/Images/word.png" AlternateText="View Letter" ID="img_police_word"
                                                                                runat="server" />
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:HyperLink ID="hl_customer" runat="server" AlternateText="View Letter" Target="_blank"
                                                                            Visible="false">
                                                                            <asp:Image ImageUrl="~/Images/pdf.png" AlternateText="View Letter" ToolTip="Open Letter in PDF format"
                                                                                ID="img_customer" runat="server" />
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:HyperLink ID="hl_customer_word" ToolTip="Open Letter in MS Word format" runat="server"
                                                                            AlternateText="View Letter" Target="_blank" Visible="false">
                                                                            <asp:Image ImageUrl="~/Images/word.png" AlternateText="View Letter" ID="img_customer_word"
                                                                                runat="server" />
                                                                        </asp:HyperLink>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>

                                            </div>
                                        </div>
                                        <div class="row" style="display: none" class="col">
                                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                        </div>
                                    </ContentTemplate>
                                    <%--<Triggers>
                                        <asp:PostBackTrigger ControlID="ucNoticeNo" />
                                    </Triggers>--%>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Magistrate Address Details" ID="tbMagistrate"
                            CssClass="tabpan" BackColor="Red" ToolTip="" Width="99%">
                            <HeaderTemplate>
                                Court Address
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div class="row">
                                    <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel GroupingText="Court Address Details" ID="pnlCommAddress" runat="server"
                                            CssClass="stylePanel">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <uc1:AddSetup ID="ucBasicDetAddressSetup" runat="server" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="ROP Address Details" ID="tbPolice" CssClass="tabpan"
                            BackColor="Red" ToolTip="" Width="99%">
                            <HeaderTemplate>
                                ROP Address
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel GroupingText="ROP Address Details" ID="Panel3" runat="server"
                                            CssClass="stylePanel">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <uc1:AddSetup ID="ucOtherDetAddressSetup" runat="server" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="Magistrate Address Details" ID="TabPanel2" Visible="false"
                            CssClass="tabpan" BackColor="Red" ToolTip="" Width="99%">
                            <HeaderTemplate>
                                Court Address
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div class="row">
                                    <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="divCourtAddress" runat="server" visible="false">
                                        <asp:Panel ID="Panel2" GroupingText="Court Address Details" CssClass="stylePanel" Visible="false"
                                            runat="server" Width="100%">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMagistaddr" runat="server" ToolTip="Addressee" class="md-form-control form-control login_form_content_input requires_true"
                                                                            MaxLength="60" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label17" Text="Addressee" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtMagistaddr"
                                                                            ValidChars=",/\-() ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc3:Suggest ID="ucMagistCourt" runat="server" ServiceMethod="GetCourtName" OnItem_Selected="ucMagistCourt_Item_Selected"
                                                                            AutoPostBack="true" class="md-form-control form-control" />
                                                                        <%-- <asp:TextBox ID="txtMagistCourt" runat="server" ToolTip="Name of the Court"
                                                                    class="md-form-control form-control login_form_content_input requires_true" MaxLength="60" />--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label18" Text="Name of the Court" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMagistPlace" runat="server" ToolTip="Place" class="md-form-control form-control login_form_content_input requires_true"
                                                                            MaxLength="60" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label19" Text="Place" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtMagistPlace"
                                                                            ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMagistCity" runat="server" ToolTip="City" MaxLength="30" class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label20" Text="City" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtMagistCity"
                                                                            ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMagistDistrict" runat="server" ToolTip="District" MaxLength="60"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label21" Text="District" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" Enabled="True"
                                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtMagistDistrict"
                                                                                ValidChars=" ">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMagistState" runat="server" ToolTip="State" class="md-form-control form-control login_form_content_input requires_true"
                                                                            MaxLength="60" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label22" Text="State" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" Enabled="True"
                                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtMagistState"
                                                                                ValidChars=" ">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMagistPin" runat="server" ToolTip="PIN/ZIP Code" MaxLength="10"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label23" Text="PIN/ZIP Code" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <cc1:FilteredTextBoxExtender ID="FtMagistPin" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                TargetControlID="txtMagistPin" ValidChars=" ">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel runat="server" HeaderText="ROP Address Details" ID="tabpanel1" CssClass="tabpan" Visible="false"
                            BackColor="Red" ToolTip="" Width="99%">
                            <HeaderTemplate>
                                ROP Address
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="divROPAddress" runat="server" visible="false">
                                        <asp:Panel ID="Panel1" GroupingText="ROP Address Details" CssClass="stylePanel" Visible="false"
                                            runat="server" Width="100%">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPoliceAddr" runat="server" ToolTip="Addressee" MaxLength="60"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label10" Text="Addressee" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtPoliceAddr"
                                                                            ValidChars=",/\-() ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPoliceStation" runat="server" MaxLength="60" ToolTip="Name of the ROP"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label11" Text="Name of the ROP" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtPoliceStation"
                                                                            ValidChars=",/\-() ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPolicePlace" runat="server" ToolTip="Place" MaxLength="60"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label12" Text="Place" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtPolicePlace"
                                                                            ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPoliceCity" runat="server" ToolTip="City" MaxLength="30"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label13" Text="City" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtPoliceCity"
                                                                            ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPoliceDistrict" runat="server" ToolTip="District" MaxLength="60"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label14" Text="District" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtPoliceDistrict"
                                                                            ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPoliceState" runat="server" ToolTip="State" MaxLength="60"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label15" Text="State" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" Enabled="True"
                                                                            FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtPoliceState"
                                                                            ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPolicePin" runat="server" ToolTip="PIN/ZIP Code" MaxLength="10"
                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="Label16" Text="PIN/ZIP Code" CssClass="styleReqFieldLabel" />
                                                                        </label>
                                                                        <cc1:FilteredTextBoxExtender ID="FtPolicePin" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtPolicePin" ValidChars=" ">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </div>
                <%-- <asp:Button ID="btnEmail" runat="server" Text="Email" CssClass="styleSubmitButton" AccessKey="M" ToolTip="Email,Alt+M"
                        Visible="false" />--%>
                <%-- <asp:Button ID="b1" runat="server" CausesValidation="False" CssClass="styleSubmitButton" AccessKey="P" ToolTip="Print,Alt+P"
                        OnClientClick="return fnConfirmClear();" OnClick="b1_Click" Text="Print" Visible="false" />
                    <asp:Button ID="b2" runat="server" CausesValidation="False" CssClass="styleSubmitButton" AccessKey="M" ToolTip="Print,Alt+M"
                        OnClick="b2_Click" Text="Print" Visible="false" />--%>
                <%-- <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                <div class="btn_height"></div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Submit'))" causesvalidation="false"
                        onserverclick="btnPDF_Click" runat="server"
                        type="button" accesskey="S" validationgroup="Submit">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnPDF" title="PDF[Alt+F]" causesvalidation="false"
                        onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="F" validationgroup="Submit">
                        <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;PD<u>F</u>
                    </button>
                    <button class="css_btn_enabled" id="btnMSword" title="MSword[Alt+W]" causesvalidation="false" onserverclick="btnMSword_Click" runat="server"
                        type="button" accesskey="W">
                        <i class="fa fa-file-word-o" aria-hidden="true"></i>&emsp;MS<u>W</u>ord
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
                <%-- </div>
                </div>--%>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPDF" />
        </Triggers>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnMSword" />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>
