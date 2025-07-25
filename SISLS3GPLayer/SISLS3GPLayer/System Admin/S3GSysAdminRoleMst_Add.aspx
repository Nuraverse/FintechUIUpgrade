<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" CodeFile="S3GSysAdminRoleMst_Add.aspx.cs" 
    Inherits="System_Admin_S3GSysAdminRoleMst_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
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
                        <div class="row">
                            <div id="divGrpCode" runat="server" class="col-lg-3 col-md-4 col-sm-6 col-xs-12" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtUserGroupCode" Visible="false" runat="server" MaxLength="2" onKeyPress="fnChangeLower_Upper(this);"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Visible="false" Text="User Group Code" ID="lblLOBCode" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:Panel ID="pnlLobList" runat="server" CssClass="stylePanel" GroupingText="Line Of Business" Width="100%">
                                        <div style="overflow: auto; height: 100px">
                                            <asp:GridView ID="GrvLOBList" runat="server" OnRowDataBound="GrvLOBList_RowDataBound" AutoGenerateColumns="False" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line Of Business">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblLOB_Name" runat="server" Text='<%#Eval("LOB_NAME")%>'></asp:Label>
                                                            <asp:Label ID="lblLOB_ID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkLOB" runat="server" />
                                                            <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
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
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtUserGroupName" runat="server" MaxLength="30" onKeyPress="fnChangeLower_Upper(this);"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fteUserGroupName" runat="server" TargetControlID="txtUserGroupName"
                                        FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" ValidChars=" "
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="User Group Name" ID="lblUserGroupName" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvUserGroupName" ValidationGroup="btnSave" runat="server" ErrorMessage="Enter the User Group Name"
                                            ControlToValidate="txtUserGroupName" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtGroupEmail" runat="server" MaxLength="45"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fteGroupEmail" runat="server" TargetControlID="txtGroupEmail"
                                        FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars="._-@"
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Group Email" ID="lblGroupEmail" CssClass="styleFieldLabel">
                                        </asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RegularExpressionValidator ID="revGroupEmail" runat="server" ValidationGroup="btnSave" ControlToValidate="txtGroupEmail" CssClass="validation_msg_box_sapn"
                                            Display="Dynamic" SetFocusOnError="True" ErrorMessage="Enter a valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                    <asp:CheckBox ID="chkActive" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Panel ID="PnlRoleCode" runat="server" CssClass="stylePanel" GroupingText="Role code" Width="100%">
                                        <div style="overflow: auto; height: 300px">
                                            <asp:GridView ID="grvRoleCode" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvRoleCode_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField ItemStyle-HorizontalAlign="Right" DataField="SINO" HeaderText="S.No" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Role Code">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRoleCode" runat="server" Text='<%#Eval("Role_Code")%>'></asp:Label>
                                                            <asp:Label
                                                                ID="lblRoleCenterID" runat="server" Visible="false" Text='<%#Eval("Role_Code_ID")%>'></asp:Label>
                                                            <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="ProgramDesc" HeaderText="Program Description" />
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Access">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                        <td colspan="4" align="center">
                                                                            Access
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
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:CheckBox ID="chkAdd" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsAdd")) %>' ToolTip="Add" /></td>
                                                                    <td align="center">
                                                                        <asp:CheckBox ID="chkModify" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsModify")) %>' ToolTip="Modify" /></td>
                                                                    <td align="center">
                                                                        <asp:CheckBox ID="chkDelete" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsDelete")) %>' ToolTip="Delete" /></td>
                                                                    <td align="center">
                                                                        <asp:CheckBox ID="chkView" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsView")) %>' ToolTip="View" /></td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="false">
                                                        <HeaderTemplate>
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                        <td>Select All
                                                                        </td>
                                                                    </tr>
                                                                    <tr align="center">
                                                                        <td colspan="4">
                                                                            <asp:CheckBox ID="chkAll" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelRoleCode" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelRoleCode_CheckedChanged" />
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
                        </div>
                        <div class="btn_height"></div>
                        <div align="right" class="fixed_btn">
                            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" validationgroup="btnSave" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                                type="button" accesskey="S">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="L">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none;">
                                <div class="md-input">
                                    <asp:ValidationSummary CssClass="styleSummaryStyle" ID="vsUserGroup" runat="server" ShowMessageBox="false"
                                        ShowSummary="true" HeaderText="Please correct the following validation(s):  " />
                                </div>
                            </div>
                        </div>
                        <div class="row" style="display: none;">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:Label ID="Label1" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                                    <asp:CustomValidator ID="CVUsermanagement" runat="server" Display="None" ValidationGroup="save"></asp:CustomValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

