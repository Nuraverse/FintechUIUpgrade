<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    Inherits="ChangePassword" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <script language="javascript" type="text/javascript">
        function fnhideMenuButton() {
            document.getElementById('ctl00_imgShowMenu').style.width = '0';
            document.getElementById('ctl00_imgHideMenu').style.width = '0';
            document.getElementById('divMenu').style.width = '0';
        }

        function fnhideHeaderControls() {
            document.getElementById('tblHeaderControls').style.display = 'none';
        }

        function fnCheckNewPWD() {
            //
            var txtNewPWD = (document.getElementById('<%=txtNewPwd.ClientID %>'));
            var txtRetypeNewPwd = (document.getElementById('<%=txtRetypeNewPwd.ClientID %>'));

            if ((txtNewPWD.value != " ") && (txtRetypeNewPwd.value != " ")) {
                ValidatorEnable(document.getElementById('<%=cvNewPWD.ClientID%>'), true);
            }
            else {
                ValidatorEnable(document.getElementById('<%=cvNewPWD.ClientID%>'), false);
            }
        }

        function fnCheckOldPWD() {
            var txtOldPWD = (document.getElementById('<%=txtOldPwd.ClientID %>'));
            var txtNewPWD = (document.getElementById('<%=txtNewPwd.ClientID %>'));

            if ((txtOldPWD.value.Trim() != " ") && (txtNewPWD.value != " ")) {
                ValidatorEnable(document.getElementById('<%=cvOldNewPWD.ClientID%>'), true);
            }
            else {
                ValidatorEnable(document.getElementById('<%=cvOldNewPWD.ClientID%>'), false);
            }


        }

        function fnValidatePWd() {
            //
            var uppercaseVal;
            var NumeralVal;
            var specCharVal;
            var pwdLengVal;

            uppercaseVal = document.getElementById('<%=hdnUpperCase.ClientID%>');
            NumeralVal = document.getElementById('<%=hdnNumeral.ClientID%>');
            specCharVal = document.getElementById('<%=hdnSpecChar.ClientID%>');
            pwdLengVal = document.getElementById('<%=hdnPwdLength.ClientID%>');
        }

    </script>

    <asp:UpdatePanel ID="UPChangePWD" runat="server">
        <ContentTemplate>

            <div class="row" align="center">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <%--<asp:Panel ID="PnlChangePassword" runat="server" BackColor="White" Width="380px"
                        BorderColor="DimGray" BorderWidth="1px"  GroupingText="Change Password">--%>
                     <asp:Panel runat="server" ID="pnlChangePwd" Width="380px" GroupingText="Change Password" CssClass="stylePanel">
                         
                        <div id="tab-content" class="tab-content">
                            <div class="tab-pane fade in active show" id="tab1">
                                <div class="row">
                                    <div class="col">
                                        <h6 class="title_name">
                                           <%-- <asp:label runat="server" Text="Change Password" ID="lblChangePwd" CssClass="styleDisplayLabel"></asp:label>--%>
                                             <%-- <asp:Panel runat="server" ID="pnlChangePwd" Width="100%" GroupingText="ChangePassword" CssClass="stylePanel"></asp:Panel>--%>
                                        </h6>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password" MaxLength="15"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvOldPwd" runat="server" ControlToValidate="txtOldPwd"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter Old password"
                                                    ValidationGroup="btnSaveChgPWD"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Old Password" ID="lblOldpwd" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtNewPwd" EnableTheming="true" runat="server" TextMode="Password" MaxLength="15" onchange="fnCheckOldPWD();"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" ControlToValidate="txtNewPwd"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter New password"
                                                    ValidationGroup="btnSaveChgPWD"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:CompareValidator ID="cvOldNewPWD" runat="server" ControlToValidate="txtNewPwd"
                                                ControlToCompare="txtOldPwd" Display="None" Operator="NotEqual" ErrorMessage="Old and New Password should not be same"
                                                ValidationGroup="btnSaveChgPWD"></asp:CompareValidator>
                                            <label>
                                                <asp:Label runat="server" Text="New Password" ID="lblNewPwd" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRetypeNewPwd" EnableTheming="true" runat="server" MaxLength="15" TextMode="Password"
                                                onchange="fnCheckNewPWD();" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvRetypeNewPwd" runat="server" ControlToValidate="txtRetypeNewPwd"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ErrorMessage="Re-Type New password"
                                                    ValidationGroup="btnSaveChgPWD"></asp:RequiredFieldValidator>
                                            </div>
                                            <asp:CompareValidator ID="cvNewPWD" runat="server" ControlToValidate="txtRetypeNewPwd"
                                                ControlToCompare="txtNewPwd" Display="None" ErrorMessage="New Password and Re-Type PWD must be same"
                                                ValidationGroup="btnSaveChgPWD"></asp:CompareValidator>
                                            <label>
                                                <asp:Label runat="server" Text="Re-Type New Password" ID="lblRetypeNewPwd" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div align="right">

                                    <button class="css_btn_enabled" id="btnSaveChg" onclick="if(fnCheckPageValidators('btnSaveChgPWD'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                        type="button" validationgroup="btnSaveChgPWD">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>C</u>hange Password
                                    </button>
                                   <button class="css_btn_enabled" id="btnCancel" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                        type="button" title="Exit[Alt+X]"   accesskey="X">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                                    </button>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input type="hidden" id="hdnUpperCase" runat="server" />
                                        <input type="hidden" id="hdnNumeral" runat="server" />
                                        <input type="hidden" id="hdnSpecChar" runat="server" />
                                        <input type="hidden" id="hdnPwdLength" runat="server" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label>
                                            <asp:Label ID="lblPwdMessage" runat="server" Style="font-size: 11px"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:ValidationSummary ID="vsChangePassword" runat="server" HeaderText="Correct the following validation(s):"
                                            CssClass="styleMandatoryLabel" Width="100%" ValidationGroup="btnSaveChgPWD" />
                                    </div>
                                </div>
                            </div>
                        </div>
            </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
