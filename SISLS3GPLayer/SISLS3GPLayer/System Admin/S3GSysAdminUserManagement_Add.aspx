<%@ Page Title="S3G - User Management" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="S3GSysAdminUserManagement_Add.aspx.cs" Inherits="S3GSysAdminUserManagement_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function Common_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnFuncitonID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Common_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnFuncitonID.ClientID %>');
            hdnCommonID.value = '';
        }
        function Check_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //If checked change color to Aqua
                row.style.backgroundColor = "aqua";
            }
            else {
                //If not checked change back to original color
                if (row.rowIndex % 2 == 0) {
                    //Alternating Row Color
                    row.style.backgroundColor = "#C2D69B";
                }
                else {
                    row.style.backgroundColor = "white";
                }
            }

            //Get the reference of GridView
            var GridView = row.parentNode;

            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];
                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }
        function checkAll(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        row.style.backgroundColor = "aqua";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original
                        if (row.rowIndex % 2 == 0) {
                            //Alternating Row Color
                            row.style.backgroundColor = "#C2D69B";
                        }
                        else {
                            row.style.backgroundColor = "white";
                        }
                        inputList[i].checked = false;
                    }
                }
            }
        }

        function checkActAll(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        row.style.backgroundColor = "aqua";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original
                        if (row.rowIndex % 2 == 0) {
                            //Alternating Row Color
                            row.style.backgroundColor = "#C2D69B";
                        }
                        else {
                            row.style.backgroundColor = "white";
                        }
                        inputList[i].checked = false;
                    }
                }
            }
        }

        function PageLoadTabContSetFocus() {
            var TC = $find("<%=tcUserMgmt.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=txtUserCode.ClientID %>").focus();
            }
        }

        //function pageLoad() {
        //    PageLoadTabContSetFocus();
        //}
        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {
            PageLoadTabContSetFocus();
            tab = $find('ctl00_ContentPlaceHolder1_tcUserMgmt');
            querymode = location.search.split("qsMode=");
            querymode = querymode[1];
            if (querymode != 'Q' && tab != null) {
                tab.add_activeTabChanged(on_Change);
            }
        }

        function on_Change(sender, e) {
            var TC = $find("<%=tcUserMgmt.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() != 0) {
                fnMoveNextTab('Tab');
            }
            else {
                tab.set_activeTabIndex(0);;
                btnActive_index = 0;
                return;
            }
        }
        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {
            tab = $find('ctl00_ContentPlaceHolder1_tcUserMgmt');
            //alert('fnMoveNextTab');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;
            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    //tab.set_activeTabIndex(index);
                }
                else {
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
                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                //Focus Start
                var TC = $find("<%=tcUserMgmt.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=txtUserCode.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=ddlAction.ClientID %>").focus();
                }
                //Focus End
            }
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

    </script>
    <script language="javascript" type="text/javascript">
        var bResult;

        function funsetsavetext(iLevel) {

            if (iLevel >= 0) {
                document.getElementById('<%=btnSave.ClientID%>').innerText = 'Delete';
            }
            else {
                document.getElementById('<%=btnSave.ClientID%>').innerText = 'Save';
            }
        }


        function fnDisableReportingLevel() {

            var iLevel = document.getElementById('<%=ddlLevel.ClientID%>').options.value;

            if (iLevel == "4" || iLevel == "5") {

                document.getElementById('ctl00_ContentPlaceHolder1_tcUserMgmt_tbUserMgmt_ddlReportingLevel_rfvMultiSuggest').enabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_tcUserMgmt_tbUserMgmt_ddlHigherLevel_rfvMultiSuggest').enabled = false;

            }
            else {
                document.getElementById('ctl00_ContentPlaceHolder1_tcUserMgmt_tbUserMgmt_ddlReportingLevel_rfvMultiSuggest').enabled = false;
                document.getElementById('ctl00_ContentPlaceHolder1_tcUserMgmt_tbUserMgmt_ddlHigherLevel_rfvMultiSuggest').enabled = false;
            }
        }


        function fnEnablePwd() {
            if (document.getElementById('<%=chkResetPwd.ClientID%>').checked) {
                document.getElementById('<%=txtPassword.ClientID%>').disabled = false;
                document.getElementById('<%=txtPassword.ClientID%>').value = '';
                document.getElementById('<%=txtPassword.ClientID%>').focus();
            }
            else {
                document.getElementById('<%=txtPassword.ClientID%>').disabled = true;
                document.getElementById('<%=txtPassword.ClientID%>').value = '*************';

            }
        }

        function fnCheckPageValidation() {
            if (!fnCheckPageValidators())
                return false;

            if (bResult) {
                bResult = fnIsCheckboxChecked('<%=grvRoleCode.ClientID%>', 'chkSelRoleCode', 'Role Code from role mapping');
            }
            return bResult;

        }

        function fnRemoveLOBMap() {

            if (document.getElementById('<%=ddlLOBMapping.ClientID%>').options.selectedIndex == 0) {
                alert('Please select Line of Business');
                return false;
            }

            if (!confirm('Are you sure want to delete?')) {
                return false;
            }


            return true;
        }

        function fnDisableLOBOtherCheckBoxes(objid) {

        }

        function postBackByObject() {
            var o = window.event.srcElement;
            if (o.tagName == "INPUT" && o.type == "checkbox") {
                __doPostBack("", "");
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
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
                    <div class="col">
                        <cc1:TabContainer ID="tcUserMgmt" runat="server" CssClass="styleTabPanel" Width="99%"
                            ScrollBars="Auto" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" HeaderText="Basic Details" ID="tbUserMgmt" CssClass="tabpan" ToolTip="User Management Detail, Alt+U"
                                BackColor="Red">
                                <HeaderTemplate>
                                    User Management
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtUserCode" runat="server" MaxLength="15"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvUserCode" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="txtUserCode" ErrorMessage="Enter the User Code" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" Text="User Code" ID="lblUserCode" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:CheckBox runat="server" AutoPostBack="True" ID="chkCopyProfile" OnCheckedChanged="chkCopyProfile_CheckedChanged"
                                                                        Text=" " />
                                                                    <asp:Label runat="server" ID="lblcpyProfile" CssClass="styleFieldLabel"
                                                                        Text="Copy Profile"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <uc2:Suggest ID="ddlCopyProfile" AutoPostBack="true" runat="server" ServiceMethod="GetUsers" OnItem_Selected="ddlCopyProfile_OnSelectedIndexChanged"
                                                                        IsMandatory="false" class="md-form-control form-control"
                                                                        ValidationGroup="save" ErrorMessage="Enter the 'Copy Profile'" />
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUserCode"
                                                                        FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblCopyProfile" CssClass="styleFieldLabel"
                                                                            Text="Copy Profile"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="50"
                                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                                        Style="background-image: url('');"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender
                                                                        ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtUserName" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                                        ValidChars=" " Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvUserName" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Enter the User Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="User Name" ID="lblUserName" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_ShortName" runat="server" MaxLength="15"
                                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                                        Style="background-image: url('');"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender
                                                                        ID="fteShortName" runat="server" TargetControlID="txt_ShortName" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                                        ValidChars=" " Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvtxt_ShortName" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="txt_ShortName" Display="Dynamic" ErrorMessage="Enter Short Name" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Short Name" ID="Label5" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:Panel ID="Pnl_Password" runat="server" BorderWidth="1" CssClass="styleRecordCount" Style="display: none" Visible="false">
                                                                        <asp:Label ID="lblPWDString" runat="server" Text="Should contain atleast one UPPER case,one lower case and a number or a special
                                                                                    character"
                                                                            Visible="false" />
                                                                    </asp:Panel>
                                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="15"
                                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                                        ToolTip="Should contain atleast one UPPER case,one lower case and a number or a special character"></asp:TextBox>

                                                                    <%--   <span class="styleMandatoryNotes"></span>--%>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Password" ID="lblPassword" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvPassword" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                            runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Enter the Password" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divReset" style="display: none" runat="server">
                                                                <div class="md-input">
                                                                    <asp:CheckBox runat="server" ID="chkResetPwd"
                                                                        Text=" " OnClick="fnEnablePwd();" />
                                                                    <%-- <asp:Label runat="server" ID="Label5" CssClass="styleFieldLabel"
                                                                                Text="Copy Profile"></asp:Label>--%>
                                                                    <%--  <input type="checkbox" id="chkResetPwd" runat="server" onclick="fnEnablePwd();" />--%>
                                                                    <asp:Label runat="server" Text="Reset Password" ID="Label4" CssClass="styleFieldLabel"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="fteMobileNo" runat="server" TargetControlID="txtMobileNo"
                                                                        FilterType="Numbers" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Mobile Number" ID="lblMobile"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEMailId" runat="server" MaxLength="60" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtEMailId"
                                                                            Display="Dynamic" ErrorMessage="Enter a valid Email Id" CssClass="validation_msg_box_sapn" SetFocusOnError="true"
                                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="save"></asp:RegularExpressionValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="EMail Id" ID="lblEmail"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDateofJoining" ToolTip="Date of Joining should be greater than the Date of Incorporation of the company"
                                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                                        Style="background-image: url('');" runat="server"></asp:TextBox>&nbsp;
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvDateofJoining" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                                    runat="server" ControlToValidate="txtDateofJoining" Display="Dynamic" ErrorMessage="Enter the Date of Joining" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                    <asp:Panel ID="pnl_Date" runat="server" BorderWidth="1" CssClass="styleRecordCount" Style="display: none"
                                                                        Width="40%" Visible="false">
                                                                        <asp:Label ID="Label3" runat="server" Visible="false" Text="Date of Joining should be greater than the Date of Incorporation of the company" />
                                                                    </asp:Panel>
                                                                    <%--  <cc1:HoverMenuExtender ID="HoverMenuExtender3" TargetControlID="txtDateofJoining"
                                                                                runat="server" PopupControlID="pnl_Date" PopupPosition="Right" PopDelay="50" />--%>
                                                                    <cc1:CalendarExtender
                                                                        runat="server" Format="dd/MM/yyyy" TargetControlID="txtDateofJoining" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                        PopupButtonID="imgDateofJoining" ID="CalendarExtender1" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Date of Joining" ID="lblDateofJoining" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDOR" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                        Style="background-image: url('');"></asp:TextBox>&nbsp;
                                                      <%--  <asp:Image ID="imgDOR" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                    <cc1:CalendarExtender
                                                                        runat="server" Format="dd/MM/yyyy" TargetControlID="txtDOR" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                        PopupButtonID="imgDOR" ID="calcDOR" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Date of Resigned" ID="Label2" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>

                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="txtDesignation" runat="server" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" Text="Designation" ID="lblDesignation" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvDesignation" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                            runat="server" Display="Dynamic" InitialValue="0" ControlToValidate="txtDesignation"
                                                                            ErrorMessage="Select the Designation" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlLevel" runat="server" onchange="fnDisableReportingLevel();" class="md-form-control form-control">
                                                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                                        <asp:ListItem Text="Staff level" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Officer level" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Manager" Value="3"></asp:ListItem>
                                                                        <asp:ListItem Text="Top Management" Value="4"></asp:ListItem>
                                                                        <asp:ListItem Text="System Admin" Value="5"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblLevel" runat="server" CssClass="styleReqFieldLabel" Text="User Level"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvLevel" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                            runat="server" InitialValue="-1" Display="Dynamic" ControlToValidate="ddlLevel"
                                                                            ErrorMessage="Select the User Level" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%-- </div>
                                                                <div class="row">--%>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <uc2:Suggest ID="ddlReportingLevel" runat="server" ServiceMethod="GetUsers" IsMandatory="true"
                                                                        ValidationGroup="save" ErrorMessage="Enter the Reporting - Next Level" class="md-form-control form-control" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblReportingLevel" runat="server" CssClass="styleFieldLabel" Text="Reporting - Next Level"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <uc2:Suggest ID="ddlHigherLevel" runat="server" ServiceMethod="GetUsers" IsMandatory="true"
                                                                        ValidationGroup="save" ErrorMessage="Enter the Higher Level" class="md-form-control form-control" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblHigherLevel" runat="server" CssClass="styleFieldLabel" Text="Higher Level"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch"></asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Branch" ID="lblLocation" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvddlBranchList" runat="server" ControlToValidate="ddlBranch"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                            ErrorMessage="Select a Branch" ValidationGroup="save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlUserDepartment" runat="server" ToolTip="Department"></asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Department" ID="lblDepartment" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvUserDepartment" runat="server" ControlToValidate="ddlUserDepartment"
                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                            ErrorMessage="Select a Department" ValidationGroup="save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvGroup" runat="server" visible="false">
                                                                <div class="md-input">
                                                                    <asp:Panel ID="pnlGroup" runat="server" CssClass="stylePanel" GroupingText="User Group">
                                                                        <div style="overflow: auto;">
                                                                            <asp:GridView ID="grvGroup" runat="server" AutoGenerateColumns="False"
                                                                                class="gird_details" ShowFooter="false" Width="100%">
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="S_NO" HeaderText="S.No." HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                                                                                    <asp:BoundField DataField="GROUP_NAME" HeaderText="User Group Name" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                                                                                </Columns>
                                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                                <RowStyle HorizontalAlign="Center" />
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                            <div id="divFAS" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12" visible="false">
                                                                <div class="md-input">
                                                                    <asp:Label runat="server" Text="Copy To FAS" ID="lblFAS" Visible="false"></asp:Label>
                                                                    <asp:CheckBox ID="chkIsFAS" runat="server" Visible="false" />
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:Label runat="server" Text="Active" ID="lblActive"></asp:Label>
                                                                    <asp:CheckBox ID="chkActive" Checked="True" runat="server" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div class="md-input">
                                                                            <asp:Panel GroupingText="User Address" ID="pnlCommAddress" runat="server" Width="100%"
                                                                                CssClass="stylePanel" Visible="false">
                                                                                <uc1:AddSetup ID="ucBasicDetAddressSetup" runat="server" />
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <%--<Triggers>
                                            <asp:PostBackTrigger ControlID="ddlCopyProfile" />
                                        </Triggers>--%>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Access" ID="tbBranchAccess" CssClass="tabpan"
                                BackColor="Red" ToolTip="User Access, Alt+A">
                                <HeaderTemplate>
                                    Access
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div id="divAction" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                                                                <div class="col-md-6 md-input">
                                                                    <asp:DropDownList ID="ddlAction" runat="server" CssClass="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAction_SelectedIndexChanged">
                                                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="0">Deletion</asp:ListItem>
                                                                        <asp:ListItem Value="1">Modification</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Action" ID="lblAction" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVddlAction" runat="server" ValidationGroup="save"
                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Action"
                                                                            InitialValue="-1" ControlToValidate="ddlAction" Enabled="false" SetFocusOnError="true" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 md-input">
                                                                    <asp:DropDownList ID="ddlModification" Visible="false" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlModification_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="2">Access Modification</asp:ListItem>
                                                                        <asp:ListItem Value="3">User Details</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:DropDownList ID="ddldeletion" Visible="false" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddldeletion_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                                        <asp:ListItem Value="0">Line of Business</asp:ListItem>
                                                                        <asp:ListItem Value="1">Locations</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblDelMod" runat="server" CssClass="styleReqFieldLabel" Visible="false" />
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="RFVddlModification" runat="server" ValidationGroup="save"
                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Modification"
                                                                            InitialValue="-1" ControlToValidate="ddlModification" SetFocusOnError="true" />
                                                                        <asp:RequiredFieldValidator ID="RFVddldeletion" runat="server" ValidationGroup="save"
                                                                            Display="Dynamic" CssClass="validation_msg_box_sapn" ErrorMessage="Select the Deletion"
                                                                            InitialValue="-1" ControlToValidate="ddldeletion" SetFocusOnError="true" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" runat="server" id="dvLblMsg" visible="false">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                                                        <div class="row">
                                                            <asp:Label ID="lblShowMessage" runat="server" Style="color: red;" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                                                        <div class="row">
                                                            <div class="col-md-6 md-input">
                                                                <asp:Panel ID="pnlLobList" runat="server" CssClass="stylePanel" GroupingText="Line Of Business">
                                                                    <div style="overflow: auto; height: 200px">
                                                                        <asp:GridView ID="GrvLOBList" runat="server" OnRowDataBound="GrvLOBList_RowDataBound" AutoGenerateColumns="False"
                                                                            class="gird_details" Width="100%">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line Of Business">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblLOB_Name" runat="server" Text='<%#Eval("LOB_NAME")%>'></asp:Label>
                                                                                        <asp:Label ID="lblLOB_ID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <asp:CheckBox ID="chkLOBAll" runat="server" AutoPostBack="true" OnCheckedChanged="chkLOBAll_CheckedChanged" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkLOB" runat="server" AutoPostBack="true" OnCheckedChanged="chkLOB_OnCheckedChanged" />
                                                                                        <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                        <asp:GridView ID="grdActivity" runat="server" OnRowDataBound="grdActivity_RowDataBound" AutoGenerateColumns="False"
                                                                            class="gird_details" Width="100%" ShowHeader="false">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblActivity_Name" runat="server" Text='<%#Eval("Activity_NAME")%>'></asp:Label>
                                                                                        <asp:Label ID="lblActivity_ID" runat="server" Visible="false" Text='<%#Eval("Activity_ID")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <asp:CheckBox ID="chkActivityAll" runat="server" AutoPostBack="true" OnCheckedChanged="Activity_CheckedChanged" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkActivityLOB" runat="server" AutoPostBack="true" OnCheckedChanged="chkActivity_OnCheckedChanged" />
                                                                                        <asp:Label ID="lblActivityAssigned" runat="server" Visible="false" Text='<%#Eval("ActivityAssigned")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-md-6 md-input">
                                                                <asp:Panel ID="pnlFARoles" runat="server" CssClass="stylePanel" GroupingText="FA/Treasuray Role code">
                                                                    <div style="overflow: auto; height: 300px">
                                                                        <asp:GridView ID="grvActRoleCode" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvActRoleCode_RowDataBound" class="gird_details">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Role Code">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblActRoleCode" runat="server" Text='<%#Eval("Role_Code")%>'></asp:Label><asp:Label
                                                                                            ID="lblActRoleCenterID" runat="server" Visible="false" Text='<%#Eval("Role_Code_ID")%>'></asp:Label><asp:Label
                                                                                                ID="lblActAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="ProgramDesc" HeaderText="Program Description" />
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Access">
                                                                                    <HeaderTemplate>
                                                                                        <table>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td colspan="4" align="center">Access
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="center">Add</td>
                                                                                                    <td align="center">Modify</td>
                                                                                                    <td align="center">Delete</td>
                                                                                                    <td align="center">View</td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="chkActAdd" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsAdd")) %>' ToolTip="Add" /></td>
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="chkActModify" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsModify")) %>' ToolTip="Modify" /></td>
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="chkActDelete" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsDelete")) %>' ToolTip="Delete" /></td>
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="chkActView" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsView")) %>' ToolTip="View" /></td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <table>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td>Select All
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr align="center">
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="chkActAll" runat="server" onclick="checkActAll(this);" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table>
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <td></td>
                                                                                                </tr>
                                                                                                <tr align="left">
                                                                                                    <td>
                                                                                                        <asp:CheckBox ID="chkActSelRoleCode" runat="server" AutoPostBack="true" OnCheckedChanged="chkActSelRoleCode_CheckedChanged" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                            <div runat="server" visible="false">
                                                                <asp:CheckBox ID="chkCopyLobprofile" Enabled="false" runat="server" AutoPostBack="true"
                                                                    OnCheckedChanged="chkCopyLobprofile_OnCheckedChanged" />
                                                                <asp:Label runat="server" Text="Copy Profile From" ID="lblLOBCpyProfile" CssClass="styleDisplayLabel">
                                                                </asp:Label>
                                                                <asp:DropDownList ID="ddlCopyLOb" runat="server" Enabled="false" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlCopyLOb_OnSelectedIndexChanged" CssClass="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVCopyLOb" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                        runat="server" Enabled="false" InitialValue="0" Display="Dynamic" ControlToValidate="ddlCopyLOb"
                                                                        ErrorMessage="Select the 'Copy Profile From'" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 md-input">
                                                        <asp:Panel ID="pnlLocation" runat="server" CssClass="stylePanel" GroupingText="Location">
                                                            <div style="overflow: auto; height: 300px">
                                                                <asp:TreeView ID="treeview" runat="server" ImageSet="Simple" ShowCheckBoxes="Parent,Leaf"
                                                                    ShowLines="True" OnPreRender="treeview_PreRender" DataSourceID="XmlDataSource1"
                                                                    OnTreeNodeCheckChanged="treeview_OnTreeNodeCheckChanged" RootNodeStyle-ForeColor="#003d9e"
                                                                    LeafNodeStyle-ForeColor="#003d9e" ParentNodeStyle-ForeColor="#003d9e" SelectedNodeStyle-BackColor="#99CCFF"
                                                                    RootNodeStyle-Font-Size="14px" LeafNodeStyle-Font-Size="14px" ParentNodeStyle-Font-Size="14px">
                                                                    <DataBindings>
                                                                        <asp:TreeNodeBinding DataMember="MenuItem" TextField="title" ToolTipField="title"
                                                                            ValueField="Location_ID" SelectAction="Expand" />
                                                                    </DataBindings>
                                                                </asp:TreeView>
                                                                &nbsp;
                                                                        <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/TransformXSLT.xsl"
                                                                            EnableCaching="False"></asp:XmlDataSource>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="col-md-6 md-input">
                                                        <asp:Panel ID="PnlRoleCode" runat="server" CssClass="stylePanel" GroupingText="Role code">
                                                            <div style="overflow: auto; height: 300px">
                                                                <asp:GridView ID="grvRoleCode" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvRoleCode_RowDataBound" class="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Role Code">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRoleCode" runat="server" Text='<%#Eval("Role_Code")%>'></asp:Label><asp:Label
                                                                                    ID="lblRoleCenterID" runat="server" Visible="false" Text='<%#Eval("Role_Code_ID")%>'></asp:Label><asp:Label
                                                                                        ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="ProgramDesc" HeaderText="Program Description" />
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Access">
                                                                            <HeaderTemplate>
                                                                                <table>
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td colspan="4" align="center">Access
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center">Add</td>
                                                                                            <td align="center">Modify</td>
                                                                                            <td align="center">Delete</td>
                                                                                            <td align="center">View</td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <table>
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkAdd" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsAdd")) %>' ToolTip="Add" /></td>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkModify" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsModify")) %>' ToolTip="Modify" /></td>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkDelete" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsDelete")) %>' ToolTip="Delete" /></td>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkView" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsView")) %>' ToolTip="View" /></td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField>
                                                                            <HeaderTemplate>
                                                                                <table>
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td>Select All
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr align="center">
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkAll" runat="server" onclick="checkAll(this);" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                </table>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <table>
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <td></td>
                                                                                        </tr>
                                                                                        <tr align="left">
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkSelRoleCode" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelRoleCode_CheckedChanged" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </thead>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                    <RowStyle HorizontalAlign="Center" />
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                                                        <asp:Panel GroupingText="User Function Filter" ToolTip="User Function Filter" Width="100%"
                                                            ID="pnlUsers" runat="server" CssClass="stylePanel">
                                                            <asp:HiddenField ID="hdnFuncitonID" runat="server" />
                                                            <asp:GridView runat="server" ShowFooter="true"
                                                                OnRowCommand="grvFunctions_RowCommand"
                                                                ID="grvFunctions" Width="99%" OnRowDeleting="grvFunctions_RowDeleting"
                                                                AutoGenerateColumns="False" OnRowDataBound="grvFunctions_RowDataBound">
                                                                <Columns>
                                                                    <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Function Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblFUNCTION_NAME" Text='<%#Eval("FUNCTION_NAME")%>'></asp:Label>
                                                                            <asp:Label runat="server" ID="lblFUNCTION_ID" Text='<%#Eval("FUNCTION_ID")%>' Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <uc2:Suggest ID="txtFFunctionName" AutoPostBack="true" runat="server" ServiceMethod="GetFunctionList"
                                                                                    IsMandatory="false" class="md-form-control form-control" />
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                                                OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove the Details, Alt+D" AccessKey="D">
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="AddNew"
                                                                                CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Alt+T" AccessKey="T"></asp:Button>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                <RowStyle HorizontalAlign="left" />
                                                            </asp:GridView>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
                <div class="row">
                    <div id="trLOBMapping" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label runat="server" Text="Line of Business" ID="Label1" CssClass="styleFieldLabel"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlLOBMapping">
                        </asp:DropDownList>
                        <asp:Button runat="server" ID="btnRemoveLOB" CssClass="styleSubmitButton" Text="Delete LOB Mapping" AccessKey="D" ToolTip="Delete LOB Mapping,Alt+D"
                            OnClientClick="return fnRemoveLOBMap();" OnClick="btnRemoveLOBMapping_Click" />
                    </div>
                </div>
                <div class="row" style="display: none">
                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row" style="float: right; margin-top: 5px;">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-left: 10px;">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                    type="button" accesskey="S">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                </button>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-left: 10px;">
                                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                    type="button" accesskey="L">
                                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                </button>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="margin-left: 10px;">
                                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                    type="button" accesskey="X">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Please correct the following validation(s):"
                            CssClass="styleSummaryStyle" Width="500px" ShowMessageBox="false" ShowSummary="true" />
                    </div>
                </div>
                <div class="row">
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                </div>
                <div class="row" style="display: none">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:CustomValidator ID="CVUsermanagement" runat="server" Display="None" ValidationGroup="save"></asp:CustomValidator>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnRegionVal" value="0" />
            <input type="hidden" id="hdnLOBPresent" runat="server" value="0" />
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
