<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Collection_S3GClnCRM, App_Web_3jwyxbhk" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx" TagName="CustomerDetails"
    TagPrefix="CD" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GDynamicLOV.ascx" TagName="FLOV" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../App_Themes/S3GTheme_Blue/AutoSuggestBox.css" rel="Stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript">

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
    </script>

    <style type="text/css">
        .ajax__calendar
        {
            z-index: 10002 !important;
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
                                            <asp:Label runat="server" Text="Search Type" ID="lblType" CssClass="styleDisplayLabel"></asp:Label>
                                            <span class="styleMandatory">*</span>
                                            <uc:FLOV ID="ucPopUp" runat="server" OnLoadCusotmer="btnLoadCustomer_OnClick" />
                                            <cc1:DropShadowExtender ID="dseProspect" runat="server" TargetControlID="pnlProspectView"
                                                Opacity=".4" Rounded="false" TrackPosition="true" />
                                            <asp:Panel ID="pnlProspectView" runat="server" Style="display: block; position: absolute"
                                                Width="450px" BackColor="White" Visible="false">
                                                <table width="100%" class="styleMainTable" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="stylePageHeading" width="100%" colspan="2">
                                                            <asp:Label runat="server" ID="Label2" CssClass="styleDisplayLabel" Text="Prospect Details"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px" width="30%">
                                                            <asp:Label ID="lblName" runat="server" CssClass="styleReqFieldLabel" Text="Prsopect Name"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px" width="70%">
                                                            <asp:DropDownList ID="ddlTitle" runat="server" TabIndex="0">
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="txtProspectName" runat="server" MaxLength="50" Width="190px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProspectName"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" style="padding-bottom: 0px">
                                                            <asp:Label ID="lblComAddress1" runat="server" CssClass="styleReqFieldLabel" Text="Address 1"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign" style="padding-bottom: 0px">
                                                            <asp:TextBox ID="txtComAddress1" runat="server" MaxLength="60" Width="95%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvComAddress1" runat="server" ControlToValidate="txtComAddress1"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
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
                                                            <asp:Label ID="lblComcity" runat="server" CssClass="styleReqFieldLabel" Text="City"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="txtComCity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                            <asp:RequiredFieldValidator ID="rfvComCity" runat="server" ControlToValidate="txtComCity"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"
                                                                InitialValue="0"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblComState" runat="server" CssClass="styleReqFieldLabel" Text="State"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="txtComState" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                                            </cc1:ComboBox>
                                                            <asp:RequiredFieldValidator ID="rfvComState" runat="server" ControlToValidate="txtComState"
                                                                InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblComCountry" runat="server" CssClass="styleReqFieldLabel" Text="Country"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <cc1:ComboBox ID="txtComCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                                AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                                Width="80px">
                                                            </cc1:ComboBox>
                                                            <asp:RequiredFieldValidator ID="rfvComCountry" runat="server" ControlToValidate="txtComCountry"
                                                                InitialValue="0" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            <asp:Label ID="lblCompincode" runat="server" CssClass="styleReqFieldLabel" Text="PIN"></asp:Label>
                                                            <asp:TextBox ID="txtComPincode" runat="server" MaxLength="10" Width="34%"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComPincode" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                TargetControlID="txtComPincode" ValidChars=" ">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RequiredFieldValidator ID="rfvComPincode" runat="server" ControlToValidate="txtComPincode"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblComTelephone" runat="server" CssClass="styleReqFieldLabel" Text="Telephone"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComTelephone" runat="server" MaxLength="12" Width="102px"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComTelephone" runat="server" Enabled="True"
                                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtComTelephone"
                                                                ValidChars=" -">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <asp:RequiredFieldValidator ID="rfvComTelephone" runat="server" ControlToValidate="txtComTelephone"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            <asp:Label ID="lblComMobile" runat="server" CssClass="styleDisplayLabel" Text="[M]"></asp:Label>
                                                            &nbsp;&nbsp;
                                                            <asp:TextBox ID="txtComMobile" runat="server" MaxLength="12" Width="34%"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftxtComMobile" runat="server" Enabled="True" FilterType="Numbers"
                                                                TargetControlID="txtComMobile" ValidChars=" -">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblComEmail" runat="server" CssClass="styleDisplayLabel" Text="EMail Id"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComEmail" runat="server" MaxLength="60" Width="85%"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvComEmail" runat="server" ControlToValidate="txtComEmail"
                                                                Enabled="false" CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True"
                                                                ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtComEmail"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="^[\w\.=-]+@[\w\.-]+\.[\w]{2,3}$"
                                                                ValidationGroup="Main" Enabled="false"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblComWebSite" runat="server" CssClass="styleDisplayLabel" Text="Web Site"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:TextBox ID="txtComWebsite" runat="server" MaxLength="60" Width="85%"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="revComWebsite" runat="server" ControlToValidate="txtComWebsite"
                                                                CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"
                                                                ValidationGroup="Main"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblRefType" runat="server" Text="Reference Type"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlRefType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRefType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="20%">
                                                            <asp:Label ID="lblRefNumber" runat="server" Text="Reference Number"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldAlign">
                                                            <asp:DropDownList ID="ddlRefNumber" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td align="right" style="padding-right: 25px">
                                                            <br />
                                                            <asp:Button runat="server" ID="btnProspectView" Text="Ok" CssClass="styleGridShortButton"
                                                                OnClick="btnProspectView_Click" />
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
                                            <td style="padding-left: 5px">
                                                <asp:Button ID="btnGetLOV" runat="server" Text="..." CausesValidation="true" OnClick="btnGetLOV_Click" />
                                            </td>
                                            <td valign="top" style="padding-top: 8px">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <cc1:DropShadowExtender ID="dseCustomer" runat="server" TargetControlID="pnlCustomerView"
                                                            Opacity=".4" Rounded="false" TrackPosition="true" />
                                                        <asp:Image ID="imgCustomer" runat="server" ImageUrl="../Images/search_blue.gif" onclick="fnShowPopup('pnlCustomerView');"
                                                            Style="cursor: pointer" />
                                                        <asp:ImageButton ID="imgProspect" runat="server" ImageUrl="../Images/search_blue.gif"
                                                            Style="cursor: pointer" Visible="false" OnClick="imgProspect_OnClick" />
                                                        <%--onclick="fnShowPopup('pnlProspectView');"--%>
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
                                            <cc1:DropShadowExtender ID="dseLeadDetails" runat="server" TargetControlID="pnlLeadView"
                                                Opacity=".4" Rounded="false" TrackPosition="true" />
                                            <asp:Button ID="btnLeadView" Text="Ok" runat="server" CssClass="styleGridShortButton"
                                                OnClick="btnLeadView_OnClick" Style="display: none;" />
                                            <asp:Panel runat="server" ID="pnlLeadView" Style="display: block; position: absolute"
                                                Width="500px" BackColor="White" Visible="false">
                                                <table width="100%" class="styleMainTable">
                                                    <tr>
                                                        <td class="stylePageHeading" width="100%" colspan="3">
                                                            <asp:Label runat="server" ID="Label3" CssClass="styleDisplayLabel" Text="Lead Details"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" width="30%">
                                                            <asp:Label ID="lblFinanceMode" runat="server" CssClass="styleReqFieldLabel" Text="Finance Mode"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" width="60%">
                                                            <asp:DropDownList ID="ddlFinanceMode" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" style="padding-right: 10px">
                                                            <asp:Button ID="btnLeadOk" Text="Ok" runat="server" CssClass="styleGridShortButton"
                                                                OnClick="btnLeadOk_OnClick" /><%-- OnClientClick="fnShowPopup('pnlLeadView');"--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblLeadSourceType" runat="server" CssClass="styleReqFieldLabel" Text="Lead Source Type"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            <asp:DropDownList ID="ddlLeadSourceType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLeadSourceType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblLeadSource" runat="server" CssClass="styleReqFieldLabel" Text="Lead Source"></asp:Label>&nbsp;
                                                            <uc:FLOV ID="ucLead" runat="server" OnLoadCusotmer="btnLeadSource_OnClick" />
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            
                                                            <asp:TextBox ID="txtLeadSource" runat="server" Width="120px" ReadOnly="true"></asp:TextBox>
                                                            <asp:Button ID="btnGetSource" runat="server" Text="..." CausesValidation="true" OnClick="btnGetSource_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblLocation" runat="server" CssClass="styleReqFieldLabel" Text="Location"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
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
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblAccountStatus" runat="server" CssClass="styleReqFieldLabel" Text="Account Status"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            <asp:DropDownList ID="ddlAccountStatus" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblCusotmerStatus" runat="server" CssClass="styleReqFieldLabel" Text="Customer Status"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            <asp:DropDownList ID="ddlCustomerStatus" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel">
                                                            <asp:Label ID="lblLeadStatus" runat="server" CssClass="styleReqFieldLabel" Text="Lead Status"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            <asp:DropDownList ID="ddlLeadStatus" runat="server">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="styleFieldLabel" valign="top">
                                                            <asp:Label ID="lblLeadInformation" runat="server" Text="Lead Information"></asp:Label>
                                                        </td>
                                                        <td class="styleFieldLabel" colspan="2">
                                                            <asp:TextBox ID="txtLeadInformation" runat="server" TextMode="MultiLine" Width="182px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" width="99%" valign="top">
                                                            <div class="container" style="max-height: 100px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                                                <asp:GridView ID="grvAssets" runat="server" AutoGenerateColumns="False" ShowFooter="true"
                                                                    OnRowDeleting="grvAssets_DeleteClick" OnRowDataBound="grvAssets_RowDataBound"
                                                                    Width="97%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSlNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                <asp:Label ID="lblAssetID" runat="server" Text='<%# Bind("Asset_ID")%>' Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbltxtAsset" runat="server" Text='<%# Bind("Asset_Description")%>'
                                                                                    Width="180px"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:DropDownList ID="ddlLeadAsset" runat="server" Width="180px">
                                                                                </asp:DropDownList>
                                                                                <asp:RequiredFieldValidator ID="rfvAsset" runat="server" ControlToValidate="ddlLeadAsset"
                                                                                    Display="None" ErrorMessage="Select the Asset" ValidationGroup="LeadAdd" InitialValue="0">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Cost">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAssetCost" runat="server" Text='<%# Bind("Asset_Cost")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtAssetCost" runat="server" Style="text-align: right" Width="95px"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvAssetCost" runat="server" ControlToValidate="txtAssetCost"
                                                                                    Display="None" ErrorMessage="Enter the Asset Cost" ValidationGroup="LeadAdd">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Finance Amount">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblFinanceAmount" runat="server" Text='<%# Bind("FinanceAmount")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtFinanceAmount" runat="server" Style="text-align: right" Width="95px"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvFinanceAmount" runat="server" ControlToValidate="txtFinanceAmount"
                                                                                    Display="None" ErrorMessage="Enter the Finance Amount" ValidationGroup="LeadAdd">
                                                                                </asp:RequiredFieldValidator>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                                                    OnClientClick="return confirm('Are you sure want to Delete this record?');" ToolTip="Delete">
                                                                                </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="styleGridShortButton"
                                                                                    OnClick="btnAssetAdd_Click" Text="Add" ValidationGroup="LeadAdd" ToolTip="Add" />
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
                                                            <asp:ValidationSummary ID="vsLeadAsset" runat="server" CssClass="styleMandatoryLabel"
                                                                HeaderText="Correct the following validation(s):" ValidationGroup="LeadAdd" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            <cc1:TabContainer ID="tcCRM" runat="server" CssClass="styleTabPanel" Style="max-width: 520px"
                                                ScrollBars="None" TabStripPlacement="top" ActiveTabIndex="-1" AutoPostBack="True"
                                                OnActiveTabChanged="tcCRM_ActiveTabChanged">
                                                <cc1:TabPanel ID="tpTrackDetails" runat="server" CssClass="tabpan" HeaderText="Track Details"
                                                    Style="border: 0px" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Track Details
                                                    </HeaderTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel1" runat="server" CssClass="tabpan" HeaderText="Document Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Document Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel2" runat="server" CssClass="tabpan" HeaderText="Status Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Status Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel3" runat="server" CssClass="tabpan" HeaderText="Account Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Account Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel4" runat="server" CssClass="tabpan" HeaderText="Group Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Group Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel5" runat="server" CssClass="tabpan" HeaderText="Lead Details"
                                                    Style="border-color: White" BackColor="Red">
                                                    <HeaderTemplate>
                                                        Lead Details
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </cc1:TabContainer>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="styleFieldLabel">
                                        </td>
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
                                    <asp:Label runat="server" Text="Track Details" ID="lblCRMDetail" CssClass="styleDisplayLabel"> </asp:Label>
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
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblQuery" runat="server" Text="Query Type" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlQuery" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQuery_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvddlQuery" CssClass="styleMandatoryLabel"
                                                                        InitialValue="0" ErrorMessage="Select the Query Type" runat="server" ControlToValidate="ddlQuery"
                                                                        ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td class="styleFieldLabel" width="15%">
                                                                    <asp:Label ID="lblDesc" runat="server" Text="Description" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td rowspan="2" width="35%">
                                                                    <asp:TextBox ID="txtDescription" Width="92%" MaxLength="300" onkeyup="maxlengthfortxt(300);"
                                                                        TextMode="MultiLine" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblFromType" runat="server" Text="From Type" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlFrom" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlFrom_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <uc2:LOV ID="ucFrom" runat="server" style="width: 50%" />
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvddlFrom" CssClass="styleMandatoryLabel"
                                                                        InitialValue="0" ErrorMessage="Select the From Type" runat="server" ControlToValidate="ddlFrom"
                                                                        ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblToType" runat="server" Text="To Type" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlTo" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlTo_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <uc2:LOV ID="ucTo" style="width: 75%" runat="server" />
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvddlTo" CssClass="styleMandatoryLabel"
                                                                        InitialValue="0" ErrorMessage="Select the To Type" runat="server" ControlToValidate="ddlTo"
                                                                        ValidationGroup="vgOK" SetFocusOnError="true" Enabled="false"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblNotifyDate" runat="server" Text="Notify Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtNotifyDt" Width="80px" runat="server"></asp:TextBox><asp:Image
                                                                        ID="imgNoDt" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtNotifyDt"
                                                                        OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" PopupButtonID="imgNoDt"
                                                                        ID="ceNotifyDt" Enabled="true">
                                                                    </cc1:CalendarExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblMode" runat="server" Text="Mode" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlMode" runat="server">
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator Display="None" ID="rfvMode" CssClass="styleMandatoryLabel"
                                                                        Enabled="false" InitialValue="0" ErrorMessage="Select the Mode" runat="server"
                                                                        ControlToValidate="ddlMode" ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </td>
                                                                <td class="styleFieldLabel">
                                                                    <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlStatus" Enabled="true" runat="server">
                                                                    </asp:DropDownList>
                                                                    <%--  <asp:RequiredFieldValidator Display="None" ID="rfvStatus" CssClass="styleMandatoryLabel"
                                            InitialValue="0" ErrorMessage="Select the Status" runat="server" ControlToValidate="ddlStatus"
                                            ValidationGroup="vgOK" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="styleFieldLabel" width="15%">
                                                                    <asp:Label ID="lblTicketNo" runat="server" Text="Ticket No" CssClass="styleDisplayLabel"></asp:Label>
                                                                    <asp:HiddenField runat="server" ID="hdnView" />
                                                                    <asp:HiddenField runat="server" ID="hdnTicketNo" />
                                                                </td>
                                                                <td width="35%">
                                                                    <asp:TextBox ID="txtTicketNo" Style="width: 50px" runat="server" ReadOnly="true"></asp:TextBox>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDate" runat="server"
                                                                        Text="Date" CssClass="styleDisplayLabel"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtDate" Style="width: 80px"
                                                                        runat="server" ReadOnly="true"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td align="right" style="padding-right: 10px">
                                                                    <asp:Button runat="server" ID="btnOK" ValidationGroup="vgOK" CssClass="styleGridShortButton"
                                                                        Text="Ok" OnClick="btnOK_Click" />
                                                                    &nbsp;<asp:Button runat="server" ID="btnCan" CssClass="styleGridShortButton" Text="Cancel"
                                                                        OnClick="btnCan_Click" />
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
                                                    <asp:Label ID="lblSTicketNo" runat="server" Text="Ticket Number" CssClass="styleDisplayLabel"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:TextBox ID="txtSTicketNo" runat="server" Width="30px" ToolTip="Ticket NUmber"
                                                        onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right" MaxLength="3"></asp:TextBox><cc1:FilteredTextBoxExtender
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
                                                        Text="Clear" CssClass="styleGridShortButton" CausesValidation="false" OnClick="btnSClear_Click">
                                                    </asp:Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100%">
                                                    <div class="container" style="max-height: 220px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                                        <asp:GridView Width="98%" runat="server" ID="grvFollowUp" AutoGenerateColumns="False"
                                                            OnRowDataBound="grvFollowUp_RowDataBound">
                                                            <Columns>
                                                                <%-- Ticket no  --%>
                                                                <asp:TemplateField HeaderText="Tkt No" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtTicketNo" runat="server" Text='<%# Bind("TicketNo")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- Date  --%>
                                                                <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtDate" runat="server" Text='<%#  FormatDate(Eval("Date").ToString()) %>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="8%" />
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
                                                                <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="150px">
                                                                    <ItemTemplate>
                                                                        <%--<div style="width:160px;height:50px; overflow-x: auto;">--%>
                                                                        <asp:Label ID="txtDescription" Width="150px" runat="server" Text='<%# Bind("Description")%>'></asp:Label><%--</div>--%></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                                </asp:TemplateField>
                                                                <%-- Notify Date  --%>
                                                                <asp:TemplateField HeaderText="Notify Date" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="50px">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtNotifyDate" runat="server" Text='<%# FormatDate(Eval("NotifyDate").ToString()) %>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
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
                                                                            Text="Add" CssClass="styleGridShortButton" CausesValidation="false" OnClick="btnAdd_Click">
                                                                        </asp:Button>
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
                                                        <asp:Label ID="lblDocument" runat="server" CssClass="styleReqFieldLabel" Text="Document [Mandatory]"></asp:Label>
                                                    </td>
                                                    <td width="30%">
                                                        <asp:DropDownList ID="ddlDocument" runat="server" Style="width: 70%">
                                                        </asp:DropDownList>
                                                        <asp:CheckBox runat="server" ID="chkIsMandatory" Checked="true" TextAlign="Left"
                                                            Enabled="false" />
                                                        <asp:RequiredFieldValidator Display="None" ID="rfvddlDocument" CssClass="styleMandatoryLabel"
                                                            InitialValue="-1" ErrorMessage="Select the Document" runat="server" ControlToValidate="ddlDocument"
                                                            ValidationGroup="vgAddDoc" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator Display="None" ID="rfvddlDocument1" CssClass="styleMandatoryLabel"
                                                            ErrorMessage="Select the Document" runat="server" ControlToValidate="ddlDocument"
                                                            ValidationGroup="vgAddDoc" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblCollectedBy" runat="server" Text="Collected By"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlCollectedBy" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblcollectedDate" runat="server" Text="Collected Date"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCollectedDate" Width="80px" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:Image
                                                            ID="imgtxtCollectedDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
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
                                                        <asp:DropDownList ID="ddlScannedBy" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblScannedDate" runat="server" Text="Scanned Date"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtscannedDate" Width="80px" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:Image
                                                            ID="imgtxtscannedDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                        <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtscannedDate"
                                                            PopupButtonID="imgtxtscannedDate" ID="cetxtscannedDate" Enabled="true">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" rowspan="2" valign="top">
                                                        <asp:Label ID="lblDocRemarks" runat="server" Text="Remarks"></asp:Label>
                                                    </td>
                                                    <td rowspan="2" valign="top">
                                                        <asp:TextBox ID="txtDocRemarks" Width="70%" MaxLength="300" onkeyup="maxlengthfortxt(300);"
                                                            TextMode="MultiLine" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel" valign="top">
                                                        <asp:Label ID="lblUploadFile" runat="server" Text="File Upload"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="tempUpdate" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Label ID="lblActualPath" runat="server" Visible="false"></asp:Label>
                                                                <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                                                <asp:Button ID="btnBrowse" runat="server" OnClick="btnBrowse_OnClick" Style="display: none">
                                                                </asp:Button>
                                                                <table align="left" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td style="padding: 0px">
                                                                            <asp:CheckBox ID="chkSelect" runat="server" Text="" Width="20px" Enabled="false" />
                                                                        </td>
                                                                        <td style="padding: 0px">
                                                                            <asp:FileUpload runat="server" ID="flUpload" Width="0px" ToolTip="Upload File" />
                                                                            <asp:Button CssClass="styleGridShortButton" ID="btnDlg" runat="server" Text="Browse"
                                                                                Style="display: none" CausesValidation="false"></asp:Button>
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
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel" valign="top">
                                                        <asp:Label ID="lblCurrentPath" runat="server" Style="position: absolute; color: Green;
                                                            vertical-align: top" />
                                                    </td>
                                                    <td align="right">
                                                        <asp:Button runat="server" ID="btnDocAdd" ValidationGroup="vgAddDoc" CssClass="styleGridShortButton"
                                                            Text="Add" OnClick="btnDocAdd_Click" OnClientClick="return fnCheckPageValidators('vgAddDoc', false);" />
                                                        <asp:Button runat="server" ID="btnDocClear" CssClass="styleGridShortButton" Text="Clear"
                                                            OnClick="btnDocClear_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <asp:ValidationSummary runat="server" ID="ValidationSummary2" HeaderText="Correct the following validation(s):"
                                                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="vgAddDoc" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        <div class="container" style="max-height: 200px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                            <asp:GridView ID="gvPRDDT" runat="server" AutoGenerateColumns="False" Width="98%"
                                                BorderColor="Gray" DataKeyNames="Doc_Cat_ID" CssClass="styleInfoLabel" Visible="true"
                                                OnRowDataBound="gvPRDDT_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="PRDDC TypeId" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPRTID" runat="server" Text='<%# Bind("Doc_Cat_ID") %>'></asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PRDDC Description" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("Doc_Description") %>'></asp:Label></ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
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
                                                            <asp:Label ID="lblScannedBy" runat="server" Text='<%# Bind("Scanned_By") %>'></asp:Label></ItemTemplate>
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
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlStatus" runat="server" Width="99%" Visible="false" CssClass="stylePanel"
                                        Style="overflow: hidden">
                                        <div class="container" style="height: 200px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                            <asp:GridView runat="server" ID="grvAssetDetails" AutoGenerateColumns="False" Width="100%">
                                                <Columns>
                                                    <%-- PrimeAccountNo  --%>
                                                    <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txtPrimeAccountNo" runat="server" Text='<%# Bind("PANum")%>'></asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                    </asp:TemplateField>
                                                    <%-- SubAccountNo  --%>
                                                    <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txtSubAccountNo" runat="server" Text='<%# Bind("SANum")%>'></asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                    </asp:TemplateField>
                                                    <%-- Asset Sno/ Vehicle Regn No  --%>
                                                    <asp:TemplateField HeaderText="Asset Sno/ Vehicle Regn No" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txtAssetSnoReg" runat="server" Text='<%# Bind("AssetSnoReg")%>'></asp:Label></ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="43%" />
                                                    </asp:TemplateField>
                                                    <%-- Status  --%>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="txtStatus" runat="server" Text='<%# Bind("Status")%>'></asp:Label></ItemTemplate>
                                                        <ItemStyle Width="15%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <RowStyle HorizontalAlign="Center" />
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlAccount" runat="server" Width="99%" Visible="false" CssClass="stylePanel"
                                        Style="overflow: hidden">
                                        <table style="width: 100%" class="styleMainTable">
                                            <tr>
                                                <td align="center">
                                                    <div class="container" style="height: 200px; width: 100%; overflow-y: auto; overflow-x: hidden;">
                                                        <asp:GridView ID="grvMain" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvMain_RowDataBound"
                                                            Width="100%">
                                                            <Columns>
                                                                <%-- LOB  --%>
                                                                <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLob" runat="server" Text='<%# Bind("LOB")%>'></asp:Label><asp:Label
                                                                            ID="txtLobId" runat="server" Text='<%# Bind("LOB_ID")%>' Visible="false"></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                                                                </asp:TemplateField>
                                                                <%-- Branch  --%>
                                                                <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtBranch" runat="server" Text='<%# Bind("Location")%>'></asp:Label><asp:HiddenField
                                                                            ID="hidIsColor" runat="server" Value='<%# Bind("IsColor")%>' />
                                                                        <asp:Label ID="txtBranchId" runat="server" Text='<%# Bind("Location_Id")%>' Visible="false"></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                                </asp:TemplateField>
                                                                <%-- PrimeAccountNo  --%>
                                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtPrimeAccountNo" runat="server" Text='<%# Bind("PANum")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                                </asp:TemplateField>
                                                                <%-- SubAccountNo  --%>
                                                                <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtSubAccountNo" runat="server" Text='<%# Bind("SANum")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="21%" />
                                                                </asp:TemplateField>
                                                                <%-- Select  --%>
                                                                <asp:TemplateField HeaderText="Select" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="false" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleInfoLabel" HorizontalAlign="Center" />
                                                            <RowStyle HorizontalAlign="Center" />
                                                            <EmptyDataTemplate>
                                                                <span>No Records Found...</span></EmptyDataTemplate>
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
                                                                        <asp:HiddenField ID="hidBranch" runat="server" Value='<%# Bind("Location_ID")%>'>
                                                                        </asp:HiddenField>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- PANum  --%>
                                                                <asp:TemplateField HeaderText="Prime Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtPANum" runat="server" Text='<%# Bind("PANum")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- SANum  --%>
                                                                <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtSANum" runat="server" Text='<%# Bind("SANum")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Begin Date  --%>
                                                                <asp:TemplateField HeaderText="Begin Date" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtBeginDate" runat="server" Text='<%# Bind("Creation_Date")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- MatureDate   --%>
                                                                <asp:TemplateField HeaderText="Maturity Date" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtMatureDate" runat="server" Text='<%# Bind("MatureDate")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                                </asp:TemplateField>
                                                                <%-- Finance Amount   --%>
                                                                <asp:TemplateField HeaderText="Finance Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtFinanceAmount" runat="server" Text='<%# Bind("Finance_Amount")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- UMFC   --%>
                                                                <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtUMFC" runat="server" Text='<%# Bind("UMFC")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Billed Amount   --%>
                                                                <asp:TemplateField HeaderText="Billed Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="txtBilledAmount" runat="server" Text='<%# Bind("BilledAmount")%>'
                                                                            OnClick="txtBilledAmount_Click"></asp:LinkButton><%--<cc1:PopupControlExtender ID="PopExBillAmt" runat="server" TargetControlID="txtBilledAmount"
                                                    PopupControlID="pnlNOD" Position="Bottom" />--%></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Collected Amount   --%>
                                                                <asp:TemplateField HeaderText="Collected Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="txtCollectedAmount" runat="server" Text='<%# Bind("CollectedAmount")%>'
                                                                            OnClick="txtCollectedAmount_Click"></asp:LinkButton><%--<cc1:PopupControlExtender ID="PopExColAmt" runat="server" TargetControlID="txtCollectedAmount"
                                                    PopupControlID="pnlNOD" Position="Bottom" />--%></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- NOD   --%>
                                                                <asp:TemplateField HeaderText="NOD" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtNOD" runat="server" Text='<%# Bind("NOD")%>'></asp:Label><asp:LinkButton
                                                                            ID="lnkNOD" runat="server" Text='<%# Bind("NOD")%>' OnClick="lnkNOD_Click"></asp:LinkButton><%-- <cc1:PopupControlExtender ID="PopEx" runat="server" TargetControlID="lnkNOD" PopupControlID="pnlNOD"
                                                    Position="Bottom" />--%></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" Width="3%" />
                                                                </asp:TemplateField>
                                                                <%-- O/S Amount   --%>
                                                                <asp:TemplateField HeaderText="O/S Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtOSAmount" runat="server" Text='<%# Bind("OSAmount")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Future Principal   --%>
                                                                <asp:TemplateField HeaderText="Future Principal" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtFuturePrincipal" runat="server" Text='<%# Bind("FuturePrincipal")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- LTV Amount   --%>
                                                                <asp:TemplateField HeaderText="LTV Amount" ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtLTVAmount" runat="server" Text='<%# Bind("LTVAmount")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- Category Status   --%>
                                                                <asp:TemplateField HeaderText=" Category Status" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtCategoryStatus" runat="server" Text='<%# Bind("CategoryStatus")%>'></asp:Label></ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                                </asp:TemplateField>
                                                                <%-- DC   --%>
                                                                <asp:TemplateField HeaderText="DC" ItemStyle-HorizontalAlign="Left">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="txtDC" runat="server" Text='<%# Bind("DC")%>'></asp:Label></ItemTemplate>
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
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    </td>
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
                            OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';return fnCheckPageValidators('vgSave');"
                            ValidationGroup="vgSave" OnClick="btnSave_Click" />
                        &nbsp;<asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton"
                            Text="Clear" OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';return fnConfirmClear();"
                            OnClick="btnClear_Click" />
                        &nbsp;<asp:Button OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
                            runat="server" ID="btnCancel" Text="Cancel" ValidationGroup="VGODI" CausesValidation="false"
                            CssClass="styleSubmitButton" Height="26px" OnClick="btnCancel_Click" />
                        <asp:RequiredFieldValidator ID="rfvddlType" runat="server" ControlToValidate="ddlType"
                            ErrorMessage="Select at least one query type" CssClass="styleMandatoryLabel"
                            Display="None" InitialValue="0" SetFocusOnError="True" ValidationGroup="vgSave"></asp:RequiredFieldValidator><asp:RequiredFieldValidator
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
                                    <td align="center">
                                        &nbsp;<asp:Button runat="server" ID="Button3" OnClientClick="if(document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow'))document.getElementById('ctl00_ContentPlaceHolder1_ucPopUp_hdnShow').value='0';"
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
            </td>
        </tr>
    </table>
</asp:Content>
