<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Sysadm_FASysExchangeMaster_Add, App_Web_tfexpijv" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" ToolTip="Document Path Setup" Text="Document Path Setup">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="pnlGen" runat="server" CssClass="stylePanel" GroupingText="Exchange Rate Details">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" class="md-form-control form-control"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label ID="lblLocation" runat="server" Text="Branch" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                        InitialValue="0" ValidationGroup="btnSave" ControlToValidate="ddlLocation"
                                        ErrorMessage="Select Location" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtDate" runat="server" ToolTip="Date" class="md-form-control form-control login_form_content_input requires_true"
                                    onmouseover="txt_MouseoverTooltip(this)" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblDate" runat="server" Text="Date" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvtxtDate" runat="server" Display="Dynamic" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                        ControlToValidate="txtDate" ErrorMessage="Enter Date" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">

                                <asp:HiddenField ID="hdn_BaseCur" runat="server" />
                                <asp:HiddenField ID="hdn_BasePrecision" runat="server" />
                                <asp:TextBox ID="txtBaseCur" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                    onmouseover="txt_MouseoverTooltip(this)" ToolTip="Base Currency" ReadOnly="true" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblBaseCur" runat="server" Text="Base Currency" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">

                                <asp:TextBox ID="txtTime" runat="server" ToolTip="Time" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_false" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblTime" runat="server" Text="Time" />
                                    <asp:Label ID="Label1" td="lblTimeFormat" Text="(HH:MM AM|PM)" runat="server" />
                                </label>
                                <asp:RegularExpressionValidator ID="regdir" runat="server" ControlToValidate="txtTime"
                                    ErrorMessage="Time Should be in the format (HH:MM AM|PM)" Display="None" ValidationGroup="btnSave"
                                    ValidationExpression="^((([0]?[1-9]|1[0-2])(:|\.)[0-5][0-9]((:|\.)[0-5][0-9])?( )?(AM|am|aM|Am|PM|pm|pM|Pm))|(([0]?[0-9]|1[0-9]|2[0-3])(:|\.)[0-5][0-9]((:|\.)[0-5][0-9])?))$">
                                </asp:RegularExpressionValidator>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvTime" runat="server" Display="Dynamic" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                        ControlToValidate="txtTime" ErrorMessage="Enter Time" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtBaseValue" MaxLength="9" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                    onmouseover="txt_MouseoverTooltip(this)" ToolTip="Base Currency Value" Style="text-align: right;" onkeypress="fnAllowNumbersOnly(true,false,this)" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblBaseval" runat="server" Text="Base Currency Value" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvtxtBaseValue" runat="server" Display="Dynamic" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                        ControlToValidate="txtBaseValue" ErrorMessage="Enter Base Currency Value" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="ftxtBaseValue" ValidChars="." TargetControlID="txtBaseValue"
                                        FilterType="Custom, Numbers" runat="server" Enabled="True" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox ID="chkLink" runat="server" ToolTip="Link" AutoPostBack="true" OnCheckedChanged="FunEnableDisable_URL" />
                                <asp:Label ID="lblLink" runat="server" Text="Link" />
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlExchangeCur" runat="server" ToolTip="Exchange Currency" class="md-form-control form-control"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlExchangeCur_SelectedIndexChanged" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label ID="lblExchCur" runat="server" Text="Exchange Currency" />
                                </label>
                                <asp:HiddenField ID="hdn_ExchPrecision" runat="server" />
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlExchangeCur" runat="server" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                        InitialValue="0" ValidationGroup="btnSave" ControlToValidate="ddlExchangeCur"
                                        ErrorMessage="Select Exchange Currency" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlDownload" runat="server" ToolTip="Download" class="md-form-control form-control"
                                    Enabled="false">
                                    <asp:ListItem Value="0" Text="--Select--" />
                                    <asp:ListItem Value="1" Text="Reuters" />
                                    <asp:ListItem Value="2" Text="Bloomberg" />
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label ID="lblDownload" runat="server" Text="Download" />
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtExchValue" MaxLength="9" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                    AutoPostBack="true" OnTextChanged="txtExchValue_TextChanged"
                                    onmouseover="txt_MouseoverTooltip(this)" ToolTip="Exchange Currency Value" Style="text-align: right;" onkeypress="fnAllowNumbersOnly(true,false,this)" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblExchValue" runat="server" Text="Exchange Currency Value" />
                                </label>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvtxtExchValue" runat="server" Display="Dynamic" ValidationGroup="btnSave" CssClass="validation_msg_box_sapn"
                                        ControlToValidate="txtExchValue" ErrorMessage="Enter Exchange Currency Value"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="ftxtExchValue" ValidChars="." TargetControlID="txtExchValue"
                                        FilterType="Custom, Numbers" runat="server" Enabled="True" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <asp:Label ID="lblUpload" runat="server" Text="Manual Upload" Visible="false" />
                                <asp:FileUpload ID="fupManUpload" runat="server" ToolTip="Manual Upload" Visible="false" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right" class="fixed_btn">
            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                type="button" accesskey="S">
                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
            </button>
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                type="button" accesskey="X">
                <i class="fa fa-times" aria-hidden="true"></i>&emsp;E<u>x</u>it
            </button>
        </div>
        <%-- <div class="row" style="float: right; margin-top: 5px;">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="save_btn fa fa-floppy-o" ValidationGroup="BtnSave"
                    OnClientClick="return fnCheckPageValidators()" OnClick="btnSave_Click" ToolTip="Save,Alt+S" AccessKey="S" />
                <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="save_btn fa fa-eraser-o"
                    CausesValidation="false" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" ToolTip="Clear,Alt+L" AccessKey="L" />
                <i class="fa fa-share btn_i" aria-hidden="true"></i>
                <asp:Button ID="btnCancel" runat="server" Text="Exit" CssClass="save_btn fa fa-share-o" OnClientClick="return fnConfirmExit();"
                    OnClick="btnCancel_Click" CausesValidation="false" ToolTip="Exit,Alt+X" AccessKey="X" />
            </div>
        </div>--%>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <%-- <asp:ValidationSummary ID="vsExchangeRateMaster" runat="server" ValidationGroup="vgLocationGroup" />--%>
                <asp:CustomValidator ID="cvExchangeRateMaster" runat="server"></asp:CustomValidator>
            </div>
        </div>
        <script type="text/javascript">

            function funChkDecimial(txtbox, prefixLen, sufixLen, strFieldName, IsZeroCheckReq) {
                var hdn = document.getElementById('<%=hdn_BasePrecision.ClientID%>');
                if (txtbox.value != '') {
                    if (IsZeroCheckReq) {
                        if (parseFloat(txtbox.value) == 0) {
                            txtbox.focus();
                            txtbox.value = '';
                            if (strFieldName == undefined) {
                                alert('Value should be greater than 0');
                                txtbox.value = "0";
                                txtbox.focus();
                                return false;
                            }
                            else {
                                alert(strFieldName + ' should be greater than 0');
                                txtbox.value = "0";
                                txtbox.focus();
                                return false;
                            }
                        }
                    }
                    if (isNaN(parseFloat(txtbox.value))) {
                        alert('Enter a valid decimal');
                        txtbox.value = "";
                        txtbox.focus();
                        return false;
                    }
                    else {
                        var str = txtbox.value.split('.');

                        if (str[0].length > prefixLen) {
                            if (strFieldName == '') {
                                alert('Value precision should not exceed ' + prefixLen + ' digits');
                            }
                            else {
                                alert(strFieldName + ' precision should not exceed ' + prefixLen + ' digits');
                            }
                            txtbox.focus();
                            return false;
                        }
                        txtbox.value = parseFloat(txtbox.value).toFixed(sufixLen);
                    }
                }
                return true;
            }
        </script>
    </div>
</asp:Content>
