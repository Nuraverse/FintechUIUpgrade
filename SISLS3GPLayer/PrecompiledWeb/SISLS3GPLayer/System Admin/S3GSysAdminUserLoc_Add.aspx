<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="System_Admin_S3GSysAdminUserLoc_Add, App_Web_vm4o5lue" %>

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

        function postBackByObject() {
            var o = window.event.srcElement;
            if (o.tagName == "INPUT" && o.type == "checkbox") {
                __doPostBack("", "");
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtUserGroupName" runat="server" MaxLength="30"
                                class="md-form-control form-control login_form_content_input requires_true"
                                Style="background-image: url('');" onKeyPress="fnChangeLower_Upper(this);"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fteUserGroupName" runat="server" TargetControlID="txtUserGroupName"
                                FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom" ValidChars=" "
                                Enabled="True">
                            </cc1:FilteredTextBoxExtender>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label class="tess">
                                <asp:Label runat="server" Text="Location Group Name" ID="lblUserGroupName" CssClass="styleReqFieldLabel">
                                </asp:Label>
                            </label>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvUserGroupName" runat="server" ErrorMessage="Enter the Location Group Name"
                                    ControlToValidate="txtUserGroupName" SetFocusOnError="true" CssClass="validation_msg_box_sapn"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                            </asp:Label>
                            <asp:CheckBox ID="chkActive" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <asp:Panel ID="pnlLocation" runat="server" CssClass="stylePanel" GroupingText="Location">
                            <div style="overflow: auto; height: 300px">
                                <asp:TreeView ID="treeview" runat="server" ImageSet="Simple" ShowCheckBoxes="Parent,Leaf"
                                    ShowLines="True" OnPreRender="treeview_PreRender" DataSourceID="XmlDataSource1"
                                    OnTreeNodeCheckChanged="treeview_OnTreeNodeCheckChanged" RootNodeStyle-ForeColor="#003d9e"
                                    LeafNodeStyle-ForeColor="#003d9e" ParentNodeStyle-ForeColor="#003d9e" SelectedNodeStyle-BackColor="#99CCFF"
                                    RootNodeStyle-Font-Size="14px" LeafNodeStyle-Font-Size="14px" ParentNodeStyle-Font-Size="14px">
                                    <DataBindings>
                                        <asp:TreeNodeBinding DataMember="MenuItem" TextField="title" ToolTipField="title"
                                            ValueField="Location_ID" SelectAction="Expand" />
                                    </DataBindings>
                                </asp:TreeView>
                                &nbsp;
                                                        <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/TransformXSLT.xsl"
                                                            EnableCaching="False"></asp:XmlDataSource>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <asp:Panel GroupingText="User Filter" ToolTip="User Filter"
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
                                            <div class="md-input">
                                                <asp:TextBox ID="txtFUserName" runat="server" class="md-form-control form-control login_form_content_input requires_false"
                                                    OnTextChanged="txtFUserName_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <cc1:AutoCompleteExtender ID="aceMOname" MinimumPrefixLength="4" OnClientPopulated="Common_ItemPopulated"
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
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                OnClientClick="return confirm('Are you sure you want to Remove this record?');" CssClass="grid_btn_delete" ToolTip="Remove[Alt+R]" AccessKey="R"></asp:Button>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="btnAdd" Width="50px" runat="server" CausesValidation="false" CommandName="AddNew"
                                                CssClass="grid_btn" Text="Add" ToolTip="Add the Details, Alt+T" AccessKey="T"></asp:Button>
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
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
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

