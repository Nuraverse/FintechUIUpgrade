<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="UnderWriting_S3GORGUnderWriting_Add, App_Web_sq2fmotj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="stylePageHeading">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="styleFieldAlign" colspan="4">
                                    <asp:RadioButtonList ID="rdbLevel" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdbLevel_SelectedIndexChanged">
                                        <asp:ListItem Text="Transaction Level" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Customer Level" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel">Line of Business*
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlLOB" AutoPostBack="true" Width="240px" OnSelectedIndexChanged="ddlLOB_OnSelectedIndexChanged"
                                        runat="server" ToolTip="Line of Business">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvLOB" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="ddlLOB" InitialValue="0" ErrorMessage="Select the Line of Business"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td class="styleFieldLabel">Short Name*
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:TextBox ID="txtShortName" MaxLength="20" Width="190px"
                                        runat="server" ToolTip="Short Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSN" CssClass="styleMandatoryLabel"
                                        runat="server" ControlToValidate="txtShortName" ErrorMessage="Enter Short Name"
                                        Display="None" InitialValue="">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel">Product
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlProductCode" Width="240px" runat="server" ToolTip="Product">
                                    </asp:DropDownList>
                                </td>
                                <td class="styleFieldLabel">No. of Years* 
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:TextBox ID="txtNoofYears" onkeypress="if(window.event.keyCode==48 || window.event.keyCode>54) window.event.keyCode=0;"
                                        onchange="document.getElementById('ctl00_ContentPlaceHolder1_txtPrvYears').value='';document.getElementById('ctl00_ContentPlaceHolder1_txtCurYears').value='';  document.getElementById('ctl00_ContentPlaceHolder1_txtNxtYears').value='';"
                                        MaxLength="1" Width="30px" runat="server"
                                        Style="text-align: right">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvYears" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="txtNoofYears" ErrorMessage="Enter the No. of Years" Display="None">
                                    </asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderN" runat="server" TargetControlID="txtNoofYears"
                                        FilterType="Numbers,Custom" InvalidChars="0" Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    &nbsp;
                                    Prev.*
                                    &nbsp;
                                    <asp:TextBox ID="txtPrvYears" onkeypress="if(window.event.keyCode>51) window.event.keyCode=0;"
                                        onchange="fnSetNextYear();" MaxLength="1" Width="30px" runat="server" Style="text-align: right">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="styleMandatoryLabel"
                                        runat="server" ControlToValidate="txtPrvYears" ErrorMessage="Enter the No. of Previous Years"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtPrvYears"
                                        FilterType="Numbers,Custom" InvalidChars="0" Enabled="True">
                                    </cc1:FilteredTextBoxExtender>
                                    &nbsp;
                                    Curr
                                    &nbsp;
                                    <asp:TextBox ID="txtCurYears" ContentEditable="false" onkeypress="if(window.event.keyCode>54) window.event.keyCode=0;"
                                        MaxLength="1" Width="30px" runat="server" Style="text-align: right">
                                    </asp:TextBox>
                                    &nbsp;
                                    Curr+
                                    &nbsp;
                                    <asp:TextBox ID="txtNxtYears" onkeypress="if(window.event.keyCode>54) window.event.keyCode=0;"
                                        MaxLength="1" Width="30px" runat="server" Style="text-align: right">
                                    </asp:TextBox>
                                    <asp:RangeValidator ID="rfvNoofYears" runat="server" ControlToValidate="txtNoofYears"
                                        CssClass="styleMandatoryLabel" Display="None" ErrorMessage="No of Years cannot exceed 6"
                                        MaximumValue="6"></asp:RangeValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel">Constitution*
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList ID="ddlConstitution" Width="240px" runat="server" ToolTip="Constitution">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvConstitution" CssClass="styleMandatoryLabel" runat="server"
                                        ControlToValidate="ddlConstitution" InitialValue="0" ErrorMessage="Select the Constitution"
                                        Display="None">
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td class="styleFieldLabel">Active
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" TabIndex="3" />
                                </td>
                            </tr>
                            <tr style="display: block">
                                <td class="styleFieldLabel"></td>
                                <td class="styleFieldAlign">
                                    <asp:Button ID="btnYrGo" runat="server" CssClass="styleGridShortButton" Text="Go"
                                        ToolTip="Go" OnClick="btnYrGo_Click"></asp:Button>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr style="display: none">
                                <td class="styleFieldLabel">
                                    <asp:Label runat="server" Text="Year Value" ID="lblYear" CssClass="styleReqFieldLabel">
                                    </asp:Label>
                                </td>
                                <td class="styleFieldAlign">
                                    <asp:DropDownList runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                                        ID="ddlYear" ToolTip="Year">
                                    </asp:DropDownList>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="styleFieldLabel"></td>
                                <td class="styleFieldAlign" colspan="3"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="99%" class="styleContentTable">
                                    <table style="float: right;" width="100%" cellpadding="0" cellspacing="0">
                                        <tr class="stylePagingControl">
                                            <td>
                                                <asp:RadioButtonList runat="server" ID="rbtYears" RepeatDirection="Horizontal" AutoPostBack="true"
                                                    OnSelectedIndexChanged="rbtYears_SelectedIndexChanged" Enabled="false">
                                                </asp:RadioButtonList>
                                                <asp:DropDownList runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"
                                                    ID="ddlFinanceYear" ToolTip="Year" Visible="false">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="chkCopyProfile" runat="server" Visible="false" Text="Copy Profile" OnCheckedChanged="chkCopyProfile_OnCheckedChanged" AutoPostBack="true" /></td>
                                            <td align="right">
                                                <asp:Button ID="btnAddYear" CssClass="styleSubmitButton" runat="server" Text="Add Year"
                                                    ToolTip="Add" Style="border-width: 0px; width: 78px; height: 22px;"
                                                    Enabled="false" Visible="true" OnClick="btnAddYear_Click"></asp:Button>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdateYear" CssClass="styleSubmitButton" runat="server" Text="Update Year"
                                                    ToolTip="Add" Style="border-width: 0px; width: 78px; height: 22px;"
                                                    Enabled="true" Visible="false" OnClick="btnUpdateYear_Click"></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <cc1:TabContainer ID="tcCreditScore" runat="server" CssClass="styleTabPanel" Width="100%"
                                        ScrollBars="None" TabStripPlacement="top" ActiveTabIndex="0">
                                        <cc1:TabPanel ID="tpMainPage" runat="server" CssClass="tabpan" HeaderText="Credit Score"
                                            BackColor="Red" Style="padding: 0px">
                                            <HeaderTemplate>
                                                Under Writing
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="upCS" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="100%">
                                                                    <asp:GridView ID="grdGrpName" runat="server" AutoGenerateColumns="False"
                                                                        ShowFooter="True"
                                                                        OnRowCommand="grdGrpName_RowCommand"
                                                                        OnRowEditing="grdGrpName_RowEditing"
                                                                        OnRowDeleting="grdGrpName_RowDeleting"
                                                                        OnRowCancelingEdit="grdGrpName_RowCancelingEdit"
                                                                        OnRowUpdating="grdGrpName_RowUpdating"
                                                                        OnRowDataBound="grdGrpName_RowDataBound"
                                                                        DataKeyNames="GroupID" Width="30%">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderStyle-Width="5%">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="imgShow" runat="server" OnClick="Show_Hide_ChildGrid" ImageUrl="~/images/plus.png"
                                                                                        CommandArgument="Show" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField Visible="false">
                                                                                <EditItemTemplate>
                                                                                    <asp:Label ID="lbl_grpcodeE" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_grpcode" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Description" HeaderStyle-Width="10%">
                                                                                <EditItemTemplate>
                                                                                    <asp:TextBox ID="txt_grpname" runat="server" Text='<%# Bind("GroupName") %>' MaxLength="75"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftetxt_grpname" runat="server" TargetControlID="txt_grpname"
                                                                                        FilterType="LowercaseLetters,UppercaseLetters,Numbers,Custom" ValidChars="@();?<>&'- "
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <asp:RequiredFieldValidator ID="rfvgrpname" CssClass="styleMandatoryLabel"
                                                                                        runat="server" InitialValue="" ControlToValidate="txt_grpname" ErrorMessage="Enter Description"
                                                                                        Display="None" ValidationGroup="btnEdit">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_grpname" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:TextBox ID="txtGroupName" Width="150px" runat="server" MaxLength="75"></asp:TextBox>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftetxtGroupName" runat="server" TargetControlID="txtGroupName"
                                                                                        FilterType="LowercaseLetters,UppercaseLetters,Numbers,Custom" ValidChars="@();?<>&' -"
                                                                                        Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <asp:RequiredFieldValidator ID="rfvGPNameF" CssClass="styleMandatoryLabel"
                                                                                        runat="server" InitialValue="" ControlToValidate="txtGroupName" ErrorMessage="Enter Description"
                                                                                        Display="None" ValidationGroup="btnAdd">
                                                                                    </asp:RequiredFieldValidator>
                                                                                </FooterTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%">
                                                                                <EditItemTemplate>
                                                                                    <asp:ImageButton ID="lnkUpdGrp" runat="server" Text="Update" Width="20px" Height="20px" CommandName="Update"
                                                                                        ValidationGroup="btnEdit" ImageUrl="~/Images/Update_New.png" CssClass="styleGridImgShortButton" ToolTip="Update Group"></asp:ImageButton>
                                                                                    <asp:ImageButton ID="lnkCancelGrp" runat="server" Text="Cancel" Width="20px" Height="20px" CommandName="Cancel"
                                                                                        CausesValidation="false" ImageUrl="~/Images/Cancel_New.png" CssClass="styleGridImgShortButton" ToolTip="Cancel Group"></asp:ImageButton>
                                                                                </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="lnkEditGroup" runat="server" Width="20px" Height="20px" Text="Edit" CommandName="Edit"
                                                                                        CausesValidation="false" ImageUrl="~/Images/Edit.jpg" CssClass="styleGridImgShortButton" ToolTip="Edit Group"></asp:ImageButton>
                                                                                    &nbsp;
                                                                                    <asp:ImageButton ID="btnGrpRemove" Width="20px" Height="20px" Text="Remove" CommandName="Delete" runat="server"
                                                                                        CausesValidation="false" ImageUrl="~/Images/delete1.png" Visible="false"
                                                                                        CommandArgument='<%# Bind("GroupCode")%>' CssClass="styleGridImgShortButton" ToolTip="Delete Group" />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:ImageButton ID="btnGrpDetails" ImageUrl="~/Images/2Blue_Plus.png"
                                                                                        CommandName="AddNew" runat="server" CssClass="styleGridImgShortButton"
                                                                                        ValidationGroup="btnAdd" Width="20px" Height="20px" ToolTip="Add Group" />
                                                                                </FooterTemplate>
                                                                                <FooterStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="width: 5%"></td>
                                                                                        <td style="width: 5%"></td>
                                                                                        <td colspan='100%'>
                                                                                            <asp:Panel ID="pnlCrScore" runat="server" Visible="false">
                                                                                                <asp:GridView runat="server" ShowFooter="true" ID="grvCreditScore" Width="100%"
                                                                                                    OnRowDataBound="grvCreditScore_RowDataBound"
                                                                                                    OnRowCommand="grvCreditScore_RowCommand"
                                                                                                    OnRowEditing="grvCreditScore_RowEditing"
                                                                                                    OnRowUpdating="grvCreditScore_RowUpdating"
                                                                                                    OnRowDeleting="grvCreditScore_RowDeleting"
                                                                                                    OnRowCancelingEdit="grvCreditScore_RowCancelingEdit"
                                                                                                    RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
                                                                                                    AutoGenerateColumns="False" DataKeyNames="CrScoreParam_ID">
                                                                                                    <Columns>
                                                                                                        <asp:TemplateField HeaderText="Line No" Visible="false">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:Label ID="lblGroupCodeE" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblLineNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                <asp:Label ID="lblScoreAssigned" runat="server" Text="0" Visible="false"></asp:Label>
                                                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Year")%>' Visible="false"></asp:Label>
                                                                                                                <asp:Label ID="lblCGroupCode" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField Visible="false" HeaderText="S.No" HeaderStyle-Width="5%">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:Label ID="lblSubgrpcode" runat="server" Text='<%# Bind("SubGroupCode") %>'></asp:Label>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lbl_Subgrpcode" runat="server" Text='<%# Bind("SubGroupCode") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Description">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtDesc" Text='<%# Bind("Desc")%>' MaxLength="100" Width="150px"
                                                                                                                    runat="server" ToolTip="Description"></asp:TextBox>
                                                                                                                <%-- code block added for bug fixing - kuppusamy.b - 14-Feb-2012 - Issue ID - 5402--%>
                                                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtDesc" runat="server" TargetControlID="txtDesc"
                                                                                                                    FilterType="LowercaseLetters,UppercaseLetters,Numbers,Custom" ValidChars="@();?<>&' -"
                                                                                                                    Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <asp:Label ID="lblParamIDE" runat="server" Visible="false" Text='<%#Eval("CrScoreParam_ID")%>'></asp:Label>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblDesc" runat="server" Text='<%# Bind("Desc")%>'></asp:Label>
                                                                                                                <asp:Label ID="lblParamID" runat="server" Visible="false" Text='<%#Eval("CrScoreParam_ID")%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtDescF" MaxLength="100" Width="150px" runat="server" ToolTip="Description"></asp:TextBox>
                                                                                                                <%-- code block added for bug fixing - kuppusamy.b - 14-Feb-2012 - Issue ID - 5402--%>
                                                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtDescF" runat="server" TargetControlID="txtDescF"
                                                                                                                    FilterType="LowercaseLetters,UppercaseLetters,Numbers,Custom" ValidChars="@();?<>&' -"
                                                                                                                    Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <HeaderStyle Width="23%" />
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Attrib">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlFieldAttE" ToolTip="Attributes"
                                                                                                                    runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddlFieldAttE_SelectedIndexChanged">
                                                                                                                </asp:DropDownList>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblFieldAttName" Text='<%# Bind("FieldAttName")%>' runat="server"></asp:Label>
                                                                                                                <asp:Label ID="lblFieldAtt" Text='<%# Bind("FieldAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlFieldAttF" AutoPostBack="true" ToolTip="Attributes"
                                                                                                                    OnSelectedIndexChanged="ddlFieldAttF_SelectedIndexChanged" runat="server" Width="100px">
                                                                                                                </asp:DropDownList>
                                                                                                            </FooterTemplate>
                                                                                                            <HeaderStyle Width="10%" />
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Operator">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlNumericE" runat="server" Width="80px" ToolTip="Operator"
                                                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlNumericE_SelectedIndexChanged">
                                                                                                                </asp:DropDownList>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblNumericName" Text='<%# Bind("NumericName")%>' runat="server"></asp:Label>
                                                                                                                <asp:Label ID="lblNumericAtt" Text='<%# Bind("NumericAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlNumericF" AutoPostBack="true" OnSelectedIndexChanged="ddlNumericF_SelectedIndexChanged" runat="server" Width="80px" ToolTip="Operator">
                                                                                                                </asp:DropDownList>
                                                                                                            </FooterTemplate>
                                                                                                            <HeaderStyle Width="10%" />
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Req Param">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtReqValueE" Text='<%# Bind("ReqValue")%>' MaxLength="30" Width="100px"
                                                                                                                    runat="server" ToolTip="Req Param" Style="text-align: right"></asp:TextBox>
                                                                                                                <asp:DropDownList ID="ddlYesE" runat="server" Width="80px" ToolTip="Req Param" AutoPostBack="true" OnSelectedIndexChanged="ddlYesE_SelectedIndexChanged">
                                                                                                                    <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="None" Value="2"></asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteAmountE" runat="server" TargetControlID="txtReqValueE"
                                                                                                                    FilterType="Numbers,Custom" ValidChars=".:-/" Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <cc1:CalendarExtender ID="calReqValueE" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                                                                                    PopupButtonID="imgDate" TargetControlID="txtReqValueE">
                                                                                                                </cc1:CalendarExtender>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblReqValue" runat="server" Text='<%# Bind("ReqValue")%>' ToolTip="Req Param"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtReqValueF" MaxLength="30" Width="100px" runat="server" ToolTip="Req Param"
                                                                                                                    Style="text-align: right"></asp:TextBox>
                                                                                                                <asp:DropDownList ID="ddlYesF" runat="server" Width="80px" ToolTip="Req Param" AutoPostBack="true" OnSelectedIndexChanged="ddlYesF_SelectedIndexChanged">
                                                                                                                    <asp:ListItem Text="Select" Value="-1"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                                                                                                    <asp:ListItem Text="None" Value="2"></asp:ListItem>
                                                                                                                </asp:DropDownList>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteAmount1F" runat="server" TargetControlID="txtReqValueF"
                                                                                                                   Enabled="True" FilterType="LowercaseLetters,UppercaseLetters,Numbers,Custom" ValidChars=".-/">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <cc1:CalendarExtender ID="CalendarExtender1F" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                                                                                    PopupButtonID="imgDate" TargetControlID="txtReqValueF">
                                                                                                                </cc1:CalendarExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Req Param To">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtReqValueToE" Text='<%# Bind("ReqValueTo")%>' MaxLength="30" Width="100px"
                                                                                                                    runat="server" Enabled="false" ToolTip="Req Param To" Style="text-align: right"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteReqValueToE" runat="server" TargetControlID="txtReqValueToE"
                                                                                                                    FilterType="Numbers,Custom" ValidChars=".:-/" Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <cc1:CalendarExtender ID="calReqValueToE" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                                                                                    PopupButtonID="imgDate" TargetControlID="txtReqValueToE">
                                                                                                                </cc1:CalendarExtender>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblReqValueTo" runat="server" Text='<%# Bind("ReqValueTo")%>' ToolTip="Req Param To"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtReqValueToF" Enabled="false" MaxLength="30" Width="100px" runat="server" ToolTip="Req Param To"
                                                                                                                    Style="text-align: right"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteReqValueToF" runat="server" TargetControlID="txtReqValueToF"
                                                                                                                    FilterType="Numbers,Custom" Enabled="True" ValidChars=".:-/">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <cc1:CalendarExtender ID="calReqValueToF" runat="server" Enabled="False" Format="dd/MM/yyyy"
                                                                                                                    PopupButtonID="imgDate" TargetControlID="txtReqValueToF">
                                                                                                                </cc1:CalendarExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Score">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtScoreE" Text='<%# Bind("Score")%>' AutoPostBack="false" OnTextChanged="Score_TextChanged"
                                                                                                                    onchange="SumScore();" MaxLength="8" Width="80px" runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                                                    Style="text-align: right" onblur="funChkDecimial(this,3,4,'Score',true);" ToolTip="Score"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtScoreE" runat="server" TargetControlID="txtScoreE"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblScore" runat="server" Text='<%# Bind("Score")%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtScoreF" MaxLength="8" Width="80px" AutoPostBack="false" OnTextChanged="Score_TextChanged"
                                                                                                                    runat="server" onkeypress="fnAllowNumbersOnly(true,false,this)" onblur="funChkDecimial(this,3,4,'Score',true);"
                                                                                                                    ToolTip="Score" Style="text-align: right"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender42F" runat="server" TargetControlID="txtScoreF"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Diff %">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtDiffPerE" Text='<%# Bind("DiffPer")%>' MaxLength="5" Width="50px"
                                                                                                                    Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)" runat="server"
                                                                                                                    ToolTip="Diff %"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteDiffPerE" runat="server" TargetControlID="txtDiffPerE"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblDiffPer" runat="server" Text='<%# Bind("DiffPer")%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtDiffPerF" MaxLength="5" Width="50px" ToolTip="Diff %" runat="server"
                                                                                                                    Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4112" runat="server" TargetControlID="txtDiffPerF"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Diff Mark">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtDiffMarkE" Text='<%# Bind("DiffMark")%>' MaxLength="6" Width="50px"
                                                                                                                    Style="text-align: right" runat="server" ToolTip="Diff Mark"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fteDiffMarkE" runat="server" TargetControlID="txtDiffMarkE"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblDiffMark" runat="server" Text='<%# Bind("DiffMark")%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtDiffMarkF" MaxLength="6" Width="50px" runat="server" ToolTip="Diff Mark"
                                                                                                                    Style="text-align: right"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender412" runat="server" TargetControlID="txtDiffMarkF"
                                                                                                                    FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Scan">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:CheckBox ID="chkScanE" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsScan")) %>' ToolTip="Scan Document" />
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkScan" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsScan")) %>' Enabled="false" ToolTip="Scan Document" />
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:CheckBox ID="chkScanF" runat="server" ToolTip="Scan Document" />
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Fe">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:CheckBox ID="chkFormulaE" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsFormula")) %>' ToolTip="Formula" />
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkFormula" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsFormula")) %>' Enabled="false" ToolTip="Formula" />
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:CheckBox ID="chkFormulaF" runat="server" ToolTip="Formula" />
                                                                                                            </FooterTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Conduit">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlConduitE" runat="server" Width="80px" ToolTip="Conduit">
                                                                                                                </asp:DropDownList>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblConduitName" Text='<%# Bind("ConduitName")%>' runat="server"></asp:Label>
                                                                                                                <asp:Label ID="lblConduit" Text='<%# Bind("Conduit")%>' Visible="false" runat="server"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlConduitF" runat="server" Width="80px" ToolTip="Conduit">
                                                                                                                </asp:DropDownList>
                                                                                                            </FooterTemplate>
                                                                                                            <HeaderStyle Width="10%" />
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Action">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:ImageButton ID="lnkUpdateChild" runat="server" Text="Update" Width="20px" Height="20px" CommandName="Update"
                                                                                                                    CausesValidation="false" CssClass="styleGridImgShortButton" ImageUrl="~/Images/Update_New.png"></asp:ImageButton>
                                                                                                                <asp:ImageButton ID="lnkCancelChild" runat="server" Text="Cancel" Width="20px" Height="20px" CommandName="Cancel"
                                                                                                                    CausesValidation="false" CssClass="styleGridImgShortButton" ImageUrl="~/Images/Cancel_New.png"></asp:ImageButton>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:ImageButton ID="lnkEditChild" runat="server" Text="Edit" Width="20px" Height="20px" CommandName="Edit"
                                                                                                                    ToolTip="Edit Credit Score Group" CausesValidation="false" CssClass="styleGridImgShortButton"
                                                                                                                    ImageUrl="~/Images/Edit.jpg"></asp:ImageButton>&nbsp;
                                                                                                                <asp:ImageButton Text="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                                                                    runat="server" CausesValidation="false" ID="lnkbtnDeleteChild" Width="20px" Height="20px" CommandName="Delete"
                                                                                                                    ToolTip="Delete Credit Score Group" CssClass="styleGridImgShortButton"
                                                                                                                    ImageUrl="~/Images/delete1.png"></asp:ImageButton>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:ImageButton ID="btnAddCredit" runat="server" CommandName="AddChildCS" Width="20px" Height="20px" CssClass="styleGridImgShortButton"
                                                                                                                    ImageUrl="~/Images/2Blue_Plus.png" CausesValidation="false" ToolTip="Add"></asp:ImageButton>
                                                                                                            </FooterTemplate>
                                                                                                            <FooterStyle Width="7%" />
                                                                                                        </asp:TemplateField>
                                                                                                    </Columns>
                                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                                    <RowStyle HorizontalAlign="Center" />
                                                                                                </asp:GridView>
                                                                                            </asp:Panel>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td colspan="8" align="Right">
                                                                                            <table width="100%" border="0">
                                                                                                <tr>
                                                                                                    <td style="width: 55%"></td>
                                                                                                    <td class="styleFieldLabelBold" style="font-weight: bold;">
                                                                                                        <asp:Label ID="lblTotalScore" runat="server" Width="80px" Text="Group Score"></asp:Label>
                                                                                                    </td>
                                                                                                    <td class="styleFieldAlign">
                                                                                                        <asp:TextBox ID="txtGrpScore" runat="server" Style="text-align: right" Width="80px" Text="0" ReadOnly="true"></asp:TextBox>
                                                                                                    </td>
                                                                                                    <td style="width: 5%"></td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                        <cc1:TabPanel ID="tpNumber" runat="server" CssClass="tabpan" HeaderText="Formula"
                                            BackColor="Red" Style="padding: 0px">
                                            <HeaderTemplate>
                                                ANSI
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <asp:UpdatePanel ID="upCSFor" runat="server">
                                                    <ContentTemplate>
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="100%">
                                                                    <asp:GridView ID="GrpFormula" runat="server" AutoGenerateColumns="False"
                                                                        DataKeyNames="GroupID" Width="25%">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderStyle-Width="5%">
                                                                                <ItemTemplate>
                                                                                    <asp:ImageButton ID="imgShowFe" runat="server" OnClick="Show_Hide_GrpFormula" ImageUrl="~/images/plus.png"
                                                                                        CommandArgument="Show" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_grpfecode" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Group" HeaderStyle-Width="15%">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lbl_grpFename" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                <ItemTemplate>
                                                                                    <tr>
                                                                                        <td style="width: 5%"></td>
                                                                                        <td style="width: 5%"></td>
                                                                                        <td colspan='100%'>
                                                                                            <asp:Panel ID="pnlCrScoreFe" runat="server" Visible="false">
                                                                                                <asp:GridView runat="server" ShowFooter="true" ID="grvNumbers" Width="100%"
                                                                                                    OnRowDataBound="grvNumbers_RowDataBound"
                                                                                                    OnRowCommand="grvNumbers_RowCommand"
                                                                                                    OnRowDeleting="grvNumbers_RowDeleting"
                                                                                                    OnRowCancelingEdit="grvNumbers_RowCancelingEdit"
                                                                                                    OnRowEditing="grvNumbers_RowEditing"
                                                                                                    OnRowUpdating="grvNumbers_RowUpdating"
                                                                                                    RowStyle-HorizontalAlign="Center"
                                                                                                    FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False">
                                                                                                    <Columns>
                                                                                                        <asp:TemplateField HeaderText="Line No">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:Label ID="lblRecordIdE" runat="server" Text='<%#Eval("FeSiNo")%>'></asp:Label>
                                                                                                                <asp:Label ID="lblFeGroupCodeE" runat="server" Text='<%# Bind("GroupCode") %>' Visible="false"></asp:Label>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblLineNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                <asp:Label ID="lblFeGroupCode" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                                <asp:Label ID="lblRecordId" runat="server" Text='<%# Eval("FeSiNo")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Line Type">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlLineTypeE" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                    OnSelectedIndexChanged="ddlLineTypeE_SelectedIndexChanged">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvLTE" InitialValue="0" ValidationGroup="EditNum"
                                                                                                                    runat="server" ControlToValidate="ddlLineTypeE" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select the Line Type"></asp:RequiredFieldValidator>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblLineType" runat="server" Text='<%#Eval("LineType")%>'></asp:Label>
                                                                                                                <asp:Label ID="lblLineTypeID" runat="server" Text='<%#Eval("LineTypeID")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlFLineType" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                    OnSelectedIndexChanged="ddlFLineType_SelectedIndexChanged">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvFddlFLineType" InitialValue="0" ValidationGroup="AddNumber"
                                                                                                                    runat="server" ControlToValidate="ddlFLineType" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select the Line Type"></asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Flag">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlFlagE" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                    OnSelectedIndexChanged="ddlFlagE_SelectedIndexChanged">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvFlagE" InitialValue="0" ValidationGroup="EditNum"
                                                                                                                    runat="server" ControlToValidate="ddlFlagE" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select the Flag"></asp:RequiredFieldValidator>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblFlag" runat="server" Text='<%#Eval("Flag")%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlFFlag" ToolTip="Line Type" runat="server" AutoPostBack="true"
                                                                                                                    OnSelectedIndexChanged="ddlFFlag_SelectedIndexChanged">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvFddlFFlag" InitialValue="0" ValidationGroup="AddNumber"
                                                                                                                    runat="server" ControlToValidate="ddlFFlag" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select the Flag"></asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Description">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:Label ID="lblDescE" runat="server" Text='<%#Eval("Desc")%>' Visible="true"></asp:Label>
                                                                                                                <cc1:ComboBox ID="txtDescE" runat="server" ToolTip="Description" Visible="false"
                                                                                                                    AutoCompleteMode="Suggest">
                                                                                                                </cc1:ComboBox>
                                                                                                                <asp:RequiredFieldValidator ID="rfvtxtDescE" ValidationGroup="EditNum" runat="server"
                                                                                                                    ControlToValidate="txtDescE" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Enter the Description"></asp:RequiredFieldValidator>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Desc")%>'></asp:Label>
                                                                                                                <asp:Label ID="lblDescID" runat="server" Text='<%#Eval("Flag_ID")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                            <FooterTemplate>
                                                                                                                <asp:Label ID="lblFDesc" runat="server" Visible="true"></asp:Label>
                                                                                                                <cc1:ComboBox ID="txtFDesc" runat="server" ToolTip="Description" Visible="false"
                                                                                                                    AutoCompleteMode="Suggest">
                                                                                                                </cc1:ComboBox>
                                                                                                                <asp:RequiredFieldValidator ID="rfvFtxtFDesc" ValidationGroup="AddNumber" runat="server"
                                                                                                                    ControlToValidate="txtFDesc" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Enter the Description"></asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Attrib">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlFieldAttFeE" ToolTip="Attributes"
                                                                                                                    runat="server" Width="100px">
                                                                                                                </asp:DropDownList>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblFieldAttFeName" Text='<%# Bind("FieldAttFeName")%>' runat="server"></asp:Label>
                                                                                                                <asp:Label ID="lblFieldAttFe" Text='<%# Bind("FieldAttFe")%>' Visible="false" runat="server"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlFieldAttFeF" ToolTip="Attributes"
                                                                                                                    runat="server" Width="100px">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvddlFieldAttFeF" ValidationGroup="AddNumber" runat="server"
                                                                                                                    ControlToValidate="ddlFieldAttFeF" InitialValue="0" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select Attrib"></asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                            <HeaderStyle Width="10%" />
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:TextBox ID="txtValueE" MaxLength="15" Width="100px" runat="server" ToolTip="Value"
                                                                                                                    Style="text-align: right" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="ftetxtValueE" runat="server" TargetControlID="txtValueE"
                                                                                                                    FilterType="Numbers,Custom" ValidChars=".:" Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <asp:RequiredFieldValidator ID="rfvtxtValueE" ValidationGroup="EditNum" runat="server"
                                                                                                                    ControlToValidate="txtValueE" Display="None" SetFocusOnError="true" ErrorMessage="Enter the Value">
                                                                                                                </asp:RequiredFieldValidator>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblValue" runat="server" Text='<%#Eval("Value")%>' Visible="false"
                                                                                                                    Style="text-align: right" Width="100%"></asp:Label>
                                                                                                                <%--AutoPostBack="true" 
                                                                                                                    OnTextChanged="txtValue_TextChanged"--%>
                                                                                                                <asp:TextBox ID="txtValue"
                                                                                                                    runat="server" ReadOnly="true"
                                                                                                                    Width="120px" Style="text-align: right" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Right" Width="100px" />
                                                                                                            <FooterTemplate>
                                                                                                                <asp:TextBox ID="txtFValue" MaxLength="15" Width="100px" runat="server" ToolTip="Value"
                                                                                                                    Style="text-align: right"></asp:TextBox>
                                                                                                                <cc1:FilteredTextBoxExtender ID="fetxtFValue" runat="server" TargetControlID="txtFValue"
                                                                                                                    FilterType="Numbers,Custom" ValidChars=".:" Enabled="True">
                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                <asp:RequiredFieldValidator ID="rfvFtxtFValue" ValidationGroup="AddNumber" runat="server"
                                                                                                                    ControlToValidate="txtFValue" Display="None" SetFocusOnError="true" ErrorMessage="Enter the Value">
                                                                                                                </asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                            <FooterStyle Width="100px" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Pick Fill">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlPickFillE" ToolTip="Pick Fill"
                                                                                                                    runat="server" Width="100px">
                                                                                                                </asp:DropDownList>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblPickFillName" Text='<%# Bind("PickFillName")%>' runat="server"></asp:Label>
                                                                                                                <asp:Label ID="lblPickFill" Text='<%# Bind("PickFill")%>' Visible="false" runat="server"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlPickFillF" ToolTip="Pick Fill"
                                                                                                                    runat="server" Width="100px">
                                                                                                                </asp:DropDownList>
                                                                                                            </FooterTemplate>
                                                                                                            <HeaderStyle Width="10%" />
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Formula">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:Panel runat="server" ID="pnlFmlE" Enabled="false">
                                                                                                                    <table>
                                                                                                                        <tr>
                                                                                                                            <td rowspan="2">
                                                                                                                                <asp:TextBox ID="txtFormulaE" TextMode="MultiLine" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                    Style="text-align: left; height: 40px; width: 140px;" Text='<%#Eval("Formula")%>'></asp:TextBox>
                                                                                                                                <cc1:FilteredTextBoxExtender ID="feFormulaE" runat="server" TargetControlID="txtFormulaE"
                                                                                                                                    FilterType="Numbers,Custom,UppercaseLetters" ValidChars=".,+,-,:,*,/,%,(,),<,>,?,=,[A-Z]"
                                                                                                                                    Enabled="True">
                                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                                <asp:RequiredFieldValidator ID="rfvFormulaE" ValidationGroup="EditNum" runat="server"
                                                                                                                                    Enabled="false" ControlToValidate="txtFormulaE" Display="None" SetFocusOnError="true"
                                                                                                                                    ErrorMessage="Enter the Formula"></asp:RequiredFieldValidator>
                                                                                                                            </td>
                                                                                                                            <td>
                                                                                                                                <asp:DropDownList ID="ddlFmlLinesE" runat="server">
                                                                                                                                </asp:DropDownList>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td>
                                                                                                                                <button id="btnAddfmlE" type="button" runat="server" class="styleGridShortButton"
                                                                                                                                    value="Add" title="Add">
                                                                                                                                    <img src="../Images/Prev_Desabled.gif" style="position: absolute" runat="server"
                                                                                                                                        id="imgPrev1E" />
                                                                                                                                    &nbsp;
                                                                                                                                    <img src="../Images/Prev_Desabled.gif" runat="server" id="imgPrev2E" />
                                                                                                                                </button>
                                                                                                                                <asp:CheckBox ID="chkCarryFmlE" runat="server" Checked="true" ToolTip="Carry formula result" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </asp:Panel>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkCarryFml" runat="server" Checked="true" ToolTip="Carry formula result" />
                                                                                                                <asp:Label ID="lblCarryFml" Visible="false" runat="server" Text='<%#Eval("CarryFml")%>'></asp:Label>
                                                                                                                <asp:Label ID="lblFormula" runat="server" Text='<%#Eval("Formula")%>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                            <FooterTemplate>
                                                                                                                <asp:Panel runat="server" ID="pnlFFml" Enabled="false">
                                                                                                                    <table>
                                                                                                                        <tr>
                                                                                                                            <td rowspan="2">
                                                                                                                                <asp:TextBox ID="txtFFormula" TextMode="MultiLine" Width="100px" runat="server" ToolTip="Value"
                                                                                                                                    Style="text-align: left; height: 40px; width: 140px;"></asp:TextBox>
                                                                                                                                <cc1:FilteredTextBoxExtender ID="fetxtFFormula" runat="server" TargetControlID="txtFFormula"
                                                                                                                                    FilterType="Numbers,Custom,UppercaseLetters" ValidChars=".,+,-,:,*,/,%,(,),<,>,?,=,[A-Z]"
                                                                                                                                    Enabled="True">
                                                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                                                <asp:RequiredFieldValidator ID="rfvFtxtFFormula" ValidationGroup="AddNumber" runat="server"
                                                                                                                                    Enabled="false" ControlToValidate="txtFFormula" Display="None" SetFocusOnError="true"
                                                                                                                                    ErrorMessage="Enter the Formula"></asp:RequiredFieldValidator>
                                                                                                                            </td>
                                                                                                                            <td>
                                                                                                                                <asp:DropDownList ID="ddlFFmlLines" runat="server">
                                                                                                                                </asp:DropDownList>
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td>
                                                                                                                                <button id="btnAddfml" type="button" runat="server" class="styleGridShortButton"
                                                                                                                                    value="Add" title="Add">
                                                                                                                                    <img src="../Images/Prev_Desabled.gif" style="position: absolute" runat="server"
                                                                                                                                        id="imgPrev1" />
                                                                                                                                    &nbsp;
                                                                                                                                    <img src="../Images/Prev_Desabled.gif" runat="server" id="imgPrev2" />
                                                                                                                                </button>
                                                                                                                                <asp:CheckBox ID="chkFCarryFml" runat="server" Checked="true" ToolTip="Carry formula result" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </asp:Panel>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Link">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:CheckBox ID="chkLinkE" runat="server" OnCheckedChanged="chkLinkE_CheckedChanged"
                                                                                                                    AutoPostBack="true" />
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:CheckBox ID="chkLink" runat="server" Enabled="false" />
                                                                                                                <asp:Label ID="lblLink" runat="server" Text='<%#Eval("IsLink")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:CheckBox ID="chkFLink" runat="server" OnCheckedChanged="chkFLink_CheckedChanged"
                                                                                                                    AutoPostBack="true" />
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Param Num">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:DropDownList ID="ddlParamNumE" ToolTip="Param Num" runat="server" Width="150px">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvddlParamNumE" InitialValue="0" ValidationGroup="EditNum"
                                                                                                                    runat="server" ControlToValidate="ddlParamNumE" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select the Param Num"></asp:RequiredFieldValidator>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:Label ID="lblParamText" runat="server" Text='<%#Eval("ParamText")%>'></asp:Label>
                                                                                                                <asp:Label ID="lblParamNum" runat="server" Text='<%#Eval("ParamNum")%>' Visible="false"></asp:Label>
                                                                                                                <asp:Label ID="lblParaSubGRoupCode" runat="server" Text='<%#Eval("SubGroupCode")%>' Visible="false"></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                                            <FooterTemplate>
                                                                                                                <asp:DropDownList ID="ddlFParamNum" ToolTip="Param Num" runat="server" Width="150px">
                                                                                                                </asp:DropDownList>
                                                                                                                <asp:RequiredFieldValidator ID="rfvFddlFParamNum" InitialValue="0" ValidationGroup="AddNumber"
                                                                                                                    runat="server" ControlToValidate="ddlFParamNum" Display="None" SetFocusOnError="true"
                                                                                                                    ErrorMessage="Select the Param Num"></asp:RequiredFieldValidator>
                                                                                                            </FooterTemplate>
                                                                                                        </asp:TemplateField>
                                                                                                        <asp:TemplateField HeaderText="Action">
                                                                                                            <EditItemTemplate>
                                                                                                                <asp:ImageButton ID="imgFeUpdate" runat="server" Text="Update" Width="20px" Height="20px"
                                                                                                                     CommandName="Update" ToolTip="Update Formula" ValidationGroup="EditNum"
                                                                                                                   CssClass="styleGridImgShortButton" ImageUrl="~/Images/Update_New.png" ></asp:ImageButton>
                                                                                                                <asp:ImageButton ID="lnkCancelChild" runat="server" Text="Cancel" Width="20px" Height="20px" CommandName="Cancel" ToolTip="Cancel Formula"
                                                                                                                    CausesValidation="false" CssClass="styleGridImgShortButton" ImageUrl="~/Images/Cancel_New.png"></asp:ImageButton>
                                                                                                            </EditItemTemplate>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:ImageButton ID="imgFeEdit" runat="server" Width="20px" Height="20px" Text="Edit" CommandName="Edit"
                                                                                                                    ToolTip="Edit Formula" CausesValidation="false" CssClass="styleGridImgShortButton"
                                                                                                                    ImageUrl="~/Images/Edit.jpg"></asp:ImageButton>&nbsp;
                                                                                                                <asp:ImageButton Text="Delete" Width="20px" Height="20px" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                                                                    runat="server" ID="imgFeDelete" Visible="false"
                                                                                                                    CommandName="Delete" ToolTip="Delete Formula"
                                                                                                                    CssClass="styleGridImgShortButton" ImageUrl="~/Images/delete1.png"></asp:ImageButton>
                                                                                                            </ItemTemplate>
                                                                                                            <FooterTemplate>
                                                                                                                <asp:ImageButton ID="imgAddFe" Width="20px" Height="20px" runat="server" ImageUrl="~/Images/2Blue_Plus.png"
                                                                                                                    CommandName="AddNew" CssClass="styleGridImgShortButton"
                                                                                                                    Text="Add" ToolTip="Add Formula" ValidationGroup="AddNumber"></asp:ImageButton>
                                                                                                            </FooterTemplate>
                                                                                                            <FooterStyle Width="7%" />
                                                                                                        </asp:TemplateField>
                                                                                                    </Columns>
                                                                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                                                                </asp:GridView>
                                                                                            </asp:Panel>
                                                                                        </td>
                                                                                    </tr>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <table align="right" cellpadding="0" cellspacing="0" runat="server" id="tblYearBtns">
                                        <tr>
                                            <td align="right">
                                                <asp:Button ID="btnYear1" CssClass="styleSubmitButton" runat="server" Text="2010-2011"
                                                    ToolTip="Add" Style="background-image: url(../Images/btn_Silver.jpg); border-width: 0px; width: 78px; height: 22px;"
                                                    Enabled="true" OnClick="btnYear_Click" Visible="false"></asp:Button>
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="btnYear2" CssClass="styleSubmitButton" runat="server" Text="2011-2012"
                                                    ToolTip="Add" Style="background-image: url(../Images/btn_Silver.jpg); border-width: 0px; width: 78px; height: 22px;"
                                                    Visible="false" OnClick="btnYear_Click"></asp:Button>
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="btnYear3" CssClass="styleSubmitButton" runat="server" Text="2012-2013"
                                                    ToolTip="Add" Style="background-image: url(../Images/btn_Silver.jpg); border-width: 0px; width: 78px; height: 22px"
                                                    Visible="false" OnClick="btnYear_Click"></asp:Button>
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="btnYear4" CssClass="styleSubmitButton" runat="server" Text="2012-2013"
                                                    ToolTip="Add" Style="background-image: url(../Images/btn_Silver.jpg); border-width: 0px; width: 78px; height: 22px"
                                                    Visible="false" OnClick="btnYear_Click"></asp:Button>
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="btnYear5" CssClass="styleSubmitButton" runat="server" Text="2012-2013"
                                                    ToolTip="Add" Style="background-image: url(../Images/btn_Silver.jpg); border-width: 0px; width: 78px; height: 22px"
                                                    Visible="false" OnClick="btnYear_Click"></asp:Button>
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="btnYear6" CssClass="styleSubmitButton" runat="server" Text="2012-2013"
                                                    ToolTip="Add" Style="background-image: url(../Images/btn_Silver.jpg); border-width: 0px; width: 78px; height: 22px"
                                                    Visible="false" OnClick="btnYear_Click"></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="styleButtonArea" align="center" style="padding-left: 4px">
                    <td>
                        <br />
                        <asp:Button runat="server" ID="btnSave" CausesValidation="true" AccessKey="S"
                            CssClass="styleSubmitButton" Text="Save" OnClick="btnSave_Click" ToolTip="Save,Alt+S"
                            Enabled="false" />
                        <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="styleSubmitButton" AccessKey="L"
                            Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click"
                            ToolTip="Clear,Alt+L" />
                        <asp:Button runat="server" ID="btnCancel" Text="Exit" CausesValidation="false" AccessKey="X" OnClientClick="return fnConfirmExit();"
                            CssClass="styleSubmitButton" OnClick="btnCancel_Click" ToolTip="Exit,Alt+X" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary runat="server" ID="ValidationSummary1" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="AddNumber" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary3" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" ValidationGroup="EditNum" />
                    </td>
                </tr>
                <tr style="padding-top: 10px; padding-bottom: 10px">
                    <td>
                        <asp:GridView runat="server" ID="grvCreditScoreYearValues" Width="100%" OnRowDataBound="grvCreditScoreYearValues_RowDataBound"
                            RowStyle-HorizontalAlign="Right" CellPadding="5" HeaderStyle-Wrap="true" HeaderStyle-HorizontalAlign="Center"
                            CellSpacing="10" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Description" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDescription"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="Field_Attribute" HeaderText="Attrib" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px" DataField="Numeric_Operator"
                                    HeaderText="Operator" />
                                <asp:TemplateField HeaderText="Required Value (Year1)" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReqParam1" Text='<%# Bind("ReqParam1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:BoundField DataField="Score1" HeaderStyle-Width="60px" HeaderText="Score (Year1)" />--%>
                                <asp:TemplateField HeaderText="Score (Year1)" HeaderStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblScore1" Text='<%# Bind("Score1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Required Value (Year2)" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReqParam2" Text='<%# Bind("ReqParam2") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score (Year2)" HeaderStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblScore2" Text='<%# Bind("Score2") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Required Value (Year3)" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReqParam3" Text='<%# Bind("ReqParam3") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score (Year3)" HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblScore3" Text='<%# Bind("Score3") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Required Value (Year4)" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReqParam4" Text='<%# Bind("ReqParam4") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score (Year4)" HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblScore4" Text='<%# Bind("Score4") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Required Value (Year5)" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReqParam5" Text='<%# Bind("ReqParam5") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score (Year5)" HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblScore5" Text='<%# Bind("Score5") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Required Value (Year6)" HeaderStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReqParam6" Text='<%# Bind("ReqParam6") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Score (Year6)" HeaderStyle-Width="50px">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblScore6" Text='<%# Bind("Score6") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Difference_Percentage" HeaderText="Diff %" />
                                <asp:BoundField DataField="Difference_Mark" HeaderText="Diff Mark" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr class="styleButtonArea">
                    <td>
                        <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                            CssClass="styleMandatoryLabel" ShowMessageBox="false" ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="VSCSM" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAdd"
                            ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="ValidationSummary2" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnEdit"
                            ShowSummary="true" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" value="0" runat="server" id="hdnCreditScoreID" />
                        <input type="hidden" value="0" runat="server" id="hdnDelete" />
                        <input type="hidden" value="0" runat="server" id="hdnFooterAdd" />
                        <input type="hidden" value="0" runat="server" id="hdnCreditScoreUpdatedID" />
                        <input type="hidden" value="0" runat="server" id="hdnCanEdit" />
                        <input type="hidden" value="0" runat="server" id="hdnViewUW_Guide_ID" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblCoproView" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeProShow" runat="server" PopupControlID="dvProView" TargetControlID="lblCoproView"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvProView" style="display: none; width: 75%;">
        <div id="divrProimg" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -35px;">
            <asp:ImageButton ID="rptimg" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="divrProimg_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlProView" GroupingText="Copy Profile" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updPro" runat="server">
                    <ContentTemplate>
                        <div>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td valign="top">
                                        <asp:Panel ID="pnlSearchCopy" GroupingText="Search" CssClass="stylePanel" runat="server">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="styleFieldAlign">
                                                        <asp:RadioButtonList ID="rbnViewType" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                                                            <asp:ListItem Text="Transaction Level" Value="1" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Text="Customer Level" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">Short Name
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <uc2:Suggest ID="txtViewShortName" runat="server" ServiceMethod="GetShortnameList" AutoPostBack="true"
                                                            OnItem_Selected="txtViewShortName_SelectedIndexChanged" ErrorMessage="Select Short Name"
                                                            IsMandatory="false" Width="240px" />

                                                    </td>
                                                    <td class="styleFieldLabel">Line of Business
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtViewLOB" ContentEditable="false" runat="server" Text=""></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="styleFieldLabel">Product
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtViewProduct" ContentEditable="false" runat="server" Text=""></asp:TextBox>
                                                    </td>
                                                    <td class="styleFieldLabel">Constitution
                                                    </td>
                                                    <td class="styleFieldAlign">
                                                        <asp:TextBox ID="txtViewConst" ContentEditable="false" runat="server" Text=""></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="float: right;" width="100%" cellpadding="0" cellspacing="0">
                                            <tr class="stylePagingControl">
                                                <td>
                                                    <asp:RadioButtonList runat="server" ID="rbnCopyYears" RepeatDirection="Horizontal" AutoPostBack="true"
                                                        OnSelectedIndexChanged="rbnCopyYears_SelectedIndexChanged" Enabled="false">
                                                    </asp:RadioButtonList>
                                                    <asp:DropDownList runat="server" Width="100px" AutoPostBack="true" OnSelectedIndexChanged="ddlCopyYears_SelectedIndexChanged"
                                                        ID="ddlCopyYears" ToolTip="Year" Visible="false">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <cc1:TabContainer ID="tcCreditScoreCopy" runat="server" CssClass="styleTabPanel" Width="100%"
                                            ScrollBars="None" TabStripPlacement="top" ActiveTabIndex="0">
                                            <cc1:TabPanel ID="tpMainPageCopy" runat="server" CssClass="tabpan" HeaderText="Credit Score"
                                                BackColor="Red" Style="padding: 0px">
                                                <HeaderTemplate>
                                                    Under Writing
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:UpdatePanel ID="updGrpCopy" runat="server">
                                                        <ContentTemplate>
                                                            <div style="height: 200px; width: 100%; overflow-y: scroll">
                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="100%">
                                                                            <asp:GridView ID="grdGrpNameCopy" runat="server" AutoGenerateColumns="False"
                                                                                ShowFooter="false"
                                                                                OnRowDataBound="grdGrpNameCopy_RowDataBound"
                                                                                DataKeyNames="GroupID" Width="30%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderStyle-Width="5%">
                                                                                        <ItemTemplate>
                                                                                            <asp:ImageButton ID="imgShowCopy" runat="server" OnClick="Show_Hide_ChildGridCopy" ImageUrl="~/images/plus.png"
                                                                                                CommandArgument="Show" />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbl_grpcodeCopy" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Description" HeaderStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbl_grpnameCopy" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                        <ItemTemplate>
                                                                                            <tr>
                                                                                                <td style="width: 5%"></td>
                                                                                                <td style="width: 5%"></td>
                                                                                                <td colspan='100%'>
                                                                                                    <asp:Panel ID="pnlCrScoreCopy" runat="server" Visible="false">
                                                                                                        <asp:GridView runat="server" ShowFooter="true" ID="grvCreditScoreCopy" Width="100%"
                                                                                                            OnRowDataBound="grvCreditScoreCopy_RowDataBound"
                                                                                                            RowStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Center"
                                                                                                            AutoGenerateColumns="False" DataKeyNames="CrScoreParam_ID">
                                                                                                            <Columns>
                                                                                                                <asp:TemplateField HeaderText="Line No" Visible="false">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblLineNoCopy" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                        <asp:Label ID="lblScoreAssignedCopy" runat="server" Text="0" Visible="false"></asp:Label>
                                                                                                                        <asp:Label ID="lblYearCopy" runat="server" Text='<%# Eval("Year")%>' Visible="false"></asp:Label>
                                                                                                                        <asp:Label ID="lblCGroupCodeCopy" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField Visible="false" HeaderText="S.No" HeaderStyle-Width="5%">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lbl_SubgrpcodeCopy" runat="server" Text='<%# Bind("SubGroupCode") %>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Description">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblDescCopy" runat="server" Text='<%# Bind("Desc")%>'></asp:Label>
                                                                                                                        <asp:Label ID="lblParamIDCopy" runat="server" Visible="false" Text='<%#Eval("CrScoreParam_ID")%>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <HeaderStyle Width="23%" />
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Attrib">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblFieldAttNameCopy" Text='<%# Bind("FieldAttName")%>' runat="server"></asp:Label>
                                                                                                                        <asp:Label ID="lblFieldAttCopy" Text='<%# Bind("FieldAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <HeaderStyle Width="10%" />
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Operator">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblNumericNameCopy" Text='<%# Bind("NumericName")%>' runat="server"></asp:Label>
                                                                                                                        <asp:Label ID="lblNumericAttCopy" Text='<%# Bind("NumericAtt")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <HeaderStyle Width="10%" />
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Req Param">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblReqValueCopy" runat="server" Text='<%# Bind("ReqValue")%>' ToolTip="Req Param"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Req Param To">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblReqValueToCopy" runat="server" Text='<%# Bind("ReqValueTo")%>' ToolTip="Req Param To"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Score">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblScoreCopy" runat="server" Text='<%# Bind("Score")%>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Diff %">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblDiffPerCopy" runat="server" Text='<%# Bind("DiffPer")%>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Diff Mark">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblDiffMarkCopy" runat="server" Text='<%# Bind("DiffMark")%>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Scan">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:CheckBox ID="chkScanCopy" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsScan")) %>' Enabled="false" ToolTip="Scan Document" />
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Fe">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:CheckBox ID="chkFormulaCopy" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsFormula")) %>' Enabled="false" ToolTip="Formula" />
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Conduit">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblConduitNameCopy" Text='<%# Bind("ConduitName")%>' runat="server"></asp:Label>
                                                                                                                        <asp:Label ID="lblConduitCopy" Text='<%# Bind("Conduit")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <HeaderStyle Width="10%" />
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                                            <RowStyle HorizontalAlign="Center" />
                                                                                                        </asp:GridView>
                                                                                                    </asp:Panel>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="8" align="Right">
                                                                                                    <table width="100%" border="0">
                                                                                                        <tr>
                                                                                                            <td style="width: 55%"></td>
                                                                                                            <td class="styleFieldLabelBold" style="font-weight: bold;">
                                                                                                                <asp:Label ID="lblTotalScoreCopy" runat="server" Width="80px" Text="Group Score"></asp:Label>
                                                                                                            </td>
                                                                                                            <td class="styleFieldAlign">
                                                                                                                <asp:TextBox ID="txtGrpScoreCopy" runat="server" Style="text-align: right" Width="80px" Text="0" ReadOnly="true"></asp:TextBox>
                                                                                                            </td>
                                                                                                            <td style="width: 5%"></td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="tabANSICopy" runat="server" CssClass="tabpan" HeaderText="Formula"
                                                BackColor="Red" Style="padding: 0px">
                                                <HeaderTemplate>
                                                    ANSI
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:UpdatePanel ID="updANSICopy" runat="server">
                                                        <ContentTemplate>
                                                            <div style="height: 200px; width: 100%; overflow-y: scroll">
                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td width="100%">
                                                                            <asp:GridView ID="GrpFormulaCopy" runat="server" AutoGenerateColumns="False"
                                                                                DataKeyNames="GroupID" Width="25%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderStyle-Width="5%">
                                                                                        <ItemTemplate>
                                                                                            <asp:ImageButton ID="imgShowFeCopy" runat="server" OnClick="Show_Hide_GrpFormulaCopy" ImageUrl="~/images/plus.png"
                                                                                                CommandArgument="Show" />
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbl_grpfecodeCopy" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Group" HeaderStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbl_grpFenameCopy" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Width="0.001%">
                                                                                        <ItemTemplate>
                                                                                            <tr>
                                                                                                <td style="width: 5%"></td>
                                                                                                <td style="width: 5%"></td>
                                                                                                <td colspan='100%'>
                                                                                                    <asp:Panel ID="pnlCrScoreFeCopy" runat="server" Visible="false">
                                                                                                        <asp:GridView runat="server" ShowFooter="true" ID="grvNumbersCopy" Width="100%"
                                                                                                            OnRowDataBound="grvNumbersCopy_RowDataBound"
                                                                                                            RowStyle-HorizontalAlign="Center"
                                                                                                            FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False">
                                                                                                            <Columns>
                                                                                                                <asp:TemplateField HeaderText="Line No">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblLineNoCopy" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                                                                                        <asp:Label ID="lblFeGroupCodeCopy" runat="server" Text='<%# Eval("GroupCode")%>' Visible="false"></asp:Label>
                                                                                                                        <asp:Label ID="lblRecordIdCopy" runat="server" Text='<%# Eval("FeSiNo")%>' Visible="false"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle Width="30px" HorizontalAlign="Center" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Line Type">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblLineTypeCopy" runat="server" Text='<%#Eval("LineType")%>'></asp:Label>
                                                                                                                        <asp:Label ID="lblLineTypeIDCopy" runat="server" Text='<%#Eval("LineTypeID")%>' Visible="false"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Flag">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblFlagCopy" runat="server" Text='<%#Eval("Flag")%>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Description">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblDescriptionCopy" runat="server" Text='<%#Eval("Desc")%>'></asp:Label>
                                                                                                                        <asp:Label ID="lblDescIDCopy" runat="server" Text='<%#Eval("Flag_ID")%>' Visible="false"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Attrib">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblFieldAttFeNameCopy" Text='<%# Bind("FieldAttFeName")%>' runat="server"></asp:Label>
                                                                                                                        <asp:Label ID="lblFieldAttFeCopy" Text='<%# Bind("FieldAttFe")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <HeaderStyle Width="10%" />
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Value">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblValueCopy" runat="server" Text='<%#Eval("Value")%>' Visible="false"
                                                                                                                            Style="text-align: right" Width="100%"></asp:Label>
                                                                                                                        <asp:TextBox ID="txtValueCopy"
                                                                                                                            runat="server" ReadOnly="true"
                                                                                                                            Width="120px" Style="text-align: right" Text='<%#Eval("Value")%>'></asp:TextBox>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Right" Width="100px" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Pick Fill">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblPickFillNameCopy" Text='<%# Bind("PickFillName")%>' runat="server"></asp:Label>
                                                                                                                        <asp:Label ID="lblPickFillCopy" Text='<%# Bind("PickFill")%>' Visible="false" runat="server"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <HeaderStyle Width="10%" />
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Formula">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:CheckBox ID="chkCarryFmlCopy" runat="server" Checked="true" ToolTip="Carry formula result" />
                                                                                                                        <asp:Label ID="lblCarryFmlCopy" Visible="false" runat="server" Text='<%#Eval("CarryFml")%>'></asp:Label>
                                                                                                                        <asp:Label ID="lblFormulaCopy" runat="server" Text='<%#Eval("Formula")%>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField ItemStyle-Wrap="true" HeaderText="Link">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:CheckBox ID="chkLinkCopy" runat="server" />
                                                                                                                        <asp:Label ID="lblLinkCopy" runat="server" Text='<%#Eval("IsLink")%>' Visible="false"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Param Num">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="lblParamTextCopy" runat="server" Text='<%#Eval("ParamText")%>'></asp:Label>
                                                                                                                        <asp:Label ID="lblParamNumCopy" runat="server" Text='<%#Eval("ParamNum")%>' Visible="false"></asp:Label>
                                                                                                                        <asp:Label ID="lblParaSubGRoupCodeCopy" runat="server" Text='<%#Eval("SubGroupCode")%>' Visible="false"></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                                                        </asp:GridView>
                                                                                                    </asp:Panel>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td valign="top" align="center">
                                        <asp:Button runat="server" ID="btnCopyProfile" CausesValidation="false" CssClass="styleSubmitButton"
                                            Text="Copy Profile" OnClientClick="if (!confirm('Are you sure want to Copy the selected Finacial Year Group?')) return false;" OnClick="btnCopyProfile_Click"
                                            ToolTip="Copy Profile" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="left">
                                        <asp:Label ID="lblPopupErrMsg" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript">

        function fnChangeAttribute(filedID, numField, ddlYes1, reqFiled1) {
            //debugger;
            var intTotYear = document.getElementById('<%=txtNoofYears.ClientID%>').value;

            if (document.getElementById(filedID).options.value == '4') {
                document.getElementById(numField).disabled = true;
                document.getElementById(reqFiled1).style.display = 'none';
                document.getElementById(ddlYes1).style.display = 'Block';
            }
            else {
                document.getElementById(numField).disabled = false;
                document.getElementById(reqFiled1).style.display = 'Block';
                document.getElementById(ddlYes1).style.display = 'none';
            }
        }


        function SumScore() {
            //debugger;
            var TargetBaseControl = document.getElementById('ctl00_ContentPlaceHolder1_tcCreditScore_tpMainPage_grvCreditScore');
            //if(TargetBaseControl==null)
            //TargetBaseControl=document.getElementById('ctl00_ContentPlaceHolder1_tcGloblaCreditParameter_tbglobalParameterSetUP_GrvGlobalCreditParamUpdate');
            var Inputs = TargetBaseControl.getElementsByTagName("input");
            var TotalScore = 0;
            for (var n = 0; n < Inputs.length; ++n) {
                if (Inputs[n].type == 'text') {
                    if (Inputs[n].value != '') {
                        if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 6) == 'Score1') {
                            if (Inputs[n].id.substring(Inputs[n].id.length, Inputs[n].id.length - 13) != 'txtTotalScore') {
                                TotalScore = (parseFloat(TotalScore) + parseFloat(Inputs[n].value)).toFixed(4);
                            }
                        }
                    }
                }

            }

        }


        function FunDiffMarkEnabled(inputP, inputM) {
            //debugger;
            var Percentage = document.getElementById(inputP).value;
            var Mark = document.getElementById(inputM).value;
            if (Percentage == '') {
                document.getElementById(inputM).setAttribute("readOnly", "readOnly");
                document.getElementById(inputM).value = '';
            }
            else {
                document.getElementById(inputM).removeAttribute("readOnly");
            }
        }

        function FunReqScoreEnabled(inputR, inputS) {
            //debugger;
            var ddlReq = document.getElementById(inputR).selectedIndex;
            var Score = document.getElementById(inputS).value;
            if (ddlReq == 0) {
                document.getElementById(inputS).setAttribute("readOnly", "readOnly");
                document.getElementById(inputS).value = '';
                SumScore();
            }
            else {
                document.getElementById(inputS).removeAttribute("readOnly");
            }
        }

        function FunRowControlsEnabled(inputReq, inputScr, inputDiffP, inputDiffM, IsFooter, ddlYear, inputFA, inputNO) {
            //debugger;
            var Req = document.getElementById(inputReq).value;
            var Score = document.getElementById(inputScr).value;
            var DiffPer = document.getElementById(inputDiffP).value;
            var DiffM = document.getElementById(inputDiffM).value;
            var ddlFieldAttri = document.getElementById(inputFA).selectedIndex;
            var ddlNumOper = document.getElementById(inputNO).selectedIndex;
            if (Req == '') {
                document.getElementById(inputScr).setAttribute("readOnly", "readOnly");
                document.getElementById(inputDiffP).setAttribute("readOnly", "readOnly");
                document.getElementById(inputDiffM).setAttribute("readOnly", "readOnly");

                document.getElementById(inputScr).value = '';

                var year = document.getElementById(ddlYear).selectedIndex;

                if (year == 0) {
                    document.getElementById(inputDiffP).value = '';
                    document.getElementById(inputDiffM).value = '';
                }
                if (IsFooter == '0') {
                    SumScore();
                }
            }
            if (ddlFieldAttri == 1 && ddlNumOper == 5) {
                document.getElementById(inputDiffP).value = '';
                document.getElementById(inputDiffM).value = '';
                //            document.getElementById(inputDiffP).setAttribute("readOnly","readOnly");
                //            document.getElementById(inputDiffM).setAttribute("readOnly","readOnly");  
                document.getElementById(inputDiffP).setAttribute("ContentEditable", "false");
                document.getElementById(inputDiffM).setAttribute("ContentEditable", "false");
            }
            else {
                //            document.getElementById(inputDiffP).removeAttribute("readOnly");
                //            document.getElementById(inputDiffM).removeAttribute("readOnly");

                document.getElementById(inputDiffP).setAttribute("ContentEditable", "true");
                document.getElementById(inputDiffM).setAttribute("ContentEditable", "true");
            }
        }


        function FunDiFFPerandMarkEnabled(inputFA, inputNO, inputDiffP, inputDiffM) {
            //      //debugger;
            //        var ddlFieldAttri = document.getElementById(inputFA).selectedIndex;
            //        var ddlNumOper = document.getElementById(inputNO).selectedIndex;
            //        var DiffPer = document.getElementById(inputDiffP).value;
            //        var DiffM = document.getElementById(inputDiffM).value;
            //        
            //        if(ddlFieldAttri == 1 && ddlNumOper == 5)
            //        {
            //            document.getElementById(inputDiffP).value = '';
            //            document.getElementById(inputDiffM).value = '';
            //            
            //            document.getElementById(inputDiffP).setAttribute("ContentEditable", "false");
            //            document.getElementById(inputDiffM).setAttribute("ContentEditable", "false");      
            //           
            //        }
            //        else
            //        {
            //             document.getElementById(inputDiffP).setAttribute("ContentEditable", "true");
            //             document.getElementById(inputDiffM).setAttribute("ContentEditable", "true");  
            //        }
        }

        function fnAppendFormula(txtBx, ddlItem) {
            //debugger;
            var itemTxt = document.getElementById(ddlItem).options[document.getElementById(ddlItem).selectedIndex].text;
            if (itemTxt != '--Select--') {
                document.getElementById(txtBx).value = document.getElementById(txtBx).value + '(' + itemTxt + ')';
            }
        }
        function fnDescChange(txtDescF, ddlFieldF, ddlNumericF, ddlConduitF, txtDiffPerF, txtDiffMarkF,
            txtScoreF, txtReqValueF, chkScanF, chkFormulaF) {            
            var txtCrDesc = document.getElementById(txtDescF);
            if (txtCrDesc.value.trim() != 'Hygiene') {
                document.getElementById(ddlFieldF).disabled = false;
                var itemTxt = document.getElementById(ddlNumericF).options[document.getElementById(ddlFieldF).selectedIndex].value;
                if (itemTxt == '4') {
                    document.getElementById(ddlNumericF).disabled = true;
                }
                else {
                    document.getElementById(ddlNumericF).disabled = false;
                }
                document.getElementById(ddlConduitF).disabled = false;
                document.getElementById(txtDiffPerF).disabled = false;
                document.getElementById(txtDiffMarkF).disabled = false;
                document.getElementById(txtReqValueF).disabled = false;
                document.getElementById(chkScanF).disabled = false;
                document.getElementById(chkFormulaF).disabled = false;
            }
            else {   
                document.getElementById(ddlFieldF).disabled = true;
                document.getElementById(ddlNumericF).disabled = true;
                document.getElementById(ddlConduitF).disabled = true;
                document.getElementById(txtDiffPerF).disabled = true;
                document.getElementById(txtDiffMarkF).disabled = true;
                document.getElementById(txtReqValueF).disabled = true;
                document.getElementById(chkScanF).disabled = true;
                document.getElementById(txtScoreF).disabled = false;
                document.getElementById(chkFormulaF).disabled = true;
            }
        }
        function fnChkFreeze(ctrl) {
            //debugger;
            document.getElementById(ctrl).checked = !document.getElementById(ctrl).checked;
        }


        function fnSetNextYear() {
            //debugger;
            var txtPrvYear = document.getElementById('<%=txtPrvYears.ClientID%>');
            var txtNxtYear = document.getElementById('<%=txtNxtYears.ClientID%>');
            var txtCurYears = document.getElementById('<%=txtCurYears.ClientID%>');
            var txtNoofYear = document.getElementById('<%=txtNoofYears.ClientID%>');
            if (parseInt(txtPrvYear.value) >= 0 && parseInt(txtNoofYear.value) > 0) {
                if (parseInt(txtNoofYear.value) == parseInt(txtPrvYear.value)) {
                    txtCurYears.value = 0;
                }
                else {
                    txtCurYears.value = 1;
                }

                txtNxtYear.value = parseInt(txtNoofYear.value) - (parseInt(txtPrvYear.value) + parseInt(txtCurYears.value));
                if (parseInt(txtNxtYear.value) < 0) {
                    txtNxtYear.value = '0';
                }
                if (parseInt(txtCurYears.value) < 0) {
                    txtCurYears.value = '0';
                }
            }
            else {
                txtNxtYear.value = '';
                txtCurYears.value = '';
            }
        }

    </script>
</asp:Content>

