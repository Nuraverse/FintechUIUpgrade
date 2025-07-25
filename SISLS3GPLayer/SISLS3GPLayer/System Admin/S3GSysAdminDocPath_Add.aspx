<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    AutoEventWireup="true" CodeFile="S3GSysAdminDocPath_Add.aspx.cs" Inherits="System_Admin_S3GSysAdminDocPath_Add_" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" ToolTip="Document Path Setup">
                            </asp:Label>
                        </h6>
                    </div>
                    <%--  <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOBcode" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOBcode_SelectedIndexChanged"
                                        class="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblLOBcode" runat="server" Text="Line of Business" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlRolecode" runat="server" AutoPostBack="false"
                                        class="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblRolecode" runat="server" Text="Role Description" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvRoleCode" runat="server" ErrorMessage="Select Role Description" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="ddlRolecode" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <%--  </div>
                        <div class="row">--%>
                            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDocPath" runat="server" MaxLength="450" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="FtxtDocPath" runat="server" TargetControlID="txtDocPath"
                                        FilterType="Numbers,Custom" FilterMode="InvalidChars" InvalidChars="." Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblDocPath" runat="server" Text="Document Path" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvDocPath" runat="server" ErrorMessage="Enter Document Path" CssClass="validation_msg_box_sapn"
                                            ControlToValidate="txtDocPath" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" ToolTip="Active" />
                                </div>
                            </div>
                            <%--  </div>
                        <div class="row">--%>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlDocumentflag" runat="server" Visible="false" onmouseover="ddl_itemchanged(this);">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <span runat="server" id="lblErrorMessage" style="color: Red; font-size: medium"></span>
                                </div>
                            </div>
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
                </div>
                <%--  <div class="row" style="float: right; margin-top: 5px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="save_btn fa fa-floppy-o"
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
                        <%--     <asp:ValidationSummary ID="vsDocPathAdd" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel" Style="display: none" 
                            ShowMessageBox="false" HeaderText="Correct the following Error(s):" />--%>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
