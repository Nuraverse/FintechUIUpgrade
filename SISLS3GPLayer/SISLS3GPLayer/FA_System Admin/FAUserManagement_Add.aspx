<%@ Page Language="C#" MasterPageFile="~/Common/FAMasterPageCollapse.master" AutoEventWireup="true"
    CodeFile="FAUserManagement_Add.aspx.cs" Inherits="System_Admin_FAUserManagement_Add"
    Title="Untitled Page" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" Text="User Management" ID="lblHeading" CssClass="styleInfoLabel">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <cc1:TabContainer ID="TCUsrMgtDtls" runat="server" CssClass="styleTabPanel" Width="100%"
                    ScrollBars="None">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabPanel runat="server" ID="TPGeneralDtls" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    General Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtUserCode" runat="server" MaxLength="6"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <%-- <asp:Panel ID="PopupTool_UserCode" runat="server" BorderWidth="1" CssClass="styleRecordCount"
                                                            Width="30%">
                                                            <asp:Label ID="lblTooltip" runat="server" Text=" Must begin with an alphabet and length should be minimum of 4 characters " />
                                                        </asp:Panel>--%>
                                                        <cc1:HoverMenuExtender ID="HoverMenuExtender1" TargetControlID="txtUserCode" runat="server"
                                                            PopupControlID="PopupTool_UserCode" PopupPosition="Right" PopDelay="50" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label runat="server" Text="User Code" ID="lblUserCode" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:CheckBox runat="server" AutoPostBack="True" ID="chkCopyProfile" Text=" " OnCheckedChanged="chkCopyProfile_CheckedChanged" />

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>


                                                        <asp:Label runat="server" Text="Copy Profile" ID="lblCopyProfile" CssClass="styleReqFieldLabel"></asp:Label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="ddlCopyProfile" runat="server" ServiceMethod="GetUsers" OnItem_Selected="ddlCopyProfile_OnSelectedIndexChanged"
                                                            IsMandatory="false" ValidationGroup="save" ErrorMessage="Enter the 'Copy Profile'" />
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="txtUserCode"
                                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>

                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>

                                                            <asp:Label runat="server" Text="Copy Profile" ID="lblCopyProfile1" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" onblur="FunTrimwhitespace(this,'User Name');"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvUserName" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Enter the User Name">

                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender
                                                            ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtUserName" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                            ValidChars=" " Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label runat="server" Text="User Name" ID="lblUserName" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPassword" OnTextChanged="txtPassword_Changed" AutoPostBack="true" runat="server" TextMode="Password" MaxLength="15"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <asp:HiddenField ID="hdnPassword" runat="server" />
                                                        <asp:Panel ID="Pnl_Password" runat="server" BorderWidth="1" CssClass="styleRecordCount"
                                                            Width="50%">
                                                            <asp:Label ID="lblPWDString" runat="server" Text="Should contain atleast one UPPER case,one lower case and a number or a special
                                                character" />
                                                        </asp:Panel>
                                                        <cc1:HoverMenuExtender ID="HoverMenuExtender2" TargetControlID="txtPassword" runat="server"
                                                            PopupControlID="Pnl_Password" PopupPosition="Right" PopDelay="50" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label runat="server" Text="Password" ID="lblPassword" CssClass="styleReqFieldLabel"
                                                                onCopy="return false" onDrag="return false" onDrop="return false" onPaste="return false" autocomplete="off"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input" id="divReset" style="display: none" runat="server">
                                                        <input type="checkbox" id="chkResetPwd" runat="server" onclick="fnEnablePwd();" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvPassword" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <asp:Label runat="server" Text="Reset Password" ID="lblResetPwd" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="12"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtMobileNo"
                                                            FilterType="Numbers" Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label runat="server" Text="Mobile Number" ID="lblMobile"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEMailId" runat="server" MaxLength="60"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvEMailId" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                runat="server" ControlToValidate="txtEMailId" Display="Dynamic" ErrorMessage="Enter the EMail Id"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtEMailId" runat="server" TargetControlID="txtEMailId"
                                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars="._-@"
                                                            Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RegularExpressionValidator ID="revEmailId" runat="server" ControlToValidate="txtEmailId"
                                                            ValidationGroup="save" Display="None" ErrorMessage="Enter a valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label runat="server" Text="EMail Id" ID="lblEmail" CssClass="styleDisplayLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDateofJoining" runat="server"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <asp:Image ID="imgDateofJoining" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                        <%--<asp:Panel ID="pnl_Date" runat="server" BorderWidth="1" CssClass="styleRecordCount"
                                                            Width="40%">
                                                            <%--<asp:Label ID="Label3" runat="server" Text="Date of Joining should be greater than the Date of Incorporation of the company" />--%>
                                                        <%--</asp:Panel>--%>
                                                        <cc1:HoverMenuExtender ID="HoverMenuExtender3" TargetControlID="imgDateofJoining"
                                                            runat="server" PopupControlID="pnl_Date" PopupPosition="Right" PopDelay="50" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDateofJoining" ValidationGroup="save" CssClass="styleMandatoryLabel"
                                                                runat="server" ControlToValidate="txtDateofJoining" Display="None" ErrorMessage="Enter the Date of Joining"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <cc1:CalendarExtender
                                                            runat="server" Format="dd/MM/yyyy" TargetControlID="txtDateofJoining" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                            PopupButtonID="imgDateofJoining" ID="CalendarExtender1" Enabled="True">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label runat="server" Text="Date of Joining" ID="lblDateofJoining" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <cc1:ComboBox ID="txtDesignation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="Suggest">
                                                        </cc1:ComboBox>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDesignation" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                runat="server" Display="Dynamic" InitialValue="--Select--" ControlToValidate="txtDesignation"
                                                                ErrorMessage="Select the Designation"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label class="tess">
                                                            <asp:Label runat="server" Text="Designation" ID="lblDesignation" CssClass="styleReqFieldLabel"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlLevel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLevel_SelectedIndexChanged"
                                                            class="md-form-control form-control">
                                                            <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                                            <asp:ListItem Text="Staff level" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Officer level" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Manager" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="Top Management" Value="4"></asp:ListItem>
                                                            <asp:ListItem Text="System Admin" Value="5"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvLevel" ValidationGroup="save" CssClass="validation_msg_box_sapn"
                                                                runat="server" InitialValue="-1" Display="Dynamic" ControlToValidate="ddlLevel"
                                                                ErrorMessage="Select the User Level"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label class="tess">
                                                            <asp:Label ID="lblLevel" runat="server" CssClass="styleReqFieldLabel" Text="User Level"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="ddlReportingLevel" runat="server" ServiceMethod="GetUsers" IsMandatory="true"
                                                            ValidationGroup="save" ErrorMessage="Enter the Reporting - Next Level" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label ID="lblReportingLevel" runat="server" CssClass="styleDisplayLabel" Text="Reporting - Next Level"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc2:Suggest ID="ddlHigherLevel" runat="server" ServiceMethod="GetUsers" IsMandatory="true"
                                                            ValidationGroup="save" ErrorMessage="Enter the Higher Level" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                        <label>
                                                            <asp:Label ID="lblHigherLevel" runat="server" CssClass="styleDisplayLabel" Text="Higher Level"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:CheckBox ID="chkActive" Checked="True" runat="server" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>


                                                        <asp:Label runat="server" Text="Active" ID="lblActive"></asp:Label>

                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="ddlCopyProfile" />
                                            <asp:PostBackTrigger ControlID="chkCopyProfile" />
                                            <asp:PostBackTrigger ControlID="txtPassword" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <cc1:TabPanel runat="server" ID="TPLevelAccessDtls" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Level/Program Access
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upnllevel" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlAction" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAction_SelectedIndexChanged"
                                                            class="md-form-control form-control">
                                                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                                            <asp:ListItem Value="0">Deletion</asp:ListItem>
                                                            <asp:ListItem Value="1">Modification</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Action" ID="lblAction">
                                                            </asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:CheckBox runat="server" ID="chkCurrent_Period" CssClass="styleDisplayLabel"
                                                            Checked="true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <asp:Label ID="lblCurrent_Period" runat="server" Text="Current Period"></asp:Label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:CheckBox runat="server" ID="chkPrior_Period" CssClass="styleDisplayLabel" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <asp:Label ID="lblchkPrior_Period" runat="server" Text="Prior Period"></asp:Label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlLocation" Width="100%" runat="server" CssClass="stylePanel" GroupingText="Location">
                                                        <div style="overflow: auto; height: 300px">
                                                            <asp:TreeView ID="treeview" runat="server" ImageSet="Simple" ShowCheckBoxes="Parent,Leaf"
                                                                ShowLines="True" OnPreRender="treeview_PreRender" DataSourceID="XmlDataSource1"
                                                                OnTreeNodeCheckChanged="treeview_OnTreeNodeCheckChanged">
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
                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="PnlRoleCode" Width="100%" runat="server" CssClass="stylePanel" GroupingText="Role code">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="gird">
                                                                    <div style="overflow: auto; height: 300px">

                                                                        <asp:GridView ID="grvRoleCode" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvRoleCode_RowDataBound">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Role Code" ItemStyle-Width="10%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblRoleCode" runat="server" Text='<%#Eval("Role_Code")%>'></asp:Label><asp:Label
                                                                                            ID="lblRoleCenterID" runat="server" Visible="false" Text='<%#Eval("Role_Code_ID")%>'></asp:Label><asp:Label
                                                                                                ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField ItemStyle-Width="60%" ItemStyle-HorizontalAlign="Left" DataField="ProgramDesc"
                                                                                    HeaderText="Program Description" />
                                                                                <asp:TemplateField ItemStyle-Width="10%">
                                                                                    <HeaderTemplate>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Select All
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr align="center">
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chkAll" runat="server" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td></td>
                                                                                            </tr>
                                                                                            <tr align="left">
                                                                                                <td>
                                                                                                    <%--Modified By Chandrasekar K On 31-08-2012--%>
                                                                                                    <%--<asp:CheckBox ID="chkSelRoleCode" Checked='<%# Bind("Assigned") %>' runat="server" />--%>
                                                                                                    <asp:CheckBox ID="chkSelRoleCode" Checked='<%#DataBinder.Eval(Container.DataItem, "Assigned").ToString().ToUpper() == "TRUE"%>'
                                                                                                        runat="server" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>


                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="ddlAction" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </div>
                    </div>
                </cc1:TabContainer>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                type="button" accesskey="S" validationgroup="save">
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
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary runat="server" ID="VSUsermanagement" HeaderText="Correct the following validation(s):"
                    CssClass="styleSummaryStyle" ShowMessageBox="false" ShowSummary="true" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                <asp:CustomValidator ID="CVUsermanagement" runat="server" Display="None" ValidationGroup="save"></asp:CustomValidator>
                <input type="hidden" id="hdnRegionVal" value="0" />
                <input type="hidden" id="hdnLOBPresent" runat="server" value="0" />
                <input type="hidden" id="hdnID" runat="server" />
            </div>
        </div>
        <script type="text/javascript" language="javascript">
            function FunShowToolTipMsg(input) {
                Tip();
            }


            function postBackByObject() {
                var o = window.event.srcElement;
                if (o.tagName == "INPUT" && o.type == "checkbox") {
                    __doPostBack("", "");
                }
            }


            function fnEnablePwd() {
                if (document.getElementById('<%=chkResetPwd.ClientID%>').checked) {
                    document.getElementById('<%=txtPassword.ClientID%>').disabled = false;
                    document.getElementById('<%=txtPassword.ClientID%>').value = '';
                    document.getElementById('<%=txtPassword.ClientID%>').focus();
                }
                else {
                    document.getElementById('<%=txtPassword.ClientID%>').disabled = true;
                    document.getElementById('<%=txtPassword.ClientID%>').value = '*************';

                }
            }




        </script>
    </div>
</asp:Content>


























