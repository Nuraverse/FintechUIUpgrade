<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collateral_S3GCLTCollateralCapture_Add, App_Web_1zfg0k2m" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ OutputCache Location="None" VaryByParam="none" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">



        //window.history.forward(-1);
        function trimStartingSpace(textbox) {
            var textValue = textbox.value;
            if (textValue.length == 0 && window.event.keyCode == 32) {
                window.event.keyCode = 0;
                return false;
            }
        }
        function confirm_delete() {

            var tmp = confirm("Collateral Security is mapped with Storage \n \n Are you sure you want to delete?");

            if (tmp == true) {

                document.getElementById('ctl00_ContentPlaceHolder1_tcCollateralCapture_tabgeneral_hdnValue').value = tmp;
                return true;
            }

            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcCollateralCapture_tabgeneral_hdnValue').value = tmp;
                return false;
            }
        }

        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCollateralCapture_tabgeneral_btnLoadCust').click();
        }

        function fnGetValue(txtMeasurement, txtUnitRate, txtValue, txtProGpsSuffixRW) {
            //alert('hi');
            var Measurement = document.getElementById(txtMeasurement).value;
            var UnitRate = document.getElementById(txtUnitRate).value;
            var Value = Measurement * UnitRate;
            //alert(Value);
            document.getElementById(txtValue).value = Value;

        }
        function fncheckMandatory(ddlID, rfvIssuedByID, rfvUnitFaceValueID, rfvNoOfUnitsID, rfvInterestID, rfvMaturityDateID, rfvMaturityValueID) {
            var ddlSecurity = document.getElementById(ddlID);
            var ddlSecValue = ddlSecurity.options[ddlSecurity.selectedIndex].text;
            var rfvIssuedBy = document.getElementById(rfvIssuedByID);
            var rfvUnitFaceValue = document.getElementById(rfvUnitFaceValueID);
            var rfvNoOfUnits = document.getElementById(rfvNoOfUnitsID);

            var rfvInterest = document.getElementById(rfvInterestID);
            var rfvMaturityDate = document.getElementById(rfvMaturityDateID);
            var rfvMaturityValue = document.getElementById(rfvMaturityValueID);

            if (ddlSecValue == "Deposits") {
                ValidatorEnable(rfvIssuedBy, false);
                ValidatorEnable(rfvUnitFaceValue, false);
                ValidatorEnable(rfvNoOfUnits, false);
            }
            else {
                ValidatorEnable(rfvIssuedBy, true);
                ValidatorEnable(rfvUnitFaceValue, true);
                ValidatorEnable(rfvNoOfUnits, true);
            }

            if (ddlSecValue == "Equity Shares") {
                ValidatorEnable(rfvIssuedBy, false);
                ValidatorEnable(rfvUnitFaceValue, false);
                ValidatorEnable(rfvNoOfUnits, false);
            }
            else {
                ValidatorEnable(rfvIssuedBy, true);
                ValidatorEnable(rfvUnitFaceValue, true);
                ValidatorEnable(rfvNoOfUnits, true);
            }
        }
        //*
        //function pageLoad() {
        //alert('test');
        //var TC = $find("<%=tcCollateralCapture.ClientID %>");
        //var TC1 = $find("<%=tabHighLiq.ClientID %>");

        //if (TC.get_activeTab().get_tabIndex() == 0) {
        // $get("<%=ddlType.ClientID %>").focus();
        //}
        //else if (TC1.get_activeTab().get_tabIndex() == 0) {
        // alert('test1');
        // $get("<%=ddlhCollSecurities.ClientID %>").focus();
        // }
        //}
        // 
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
        function pageLoad() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcCollateralCapture_tabgeneral_ddlType').focus();
        }

        function fncheckMandatory1(ddlID, txtDPNameID, txtDPNoID, txtClientIDID, txtCertificateNoID, rfvDPNameID, rfvDPNOID, rfvClientIDID, rfvCertificateNoID) {
            //debugger;
            var ddlDemat = document.getElementById(ddlID);
            var ddlDematValue = ddlDemat.options[ddlDemat.selectedIndex].text;
            var txtDPName = document.getElementById(txtDPNameID);
            var txtDPNo = document.getElementById(txtDPNoID);
            var txtClientID = document.getElementById(txtClientIDID);
            var txtCertificateNo = document.getElementById(txtCertificateNoID);
            var rfvDPName = document.getElementById(rfvDPNameID);
            var rfvDPNO = document.getElementById(rfvDPNOID);
            var rfvClientID = document.getElementById(rfvClientIDID);
            var rfvCertificateNo = document.getElementById(rfvCertificateNoID);
            var lblhCertificateNo = document.getElementById('<%=lblhCertificateNo.ClientID%>');
            var lblhDPNo = document.getElementById('<%=lblhDPNo.ClientID%>');
            var lblhDPName = document.getElementById('<%=lblhDPName.ClientID%>');
            var lblhClientID = document.getElementById('<%=lblhClientID.ClientID%>');

            if (ddlDematValue == "No") {
                ValidatorEnable(rfvDPName, false);
                ValidatorEnable(rfvDPNO, false);
                ValidatorEnable(rfvClientID, false);
                ValidatorEnable(rfvCertificateNo, true);
                txtDPName.setAttribute("readOnly", "readOnly");
                txtClientID.setAttribute("readOnly", "readOnly");
                txtCertificateNo.removeAttribute("readOnly");
                txtDPNo.setAttribute("readOnly", "readOnly");

                txtDPNo.value = "";
                txtClientID.value = "";
                txtDPName.value = "";

                lblhDPNo.className = "";
                lblhDPName.className = "";
                lblhClientID.className = "";

                lblhCertificateNo.className = "styleReqFieldLabel";
                //                alert('No');

            }
            if (ddlDematValue == "Yes") {
                ValidatorEnable(rfvDPName, true);
                ValidatorEnable(rfvDPNO, true);
                ValidatorEnable(rfvClientID, true);
                ValidatorEnable(rfvCertificateNo, false);
                txtDPName.removeAttribute("readOnly");
                txtClientID.removeAttribute("readOnly");
                txtCertificateNo.setAttribute("readOnly", "readOnly");
                txtDPNo.removeAttribute("readOnly");
                //                alert('Yes');
                txtCertificateNo.value = "";
                lblhCertificateNo.className = "";

                lblhDPNo.className = "styleReqFieldLabel";
                lblhDPName.className = "styleReqFieldLabel";
                lblhClientID.className = "styleReqFieldLabel";
            }
        }

        function fncheckMandatoryInMedSec(ddlID, rfvRegistrationID, rfvSerialNoID) {
            var ddlSecurity = document.getElementById(ddlID);
            var ddlSecValue = ddlSecurity.options[ddlSecurity.selectedIndex].text;
            var rfvRegistration = document.getElementById(rfvRegistrationID);
            var rfvSerialNo = document.getElementById(rfvSerialNoID);
            if (ddlSecValue == "Machinery") {
                ValidatorEnable(rfvRegistration, false);
                ValidatorEnable(rfvSerialNo, true);
            }
            if (ddlSecValue == "Vehicles") {
                ValidatorEnable(rfvRegistration, true);
                ValidatorEnable(rfvSerialNo, false);
            }
        }



    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Collateral Capture" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                                <input id="HidConfirm" type="hidden" runat="server" />
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabContainer ID="tcCollateralCapture" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                                ScrollBars="None" AutoPostBack="false">

                                <cc1:TabPanel runat="server" HeaderText="General" ID="tabgeneral" CssClass="tabpan"
                                    BackColor="Red" ToolTip="General">
                                    <HeaderTemplate>
                                        General
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upMainPage" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center" style="display: none;" id="dvrbl" runat="server" visible="false">
                                                        <asp:RadioButtonList ID="rbtlCollCollected" runat="server" RepeatDirection="Horizontal"
                                                            AutoPostBack="True" OnSelectedIndexChanged="rbtlCollCollected_SelectedIndexChanged">
                                                            <asp:ListItem Selected="True" Value="1">Customer</asp:ListItem>
                                                            <%--<asp:ListItem Value="2">Others</asp:ListItem>--%>
                                                            <%-- As discussed with thalai In Debt Collector Master Screen not need third party user so, here also not required--%>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                                                        <asp:Panel ID="pnlCustDetails" runat="server" CssClass="stylePanel" GroupingText="Customer Details">
                                                            <div class="row">
                                                                <div style="display: none" class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlType" Enabled="true"
                                                                                Display="Dynamic" ErrorMessage="Select a Type" InitialValue="0" SetFocusOnError="True"
                                                                                ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvTypeGo" runat="server" ControlToValidate="ddlType"
                                                                                Display="Dynamic" ErrorMessage="Select a Type" InitialValue="0" SetFocusOnError="True" Enabled="true"
                                                                                ValidationGroup="Go" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblType" runat="server" CssClass="styleReqFieldLabel" Text="Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCustomerCode" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="50"
                                                                            Style="display: none" ToolTip="Customer"></asp:TextBox>
                                                                        <asp:DropDownList ID="ddlCollectionAgent" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCollectionAgent_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <%-- <uc2:LOV ID="ucCustomerCodeLov" runat="server" onblur="fnLoadCustomer()" strLOV_Code="CCP" TabIndex="-1" />--%>
                                                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" IsMandatory="true" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                                                            strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                                        <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" Style="display: none" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click" />
                                                                        <asp:Button ID="btncust" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btncust_Click"
                                                                            Style="display: none" />
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvCustomerCode" runat="server" ControlToValidate="txtCustomerCode"
                                                                                Display="Dynamic" ErrorMessage="Select a Customer Code" SetFocusOnError="True"
                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvCustomerCodeGo" runat="server" ControlToValidate="txtCustomerCode"
                                                                                Display="Dynamic" ErrorMessage="Select a Customer Code" SetFocusOnError="True"
                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <input id="hdnCustID" runat="server" type="hidden" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustorAgent" runat="server" Text="Customer/Agent"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlConstitution" runat="server" Enabled="false"
                                                                            OnSelectedIndexChanged="ddlConstitution_SelectedIndexChanged" CssClass="validation_msg_box_sapn">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblConstitution" runat="server" CssClass="styleDisplayLabel" Text="Constitution"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <%-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:Button ID="btnLoadCustomer" runat="server" OnClick="btnLoadCustomer_Click" Style="display: none"
                                                                            Text="Load Customer" AccessKey="C" ToolTip="Load Customer,Alt+C" />
                                                                        <uc1:S3GCustomerAddress ID="S3GCustomerAddress1" runat="server" FirstColumnStyle="styleFieldLabel"
                                                                            SecondColumnStyle="styleFieldAlign" ShowCustomerCode="false" />
                                                                        <input id="hdnCustID" runat="server" type="hidden" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <div id="divSpace" runat="server" style="height: 5px;">
                                                                        </div>
                                                                    </div>
                                                                </div>--%>
                                                            </div>
                                                        </asp:Panel>
                                                        <asp:HiddenField ID="hdnValue" runat="server" />
                                                    </div>


                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
                                                        <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel" GroupingText="Header Details">
                                                            <div class="row">
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCollTransNo" runat="server" ContentEditable="false" Enabled="false"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblColleNo" runat="server" CssClass="styleDisplayLabel" Text="Collateral Trans No"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCollTransDate" runat="server" ReadOnly="True"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCollTransDate" runat="server" CssClass="styleReqFieldLabel" Text="Collateral Trans Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <%-- <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                                                Display="Dynamic" ErrorMessage="Select a Line of business" InitialValue="0" SetFocusOnError="True"
                                                                                ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>--%>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLOBGo" runat="server" ControlToValidate="ddlLOB"
                                                                                Display="Dynamic" ErrorMessage="Select a Line of business" InitialValue="0" SetFocusOnError="True"
                                                                                ValidationGroup="Go" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                                            ToolTip="Branch" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <%--<uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList"
                                                                            ToolTip="Branch" OnItem_Selected="ddlBranch_SelectedIndexChanged" AutoPostBack="true"/>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblBranch" runat="server" CssClass="styleDisplayLabel" Text="Location"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <%-- <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlConstitution" runat="server" AutoPostBack="True"
                                                                            OnSelectedIndexChanged="ddlConstitution_SelectedIndexChanged" CssClass="validation_msg_box_sapn">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblConstitution" runat="server" CssClass="styleDisplayLabel" Text="Constitution"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>--%>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlProductCode" runat="server" AutoPostBack="true"
                                                                            OnSelectedIndexChanged="ddlProductCode_SelectedIndexChanged" CssClass="validation_msg_box_sapn">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblProductCode" runat="server" CssClass="styleDisplayLabel" Text="Product Code"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlCurrCode" runat="server" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvCurrCode" runat="server" ControlToValidate="ddlCurrCode"
                                                                                Display="Dynamic" ErrorMessage="Select a Currency Code" InitialValue="0" SetFocusOnError="True"
                                                                                ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCurrCode" runat="server" CssClass="styleReqFieldLabel" Text="Currency Code"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlRefPoint" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRefPoint_SelectedIndexChanged"
                                                                            class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvRefPoint" runat="server" Enabled="false" ControlToValidate="ddlRefPoint"
                                                                                Display="Dynamic" ErrorMessage="Select a Ref Point" InitialValue="0" SetFocusOnError="True"
                                                                                ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRefPoint" runat="server" Text="Ref Point"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtCrossCollateralReferenceNumber" runat="server" MaxLength="20" ToolTip="Cross Collateral Reference Number"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCrossCollateralReferenceNumber" runat="server" CssClass="styleDisplayLabel" Text="Cross Collateral Reference Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtGroupCollateralReferenceNumber" runat="server" MaxLength="20" ToolTip="Group Collateral Reference Number"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lbltxtGroupCollateralReferenceNumber" runat="server" CssClass="styleDisplayLabel" Text="Group Collateral Reference Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtRemarks" runat="server" MaxLength="250" ToolTip="Remarks"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblRemarks" runat="server" CssClass="styleDisplayLabel" Text="Remarks"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAmountApproved" runat="server" MaxLength="20" ToolTip="Amount Approved"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="fttxtAmountApproved" runat="server" FilterType="Custom,Numbers"
                                                                            ValidChars="." TargetControlID="txtAmountApproved">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblAmountApproved" runat="server" CssClass="styleDisplayLabel" Text="Amount Approved"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div style="display: none" class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlDYNRefPoint" runat="server" Width="165px" Visible="false">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDYNRefPoint" runat="server" ControlToValidate="ddlDYNRefPoint"
                                                                                Display="Dynamic" InitialValue="0" SetFocusOnError="True" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDYNRefPoint" runat="server" CssClass="styleDisplayLabel" Text="Ref Code"
                                                                                Visible="false"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true" Style="text-align: right"
                                                                            ToolTip="Total" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTotal"
                                                                                Display="Dynamic" InitialValue="0" SetFocusOnError="True" ValidationGroup="Submit"
                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>



                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblTotal" runat="server" CssClass="styleDisplayLabel" Text="Total"> </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div align="right">

                                                                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Go" runat="server"
                                                                    type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                                                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                                                </button>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlPASADetails" runat="server" CssClass="stylePanel" GroupingText="Account Details"
                                                            ScrollBars="None" Visible="False">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <div runat="server" id="divAcc" class="container" style="height: 139px; overflow-x: hidden; overflow-y: scroll;">
                                                                            <asp:GridView ID="grvprimeaccount" runat="server" AutoGenerateColumns="False" BorderWidth="2px"
                                                                                ShowFooter="True" OnRowDataBound="grvprimeaccount_RowDataBound" EmptyDataText="No Records Found">
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="False">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblPASAID" runat="server" Text='<%# Eval("Account_ID") %>' />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Sl.No.">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="2%" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Prime A/c No.">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblMLA" runat="server" Text='<%#Eval("PRIMEACCOUNTNO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Account No.">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAccountNo" runat="server" Text='<%#Eval("PANUM")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Sub A/c No." Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSLA" runat="server" Text='<%#Eval("SUBACCOUNTNO")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select">
                                                                                        <HeaderTemplate>
                                                                                            <%--<table>
                                                                                                <tr align="center">
                                                                                                    <td align="center">--%>
                                                                                            <asp:Label ID="lblSelect" runat="server" Text="Select All" />
                                                                                            <%-- </td>
                                                                                                </tr>
                                                                                            </table>--%>
                                                                                        </HeaderTemplate>
                                                                                        <%--OnCheckedChanged="chkAccount_OnCheckedChanged"--%>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkAccount" runat="server" AutoPostBack="false" ToolTip="Select Account" />
                                                                                            <asp:Label ID="lblAccount_ID" runat="server" Text='<%#Eval("Account_ID")%>' Visible="false" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle Width="10%" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlLienAccounts"  runat="server" CssClass="stylePanel" GroupingText="Lien Account Details"
                                                            ScrollBars="None">
                                                            <div class="row">

                                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc:Suggest ID="ddlLienAccount" class="md-form-control form-control" ErrorMessage="Select the Lien Account" ValidationGroup="btnLienAccount" runat="server" ToolTip="Lien Account" ServiceMethod="GetLienAccountNo"
                                                                            IsMandatory="true" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblLienAccount" runat="server" Text="Lien Account" ToolTip="Add Lien Account" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                                                    <div class="md-input">
                                                                        <button class="css_btn_enabled" id="btnLienAccount" validationgroup="btnLienAccount" title="Add Lien Account[Alt+Y]" causesvalidation="true" onserverclick="btnLienAccount_Click" runat="server"
                                                                            type="submit" accesskey="Y">
                                                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u></u>Add Lien Account
                                                                        </button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div  class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="gird">
                                                                        <div runat="server" id="div1" class="container" style="height: 139px; overflow-x: hidden; overflow-y: scroll;Width:50% ">
                                                                            <asp:GridView ID="grvLienAccountDetails" runat="server" AutoGenerateColumns="False" BorderWidth="2px"
                                                                                ShowFooter="True" OnRowDataBound="grvLienAccountDetails_RowDataBound" EmptyDataText="No Records Found">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Sl.No.">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSNO" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Account No">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbllienPASAId" runat="server" Visible="false" Text='<%#Eval("Contract_No_Id")%>'></asp:Label>
                                                                                            <asp:Label ID="lblAccountNo" runat="server" Text='<%#Eval("Contract_No")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Collateral Status">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblCollateral_Sts" runat="server" Text='<%#Eval("Rele_Status")%>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField >
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="btnRemoveDaysLien" OnClick="btnRemoveDaysLien_Click" Text="Release" CssClass="grid_btn_delete" AccessKey="7" ToolTip="Release [Alt+7]" runat="server"
                                                                                                CausesValidation="false" OnClientClick="return confirm('Are you sure you want to release this Account?');" />
                                                                                        </ItemTemplate>


                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
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
                                <cc1:TabPanel runat="server" HeaderText="High Liquid Securities" ID="tabHighLiq" OnLoad="tabHighLiq_Load"
                                    CssClass="tabpan" BackColor="Red" ToolTip="High Liquid Securities" witdh="99%">
                                    <HeaderTemplate>
                                        High Liquid Securities
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="pnlHighLiqDetails" ScrollBars="Horizontal" CssClass="stylePanel"
                                                    GroupingText="High Liquid Security Details">
                                                    <asp:Label ID="lblHighLiqDetails" runat="server" Text="No Security Details are Available"
                                                        Visible="False" Font-Size="Large" Font-Bold="False" />
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlhCollSecurities" ToolTip="Collateral Securities" runat="server"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhCollSecurities" runat="server" ControlToValidate="ddlhCollSecurities"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Select Collateral Securities"
                                                                        InitialValue="0" ValidationGroup="AddHighLiqSec1"
                                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhCollSecurities" runat="server" CssClass="styleReqFieldLabel" Text="Collateral Securities"></asp:Label>
                                                                    <asp:Label ID="lblhSlNo" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="lblhMode" runat="server" Visible="False"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthIssuedBy" runat="server" ToolTip="Issued By" MaxLength="20"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvIssuedBy" runat="server" ControlToValidate="txthIssuedBy"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Issued By" ValidationGroup="AddHighLiqSec1"
                                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhIssuedBy" runat="server" TargetControlID="txthIssuedBy"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" ValidChars=" "
                                                                    Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhIssuedBy" runat="server" CssClass="styleReqFieldLabel" Text="Issued By"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlhDemat" runat="server" ToolTip="Demat" AutoPostBack="True"
                                                                    OnSelectedIndexChanged="ddlhDemat_SelectedIndexChanged"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhDemat" CssClass="styleRegLabel" runat="server" Text="Demat"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthDPName" MaxLength="20" ReadOnly="True" ToolTip="DP Name"
                                                                    onKeyPress="trimStartingSpace(this)" runat="server" Text='<%# Bind("Dp_Name") %>'
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhDPName" runat="server" ControlToValidate="txthDPName"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" Enabled="False" ErrorMessage="Enter DP Name"
                                                                        ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhDPName" runat="server" Text="DP Name"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthDPNo" runat="server" ReadOnly="True" MaxLength="15"
                                                                    ToolTip="DP No" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhDPNo" runat="server" TargetControlID="txthDPNo"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    ValidChars="/-#">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhDPNo" runat="server" ControlToValidate="txthDPNo"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" Enabled="False" ErrorMessage="Enter DP No"
                                                                        ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhDPNo" runat="server" Text="DP No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthClientID" ToolTip="Client ID" ReadOnly="True" runat="server"
                                                                    MaxLength="15" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexClientID" runat="server" TargetControlID="txthClientID"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    ValidChars="/-#">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhClientID" runat="server" ControlToValidate="txthClientID"
                                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True" Enabled="False" ErrorMessage="Enter Client ID"
                                                                        ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhClientID" runat="server" Text="Client ID"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthCertificateNo" runat="server" ToolTip="Certificate No"
                                                                    MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <cc1:FilteredTextBoxExtender ID="FtexhCertificateNo" runat="server" TargetControlID="txthCertificateNo"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    ValidChars="/-#">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhCertificateNo" runat="server" ControlToValidate="txthCertificateNo" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Certificate No" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhCertificateNo" runat="server" CssClass="styleReqFieldLabel" Text="Certificate No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthFolioNo" runat="server" ToolTip="Folio No" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <cc1:FilteredTextBoxExtender ID="FtexhFolioNo" runat="server" TargetControlID="txthFolioNo"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True"
                                                                    ValidChars="/-#">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txthFolioNo" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Folio No" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhFolioNo" runat="server" CssClass="styleReqFieldLabel" Text="Folio No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthUnitFaceValue" MaxLength="12" ToolTip="Unit Face Value"
                                                                    runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhUnitFaceValue" runat="server" TargetControlID="txthUnitFaceValue"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhUnitFaceValue" runat="server" ControlToValidate="txthUnitFaceValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Enter Unit Face Value" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhUnitFaceValue" runat="server" CssClass="styleReqFieldLabel" Text="Unit Face Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthNoOfUnits" MaxLength="10" ToolTip="No of Units"
                                                                    runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhNoOfUnits" runat="server" TargetControlID="txthNoOfUnits"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhNoOfUnits" runat="server" ControlToValidate="txthNoOfUnits" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter No Of Units" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhNoOfUnits" runat="server" CssClass="styleReqFieldLabel" Text="No Of Units"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthInterest" runat="server" MaxLength="5" ToolTip="Interest Percent"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhInterest" runat="server" ControlToValidate="txthInterest" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Interest Percent" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhInterest" runat="server" CssClass="styleReqFieldLabel" Text="Interest Percent"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthMaturityDate" ToolTip="Maturity Date" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CEhMaturityDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="Image1"
                                                                    TargetControlID="txthMaturityDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhMaturityDate" runat="server" ControlToValidate="txthMaturityDate" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Maturity Date" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhMaturityDate" runat="server" CssClass="styleReqFieldLabel" Text="Maturity Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthMaturityValue" runat="server" ToolTip="Maturity Value"
                                                                    MaxLength="15" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhMaturityValue" runat="server" TargetControlID="txthMaturityValue"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhMaturityValue" runat="server" ControlToValidate="txthMaturityValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Maturity Value" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhMaturityValue" runat="server" CssClass="styleReqFieldLabel" Text="Maturity Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthMarketRate" MaxLength="15" runat="server" ToolTip="Market Rate" OnTextChanged="txthMarketRate_TextChanged" AutoPostBack="true"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhMarketRate" runat="server" TargetControlID="txthMarketRate"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMarketRate" runat="server" ControlToValidate="txthMarketRate" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Market Rate" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhMarketRate" runat="server" CssClass="styleReqFieldLabel" Text="Market Rate"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthMarketValue" ContentEditable="false" ToolTip="Market Value" Enabled="false"
                                                                    MaxLength="20" runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)" OnTextChanged="txthMarketValue_TextChanged"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtxthMarketValue" runat="server" TargetControlID="txthMarketValue"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhMarketValue" runat="server" Text="Market Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthCollateralRefNo" ContentEditable="false" ToolTip="Collateral Ref No" Enabled="false"
                                                                    runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhCollateralRefNo" runat="server" CssClass="styleRegLabel" Text="Collateral Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthScanRefNo" runat="server" MaxLength="10" ToolTip="Scan Ref No"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexhScanRefNo" runat="server" TargetControlID="txthScanRefNo"
                                                                    FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhScanRefNo" runat="server" CssClass="styleRegLabel" Text="Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthItemRefNo" ContentEditable="false" runat="server" Enabled="false"
                                                                    ToolTip="Item Ref No" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhItemRefNo" runat="server" CssClass="styleRegLabel" Text="Item Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthTranRefNo" runat="server" ToolTip="Tran Ref No"
                                                                    ContentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblTranRefNo" runat="server" CssClass="styleRegLabel" Text="Tran Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txthownership" MaxLength="3" runat="server" ToolTip="Ownership %"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvhownership" runat="server" ControlToValidate="txthownership" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Ownership %" ValidationGroup="AddHighLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="Ftexhownership" runat="server" TargetControlID="txthownership"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblhownership" runat="server" CssClass="styleReqFieldLabel" Text="Ownership %"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtHExpiryDate" runat="server" ToolTip="Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="caltxtHExpiryDate" runat="server" Enabled="True"
                                                                    PopupButtonID="Image1" TargetControlID="txtHExpiryDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label1" runat="server" CssClass="styleDisplayLabel" Text="Expiry Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div align="right">


                                                        <button class="css_btn_enabled" id="btnAddH" title="Add[Alt+T]" validationgroup="AddHighLiqSec1" causesvalidation="true" onserverclick="btnAddH_Click" runat="server"
                                                            type="button" accesskey="T">
                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnModifyH" title="Modify,Alt+M" validationgroup="AddHighLiqSec1" causesvalidation="true" onserverclick="btnModifyH_Click" runat="server"
                                                            type="button" accesskey="M">
                                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnhClearH" title="ClearH,Alt+Q" causesvalidation="false" onserverclick="btnClearH_Click" runat="server"
                                                            type="button" accesskey="Q">
                                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                                                        </button>

                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="grid">
                                                                <asp:GridView ID="gvhHighLiqDetails" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvHighLiqDetails_RowDeleting"
                                                                    OnRowDataBound="gvHighLiqDetails_RowDataBound" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblMode" runat="server" Text='<%# Bind("Mode") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:RadioButton ID="rdSelect" runat="server" Checked="false" OnCheckedChanged="rdHSelect_CheckedChanged"
                                                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="6%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Issued By">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIssuedBy" runat="server" Text='<%# Bind("Issued_By") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="No of Units">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNoOfUnits" runat="server" Text='<%# Bind("No_Of_Units") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Interest Percent">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInterest" runat="server" Text='<%# Bind("Interest_Percentage") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Bind("Maturity_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityValue" runat="server" Text='<%# Bind("Maturity_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Rate">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketRate" runat="server" Text='<%# Bind("Market_Rate") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("Market_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Ownership %">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblownership" runat="server" Text='<%# Bind("Ownership") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Expiry Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExpiryDate" runat="server" Text='<%# Bind("Expiry_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete" title="Delete[Alt+H]" AccessKey="H">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="grid">
                                                                <asp:GridView ID="gvHighLiqDetails" runat="server" Visible="False" AutoGenerateColumns="False"
                                                                    ShowFooter="True" OnRowCommand="gvHighLiqDetails_RowCommand" OnRowDeleting="gvHighLiqDetails_RowDeleting"
                                                                    OnRowCancelingEdit="gvHighLiqDetails_RowCancelingEdit" OnRowUpdating="gvHighLiqDetails_RowUpdating"
                                                                    OnRowEditing="gvHighLiqDetails_RowEditing" OnRowDataBound="gvHighLiqDetails_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="6%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlCollSecurities" ToolTip="Collateral Securities" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvCollSecurities" runat="server" ControlToValidate="ddlCollSecurities"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities"
                                                                                    InitialValue="0" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Issued By">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIssuedBy" runat="server" Text='<%# Bind("Issued_By") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtIssuedBy" runat="server" MaxLength="20" ToolTip="Issued By" Text='<%# Bind("Issued_By") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvIssuedBy" runat="server" ControlToValidate="txtIssuedBy"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Issued By" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexIssuedBy" runat="server" ValidChars=" " TargetControlID="txtIssuedBy"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Demat">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDemat" Visible="false" runat="server" Text='<%# Bind("Demat") %>'></asp:Label>
                                                                                <asp:Label ID="lblDematDesc" runat="server" Text='<%# Bind("DematDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlDemat" runat="server" ToolTip="Demat">
                                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="DP Name">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDPName" runat="server" Text='<%# Bind("Dp_Name") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDPName" MaxLength="20" ToolTip="DP Name" onKeyPress="trimStartingSpace(this)"
                                                                                    runat="server" Text='<%# Bind("Dp_Name") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvDPName" runat="server" ControlToValidate="txtDPName"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter DP Name" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="DP No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDPNo" runat="server" Text='<%# Bind("Dp_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDPNo" runat="server" MaxLength="15" ToolTip="DP No" Text='<%# Bind("Dp_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexDPNo" runat="server" TargetControlID="txtDPNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="/-#">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvDPNo" runat="server" ControlToValidate="txtDPNo"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter DP No" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Client ID">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblClientID" runat="server" Text='<%# Bind("Client_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtClientID" runat="server" ToolTip="Client ID" MaxLength="15" Text='<%# Bind("Client_ID") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexClientID" runat="server" TargetControlID="txtClientID"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="/-#">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvClientID" runat="server" ControlToValidate="txtClientID"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Client ID" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Certificate No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCertificateNo" runat="server" Text='<%# Bind("Certificate_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCertificateNo" runat="server" ToolTip="Certificate No" MaxLength="20"
                                                                                    Text='<%# Bind("Certificate_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexCertificateNo" runat="server" TargetControlID="txtCertificateNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="/-#">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvCertificateNo" Enabled="false" runat="server"
                                                                                    ControlToValidate="txtCertificateNo" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Certificate No"
                                                                                    ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Folio No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblFolioNo" runat="server" Text='<%# Bind("Folio_no") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtFolioNo" runat="server" ToolTip="Folio No" MaxLength="20" Text='<%# Bind("Folio_no") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexFolioNo" runat="server" TargetControlID="txtFolioNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="/-#">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Face Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitFaceValue" runat="server" Text='<%# Bind("Unit_Face_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtUnitFaceValue" runat="server" ToolTip="Unit Face Value" MaxLength="12"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Unit_Face_Value") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexUnitFaceValue" runat="server" TargetControlID="txtUnitFaceValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvUnitFaceValue" runat="server" ControlToValidate="txtUnitFaceValue"
                                                                                    Display="Dynamic" ErrorMessage="Enter Unit Face Value" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="No of Units">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNoOfUnits" runat="server" Text='<%# Bind("No_Of_Units") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtNoOfUnits" runat="server" ToolTip="No of Units" MaxLength="10"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("No_Of_Units") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexNoOfUnits" runat="server" TargetControlID="txtNoOfUnits"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvNoOfUnits" runat="server" ControlToValidate="txtNoOfUnits"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter No Of Units" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Interest Percent">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInterest" runat="server" Text='<%# Bind("Interest_Percentage") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtInterest" runat="server" MaxLength="5" ToolTip="Interest Percent"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Interest_Percentage") %>'></asp:TextBox>
                                                                                <%--<cc1:FilteredTextBoxExtender ID="FtexInterest" runat="server" TargetControlID="txtInterest"
                                                            FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="rfvInterest" runat="server" ControlToValidate="txtInterest"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Interest Percent" ValidationGroup="AddHighLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Bind("Maturity_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMaturityDate" ContentEditable="false" ToolTip="Maturity Date"
                                                                                    runat="server" Text='<%# Bind("Maturity_Date") %>'></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="CEMaturityDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="Image1"
                                                                                    TargetControlID="txtMaturityDate">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvMaturityDate" runat="server" ControlToValidate="txtMaturityDate"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Maturity Date" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityValue" runat="server" Text='<%# Bind("Maturity_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMaturityValue" runat="server" MaxLength="12" ToolTip="Maturity Value"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Maturity_Value") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexMaturityValue" runat="server" TargetControlID="txtMaturityValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvMaturityValue" runat="server" ControlToValidate="txtMaturityValue"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Maturity Value" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Rate">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketRate" runat="server" Text='<%# Bind("Market_Rate") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMarketRate" runat="server" MaxLength="20" ToolTip="Market Rate"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Market_Rate") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvMarketRate" runat="server" ControlToValidate="txtMarketRate"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Market Rate" ValidationGroup="AddHighLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexMarketRate" runat="server" TargetControlID="txtMarketRate"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("Market_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMarketValue" runat="server" ContentEditable="false" ToolTip="Market Value"
                                                                                    MaxLength="20" onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Market_Value") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtxtMarketValue" runat="server" TargetControlID="txtMarketValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralRefNo" runat="server" Text='<%# Bind("Collateral_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCollateralRefNo" ContentEditable="false" ToolTip="Collateral Ref No"
                                                                                    runat="server" Text='<%# Bind("Collateral_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblScanRefNo" runat="server" Text='<%# Bind("Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtScanRefNo" runat="server" MaxLength="10" ToolTip="Scan Ref No"
                                                                                    Text='<%# Bind("Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexScanRefNo" runat="server" TargetControlID="txtScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Item Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblItemRefNo" runat="server" Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtItemRefNo" runat="server" ContentEditable="false" ToolTip="Item Ref No"
                                                                                    Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Tran Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblTranRefNo" runat="server" Text='<%# Bind("Collateral_Tran_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtTranRefNo" runat="server" ToolTip="Tran Ref No" ContentEditable="false"
                                                                                    Text='<%# Bind("Collateral_Tran_No") %>'></asp:TextBox>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtTranRefNo" runat="server" ToolTip="Tran Ref No" ContentEditable="false"
                                                                                    Text='<%# Bind("Collateral_Tran_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ToolTip="Update" CausesValidation="true" ValidationGroup="AddHighLiqSec"></asp:LinkButton>
                                                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                    ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit"
                                                                                    CausesValidation="false"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="AddNew" ToolTip="Add"
                                                                                    CausesValidation="true" ValidationGroup="AddHighLiqSec"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+V]" AccessKey="V"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:ValidationSummary ID="vgHighLIQSec" runat="server"
                                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):" Enabled="false" ShowSummary="false" />
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Medium Liquid Securities" ID="tabMedSeq"
                                    CssClass="tabpan" BackColor="Red" ToolTip="Medium Liquid Securities" Width="99%">
                                    <HeaderTemplate>
                                        Medium Liquid Securities
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="pnlMedLiqDetails" ScrollBars="Horizontal" CssClass="stylePanel"
                                                    GroupingText="Medium Liquid Security Details">
                                                    <asp:Label ID="lblMedLiqDetails" runat="server" Text="No Security Details are Available"
                                                        Visible="false" Font-Size="Large" Font-Bold="false" />
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlMCollSecurities" ToolTip="Collateral Securities" runat="server"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMCollSecurities" runat="server" ControlToValidate="ddlMCollSecurities"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities" CssClass="validation_msg_box_sapn"
                                                                        InitialValue="0" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMCollSecurities" runat="server" CssClass="styleReqFieldLabel" Text="Collateral Securities"></asp:Label>
                                                                    <asp:Label ID="lblMSlNo" runat="server" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblMMode" runat="server" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMDescription" TextMode="MultiLine" MaxLength="100" ToolTip="Description"
                                                                    onkeypress="trimStartingSpace(this)" onkeyup="maxlengthfortxt(100);" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <div class="validation_msg_box" style="top: 42px !important; text-align: right;">
                                                                    <asp:RequiredFieldValidator ID="rfvMDescription" runat="server" ControlToValidate="txtMDescription" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Description" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDescription" runat="server" CssClass="styleReqFieldLabel" Text="Description"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMModel" runat="server" MaxLength="4" ToolTip="Model"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexModel" runat="server" TargetControlID="txtMModel"
                                                                    FilterType="Custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMModel" runat="server" ControlToValidate="txtMModel" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Model" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>

                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMModel" runat="server" CssClass="styleReqFieldLabel" Text="Model"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMYear" runat="server" MaxLength="4" ToolTip="Year"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexMYear" runat="server" TargetControlID="txtMYear"
                                                                    FilterType="custom,Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMYear" runat="server" ControlToValidate="txtMYear" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Year" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>

                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMYear" runat="server" CssClass="styleReqFieldLabel" Text="Year"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMRegistrationNo" runat="server" ToolTip="Registration No" MaxLength="12"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexMRegistrationNo" runat="server" TargetControlID="txtMRegistrationNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="-/">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMRegistration" runat="server" ControlToValidate="txtMRegistrationNo" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Enter Registration No" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>

                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMRegistrationNo" CssClass="styleReqFieldLabel" runat="server" Text="Registration No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMSerialNo" runat="server" ToolTip="Serial No" MaxLength="12"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexSerialNo" runat="server" TargetControlID="txtMSerialNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="-/">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMSerialNo" runat="server" ControlToValidate="txtMSerialNo" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Enter Serial No" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>

                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMSerialNo" runat="server" CssClass="styleReqFieldLabel" Text="Serial No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMValue" runat="server" ToolTip="Value" MaxLength="12"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexMValue" runat="server" TargetControlID="txtMValue"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars="." />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMValue" runat="server" ControlToValidate="txtMValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Value" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>

                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMValue" runat="server" CssClass="styleReqFieldLabel" Text="Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMMarketValue" runat="server" MaxLength="12" ToolTip="Market Value"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexMMarketValue" runat="server" TargetControlID="txtMMarketValue"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars="." />
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMMarketValue" runat="server" ControlToValidate="txtMMarketValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Market Value" ValidationGroup="AddMediumLiqSec">
                                                                    </asp:RequiredFieldValidator>

                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMMarketValue" runat="server" CssClass="styleReqFieldLabel" Text="Market Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMCollateralRefNo" ReadOnly="true" ToolTip="Collateral Ref No"
                                                                    runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMCollateralRefNo" runat="server" CssClass="styleRegLabel" Text="Collateral Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMScanRefNo" MaxLength="10" ToolTip="Scan Ref No"
                                                                    runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexMScanRefNo" runat="server" TargetControlID="txtMScanRefNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMScanRefNo" runat="server" CssClass="styleRegLabel" Text="Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMItemRefNo" ReadOnly="true" runat="server" ToolTip="Item Ref No"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMItemRefNo" runat="server" CssClass="styleRegLabel" Text="Item Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMOwnership" MaxLength="3" runat="server" ToolTip="Ownership %"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMOwnership" runat="server" ControlToValidate="txtMOwnership" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Ownership %" ValidationGroup="AddMediumLiqSec"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FtexMOwnership" runat="server" TargetControlID="txtMOwnership"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblMOwnership" runat="server" CssClass="styleReqFieldLabel" Text="Ownership %"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMExpiryDate" runat="server" ToolTip="Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="caltxtMExpiryDate" runat="server" Enabled="True"
                                                                    PopupButtonID="Image1" TargetControlID="txtMExpiryDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label2" runat="server" CssClass="styleDisplayLabel" Text="Expiry Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div align="right">
                                                        <button class="css_btn_enabled" id="btnAddM" title="Add,Alt+A" onclick="if(fnConfirmAdd('btnAddM'))" validationgroup="AddMediumLiqSec" causesvalidation="true" onserverclick="btnAddM_Click" runat="server"
                                                            type="button" accesskey="A">
                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnModifyM" title="Edit,Alt+B" onclick="if(fnCheckPageValidators('btnModifyM'))" causesvalidation="false" onserverclick="btnModifyM_Click" runat="server"
                                                            type="button" accesskey="B">
                                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnClearM" title="Clear,Alt+T" causesvalidation="false" onserverclick="btnClearM_Click" runat="server"
                                                            type="button" accesskey="T">
                                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                                                        </button>
                                                        <%-- <input id="hdnBankId" runat="server" type="hidden"></input>--%>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvMMedLiqDetails" runat="server" AutoGenerateColumns="false" OnRowDeleting="gvMedLiqDetails_RowDeleting"
                                                                    OnRowDataBound="gvMedLiqDetails_RowDataBound" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblMode" runat="server" Text='<%# Bind("Mode") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:RadioButton ID="rdSelect" runat="server" Checked="false" OnCheckedChanged="rdMSelect_CheckedChanged"
                                                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="20px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSlNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="6%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Model" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblModel" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Year" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblYear" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Registration No" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRegistrationNo" runat="server" Text='<%# Bind("Registration_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Serial No" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("Serial_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Value" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("Market_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Ownership %" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMOwnership" runat="server" Text='<%# Bind("Ownership_Medium") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Expiry Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExpiryDate" runat="server" Text='<%# Bind("Expiry_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete" title="Delete[Alt+M]" AccessKey="M">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvMedLiqDetails" runat="server" AutoGenerateColumns="False" Visible="false"
                                                                    ShowFooter="True" OnRowCommand="gvMedLiqDetails_RowCommand" OnRowDeleting="gvMedLiqDetails_RowDeleting"
                                                                    OnRowCancelingEdit="gvMedLiqDetails_RowCancelingEdit" OnRowEditing="gvMedLiqDetails_RowEditing"
                                                                    OnRowUpdating="gvMedLiqDetails_RowUpdating" OnRowDataBound="gvMedLiqDetails_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSlNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlCollSecurities" runat="server" ToolTip="Collateral Securities">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvCollSecurities" runat="server" ControlToValidate="ddlCollSecurities"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Select Collateral Securities"
                                                                                    InitialValue="0" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle Width="20%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblDescription" TextMode="MultiLine" ContentEditable="false" runat="server"
                                                                                    Style="text-align: left" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" MaxLength="100" ToolTip="Description"
                                                                                    onkeyup="maxlengthfortxt(100);" onkeypress="trimStartingSpace(this)" runat="server"
                                                                                    Text='<%# Bind("Description") %>'>
                                                                                </asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Description" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Model">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblModel" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtModel" runat="server" MaxLength="4" ToolTip="Model" Text='<%# Bind("Model") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexModel" runat="server" TargetControlID="txtModel"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvModel" runat="server" ControlToValidate="txtModel"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Model" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Year">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblYear" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtYear" runat="server" MaxLength="4" ToolTip="Year" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    Text='<%# Bind("Year") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexYear" runat="server" TargetControlID="txtYear"
                                                                                    FilterType="custom,Numbers" Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvYear" runat="server" ControlToValidate="txtYear"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Year" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Registration No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRegistrationNo" runat="server" Text='<%# Bind("Registration_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtRegistrationNo" runat="server" ToolTip="Registration No" MaxLength="12"
                                                                                    Text='<%# Bind("Registration_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexRegistrationNo" runat="server" TargetControlID="txtRegistrationNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="-/" />
                                                                                <asp:RequiredFieldValidator ID="rfvRegistration" runat="server" ControlToValidate="txtRegistrationNo"
                                                                                    Display="None" ErrorMessage="Enter Registration No" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Serial No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Bind("Serial_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtSerialNo" runat="server" ToolTip="Serial No" MaxLength="12" Text='<%# Bind("Serial_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexSerialNo" runat="server" TargetControlID="txtSerialNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="-/">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvSerialNo" runat="server" ControlToValidate="txtSerialNo"
                                                                                    Display="None" ErrorMessage="Enter Serial No" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtValue" runat="server" MaxLength="12" ToolTip="Value" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    Text='<%# Bind("Value") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexValue" runat="server" TargetControlID="txtValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars="." />
                                                                                <asp:RequiredFieldValidator ID="rfvValue" runat="server" ControlToValidate="txtValue"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Value" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("Market_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMarketValue" runat="server" MaxLength="12" ToolTip="Market Value"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Market_Value") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexMarketValue" runat="server" TargetControlID="txtMarketValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars="." />
                                                                                <asp:RequiredFieldValidator ID="rfvMarketValue" runat="server" ControlToValidate="txtMarketValue"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Market Value" ValidationGroup="AddMediumLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralRefNo" runat="server" Text='<%# Bind("Collateral_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCollateralRefNo" ReadOnly="true" ToolTip="Collateral Ref No"
                                                                                    runat="server" Text='<%# Bind("Collateral_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblScanRefNo" runat="server" Text='<%# Bind("Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvScanRefNo" runat="server" ControlToValidate="txtScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Scan Ref No" ValidationGroup="AddMediumLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtScanRefNo" MaxLength="10" ToolTip="Scan Ref No" runat="server"
                                                                                    Text='<%# Bind("Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexScanRefNo" runat="server" TargetControlID="txtScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="" />
                                                                                <%-- <asp:RequiredFieldValidator ID="rfvScanRefNo" runat="server" ControlToValidate="txtScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Scan Ref No" ValidationGroup="AddMediumLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Item Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblItemRefNo" runat="server" Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtItemRefNo" ReadOnly="true" runat="server" ToolTip="Item Ref Nof"
                                                                                    Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:TextBox>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtItemRefNo" ReadOnly="true" runat="server" ToolTip="Item Ref Nof"
                                                                                    Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ToolTip="Update" CausesValidation="true" ValidationGroup="AddMediumLiqSec"></asp:LinkButton>
                                                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                    ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                                                    ToolTip="Edit"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="AddNew" CausesValidation="true"
                                                                                    ToolTip="Add" ValidationGroup="AddMediumLiqSec"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+V]" AccessKey="V"
                                                                                    ToolTip="Delete" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:ValidationSummary ID="vgMediumLIQSec" runat="server" Enabled="false" Visible="false"
                                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                                                        ShowSummary="true" />
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Low Liquid Securities" ID="tabLow" CssClass="tabpan"
                                    BackColor="Red" ToolTip="Low Liquid Securities" Width="99%">
                                    <HeaderTemplate>
                                        Low Liquid Securities
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="pnlLowLiqDetails" ScrollBars="Horizontal" CssClass="stylePanel"
                                                    GroupingText="Low Liquid Security Details">
                                                    <asp:Label ID="lblLowLiquidsecurites" runat="server" Text="No Security Details are Available"
                                                        Visible="false" Font-Size="Large" Font-Bold="false" />
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLCollSecurities" runat="server" ToolTip="Collateral Securities"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLCollSecurities" runat="server" ControlToValidate="ddlLCollSecurities"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities" CssClass="validation_msg_box_sapn"
                                                                        InitialValue="0" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLCollSecurities" runat="server" CssClass="styleReqFieldLabel" Text="Collateral Securities"></asp:Label>
                                                                    <asp:Label ID="lblLSlNo" runat="server" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblLMode" runat="server" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLLocationDetails" runat="server" ToolTip="Location Details" TextMode="MultiLine"
                                                                    MaxLength="60" onkeypress="trimStartingSpace(this)" onkeyup="maxlengthfortxt(60);"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <div></div>
                                                                <div class="validation_msg_box" style="top: 42px !important; text-align: right;">
                                                                    <asp:RequiredFieldValidator ID="rfvLLocationDetails" runat="server" ControlToValidate="txtLLocationDetails" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter the Location Details"
                                                                        ValidationGroup="AddLOWLiqSec">

                                                                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlLCollSecurities" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter the Location Details"
                                                                        InitialValue="0" ValidationGroup="AddLOWLiqSec">

                                                                    <asp:RequiredFieldValidator ID="rfvLLocationDetails" runat="server" ControlToValidate="txtLLocationDetails" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Location Details" ValidationGroup="AddLOWLiqSec">--%>

                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLLocationDetails" runat="server" CssClass="styleReqFieldLabel"
                                                                        Text="Location Details"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <%-- <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="TextBox1" runat="server" ToolTip="Location Details" TextMode="MultiLine"
                                                                    MaxLength="60" onkeypress="trimStartingSpace(this)" onkeyup="maxlengthfortxt(60);"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLLocationDetails" runat="server" ControlToValidate="txtLLocationDetails" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Location Details" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label1" runat="server" CssClass="styleReqFieldLabel"
                                                                        Text="Location 
                                                            Details"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>--%>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLMeasurement" runat="server" MaxLength="12" ToolTip="Measurement"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLMeasurement" runat="server" TargetControlID="txtLMeasurement"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLMeasurement" runat="server" ControlToValidate="txtLMeasurement" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Measurement" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLMeasurement" runat="server" CssClass="styleReqFieldLabel" Text="Measurement"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLUnitRate" runat="server" MaxLength="12" ToolTip="Unit Rate"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLUnitRate" runat="server" TargetControlID="txtLUnitRate"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLUnitRate" runat="server" ControlToValidate="txtLUnitRate" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter  Unit Rate" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLUnitRate" runat="server" CssClass="styleReqFieldLabel" Text="Unit Rate"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLValue" ReadOnly="false" ContentEditable="false" ToolTip="Value" Enabled="false"
                                                                    runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtLUnitRate"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLValue" runat="server" ControlToValidate="txtLValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Value" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLValue" runat="server" CssClass="styleReqFieldLabel" Text="Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLMarketValue" runat="server" MaxLength="12" ToolTip="Market Value"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLMarketValue" runat="server" TargetControlID="txtLMarketValue"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLMarketValue" runat="server" ControlToValidate="txtLMarketValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter  Market Value" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLMarketValue" runat="server" CssClass="styleReqFieldLabel" Text="Market Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLCollateralRefNo" ReadOnly="true" ToolTip="Coll Ref No" runat="server" Enabled="false"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtLMarketValue"
                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>--%>
                                                                <%--<div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLMarketValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Coll Ref No" ValidationGroup="AddLOWLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLCollateralRefNo" runat="server" CssClass="styleReqFieldLabel" Text="Coll Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLScanRefNo" runat="server" MaxLength="10" ToolTip="Scan Ref No"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLScanRefNo" runat="server" TargetControlID="txtLScanRefNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLScanRefNo" runat="server" CssClass="styleReqFieldLabel" Text="Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLLegalOpinion" runat="server" ToolTip="Legal Opinion"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLLegalOpinionDesc" runat="server" CssClass="styleReqFieldLabel" Text="Legal Opinion"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLLegalScanRefNo" runat="server" MaxLength="10"
                                                                    ToolTip="Legal Scan Ref No" class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLLegalScanRefNo" runat="server" TargetControlID="txtLLegalScanRefNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLLegalScanRefNo" runat="server" CssClass="styleReqFieldLabel" Text="Legal Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLEncumbrance" runat="server" ToolTip="Encumbrance"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLEncumbranceDesc" runat="server" CssClass="styleReqFieldLabel" Text="Encumbrance"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLEncumbranceScanRefNo" runat="server" MaxLength="10"
                                                                    ToolTip="Encumbrance Scan Ref No" class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLEncumbranceScanRefNo" runat="server" TargetControlID="txtLEncumbranceScanRefNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLEncumbranceScanRefNo" runat="server" CssClass="styleReqFieldLabel"
                                                                        Text="Encumbrance Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlLAssetDocument" runat="server" ToolTip="Asset Document"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLAssetDocumentDesc" runat="server" CssClass="styleReqFieldLabel" Text="Asset Document"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLAssetDocScanRefNo" runat="server" MaxLength="10"
                                                                    ToolTip="Asset Scan Ref No"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLAssetDocScanRefNo" runat="server" TargetControlID="txtLAssetDocScanRefNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLAssetDocScanRefNo" runat="server" CssClass="styleReqFieldLabel" Text="Asset Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:DropDownList ID="ddlLValuationCertificate" runat="server" ToolTip="Valuation Certificate"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLValuationCertificateDesc" runat="server" CssClass="styleReqFieldLabel"
                                                                        Text="Valuation Certificate"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtLValCertificationScanRefNo" MaxLength="10" ToolTip="Valuation Scan Ref No"
                                                                    runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLValCertificationScanRefNo" runat="server" TargetControlID="txtLValCertificationScanRefNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLValCertificationScanRefNo" runat="server" CssClass="styleReqFieldLabel"
                                                                        Text="Valuation Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtLItemRefNo" ReadOnly="true" ToolTip="Item Ref No" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLItemRefNo" runat="server" CssClass="styleReqFieldLabel" Text="Item Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtLOwnership" MaxLength="3" runat="server" ToolTip="Ownership %"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLOwnership" runat="server" ControlToValidate="txtLOwnership" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Ownership %" ValidationGroup="AddLOWLiqSec"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FtexLOwnership" runat="server" TargetControlID="txtLOwnership"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblLOwnership" runat="server" CssClass="styleReqFieldLabel" Text="Ownership %"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtLExpiryDate" runat="server" ToolTip="Expiry Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="caltxtLExpiryDate" runat="server" Enabled="True"
                                                                    PopupButtonID="Image1" TargetControlID="txtLExpiryDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label3" runat="server" CssClass="styleDisplayLabel" Text="Expiry Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>






























                                                    </div>
                                                    <div align="right">

                                                        <button class="css_btn_enabled" id="btnAddL" onclick="if(fnConfirmAdd('btnAddL'))" causesvalidation="true" onserverclick="btnAddL_Click" runat="server"
                                                            type="button" validationgroup="AddLOWLiqSec">
                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnModifyL" onclick="if(fnCheckPageValidators('btnModifyL'))" causesvalidation="false" onserverclick="btnModifyL_Click" runat="server"
                                                            type="button" title="Modify[Alt+Z]" accesskey="Z">
                                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnClearL" causesvalidation="false" onserverclick="btnClearL_Click" runat="server"
                                                            type="button" accesskey="Y" title="Clear[Alt+Y]">
                                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;Clea<u>r</u>
                                                        </button>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvLLowLiqDetails" runat="server" AutoGenerateColumns="false" OnRowDeleting="gvLowLiqDetails_RowDeleting"
                                                                    OnRowDataBound="gvLowLiqDetails_RowDataBound" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblMode" runat="server" Text='<%# Bind("Mode") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:RadioButton ID="rdSelect" runat="server" Checked="false" OnCheckedChanged="rdLSelect_CheckedChanged"
                                                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="20px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Location Details">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLocationDetails" runat="server" Text='<%# Bind("Location_Details") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Value" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("Market_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Legal Opinion">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLegalOpinion" runat="server" Visible="false" Text='<%# Bind("Legal_Opinion") %>'></asp:Label>
                                                                                <asp:Label ID="lblLegalOpinionDesc" runat="server" Text='<%# Bind("Legal_OpinionDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Encumbrance Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEncumbranceScanRefNo" runat="server" Text='<%# Bind("Encumbrance_Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Ownership %" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLOwnership" runat="server" Text='<%# Bind("Ownership_Low") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Expiry Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExpiryDate" runat="server" Text='<%# Bind("Expiry_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset Document">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetDocument" runat="server" Visible="false" Text='<%# Bind("Is_Asset_Document") %>'></asp:Label>
                                                                                <asp:Label ID="lblAssetDocumentDesc" runat="server" Text='<%# Bind("Is_Asset_DocumentDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+L]" AccessKey="L"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvLowLiqDetails" runat="server" Visible="false" AutoGenerateColumns="false"
                                                                    ShowFooter="true" OnRowCommand="gvLowLiqDetails_RowCommand" OnRowDeleting="gvLowLiqDetails_RowDeleting"
                                                                    OnRowCancelingEdit="gvLowLiqDetails_RowCancelingEdit" OnRowEditing="gvLowLiqDetails_RowEditing"
                                                                    OnRowUpdating="gvLowLiqDetails_RowUpdating" OnRowDataBound="gvLowLiqDetails_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlCollSecurities" runat="server" ToolTip="Collateral Securities">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvCollSecurities" runat="server" ControlToValidate="ddlCollSecurities"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Select Collateral Securities"
                                                                                    InitialValue="0" ValidationGroup="AddLOWLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Location Details">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblLocationDetails" TextMode="MultiLine" ContentEditable="False"
                                                                                    runat="server" Text='<%# Bind("Location_Details") %>'></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtLocationDetails" runat="server" ToolTip="Location Details" TextMode="MultiLine"
                                                                                    MaxLength="60" onkeypress="trimStartingSpace(this)" onkeyup="maxlengthfortxt(60);"
                                                                                    Text='<%# Bind("Location_Details") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvLocationDetails" runat="server" ControlToValidate="txtLocationDetails"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter Location Details" ValidationGroup="AddLOWLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Measurement">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMeasurement" runat="server" Text='<%# Bind("Measurement") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMeasurement" runat="server" MaxLength="12" ToolTip="Measurement"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Measurement") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexMeasurement" runat="server" TargetControlID="txtMeasurement"
                                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvMeasurement" runat="server" ControlToValidate="txtMeasurement"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter  Measurement" ValidationGroup="AddLOWLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Rate">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitRate" runat="server" Text='<%# Bind("Unit_Rate") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtUnitRate" runat="server" MaxLength="12" ToolTip="Unit Rate" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    Text='<%# Bind("Unit_Rate") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexUnitRate" runat="server" TargetControlID="txtUnitRate"
                                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvUnitRate" runat="server" ControlToValidate="txtUnitRate"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter  Unit Rate" ValidationGroup="AddLOWLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtValue" runat="server" ContentEditable="false" ToolTip="Value"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Value") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvValue" runat="server" ControlToValidate="txtValue"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter  Value" ValidationGroup="AddLOWLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Market Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMarketValue" runat="server" Text='<%# Bind("Market_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMarketValue" runat="server" MaxLength="12" ToolTip="Market Value"
                                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Text='<%# Bind("Market_Value") %>'>
                                                                                </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexMarketValue" runat="server" TargetControlID="txtMarketValue"
                                                                                    FilterType="Custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvMarketValue" runat="server" ControlToValidate="txtMarketValue"
                                                                                    Display="None" SetFocusOnError="true" ErrorMessage="Enter  Market Value" ValidationGroup="AddLOWLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Coll Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralRefNo" runat="server" Text='<%# Bind("Collateral_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCollateralRefNo" ReadOnly="true" ToolTip="Coll Ref No" runat="server"
                                                                                    Text='<%# Bind("Collateral_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblScanRefNo" runat="server" Text='<%# Bind("Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvScanRefNo" runat="server" ControlToValidate="txtScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter  Scan Ref No" ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtScanRefNo" runat="server" MaxLength="10" ToolTip="Scan Ref No"
                                                                                    Text='<%# Bind("Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexScanRefNo" runat="server" TargetControlID="txtScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%--<asp:RequiredFieldValidator ID="rfvScanRefNo" runat="server" ControlToValidate="txtScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Scan Ref No" ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Legal Opinion">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLegalOpinion" runat="server" Visible="false" Text='<%# Bind("Legal_Opinion") %>'></asp:Label>
                                                                                <asp:Label ID="lblLegalOpinionDesc" runat="server" Text='<%# Bind("Legal_OpinionDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlLegalOpinion" runat="server" Width="120px" ToolTip="Legal Opinion">
                                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Legal Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblLegalScanRefNo" runat="server" Text='<%# Bind("Legal_Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvLegalScanRefNo" runat="server" ControlToValidate="txtLegalScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Legal Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtLegalScanRefNo" runat="server" MaxLength="10" ToolTip="Legal Scan Ref No"
                                                                                    Text='<%# Bind("Legal_Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexLegalScanRefNo" runat="server" TargetControlID="txtLegalScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%--<asp:RequiredFieldValidator ID="rfvLegalScanRefNo" runat="server" ControlToValidate="txtLegalScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Legal Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Encumbrance">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEncumbrance" runat="server" Visible="false" Text='<%# Bind("Encumbrance") %>'></asp:Label>
                                                                                <asp:Label ID="lblEncumbranceDesc" runat="server" Text='<%# Bind("EncumbranceDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlEncumbrance" runat="server" Width="120px" ToolTip="Encumbrance">
                                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Encumbrance Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEncumbranceScanRefNo" runat="server" Text='<%# Bind("Encumbrance_Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvEncubranceScanRefNo" runat="server" ControlToValidate="txtEncumbranceScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Encumbrance Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtEncumbranceScanRefNo" runat="server" MaxLength="10" ToolTip="Encumbrance Scan Ref No"
                                                                                    Text='<%# Bind("Encumbrance_Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexEncumbranceScanRefNo" runat="server" TargetControlID="txtEncumbranceScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%--<asp:RequiredFieldValidator ID="rfvEncubranceScanRefNo" runat="server" ControlToValidate="txtEncumbranceScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Encumbrance Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset Document">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetDocument" runat="server" Visible="false" Text='<%# Bind("Is_Asset_Document") %>'></asp:Label>
                                                                                <asp:Label ID="lblAssetDocumentDesc" runat="server" Text='<%# Bind("Is_Asset_DocumentDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlAssetDocument" runat="server" Width="120px" ToolTip="Asset Document">
                                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetDocScanRefNo" runat="server" Text='<%# Bind("AssetDoc_Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvAssetScanRefNo" runat="server" ControlToValidate="txtAssetDocScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Asset Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtAssetDocScanRefNo" runat="server" MaxLength="10" ToolTip="Asset Scan Ref No"
                                                                                    Text='<%# Bind("AssetDoc_Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexAssetDocScanRefNo" runat="server" TargetControlID="txtAssetDocScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%--<asp:RequiredFieldValidator ID="rfvAssetScanRefNo" runat="server" ControlToValidate="txtAssetDocScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Asset Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Valuation Certificate">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValuationCertificate" runat="server" Visible="false" Text='<%# Bind("Is_Valuation_Certification") %>'></asp:Label>
                                                                                <asp:Label ID="lblValuationCertificateDesc" runat="server" Text='<%# Bind("Is_Valuation_CertificationDesc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlValuationCertificate" runat="server" Width="120px" ToolTip="Valuation Certificate">
                                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Valuation Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValCertificationScanRefNo" runat="server" Text='<%# Bind("ValCertification_Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvValCertificationScanRefNo" runat="server" ControlToValidate="txtValCertificationScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Valuation Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtValCertificationScanRefNo" MaxLength="10" ToolTip="Valuation Scan Ref No"
                                                                                    runat="server" Text='<%# Bind("ValCertification_Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexValCertificationScanRefNo" runat="server" TargetControlID="txtValCertificationScanRefNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%--<asp:RequiredFieldValidator ID="rfvValCertificationScanRefNo" runat="server" ControlToValidate="txtValCertificationScanRefNo"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Valuation Scan Ref No"
                                                            ValidationGroup="AddLOWLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Item Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblItemRefNo" runat="server" Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtItemRefNo" ReadOnly="true" ToolTip="Item Ref No" runat="server"
                                                                                    Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--  <asp:TemplateField HeaderText="Exclude" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkRelease" Checked='<%# GVBoolFormat(Eval("Is_Release").ToString()) %>'
                                                            runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ToolTip="Update" CausesValidation="true" ValidationGroup="AddLOWLiqSec"></asp:LinkButton>
                                                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                    ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                                                    ToolTip="Edit"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="AddNew" CausesValidation="true"
                                                                                    ToolTip="Add" ValidationGroup="AddLOWLiqSec"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+V]" AccessKey="V"
                                                                                    ToolTip="Delete" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:ValidationSummary ID="vgLowLIQSec" runat="server" Enabled="false" Visible="false"
                                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                                                        ShowSummary="true" />
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Commodities Securities" ID="tabCommodities"
                                    CssClass="tabpan" BackColor="Red" ToolTip="Commodities Securities" Width="99%">
                                    <HeaderTemplate>
                                        Commodities Securities
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="pnlCommodityDetails" ScrollBars="Horizontal" CssClass="stylePanel"
                                                    GroupingText="Commodity Details">
                                                    <asp:Label ID="lblCommSecurities" runat="server" Text="No Security Details are Available"
                                                        Visible="false" Font-Size="Large" Font-Bold="false" />
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCCollSecurities" runat="server" ToolTip="Collateral Securities"
                                                                    class="md-form-control form-control">
                                                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCCollSecurities" runat="server" ControlToValidate="ddlCCollSecurities"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities" CssClass="validation_msg_box_sapn"
                                                                        InitialValue="0" ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCCollSecurities" runat="server" CssClass="styleReqFieldLabel" Text="Collateral Securities"></asp:Label>
                                                                    <asp:Label ID="lblCSlNo" runat="server" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblCMode" runat="server" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCDescription" TextMode="MultiLine" ToolTip="Description" MaxLength="100"
                                                                    onkeypress="trimStartingSpace(this)" onkeyup="maxlengthfortxt(100);" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true">
                                                                </asp:TextBox>
                                                                <div class="validation_msg_box" style="top: 42px !important; text-align: right;">
                                                                    <asp:RequiredFieldValidator ID="rfvCDescription" runat="server" ControlToValidate="txtCDescription" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Description" ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCDescription" ToolTip="Description" CssClass="styleReqFieldLabel"
                                                                        runat="server" Text="Description"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCUnitOfMeasure" runat="server" ToolTip="Unit Of Measure"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCUnitOfMeasure" runat="server" ControlToValidate="ddlCUnitOfMeasure" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" InitialValue="0" ErrorMessage="Select Unit of Measure"
                                                                        ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCUnitOfMeasure" CssClass="styleReqFieldLabel" runat="server" Text="Unit Of Measure"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCUnitQty" MaxLength="5" runat="server" ToolTip="Unit Qty"
                                                                    onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexCUnitQty" runat="server" TargetControlID="txtCUnitQty"
                                                                    FilterType="custom,Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCUnitQty" runat="server" ControlToValidate="txtCUnitQty" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Unit Qty" ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCUnitQty" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Unit Qty can't be zero" ValidationGroup="AddCOMMODITIESLiqSec1" InitialValue="0">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCUnitQty" runat="server" CssClass="styleReqFieldLabel" Text="Unit Qty"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCUnitPrice" MaxLength="12" ToolTip="Unit Price"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexCUnitPrice" runat="server" TargetControlID="txtCUnitPrice"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCUnitPrice" runat="server" ControlToValidate="txtCUnitPrice" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Unit Price" ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCUnitPrice" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Unit Price can't be zero" ValidationGroup="AddCOMMODITIESLiqSec1" InitialValue="0">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCUnitPrice" runat="server" CssClass="styleReqFieldLabel" Text="Unit Price"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCValue" onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Value"
                                                                    runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtCUnitPrice"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCValue" runat="server" ControlToValidate="txtCValue" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Value"
                                                                        ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Value can't be zero" ValidationGroup="AddCOMMODITIESLiqSec1" InitialValue="0">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCValue" runat="server" CssClass="styleReqFieldLabel" Text="Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCUnitMarketPrice" MaxLength="12" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    ToolTip="Unit Market Price" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexCUnitMarketPrice" runat="server" TargetControlID="txtCUnitMarketPrice"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCUnitMarketPrice" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Enter Unit Market Price" ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                                    <asp:RequiredFieldValidator ID="frvtxtCUnitMarketPrice" runat="server" ControlToValidate="txtCUnitMarketPrice" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Enter Unit Market Price" ValidationGroup="AddCOMMODITIESLiqSec1">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCUnitMarketPrice" runat="server" CssClass="styleReqFieldLabel" Text="Unit Market Price"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCDate" runat="server" ToolTip="Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgCDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Select Date"
                                                                    Visible="false" />
                                                                <cc1:CalendarExtender ID="CEDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                    PopupButtonID="Image1" TargetControlID="txtCDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblDate" runat="server" CssClass="styleRegLabel" Text="Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCItemRefNo" ReadOnly="true" runat="server" ToolTip="Item Ref No"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCItemRefNo" runat="server" CssClass="styleRegLabel" Text="Item ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCOwnership" MaxLength="3" runat="server" ToolTip="Ownership %"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCOwnership" runat="server" ControlToValidate="txtCOwnership" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Ownership %" ValidationGroup="AddCOMMODITIESLiqSec1"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FtexCOwnership" runat="server" TargetControlID="txtCOwnership"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box" style="top: 28px !important;">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCOwnership" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" ErrorMessage="Ownership % can't be zero" ValidationGroup="AddCOMMODITIESLiqSec1" InitialValue="0">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblCOwnership" runat="server" CssClass="styleReqFieldLabel" Text="Ownership %"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtCExpiryDate" runat="server" ToolTip="Expiry Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="caltxtCExpiryDate" runat="server" Enabled="True"
                                                                    PopupButtonID="Image1" TargetControlID="txtCExpiryDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label4" runat="server" CssClass="styleDisplayLabel" Text="Expiry Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div align="right">
                                                        <button class="css_btn_enabled" id="btnAddC" onclick="if(fnConfirmAdd('btnAddC'))" causesvalidation="true" onserverclick="btnAddC_Click" runat="server"
                                                            type="button" validationgroup="AddCOMMODITIESLiqSec1">
                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnModifyC" onclick="if(fnCheckPageValidators('btnModifyC'))" accesskey="1" title="Modify,Alt+1" causesvalidation="true" onserverclick="btnModifyC_Click" runat="server"
                                                            type="button" validationgroup="AddCOMMODITIESLiqSec1">
                                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                        </button>

                                                        <button class="css_btn_enabled" id="btnClearC" causesvalidation="false" onserverclick="btnClearC_Click" runat="server"
                                                            type="button" accesskey="J" title="Clear,Alt+J">
                                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                                                        </button>
                                                        <%-- <input id="hdnBankId" runat="server" type="hidden"></input>--%>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvCCommoDetails" runat="server" AutoGenerateColumns="false" OnRowCommand="gvCommoDetails_RowCommand"
                                                                    OnRowDeleting="gvCommoDetails_RowDeleting" Width="100%" OnRowDataBound="gvCommoDetails_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:RadioButton ID="rdSelect" runat="server" Checked="false" OnCheckedChanged="rdCSelect_CheckedChanged"
                                                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                                <asp:Label ID="lblMode" runat="server" Visible="false" Text='<%# Bind("Mode") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="20px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDescription" ToolTip="Description" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Of Measure" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitOfMeasure" Visible="false" runat="server" Text='<%# Bind("Unit_Of_Measure") %>'></asp:Label>
                                                                                <asp:Label ID="lblUOMText" runat="server" Text='<%# Bind("UOM_Text") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Qty" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitQty" runat="server" Text='<%# Bind("Unit_Quantity") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Market Price" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitMarketPrice" runat="server" Text='<%# Bind("Unit_Market_Price") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Ownership %" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCOwnership" runat="server" Text='<%# Bind("Ownership_Comm") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Expiry Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCExpiryDate" runat="server" Text='<%# Bind("Expiry_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+R]" AccessKey="R"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvCommoDetails" runat="server" Visible="false" AutoGenerateColumns="false"
                                                                    ShowFooter="true" OnRowCommand="gvCommoDetails_RowCommand" OnRowDeleting="gvCommoDetails_RowDeleting"
                                                                    OnRowCancelingEdit="gvCommoDetails_RowCancelingEdit" OnRowEditing="gvCommoDetails_RowEditing"
                                                                    OnRowUpdating="gvCommoDetails_RowUpdating" OnRowDataBound="gvCommoDetails_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlCollSecurities" runat="server" ToolTip="Collateral Securities">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvCollSecurities" runat="server" ControlToValidate="ddlCollSecurities"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities"
                                                                                    InitialValue="0" ValidationGroup="AddCOMMODITIESLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblDescription" TextMode="MultiLine" ToolTip="Description" ContentEditable="False"
                                                                                    runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDescription" TextMode="MultiLine" MaxLength="100" onkeypress="trimStartingSpace(this)"
                                                                                    onkeyup="maxlengthfortxt(100);" runat="server" Text='<%# Bind("Description") %>'>
                                                                                </asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Description" ValidationGroup="AddCOMMODITIESLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Of Measure">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitOfMeasure" Visible="false" runat="server" Text='<%# Bind("Unit_Of_Measure") %>'></asp:Label>
                                                                                <asp:Label ID="lblUOMText" runat="server" Text='<%# Bind("UOM_Text") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlUnitOfMeasure" runat="server" Width="90px" ToolTip="Unit Of Measure">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvUnitOfMeasure" runat="server" ControlToValidate="ddlUnitOfMeasure" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" InitialValue="0" ErrorMessage="Select Unit of Measure"
                                                                                    ValidationGroup="AddCOMMODITIESLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Qty">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitQty" runat="server" Text='<%# Bind("Unit_Quantity") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtUnitQty" runat="server" MaxLength="5" ToolTip="Unit Qty" onkeypress="fnAllowNumbersOnly(false,false,this)"
                                                                                    Text='<%# Bind("Unit_Quantity") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexUnitQty" runat="server" TargetControlID="txtUnitQty"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvUnitQty" runat="server" ControlToValidate="txtUnitQty" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Unit Qty" ValidationGroup="AddCOMMODITIESLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Price">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Bind("Unit_Price") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtUnitPrice" MaxLength="12" ToolTip="Unit Price" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    runat="server" Text='<%# Bind("Unit_Price") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexUnitPrice" runat="server" TargetControlID="txtUnitPrice"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" ControlToValidate="txtUnitPrice" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Unit Price" ValidationGroup="AddCOMMODITIESLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtValue" ContentEditable="false" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    ToolTip="Value" runat="server" Text='<%# Bind("Value") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvValue" runat="server" ControlToValidate="txtValue" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Value" ValidationGroup="AddCOMMODITIESLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Unit Market Price">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblUnitMarketPrice" runat="server" Text='<%# Bind("Unit_Market_Price") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvUnitMarketPrice" runat="server" ControlToValidate="txtUnitMarketPrice"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Unit Market Price"
                                                            ValidationGroup="AddCOMMODITIESLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtUnitMarketPrice" MaxLength="12" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    ToolTip="Unit Market Price" runat="server" Text='<%# Bind("Unit_Market_Price") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexUnitMarketPrice" runat="server" TargetControlID="txtUnitMarketPrice"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>

                                                                                <%--<asp:RequiredFieldValidator ID="rfvUnitMarketPrice" runat="server" ControlToValidate="txtUnitMarketPrice"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Unit Market Price"
                                                            ValidationGroup="AddCOMMODITIESLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%-- <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Date" ValidationGroup="AddCOMMODITIESLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDate" ContentEditable="false" runat="server" Text='<%# Bind("Date") %>'
                                                                                    ToolTip="Date"></asp:TextBox>
                                                                                <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Select Date"
                                                                                    Visible="false" />
                                                                                <cc1:CalendarExtender ID="CEDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                                    PopupButtonID="Image1" TargetControlID="txtDate">
                                                                                </cc1:CalendarExtender>
                                                                                <%-- <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Date" ValidationGroup="AddCOMMODITIESLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Item Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblItemRefNo" runat="server" Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtItemRefNo" ReadOnly="true" runat="server" ToolTip="Item Ref No"
                                                                                    Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--<asp:TemplateField HeaderText="Exclude" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkRelease" Checked='<%# GVBoolFormat(Eval("Is_Release").ToString()) %>'
                                                            runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ToolTip="Update" CausesValidation="true" ValidationGroup="AddCOMMODITIESLiqSec"></asp:LinkButton>
                                                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                    ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                                                    ToolTip="Edit"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="AddNew" CausesValidation="true"
                                                                                    ToolTip="Add" ValidationGroup="AddCOMMODITIESLiqSec"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+V]" AccessKey="V"
                                                                                    ToolTip="Delete" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:ValidationSummary ID="vgCommoditiesLIQSec" runat="server"
                                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):" Enabled="false" Visible="false"
                                                        ShowSummary="true" />
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" HeaderText="Financial Securities" ID="tabFinancial"
                                    CssClass="tabpan" BackColor="Red" ToolTip="Financial Securities" Width="99%">
                                    <HeaderTemplate>
                                        Financial Securities
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="pnlFinDetails" ScrollBars="Horizontal" CssClass="stylePanel"
                                                    GroupingText="Financial Investment Details">
                                                    <%--<table style>
                                            <tr align="center">
                                                <td align="center">--%>
                                                    <asp:Label ID="lblFinSecurities" runat="server" Text="No Security Details are Available"
                                                        Visible="false" Font-Size="Large" Font-Bold="false" />
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFCollSecurities" runat="server" ToolTip="Collateral Securities"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFCollSecurities" runat="server" ControlToValidate="ddlFCollSecurities" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities"
                                                                        InitialValue="0" ValidationGroup="AddFINANCIALLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFCollSecurities" runat="server" CssClass="styleReqFieldLabel" Text="Collateral Securities"></asp:Label>
                                                                    <asp:Label ID="lblFSlNo" runat="server" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblFMode" runat="server" Visible="false"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFInsuranceIssuedBy" MaxLength="20" ToolTip="Insurance Issued By"
                                                                    onkeypress="trimStartingSpace(this)" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFInsuranceIssuedBy" runat="server" ControlToValidate="txtFInsuranceIssuedBy"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Insurance Issued By" CssClass="validation_msg_box_sapn"
                                                                        ValidationGroup="AddFINANCIALLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FtexFInsuranceIssuedBy" runat="server" TargetControlID="txtFInsuranceIssuedBy"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars=" ">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFInsuranceIssuedBy" runat="server" CssClass="styleReqFieldLabel"
                                                                        Text="Insurance Issued By"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFPolicyNo" runat="server" MaxLength="20" ToolTip="Policy No"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexFPolicyNo" runat="server" TargetControlID="txtFPolicyNo"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFPolicyNo" runat="server" ControlToValidate="txtFPolicyNo" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Policy No" ValidationGroup="AddFINANCIALLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFPolicyNo" runat="server" CssClass="styleReqFieldLabel" Text="Policy No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFPolicyValue" MaxLength="12" ToolTip="Policy Value"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexFPolicyValue" runat="server" TargetControlID="txtFPolicyValue"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFPolicyValue" runat="server" ControlToValidate="txtFPolicyValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Policy Value" ValidationGroup="AddFINANCIALLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFPolicyValue" runat="server" CssClass="styleReqFieldLabel" Text="Policy Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFCurrentValue" MaxLength="12" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    ToolTip="Current Value" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexFCurrentValue" runat="server" TargetControlID="txtFCurrentValue"
                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFCurrentValue" runat="server" ControlToValidate="txtFCurrentValue" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Current Value" ValidationGroup="AddFINANCIALLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFCurrentValue" runat="server" CssClass="styleReqFieldLabel" Text="Current Value"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFMaturityDate" ToolTip="Maturity Date" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <asp:Image ID="imgFMaturityDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                    ToolTip="Select Maturity Date" Visible="false" />
                                                                <cc1:CalendarExtender ID="CEFMaturityDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="Image1"
                                                                    TargetControlID="txtFMaturityDate">
                                                                </cc1:CalendarExtender>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFMaturityDate" runat="server" ControlToValidate="txtFMaturityDate" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Maturity Date" ValidationGroup="AddFINANCIALLiqSec">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFMaturityDate" runat="server" CssClass="styleReqFieldLabel" Text="Maturity Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFCollateralRef" ReadOnly="true" ToolTip="Collateral Ref" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFCollateralRef" runat="server" CssClass="styleRegLabel" Text="Collateral Ref"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFItemRefNo" ReadOnly="true" ToolTip="Item Ref No" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>


                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFItemRefNo" runat="server" CssClass="styleRegLabel" Text="Item Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFScanRef" runat="server" ToolTip="Scan Ref No" MaxLength="10"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FtexScanRef" runat="server" TargetControlID="txtFScanRef"
                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                    ValidChars="">
                                                                </cc1:FilteredTextBoxExtender>

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFScanRefNo" runat="server" CssClass="styleRegLabel" Text="Scan Ref No"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFOwnership" MaxLength="3" runat="server" ToolTip="Ownership %"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFOwnership" runat="server" ControlToValidate="txtFOwnership" CssClass="validation_msg_box_sapn"
                                                                        Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Ownership %" ValidationGroup="AddFINANCIALLiqSec"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <cc1:FilteredTextBoxExtender ID="FtexFOwnership" runat="server" TargetControlID="txtFOwnership"
                                                                    FilterType="Custom, Numbers" Enabled="True" ValidChars=".">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblFOwnership" runat="server" CssClass="styleReqFieldLabel" Text="Ownership %"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFExpiryDate" runat="server" ToolTip="Expiry Date"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="caltxtFExpiryDate" runat="server" Enabled="True"
                                                                    PopupButtonID="Image1" TargetControlID="txtFExpiryDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="Label5" runat="server" CssClass="styleDisplayLabel" Text="Expiry Date"></asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div align="right">

                                                        <button class="css_btn_enabled" id="btnAddF" onclick="if(fnConfirmAdd('btnAddF'))" causesvalidation="true" onserverclick="btnAddF_Click" runat="server"
                                                            type="button" validationgroup="AddFINANCIALLiqSec" accesskey="0" title="Add,Alt+0">
                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnModifyF" onclick="if(fnCheckPageValidators('btnModifyF'))" accesskey="2" title="Modify,Alt+2" causesvalidation="false" onserverclick="btnModifyF_Click" runat="server"
                                                            type="button">
                                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                        </button>
                                                        <button class="css_btn_enabled" id="btnClearF" causesvalidation="false" onserverclick="btnClearF_Click" runat="server"
                                                            type="button" accesskey="K" title="Clear,Alt+K">
                                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                                                        </button>
                                                        <%-- <input id="hdnBankId" runat="server" type="hidden"></input>--%>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvFFinDetails" runat="server" AutoGenerateColumns="false" OnRowDeleting="gvFinDetails_RowDeleting" EmptyDataText="No Records Found" class="gird_details"
                                                                    OnRowDataBound="gvFinDetails_RowDataBound" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblMode" runat="server" Visible="false" Text='<%# Bind("Mode") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:RadioButton ID="rdSelect" runat="server" Checked="false" OnCheckedChanged="rdFSelect_CheckedChanged"
                                                                                    AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="20px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" Visible="true" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Policy No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Bind("Policy_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Policy Value" ItemStyle-HorizontalAlign="Right">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPolicyValue" runat="server" Text='<%# Bind("Policy_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Bind("Maturity_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Ownership %">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblFOwnership" runat="server" Text='<%# Bind("Ownership_Fin") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Expiry Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExpiryDate" runat="server" Text='<%# Bind("Expiry_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+Z]" AccessKey="Z"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="gird">
                                                                <asp:GridView ID="gvFinDetails" runat="server" Visible="false" AutoGenerateColumns="false"
                                                                    ShowFooter="true" OnRowCommand="gvFinDetails_RowCommand" OnRowDeleting="gvFinDetails_RowDeleting"
                                                                    OnRowCancelingEdit="gvFinDetails_RowCancelingEdit" OnRowEditing="gvFinDetails_RowEditing"
                                                                    OnRowUpdating="gvFinDetails_RowUpdating" OnRowDataBound="gvFinDetails_RowDataBound">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Collateral Type ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralTypeID" runat="server" Text='<%# Bind("Collateral_Type_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No" Visible="true">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Securities">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollDetailID" runat="server" Visible="false" Text='<%# Bind("Collateral_Detail_ID") %>'></asp:Label>
                                                                                <asp:Label ID="lblCollSecurities" runat="server" Text='<%# Bind("Collateral_Securities") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlCollSecurities" runat="server" ToolTip="Collateral Securities">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvCollSecurities" runat="server" ControlToValidate="ddlCollSecurities"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Select Collateral Securities"
                                                                                    InitialValue="0" ValidationGroup="AddFINANCIALLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Insurance Issued By">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInsuranceIssuedBy" runat="server" Text='<%# Bind("Insurance_Issued_By") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtInsuranceIssuedBy" MaxLength="20" ToolTip="Insurance Issued By"
                                                                                    onkeypress="trimStartingSpace(this)" runat="server" Text='<%# Bind("Insurance_Issued_By") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvInsuranceIssuedBy" runat="server" ControlToValidate="txtInsuranceIssuedBy"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Insurance Issued By" CssClass="validation_msg_box_sapn"
                                                                                    ValidationGroup="AddFINANCIALLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexInsuranceIssuedBy" runat="server" TargetControlID="txtInsuranceIssuedBy"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="./-()">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Policy No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Bind("Policy_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtPolicyNo" runat="server" MaxLength="20" ToolTip="Policy No" Text='<%# Bind("Policy_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexPolicyNo" runat="server" TargetControlID="txtPolicyNo"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvPolicyNo" runat="server" ControlToValidate="txtPolicyNo" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Policy No" ValidationGroup="AddFINANCIALLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Policy Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPolicyValue" runat="server" Text='<%# Bind("Policy_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtPolicyValue" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    ToolTip="Policy Value" runat="server" Text='<%# Bind("Policy_Value") %>' MaxLength="12"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexPolicyValue" runat="server" TargetControlID="txtPolicyValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvPolicyValue" runat="server" ControlToValidate="txtPolicyValue" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Policy Value" ValidationGroup="AddFINANCIALLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Current Value">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCurrentValue" runat="server" Text='<%# Bind("Current_Value") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCurrentValue" MaxLength="12" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    ToolTip="Current Value" runat="server" Text='<%# Bind("Current_Value") %>'></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvCurrentValue" runat="server" ControlToValidate="txtCurrentValue" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Current Value" ValidationGroup="AddFINANCIALLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexCurrentValue" runat="server" TargetControlID="txtCurrentValue"
                                                                                    FilterType="custom,Numbers" Enabled="True" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Maturity Date">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMaturityDate" runat="server" Text='<%# Bind("Maturity_Date") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtMaturityDate" ContentEditable="false" ToolTip="Maturity Date"
                                                                                    runat="server" Text='<%# Bind("Maturity_Date") %>'></asp:TextBox>
                                                                                <asp:Image ID="imgMaturityDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                                                    ToolTip="Select Maturity Date" Visible="false" />
                                                                                <cc1:CalendarExtender ID="CEMaturityDate" runat="server" Enabled="True" Format="dd/MM/yyyy"
                                                                                    OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="Image1"
                                                                                    TargetControlID="txtMaturityDate">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:RequiredFieldValidator ID="rfvMaturityDate" runat="server" ControlToValidate="txtMaturityDate" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="true" ErrorMessage="Enter Maturity Date" ValidationGroup="AddFINANCIALLiqSec">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Collateral Ref">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCollateralRef" runat="server" Text='<%# Bind("Collateral_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCollateralRef" ReadOnly="true" ToolTip="Collateral Ref" runat="server"
                                                                                    Text='<%# Bind("Collateral_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Scan Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblScanRef" runat="server" Text='<%# Bind("Scan_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <EditItemTemplate>
                                                                                <asp:TextBox ID="txtScanRef" runat="server" ToolTip="Scan Ref No" MaxLength="10"
                                                                                    Text='<%# Bind("Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexScanRef" runat="server" TargetControlID="txtScanRef"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <%-- <asp:RequiredFieldValidator ID="rfvScanRef" runat="server" ControlToValidate="txtScanRef"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Scan Ref No" ValidationGroup="AddFINANCIALLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </EditItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtScanRef" runat="server" ToolTip="Scan Ref No" MaxLength="10"
                                                                                    Text='<%# Bind("Scan_Ref_No") %>'></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="FtexScanRef" runat="server" TargetControlID="txtScanRef"
                                                                                    FilterType="custom,Numbers,LowercaseLetters,UppercaseLetters" Enabled="True"
                                                                                    ValidChars="" />
                                                                                <%-- <asp:RequiredFieldValidator ID="rfvScanRef" runat="server" ControlToValidate="txtScanRef"
                                                            Display="None" SetFocusOnError="true" ErrorMessage="Enter Scan Ref No" ValidationGroup="AddFINANCIALLiqSec">
                                                        </asp:RequiredFieldValidator>--%>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Item Ref No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblItemRefNo" runat="server" Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtItemRefNo" ReadOnly="true" ToolTip="Item Ref No" runat="server"
                                                                                    Text='<%# Bind("Collateral_Item_Ref_No") %>'></asp:TextBox>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--<asp:TemplateField HeaderText="Exclude" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkRelease" Checked='<%# GVBoolFormat(Eval("Is_Release").ToString()) %>'
                                                            runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <EditItemTemplate>
                                                                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                                    ToolTip="Update" CausesValidation="true" ValidationGroup="AddFINANCIALLiqSec"></asp:LinkButton>
                                                                                <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                    ToolTip="Cancel" CausesValidation="false"></asp:LinkButton>
                                                                            </EditItemTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit"
                                                                                    CausesValidation="false"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:LinkButton ID="btnAdd" runat="server" Text="Add" CommandName="AddNew" CausesValidation="true"
                                                                                    ToolTip="Add" ValidationGroup="AddFINANCIALLiqSec"></asp:LinkButton>
                                                                            </FooterTemplate>
                                                                            <ItemStyle Width="15%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" title="Delete[Alt+V]" AccessKey="V"
                                                                                    ToolTip="Delete" CausesValidation="false" CssClass="grid_btn_delete"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="10%" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:ValidationSummary ID="vgFinancialLIQSec" runat="server" Enabled="false" Visible="false"
                                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                                                        ShowSummary="true" />
                                                    <%--</table>--%>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>


                            </cc1:TabContainer>
                            <%-- For Customer Control --%>
                        </div>

                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" causesvalidation="true" title="Save the Details[Alt+S]" validationgroup="Submit">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                        </button>
                    </div>
                    <%-- <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vgSubmit" runat="server" ValidationGroup="Submit" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Go"
                                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                                ShowSummary="true" />
                            <asp:CustomValidator ID="cvCollateralCapture" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" Width="98%" />
                        </div>
                    </div>--%>
                    <div align="right">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Button runat="server" ID="Button2" CssClass="styleSubmitButton" Text="Ok" Style="display: none"
                                    OnClick="Button2_Click" />
                                <asp:Button runat="server" ID="Button1" CssClass="styleSubmitButton" Text="Ok" Style="display: none" />
                                <cc1:ModalPopupExtender ID="MPE" runat="server" TargetControlID="Button1" PopupControlID="pnlDeletePopUp"
                                    BackgroundCssClass="styleModalBackground" />
                            </div>
                        </div>
                    </div>




                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="pnlDeletePopUp" GroupingText="" Width="600px" runat="server" Style="display: none"
        BackColor="White" BorderStyle="Solid">
        <asp:UpdatePanel ID="UpDeletePopUp" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <%--                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input stylePageHeading">
                                                <asp:Label runat="server" Text="Confirmation Box" ID="lblFollowUp" CssClass="styleDisplayLabel"></asp:Label>
                                            </div>
                                        </div>--%>

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <label>
                        <asp:Label ID="lblExcludeDate" runat="server" Text="Exclude Date"></asp:Label>
                    </label>
                    <div class="md-input">


                        <asp:TextBox ID="txtExcludeDate" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                        <%-- <asp:HiddenField runat="server" ID="hdnView" />--%>
                    </div>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <label>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </label>
                    <div class="md-input">
                        <asp:TextBox ID="txtPassword" MaxLength="100"
                            TextMode="Password" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                    </div>

                </div>

                <div align="right">

                    <button class="css_btn_enabled" id="btnOK" title="Ok[Alt+O]" onserverclick="btnOK_Click"
                        causesvalidation="false" runat="server"
                        type="button" accesskey="O">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>O</u>k
                    </button>
                    <%--<asp:Button runat="server" ID="btnOK" ValidationGroup="vgOK" CssClass="css_btn_enabled"
                                                Text="Ok" OnClick="btnOK_Click" AccessKey="O" />--%>
                                            &nbsp;
                                            <button class="css_btn_enabled" id="btnCan" title="Cancel[Alt+N]"
                                                causesvalidation="false" onserverclick="btnCan_Click" runat="server"
                                                type="button" accesskey="N">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                                            </button>
                    <%--<asp:Button runat="server" ID="btnCan" CssClass="css_btn_enabled" Text="Cancel" AccessKey="N"
                                                OnClick="btnCan_Click" />--%>
                </div>
                <tr class="styleButtonArea">
                    <td colspan="2">
                        <asp:ValidationSummary runat="server" ID="vsOK" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" Width="400px" ShowMessageBox="false" ShowSummary="true" Enabled="false"
                            ValidationGroup="vgOK" />
                        <asp:CustomValidator ID="cvOK" runat="server" CssClass="styleMandatoryLabel" Enabled="false"
                            Width="98%"></asp:CustomValidator>
                    </td>
                </tr>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnOK" />
                <asp:PostBackTrigger ControlID="btnCan" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <%--<ajax:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" EnableHistory="False" EnableSecureHistoryState="True" />--%>
</asp:Content>
