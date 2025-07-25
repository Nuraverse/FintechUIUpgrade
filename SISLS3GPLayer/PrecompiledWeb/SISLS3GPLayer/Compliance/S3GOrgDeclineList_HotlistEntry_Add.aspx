<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Origination_S3GOrgDeclineList_HotlistEntry_Add, App_Web_aojrc4jn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <uc1:Suggest ID="ddlNationality" runat="server" ServiceMethod="GetNationalityList" IsMandatory="true" ToolTip="Nationality" class="md-form-control form-control"
                                        ValidationGroup="Save" ErrorMessage="Select Nationality" AutoPostBack="true" OnItem_Selected="ddlNationality_Item_Selected" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblNationality" CssClass="styleReqFieldLabel" Text="Nationality"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlConstitutionName" ToolTip="Constitution Name" runat="server" InitialValue="--Select--" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlConstitutionName_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvConstitutionName" runat="server"
                                            ControlToValidate="ddlConstitutionName" Display="Dynamic" ErrorMessage="Select Constitution Name"
                                            InitialValue="0" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblConstitutionName" CssClass="styleReqFieldLabel"
                                            Text="Constitution Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlNegativeList_Type" runat="server" ToolTip="NegativeList Type" class="md-form-control form-control"></asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvddlNegativeList_Type" runat="server"
                                            ControlToValidate="ddlNegativeList_Type" Display="Dynamic" ErrorMessage="Select NegativeList Type"
                                            InitialValue="0" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNegativeList_Type" runat="server" CssClass="styleReqFieldLabel" Text="NegativeList Type"></asp:Label>
                                    </label>
                                </div>
                            </div>


                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:RadioButtonList ID="rblProspectCust" runat="server" ToolTip="Prospect/Customer" RepeatDirection="Horizontal" CssClass="md-form-control form-control radio" AutoPostBack="true" OnSelectedIndexChanged="rblProspectCust_SelectedIndexChanged">
                                        <asp:ListItem Value="1" Text="Prospect"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Customer"></asp:ListItem>
                                    </asp:RadioButtonList>

                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvrblProspectCust" runat="server"
                                            ControlToValidate="rblProspectCust" Display="Dynamic" ErrorMessage="Select Prospect or Customer"
                                            InitialValue="" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divCustomerName" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                        Style="display: none;" MaxLength="50"></asp:TextBox>
                                    <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" IsMandatory="false" AutoPostBack="true" DispalyContent="Both"
                                        strLOV_Code="CUS_NGL" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" class="md-form-control form-control" />
                                    <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                        Style="display: none" />
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>

                                    <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer" Enabled="false"
                                            ValidationGroup="Save" SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <label>
                                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divProspect" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtProspectName" runat="server" MaxLength="50" ToolTip="Prospect Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvtxtProspectName" runat="server"
                                            ControlToValidate="txtProspectName" Display="Dynamic" ErrorMessage="Enter Prospect Name"
                                            SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblProspectName" runat="server" Text="Prospect Name" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProposalNo" runat="server" ToolTip="Proposal Number" InitialValue="--Select--" class="md-form-control form-control"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblProposalNo" runat="server" Text="Proposal Number"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divProspectMob" runat="server">
                                <div class="md-input">
                                    <asp:TextBox ID="txtProspectMobile" MaxLength="100" runat="server" ToolTip="Prospect Mobile" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fttxtProspectMobile" runat="server" ValidChars="-+" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                        TargetControlID="txtProspectMobile">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblProspectMobile" runat="server" Text="Prospect Mobile"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlNegativeList_Reason" runat="server" ToolTip="NegativeList Reason" class="md-form-control form-control"></asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvddlNegativeList_Reason" runat="server"
                                            ControlToValidate="ddlNegativeList_Reason" Display="Dynamic" ErrorMessage="Select Reason"
                                            InitialValue="0" SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNegativeListReason" runat="server" Text="Reason" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtIdentityValue" MaxLength="20" runat="server" ToolTip="NID/CR/LC No" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fttxtIdentityValue" runat="server" ValidChars="/" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                        TargetControlID="txtIdentityValue">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ValidationGroup="Save" ID="rfvtxtIdentityValue" runat="server"
                                            ControlToValidate="txtIdentityValue" Display="Dynamic" ErrorMessage="Enter NID/CR/LC Number"
                                            SetFocusOnError="True" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblIdentityValue" runat="server" Text="NID / CR / LC NO" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divProspecAddress" runat="server">
                                <div class="md-input">
                                    <asp:TextBox ID="txtProspectAddress" runat="server" TextMode="MultiLine" ToolTip="Prospect Address" onkeydown="maxlengthfortxt(100);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblProspectAddress" runat="server" Text="Prospect Address"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtNegativelistRemarks" runat="server" TextMode="MultiLine" ToolTip="Remarks" onkeydown="maxlengthfortxt(100);" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNegativeListRemarks" runat="server" Text="Remarks"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDeclineDate" runat="server" Enabled="false" ToolTip="Decline Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:CalendarExtender ID="ceDeclineDate" runat="server" Enabled="false" TargetControlID="txtDeclineDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvtxtDeclineDate" runat="server" ControlToValidate="txtDeclineDate" ErrorMessage="Select Decline Date"
                                            Display="Dynamic" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDeclineDate" runat="server" Text="Decline Date" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCodRemarks" runat="server" TextMode="MultiLine" ToolTip="Codified Remarks" onkeydown="maxlengthfortxt(100);" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblRemarks" runat="server" Text="Codified Remarks"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" id="divIsActive" runat="server">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkIs_Active" runat="server" ToolTip="Active" Enabled="false"  />                                    
                                    <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators('Save'))" validationgroup="Submit"
                        type="button" accesskey="S" causesvalidation="false" title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>

                    <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>

                    <button class="css_btn_enabled" id="btnExit" onserverclick="btnExit_Click" runat="server" causesvalidation="false" title="Exit[Alt+X]" onclick="if(fnConfirmExit())"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }

        //function fnTrashSuggest(e) {


        //    //Sathish R--13-11-2018
        //    if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
        //        document.getElementById(e + '_txtItemName').value = "";
        //    }
        //    if (document.getElementById(e + '_txtItemName').value == "") {
        //        document.getElementById(e + '_hdnSelectedValue').value = "0";
        //    }
        //    if (document.getElementById(e + '_txtLastSelectedText').value != "") {

        //        if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
        //            document.getElementById(e + '_txtItemName').value = "";
        //            document.getElementById(e + '_hdnSelectedValue').value = "0";
        //        }
        //    }
        //}
        <%-- function fnTrashCustomerSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";


                }
            }
        }--%>


    </script>
</asp:Content>

