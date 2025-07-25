<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddressSetup.ascx.cs" Inherits="UserControls_AddressSetup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>



<div class="row">
    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdddlPostal_Code" runat="server" visible="false">
        <div class="md-input">
            <uc2:Suggest ID="ddlPostal_Code" runat="server" ServiceMethod="GetAddressPostalCodeList" IsMandatory="false" />
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblPostal_Code" runat="server" Text="Postal Code"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdtxtPost_Box_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtPost_Box_No" runat="server" MaxLength="12"
                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtPost_Box_No" runat="server" FilterType="Numbers"
                TargetControlID="txtPost_Box_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtPost_Box_No" runat="server" ControlToValidate="txtPost_Box_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblPost_Box_No" runat="server" Text="Post Box No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdtxtWay_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtWay_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftetxtWay_No" runat="server" ValidChars="!@#$%^*()|/-"
                FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" TargetControlID="txtWay_No">
            </cc1:FilteredTextBoxExtender>

            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtWay_No" runat="server" ControlToValidate="txtWay_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblWay_No" runat="server" Text="Way No"></asp:Label>
            </label>
        </div>
    </div>
    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblHouse_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtHouse_No" runat="server"
                class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftetxtHouse_No" runat="server" ValidChars="!@#$%^*()|/-"
                FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" TargetControlID="txtHouse_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtHouse_No" runat="server" ControlToValidate="txtHouse_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblHouse_No" runat="server" Text="House No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblBlock_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtBlock_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftetxtBlock_No" runat="server" ValidChars="!@#$%^*()|/-"
                FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" TargetControlID="txtBlock_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtBlock_No" runat="server" ControlToValidate="txtBlock_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblBlock_No" runat="server" Text="Block No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblFlat_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtFlat_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftetxtFlat_No" runat="server" ValidChars="!@#$%^*()|/-"
                FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" TargetControlID="txtFlat_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtFlat_No" runat="server" ControlToValidate="txtFlat_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblFlat_No" runat="server" Text="Flat No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblLand_Mark" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtLand_Mark" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="ftetxtLand_Mark" runat="server" ValidChars="!@#$%^*()|/- "

                FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" TargetControlID="txtLand_Mark">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtLand_Mark" runat="server" ControlToValidate="txtLand_Mark"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblLand_Mark" runat="server" Text="Land Mark"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblArea_Sheik" runat="server" visible="false">
        <div class="md-input">
            <%--<uc2:Suggest ID="ddlArea_Sheik" runat="server" ServiceMethod="GetAddressArea_SheikList" IsMandatory="false" />--%>
            <asp:TextBox ID="txtArea_Sheik" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
              <cc1:FilteredTextBoxExtender ID="ftetxtArea_Sheik" runat="server" ValidChars="!@#$%^*()|/- "
                FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" TargetControlID="txtArea_Sheik">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtArea_Sheik" runat="server" ControlToValidate="txtArea_Sheik"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblArea_Sheik" runat="server" Text="Area Sheik"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblRes_Phone_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtRes_Phone_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtRes_Phone_No" runat="server" FilterType="Numbers"
                TargetControlID="txtRes_Phone_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtRes_Phone_No" runat="server" ControlToValidate="txtRes_Phone_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblRes_Phone_No" runat="server" Text="Residence Phone No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblRes_Fax_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtRes_Fax_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtRes_Fax_No" runat="server" FilterType="Numbers"
                TargetControlID="txtRes_Fax_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtRes_Fax_No" runat="server" ControlToValidate="txtRes_Fax_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblRes_Fax_No" runat="server" Text="Residence Fax No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblMob_Phone_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtMob_Phone_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtMob_Phone_No" runat="server" FilterType="Numbers"
                TargetControlID="txtMob_Phone_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtMob_Phone_No" runat="server" ControlToValidate="txtMob_Phone_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblMob_Phone_No" runat="server" Text="Mobile Phone No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblContact_name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtContact_name" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="60"></asp:TextBox>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtContact_name" runat="server" ControlToValidate="txtContact_name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblContact_name" runat="server" Text="Contact Name"></asp:Label>
            </label>
        </div>
    </div>


    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblContact_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtContact_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtContact_No" runat="server" FilterType="Numbers"
                TargetControlID="txtContact_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtContact_No" runat="server" ControlToValidate="txtContact_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblContact_No" runat="server" Text="Contact No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdtxtOff_Phone_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtOff_Phone_No" runat="server"
                class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtOff_Phone_No" runat="server" FilterType="Numbers"
                TargetControlID="txtOff_Phone_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtOff_Phone_No" runat="server" ControlToValidate="txtOff_Phone_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblOff_Phone_No" runat="server" Text="Office Phone No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblOff_Fax_No" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtOff_Fax_No" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="12"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtOff_Fax_No" runat="server" FilterType="Numbers"
                TargetControlID="txtOff_Fax_No">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtOff_Fax_No" runat="server" ControlToValidate="txtOff_Fax_No"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblOff_Fax_No" runat="server" Text="Office Fax No"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="tdlblCust_Email" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtCust_Email" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="100"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fttxtCust_Email" runat="server" TargetControlID="txtCust_Email"
                FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars="._-@"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>

            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtCust_Email" runat="server" ControlToValidate="txtCust_Email"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revtxtCust_Email" runat="server" ControlToValidate="txtCust_Email" Enabled="false" CssClass="validation_msg_box_sapn"
                    Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter a valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblCust_Email" runat="server" Text="Customer Email"></asp:Label>
            </label>
        </div>
    </div>
</div>

