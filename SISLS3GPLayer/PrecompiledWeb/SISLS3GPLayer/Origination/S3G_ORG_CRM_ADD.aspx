<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Origination_S3G_ORG_CRM_ADD, App_Web_midi1nyg" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx" TagName="CustomerDetails"
    TagPrefix="CD" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GDynamicLOV.ascx" TagName="FLOV" TagPrefix="uc" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />
    <%--<script src="../Scripts/JQuery-1.9.2/js/jquery-1.8.3.js"></script>--%>

    <script type="text/javascript" language="javascript">

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(initializeRequest);
        prm.add_endRequest(endRequest);
        var postbackElement;

        function initializeRequest(sender, args) {
            document.body.style.cursor = "wait";
            if (prm.get_isInAsyncPostBack()) {
                //debugger
                args.set_cancel(true);
            }
        }
        function endRequest(sender, args) {
            document.body.style.cursor = "default";
        }
        var tab;
        function pageLoad() {

            document.getElementById('ctl00_ContentPlaceHolder1_tcCRM_body').className = "";
            //tab = $find('ctl00_ContentPlaceHolder1_tcCRM');
            //tab.add_activeTabChanged(on_Change);
        }

        var index = 0;
        function on_Change(sender, e) {
            //debugger;
            var newindex = tab.get_activeTabIndex(index);
            if (newindex < 5) {
                fnSetAccordian(newindex + 1);
                //document.getElementById('ctl00_ContentPlaceHolder1_pnlLeadView').style.display = 'Block';
                //fnShowPopup('pnlLeadView');
                //document.getElementById('<%= btnLeadOk.ClientID %>').click();
            }
            else {
                document.getElementById('<%= btnLeadView.ClientID %>').click();
            }


            var strtabName = tab._tabs[newindex]._tab.outerText.trim();
            document.getElementById('<%= lblCRMDetail.ClientID %>').innerText = strtabName;
        }

        function fnLoadCustomer() {
            if (document.getElementById('<%= ddlType.ClientID %>').value == "0") {
                alert("Select at least one query type");
                document.getElementById('<%= ddlType.ClientID %>').focus();
                return false;
            }
            document.getElementById('<%= btnLoadCustomer.ClientID %>').click();

        }

        function fnSearchFocus() {
            if (document.getElementById('<%= ddlType.ClientID %>').value == "0") {
                alert("Select at least one query type");
                document.getElementById('<%= ddlType.ClientID %>').focus();
                return false;
            }
            return true;

        }

        function fnSetAccordian(numHeader) {
            if (document.getElementById('ctl00_ContentPlaceHolder1_hdnTab' + numHeader).value == "0") {
                document.getElementById('accHeader' + numHeader).click();
                for (var i = 1; i <= 6; i++) {
                    document.getElementById('ctl00_ContentPlaceHolder1_hdnTab' + i).value = "0";
                }
                //obj.className = "accordionHeader";
                document.getElementById('ctl00_ContentPlaceHolder1_hdnTab' + numHeader).value = "1";
            }
        }

        function fnResetAccordianIndex() {
            for (var i = 1; i <= 6; i++) {
                if (document.getElementById('ctl00_ContentPlaceHolder1_hdnTab' + i).value == "1") {
                    //document.getElementById('tdTab' + i).className = "accordionHeader";
                }
            }
        }

        function funUpValidate() {
            if (document.getElementById('<%= ddlType.ClientID %>') != null && document.getElementById('<%= ddlType.ClientID %>').value == "0") {
                alert("Select at least one query type");
                document.getElementById('<%= ddlType.ClientID %>').focus();
                return false;
            }
            if (document.getElementById('<%= hidCustomerId.ClientID %>').innerText == "") {
                alert("Select the search description");
                return false;
            }
            return true;
        }

        function Branch_ItemSelected(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = e.get_value();
        }
        function Branch_ItemPopulated(sender, e) {
            var hdnBranchID = $get('<%= hdnBranchID.ClientID %>');
            hdnBranchID.value = '';
        }

        function SalesPerson_ItemSelected(sender, e) {
            var hdnSalesPersonID = $get('<%= hdnSalesPersonID.ClientID %>');
            hdnSalesPersonID.value = e.get_value();
        }
        function SalesPerson_ItemPopulated(sender, e) {
            var hdnSalesPersonID = $get('<%= hdnSalesPersonID.ClientID %>');
            hdnSalesPersonID.value = '';
        }

        function fnShowPopup(panel) {
            if (document.getElementById('ctl00_ContentPlaceHolder1_' + panel).style.display == 'block') {
                document.getElementById('ctl00_ContentPlaceHolder1_' + panel).style.display = 'none';
            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_' + panel).style.display = 'Block';
            }
        }


        function fnSetProspectName(obj1, obj2) {
            document.getElementById(obj2).value = document.getElementById(obj1).value;
        }


        function uploadComplete(sender, args) {
            var objID = sender._inputFile.id.split("_");
            var obj = args._fileName.split("\\");
            objID = "<%= gvPRDDT.ClientID %>" + "_" + objID[5];
            if (document.getElementById(objID + "_myThrobber") != null) {
                document.getElementById(objID + "_myThrobber").innerText = args._fileName;
                document.getElementById(objID + "_hidThrobber").value = args._fileName;

                if (obj[obj.length - 1].length > 80) {
                    alert("File Name can't exceed more than 80 characters");
                    document.getElementById(objID + "_myThrobber").innerText = "";
                    document.getElementById(objID + "_hidThrobber").value = "";
                    return false;
                }
            }
        }

        function FunShowPath(input) {
            if (input != null) {
                var objID = input.id;
                var myThrobber = document.getElementById((input.id).replace('asyFileUpload', 'myThrobber'));
                if (myThrobber != null) {
                    if (myThrobber.innerText != "")
                        input.setAttribute('title', myThrobber.innerText);
                }
            }
        }

        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }

        function fnClearProspect()  //Clear Prospect Details
        {
            document.getElementById('<%= ddlTitle.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlCustomerType.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlCompanyType.ClientID %>').selectedIndex = 0;
            //document.getElementById('<%= ddlPostingGLCode.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlIndustry.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlConstitutionName.ClientID %>').selectedIndex = 0;

            document.getElementById('<%= txtProspectName.ClientID %>').value = "";
            document.getElementById('<%= txtComAddress1.ClientID %>').value = "";
            document.getElementById('<%= txtCOmAddress2.ClientID %>').value = "";
            document.getElementById('<%= txtComPincode.ClientID %>').value = "";
            document.getElementById('<%= txtComTelephone.ClientID %>').value = "";
            document.getElementById('<%= txtComMobile.ClientID %>').value = "";
            document.getElementById('<%= txtComEmail.ClientID %>').value = "";
            document.getElementById('<%= txtComWebsite.ClientID %>').value = "";
            document.getElementById('<%= txtCntPer.ClientID %>').value = "";
            document.getElementById('<%= txtCntPerDesig.ClientID %>').value = "";
            document.getElementById('<%= txtCntPerPh.ClientID %>').value = "";

            document.getElementById('<%= txtComCity.ClientID %>_TextBox').value = "";
            document.getElementById('<%= txtComCountry.ClientID %>_TextBox').value = "";
            document.getElementById('<%= txtComState.ClientID %>_TextBox').value = "";

        }

        function fnCloseDiv() {
            document.getElementById('<%=divShow.ClientID%>').style.display = "none";
        }

    </script>

    <style type="text/css">
        .ajax__calendar {
            z-index: 10002 !important;
        }

        .modal {
            width: 700px;
            position: absolute;
            top: 30%;
            left: 20%;
            z-index: 1020;
            background-color: #FFF;
            border-radius: 6px;
            border: 5px solid #F2F2F2;
            display: none;
            height: 300px;
            overflow-y: scroll;
            overflow-x: auto;
        }
    </style>


    <table width="100%" align="center" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td class="stylePageHeading" colspan="4">
                <table>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Follow Up Instructions" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td valign="top">
                        <table width="100%">
                            <tr style="display: none">
                                <td class="styleFieldLabel">
                                    <asp:Label runat="server" Text="FollowUp No" ID="lblFollowUpNo" CssClass="styleDisplayLabel"></asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:TextBox ID="txtFollowUpNo" runat="server" Width="150px" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr id="trHead" runat="server">
                                <td class="styleFieldLabel">
                                    <asp:UpdatePanel ID="updProspect" runat="server">
                                        <ContentTemplate>
                                            <asp:Label runat="server" Text="Search Type" ID="lblType" CssClass="styleReqFieldLabel"></asp:Label>
                                            <%--<span class="styleMandatory">*</span>--%>
                                            <uc:FLOV ID="ucPopUp" runat="server" OnLoadCusotmer="btnLoadCustomer_OnClick" />
                                            <cc1:DropShadowExtender ID="dseProspect" runat="server" TargetControlID="pnlProspectView"
                                                Opacity=".4" Rounded="false" TrackPosition="true" />
                                            <asp:Panel ID="pnlProspectView" runat="server" Style="display: block; position: absolute"
                                                Width="750px" BackColor="White" Height="360px" ScrollBars="Horizontal">
                                                <table width="100%" class="styleMainTable" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="stylePageHeading" width="100%" colspan="2">
                                                            <asp:Label runat="server" ID="Label2" CssClass="styleDisplayLabel" Text="Prospect Details"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px" width="30%">
                                                            <asp:Label ID="lblName" runat="server" CssClass="styleReqFieldLabel" Text="Prospect Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px" width="70%">
                                                            <asp:DropDownList ID="ddlTitle" runat="server" TabIndex="0">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="ddlTitle"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="true" ValidationGroup="vgProspect"
                                                                ErrorMessage="Select Prospect title" InitialValue="0"></asp:RequiredFieldValidator>
                                                            <asp:TextBox ID="txtProspectName" runat="server" MaxLength="50" Width="400px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvProspectName" runat="server" ControlToValidate="txtProspectName"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="true" ValidationGroup="vgProspect"
                                                                ErrorMessage="Enter the Prospect name"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblCustomerType" runat="server" CssClass="styleDisplayLabel" Text="Prospect Type"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:DropDownList ID="ddlCustomerType" runat="server"></asp:DropDownList>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblCompanyType" runat="server" CssClass="styleDisplayLabel" Text="Company Type"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:DropDownList ID="ddlCompanyType" runat="server"></asp:DropDownList>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblPostingGLCode" runat="server" CssClass="styleDisplayLabel" Text="Posting GL Code" Visible="false"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:DropDownList ID="ddlPostingGLCode" runat="server" Visible="false"></asp:DropDownList>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblIndustry" runat="server" CssClass="styleDisplayLabel" Text="Industry"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:DropDownList ID="ddlIndustry" runat="server"></asp:DropDownList>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblComAddress1" runat="server" CssClass="styleDisplayLabel" Text="Address 1"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" Width="95%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblComAddress2" runat="server" CssClass="styleDisplayLabel" Text="Address 2"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtCOmAddress2" runat="server" MaxLength="60" Width="95%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblComcity" runat="server" CssClass="styleDisplayLabel" Text="City"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblComState" runat="server" CssClass="styleDisplayLabel" Text="State"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="txtComState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblComCountry" runat="server" CssClass="styleDisplayLabel" Text="Country"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="txtComCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend" MaxLength="30"
                                                                Width="120px">
                                                            </cc1:ComboBox>
                                                            &nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="lblCompincode" runat="server" CssClass="styleDisplayLabel" Text="PIN" Width="50px"></asp:Label>
                                                            &nbsp;&nbsp;
                                                            <asp:TextBox ID="txtComPincode" runat="server" MaxLength="10" Width="34%"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                TargetControlID="txtComPincode" ValidChars=" ">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblComTelephone" runat="server" CssClass="styleDisplayLabel" Text="Telephone"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComTelephone" runat="server" MaxLength="12" Width="120px"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComTelephone" runat="server" Enabled="True"
                                                                FilterType="Numbers,Custom" TargetControlID="txtComTelephone"
                                                                ValidChars=" -">
                                                            </cc1:FilteredTextBoxExtender>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="lblComMobile" runat="server" CssClass="styleDisplayLabel" Text="Mobile" Width="50px"></asp:Label>
                                                            &nbsp;&nbsp;
                                                            <asp:TextBox ID="txtComMobile" runat="server" MaxLength="12" Width="34%"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComMobile" runat="server" Enabled="True" FilterType="Numbers,Custom"
                                                                TargetControlID="txtComMobile" ValidChars=" -">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblComEmail" runat="server" CssClass="styleDisplayLabel" Text="EMail Id"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComEmail" runat="server" MaxLength="60" Width="320px"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtComEmail"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"
                                                                ValidationGroup="Enquiry" Enabled="false"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblComWebSite" runat="server" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComWebsite" runat="server" MaxLength="60" Width="320px"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revComWebsite" runat="server" ControlToValidate="txtComWebsite"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                                                ValidationGroup="Main"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblRefType" runat="server" Text="Reference Type" Visible="false"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlRefType" Visible="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRefType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblRefNumber" Visible="false" runat="server" Text="Reference Number"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlRefNumber" runat="server" Visible="false">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label runat="server" ID="lblConstitutionName" Text="Constitution" CssClass="styleDisplayLabel"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlConstitutionName" runat="server"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label runat="server" ID="lblContactPerson" Text="Contact Person" CssClass="styleDisplayLabel"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtCntPer" runat="server" MaxLength="50" Style="text-align: left"
                                                                Width="220px"></asp:TextBox>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label runat="server" ID="lblContactPersonPhone" Text="Contact Person Phone No." CssClass="styleDisplayLabel"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtCntPerPh" runat="server" MaxLength="12" Style="text-align: left"
                                                                Width="125px"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="fltCntPerPh" runat="server" Enabled="True"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtCntPerPh"
                                                                ValidChars=" -">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label runat="server" ID="lblContactPerDesig" Text="Contact Person Designation" CssClass="styleDisplayLabel"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtCntPerDesig" runat="server" MaxLength="50" Style="text-align: left"
                                                                Width="220px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td align="right" style="padding-right: 25px">
                                                            <br />
                                                            <asp:Button runat="server" ID="btnProspectView" Text="Save" CssClass="styleGridShortButton" ValidationGroup="vgProspect"
                                                                OnClick="btnProspectView_Click" />
                                                            <asp:Button ID="btnPrspctClear" runat="server" Text="Clear" ToolTip="Clear Prospect Details"
                                                                CssClass="styleGridShortButton" OnClientClick="return fnClearProspect();" UseSubmitBehavior="false" />
                                                            <asp:Button ID="btnPrspctCancel" runat="server" Text="Cancel" ToolTip="Exit Prospect Details" CssClass="styleGridShortButton"
                                                                OnClientClick="return fnShowPopup('pnlProspectView');" UseSubmitBehavior="false" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:ValidationSummary runat="server" ID="vsPropsect" HeaderText="Correct the following validation(s):"
                                                                CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="vgProspect" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                                <td class="styleFieldLabel">
                                    <%-- <asp:UpdatePanel ID="updTop" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtName" runat="server" Width="120px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <fieldset id="fldButton" runat="server" class="accordionHeaderSelected" style="cursor: pointer; height: 9px; width: 13px; border-width: 1px; border-color: #bad4ff; border-style: solid; margin-top: 0px">
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="true" OnClick="btnGetLOV_Click" ToolTip="Search"
                                                        ImageUrl="../Images/search_blue.gif" Style="cursor: pointer; height: 14px; vertical-align: top; margin-top: -3px" />
                                                </fieldset>
                                            </td>
                                            <td valign="top" style="padding-top: 8px">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <cc1:DropShadowExtender ID="dseCustomer" runat="server" TargetControlID="pnlCustomerView"
                                                            Opacity=".4" Rounded="false" TrackPosition="true" />
                                                        <asp:Image ID="imgCustomer" runat="server" ImageUrl="../Images/Edit.jpg" onclick="fnShowPopup('pnlCustomerView');"
                                                            Style="cursor: pointer; height: 20px" />
                                                        <asp:Image ID="imgProspect" runat="server" ImageUrl="../Images/Edit.jpg" onclick="fnShowPopup('pnlProspectView');"
                                                            Style="cursor: pointer; height: 20px" Visible="false" ToolTip="Prospect/Customer Details" />
                                                        <%--onclick="fnShowPopup('pnlProspectView');"OnClick="imgProspect_OnClick"--%>
                                                        <asp:Panel ID="pnlCustomerView" runat="server" Style="display: none; position: absolute"
                                                            Width="35%" BackColor="White">
                                                            <table width="100%" class="styleMainTable" border="1" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="stylePageHeading" width="100%">
                                                                        <asp:Label runat="server" ID="Label1" CssClass="styleDisplayLabel" Text="Customer Details"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <CD:CustomerDetails ID="ucdCustomer" runat="server" ShowCustomerCode="true" FirstColumnStyle="styleFieldLabel"
                                                                            SecondColumnStyle="styleFieldAlign" />
                                                                        <asp:Label ID="hidCustomerId" runat="server" Style="display: none" />
                                                                        <br />
                                                                        <asp:Button ID="btnUp" runat="server" CssClass="styleGridShortButton" Style="float: right;"
                                                                            ToolTip="View Full Details" Text="View" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                    </table>
                                    <%--</ContentTemplate>
                            </asp:UpdatePanel>--%>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <cc1:ComboBox Visible="false" ID="ddlSearch" Width="180px" AutoPostBack="true" runat="server"
                                        AutoCompleteMode="Suggest" DropDownStyle="DropDownList" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                                    </cc1:ComboBox>
                                    <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                                        OnClick="btnLoadCustomer_OnClick" CausesValidation="false" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top">
                        <asp:UpdatePanel ID="updLead" runat="server">
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="height: 30px">

                                            <cc1:TabContainer ID="tcCRM" runat="server" CssClass="styleTabPanel" Style="max-width: 580px"
                                                ScrollBars="None" TabStripPlacement="top" AutoPostBack="True"
                                                OnActiveTabChanged="tcCRM_ActiveTabChanged">
                                                <cc1:TabPanel ID="tpLeadDetails" runat="server" CssClass="tabpan" HeaderText="Lead Details"
                                                    Style="border: 0px;" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Lead Details
                                                    </HeaderTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="tpTrackDetails" runat="server" CssClass="tabpan" HeaderText="Track Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Track Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="tpDocumentDocument" runat="server" CssClass="tabpan" HeaderText="Document Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Document Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="tpAccountDetails" runat="server" CssClass="tabpan" HeaderText="Account Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Account Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="tpStatusDetails" runat="server" CssClass="tabpan" HeaderText="Status Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Status Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="tpGroupDetails" runat="server" CssClass="tabpan" HeaderText="Group Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Group Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="tpdcdairy" runat="server" CssClass="tabpan" HeaderText="DC Dairy"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        DC Dairy
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>

                                            </cc1:TabContainer>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel"></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <%--<asp:PostBackTrigger ControlID="btnLeadOk" />--%>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="upMain" runat="server">
        <ContentTemplate>
            <table width="99%" align="center" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" Text="Lead Details" ID="lblCRMDetail" CssClass="styleDisplayLabel"> </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <table width="100%" cellpadding="0" cellspacing="0" class="styleMainTable" style="border-width: 2px">
                            <tr>
                                <td style="height: 10px">
                                    <asp:Panel ID="pnlFollowUp" runat="server" Width="99%" Visible="false" CssClass="stylePanel"
                                        Style="overflow: hidden">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="pnlAddFollow" GroupingText="" Width="99%" runat="server" BackColor="White"
                                                        Visible="false">
                                                        <table runat="server" id="tblFlwUp" class="styleLoginTable" width="100" cellpadding="0">
                                                            <tr>
                                                                <td style="height: 10px">
                                                                    <asp:TextBox ID="txtTrackDetailID" runat="server" ReadOnly="true" Visible="false"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="10%">
                                                                    <asp:Label ID="lblQuery" runat="server" Text="Query Type" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlQuery" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQuery_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvddlQuery" CssClass="styleMandatoryLabel"
                                                                        InitialValue="0" ErrorMessage="Select the Query Type" runat="server" ControlToValidate="ddlQuery"
                                                                        ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td class="styleFieldLabel" width="10%">
                                                                    <asp:Label ID="lblTicketNo" runat="server" Text="Ticket No" CssClass="styleDisplayLabel"></asp:Label>
                                                                    <asp:HiddenField runat="server" ID="hdnView" />
                                                                    <asp:HiddenField runat="server" ID="hdnTicketNo" />
                                                                </td>
                                                                <td width="40%">
                                                                    <asp:TextBox ID="txtTicketNo" Style="width: 100px" runat="server" ReadOnly="true"></asp:TextBox>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDate" runat="server"
                                                                        Text="Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:TextBox ID="txtDate" Style="width: 100px" runat="server"></asp:TextBox>
                                                                    <asp:Image ID="imgFlwupDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDate" PopupButtonID="imgFlwupDate"
                                                                        ID="ceFlwupDate" Enabled="true">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvTicketDate" CssClass="styleMandatoryLabel"
                                                                        Enabled="true" ErrorMessage="Enter the Date" runat="server"
                                                                        ControlToValidate="txtDate" ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="10%">
                                                                    <asp:Label ID="lblFromType" runat="server" Text="From Type" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlFrom" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFrom_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <uc2:LOV ID="ucFrom" runat="server" style="width: 75%" />
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblNotifyDate" runat="server" Text="Target Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </td>
                                                                <td width="40%">
                                                                    <asp:TextBox ID="txtNotifyDt" Width="80px" runat="server" MaxLength="15"></asp:TextBox>
                                                                    &nbsp;<asp:Image ID="imgNoDt" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtNotifyDt"
                                                                        PopupButtonID="imgNoDt" ID="ceNotifyDt" Enabled="true">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvTargetDate" CssClass="styleMandatoryLabel"
                                                                        Enabled="true" ErrorMessage="Enter the Target Date" runat="server"
                                                                        ControlToValidate="txtNotifyDt" ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="10%">
                                                                    <asp:Label ID="lblToType" runat="server" Text="To Type" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlTo" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlTo_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <uc2:LOV ID="ucTo" style="width: 75%" runat="server" />
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td width="40%">
                                                                    <asp:DropDownList ID="ddlStatus" Enabled="true" runat="server" Width="100px"></asp:DropDownList>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="lblMode" runat="server" Text="Mode" CssClass="styleDisplayLabel"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:DropDownList ID="ddlMode" runat="server"></asp:DropDownList>
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvMode" CssClass="styleMandatoryLabel"
                                                                        Enabled="false" InitialValue="0" ErrorMessage="Select the Mode" runat="server"
                                                                        ControlToValidate="ddlMode" ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="10%">
                                                                    <asp:Label ID="lblDesc" runat="server" Text="Description" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td colspan="3">
                                                                    <asp:TextBox ID="txtDescription" MaxLength="500" Width="90%" Height="90px" onkeyup="maxlengthfortxt(500);"
                                                                        TextMode="MultiLine" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4"></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="padding-right: 10px" colspan="4">
                                                                    <center>
                                                                        <asp:Button runat="server" ID="btnOK" ValidationGroup="vgOK" CssClass="styleGridShortButton"
                                                                            Text="Save" OnClick="btnOK_Click" ToolTip="Save Track details" />
                                                                        &nbsp;<asp:Button runat="server" ID="btnCan" CssClass="styleGridShortButton" Text="Cancel"
                                                                            OnClick="btnCan_Click" ToolTip="Clear Track details" />
                                                                    </center>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <br />
                                                                    <asp:ValidationSummary runat="server" ID="vsOK" HeaderText="Correct the following validation(s):"
                                                                        CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="vgOK" />
                                                                    <asp:CustomValidator ID="cvOK" runat="server" CssClass="styleMandatoryLabel" Enabled="true"
                                                                        Display="Dynamic" Width="98%"></asp:CustomValidator>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100%" align="left">
                                                    <table width="98%">
                                                        <tr>
                                                            <td width="70%">
                                                                <asp:Label ID="lblSTicketNo" runat="server" Text="Ticket Number" CssClass="styleDisplayLabel"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="txtSTicketNo" runat="server" Width="80px" ToolTip="Ticket NUmber"
                                                                    onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right" MaxLength="5"></asp:TextBox><cc1:FilteredTextBoxExtender
                                                                        ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtSTicketNo"
                                                                        FilterType="Numbers" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:Label ID="lblSDate" runat="server" Text="Date" CssClass="styleDisplayLabel"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:TextBox ID="txtSDate" runat="server" Width="90px"></asp:TextBox><cc1:CalendarExtender
                                                                    ID="calStartDate" runat="server" Enabled="True" TargetControlID="txtSDate" PopupButtonID="imgStartDate">
                                                                </cc1:CalendarExtender>
                                                                <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="styleGridShortButton" CausesValidation="false"
                                                                    OnClick="btnGo_Click"></asp:Button>
                                                                <asp:Button ID="btnSClear" runat="server" OnClientClick="document.getElementById('ctl00_ContentPlaceHolder1_accPnl1_content_txtSTicketNo').value='';document.getElementById('ctl00_ContentPlaceHolder1_accPnl1_content_txtSDate').value='';"
                                                                    Text="Clear" CssClass="styleGridShortButton" CausesValidation="false" OnClick="btnSClear_Click"></asp:Button>
                                                            </td>
                                                            <td width="30%" align="right" runat="server" id="tdInitiate">
                                                                <asp:DropDownList ID="ddlPrograms" runat="server">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="rfvddlPrograms" CssClass="styleMandatoryLabel"
                                                                    InitialValue="0" ErrorMessage="Select the Program to initiate" runat="server"
                                                                    ControlToValidate="ddlPrograms" ValidationGroup="Enquiry" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                <asp:Button runat="server" ID="btnMoveEnquiry" ValidationGroup="Enquiry" CssClass="styleGridShortButton"
                                                                    Text="Initiate" OnClick="btnMoveEnquiry_Click" OnClientClick="return fnCheckPageValidators('Enquiry', false)" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100%">
                                                    <div class="container" style="max-height: 500px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                                        <asp:GridView Width="98%" runat="server" ID="grvFollowUp" EmptyDataText="No records found.." AutoGenerateColumns="False"
                                                            OnRowDataBound="grvFollowUp_RowDataBound">
                                                            <Columns>
                                                                <%-- Ticket no  --%>
                                                                <asp:TemplateField HeaderText="Tkt No" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtTicketNo" runat="server" Text='<%# Bind("TicketNo")%>'></asp:Label>
                                                                        <asp:Label ID="lblTrackLeadID" runat="server" Visible="false" Text='<%# Bind("Lead_ID")%>'></asp:Label>
                                                                        <asp:Label ID="lblTrackPanum" runat="server" Visible="false" Text='<%# Bind("Panum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- Date  --%>
                                                                <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtDate" runat="server" Text='<%# Bind("Date")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%-- From  --%>
                                                                <asp:TemplateField HeaderText="From" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="hidFromType" runat="server" Value='<%# Bind("From_Type")%>' />
                                                                        <asp:Label ID="hidFromUserName" runat="server" Text='<%# Bind("From_UserName")%>' />
                                                                        <asp:HiddenField ID="hidFromID" runat="server" Value='<%# Bind("From")%>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="13%" />
                                                                </asp:TemplateField>
                                                                <%-- To  --%>
                                                                <asp:TemplateField HeaderText="To" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="hidToType" runat="server" Value='<%# Bind("To_Type")%>' />
                                                                        <asp:Label ID="hidToUserName" runat="server" Text='<%# Bind("To_UserName")%>'>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:Label>
                                                                        <asp:HiddenField ID="hidToID" runat="server" Value='<%# Bind("To")%>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="13%" />
                                                                </asp:TemplateField>
                                                                <%-- Query Type  --%>
                                                                <asp:TemplateField HeaderText="Query Type" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="hidQueryType" runat="server" Value='<%# Bind("QueryType")%>' />
                                                                        <asp:LinkButton ID="lnkQuery" runat="server" Text='<%# Bind("QueryTxt")%>' OnClick="btnView_Click"
                                                                            OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';">
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:LinkButton>
                                                                        <asp:Label ID="txtQuery" runat="server" Text='<%# Bind("QueryTxt")%>'>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%-- Description  --%>
                                                                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <%--<div style="width:160px;height:50px; overflow-x: auto;">--%>
                                                                        <asp:Label ID="txtDescription" runat="server" Text='<%# Bind("Description")%>'></asp:Label><%--</div>--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                                </asp:TemplateField>
                                                                <%-- Notify Date  --%>
                                                                <asp:TemplateField HeaderText="Target Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="90px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtNotifyDate" runat="server" Text='<%# Bind("NotifyDate") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <%-- Mode  --%>
                                                                <asp:TemplateField HeaderText="Mode" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="hidMode" runat="server" Value='<%# Bind("Mode")%>' />
                                                                        <asp:Label ID="txtMode" runat="server" Text='<%# Bind("ModeTxt")%>'>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Status  --%>
                                                                <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="30px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("Status")%>'></asp:Label><asp:HiddenField
                                                                            ID="hidStatus" runat="server" Value='<%# Bind("Status_Code")%>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Add  --%>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="3px">
                                                                    <HeaderTemplate>
                                                                        <asp:Button ID="btnAdd" runat="server" OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
                                                                            Text="Add" CssClass="styleGridShortButton" CausesValidation="false" OnClick="btnAdd_Click" ToolTip="Add new track Details"></asp:Button>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="btnRemove" runat="server" Visible="false" Text="Remove" OnClick="btnRemove_Click"
                                                                            CausesValidation="false"></asp:LinkButton><asp:HiddenField ID="hidVersionNo" runat="server"
                                                                                Value='<%# Bind("Version_No")%>' />
                                                                        <asp:LinkButton ID="btnView" runat="server" Text="Edit" Visible="false" OnClick="btnView_Click"
                                                                            CausesValidation="false"></asp:LinkButton><asp:HiddenField ID="IsMax" runat="server"
                                                                                Value='<%# Bind("IsMax")%>' />
                                                                        <asp:HiddenField ID="hidFollowup_Detail_ID" runat="server" Value='<%# Bind("Followup_Detail_ID")%>' />
                                                                        <asp:TextBox ID="hidToMailId" runat="server" Visible="false" Text='<%# Bind("ToMailId")%>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlDocuments" runat="server" Width="99%" Visible="false" CssClass="stylePanel"
                                        Style="overflow: hidden">
                                        <asp:Panel ID="pnlAddDocument" runat="server" Width="99%" Visible="true" CssClass="stylePanel"
                                            Style="overflow: hidden">
                                            <asp:UpdatePanel ID="updDocuments" runat="server">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblDocumentType" runat="server" CssClass="styleReqFieldLabel" Text="Document Type"></asp:Label>
                                                            </td>
                                                            <td width="30%">
                                                                <asp:DropDownList ID="ddlDocumentType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDocumentType_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator Display="None" ID="rfvddlDocumentType" CssClass="styleMandatoryLabel"
                                                                    InitialValue="0" ErrorMessage="Select the Document Type" runat="server" ControlToValidate="ddlDocumentType"
                                                                    ValidationGroup="vgAddDoc" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="styleFieldLabel" width="20%">
                                                                <asp:Label ID="lblDocument" runat="server" CssClass="styleReqFieldLabel" Text="Document Name"></asp:Label>
                                                            </td>
                                                            <td width="30%">
                                                                <asp:DropDownList ID="ddlDocument" runat="server" Style="width: 70%">
                                                                </asp:DropDownList>
                                                                <asp:CheckBox runat="server" ID="chkIsMandatory" Checked="true" TextAlign="Left"
                                                                    Enabled="false" Visible="false" />
                                                                <asp:RequiredFieldValidator Display="None" ID="rfvddlDocument" CssClass="styleMandatoryLabel"
                                                                    InitialValue="-1" ErrorMessage="Select the Document Name" runat="server" ControlToValidate="ddlDocument"
                                                                    ValidationGroup="vgAddDoc" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblCollectedBy" runat="server" Text="Collected By"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <uc3:Suggest ID="ddlCollectedBy" runat="server" ServiceMethod="GetSalesPersonList" Width="250px" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblcollectedDate" runat="server" Text="Collected Date"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtCollectedDate" Width="80px" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                                <asp:Image ID="imgtxtCollectedDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtCollectedDate"
                                                                    PopupButtonID="imgtxtCollectedDate" ID="cetxtCollectedDate" Enabled="true">
                                                                </cc1:CalendarExtender>
                                                                <asp:CheckBox runat="server" ID="chkIsCollected" />
                                                                <asp:Label ID="lblIsCollected" runat="server" Text="Collected" CssClass="styleDisplayLabel"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblScannedBy" runat="server" Text="Scanned By"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <uc3:Suggest ID="ddlScannedBy" runat="server" ServiceMethod="GetSalesPersonList" Width="250px" />
                                                            </td>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblScannedDate" runat="server" Text="Scanned Date"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtscannedDate" Width="80px" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                                                <asp:Image ID="imgtxtscannedDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtscannedDate"
                                                                    PopupButtonID="imgtxtscannedDate" ID="cetxtscannedDate" Enabled="true">
                                                                </cc1:CalendarExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" valign="top">
                                                                <asp:Label ID="lblDocRemarks" runat="server" Text="Remarks"></asp:Label>
                                                            </td>
                                                            <td colspan="3" valign="top">
                                                                <asp:TextBox ID="txtDocRemarks" Width="70%" MaxLength="300" onkeyup="maxlengthfortxt(200);"
                                                                    TextMode="MultiLine" runat="server" Height="60px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel">
                                                                <asp:Label ID="lblUploadFile" runat="server" Text="File Upload"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:UpdatePanel ID="tempUpdate" runat="server">
                                                                    <ContentTemplate>
                                                                        <asp:Label ID="lblActualPath" runat="server" Visible="false"></asp:Label>
                                                                        <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                                                        <asp:Button ID="btnBrowse" runat="server" OnClick="btnBrowse_OnClick" Style="display: none" />
                                                                        <table align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td style="padding: 0px">
                                                                                    <asp:CheckBox ID="chkSelect" runat="server" Enabled="false" Text="" Width="20px" />
                                                                                </td>
                                                                                <td style="padding: 0px">
                                                                                    <asp:FileUpload ID="flUpload" runat="server" ToolTip="Upload File" Width="100px" />
                                                                                    <asp:Button ID="btnDlg" runat="server" CausesValidation="false" CssClass="styleGridShortButton" Style="display: none" Text="Browse" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                    <Triggers>
                                                                        <asp:PostBackTrigger ControlID="btnBrowse" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>
                                                                <br />
                                                            </td>
                                                            <td class="styleFieldLabel" rowspan="2" valign="top">
                                                                <asp:Label ID="lblValue" runat="server" Text="Value"></asp:Label>
                                                            </td>
                                                            <td valign="top">
                                                                <asp:TextBox ID="txtValue" Width="70%" MaxLength="50" runat="server"></asp:TextBox>
                                                                <asp:TextBox ID="txtCRMDocumentID" runat="server" ReadOnly="true" Visible="false"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="styleFieldLabel" valign="top">
                                                                <asp:Label ID="lblCurrentPath" runat="server" Style="position: absolute; color: Green; vertical-align: top; display: none" />
                                                            </td>
                                                            <td align="right">
                                                                <asp:Button ID="btnDocAdd" runat="server" CssClass="styleGridShortButton" OnClick="btnDocAdd_Click" OnClientClick="return fnCheckPageValidators('vgAddDoc', false);" Text="Add" ValidationGroup="vgAddDoc" />
                                                                <asp:Button ID="btnDocClear" runat="server" CssClass="styleGridShortButton" OnClick="btnDocClear_Click" Text="Clear" />
                                                                <asp:Button ID="btnDocUpdate" runat="server" CssClass="styleGridShortButton" OnClick="btnDocUpdate_Click" OnClientClick="return fnCheckPageValidators('vgAddDoc', false);" Text="Update" Visible="false" ValidationGroup="vgAddDoc" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):" ShowMessageBox="false" ShowSummary="true" ValidationGroup="vgAddDoc" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="ddlDocumentType" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                        <div class="container" style="max-height: 200px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                            <asp:GridView ID="gvPRDDT" runat="server" AutoGenerateColumns="False" Width="98%"
                                                BorderColor="Gray" DataKeyNames="Doc_Cat_ID" CssClass="styleInfoLabel" Visible="true"
                                                OnRowDataBound="gvPRDDT_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("Doc_Cat_ID") %>'></asp:Label>
                                                            <asp:Label ID="lblDocumentID" runat="server" Text='<%# Bind("Documents_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Edit" Visible="false">
                                                        <ItemTemplate>
                                                            <%--OnCheckedChanged="rdHSelect_CheckedChanged"--%>
                                                            <asp:RadioButton ID="rdSelect" runat="server" Checked="false"
                                                                AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Document Name" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("Doc_Description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Doc. Identification No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CollectedById" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCollectedBy" runat="server" Text='<%# Bind("Collected_By") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Collected By" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCollectedByName" runat="server" Text='<%# Bind("Collected_By_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Collected Date" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCollectedDate" runat="server" Text='<%# Bind("Collected_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ScannedById" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblScannedBy" runat="server" Text='<%# Bind("Scanned_By") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Scanned By" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblScannedByName" runat="server" Text='<%# Bind("Scanned_By_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Scanned Date" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblScannedDate" runat="server" Text='<%# Bind("Scanned_Date") %>'></asp:Label>
                                                            <asp:Label ID="lblDocPath" runat="server" Text='<%# Bind("Document_Path") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View Document">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCanView" runat="server" Text='<%# Bind("ViewDoc") %>' Visible="false"></asp:Label>
                                                            <asp:ImageButton ID="hyplnkView" CommandArgument='<%# Bind("Scanned_Ref_No") %>'
                                                                OnClick="hyplnkView_Click" ImageUrl="~/Images/spacer.gif" CssClass="styleGridEditDisabled"
                                                                runat="server" />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRemarks" runat="server" Text='<%# Eval("Remarks")%>'></asp:Label>
                                                            <asp:Label ID="lblProgramName" runat="server" Visible="false" Text='<%# Eval("ProgramName")%>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CbxCheck" runat="server" Enabled="false" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Edit">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkbtnDocEdit" runat="server" Text="Edit" OnClick="lnkbtnDocEdit_Click"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remove">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkbtnDocRemove" runat="server" Text="Remove" OnClick="lnkbtnDocRemove_Click"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlStatus" runat="server" Width="99%" Visible="false" CssClass="stylePanel"
                                        Style="overflow: hidden">
                                        <%--<div class="container" style="height: 200px; width: 100%; overflow-y: auto; overflow-x: hidden;">--%>
                                        <asp:GridView runat="server" ID="grvAssetDetails" AutoGenerateColumns="False" Width="100%">
                                            <Columns>
                                                <%-- PrimeAccountNo  --%>
                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkgdStatusPanum" runat="server" Text='<%# Bind("Account_No")%>' OnClick="lnkgdStatusPanum_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- SubAccountNo  --%>
                                                <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtSubAccountNo" runat="server" Text='<%# Bind("Sub_Account_No")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Creation Date  --%>
                                                <asp:TemplateField HeaderText="Creation Date" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvCreationDate" runat="server" Text='<%# Bind("Creation_Date")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Maturity Date  --%>
                                                <asp:TemplateField HeaderText="Maturity Date" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvMaturityDate" runat="server" Text='<%# Bind("Maturity_Date")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Finance Amount  --%>
                                                <asp:TemplateField HeaderText="Finance Amount" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvFinAmount" runat="server" Text='<%# Bind("Finance_amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- UMFC Amount  --%>
                                                <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvUMFC" runat="server" Text='<%# Bind("UMFC_Amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Billed Amount  --%>
                                                <asp:TemplateField HeaderText="Billed Amount" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvBilledAmt" runat="server" Text='<%# Bind("BilledAmount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Outstanding  --%>
                                                <asp:TemplateField HeaderText="OutStanding" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvOutStanding" runat="server" Text='<%# Bind("OutStanding")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- ODI Due  --%>
                                                <asp:TemplateField HeaderText="ODI Due" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvODIDue" runat="server" Text='<%# Bind("ODI_Due")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Other Dues  --%>
                                                <asp:TemplateField HeaderText="Other Dues" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvOtherDues" runat="server" Text='<%# Bind("Other_Dues")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Last Paid Date  --%>
                                                <asp:TemplateField HeaderText="Last Paid Date" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvPaidDate" runat="server" Text='<%# Bind("Last_Paid_Date")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Asset Desc  --%>
                                                <asp:TemplateField HeaderText="Asset Desc" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvAssetdesc" runat="server" Text='<%# Bind("Asset_Desc")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Asset Regn No  --%>
                                                <asp:TemplateField HeaderText="Vehicle Regn No" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvRegnNo" runat="server" Text='<%# Bind("Asset_Regn_No")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Asset Sno/ Vehicle Regn No  --%>
                                                <asp:TemplateField HeaderText="Asset Serial no" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgvAstSrlNo" runat="server" Text='<%# Bind("Asset_Serial_No")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- Status  --%>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("Status")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="styleGridHeader" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <%-- </div>--%>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div id="divShow" runat="server" class="modal">
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="stylePageHeading">
                                                                    <asp:Label ID="lblStatusHdr" runat="server" Text="Account Followup Details" EnableViewState="false" CssClass="styleInfoLabel">
                                                                    </asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div id="divhtml" runat="server">
                                                        </div>
                                                        <center>
                                                            <asp:Button ID="btnStatusClose" runat="server" Text="Close" UseSubmitBehavior="false" CssClass="styleGridShortButton"
                                                                OnClientClick="return fnCloseDiv();" />
                                                        </center>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlAccount" runat="server" Width="99%" Visible="false" CssClass="stylePanel"
                                        Style="overflow: hidden">
                                        <table style="width: 100%" class="styleMainTable">
                                            <tr>
                                                <td align="center">
                                                    <div class="container" style="height: 200px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                                        <asp:GridView ID="grvMain" runat="server" AutoGenerateColumns="false" Width="100%">
                                                            <Columns>
                                                                <%-- LOB  --%>
                                                                <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLob" runat="server" Text='<%# Bind("LOB")%>'></asp:Label><asp:Label
                                                                            ID="txtLobId" runat="server" Text='<%# Bind("LOB_ID")%>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                                                                </asp:TemplateField>
                                                                <%-- Branch  --%>
                                                                <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtBranch" runat="server" Text='<%# Bind("Location")%>'></asp:Label><asp:HiddenField
                                                                            ID="hidIsColor" runat="server" Value='<%# Bind("IsColor")%>' />
                                                                        <asp:Label ID="txtBranchId" runat="server" Text='<%# Bind("Location_Id")%>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                                </asp:TemplateField>
                                                                <%-- PrimeAccountNo  --%>
                                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtPrimeAccountNo" runat="server" Text='<%# Bind("PANum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                                </asp:TemplateField>
                                                                <%-- SubAccountNo  --%>
                                                                <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtSubAccountNo" runat="server" Text='<%# Bind("SANum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                                </asp:TemplateField>
                                                                <%-- Select  --%>
                                                                <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelectAcc" runat="server" AutoPostBack="false" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                            <EmptyDataTemplate>
                                                                <span>No Records Found...</span>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="btnDown" CssClass="styleGridShortButton" runat="server" ToolTip="Down"
                                                        Text="View" Visible="true" OnClick="btnDown_Click" CausesValidation="true" OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';return fnCheckPageValidators('vgUp',false);"
                                                        ValidationGroup="vgUp" Style="float: right" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100%">
                                                    <div class="container" style="max-height: 180px; overflow-y: auto; overflow-x: hidden;">
                                                        <asp:GridView runat="server" ID="grvAccountDetails" AutoGenerateColumns="False" OnRowDataBound="grvAccountDetails_RowDataBound">
                                                            <Columns>
                                                                <%-- Radion Button   --%>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkJE" Text="Ledger" runat="server" OnClick="lnkJE_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="4%" />
                                                                </asp:TemplateField>
                                                                <%-- LOB --%>
                                                                <%-- <asp:CommandField ShowSelectButton="True" Visible="false" />--%>
                                                                <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLOBName" runat="server" Text='<%# Bind("LOB")%>'></asp:Label><asp:HiddenField
                                                                            ID="hidLOB" runat="server" Value='<%# Bind("LOB_ID")%>'></asp:HiddenField>
                                                                        <asp:HiddenField ID="hidBranch" runat="server" Value='<%# Bind("Location_ID")%>'></asp:HiddenField>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- PANum  --%>
                                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtPANum" runat="server" Text='<%# Bind("PANum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- SANum  --%>
                                                                <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtSANum" runat="server" Text='<%# Bind("SANum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Begin Date  --%>
                                                                <asp:TemplateField HeaderText="Begin Date" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtBeginDate" runat="server" Text='<%# Bind("Creation_Date")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- MatureDate   --%>
                                                                <asp:TemplateField HeaderText="Maturity Date" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtMatureDate" runat="server" Text='<%# Bind("MatureDate")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- Finance Amount   --%>
                                                                <asp:TemplateField HeaderText="Finance Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtFinanceAmount" runat="server" Text='<%# Bind("Finance_Amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- UMFC   --%>
                                                                <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtUMFC" runat="server" Text='<%# Bind("UMFC")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Billed Amount   --%>
                                                                <asp:TemplateField HeaderText="Billed Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="txtBilledAmount" runat="server" Text='<%# Bind("BilledAmount")%>' OnClick="txtBilledAmount_Click"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Collected Amount   --%>
                                                                <asp:TemplateField HeaderText="Collected Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="txtCollectedAmount" runat="server" Text='<%# Bind("CollectedAmount")%>' OnClick="txtCollectedAmount_Click"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- NOD   --%>
                                                                <asp:TemplateField HeaderText="NOD" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtNOD" runat="server" Text='<%# Bind("NOD")%>'></asp:Label><asp:LinkButton
                                                                            ID="lnkNOD" runat="server" Text='<%# Bind("NOD")%>' OnClick="lnkNOD_Click"></asp:LinkButton><%-- <cc1:PopupControlExtender ID="PopEx" runat="server" TargetControlID="lnkNOD" PopupControlID="pnlNOD"
                                                    Position="Bottom" />--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                                </asp:TemplateField>
                                                                <%-- O/S Amount   --%>
                                                                <asp:TemplateField HeaderText="O/S Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtOSAmount" runat="server" Text='<%# Bind("OSAmount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Future Principal   --%>
                                                                <asp:TemplateField HeaderText="Future Principal" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtFuturePrincipal" runat="server" Text='<%# Bind("FuturePrincipal")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- LTV Amount   --%>
                                                                <asp:TemplateField HeaderText="LTV Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLTVAmount" runat="server" Text='<%# Bind("LTVAmount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Category Status   --%>
                                                                <asp:TemplateField HeaderText=" Category Status" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtCategoryStatus" runat="server" Text='<%# Bind("CategoryStatus")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- DC   --%>
                                                                <asp:TemplateField HeaderText="DC" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtDC" runat="server" Text='<%# Bind("DC")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </td>
                                            </tr>

                                        </table>
                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="pnlLeadView" Width="950px" BackColor="White" Style="display: none;">
                                        <div class="container" style="overflow-y: auto; overflow-x: hidden;">
                                            <table width="700px" class="styleMainTable">
                                                <%-- <tr>
                                                <td class="stylePageHeading" width="700px" colspan="4">
                                                    <asp:Panel ID="pnlDrgLead" runat="server">
                                                        <asp:Label runat="server" ID="Label3" CssClass="styleDisplayLabel" Text="Lead Details"></asp:Label>
                                                    </asp:Panel>
                                                </td>
                                            </tr>--%>
                                                <tr>
                                                    <td class="styleFieldLabel" width="100px">
                                                        <asp:Label ID="lblFinanceMode" runat="server" Text="Finance Mode" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="200px">
                                                        <asp:DropDownList ID="ddlFinanceMode" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvLeadFinanceMode" runat="server" ControlToValidate="ddlFinanceMode"
                                                            InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Select the Finance Mode"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td class="styleFieldLabel" width="100px">
                                                        <asp:Label ID="lblLLeadID" runat="server" Text="LeadID" CssClass="styleDisplayLabel" Visible="false"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="200px">
                                                        <asp:TextBox ID="txtLeadID" runat="server" Text="" ReadOnly="true" Visible="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvddlLOB" runat="server" ControlToValidate="ddlLOB"
                                                            InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Select the Line of Business"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLocation" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtBranchSearch" runat="server" MaxLength="50" Width="182px"></asp:TextBox>
                                                        <cc1:AutoCompleteExtender ID="autoBranchSearch" MinimumPrefixLength="3" OnClientPopulated="Branch_ItemPopulated"
                                                            OnClientItemSelected="Branch_ItemSelected" runat="server" TargetControlID="txtBranchSearch"
                                                            ServiceMethod="GetBranchList" Enabled="True" ServicePath="" CompletionSetCount="2"
                                                            CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                                        </cc1:AutoCompleteExtender>
                                                        <cc1:TextBoxWatermarkExtender ID="txtBranchSearchExtender" runat="server" TargetControlID="txtBranchSearch"
                                                            WatermarkText="--Select--">
                                                        </cc1:TextBoxWatermarkExtender>
                                                        <asp:HiddenField ID="hdnBranchID" runat="server" />

                                                        <asp:RequiredFieldValidator ID="rfvLeadLocation" runat="server" ControlToValidate="txtBranchSearch"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Select the Location"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblProduct" runat="server" Text="Product Type" ></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlProductType" runat="server"></asp:DropDownList>
                                                    </td>
                                                   
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadSourceType" runat="server" Text="Lead Source Type" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlLeadSourceType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLeadSourceType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvLeadSourceType" runat="server" ControlToValidate="ddlLeadSourceType"
                                                            InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Select the Lead Source Type"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblFundingType" runat="server" Text="Exposure Type"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" width="200px">
                                                        <asp:DropDownList ID="ddlFundingType" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadSource" runat="server" Text="Lead Source" CssClass="styleReqFieldLabel"></asp:Label>&nbsp;
                                                            <uc:FLOV ID="ucLead" runat="server" OnLoadCusotmer="btnLeadSource_OnClick" />
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLeadSource" runat="server" Width="120px" ReadOnly="true"></asp:TextBox>
                                                        <%--<asp:Button ID="btnGetSource" runat="server" Text="..." CausesValidation="true" OnClick="btnGetSource_Click" />--%>
                                                        <fieldset id="Fieldset1" runat="server" class="accordionHeaderSelected" style="cursor: pointer; margin-left: -5px; height: 9px; width: 13px; border-width: 1px; border-color: #bad4ff; border-style: solid; margin-top: 5px">
                                                            <asp:ImageButton ID="btnGetSource" runat="server" CausesValidation="true" OnClick="btnGetSource_Click" ToolTip="Search"
                                                                ImageUrl="../Images/search_blue.gif" Style="cursor: pointer; height: 14px; vertical-align: top; margin-top: -3px" />
                                                        </fieldset>
                                                        <asp:TextBox ID="txtOtherLead" runat="server" Visible="false" MaxLength="50"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadSalesPerson" runat="server" Text="Sales Person" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtSalesPerson" runat="server" MaxLength="100" Width="250px"></asp:TextBox>
                                                        <cc1:AutoCompleteExtender ID="autoSalePerson" MinimumPrefixLength="3" OnClientPopulated="SalesPerson_ItemPopulated"
                                                            OnClientItemSelected="SalesPerson_ItemSelected" runat="server" TargetControlID="txtSalesPerson"
                                                            ServiceMethod="GetSalesPersonList" Enabled="True" ServicePath="" CompletionSetCount="2"
                                                            CompletionListCssClass="CompletionList" DelimiterCharacters=";, :" CompletionListItemCssClass="CompletionListItemCssClass"
                                                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                                        </cc1:AutoCompleteExtender>
                                                        <cc1:TextBoxWatermarkExtender ID="tbwmeSalesPerson" runat="server" TargetControlID="txtSalesPerson"
                                                            WatermarkText="--Select--">
                                                        </cc1:TextBoxWatermarkExtender>
                                                        <asp:HiddenField ID="hdnSalesPersonID" runat="server" />

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblAccountStatus" runat="server" Text="Lead Category" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlAccountStatus" runat="server"></asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblAssignedTo" runat="server" Text="Lead Assigned To" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <uc3:Suggest ID="ddlLeadAssigned" runat="server" ServiceMethod="GetSalesPersonList" Width="250px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLdFinanceAmt" runat="server" Text="Finance Amount" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLdFinanceAmt" runat="server" MaxLength="3" Style="text-align: right; width: 100px"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbeLdFinanceAmt" runat="server" TargetControlID="txtLdFinanceAmt" Enabled="true" FilterType="Numbers,Custom"
                                                            ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="rfvLdFinanceAmt" runat="server" ControlToValidate="txtLdFinanceAmt"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Enter the Finance Amount"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadTenure" runat="server" Text="Tenure" CssClass="styleDisplayLabel"></asp:Label>
                                                    </td>

                                                    <td class="styleFieldAlign">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtLeadTenure" runat="server" MaxLength="3" Style="text-align: right; width: 100px"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbeLeadTenure" runat="server" TargetControlID="txtLeadTenure" Enabled="true" FilterType="Numbers">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvLeadTenure" runat="server" ControlToValidate="txtLeadTenure"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Enter the Tenure"></asp:RequiredFieldValidator>--%>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblLeadRate" runat="server" Text="Rate" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td class="styleFieldAlign">
                                                                    <asp:TextBox ID="txtLeadRate" runat="server" MaxLength="5" Style="text-align: right; width: 100px"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftbeLeadRate" runat="server" TargetControlID="txtLeadRate" ValidChars="." Enabled="true"
                                                                        FilterType="Numbers,Custom">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <%--<asp:RequiredFieldValidator ID="rfvLeadRate" runat="server" ControlToValidate="txtLeadRate"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Enter the Rate"></asp:RequiredFieldValidator>--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblCusotmerStatus" runat="server" Text="Customer Status"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlCustomerStatus" runat="server"></asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadStatus" runat="server" Text="Lead Response" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:DropDownList ID="ddlLeadStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLeadStatus_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="rfvLeadStatus" runat="server" ControlToValidate="ddlLeadStatus"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Select the Lead Response"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" valign="top">
                                                        <asp:Label ID="lblLeadInformation" runat="server" Text="Lead Information" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign" colspan="3">
                                                        <asp:TextBox ID="txtLeadInformation" runat="server" TextMode="MultiLine" Width="600px" Height="70px" onkeyup="maxlengthfortxt(1000);"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="rfvLeadInformation" runat="server" ControlToValidate="txtLeadInformation"
                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                            ValidationGroup="LeadAdd" ErrorMessage="Enter the Lead Information"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadContactName" runat="server" Text="Contact Person"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLeadContactPerson" runat="server" MaxLength="50"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadContactNumber" runat="server" Text="Contact Person Ph No"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLeadContactNumber" runat="server" MaxLength="15"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadContactDesg" runat="server" Text="Contact Person Designation"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLeadContactDesg" runat="server" MaxLength="50"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblLeadContactEmail" runat="server" Text="Email"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLeadContactEmail" runat="server" MaxLength="60"></asp:TextBox>

                                                        <asp:DropDownList ID="ddlLeadConstitution" runat="server" Visible="false">
                                                        </asp:DropDownList>
                                                        <%--<asp:RequiredFieldValidator ID="rfvLeadConstitution" runat="server" ControlToValidate="ddlLeadConstitution"
                                                        CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="0"
                                                        ValidationGroup="Enquiry" ErrorMessage="Select the Constitution"></asp:RequiredFieldValidator>--%>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" valign="top">
                                                        <asp:Label ID="lblCompetitorInfo" runat="server" Text="Competitor Info"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtCompetitorInfo" runat="server" TextMode="MultiLine" Width="300px" Height="70px" onkeyup="maxlengthfortxt(500);"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel" valign="top">
                                                        <asp:Label ID="lblLeadRemarks" runat="server" Text="Remarks"></asp:Label>
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtLeadRemarks" runat="server" TextMode="MultiLine" Width="300px" Height="70px" onkeyup="maxlengthfortxt(500);"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" valign="top">
                                                        <div style="width: 880px; height: 200px; overflow-y: auto; overflow-x: auto;">
                                                            <asp:GridView ID="grvAssets" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                                OnRowDeleting="grvAssets_DeleteClick" OnRowDataBound="grvAssets_RowDataBound"
                                                                Width="97%">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                            <asp:Label ID="lblAssetCategoryID" runat="server" Text='<%# Bind("Asset_ID")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblAssetLeadID" runat="server" Text='<%# Bind("LeadAsset_ID")%>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>

                                                                    <%--Asset--%>
                                                                    <asp:TemplateField HeaderText="Asset" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAssetCategory" runat="server" Text='<%# Bind("Asset_Description")%>'
                                                                                Width="180px"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:DropDownList ID="ddlAssetCategory" runat="server" Width="180px">
                                                                            </asp:DropDownList>
                                                                            <asp:RequiredFieldValidator ID="rfvAssetCategory" runat="server" ControlToValidate="ddlAssetCategory"
                                                                                Display="None" ErrorMessage="Select the Asset Category" ValidationGroup="AssetAdd" InitialValue="0">
                                                                            </asp:RequiredFieldValidator>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <%--Cost--%>
                                                                    <asp:TemplateField HeaderText="Cost">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAssetCost" runat="server" Text='<%# Bind("Asset_Cost")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtAssetCost" runat="server" Style="text-align: right" Width="95px" MaxLength="18"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvAssetCost" runat="server" ControlToValidate="txtAssetCost"
                                                                                Display="None" ErrorMessage="Enter the Asset Cost" ValidationGroup="AssetAdd">
                                                                            </asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="ftvAssetCost" runat="server" TargetControlID="txtAssetCost" ValidChars="." Enabled="true" FilterType="Numbers,Custom">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>

                                                                    <%-- Finance Amount--%>
                                                                    <asp:TemplateField HeaderText="Finance Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblFinanceAmount" runat="server" Text='<%# Bind("Finance_Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtFinanceAmt" runat="server" Style="text-align: right;" MaxLength="18"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="rfvFinanceAmount" runat="server" ControlToValidate="txtFinanceAmt"
                                                                                Display="None" ErrorMessage="Enter the Finance Amount" ValidationGroup="AssetAdd">
                                                                            </asp:RequiredFieldValidator>
                                                                            <cc1:FilteredTextBoxExtender ID="ftvFinanceAmount" runat="server" TargetControlID="txtFinanceAmt" ValidChars="." Enabled="true" FilterType="Numbers,Custom">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" />
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Action">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                                                OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete">
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                                OnClick="btnAssetAdd_Click" Text="Add" ValidationGroup="AssetAdd" ToolTip="Add" />
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                                        <FooterStyle HorizontalAlign="Center" Width="7%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataTemplate>
                                                                    <span>No Records Found...</span>
                                                                </EmptyDataTemplate>
                                                            </asp:GridView>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="center">
                                                        <asp:Button ID="btnLeadOk" Text="Save" runat="server" CssClass="styleGridShortButton" ValidationGroup="LeadAdd"
                                                            OnClick="btnLeadOk_OnClick" ToolTip="Save Lead Details" /><%-- OnClientClick="fnShowPopup('pnlLeadView');ValidationGroup="Enquiry""--%>
                                                        <asp:Button ID="btnLeadClear" Text="Clear" runat="server" CssClass="styleGridShortButton" OnClick="btnLeadClear_Click" />
                                                        <asp:Button ID="btnLeadCancel" Text="Cancel" runat="server" CssClass="styleGridShortButton" UseSubmitBehavior="false"
                                                            OnClientClick="return fnShowPopup('pnlLeadView');" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <asp:ValidationSummary ID="vsLeadAsset" runat="server" CssClass="styleMandatoryLabel"
                                                            HeaderText="Correct the following validation(s):" ValidationGroup="AssetAdd" />
                                                        <asp:ValidationSummary ID="vsLeadAdd" runat="server" CssClass="styleMandatoryLabel"
                                                            HeaderText="Correct the following validation(s):" ValidationGroup="LeadAdd" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table>
                                            <tr width="100%">
                                                <td width="100%">
                                                    <asp:Panel DefaultButton="btnPassword" ID="PnlPassword" Style="display: none" runat="server"
                                                        Height="130px" BackColor="White" BorderStyle="Solid" BorderColor="Black" Width="30%">
                                                        <table width="100%">
                                                            <tr>
                                                                <td colspan="3" class="stylePageHeading" align="center">
                                                                    <asp:Label runat="server" ToolTip="password" Text="Enter your password" ID="lblPasswordHeader"
                                                                        CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td>&nbsp;
                                                                <asp:Label ID="lblPassword" ToolTip="password" runat="server" Text="Password:" Font-Bold="true"></asp:Label>
                                                                </td>
                                                                <td>&nbsp;
                                                                </td>
                                                                <td align="left" class="styleFieldAlign">
                                                                    <asp:TextBox ID="txtPassword" ToolTip="password" runat="server" Width="200px" TextMode="Password"
                                                                        MaxLength="30"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    <asp:Button ID="btnPassword" ToolTip="Authenticate password" CausesValidation="false"
                                                                        CssClass="styleSubmitButton" OnClick="btnPassword_Click" Text="Submit" runat="server" />
                                                                    &nbsp;
                                                                <asp:Button ID="btnCancelPass" ToolTip="Cancel" CausesValidation="false" OnClick="btnCancelPass_Click"
                                                                    CssClass="styleSubmitButton" Text="Cancel" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    <asp:Label ID="lblErrorMessagePass" runat="server" CssClass="styleMandatoryLabel" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                                <td>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtenderPassword" runat="server" TargetControlID="ddlLeadStatus"
                                                        PopupControlID="PnlPassword" BackgroundCssClass="styleModalBackground" Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlLeadViewDetails" Visible="false" Width="100%" runat="server"
                                        CssClass="stylePanel" Style="overflow: hidden; z-index: -1; position: inherit;">
                                        <div class="container" style="max-height: 350px; overflow-y: auto; overflow-x: hidden;">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnAddLead" runat="server" Text="ADD" CssClass="styleGridShortButton" OnClick="btnAddLead_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView runat="server" ID="gvLeadDetails" AutoGenerateColumns="False" EmptyDataText="No Records Found" OnRowDataBound="gvLeadDetails_RowDataBound">
                                                            <Columns>
                                                                <%-- Check   --%>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkLeadSelect" runat="server" AutoPostBack="true" Checked='<%# Eval("IS_Checked").ToString() == "1" ? true : false %>' OnCheckedChanged="chkLeadSelect_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="4%" />
                                                                </asp:TemplateField>

                                                                <%-- Lead ID   --%>
                                                                <asp:TemplateField HeaderText="Lead ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadID" runat="server" Text='<%# Bind("Lead_ID")%>'></asp:Label>
                                                                        <asp:Label ID="lblPricingID" runat="server" Text='<%# Bind("Pricing_ID")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="4%" />
                                                                </asp:TemplateField>

                                                                <%-- Lead No   --%>
                                                                <asp:TemplateField HeaderText="Lead No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadNo" runat="server" Text='<%# Bind("Lead_No")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>

                                                                <%-- Panum   --%>
                                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadPanum" runat="server" Text='<%# Bind("Panum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>

                                                                <%-- Lead information   --%>
                                                                <asp:TemplateField HeaderText="Lead Information" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadInformation" runat="server" Text='<%# Bind("Lead_Information")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="35%" />
                                                                </asp:TemplateField>

                                                                <%-- Location   --%>
                                                                <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadLocation" runat="server" Text='<%# Bind("Lead_Location")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>

                                                                <%-- Location   --%>
                                                                <asp:TemplateField HeaderText="Finance Amount">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadFinAmt" runat="server" Text='<%# Bind("Finance_Amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>

                                                                <%-- Lead Name   --%>
                                                                <asp:TemplateField HeaderText="Lead Source" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadName" runat="server" Text='<%# Bind("Lead_Name")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                </asp:TemplateField>

                                                                <%-- Lead Status   --%>
                                                                <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblLeadStatus" runat="server" Text='<%# Bind("Lead_Status")%>'></asp:Label>
                                                                        <asp:Label ID="lblLeadStatusID" runat="server" Text='<%# Bind("Lead_Status_ID")%>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>

                                                                <%-- Edit View   --%>
                                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkLeadEdit" runat="server" Text="Edit" OnClick="lnkLeadEdit_Click"></asp:LinkButton>
                                                                        <asp:LinkButton ID="lnkLeadView" runat="server" Text="View" OnClick="lnkLeadView_Click"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>

                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlGroupDetails" Width="100%" runat="server" Visible="false"
                                        CssClass="stylePanel" Style="overflow: hidden; z-index: -1; position: inherit;">

                                        <table width="100%">
                                            <tr style="width: 100%">
                                                <td style="width: 100%">
                                                    <asp:GridView Width="98%" runat="server" ID="grvGroupDtls" AutoGenerateColumns="true" EmptyDataText="No Records Found" OnRowDataBound="grvGroupDtls_RowDataBound">
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr style="width: 100%">
                                                <td style="width: 100%">
                                                    <div class="container" style="max-height: 350px; overflow-y: auto; overflow-x: auto;">
                                                        <asp:GridView Width="98%" runat="server" ID="grvCustDtls" AutoGenerateColumns="true" EmptyDataText="No Records Found" OnRowDataBound="grvCustDtls_RowDataBound">
                                                        </asp:GridView>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                        <table style="display: none">
                                            <tr>
                                                <td class="styleFieldLabel">
                                                    <asp:Label ID="lblGroupCode" runat="server" Text="Group Code" CssClass="styleDisplayLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:TextBox ID="txtGroupCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:Label ID="lblGroupName" runat="server" Text="Group Name" CssClass="styleDisplayLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel">
                                                    <asp:TextBox ID="txtGroupName" runat="server" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>

                                        <div class="container" style="max-height: 350px; overflow-y: auto; overflow-x: hidden; display: none">
                                            <asp:GridView runat="server" ID="grvGroupDetails" AutoGenerateColumns="False" EmptyDataText="No Records Found">
                                                <Columns>
                                                    <asp:BoundField DataField="Customer_Code" HeaderText="Customer Code" ItemStyle-Width="120px" />
                                                    <asp:BoundField DataField="Customer_Name" HeaderText="Customer Name" ItemStyle-Width="250px" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>

                                    </asp:Panel>
                                    <%--Group details--%>

                                    <asp:Panel ID="pnldcdairy" runat="server">
                                        <table style="width: 100%" class="styleMainTable">
                                            <tr>
                                                <td>
                                                    <div class="container" style="max-height: 180px; overflow-y: auto; overflow-x: hidden;">
                                                        <asp:GridView runat="server" ID="grvDcDairyAccountDetails" AutoGenerateColumns="False" OnRowDataBound="grvDCDairyAccounts_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkJE" Text="Ledger" runat="server" OnClick="lnkJE_CheckedChanged" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="4%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLOBName" runat="server" Text='<%# Bind("LOB")%>'></asp:Label><asp:HiddenField
                                                                            ID="hidLOB" runat="server" Value='<%# Bind("LOB_ID")%>'></asp:HiddenField>
                                                                        <asp:HiddenField ID="hidBranch" runat="server" Value='<%# Bind("Location_ID")%>'></asp:HiddenField>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- PANum  --%>
                                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtPANum" runat="server" Text='<%# Bind("PANum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- SANum  --%>
                                                                <asp:TemplateField HeaderText="Sub Account No" Visible="false" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtSANum" runat="server" Text='<%# Bind("SANum")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>

                                                                <%-- Location  --%>
                                                                <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbllocation" runat="server" Text='<%# Bind("DC_Location")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Begin Date  --%>
                                                                <asp:TemplateField HeaderText="Begin Date" Visible="false" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtBeginDate" runat="server" Text='<%# Bind("Creation_Date")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- MatureDate   --%>
                                                                <asp:TemplateField HeaderText="Maturity Date" Visible="false" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtMatureDate" runat="server" Text='<%# Bind("MatureDate")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- Finance Amount   --%>
                                                                <asp:TemplateField HeaderText="Finance Amount" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtFinanceAmount" runat="server" Text='<%# Bind("Finance_Amount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- UMFC   --%>
                                                                <asp:TemplateField HeaderText="UMFC" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtUMFC" runat="server" Text='<%# Bind("UMFC")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Billed Amount   --%>
                                                                <asp:TemplateField HeaderText="Billed Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="txtBilledAmount" runat="server" Text='<%# Bind("BilledAmount")%>'
                                                                            OnClick="txtBilledAmount_Click"></asp:LinkButton><%--<cc1:PopupControlExtender ID="PopExBillAmt" runat="server" TargetControlID="txtBilledAmount"
                                                    PopupControlID="pnlNOD" Position="Bottom" />--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Collected Amount   --%>
                                                                <asp:TemplateField HeaderText="Collected Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="txtCollectedAmount" runat="server" Text='<%# Bind("CollectedAmount")%>'
                                                                            OnClick="txtCollectedAmount_Click"></asp:LinkButton><%--<cc1:PopupControlExtender ID="PopExColAmt" runat="server" TargetControlID="txtCollectedAmount"
                                                    PopupControlID="pnlNOD" Position="Bottom" />--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- NOD   --%>
                                                                <asp:TemplateField HeaderText="NOD" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtNOD" runat="server" Text='<%# Bind("NOD")%>'></asp:Label><asp:LinkButton
                                                                            ID="lnkNOD" runat="server" Text='<%# Bind("NOD")%>' OnClick="lnkNOD_Click"></asp:LinkButton><%-- <cc1:PopupControlExtender ID="PopEx" runat="server" TargetControlID="lnkNOD" PopupControlID="pnlNOD"
                                                    Position="Bottom" />--%>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                                </asp:TemplateField>
                                                                <%-- O/S Amount   --%>
                                                                <asp:TemplateField HeaderText="O/S Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtOSAmount" runat="server" Text='<%# Bind("OSAmount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Future Principal   --%>
                                                                <asp:TemplateField HeaderText="Future Principal" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtFuturePrincipal" runat="server" Text='<%# Bind("FuturePrincipal")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- LTV Amount   --%>
                                                                <asp:TemplateField HeaderText="LTV Amount" Visible="false" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLTVAmount" runat="server" Text='<%# Bind("LTVAmount")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Category Status   --%>
                                                                <asp:TemplateField HeaderText=" Category Status" Visible="false" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtCategoryStatus" runat="server" Text='<%# Bind("CategoryStatus")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- DC   --%>
                                                                <asp:TemplateField HeaderText="DC" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtDC" runat="server" Text='<%# Bind("DC")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Supervisor" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtDCSuperVisor" runat="server" Text='<%# Bind("NextLevel")%>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="btnkDcSelect" Text="DC" CssClass="styleGridShortButton" runat="server" OnClick="btnkDcSelect_Click" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                        </asp:GridView>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <%--DC Dairy--%>

                                    <cc1:DropShadowExtender ID="dseLeadDetails" runat="server" TargetControlID="pnlLeadView"
                                        Opacity=".4" Rounded="false" TrackPosition="true" />
                                    <asp:Button ID="btnLeadView" Text="Ok" runat="server" CssClass="styleGridShortButton"
                                        OnClick="btnLeadView_OnClick" Style="display: none;" />


                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Panel ID="pnlAccountInformation" Visible="false" Width="100%" runat="server"
                            GroupingText="Account Information" CssClass="stylePanel" Style="overflow: hidden">
                            <table width="98%">
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <%--     <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" ToolTip="Save"
                            Text="Save" OnClick="btnSave_Click" />--%>
                        <asp:Button runat="server" ID="btnSave" CssClass="styleSubmitButton" Text="Save"
                            OnClientClick="return fnCheckPageValidators('vgSave');" ValidationGroup="vgSave" Visible="false"
                            OnClick="btnSave_Click" />
                        &nbsp;<asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" Visible="false" />
                        &nbsp;<asp:Button runat="server" ID="btnCancel" Text="Cancel" ValidationGroup="VGODI"
                            CausesValidation="false" CssClass="styleSubmitButton" Height="26px" OnClick="btnCancel_Click" />
                        <asp:RequiredFieldValidator ID="rfvddlType" runat="server" ControlToValidate="ddlType"
                            ErrorMessage="Select at least one query type" CssClass="styleMandatoryLabel"
                            Display="None" InitialValue="0" SetFocusOnError="True" ValidationGroup="vgSave"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlType" ErrorMessage="Select at least one query type"
                            CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                            ValidationGroup="vgUp"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="vgSave" runat="server" ValidationGroup="vgSave" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vgUp"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                        <asp:CustomValidator ID="cvFollowUp" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                        <asp:CustomValidator ID="cvEnquiry" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Enquiry" Enabled="true" Width="98%" Display="None" />
                        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="Enquiry"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                            ShowSummary="true" />
                        <asp:HiddenField ID="hdnLeadSourceType" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <iframe runat="server" id="ifrmCRM" width="100%" frameborder="0" style="min-height: 700px; border-style: none;" visible="false"></iframe>
                        <asp:Button runat="server" ID="btnFrameCancel" CssClass="styleSubmitButton" Text="Save" Style="display: none"
                            OnClick="btnFrameCancel_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnClear" />
        </Triggers>
    </asp:UpdatePanel>
    <table>
        <tr>
            <td>
                <asp:Button OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
                    runat="server" ID="btnNOD" CssClass="styleSubmitButton" Text="Ok" Style="display: none" />
                <cc1:ModalPopupExtender ID="moeNOD" runat="server" TargetControlID="btnNOD" PopupControlID="pnlNOD"
                    BackgroundCssClass="styleModalBackground" />
            </td>
        </tr>
        <tr>
            <td></td>

        </tr>
    </table>
    <table>
        <tr>
            <td>


                <%--<asp:Button OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
                    runat="server" ID="Button1" CssClass="styleSubmitButton" Text="Ok" Style="display: none" />
                <cc1:ModalPopupExtender ID="MPE" runat="server" TargetControlID="Button1" PopupControlID="pnlAddFollow"
                    BackgroundCssClass="styleModalBackground" />--%>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td width="100%">
                <asp:Panel ID="pnlNOD" GroupingText="" Width="90%" Height="370px" runat="server"
                    Style="display: none" BackColor="White" BorderStyle="Solid">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td class="stylePageHeading" width="100%">
                                        <asp:Label runat="server" ID="lblNodHead" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <div class="container" style="height: 300px; width: 100%; overflow: auto;">
                                            <asp:GridView runat="server" ID="grvPopUp" AutoGenerateColumns="true" Width="97%"
                                                OnRowDataBound="grvPopUp_RowDataBound">
                                                <Columns>
                                                </Columns>
                                                <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">&nbsp;<asp:Button runat="server" ID="Button3" OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
                                        CssClass="styleSubmitButton" Text="Close" OnClick="Button3_OnClick" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td>
                <asp:Button ID="btnModal" Style="display: none" runat="server" />
                <cc1:ModalPopupExtender ID="MoedcdairyDetails" runat="server" TargetControlID="btnModal" PopupControlID="Paneldairypop"
                    BackgroundCssClass="styleModalBackground" />
                <asp:Panel ID="Paneldairypop" GroupingText="" Width="95%" Height="370px" runat="server" ScrollBars="Auto"
                    Style="display: none" BackColor="White" BorderStyle="Solid">
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td class="stylePageHeading" align="center" width="100%">
                                        <asp:Label runat="server" ID="Label4" Text="New DC Details" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                </tr>
                                <tr>

                                    <tr>
                                        <td align="center">
                                            <div class="container" style="height: 300%; width: 100%; overflow: auto;">
                                                <asp:GridView ID="grvDCDairyPopUp" OnRowDataBound="grvDCDairyPopUp_RowDataBound" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Loan No" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCPANUM" runat="server" Text='<%# Bind("PANUM")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cash Flow Desc" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCCASHFLOW" runat="server" Visible="false" Text='<%# Bind("DUE_FLAG")%>'>></asp:Label>
                                                                <asp:Label ID="lblgrvDCCASHFLOW_DESC" runat="server" Text='<%# Bind("CASHFLOWDESCRIPTION")%>'>></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Due Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCDueDate" runat="server" Text='<%# Bind("DUE_DATE")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgrvDCTotal" runat="server" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCDueAmount" runat="server" Text='<%# Bind("DUE_AMOUNT")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtgrvDCDueSum" runat="server" ContentEditable="False" Text='<%# Bind("DUE_AMOUNT_SUM")%>' Width="100%">
                                                                </asp:TextBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCCollection" runat="server" Text='<%# Bind("COLLECTION")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtgrvDCTotalCollection" ContentEditable="False" runat="server" Width="100%">
                                                                </asp:TextBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Balance" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCBalance" runat="server" Text='<%# Bind("BALANCE")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtgrvDCTotalbalSum" ContentEditable="False" runat="server" Width="100%">
                                                                </asp:TextBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DC Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCName" runat="server" Text='<%# Bind("DC_NAME")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Recorded By" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCUserId" Text='<%# Bind("User_Id")%>' Visible="false" runat="server"></asp:Label>
                                                                <asp:Label ID="lblgrvDCRecordedby" Text='<%# Bind("User_Name")%>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PTP Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgrvDCPTPdate" Text='<%# Bind("PTP_DATE")%>' AutoPostBack="true" OnTextChanged="txtgrvDCPTPdate_TextChanged" runat="server"> </asp:TextBox>
                                                                <cc1:CalendarExtender
                                                                    ID="CEPTPDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" TargetControlID="txtgrvDCPTPdate">
                                                                </cc1:CalendarExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PTP Value">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgrvDCValue" Text='<%# Bind("VALUE_AMNT")%>' Width="60px" AutoPostBack="true" OnTextChanged="txtgrvDCValue_TextChanged" runat="server"> </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fgrvDCvalue" runat="server" Enabled="True" FilterType="Custom,Numbers" ValidChars="."
                                                                    TargetControlID="txtgrvDCValue">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgrvDCRemarks" Text='<%# Bind("REMARKS")%>' onkeyup="maxlengthfortxt(200)" AutoPostBack="true" Width="300px" OnTextChanged="txtgrvDCRemarks_TextChanged" TextMode="MultiLine" runat="server"> </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDcStatus" Visible="false" runat="server" Text='<%# Bind("STATUS_ID")%>'></asp:Label>
                                                                <asp:DropDownList ID="ddlgrvDCStatus" AutoPostBack="true" OnSelectedIndexChanged="ddlgrvDCStatus_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UpdateStatus" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrvDCUpdateStatus" Visible="false" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <span>No Records Found...</span>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>

                                                <table width="100%">
                                                    <tr>
                                                        <td class="stylePageHeading" align="center" width="100%">
                                                            <asp:Label runat="server" ID="Label5" Text="History Details" CssClass="styleDisplayLabel"></asp:Label>

                                                        </td>
                                                    </tr>
                                                </table>

                                                <asp:GridView ID="grvDCDairyPopUpOld" OnRowDataBound="grvDCDairyPopUpOld_RowDataBound" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Loan No" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDPANUM" runat="server" Text='<%# Bind("PANUM")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Cash Flow Desc" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDCASHFLOW" runat="server" Visible="false" Text='<%# Bind("DUE_FLAG")%>'>></asp:Label>
                                                                <asp:Label ID="lblgvDCOLDCASHFLOW_DESC" runat="server" Text='<%# Bind("CASHFLOWDESCRIPTION")%>'>></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Due Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDDueDate" runat="server" Text='<%# Bind("DUE_DATE")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgvDCOLDTotal" runat="server" Text="Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Due Amount" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDDueAmount" runat="server" Text='<%# Bind("DUE_AMOUNT")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtgvDCOLDDueSum" runat="server" ContentEditable="False" Text='<%# Bind("DUE_AMOUNT_SUM")%>' Width="100%">
                                                                </asp:TextBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Collection" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDCollection" runat="server" Text='<%# Bind("COLLECTION")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtgvDCOLDTotalCollection" ContentEditable="False" runat="server" Width="100%">
                                                                </asp:TextBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Balance" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDBalance" runat="server" Text='<%# Bind("BALANCE")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="txtgvDCOLDTotalbalSum" ContentEditable="False" runat="server" Width="100%">
                                                                </asp:TextBox>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DC Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDDCName" runat="server" Text='<%# Bind("DC_NAME")%>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Recorded By" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDUserId" Text='<%# Bind("User_Id")%>' Visible="false" runat="server"></asp:Label>
                                                                <asp:Label ID="lblgvDCOLDRecordedby" Text='<%# Bind("User_Name")%>' runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PTP Date" ControlStyle-Width="65px" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgvDCOLDPTPdate" Text='<%# Bind("PTP_DATE")%>' AutoPostBack="true" OnTextChanged="txtgvDCOLDPTPdate_TextChanged" runat="server"> </asp:TextBox>
                                                                <cc1:CalendarExtender
                                                                    ID="CEgvDCOLDPTPDate" runat="server" Enabled="True" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" TargetControlID="txtgvDCOLDPTPdate">
                                                                </cc1:CalendarExtender>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="PTP Value">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgvDCOLDValue" Text='<%# Bind("VALUE_AMNT")%>' Width="60px" AutoPostBack="true" OnTextChanged="txtgvDCOLDValue_TextChanged" runat="server"> </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="fvalue" runat="server" Enabled="True" FilterType="Custom,Numbers" ValidChars="."
                                                                    TargetControlID="txtgvDCOLDValue">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txtgvDCOLDRemarks" Text='<%# Bind("REMARKS")%>' onkeyup="maxlengthfortxt(200)" AutoPostBack="true" Width="300px" OnTextChanged="txtgvDCOLDRemarks_TextChanged"
                                                                    TextMode="MultiLine" runat="server"> </asp:TextBox>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDDcStatus" Visible="false" runat="server" Text='<%# Bind("STATUS_ID")%>'></asp:Label>
                                                                <asp:DropDownList ID="ddlgvDCOLDStatus" AutoPostBack="true" OnSelectedIndexChanged="ddlgvDCOLDStatus_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UpdateStatus" Visible="false" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgvDCOLDUpdateStatus" Visible="false" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <span>No Records Found...</span>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="center">
                                            <asp:Button runat="server" ID="btndcdairyClose" OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
                                                CssClass="styleSubmitButton" Text="Close" OnClick="btndcdairyClose_Click" />
                                            <asp:Button runat="server" ID="btndcAdd"
                                                CssClass="styleSubmitButton" Text="SAVE" OnClick="btndcAdd_Click" />
                                            <asp:Button runat="server" Visible="false" Text="Update History Details" ID="btndcAddOld"
                                                CssClass="styleSubmitButton" />

                                        </td>

                                    </tr>
                        </ContentTemplate>

                    </asp:UpdatePanel>
                </asp:Panel>
            </td>
        </tr>
    </table>

</asp:Content>
