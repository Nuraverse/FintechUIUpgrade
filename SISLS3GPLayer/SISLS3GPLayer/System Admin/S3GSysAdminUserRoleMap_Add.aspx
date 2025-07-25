<%@ Page Title="" Language="C#" MasterPageFile="~/Common/S3GMasterPageCollapse.master" AutoEventWireup="true" CodeFile="S3GSysAdminUserRoleMap_Add.aspx.cs" Inherits="System_Admin_S3GSysAdminUserRoleMap_Add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
        function Common_ItemSelected(sender, e) {
            var hdnCommonID = $get('<%= hdnUserID.ClientID %>');
            hdnCommonID.value = e.get_value();
        }
        function Common_ItemPopulated(sender, e) {
            var hdnCommonID = $get('<%= hdnUserID.ClientID %>');
            hdnCommonID.value = '';
        }
        function RoleName_ItemSelected(sender, e) {
            var hdnRoleID = $get('<%= hdnRoleID.ClientID %>');
            hdnRoleID.value = e.get_value();
        }
        function RoleName_ItemPopulated(sender, e) {
            var hdnRoleID = $get('<%= hdnRoleID.ClientID %>');
            hdnRoleID.value = '';
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" ToolTip="User Role Mapping" Text="User Role Mapping">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
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
                                                            <asp:CheckBox ID="chkLOB" runat="server" AutoPostBack="true" OnCheckedChanged="chkLOB_OnCheckedChanged" />
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
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtUserGroupName" runat="server" MaxLength="40" onKeyPress="fnChangeLower_Upper(this);"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fteUserGroupName" runat="server" TargetControlID="txtUserGroupName"
                                        FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" ValidChars=" "
                                        Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" Text="Role Map Name" ID="lblUserGroupName" CssClass="styleReqFieldLabel">
                                        </asp:Label>
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvUserGroupName" runat="server" ErrorMessage="Enter the Role Map Name"
                                            ControlToValidate="txtUserGroupName" SetFocusOnError="true" CssClass="validation_msg_box_sapn" ValidationGroup="btnSave"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                    <asp:CheckBox ID="chkActive" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Panel GroupingText="User Filter" ToolTip="User Filter" Width="100%"
                            ID="pnlUsers" runat="server" CssClass="stylePanel">
                            <asp:HiddenField ID="hdnUserID" runat="server" />
                            <asp:GridView runat="server" ShowFooter="true"
                                OnRowCommand="grvUsers_RowCommand"
                                ID="grvUsers" Width="99%" OnRowDeleting="grvUsers_RowDeleting"
                                AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblUserName" Text='<%#Eval("USER_NAME")%>'></asp:Label>
                                            <asp:Label runat="server" ID="lblUser_ID" Text='<%#Eval("USER_ID")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtFUserName" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                                    OnTextChanged="txtFUserName_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <cc1:AutoCompleteExtender ID="aceMOname" MinimumPrefixLength="3" OnClientPopulated="Common_ItemPopulated"
                                                    OnClientItemSelected="Common_ItemSelected" runat="server" TargetControlID="txtFUserName"
                                                    ServiceMethod="GetUserList" CompletionSetCount="5" Enabled="True"
                                                    CompletionListCssClass="CompletionListWithFixedHeight" DelimiterCharacters=";,:"
                                                    CompletionListItemCssClass="CompletionListItemCssClass" CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                                </cc1:AutoCompleteExtender>
                                                <cc1:TextBoxWatermarkExtender ID="wmeUserName" runat="server" TargetControlID="txtFUserName"
                                                    WatermarkText="--Select--">
                                                </cc1:TextBoxWatermarkExtender>
                                            </div>
                                            <%-- <asp:RequiredFieldValidator ID="rfvUserName" CssClass="styleMandatoryLabel" runat="server"
                                                                        ControlToValidate="txtFUserName" ErrorMessage="Select the User Name" 
                                                                        Display="None"></asp:RequiredFieldValidator>--%>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                OnClientClick="return confirm('Are you sure you want to Remove this record?');" AccessKey="R" ToolTip="Remove,[Alt+R]" CssClass="grid_btn_delete"></asp:Button>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="AddNew"
                                                CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Alt+T" AccessKey="T"></asp:Button>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                                <RowStyle HorizontalAlign="left" />
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                    <div class="col-md-6">
                        <asp:Panel GroupingText="Roles Filter" ToolTip="Roles Filter" Width="100%"
                            ID="Panel1" runat="server" CssClass="stylePanel">
                            <asp:HiddenField ID="hdnRoleID" runat="server" />
                            <asp:GridView runat="server" ShowFooter="true"
                                OnRowCommand="grvRoles_RowCommand"
                                ID="grvRoles" Width="99%" OnRowDeleting="grvRoles_RowDeleting"
                                AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="2%" HeaderText="Sl.No.">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsno1" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                            <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("Sno")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Role Name">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblUserName" Text='<%#Eval("ROLE_NAME")%>'></asp:Label>
                                            <asp:Label runat="server" ID="lblUser_ID" Text='<%#Eval("ROLEMASTER_ID")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtFRoleName" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                                    OnTextChanged="txtFRoleName_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <cc1:AutoCompleteExtender ID="aceRoleName" MinimumPrefixLength="3" OnClientPopulated="RoleName_ItemPopulated"
                                                    OnClientItemSelected="RoleName_ItemSelected" runat="server" TargetControlID="txtFRoleName"
                                                    ServiceMethod="GetRoleList" CompletionSetCount="5" Enabled="True"
                                                    CompletionListCssClass="CompletionListWithFixedHeight" DelimiterCharacters=";,:"
                                                    CompletionListItemCssClass="CompletionListItemCssClass" CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                    ShowOnlyCurrentWordInCompletionListItem="true">
                                                </cc1:AutoCompleteExtender>
                                                <cc1:TextBoxWatermarkExtender ID="wmeRoleName" runat="server" TargetControlID="txtFRoleName"
                                                    WatermarkText="--Select--">
                                                </cc1:TextBoxWatermarkExtender>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"
                                                OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove,[Clt+Shift+E]" AccessKey="E"></asp:Button>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="btnAdd" Width="50px" runat="server" CommandName="AddNew"
                                                CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Clt+Shift+D" AccessKey="D"></asp:Button>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                                <RowStyle HorizontalAlign="left" />
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
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
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none;">
                        <asp:ValidationSummary ID="vsGlobal" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):  " ValidationGroup="btnSave" />
                    </div>
                </div>
                <div class="row" style="display: none;">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:Label ID="Label1" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        <asp:CustomValidator ID="CVUsermanagement" runat="server" Display="None" ValidationGroup="save"></asp:CustomValidator>
                    </div>
                </div>
            </div>
            <input type="hidden" id="hdnID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

