<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChallanRuleCreation, App_Web_x5tdsxrh" title="ChallanRuleCreation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">
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
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <asp:Panel ID="pnlChallanRuleCreation" runat="server" CssClass="stylePanel" GroupingText="Challan Rule Creation"
                        Width="98%">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" CssClass="md-form-control form-control"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" onmouseover="ddl_itemchanged(this);">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <%--  <asp:RequiredFieldValidator ID="RFVLOB" CssClass="validation_msg_box_sapn" runat="server"
                                            ControlToValidate="ddlLOB" InitialValue="0" ValidationGroup="VGChallan" ErrorMessage="Select the Line of Business"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>--%>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" CssClass="md-form-control form-control" ErrorMessage="Select a Branch"
                                            IsMandatory="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" ToolTip="Branch"
                                            ValidationGroup="VGChallan" WatermarkText="--Select--">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVBranch" CssClass="validation_msg_box_sapn" runat="server"
                                                ControlToValidate="ddlBranch" InitialValue="0" ValidationGroup="VGChallan" ErrorMessage="Select a Branch"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Branch" ID="Label1" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlDepositBankCodes" runat="server" AutoPostBack="True" onmouseover="ddl_itemchanged(this);"
                                            CssClass="md-form-control form-control" OnSelectedIndexChanged="ddlDepositBankCodes_SelectedIndexChanged" Enabled="false">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVDepositBankCodes" runat="server" ControlToValidate="ddlDepositBankCodes" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Deposit Bank Codes" InitialValue="0" ValidationGroup="VGChallan">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Deposit Bank Codes" ID="Label2" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:Label runat="server" ID="lblAcctno" CssClass="md-form-control form-control">
                                        </asp:Label>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblAcNo" CssClass="styleDisplayLabel" Text="Account No">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkActive" runat="server" Checked="true" AutoPostBack="True"
                                            OnCheckedChanged="chkActive_CheckedChanged" />
                                        <label class="tess">
                                            <asp:Label ID="lblActive" runat="server" Text="Active"> </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlCopyProfileLoc" runat="server" CssClass="md-form-control form-control" ErrorMessage="Select Copy Profile"
                                            IsMandatory="true" ToolTip="Copy Profile" WatermarkText="--Select--">
                                            <%--AutoPostBack="True"  OnSelectedIndexChanged="ddlCopyProfileLoc_SelectedIndexChanged"--%>
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Copy Profile" ID="lblCopyProfile" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div align="right">
                    <button id="btnGo" runat="server" accesskey="G" class="css_btn_enabled" onserverclick="btnGo_Click" title="Go[Alt+G]" type="button" validationgroup="VGChallan">
                        <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                    </button>
                </div>
                <div class="row">
                    <div class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:HiddenField ID="hdnRoleID" runat="server" />
                        <asp:GridView ID="GRVDraweeBankName" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GRVDraweeBankName_RowCancelingEdit"
                            OnRowCommand="GRVDraweeBankName_RowCommand" OnRowDeleting="GRVDraweeBankName_RowDeleting" OnRowEditing="GRVDraweeBankName_RowEditing"
                            OnRowUpdating="GRVDraweeBankName_RowUpdating" ShowFooter="true" ToolTip="Drawee Bank Name(s)" class="gird_details" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl.No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSNO" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Drawee Bank And Branch">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDraweeBnkBrnchID" runat="server" Text='<%# Bind("ID")%>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblDraweeBankName" runat="server" Text='<%# Bind("Name")%>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtFDraweeBankName" runat="server" class="md-form-control form-control login_form_content_input requires_false" MaxLength="80"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="aceRoleName" MinimumPrefixLength="3" OnClientPopulated="RoleName_ItemPopulated"
                                            OnClientItemSelected="RoleName_ItemSelected" runat="server" TargetControlID="txtFDraweeBankName"
                                            ServiceMethod="GetDraweeBankBranchList" CompletionSetCount="5" Enabled="True"
                                            CompletionListCssClass="CompletionListWithFixedHeight" DelimiterCharacters=";,:"
                                            CompletionListItemCssClass="CompletionListItemCssClass" CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                        </cc1:AutoCompleteExtender>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btnRemoveDraweeBank" Text="Delete" CommandName="Delete" runat="server" ToolTip="Remove [Alt+R]" AccessKey="R"
                                            CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete the drawee bank name?');" CssClass="grid_btn_delete" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="AddNew"
                                            AccessKey="T" ToolTip="Add,Alt+T" CssClass="grid_btn"></asp:Button>
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>


                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" onclick="if(fnCheckPageValidators('VGChallan'))" accesskey="S"
                        class="css_btn_enabled" type="button" onserverclick="btnSave_Click" title="Save[Alt+S]"
                        validationgroup="VGChallan" causesvalidation="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button id="btnClear" runat="server" causesvalidation="false" class="css_btn_enabled"
                        type="button" onclick="if(fnConfirmClear())" onserverclick="btnClear_Click"
                        title="Clear[Alt+L]" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" type="button" validationgroup="PRDDC"
                        causesvalidation="false" class="css_btn_enabled" onserverclick="btnCancel_Click"
                        title="Exit[Alt+X]" onclick="if(fnConfirmExit())" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <div class="row" style="display: none">
                    <asp:CustomValidator ID="CVChallanRule" runat="server" Enabled="true" Width="98%" Display="None" />
                </div>
                <div class="row">
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    <input type="hidden" runat="server" value="0" id="hdnBank" />

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
