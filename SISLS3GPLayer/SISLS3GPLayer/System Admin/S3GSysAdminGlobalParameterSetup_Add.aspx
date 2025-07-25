<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="S3GSysAdminGlobalParameterSetup_Add.aspx.cs"
    Inherits="System_Admin_S3GSysAdminGlobalParamerterSetup_Add" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        var TotalChkBx;
        var Counter;
        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {
            tab = $find('ctl00_ContentPlaceHolder1_tcGlobalParamSetup');
            $addHandler($get("hideModalPopupClientButton"), 'click', hideModalPopupViaClient);
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
        }
        //code added to set tab focus
        function on_Change(sender, e) {
            fnMoveNextTab('Tab');
        }

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcGlobalParamSetup');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            <%--var Valgrp = document.getElementById('<%=vsPricing.ClientID %>')--%>
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            //btnSave.disabled=true;
            //    Valgrp.validationGroup = strValgrp;

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

            //if (newindex == tab._tabs.length - 1)
            //    btnSave.disabled = false;
            //else
            //    btnSave.disabled = true;
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
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
                index = tab.get_activeTabIndex(newindex);

            }
        }
        //code added to set tab focus
        window.onload = function () {
            //Get total no. of CheckBoxes in side the GridView.
            //TotalChkBx = parseInt('<%= this.grvMothEndParam.Rows.Count %>');
            TotalChkBx = 0;
            //Get total no. of checked CheckBoxes in side the GridView.
            Counter = 0;
        }

        function hideModalPopupViaClient() {
            //ev.preventDefault();        
            var modalPopupBehavior = $find('programmaticModalPopupBehavior');
            modalPopupBehavior.hide();
        }

        function HeaderClick(CheckBox, chilId) {
            TotalChkBx = parseInt('<%= this.grvMothEndParam.Rows.Count %>')
            //Get target base & child control.
            var TargetBaseControl =
       document.getElementById('<%= this.grvMothEndParam.ClientID %>');
            var TargetChildControl = chilId;

            //Get all the control of the type INPUT in the base control.
            var Inputs = TargetBaseControl.getElementsByTagName("input");

            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
                Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = CheckBox.checked;

            //Reset Counter
            Counter = CheckBox.checked ? TotalChkBx : 0;
        }

        function ChildClick(CheckBox, HCheckBox) {
            //get target control.

            TotalChkBx = parseInt('<%= this.grvMothEndParam.Rows.Count %>')
            var HeaderCheckBox = document.getElementById(HCheckBox);

            //Modifiy Counter; 
            if (CheckBox.checked && Counter < TotalChkBx)
                Counter++;
            else if (Counter > 0)
                Counter--;

            //Change state of the header CheckBox.
            if (Counter < TotalChkBx)
                HeaderCheckBox.checked = false;
            else if (Counter == TotalChkBx)
                HeaderCheckBox.checked = true;
        }

        function fnCheckZero() {
            var txtDaysPWD = (document.getElementById('<%=txtDaysPWD.ClientID %>'));
            var txtDisableAccess = (document.getElementById('<%=txtDisableAccess.ClientID %>'));
            var txtMiniPWDLen = (document.getElementById('<%=txtMiniPWDLen.ClientID %>'));

            //debugger;
            if (document.getElementById('<%=chkForcePWDChange.ClientID %>').checked == true) {

                if ((txtDaysPWD.value != " ") && !(isNaN(txtDaysPWD.value))) {
                    var pwdDays
                    pwdDays = parseInt(txtDaysPWD.value, 10);
                }

                if ((document.getElementById('<%=chkForcePWDChange.ClientID %>').checked == true) && pwdDays == "0") {
                    alert("On force password change - Days should not be zero");
                }
                else if ((document.getElementById('<%=chkForcePWDChange.ClientID %>').checked == true) && (isNaN(txtDaysPWD.value))) {
                    alert("On force password change - Days should not be empty");
                }
                else {
                    return;
                }

            }

            if ((txtDaysPWD.value != " ") && !(isNaN(txtDaysPWD.value)) || (txtDisableAccess.value != " ") && !(isNaN(txtDisableAccess.value)) || (txtMiniPWDLen.value != " ") && !(isNaN(txtMiniPWDLen.value))) {
                var pwdDays
                var disAccess
                var pwdlen

                pwdDays = parseInt(txtDaysPWD.value, 10);
                disAccess = parseInt(txtDisableAccess.value, 10);
                pwdlen = parseInt(txtMiniPWDLen.value, 10);

                //                if(document.getElementById('ctl00_ContentPlaceHolder1_tcGlobalParamSetup_tpPasswordPloicy_chkForcePWDChange').checked==true)
                //                {
                //                    if (pwdDays == "0") 
                //                    {
                //                        alert("Days cannot be Zero");
                //                        txtDaysPWD.focus();
                //                    }
                //                }
                //                
                //                if(disAccess == 0)
                //                {
                //                    alert("Disable Access Count cannot be Zero");
                //                    txtDisableAccess.focus();
                //                }
                //                else if(pwdlen == 0)
                //                {
                //                    alert("Password Length cannot be Zero");
                //                    txtMiniPWDLen.focus();
                //                }
                //                else 


                if (pwdlen < "6") {
                    alert("Password Length should be minimum 6");
                    txtMiniPWDLen.focus();
                }
                else {
                    return;
                }
            }
            else {
                return;
            }

        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <cc1:TabContainer ID="tcGlobalParamSetup" runat="server" CssClass="styleTabPanel"
                            Width="99%" ScrollBars="Auto" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" HeaderText="General Particulars" ID="tbGlobalParam1"
                                CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Global Parameters &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel ID="panDateFormat" GroupingText="Date Format" runat="server" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlDateFormat" runat="server" AutoPostBack="True"
                                                                    class="md-form-control form-control" OnSelectedIndexChanged="ddlDateFormat_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                    <asp:ListItem Value="dd/MM/yyyy">dd/MM/yyyy</asp:ListItem>
                                                                    <asp:ListItem Value="dd-MM-yyyy">dd-MM-yyyy</asp:ListItem>
                                                                    <asp:ListItem Value="MM/dd/yyyy">MM/dd/yyyy</asp:ListItem>
                                                                    <asp:ListItem Value="MM-dd-yyyy">MM-dd-yyyy</asp:ListItem>
                                                                    <asp:ListItem Value="dd-MMM-yyyy">dd-MMM-yyyy</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDateFormat" runat="server" Text="Date Format" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvDateFormat" ControlToValidate="ddlDateFormat" ValidationGroup=" Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select Date Format" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="panGeneralParameters" GroupingText="General Parameters"
                                                    CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:RadioButton ID="rbtnIntegratedSystem" runat="server" GroupName="SystemType"
                                                                    Text="Integrated System" TextAlign="Left" Checked="True" class="md-form-control form-control radio" />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:RadioButton ID="rbtnStandAlone" runat="server" GroupName="SystemType" Text="Stand alone System"
                                                                    TextAlign="Left" class="md-form-control form-control radio" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="divMLA" runat="server" visible="false">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:RadioButton ID="rbtnMLA" runat="server" GroupName="AccountType" Checked="True"
                                                                    Text="Only MLA" TextAlign="Left" Visible="False" class="md-form-control form-control radio" />
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:RadioButton ID="rbtnMLASLA" runat="server" GroupName="AccountType" Text="MLA and SLA"
                                                                    TextAlign="Left" Visible="False" class="md-form-control form-control radio" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12" id="divPIn" runat="server" visible="false">
                                                <asp:Panel ID="panPIN" GroupingText="Postal Code Particulars" runat="server" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlFieldType" runat="server" class="md-form-control form-control">
                                                                    <asp:ListItem Value="Alpha Numeric">Alpha Numeric</asp:ListItem>
                                                                    <asp:ListItem Value="Numeric">Numeric</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblFieldType" runat="server" Text="Field Type" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvFieldType" ControlToValidate="ddlFieldType" runat="server" ValidationGroup="Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" ErrorMessage="Select PIN Code field Type" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFieldDigits" runat="server" MaxLength="2" onblur="ChkIsZero(this,'Postal Code Digits')"
                                                                    Style="text-align: right" onkeypress="fnAllowNumbersOnly('false',false,this)"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDigits" runat="server" Text="Digits" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvDigits" ControlToValidate="txtFieldDigits" runat="server" ValidationGroup=" Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" ErrorMessage="Enter Digits in Postal Code" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    <asp:RangeValidator ID="rgvPinCode" MaximumValue="10" MinimumValue="1" Display="None"
                                                                        Type="Integer" ControlToValidate="txtFieldDigits" runat="server" ErrorMessage="Postal Code Digits value can be maximum 10 and Minimum 1"></asp:RangeValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42" runat="server" TargetControlID="txtFieldDigits"
                                                                        FilterType="Numbers" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="panCurrency" GroupingText="Default Currency Particulars"
                                                    CssClass="stylePanel" Style="padding-top: 0px">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlCurrency" runat="server" AutoPostBack="True" class="md-form-control form-control" OnSelectedIndexChanged="ddlCurrency_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblCurrency" runat="server" Text="Currency Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCurrency" ControlToValidate="ddlCurrency" runat="server" ValidationGroup=" Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" ErrorMessage="Select an Accounting currency" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMaxDigit" runat="server" MaxLength="2" onblur="ChkIsZero(this,'Maximum Digits')"
                                                                    Style="text-align: right" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblMaxDigit" runat="server" Text="Maximum Digits" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMaxDigit" ControlToValidate="txtMaxDigit" runat="server" ValidationGroup=" Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Maximum Digits"></asp:RequiredFieldValidator>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMaxDigit"
                                                                        FilterType="Numbers" InvalidChars="." FilterMode="InvalidChars" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMaxDecimal" runat="server" MaxLength="1" onblur="ChkIsZero(this)"
                                                                    Style="text-align: right" onkeypress="fnAllowNumbersOnly('false',false,this)"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblMaxDecimal" runat="server" Text="Maximum Decimals" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvMaxDecimal" ControlToValidate="txtMaxDecimal" ValidationGroup=" Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Enter maximum Decimals" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtEffectiveDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <%-- <asp:Image ID="imgEffectiveDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtEffectiveDate"
                                                                    PopupButtonID="txtEffectiveDate" ID="cexEffectiveDate" Enabled="True">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblEffectiveDate" runat="server" Text="Effective Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvEffectiveDate" ControlToValidate="txtEffectiveDate" ValidationGroup=" Global Parameters"
                                                                        CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Enter Effecitve Date" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" ID="Panel1" GroupingText="Account Credit" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkAccountCredit" runat="server" Checked="true" />
                                                                <asp:Label ID="lblAccountCredit" runat="server" Text="Account Credit" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>

                                        </div>
                                        <div style="display: none" class="col">
                                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Month End Parameters" ID="TabPanel1" CssClass="tabpan" AccessKey="P" Visible="false"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Prime/Sub Accounts Details&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <div id="divMLASLA" style="overflow: auto; height: 345px;" width="99%">
                                                    <asp:GridView ID="grvMLASLA" runat="server" AutoGenerateColumns="False" Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="LOB Id" SortExpression="LOB_ID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLOBId" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Line of Business" SortExpression="LOB_Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLOB_NAME" runat="server" Text='<%# Bind("LOB_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" Width="65%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Only Prime Account">
                                                                <ItemTemplate>
                                                                    <%--      <asp:CheckBox ID="chkMLA" runat="server" Checked='<%# Bind("OnlyMLA") %>' />--%>
                                                                    <asp:RadioButton ID="chkMLA" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "OnlyMLA")))%>'
                                                                        GroupName='<%# Bind("LOB_ID") %>' />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" Width="15%" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Prime and Sub Account">
                                                                <ItemTemplate>
                                                                    <%-- <asp:CheckBox ID="chkMLASLA" runat="server" Checked='<%# Bind("MLAandSLA") %>'/>--%>
                                                                    <asp:RadioButton ID="chkMLASLA" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "MLAandSLA")))%>'
                                                                        GroupName='<%# Bind("LOB_ID") %>' />
                                                                </ItemTemplate>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Month End Parameters" ID="tpMonthEndParameters"
                                CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Month End Parameters&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" GroupingText="Month end parameters" ID="panMonthEndPrev"
                                                    CssClass="stylePanel">
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlFinacialYear" runat="server" AutoPostBack="True"
                                                                        class="md-form-control form-control" OnSelectedIndexChanged="ddlFinacialYear_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:DropDownList ID="ddlFinancialMonth" runat="server" AutoPostBack="True"
                                                                        class="md-form-control form-control" OnSelectedIndexChanged="ddlFinancialMonth_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblYearandMonth" runat="server" Text="Financial Year and Month"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvFinancialYear" ControlToValidate="ddlFinacialYear" ValidationGroup=" Global Parameters"
                                                                            CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select a Financial Year" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvFinancialMonth" ControlToValidate="ddlFinancialMonth" ValidationGroup=" Global Parameters"
                                                                            CssClass="validation_msg_box_sapn" runat="server" ErrorMessage="Select a Financial Month" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <%-- <div class="md-input">
                                                                    <tr>
                                                                        <td class="styleFieldLabel">
                                                                            <asp:Label ID="lblYearLockDispaly" runat="server" Text="Year Lock"></asp:Label>
                                                                        </td>
                                                                        <td class="styleFieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lblYearLock" runat="server" Font-Bold="True"></asp:Label>
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td class="styleFieldAlign">
                                                                            <asp:CheckBox ID="chkYearLock" runat="server" AutoPostBack="True" OnCheckedChanged="chkYearLock_CheckedChanged" />
                                                                        </td>
                                                                    </tr>
                                                                </div>--%>
                                                                <div class="md-input">
                                                                    <asp:Label ID="lblYearLock" runat="server" Font-Bold="True"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:CheckBox ID="chkYearLock" runat="server" AutoPostBack="True" OnCheckedChanged="chkYearLock_CheckedChanged" />
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblYearLockDispaly" runat="server" Text="Year Lock"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <%--  <table>
                                                                        <tr>
                                                                            <td class="styleFieldLabel">
                                                                                <asp:Label ID="lblMonthLockDisplay" runat="server" Text="Month Lock"></asp:Label>
                                                                            </td>
                                                                            <td class="styleFieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="lblMonthLock" runat="server" Font-Bold="True"></asp:Label>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            </td>
                                                                            <td class="styleFieldAlign">
                                                                                <asp:CheckBox ID="chkMonthLock" runat="server" AutoPostBack="True" OnCheckedChanged="chkMonthLock_CheckedChanged" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>--%>
                                                                    <asp:Label ID="lblMonthLock" runat="server" Font-Bold="True"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                <asp:CheckBox ID="chkMonthLock" runat="server" AutoPostBack="True" OnCheckedChanged="chkMonthLock_CheckedChanged" />
                                                                    <label class="tess">
                                                                        <asp:Label ID="lblMonthLockDisplay" runat="server" Text="Month Lock"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12">
                                                                <asp:GridView ID="grvMothEndParam" runat="server" AutoGenerateColumns="False" Width="98%"
                                                                    OnRowCreated="grvMothEndParam_RowCreated" OnRowCommand="grvMothEndParam_RowCommand" class="gird_details">
                                                                    <%--OnRowDataBound="grvMothEndParam_RowDataBound"--%>
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Branch Id" SortExpression="Branch_id" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBranchId" runat="server" Text='<%# Bind("Location_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Location" SortExpression="Branch">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrLocation" Text="Branch" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("Location_Name") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Left" VerticalAlign="Middle" />
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <%--<asp:TemplateField HeaderText="Region_id" SortExpression="Region_id" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRegionId" runat="server" Text='<%# Bind("Region_id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                    </asp:TemplateField>--%>
                                                                        <asp:TemplateField HeaderText="Month Lock">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrCB" Text="Month Lock" runat="server" /><br />
                                                                                <asp:CheckBox ID="chkHdrMonthLock" runat="server" CssClass="styleGridHeader" onclick="javascript:HeaderClick(this,'chkMonth');"
                                                                                    AutoPostBack="True" OnCheckedChanged="chkHdrLockEvent_CheckedChanged" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Month_Lock") %>'--%>
                                                                                <asp:CheckBox ID="chkMonth" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Month_Lock")))%>'
                                                                                    AutoPostBack="True" OnCheckedChanged="chkLockEvent_CheckedChanged" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Billing">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrBilling" Text="Billing" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Billing") %>'--%>
                                                                                <asp:CheckBox ID="chkBilling" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Billing")))%>'
                                                                                    AutoPostBack="true" Enabled="false" OnCheckedChanged="chkLockEvent_CheckedChanged" />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Interest Calculation">
                                                                            <%-- Interest Calculation  --%>
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrIncomeRecognition" Text="Interest Calculation" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Interest_Calculation") %>'--%>
                                                                                <asp:CheckBox ID="chkInterest" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Interest_Calculation")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="CBO" Visible="false">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrCBO" Text="CBO" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Deliquency") %>'--%>
                                                                                <asp:CheckBox ID="chkDeliquency" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Deliquency")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ODI">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrODI" Text="ODI" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("ODI") %>'--%>
                                                                                <asp:CheckBox ID="chkOdi" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "ODI")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Demand" Visible="false">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrDemand" Text="Demand" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Demand") %>'--%>
                                                                                <asp:CheckBox ID="chkDemand" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Demand")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Depreciation" Visible="false">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrDepreciation" Text="Depreciation" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Depreciation") %>'--%>
                                                                                <asp:CheckBox ID="chkDepreciation" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Depreciation")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Service Charge--%>
                                                                        <asp:TemplateField HeaderText="Service Charges" Visible="false">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrServicecharge" Text="Service Charges" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkServicecharge" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "SERVICE_CHARGES")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Discount Charge--%>
                                                                        <asp:TemplateField HeaderText="Discount Charges">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrDiscountCharge" Text="Discount Charges" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Depreciation") %>'--%>
                                                                                <asp:CheckBox ID="chkDiscountCharge" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "DISCOUNT_CHARGES")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <%--Balance Updation--%>
                                                                        <asp:TemplateField HeaderText="Balance Upadtion" Visible="false">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrBalanceUpdation" Text="Balance Upadtion" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--'<%# Bind("Depreciation") %>'--%>
                                                                                <asp:CheckBox ID="chkBalanceUpdation" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockEvent_CheckedChanged"
                                                                                    Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "BALANCE_UPDATION")))%>' />
                                                                            </ItemTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="DetailId" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMonthEndId" runat="server" Text='<%# Bind("Month_End_Params_Det_ID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <%--<HeaderStyle CssClass="styleGridHeader" />--%>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View" Visible="true">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="lblHdrView" Text="View" runat="server" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%--    <asp:LinkButton ID="lnkView" runat="server" Text="View" CommandName="view"
                                                                                    CommandArgument='<%# Bind("Location_ID") %>' class="grid_btn"></asp:LinkButton>--%>
                                                                                <asp:Button ID="lnkView" runat="server" Text="View" CommandName="view"
                                                                                    CommandArgument='<%# Bind("Location_ID") %>' class="grid_btn"></asp:Button>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <EmptyDataTemplate>
                                                                        No Records Found
                                                                    </EmptyDataTemplate>
                                                                    <EmptyDataRowStyle HorizontalAlign="Center" Font-Size="Medium" VerticalAlign="Middle"
                                                                        Width="100%" CssClass="styleRecordCount" />
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                                <asp:Panel ID="PnlPassword" Style="display: none; vertical-align: middle" runat="server"
                                                                    BorderStyle="Solid" BackColor="White" Width="90%">
                                                                    <asp:GridView ID="GridViewLOB" runat="server" AutoGenerateColumns="False" class="grid_btn">
                                                                        <%--OnRowDataBound="GridViewLOB_RowDataBound"--%>
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Line of Business">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB_Name") %>' />
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle CssClass="styleGridHeader" />--%>
                                                                                <%--  <ItemStyle Width="15%" />--%>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Billing">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkBilling" runat="server" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Billing")))%>'
                                                                                        Enabled="false" />
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle CssClass="styleGridHeader" />--%>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Interest Calculation">
                                                                                <%-- Interest Calculation--%>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkInterest" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Interest_Calculation")))%>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="ODI">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkOdi" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "ODI")))%>' />
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle CssClass="styleGridHeader" Width="5%" />--%>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Service Charges" Visible="false">
                                                                                <%--Service Charges--%>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkServiceCharges" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Service_Charges")))%>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Discount Charges">
                                                                                <%--Discount Charges--%>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkDiscCharges" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Discount_Charges")))%>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Balance Updation" Visible="false">
                                                                                <%-- Balance Updation--%>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkBalUpdtn" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Balance_Updation")))%>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="CBO" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkDeliquency" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Deliquency")))%>' />
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle CssClass="styleGridHeader" />--%>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Demand" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkDemand" runat="server" Enabled="false" Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Demand")))%>' />
                                                                                </ItemTemplate>
                                                                                <%--<HeaderStyle CssClass="styleGridHeader" />--%>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                    <cc1:ModalPopupExtender ID="ModalPopupExtenderPassword" runat="server" TargetControlID="btnModal"
                                                                        PopupControlID="PnlPassword" BackgroundCssClass="styleModalBackground" DynamicServicePath=""
                                                                        Enabled="True" BehaviorID="programmaticModalPopupBehavior">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Label ID="lblmodalerror" runat="server" />
                                                                    <br />
                                                                    <a id="hideModalPopupClientButton" href="#" onclick="hideModalPopupViaClient();">
                                                                        <center>
                                                                            <button class="css_btn_enabled" id="btnpopupExit" causesvalidation="false" runat="server" type="button">
                                                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                                                            </button>
                                                                        </center>
                                                                    </a>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                        <asp:Button ID="btnModal" Style="display: none" runat="server" />
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Password Policy" ID="tpPasswordPloicy" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Password Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" GroupingText="Password Rules" ID="Panel2" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkForcePWDChange" runat="server" OnCheckedChanged="chkForcePWDChange_CheckedChanged"
                                                                    Checked="true" />
                                                                <asp:Label ID="lblForcePWDchange" runat="server" Text="Force Password Change" CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:TextBox ID="txtDaysPWD" runat="server" MaxLength="2"
                                                                    class="md-form-control form-control login_form_content_input requires_true" onblur="fnCheckZero()"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDays" runat="server" Text="Days" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtDaysPWD"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkInitialChangePWD" runat="server" OnCheckedChanged="chkInitialChangePWD_CheckedChanged"
                                                                    Checked="true" />
                                                                <asp:Label ID="lblEnforcePWD" runat="server" Text="Enforce initial change password"
                                                                    CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtDisableAccess" runat="server" MaxLength="2"
                                                                    class="md-form-control form-control login_form_content_input requires_true" onblur="fnCheckZero()"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblDisableAccess" runat="server" Text="Disable access after wrong password"
                                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                            <div class="validation_msg_box">
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtDisableAccess"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <asp:RequiredFieldValidator ID="rfvDisableAccess" ControlToValidate="txtDisableAccess" ValidationGroup=" Global Parameters"
                                                                    CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic" ErrorMessage="Enter Disable Access Count"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtMiniPWDLen" runat="server" MaxLength="2"
                                                                    class="md-form-control form-control login_form_content_input requires_true" onblur="fnCheckZero()"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblMiniPWDLen" runat="server" Text="Minimum password length" CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvMinPwdlen" ControlToValidate="txtMiniPWDLen" runat="server" ValidationGroup=" Global Parameters"
                                                                    Display="Dynamic" ErrorMessage="Enter Minimum Password Length"></asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="txtMiniPWDLen"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtpwdrecycleitr" runat="server" MaxLength="2"
                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblpwdrecycleitr" runat="server" Text="Password Re-cycle Iteration"
                                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                                </label>
                                                            </div>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvPwdrecycle" ControlToValidate="txtpwdrecycleitr" ValidationGroup=" Global Parameters"
                                                                    CssClass="validation_msg_box_sapn" runat="server" Display="Dynamic" ErrorMessage="Enter Password Re-cycle Iteration"></asp:RequiredFieldValidator>
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtpwdrecycleitr"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <asp:Panel runat="server" GroupingText="Password Composition" ID="Panel3" CssClass="stylePanel">
                                                    <div class="row">
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkUpperCaseChar" runat="server" OnCheckedChanged="chkForcePWDChange_CheckedChanged"
                                                                    Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                  <asp:Label ID="lblUpperCase" runat="server" Text="Upper Case character" CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">

                                                                <asp:CheckBox ID="chkNumbers" runat="server" OnCheckedChanged="chkNumbers_CheckedChanged"
                                                                    Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 <asp:Label ID="lblNumbers" runat="server" Text="Number" CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkSpecialCharacters" runat="server" OnCheckedChanged="chkSpecialCharacters_CheckedChanged"
                                                                    Checked="true" />
                                                                <asp:Label ID="lblSpecialCharacters" runat="server" Text="Special characters" CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Month End Parameters" ID="TbCustomerRange" CssClass="tabpan"
                                BackColor="Red">
                                <HeaderTemplate>
                                    Customer Range
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlGL_Type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGL_Type_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="Label1" runat="server" Text="GL Type" CssClass="styleFieldLabel"></asp:Label>
                                                    </label>
                                                    <asp:HiddenField ID="hdngl" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlSLType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSLType_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:HiddenField ID="hdnsl" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label class="tess">
                                                        <asp:Label ID="lblSLType" runat="server" Text="SL Type" CssClass="styleFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <asp:Panel ID="pnlcustomerRange" runat="server" CssClass="cssStylePanel">
                                                <div id="div2" style="overflow: auto; height: 345px;" width="99%">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvcustomerrange" runat="server" AutoGenerateColumns="False" Width="100%" OnRowDeleting="gvInflow_Deleting" ShowFooter="true" class="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl.No." ItemStyle-HorizontalAlign="Right">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="SerialNoHidden" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                        <asp:Label ID="lblSerialNo" runat="server" Visible="false" Text='<%# Bind("Sno") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Lob_id" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbllob_id" runat="server" Text='<%# Bind("lob_id") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="LOB">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbllob" runat="server" Text='<%# Bind("LOB") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business">
                                                                        </asp:DropDownList>
                                                                    </FooterTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" Width="65%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="CashFlow_Flag_id" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblcashflow_id" runat="server" Text='<%# Bind("flag_id") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="CashFlow Flag">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblflag_desc" runat="server" Text='<%# Bind("Flag_Desc") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <uc:Suggest ID="ddlflag" Width="410px" runat="server" ServiceMethod="GetSearchOptionList" />
                                                                    </FooterTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" Width="65%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="GL Code">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblG_Code" runat="server" Text='<%# Bind("GL_Code") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <uc:Suggest ID="ddlGl_code" Width="182px" runat="server" AutoPostBack="true" ServiceMethod="GetGLCodeList"></uc:Suggest>
                                                                    </FooterTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" Width="15%" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="SL Code">
                                                                    <ItemTemplate>
                                                                        <%-- <asp:CheckBox ID="chkMLASLA" runat="server" Checked='<%# Bind("MLAandSLA") %>'/>--%>
                                                                        <asp:Label ID="lblsl_code" runat="server" Text='<%# Bind("SL_Code") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                    <FooterTemplate>
                                                                        <uc:Suggest ID="ddlSl_code" Width="182px" runat="server" AutoPostBack="true" ServiceMethod="GetSLCodeList"></uc:Suggest>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Old New" Visible="false">
                                                                    <ItemTemplate>
                                                                        <%-- <asp:CheckBox ID="chkMLASLA" runat="server" Checked='<%# Bind("MLAandSLA") %>'/>--%>
                                                                        <asp:Label ID="lbloldnew" runat="server" Text='<%# Bind("Old_New") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Remove" CssClass="grid_btn_delete" AccessKey="R"
                                                                            OnClientClick="return confirm('Are you sure want to Remove this record?');" ToolTip="Remove,Alt+R">
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:Button ID="btnAdd" runat="server" CommandName="Add" CssClass="grid_btn" AccessKey="T"
                                                                            Text="Add" ValidationGroup="Grid" ToolTip="Add,Alt+T" OnClick="btnAdd_Click" />
                                                                    </FooterTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" Width="10%" />
                                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                        <input id="hdnGlobalParamId" type="hidden" runat="server" value="0" />
                        <input id="hdnMonth_End_Params_ID" type="hidden" runat="server" value="0" />
                        <input id="hdnMonth_End_Params_Det_ID" type="hidden" runat="server" value="0" />
                        <input id="hdnUserId" type="hidden" runat="server" value="0" />
                        <input id="hdnUserLevelId" type="hidden" runat="server" value="0" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                        <%--<asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel" 
                    ForeColor="Red"></asp:Label>--%>
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click"
                        runat="server" type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                        runat="server" type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnExit_Click"
                        runat="server" type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%-- <asp:ValidationSummary ID="vsGlobalParamAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                            ShowMessageBox="false" HeaderText="Correct the following validation(s):" />--%>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
