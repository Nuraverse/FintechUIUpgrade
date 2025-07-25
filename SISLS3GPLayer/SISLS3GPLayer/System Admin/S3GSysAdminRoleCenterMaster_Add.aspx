<%@ Page Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="S3GSysAdminRoleCenterMaster_Add.aspx.cs"
    Inherits="System_Admin_S3GSysAdminRoleCenterMaster_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                    <%-- <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <cc1:ComboBox ID="cmbRoleCenterCode" runat="server" CssClass="WindowsStyle1" DropDownStyle="Simple"
                                        AutoPostBack="True" onkeyup="maxlengthfortxt(1);" AppendDataBoundItems="true" MaxLength="1"
                                        ItemInsertLocation="Append" AutoCompleteMode="SuggestAppend" OnItemInserted="cmbRoleCenterCode_ItemInserted"
                                        TabIndex="1" OnSelectedIndexChanged="cmbRoleCenterCode_SelectedIndexChanged">
                                    </cc1:ComboBox>
                                    <%-- <asp:DropDownList ID="cmbRoleCenterCode" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="cmbRoleCenterCode_SelectedIndexChanged"
                                        onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                    </asp:DropDownList>--%>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Role Center Code" ID="lblRoleCenterCode" ToolTip="Role Center Code" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RegularExpressionValidator ID="revUTPACode" runat="server" Display="Dynamic" ControlToValidate="cmbRoleCenterCode"
                                            ErrorMessage="Select/Enter a valid Role Center Code(1-9,A-Z)" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="True" ValidationExpression="^[1-9a-zA-Z]+$"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRoleCenterName" runat="server" MaxLength="30"
                                        class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" TabIndex="2"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtRoleCenterName"
                                        FilterType="UppercaseLetters, LowercaseLetters,Numbers,Custom" ValidChars=" "
                                        Enabled="true">
                                    </cc1:FilteredTextBoxExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvProductCode" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="txtRoleCenterName" ErrorMessage="Enter Role Center Name" Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Role Center Name" ToolTip="Role Center Name" ID="lblRoleCentrName" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlModule" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlModule_SelectedIndexChanged" TabIndex="3"
                                        onmouseover="ddl_itemchanged(this);" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn"
                                            runat="server" ControlToValidate="ddlModule" InitialValue="0" ErrorMessage="Select Module"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Module" ToolTip="Module" ID="lblModule" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <%-- </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProgram" runat="server" TabIndex="4"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"
                                        onmouseover="ddl_itemchanged(this);" ToolTip="--Select--" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlProgram" InitialValue="0" ErrorMessage="Select Program"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Program" ToolTip="Program" ID="lblProgram" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtWFProgram" runat="server" MaxLength="3" AutoPostBack="True"
                                        OnTextChanged="txtWFProgram_TextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FTE1" runat="server" TargetControlID="txtWFProgram"
                                        FilterType="Numbers,Custom" Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Workflow Program" ToolTip="Workflow Program" ID="Label1" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtRoleCode" runat="server" MaxLength="5"
                                        class="md-form-control form-control login_form_content_input requires_true"
                                        ReadOnly="True" Style="text-transform: uppercase"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Role Code" ToolTip="Role Code" ID="lblRolecode" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <%--</div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" ToolTip="Active" />
                                    <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active" ToolTip="Active">
                                    </asp:Label>
                                </div>
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
                                <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                            <button class="css_btn_enabled" id="btnDelete" title="Delete[Alt+T]" causesvalidation="false"
                                onclick="if(fnConfirmDelete())" onserverclick="btnDelete_Click" runat="server"
                                type="button" accesskey="T">
                                <i class="fa fa-times" aria-hidden="true"></i>&emsp;Dele<u>t</u>e
                            </button>
                        </div>
                        <%-- <div class="row" style="float: right; margin-top: 5px;">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                <asp:Button ID="btnSave" runat="server" CssClass="save_btn fa fa-floppy-o" OnClick="btnSave_Click" AccessKey="S"
                                    OnClientClick="return fnCheckPageValidators();" Text="Save" ToolTip="Save,Alt+S" />
                                <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                <asp:Button ID="btnClear" runat="server" CausesValidation="false" class="styleSubmitButton"
                                    OnClientClick="return fnConfirmClear();" CssClass="save_btn fa fa-eraser-o" OnClick="btnClear_Click" Text="Clear" ToolTip="Clear,Alt+L" AccessKey="L" />
                                <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="false" CssClass="save_btn fa fa-share-o" OnClientClick="return fnConfirmExit();"
                                    OnClick="btnCancel_Click" Text="Exit" ToolTip="Exit,Alt+X" AccessKey="X" />
                                <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                <asp:Button ID="btnDelete" runat="server" AccessKey="I" CausesValidation="False"
                                     OnClientClick="return confirm('Do you want to Delete this record?');"
                                    ToolTip="Delete,Alt+D" CssClass="save_btn fa fa-share-o" OnClick="btnDelete_Click" Text="Delete"
                                    Visible="false" />
                            </div>
                    </div>--%>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="md-input">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%--<asp:ValidationSummary ID="RoleCenterMasterDetailsAdd" runat="server" ShowSummary="true" Visible="false"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):" />--%>
                        </div>
                    </div>
                    <input type="hidden" id="hdnID" runat="server" />
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">

        function fnAvoidZero(isSpaceAllowed) {
            //debugger;
            var sKeyCode = window.event.keyCode;
            //alert(sKeyCode);
            if ((!isSpaceAllowed) && (sKeyCode == 32)) {
                window.event.keyCode = 0;
                return false;
            }

            if (sKeyCode == 48 || sKeyCode == 96) {
                window.event.keyCode = 0;
                return false;
            }

            //                if ((sKeyCode < 48 || sKeyCode > 57) && sKeyCode != 32 && sKeyCode != 95 && sKeyCode != 46) {
            //                    window.event.keyCode = 0;
            //                    return false;
            //                }


        }
    </script>
</asp:Content>
