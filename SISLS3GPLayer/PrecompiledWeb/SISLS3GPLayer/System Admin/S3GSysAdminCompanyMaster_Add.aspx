<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3GSysAdminCompanyMaster_Add, App_Web_xht0hlsp" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<script runat="server">

  
</script>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" src="../Scripts/Common.js"></script>

    <script language="javascript" type="text/javascript">

        function funCheckFirstLetterisNumeric(textbox, msg) {

            var FieldValue = new Array();
            FieldValue = textbox.value.trim();
            if (FieldValue.length > 0 && FieldValue.value != '') {
                if (isNaN(FieldValue[0])) {
                    return true;
                }
                else {
                    alert(msg + ' name cannot begin with a number');
                    textbox.focus();
                    textbox.value = '';
                    event.returnValue = false;
                    return false;
                }
            }
        }

        function fnCheckPageValidation() {

            if ((!fnCheckPageValidators(null, 'false'))) {
                if (Page_ClientValidate() == false) {
                    Page_BlockSubmit = false;
                    return false;
                }
            }
            if (Page_ClientValidate()) {
                //Starting


                if (confirm('Are you sure want to save?')) {
                    return true;
                }
                else
                    return false;
            }
            return true;
        }

        function CheckDateGreaterThanSysDate(strCntrlId, strCheck) {
            var dd = new Date();
            var dd1 = new Date();
            var strDate = document.getElementById(strCntrlId).value;
            var date = strDate.split("/");

            dd.setDate(date[0]);
            dd.setMonth(date[1] - 1);
            dd.setFullYear(date[2]);

            if (strCheck == 0) {
                if (dd1 > dd) {
                    alert('Date should be greater than system date');
                    document.getElementById(strCntrlId).focus();
                    return false;
                }
                else {
                    return true;
                }
            }
            if (strCheck == 1) {
                if (dd > dd1) {

                    alert('Date cannot be greater than or equal to system date');
                    document.getElementById(strCntrlId).focus();
                    return false;
                }
                else {
                    return true;
                }
            }

        }

        function CompareTwodate(strCntrlId1, strCntrlId2) {
            var dd = new Date();
            var dd1 = new Date();
            var strDateSmall = document.getElementById(strCntrlId1).value;
            var strDateLarge = document.getElementById(strCntrlId2).value;
            var date1 = strDateSmall.split("/");
            var date2 = strDateLarge.split("/");
            dd.setFullYear(strDateSmall[2], strDateSmall[1] - 1, strDateSmall[0]);
            dd1.setFullYear(strDateLarge[2], strDateLarge[1] - 1, strDateLarge[0]);
            if (dd > dd1) {
                alert('Date cannot be greater than date of Incroparation date');
                return false;
            }

        }

        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcCompanyCreation');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
       <%--var Valgrp = document.getElementById('<%=vsCompanyAdd.ClientID %>')--%>
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')

            //btnSave.disabled=true;

            strValgrp = "Basic Details";
            //  Valgrp.validationGroup = strValgrp;

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
                        case 2:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                //index = tab.get_activeTabIndex(newindex);
                //Focus Start
                var TC = $find("<%=tcCompanyCreation.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=txtCompanyName.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=txtHeadName.ClientID %>").focus();
                }
                if (TC.get_activeTab().get_tabIndex() == 2) {
                    $get("<%=txtRegNumber.ClientID %>").focus();
                }
                //Focus End
            }
        }
        //Tab index code end
        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {
           // debugger;
            var TC = $find("<%=tcCompanyCreation.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=txtCompanyName.ClientID %>").focus();

            }

            tab = $find('ctl00_ContentPlaceHolder1_tcCompanyCreation');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')

            function on_Change(sender, e) {
                //debugger;
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

    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcCompanyCreation" runat="server" ActiveTabIndex="0" CssClass="styleTabPanel"
                            Width="100%" ScrollBars="Auto">
                            <cc1:TabPanel runat="server" HeaderText="Basic Details" ID="tbBasicDetails" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Basic Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCompanyCode" runat="server" MaxLength="3" onkeypress="fnCheckSpecialChars();" ToolTip="Company Code" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvCompanyCode" runat="server" Display="None" ErrorMessage="Enter the Company Code"
                                                    ControlToValidate="txtCompanyCode" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                <cc1:FilteredTextBoxExtender FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    TargetControlID="txtCompanyCode" runat="server" Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblCompanyCode" runat="server" Text="Company Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCompanyName" runat="server" MaxLength="80" ToolTip="Company Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftexCompanyName" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                    TargetControlID="txtCompanyName" ValidChars=" " runat="server" Enabled="True">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" Display="Dynamic" ErrorMessage="Enter the Company Name"
                                                        ControlToValidate="txtCompanyName" SetFocusOnError="true" ValidationGroup="Basic Details" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlConstitutionalStatus" runat="server" ToolTip="Constitutional Status" class="md-form-control form-control">
                                                    <asp:ListItem Text="Company" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="PartnerShip" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvddlConstitutionalStatus" runat="server" ValidationGroup="Basic Details" Display="Dynamic" ErrorMessage="Select Constitutional Status"
                                                        ControlToValidate="ddlConstitutionalStatus" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblConstitutionalStatus" runat="server" Text="Constitutional Status"
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                            <div class="md-input">
                                                <cc1:ComboBox ID="txtCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoPostBack="true" AutoCompleteMode="SuggestAppend"
                                                    OnTextChanged="txtCountry_TextChanged" MaxLength="60" Visible="false" ToolTip="Country">
                                                </cc1:ComboBox>
                                                <asp:RequiredFieldValidator ID="rfvCountry" runat="server" Display="None" ErrorMessage="Enter the Country"
                                                    ControlToValidate="txtCountry" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="styleReqFieldLabel" Visible="false"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:CheckBox ID="chkboxActive" runat="server" Checked="true" Enabled="false" />
                                                <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel GroupingText="Communication Address" ID="pnlCommAddress" runat="server"
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
                            <cc1:TabPanel runat="server" HeaderText="Corporate Details" ID="tbCorporateDetails"
                                CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Corporate Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtHeadName" runat="server" MaxLength="60" ToolTip="CEO/Head Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvHeadName" runat="server" Display="Dynamic" ErrorMessage="Enter the CEO/Head Name" ValidationGroup="Basic Details"
                                                        ControlToValidate="txtHeadName" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <cc1:FilteredTextBoxExtender ID="fteHeadName" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers"
                                                    TargetControlID="txtHeadName" runat="server" ValidChars=" ,.">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblHeadName" runat="server" Text="CEO/Head Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtMobileNumber" runat="server" MaxLength="12" ToolTip="Mobile Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftextxtMobileNumber" FilterType="Numbers"
                                                    TargetControlID="txtMobileNumber" runat="server">
                                                </cc1:FilteredTextBoxExtender>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtTeleNumber" runat="server" MaxLength="12" ToolTip="Telephone Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftexTeleNumber" FilterType="Custom,Numbers"
                                                    TargetControlID="txtTeleNumber" runat="server" ValidChars="-">
                                                </cc1:FilteredTextBoxExtender>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvTeleNumber" runat="server" Display="Dynamic" ErrorMessage="Enter the Telephone Number" ValidationGroup="Basic Details"
                                                        ControlToValidate="txtTeleNumber" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblTeleNumber" runat="server" Text="Telephone Number" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtEmailId" runat="server" MaxLength="60" ToolTip="Email Id" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvEmailId" runat="server" Display="Dynamic" ErrorMessage="Enter the Email Id" ValidationGroup="Basic Details"
                                                        ControlToValidate="txtEmailId" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revEmailId" ValidationGroup="Basic Details" runat="server" ControlToValidate="txtEmailId"
                                                        Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="true" ErrorMessage="Enter a valid Email Id"
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblEmaidId" runat="server" Text="EMail Id" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtWebsite" runat="server" MaxLength="60" ToolTip="Website" OnTextChanged="txtWebsite_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvWebsite" runat="server" Display="Dynamic" ErrorMessage="Enter the Website Name"
                                                        ControlToValidate="txtWebsite" ValidationGroup="Basic Details" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                  <%--  <asp:RegularExpressionValidator
                                                        ID="revWebsite" runat="server" ControlToValidate="txtWebsite" ValidationGroup="Basic Details" Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Enter a valid Website Name" ValidationExpression="www\.([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>--%>
                                                      <asp:RegularExpressionValidator ID="revWebsite" runat="server" ControlToValidate="txtWebsite" ValidationGroup="Basic Details" Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Enter a valid Website Name" ValidationExpression="www\.([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblWebsite" runat="server" Text="Website" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtSystemAdminUser" runat="server" MaxLength="6" ToolTip="Must begin with an alphabet and length should be minimum of 4 Characters and maximum of 6 Characters" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="ftexSystemAdminUser" FilterType="UppercaseLetters,LowercaseLetters,Custom,Numbers"
                                                    TargetControlID="txtSystemAdminUser" runat="server">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvSystemAdminUser" runat="server" Display="Dynamic" ValidationGroup="Basic Details" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Enter the System Admin User Code" ControlToValidate="txtSystemAdminUser"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revtxtSystemAdminUser" runat="server" ValidationGroup="Basic Details" SetFocusOnError="true" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Code must begin with an alphabet, length should be minimum of 4 Characters"
                                                        ControlToValidate="txtSystemAdminUser" ValidationExpression="^[A-Za-z](\w){3,5}"></asp:RegularExpressionValidator>
                                                </div>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblSystemAdminUser" runat="server" Text="System Admin User Code" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtSystemAdminPwd" runat="server" oncopy="return false" onpaste="return false" MaxLength="6" TextMode="Password" ToolTip="Password must be of 6 Characters, it should contain atleast 3 of the following one lower case, one upper case, one number,one special character." class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvtxtSystemAdminPwd" runat="server" Display="Dynamic" ValidationGroup="Basic Details"
                                                        ErrorMessage="Enter the System Admin User Password" ControlToValidate="txtSystemAdminPwd"
                                                        SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revSystemAdminPassword" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn" SetFocusOnError="True"
                                                        ErrorMessage="Password Must Contain alteast a Upper Case,a Lower Case and a Number"
                                                        ControlToValidate="txtSystemAdminPwd" ValidationExpression="(?=^(?=.{6,6}$)(?=.[A[/\-.]Z])(?=.*[a[/\-.]z])(?=.*[0[/\-.]9])(?=^[a[/\-.]Za[/\-.]Z]{1})(?=.*[!@#$%^*_:])(?!.*[\&quot;\s&amp;()+}{;='~:\\|'?/>.<,])).*$"></asp:RegularExpressionValidator>
                                                </div>
                                                <cc1:FilteredTextBoxExtender ID="ftexSystemAdminPass"
                                                    InvalidChars=" " FilterMode="InvalidChars" TargetControlID="txtSystemAdminPwd" runat="server">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblSystemAdminPwd" runat="server" Text="System Admin User Password"
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Other Details" ID="tbOtherDetails" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Other Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" visible="false">
                                            <div class="md-input">
                                                <cc1:ComboBox ID="txtOtherCountry" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDown"
                                                    AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                    MaxLength="60">
                                                </cc1:ComboBox>
                                                <asp:RequiredFieldValidator ID="rfvOtherCountry" runat="server" Display="None" ErrorMessage="Enter the Country in Other Details tab"
                                                    ControlToValidate="txtOtherCountry" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblOtherCountry" runat="server" Text="Country" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtDateOfIncorp" runat="server" MaxLength="12" ToolTip="Date of Incorporation/Company Start date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <asp:RequiredFieldValidator ID="rfvDateOfIncorp" runat="server" Display="None"
                                                    ErrorMessage="Enter the date of Incorporation" ValidationGroup="Basic Details"
                                                    ControlToValidate="txtDateOfIncorp" SetFocusOnError="True">
                                                </asp:RequiredFieldValidator>
                                                <cc1:CalendarExtender runat="server" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                    TargetControlID="txtDateOfIncorp" ID="CalendarExtender1" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblDateOfIncorp" runat="server" Text="Date of Incorporation/Company Start date"
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRegNumber" runat="server" MaxLength="20" ToolTip="Must begin with an alphabet or a number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvRegNumber" runat="server" Display="Dynamic" ErrorMessage="Enter Registration No./License No." ValidationGroup="Basic Details"
                                                        ControlToValidate="txtRegNumber" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="revtxtRegNumber" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Enter a valid Registration No./License No." ControlToValidate="txtRegNumber"
                                                        ValidationExpression="^[a-zA-Z_0-9](\w|\W)*"></asp:RegularExpressionValidator>
                                                </div>

                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblRegNumber" runat="server" Text="Registration No./License No."
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtValdityOfRegNumber" runat="server" MaxLength="12" ToolTip="Validity of Registration Number/License Number" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>

                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvValdityOfRegNumber" runat="server" Display="Dynamic" ValidationGroup="Basic Details"
                                                        ErrorMessage="Enter Validity of Registration No./License No." ControlToValidate="txtValdityOfRegNumber"
                                                        SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <cc1:CalendarExtender runat="server" TargetControlID="txtValdityOfRegNumber"
                                                   
                                                    ID="cexValdityOfRegNumber" Enabled="True">
                                                </cc1:CalendarExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblValdityOfRegNumber" runat="server" Text="Validity of Registration No./License No."
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtPanNumber" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <div class="validation_msg_box">
                                                    <asp:RegularExpressionValidator ID="revtxtPanNumber" runat="server" Display="None"
                                                        ErrorMessage="Enter a valid Income tax number" ControlToValidate="txtPanNumber"
                                                        ValidationExpression="^[a-zA-Z_0-9](\w|\W)*"></asp:RegularExpressionValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblPanNumber" runat="server" Text="Income Tax Number/PAN"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtAccCurrency" runat="server" ReadOnly="True" ToolTip="Accounting Currency" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="lblAccCurrency" runat="server" Text="Accounting Currency"></asp:Label>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRemarks" runat="server" MaxLength="60" TextMode="MultiLine"
                                                    onkeydown="maxlengthfortxt(60)" onblur="maxlengthfortxt(60)" ToolTip="Maximum length cannot be greater than 60 Characters" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvtxtRemarks" runat="server" Display="Dynamic" ValidationGroup="Basic Details" ErrorMessage="Enter the Remarks"
                                                        ControlToValidate="txtRemarks" SetFocusOnError="true" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="validation_msg_box">
                                                    <asp:RegularExpressionValidator ID="revRemarks" runat="server" Display="Dynamic" ErrorMessage="Maximum length cannot be greater than 60 Characters"
                                                        ControlToValidate="txtRemarks" ValidationExpression="[\s\S]{1,60}"></asp:RegularExpressionValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblRemarks" runat="server" Text="Remarks" CssClass="styleReqFieldLabel"></asp:Label><br />
                                                </label>
                                            </div>
                                        </div>


                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtPrevCBODataProvID" runat="server" MaxLength="20" ToolTip="Previous CBO Data Provider ID" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblPrevCBODataProvID" runat="server" Text="Previous CBO Data Provider ID"></asp:Label><br />
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCBODataProvID" runat="server" MaxLength="20" ToolTip="CBO Data Provider ID" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblCBODataProvID" runat="server" Text="CBO Data Provider ID" CssClass="styleDisplayFieldLabel"></asp:Label><br />
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div style="margin-top: 10px;" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <asp:Panel GroupingText="Corporate Address" ID="Panel1" runat="server"
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
                        </cc1:TabContainer>
                    </div>
                </div>

                <div class="row" style="display: none" class="col">
                    <%-- <asp:Button ID="btnPrev" AccessKey="P" runat="server" Text="<<" CssClass="styleButtonNext" CausesValidation="false"
                        OnClick="btnPrev_Click" Visible="false" />
                    <asp:Button ID="btnNext" AccessKey="N" runat="server" Text=">>" CssClass="styleButtonNext" CausesValidation="false"
                        OnClick="btnNext_Click" Visible="false" />--%>

                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                </div>

                <%--  <div class="row" align="right" style="margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save_btn fa fa-floppy-o" AccessKey="S" ToolTip="Save, Alt+S" ValidationGroup="Basic Details"
                            OnClientClick="return fnCheckPageValidators('Basic Details');" />

                        <i class="fa fa-share btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnCancel" runat="server" Text="Exit" CssClass="save_btn fa fa-floppy-o" AccessKey="X" ToolTip="Exit,Alt+X"
                            OnClientClick="parent.RemoveTab();" CausesValidation="False" />

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="save_btn fa fa-floppy-o" ToolTip="Clear, Alt+L" AccessKey="L"
                            OnClick="btnClear_Click" CausesValidation="False" OnClientClick="return fnConfirmClear();" Visible="false" />

                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="styleSubmitButton"
                            OnClick="btnDelete_Click" Visible="false" />
                    </div>
                </div>--%>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">

                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Basic Details'))">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnCancel" runat="server" causesvalidation="false" title="Exit[Alt+X]"  onclick="RemoveTabnew(this);" 
                        type="button" accesskey="X">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>

                </div>


                <div class="row">
                    <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                    <input id="hdnIds" type="hidden" runat="server" />
                    <input id="hdnUserId" type="hidden" runat="server" value="0" />
                    <input id="hdnUserLevelId" type="hidden" runat="server" value="0" />
                </div>


                <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" 
                    ForeColor="Red"></asp:Label>--%>
                <%--     <div style="display: none">
                  
                    <asp:ValidationSummary ID="vsCompanyAdd" runat="server" Style="display: none" ShowSummary="true" CssClass="styleMandatoryLabel"
                        ShowMessageBox="false" ValidationGroup="save" HeaderText="Correct the following validation(s):" />

                </div>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
