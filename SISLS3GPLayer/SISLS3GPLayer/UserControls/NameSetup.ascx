<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NameSetup.ascx.cs" Inherits="UserControls_NameSetup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div class="row">

    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel" id="tdlblFirst_Name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtFirst_Name" runat="server" AutoPostBack="true" MaxLength="100" OnTextChanged="txtFirst_Name_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fFirst_Name" ValidChars=" .&" TargetControlID="txtFirst_Name"
                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtFirst_Name" runat="server" ControlToValidate="txtFirst_Name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblFirst_Name" runat="server" Text="First Name"></asp:Label>
            </label>
        </div>
    </div>


    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel" id="tdlblSecond_Name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtSecond_Name" runat="server" AutoPostBack="true" MaxLength="100" OnTextChanged="txtSecond_Name_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fteSecond_Name" ValidChars=" .&" TargetControlID="txtSecond_Name"
                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtSecond_Name" runat="server" ControlToValidate="txtSecond_Name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblSecond_Name" runat="server" Text="Second Name"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel" id="tdlblThird_Name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtThird_Name" runat="server" AutoPostBack="true" MaxLength="100" OnTextChanged="txtThird_Name_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fteThird_Name" ValidChars=" .&" TargetControlID="txtThird_Name"
                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtThird_Name" runat="server" ControlToValidate="txtThird_Name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblThird_Name" runat="server" Text="Third Name"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel" id="tdlblFourth_Name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtFourth_Name" runat="server" AutoPostBack="true" MaxLength="100" OnTextChanged="txtFourth_Name_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fteFourth_Name" ValidChars=" .&" TargetControlID="txtFourth_Name"
                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtFourth_Name" runat="server" ControlToValidate="txtFourth_Name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblFourth_Name" runat="server" Text="Fourth Name"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel" id="tdlblFifth_Name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtFifth_Name" runat="server" AutoPostBack="true" MaxLength="100" OnTextChanged="txtFifth_Name_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fteFifth_Name" ValidChars=" .&" TargetControlID="txtFifth_Name"
                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtFifth_Name" runat="server" ControlToValidate="txtFifth_Name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblFifth_Name" runat="server" Text="Fifth Name"></asp:Label>
            </label>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel" id="tdlblSixth_Name" runat="server" visible="false">
        <div class="md-input">
            <asp:TextBox ID="txtSixth_Name" runat="server" AutoPostBack="true" MaxLength="100" OnTextChanged="txtSixth_Name_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="fteSixth_Name" ValidChars=" .&" TargetControlID="txtSixth_Name"
                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" runat="server"
                Enabled="True">
            </cc1:FilteredTextBoxExtender>
            <div class="validation_msg_box">
                <asp:RequiredFieldValidator ID="rfvtxtSixth_Name" runat="server" ControlToValidate="txtSixth_Name"
                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" Enabled="false"></asp:RequiredFieldValidator>
            </div>
            <span class="highlight"></span>
            <span class="bar"></span>
            <label>
                <asp:Label ID="lblSixth_Name" runat="server" Text="Sixth Name"></asp:Label>
            </label>
        </div>
    </div>
</div>
