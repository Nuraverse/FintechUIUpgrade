<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAAccountCard_Add, App_Web_hqzzel3u" title="Account Card" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc2" TagName="NameSetup" Src="~/UserControls/NameSetup.ascx" %>
<%@ Register TagPrefix="uc3" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <asp:UpdatePanel ID="upmain" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Account card" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                    </div>
                    <div class="row">
                        <cc1:TabContainer ID="TCAccountCard" runat="server" CssClass="styleTabPanel" Width="100%"
                            ScrollBars="None" ActiveTabIndex="2">
                            <cc1:TabPanel ID="TPSubAccountDetails" runat="server">
                                <HeaderTemplate>
                                    Sub Ledger Details
                                </HeaderTemplate>
                                <ContentTemplate>

                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="gvSubAccountdtls" runat="server" Width="100%" AutoGenerateColumns="False"
                                                    AllowSorting="True" CssClass="gird_details">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="GL Code">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("GL_Code") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GL Description">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGLDesc" runat="server" Text='<%# Bind("GL_Desc") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSL_Code" runat="server" Text='<%# Bind("SL_Code") %>' align="left"
                                                                    Height="10px"> </asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderTemplate>
                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                    <thead>
                                                                        <tr align="center">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <asp:LinkButton ID="lnkbtnSort1" CssClass="styleGridHeader" runat="server" CausesValidation="false"
                                                                                    OnClick="FunProSortingColumn" ToolTip="Sort By SL Code" Text="SL Code"> </asp:LinkButton><asp:Button
                                                                                        ID="imgbtnSort1" CssClass="styleImageSortingAsc" runat="server" ImageAlign="Middle"
                                                                                        CausesValidation="false" />
                                                                            </th>
                                                                        </tr>
                                                                        <tr align="left">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch1" runat="server"
                                                                                        AutoPostBack="true" OnTextChanged="FunProHeaderSearch" CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </HeaderTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSLDescription" runat="server" Text='<%# Bind("SL_Desc") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderTemplate>
                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                    <thead>
                                                                        <tr align="center">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <asp:LinkButton ID="lnkbtnSort2" CssClass="styleGridHeader" runat="server" CausesValidation="false"
                                                                                    OnClick="FunProSortingColumn" ToolTip="Sort By SL Description" Style="text-decoration: none;" Text="SL Description"></asp:LinkButton>
                                                                                <asp:Button
                                                                                    ID="imgbtnSort2" CssClass="styleImageSortingAsc" runat="server" ImageAlign="Middle"
                                                                                    CausesValidation="false" />
                                                                            </th>
                                                                        </tr>
                                                                        <tr align="left">
                                                                            <th style="padding: 0px !important; background: none !important;">
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch2" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                        AutoPostBack="true" OnTextChanged="FunProHeaderSearch" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </HeaderTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountType" runat="server" Text='<%# Bind("AccountType") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderTemplate>
                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                    <tr align="center">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <asp:LinkButton ID="lnkbtnSort3" CssClass="styleGridHeader" runat="server" CausesValidation="false"
                                                                                OnClick="FunProSortingColumn" ToolTip="Sort By Account Type" Style="text-decoration: none;" Text="Account Type"></asp:LinkButton>
                                                                            <asp:Button
                                                                                ID="imgbtnSort3" CssClass="styleImageSortingAsc" runat="server" ImageAlign="Middle"
                                                                                CausesValidation="false" />
                                                                        </th>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <th style="padding: 0px !important; background: none !important;">
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox AutoCompleteType="None" ID="txtHeaderSearch3" runat="server" CssClass="md-form-control form-control login_form_content_input"
                                                                                    AutoPostBack="true" OnTextChanged="FunProHeaderSearch"></asp:TextBox>
                                                                            </div>
                                                                        </th>
                                                                    </tr>
                                                                </table>
                                                            </HeaderTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Active" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkIS_Active" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "IS_Active").ToString().ToUpper() == "TRUE"%>'
                                                                    Enabled="false"></asp:CheckBox>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account Id" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountId" runat="server" Text='<%# Bind("Account_Id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkSelectRecord" runat="server" AutoPostBack="true" align="center"
                                                                    OnCheckedChanged="chkSelectRecord_OnCheckedChanged" />
                                                            </ItemTemplate>
                                                            <HeaderTemplate>
                                                                Select
                                                            </HeaderTemplate>
                                                            <ItemStyle HorizontalAlign="Center" Width="8%" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <RowStyle HorizontalAlign="Left" Height="10px" />
                                                </asp:GridView>
                                                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                                            </div>

                                        </div>
                                    </div>


                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TPMainPage" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Main
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanelCompanyDtls" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">
                                                                <asp:Panel ID="pnlAccountInformation" Width="98%" runat="server" CssClass="stylePanel"
                                                                    GroupingText="Account Information">

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlAccountNature" runat="server" class="md-form-control form-control" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Nature" ID="lblAccountNature" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlAccountCharacteristics" runat="server" AutoPostBack="true"
                                                                                            OnSelectedIndexChanged="ddlAccountChar_SelectedIndexChanged" class="md-form-control form-control" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlAccountCharacteristics" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlAccountCharacteristics"
                                                                                                InitialValue="0" ErrorMessage="Select Account Characteristics"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Characteristics" ID="lblAccountCharacteristics"
                                                                                                CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtlinenumber"
                                                                                            runat="server" MaxLength="5" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" FilterType="Custom, Numbers"
                                                                                            TargetControlID="txtlinenumber" runat="server" Enabled="True">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtlinenumber"
                                                                                                ErrorMessage="Enter Line Number in Main tab"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Line Number" ID="Label7" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtAccountNumber" onchange="funsetGLAcctCode(this);" OnTextChanged="txtAccountNumber_TextChanged"
                                                                                            AutoPostBack="true" runat="server" MaxLength="8" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAccountNumber" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                            TargetControlID="txtAccountNumber" runat="server" Enabled="True">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAccountNumber" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAccountNumber"
                                                                                                ErrorMessage="Enter Account Number in Main tab"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <cc1:AutoCompleteExtender runat="server" ID="autoComplete1" TargetControlID="txtAccountNumber"
                                                                                            ServiceMethod="GetGLCodeList" ServicePath="" MinimumPrefixLength="0" EnableCaching="true"
                                                                                            Enabled="True" CompletionSetCount="20" CompletionInterval="200">
                                                                                        </cc1:AutoCompleteExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Number" ID="lblAccountNumber" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtAccountDescription" onchange="funsetAcctDesc(this);" OnTextChanged="txtAccountDescription_TextChanged"
                                                                                            runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVAccountDescription" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAccountDescription"
                                                                                                ErrorMessage="Enter Account Description in main tab"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                                            TargetControlID="txtAccountDescription" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Description" ID="lblAccountDescription" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlPosition" runat="server" class="md-form-control form-control" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlPosition" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlPosition"
                                                                                                InitialValue="0" ErrorMessage="Select Position"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Position" ID="lblPosition" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlAccountLeg" runat="server" class="md-form-control form-control" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlAccountLeg" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlAccountLeg"
                                                                                                InitialValue="0" ErrorMessage="Select Account Leg"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Leg" ID="lblAccountLeg" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlAccountType" runat="server" AutoPostBack="true" class="md-form-control form-control"
                                                                                            OnSelectedIndexChanged="ddlAccountType_SelectedIndexChanged" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlAccountType" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlAccountType"
                                                                                                InitialValue="0" ErrorMessage="Select Account Type"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Account Type" ID="Label8" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlGroupName" runat="server" class="md-form-control form-control" />
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvGroupName" CssClass="validation_msg_box_sapn"
                                                                                                SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlGroupName"
                                                                                                InitialValue="0" ErrorMessage="Select Group Name"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Group Name" ID="lblGroupName" CssClass="styleReqFieldLabel">
                                                                                            </asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>



                                                                            </div>

                                                                            <div class="row">


                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="ChkManualJV" runat="server" Text="Manual JV" />
                                                                                </div>


                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="ChkIs_lending" runat="server" Checked="true" Text="S3G LMS" />
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="chkPayment" runat="server" Text="Payment" />
                                                                                </div>

                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="chkSubGLApplicable" runat="server" Checked="false" Enabled="false" AutoPostBack="true" OnCheckedChanged="chkSubGLApplicable_CheckedChanged" Text="SubGL Applicable" />
                                                                                </div>




                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="chkReceipt" runat="server" Text="Receipt" />
                                                                                </div>

                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="chkAutoSL" runat="server" Checked="false" Enabled="false" Text="Auto SL Generation" />
                                                                                </div>

                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" Text="Active" />
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                                                    <asp:CheckBox ID="chkBudgetAppl" runat="server" Checked="false" Text="Budget Applicable" />
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                </asp:Panel>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">
                                                                <asp:Panel ID="pnlLocation" Width="98%" runat="server" CssClass="stylePanel" GroupingText="Branch">
                                                                    <div style="overflow: auto; height: 300px">
                                                                        <asp:TreeView ID="treeview" runat="server" ImageSet="Simple" ShowCheckBoxes="Parent,Leaf"
                                                                            ShowLines="True" OnPreRender="treeview_PreRender" DataSourceID="XmlDataSource1" RootNodeStyle-ForeColor="#003d9e"
                                                                            LeafNodeStyle-ForeColor="#003d9e" ParentNodeStyle-ForeColor="#003d9e" SelectedNodeStyle-BackColor="#99CCFF"
                                                                            RootNodeStyle-Font-Size="14px" LeafNodeStyle-Font-Size="14px" ParentNodeStyle-Font-Size="14px">
                                                                            <DataBindings>
                                                                                <asp:TreeNodeBinding DataMember="MenuItem" TextField="title" ToolTipField="title"
                                                                                    ValueField="Location_ID" SelectAction="Expand" />
                                                                            </DataBindings>
                                                                        </asp:TreeView>
                                                                        &nbsp;
                                                                                        <asp:XmlDataSource ID="XmlDataSource1" runat="server" TransformFile="~/TransformXSLTAcctcard.xsl"
                                                                                            EnableCaching="False"></asp:XmlDataSource>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <%-- Activity Add by : Boobalan M - 12-12-2019--%>
                                                        <div class="row">

                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">

                                                                <asp:Panel ID="pnlActivity" Visible="false" Width="98%" runat="server" CssClass="stylePanel" GroupingText="Activity">
                                                                    <div style="overflow-x: hidden; overflow-y: auto; max-height: 120px; text-align: center" class="grid">
                                                                        <asp:GridView runat="server" ID="grvActivityList" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                                                            OnRowDataBound="grvActivity_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                                                            <Columns>
                                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Activity"
                                                                                    HeaderStyle-Width="70%">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblActivity" runat="server" ToolTip='<%#Eval("DESCRIPTION")%>' Text='<%#Eval("DESCRIPTION")%>'></asp:Label>
                                                                                        <asp:Label ID="lblActivityID" runat="server" Visible="false" Text='<%#Eval("DESCRIPTION")%>'></asp:Label>
                                                                                        <asp:TextBox ID="txtActivityId" Visible="false" AutoPostBack="true" Text='<%#Eval("ID")%>' runat="server"></asp:TextBox>

                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderStyle-Width="30%">

                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="chkSelectLI" runat="server"></asp:CheckBox>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <RowStyle HorizontalAlign="Center" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TPEntityDetails" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Entity Details
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPnlEntityDetails" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountNumberE" ReadOnly="true" runat="server" MaxLength="8"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Nature" ID="lblAccountNumberE" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountDescriptionE" ReadOnly="true" runat="server" MaxLength="50"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Description" ID="lblAccountDescriptionE"
                                                                            CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEntityType" runat="server" ReadOnly="true" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtEntityType" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtEntityType"
                                                                            ErrorMessage="Enter Entity Type in Entity tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Entity Type" ID="lblEntityType" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtIncomeTaxNumber" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" FilterType=" Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtIncomeTaxNumber" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Income Tax Number" ID="Label9" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSubAccount" runat="server" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtSubAccount" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtSubAccount"
                                                                            ErrorMessage="Enter Sub Ledger in Entity tab" Enabled="false"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtSubAccount" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtSubAccount" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sub Ledger" ID="lblSubAccount" CssClass="styleReqFieldLabel">
                                                                        </asp:Label><span id="lblLastSLCode" runat="server" style="color: #ff0000;"></span>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">

                                                                    <asp:TextBox ID="txtGST1" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" FilterType=" Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtGST1" runat="server" Enabled="True" ValidChars="(),/-">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sales Tax Reg. No" ID="lblGST1" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtGST1Date" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtGST1Date"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgtxtGST1Date"
                                                                        ID="CEtxtGST1Date" Enabled="True" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sales Tax Reg. Date" ID="lblGST1Date" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtGST2" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtGST2" runat="server" Enabled="True" ValidChars="(),/-">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Tax Reg. No" ID="lblGST2" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtGST2Date" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtGST2Date"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgtxtGST2Date"
                                                                        ID="CEtxtGST2Date" Enabled="True" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Tax Reg. Date" ID="lblGST2Date" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <UC:Suggest ID="ddlNationality" runat="server" IsMandatory="false" AutoPostBack="true" class="md-form-control form-control" ValidationGroup="Save" ItemToValidate="Text" ErrorMessage="Select Nationality" ServiceMethod="GetNationalityList" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Nationality" ID="Label2" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlConstitution" class="md-form-control form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlConstitution_SelectedIndexChanged" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVConstitution" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlConstitution"
                                                                            InitialValue="0" Enabled="false" ErrorMessage="Select Constitution"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Constitution" ID="Label3" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCRNUmber" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVCRNumber" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtCRNUmber"
                                                                            ErrorMessage="Enter CR Number in Entity Details Tab"></asp:RequiredFieldValidator>

                                                                    </div>

                                                                    <%-- <div class="validation_msg_box">
                                                                        <asp:RegularExpressionValidator ID="REVCRNumber" runat="server" ControlToValidate="txtCRNUmber" CssClass="validation_msg_box_sapn"
                                                                            ValidationGroup="Save" Display="Dynamic" ErrorMessage="Enter a valid CR Number" ValidationExpression=""></asp:RegularExpressionValidator>
                                                                    </div>--%>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="CR Number" ID="lblCRNumber1" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>






                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCreditPeriod" runat="server" MaxLength="7" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVCreditPeriod" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtCreditPeriod"
                                                                            ErrorMessage="Enter Credit Period Allowed in Entity Details Tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtCreditPeriod" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Credit Period Allowed" ID="Label4"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlInvestorType" runat="server" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVInestorType" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="ddlInvestorType"
                                                                            InitialValue="0" Enabled="false" ErrorMessage="Select Investor Type"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Investor Type" ID="Label6" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtNoofshares" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="5"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtNoofshares" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvnoofshares" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtNoofshares"
                                                                            ErrorMessage="Enter No of Shares in Entity Details Tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="No. Of Shares" ID="lblnoofshares"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInvestorsecurity" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="20"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtInvestorsecurity" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvinvestorsecurity" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtInvestorsecurity"
                                                                            ErrorMessage="Enter Investor Security in Entity Details Tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Investor Security" ID="lblInvestorSecurity"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>




                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtshareholdingpercentage" runat="server" MaxLength="22" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtshareholdingpercentage" runat="server" Enabled="True" ValidChars=".">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvshareholding" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtshareholdingpercentage"
                                                                            ErrorMessage="Enter Share holding% in Entity Details Tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RangeValidator ID="rngshareholdingpercentage" runat="server" Display="Dynamic" ValidationGroup="Save" Enabled="true"
                                                                            ControlToValidate="txtshareholdingpercentage" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 100" Type="Double" MinimumValue="1" MaximumValue="100"></asp:RangeValidator>
                                                                    </div>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Shares Holding%" ID="lblshareholdingpercentage"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtPositionincompany" runat="server" MaxLength="30" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvPositionincompany" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtPositionincompany"
                                                                            ErrorMessage="Enter position in company in Entity Details Tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Position in Company" ID="lblPositionincompany"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtRepresentcompany" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvRepresentCompany" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtRepresentcompany"
                                                                            ErrorMessage="Enter Represent Company in Entity Details Tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Represent Company" ID="lblRepresentcompany"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEntityName" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtName" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtEntityName"
                                                                            ErrorMessage="Enter Entity Name"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtEntityName" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                        TargetControlID="txtEntityName" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Name" ID="lblName" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEntityEffectiveFrom" class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CeEntityEffectivefrom" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                        PopupButtonID="imgEntityDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                                        TargetControlID="txtEntityEffectiveFrom">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:Image ID="imgEntityDate" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEntityEffectivefrom" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="txtEntityEffectiveFrom"
                                                                            InitialValue=" " ErrorMessage="Enter Effective From Date" Enabled="false"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Effective From Date" ID="lblEffectiveFrom" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEntityEffectiveTo" class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CEEntityEffectiveTO" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                        PopupButtonID="imgEntityEffectiveTo"
                                                                        TargetControlID="txtEntityEffectiveTo" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:Image ID="imgEntityEffectiveTo" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEntityEffectiveto" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="txtEntityEffectiveTo"
                                                                            InitialValue=" " ErrorMessage="Enter Effective To Date" Enabled="false"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Effective To" ID="Label10" CssClass="styleReqFieldLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="chkSLActiveE" runat="server" Text="Active" Checked="true"></asp:CheckBox>

                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="chkRelatedParty" runat="server" Text="Related party Indicator"></asp:CheckBox>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTaxReferenceNumber" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true" Visible="false"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" FilterType=" Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtTaxReferenceNumber" runat="server" Enabled="True" ValidChars="(),/-">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Tax Reference Number" ID="lblTaxReferenceNumber" Visible="false"
                                                                            CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>




                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlTAXApplicability" runat="server"
                                                                class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlTAXApplicability_SelectedIndexChanged" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="TAX Applicability" ID="lblTAXApplicability" CssClass="styleReqFieldLabel">
                                                                </asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="divVATTIN">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtVATTIN" runat="server" MaxLength="25" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Entity VAT TIN" ID="lblVATTIN" CssClass="styleDisplayLabel">
                                                                </asp:Label>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel GroupingText="Entity Names" ID="pnlEntityNames" runat="server" Visible="false" Width="100%"
                                                            CssClass="stylePanel">

                                                            <uc2:NameSetup ID="ucEntityNamesSetup" runat="server" Ontext_changed="NameChange" />
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlEntityInfo" runat="server" CssClass="stylePanel" GroupingText="Entity Information">

                                                            <uc3:AddSetup ID="ucAddressDetailsSetup" runat="server" />
                                                        </asp:Panel>
                                                    </div>
                                                </div>

                                                <div class="row" style="float: right; margin-top: 5px; margin-left: 10px;">
                                                    <button class="css_btn_enabled" id="btnAddAdds" onserverclick="btnAddAdds_ServerClick" runat="server"
                                                        type="button" accesskey="O" title="Add the Details[Alt+O]" validationgroup="AddAdds">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;Add
                                                    </button>
                                                    <button class="css_btn_enabled" id="btnModifyAdds" onserverclick="btnModifyAdds_ServerClick" runat="server"
                                                        type="button" accesskey="M" title="Modify the Details[Alt+M]" validationgroup="AddAdds">
                                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>odify
                                                    </button>
                                                </div>
                                            </div>
                                            <div id="grvAddressDetail" style="margin-top: 10px;" class="gird col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <div class="gird">
                                                        <asp:GridView ID="grvAddressDetails" runat="server" AllowPaging="True" HeaderStyle-CssClass="styleGridHeader"
                                                            class="gird_details" AutoGenerateColumns="False"
                                                            EmptyDataText="No Address Details Found!..." OnRowDataBound="grvAddressDetails_RowDataBound" ToolTip="Address Details"
                                                            OnRowDeleting="grvAddressDetails_RowDeleting" OnSelectedIndexChanged="grvAddressDetails_SelectedIndexChanged">
                                                            <Columns>
                                                                <asp:CommandField ShowSelectButton="True" Visible="False" />
                                                                <asp:TemplateField HeaderText="ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Add_Mapping_ID" runat="server" Text='<%#Bind("Cust_Add_Mapping_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Address ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Address_ID" runat="server" Text='<%#Bind("Cust_Address_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Address Type ID" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Address_Type_ID" runat="server" Text='<%#Bind("Cust_Address_Type_ID") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <%-- <asp:TemplateField HeaderText="Address Type">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCust_Address_Type" runat="server" Text='<%#Bind("Cust_Address_Type") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>--%>
                                                                <asp:TemplateField HeaderText="Postal Code">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPostalCode_Text" runat="server" Text='<%#Bind("Postal_Code_Text") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="PostalCode_Value" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblPostalCode_Value" runat="server" Text='<%#Bind("Postal_Code_Value") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Post_Box_No" HeaderText="Post Box No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Way_No" HeaderText="Way No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="House_No" HeaderText="House No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Block_No" HeaderText="Block No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Flat_No" HeaderText="Flat No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="LandMark" HeaderText="Land Mark" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField HeaderText="Area Sheik">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblArea_Sheik_Text" runat="server" Text='<%#Bind("Area_Sheik") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="Residence_Phone_No" HeaderText="Residence Phone No" NullDisplayText="">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Residence_Fax_No" HeaderText="Residence Fax No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Mobile_Phone_No" HeaderText="Mobile Phone No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Contact_Name" HeaderText="Contact Name" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Contact_No" HeaderText="Contact No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Office_Phone_No" HeaderText="Office Phone No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Office_Fax_No" HeaderText="Office Fax No" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Cust_Email" HeaderText="Email" NullDisplayText=" ">
                                                                    <ItemStyle Width="10%" Wrap="True" />
                                                                </asp:BoundField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="lnkbtnDelete" runat="server" CommandName="Delete" CssClass="grid_btn_delete" CausesValidation="false"
                                                                            Text="Remove" AccessKey="R" OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove,Alt+R" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <input id="hdnAddsID" runat="server" type="hidden" />
                                                        </input>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlContactInfo" runat="server" CssClass="stylePanel" GroupingText="Contact Person Information">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtContactperson" runat="server" MaxLength="25" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtContactperson" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                            TargetControlID="txtContactperson" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Contact person" ID="lblContactperson" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDesignation" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtDesignation" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                            TargetControlID="txtDesignation" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Designation" ID="lblDesignation" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtLandline" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtLandline" FilterType="Custom,Numbers" TargetControlID="txtLandline"
                                                                            runat="server" Enabled="True" ValidChars="()-+">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Landline" ID="lblLandline" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtMobile" runat="server" MaxLength="14" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtMobile" FilterType="Numbers" TargetControlID="txtMobile"
                                                                            runat="server" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Mobile" ID="lblMobile" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtEmailID" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtEmailID" runat="server" TargetControlID="txtEmailID"
                                                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars="._-@"
                                                                            Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RegularExpressionValidator ID="revtxtEmailID" runat="server" ControlToValidate="txtEmailID" CssClass="validation_msg_box_sapn"
                                                                                ValidationGroup="Save" Display="Dynamic" ErrorMessage="Enter a valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Email ID" ID="lblEmailID" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtWeb" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Web" ID="lblWeb" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtUniqueID" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" FilterType=" Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtUniqueID" runat="server" Enabled="True">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Unique ID" ID="lblUniqueID" CssClass="styleDisplayLabel">
                                                                            </asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>


                                                            </div>

                                                        </asp:Panel>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="pnlBankdetails" runat="server" GroupingText="Bank Details"
                                                            CssClass="stylePanel">
                                                            <div class="gird">
                                                                <asp:GridView ID="grvBankDetails" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                    EmptyDataText="No Bank Details Found!..." Width="100%" ShowFooter="true" OnRowCommand="grvBankDetails_OnRowCommand"
                                                                    OnRowDeleting="grvBankDetails_OnRowDeleting" class="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Bank_Map_ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBankMapIDI" runat="server" Text='<%# Eval("Bank_Map_ID")%>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Bank Name" FooterStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBankNameI" runat="server" Text='<%# Eval("BankName")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtBankNameF" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true" />
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtBankNameF" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" runat="server" ValidationGroup="btnAdd" ControlToValidate="txtBankNameF"
                                                                                            ErrorMessage="Enter Bank Name"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtBankNameF" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                        TargetControlID="txtBankNameF" runat="server" ValidChars=" " Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Bank Address" FooterStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblBankAddressI" runat="server" Text='<%# Eval("BankAddress")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtBankAddressF" runat="server" TextMode="MultiLine" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"
                                                                                        onkeyup="maxlengthfortxt(50)" />
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtBankAddressF" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" runat="server" ValidationGroup="btnAdd" ControlToValidate="txtBankAddressF"
                                                                                            ErrorMessage="Enter Bank Address"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtBankAddressF" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                                        TargetControlID="txtBankAddressF" runat="server" Enabled="True" ValidChars=", `~!@#$%^*()_+-={}[]|\:;?/.">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="IFS Code" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIFSCCodeI" runat="server" Text='<%# Eval("IFSCCode")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtIFSCCodeF" runat="server" MaxLength="11" />
                                                                                    <asp:RegularExpressionValidator ID="revtxtPanNumber" runat="server" Display="None"
                                                                                        ValidationGroup="btnAdd" ErrorMessage="Enter the valid IFS Code(like AAAA1234567)"
                                                                                        ControlToValidate="txtIFSCCodeF" ValidationExpression="[a-zA-Z]{4}[0-9]{7}"></asp:RegularExpressionValidator>

                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtIFSCCodeF" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" runat="server" Enabled="false" ValidationGroup="btnAdd" ControlToValidate="txtIFSCCodeF"
                                                                                            ErrorMessage="Enter IFSC Code"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Type" FooterStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccountTypeIDI" Visible="false" runat="server" Text='<%# Eval("AccountTypeID")%>' />
                                                                                <asp:Label ID="lblAccountTypeI" runat="server" Text='<%# Eval("AccountType")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlAccountTypeF" runat="server" CssClass="md-form-control form-control login_form_content_input" />
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlAccountTypeF" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" runat="server" ValidationGroup="btnAdd" ControlToValidate="ddlAccountTypeF"
                                                                                            ErrorMessage="Select Account Type" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Number" FooterStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccountNumberI" runat="server" Text='<%# Eval("AccountNumber")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtAccountNumberF" runat="server" MaxLength="12" />
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAccountNumberF" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" runat="server" ValidationGroup="btnAdd" ControlToValidate="txtAccountNumberF"
                                                                                            ErrorMessage="Enter Account Number"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtAccountNumberF" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                        TargetControlID="txtAccountNumberF" runat="server" Enabled="True" ValidChars="-/()">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Edit">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn" AccessKey="R" ToolTip="Alt+R"
                                                                                    OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:Button>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnAdd" runat="server" CommandName="Add"
                                                                                    Text="Add" ValidationGroup="btnAdd" CssClass="grid_btn" AccessKey="T" ToolTip="Alt+T"></asp:Button>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>

                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                            </div>


                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                           
                            <cc1:TabPanel runat="server" ID="TPAccountDetails1" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Account Details - 1
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPnlAccountDetails1" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountNumberAD1" runat="server" ReadOnly="true" MaxLength="8"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Number" ID="lblAccountNumberAD1" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountDescriptionAD1" ReadOnly="true" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Description" ID="lblAccountDescriptionAD1"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEntityTypeAD1" runat="server" ReadOnly="true" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Type" ID="lblEntityTypeAD1" CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSubAccountAD1" runat="server" onchange="funsetSLAcctCode(this);" class="md-form-control form-control login_form_content_input requires_true"
                                                                        OnTextChanged="txtSubAccountAD1_TextChanged" MaxLength="12"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" Enabled="false" ID="RFVtxtSubAccountAD1"
                                                                            CssClass="validation_msg_box_sapn" SetFocusOnError="True" runat="server" ValidationGroup="Save"
                                                                            ControlToValidate="txtSubAccountAD1" ErrorMessage="Enter Sub Ledger in Account details - 1 tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtSubAccountAD1" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtSubAccountAD1" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sub Ledger" ID="lblSubAccountAD1" CssClass="styleDisplayLabel">
                                                                        </asp:Label><span id="lbllastslcodeacc1" runat="server" style="color: #ff0000;"></span>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountNameAD1" runat="server" MaxLength="50" onchange="funsetSLAcctDesc(this);"
                                                                        OnTextChanged="txtAccountNameAD1_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <%--<asp:RequiredFieldValidator Display="None" ID="RFVtxtAccountNameAD1" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAccountNameAD1"
                                                        ErrorMessage="Enter Account Name in Account details - 1 tab"></asp:RequiredFieldValidator>--%>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtAccountNameAD1" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                        TargetControlID="txtAccountNameAD1" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sub Ledger Description" ID="lblAccountNameAD1" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="ChkSLActiveAD1" runat="server" Checked="true" Text="Active"></asp:CheckBox>
                                                            </div>
                                                        </div>


                                                    </div>


                                                </div>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" ID="TPAccountDetails2" CssClass="tabpan" BackColor="Red">
                                <HeaderTemplate>
                                    Account Details - 2
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UPnlAccountDetails2" runat="server">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountNumberAD2" runat="server" ReadOnly="true" MaxLength="8" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Number" ID="lblAccountNumberAD2" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountDescriptionAD2" ReadOnly="true" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Account Description" ID="lblAccountDescriptionAD2"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtSubAccountAD2" runat="server" ReadOnly="true" MaxLength="14" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sub Ledger" ID="lblSubAccountAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                    <span id="lbllastslcodeacc2" runat="server" style="color: #ff0000;"></span>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAccountNameAD2" runat="server" ReadOnly="true" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Sub Ledger Description" ID="lblAccountNameAD2" CssClass="styleDisplayLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEntityTypeAD2" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input"
                                                                        MaxLength="50"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtEntityTypeAD2" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtEntityTypeAD2"
                                                                            ErrorMessage="Enter Entity Type in Account details - 2 tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Entity Type" ID="lblEntityTypeAD2" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>



                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtMICR" runat="server" MaxLength="10" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvMICR" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtMICR"
                                                                            ErrorMessage="Enter MICR in Account details - 2 tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="MICR Code" ID="lblMICR" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txteffectivefrom" class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="ceeffectivefrom" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                        PopupButtonID="imgDocumentDate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate"
                                                                        TargetControlID="txteffectivefrom">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:Image ID="imgDocumentDate" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvEffectiveFrom" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="txteffectivefrom"
                                                                            InitialValue=" " ErrorMessage="Enter Effective From Date" Enabled="false"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Effective From Date" ID="lblEffectivFrom" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtEffectiveto" class="md-form-control form-control login_form_content_input requires_true"
                                                                        runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="ceeffectiveto" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                        PopupButtonID="Image1"
                                                                        TargetControlID="txtEffectiveto" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                                    </cc1:CalendarExtender>
                                                                    <asp:Image ID="Image1" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfveffectiveTo" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Save" runat="server" ControlToValidate="txtEffectiveto"
                                                                            InitialValue=" " ErrorMessage="Enter Effective To Date" Enabled="false"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Effective To" ID="lblEffectiveto" CssClass="styleReqFieldLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>





                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtBankNameAD2" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtBankNameAD2" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtBankNameAD2"
                                                                            ErrorMessage="Enter Bank Name in Account details - 2 tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtBankNameAD2" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                        TargetControlID="txtBankNameAD2" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Bank Name" ID="lblBankNameAD2" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtBankBranchName1" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvBankBranchName" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtBankBranchName1"
                                                                            ErrorMessage="Enter Bank Branch Name in Account details - 2 tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                        TargetControlID="txtBankBranchName1" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Bank Branch Name" ID="lblBankbranch" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtBankAccountNumber" runat="server" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvBankAccountNumber" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtBankAccountNumber"
                                                                            ErrorMessage="Enter Bank Account Number in Account details - 2 tab"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <cc1:FilteredTextBoxExtender ID="FTBankAccountNumber" FilterType="Numbers"
                                                                        TargetControlID="txtBankAccountNumber" runat="server" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Bank Account Number" ID="lblBankAccountNumber" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <asp:CheckBox ID="chkBRS" runat="server" Text="BRS Applicability"></asp:CheckBox>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtIFSCCode" Visible="false" runat="server" MaxLength="11" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvIFSCCode" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" Enabled="false" ControlToValidate="txtIFSCCode"
                                                                            ErrorMessage="Enter IFSC Code in Account details - 2 tab"></asp:RequiredFieldValidator>
                                                                    </div>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Visible="false" Text="IFSC Code" ID="lblIFSCCode" CssClass="styleReqFieldLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>


                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:CheckBox ID="chkPreApproveInstrument" Visible="false" runat="server" Text="Pre-Approve Instrument"></asp:CheckBox>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Bank Information">
                                                                    <uc3:AddSetup ID="ucBanksetup" runat="server" />
                                                                </asp:Panel>
                                                            </div>



                                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Contact Information">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtContactpersonAD2" runat="server" MaxLength="25" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtContactpersonAD2" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                                            TargetControlID="txtContactpersonAD2" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Contact Person" ID="lblContactpersonAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>

                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtDesignationAD2" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtDesignationAD2" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                                            TargetControlID="txtDesignationAD2" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Designation" ID="lblDesignationAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>


                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtLandlineAD2" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtLandlineAD2" FilterType="Numbers" TargetControlID="txtLandlineAD2"
                                                                                            runat="server" Enabled="True">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Landline" ID="lblLandlineAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>

                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtMobileAD2" runat="server" MaxLength="14" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtMobileAD2" FilterType="Numbers" TargetControlID="txtMobileAD2"
                                                                                            runat="server" Enabled="True" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Mobile" ID="lblMobileAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>


                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtEmailIDAD2" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtEmailIDAD2" runat="server" TargetControlID="txtEmailIDAD2"
                                                                                            FilterType="Numbers, UppercaseLetters, LowercaseLetters,Custom" ValidChars="._-@"
                                                                                            Enabled="True">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RegularExpressionValidator ID="revtxtEmailIDAD2" runat="server" ControlToValidate="txtEmailIDAD2" CssClass="validation_msg_box_sapn"
                                                                                                ValidationGroup="Save" Display="Dynamic" ErrorMessage="Enter a valid Email Id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                                        </div>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Email ID" ID="lblEmailIDAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>

                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtWebAD2" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Web" ID="lblWebAD2" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>


                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtWebCode" runat="server" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtWebCode" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                                            TargetControlID="txtWebCode" runat="server" Enabled="True" ValidChars=",' `~!@#$%^*()_+-={}[]|\:;?/.&">
                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label>
                                                                                            <asp:Label runat="server" Text="Login ID" ID="lblWebCode" CssClass="styleDisplayLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>

                                                                                </div>




                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlAccountDetails" runat="server" GroupingText="Account Details"
                                                                    CssClass="stylePanel">
                                                                    <div class="gird">
                                                                        <asp:GridView ID="grvInstrumentDetails" runat="server" AutoGenerateColumns="False"
                                                                            EmptyDataText="No Instrument Details Found!..." ShowFooter="True"
                                                                            OnRowCommand="grvInstrumentDetails_OnRowCommand" OnRowDeleting="grvInstrumentDetails_OnRowDeleting"
                                                                            OnRowDataBound="grvInstrumentDetails_RowDataBound" class="gird_details" OnRowEditing="grvInstrumentDetails_RowEditing"
                                                                            OnRowUpdating="grvInstrumentDetails_RowUpdating" OnRowCancelingEdit="grvInstrumentDetails_RowCancelingEdit">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Instr ID" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInstrIDI" Visible="false" runat="server" Text='<%# Eval("InstrID")%>' />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Account Type">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAccountTypeIDI" Visible="false" runat="server" Text='<%# Eval("AccountTypeID")%>' />
                                                                                        <asp:Label ID="lblAccountTypeI" runat="server" Text='<%# Eval("AccountType")%>' />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">

                                                                                            <asp:DropDownList ID="ddlAccountTypeF" runat="server" CssClass="md-form-control form-control login_form_content_input" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlAccountTypeF"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="btnAddIns" ControlToValidate="ddlAccountTypeF" CssClass="validation_msg_box_sapn"
                                                                                                    ErrorMessage="Select Account Type" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                    <%--<FooterStyle Width="25%" />
                                                                                    <HeaderStyle Width="25%" />
                                                                                    <ItemStyle Width="25%" />--%>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cheque Book No">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblChequeBookNo" runat="server" Text='<%# Eval("Cheque_Book_No")%>' />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtChequeBookNo" runat="server" MaxLength="10" class="md-form-control form-control login_form_content_input" />
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtChequebookNoF" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                                TargetControlID="txtChequeBookNo" runat="server" Enabled="True" ValidChars="-/()">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvBookNo" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="btnAddIns" ControlToValidate="txtChequeBookNo"
                                                                                                    ErrorMessage="Enter Cheque Book Number"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Issue Date">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblIssueDate" runat="server" Text='<%# Eval("Issue_Date")%>' />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtIssuedate" class="md-form-control form-control login_form_content_input"
                                                                                                runat="server" onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                                                                            <cc1:CalendarExtender ID="ceeffectivefrom" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                                                PopupButtonID="imgissuedate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                                                TargetControlID="txtIssuedate">
                                                                                            </cc1:CalendarExtender>
                                                                                            <asp:Image ID="imgissuedate" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvIssueDate" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" ValidationGroup="btnAddIns" runat="server" ControlToValidate="txtIssuedate"
                                                                                                    InitialValue=" " ErrorMessage="Enter Issue Date" Enabled="True"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>

                                                                                <asp:TemplateField HeaderText="Cheque Book Status">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblchequeBookStatus" runat="server" Text='<%# Eval("Cheque_Book_Status")%>' />

                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ddlEditchequebookstatus" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                            </asp:DropDownList>

                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvchequebookEditstatus" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" ValidationGroup="btnEditIns" runat="server" ControlToValidate="ddlEditchequebookstatus"
                                                                                                    InitialValue="0" ErrorMessage="Select Cheque Book Status" Enabled="true"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:DropDownList ID="ddlchequebookstatus" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                            </asp:DropDownList>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvchequebookstatus" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" ValidationGroup="btnAddIns" runat="server" ControlToValidate="ddlchequebookstatus"
                                                                                                    InitialValue="0" ErrorMessage="Select Cheque Book Status" Enabled="true"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cheque Book Status ID" Visible="false">
                                                                                    <ItemTemplate>

                                                                                        <asp:Label ID="lblchequeBookStatusid" runat="server" Text='<%# Eval("Cheque_Book_Status_Id")%>' />
                                                                                    </ItemTemplate>


                                                                                </asp:TemplateField>


                                                                                <asp:TemplateField HeaderText="Account Number" Visible="false">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblAccountNumberI" runat="server" Text='<%# Eval("AccountNumber")%>' />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtAccountNumberF" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input" />
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtAccountNumberF" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                                TargetControlID="txtAccountNumberF" runat="server" Enabled="True" ValidChars="-/()">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="None" ID="RFVtxtAccountNumberF" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="btnAddIns" ControlToValidate="txtAccountNumberF"
                                                                                                    ErrorMessage="Enter Account Number"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cheque Start Number">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblChequeStartNumberI" runat="server" Text='<%# Eval("ChequeStartNumber")%>' />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtChequeStartNumberF" runat="server" MaxLength="10" class="md-form-control form-control login_form_content_input" onblur="FuncheckZero(this,'Cheque Start Number');" />
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtChequeStartNumberF" FilterType="Numbers" TargetControlID="txtChequeStartNumberF"
                                                                                                runat="server" Enabled="True">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtChequeStartNumberF" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="btnAddIns" ControlToValidate="txtChequeStartNumberF"
                                                                                                    ErrorMessage="Enter Cheque Start Number"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cheque End Number">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblChequeEndNumberI" runat="server" Text='<%# Eval("ChequeEndNumber")%>' />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtChequeEndNumberF" runat="server" MaxLength="10" class="md-form-control form-control login_form_content_input" />
                                                                                            <cc1:FilteredTextBoxExtender ID="FTEtxtChequeEndNumberF" FilterType="Numbers" TargetControlID="txtChequeEndNumberF"
                                                                                                runat="server" Enabled="True">
                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                            <div class="grid_validation_msg_box">
                                                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtChequeEndNumberF" CssClass="validation_msg_box_sapn"
                                                                                                    SetFocusOnError="True" runat="server" ValidationGroup="btnAddIns" ControlToValidate="txtChequeEndNumberF"
                                                                                                    ErrorMessage="Enter Cheque End Number"></asp:RequiredFieldValidator>
                                                                                            </div>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Cheque History">
                                                                                    <HeaderTemplate>
                                                                                        <asp:Label ID="lblviewcheques" runat="server" Text="Cheque History" />
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>

                                                                                        <asp:ImageButton ID="imgbtn1" src="../FA Images/Cheque_Book.PNG" runat="server" OnClick="Show" CausesValidation="false"
                                                                                            ToolTip="Show Cheque Details" />

                                                                                    </ItemTemplate>

                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Last Used No">
                                                                                    <ItemTemplate>
                                                                                        <%--<asp:Label ID="lblLastUsedNoI" runat="server" Text='<%# Eval("LastUsedNo")%>' />--%>
                                                                                        <asp:TextBox ID="lblLastUsedNoI" AutoPostBack="true" runat="server" Text='<%# Bind("LastUsedNo")%>' OnTextChanged="lblLastUsedNoI_OnTextChanged" />
                                                                                    </ItemTemplate>
                                                                                    <FooterTemplate>
                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                            <asp:TextBox ID="txtLastUsedNoF" runat="server" MaxLength="6" class="md-form-control form-control login_form_content_input" ReadOnly="true" />
                                                                                            <span class="highlight"></span>
                                                                                            <span class="bar"></span>
                                                                                        </div>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Edit">
                                                                                    <ItemTemplate>

                                                                                        <asp:Button ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" CssClass="grid_btn"
                                                                                            ToolTip="Edit"></asp:Button>
                                                                                        <asp:Button ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn" AccessKey="H" ToolTip="Alt+H"
                                                                                            OnClientClick="return confirm('Are you sure want to delete?');" CausesValidation="false"></asp:Button>
                                                                                    </ItemTemplate>
                                                                                    <EditItemTemplate>
                                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn" AccessKey="U"
                                                                                            ValidationGroup="btnEditIns" ToolTip="Update,Alt+U"></asp:LinkButton>&nbsp;|
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                                                            CausesValidation="false" ToolTip="Cancel,Alt+C" AccessKey="C"></asp:LinkButton>
                                                                                    </EditItemTemplate>
                                                                                    <FooterTemplate>

                                                                                        <asp:Button ID="btnAddIns" runat="server" CommandName="Add" Text="Add" ValidationGroup="btnAddIns" AccessKey="A" ToolTip="Alt+A"
                                                                                            CssClass="grid_btn"></asp:Button>
                                                                                    </FooterTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </div>
                                                                </asp:Panel>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                    <%--      <div align="right">



                        <asp:Button ID="btnSave" runat="server" Text="Save" class="css_btn_enabled"
                            OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators('Save')"
                            ValidationGroup="Save" AccessKey="S" ToolTip="Alt+S" />

                        <asp:Button ID="btnClear" runat="server" Text="Clear" class="css_btn_enabled"
                            CausesValidation="False" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" AccessKey="L" ToolTip="Alt+L" />
                        <asp:Button ID="btnCancel" runat="server" Text="Exit" class="css_btn_enabled"
                            OnClick="btnCancel_Click" AccessKey="X" ToolTip="Alt+X" OnClientClick="return fnConfirmExit();" />
                    </div>--%>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
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
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="CVAccountCard" runat="server" Display="None" ValidationGroup="Save"></asp:CustomValidator>
                            <input type="hidden" id="hdnSortDirection" runat="server" />
                            <input type="hidden" id="hdnSortExpression" runat="server" />
                            <input type="hidden" id="hdnSearch" runat="server" />
                            <input type="hidden" id="hdnOrderBy" runat="server" />
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <asp:ValidationSummary runat="server" ID="VSAccountCard" HeaderText="Correct the following validation(s):"
                                CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="Save" ShowSummary="true" />
                            <asp:ValidationSummary runat="server" ID="VSAccountBankDtls" HeaderText="Correct the following validation(s):"
                                CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAdd"
                                ShowSummary="true" />
                            <asp:ValidationSummary runat="server" ID="VSAccountInstrumentDtls" HeaderText="Correct the following validation(s):"
                                CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAddIns"
                                ShowSummary="true" />
                        </div>
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>


            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Label ID="lblCoproView" runat="server" Style="display: none;"></asp:Label>
                    <cc1:ModalPopupExtender ID="mpecheque" runat="server" TargetControlID="lblCoproView"
                        PopupControlID="pnlDimension1" BackgroundCssClass="styleModalBackground" DropShadow="false" />

                    <div runat="server" id="dvProView" style="width: 75%;">
                        <asp:Panel ID="pnlDimension1" runat="server" Width="40%" CssClass="stylePanel"
                            GroupingText="Cheque Book Details" Style="overflow: hidden;" BackColor="White"
                            BorderColor="WhiteSmoke">
                            <asp:UpdatePanel ID="updPnlOTHBreakup" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div id="divchequeleaf" runat="server" style="overflow: auto; height: 300px;">

                                                <div class="gird">
                                                    <asp:GridView ID="grvLeaf" runat="server" AllowPaging="false" HeaderStyle-CssClass="styleGridHeader"
                                                        AutoGenerateColumns="false" Width="100%" OnRowDataBound="grvLeaf_RowDataBound" CssClass="gird_details">
                                                        <RowStyle HorizontalAlign="Center" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Leaf Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvLeafID" runat="server" Text='<%# Bind("Leaf_Id") %>'
                                                                        ToolTip="Leaf Number" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblgvChequedet_id" runat="server" Text='<%# Bind("CHEQUE_DET_ID") %>'
                                                                        ToolTip="Leaf Number" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblgvLeafNumber" runat="server" Text='<%# Bind("Cheque_Leaf_No") %>'
                                                                        ToolTip="Leaf Number"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Payment Number">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvReceiptNo" runat="server" Text='<%# Bind("Payment_No") %>'
                                                                        ToolTip="Receipt Number"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="From Status">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvStatus" runat="server" Text='<%# Bind("Status") %>' ToolTip="Status"></asp:Label>
                                                                    <asp:Label ID="lblgvStatusid" runat="server" Text='<%# Bind("Status_id") %>' Visible="false" ToolTip="Status"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cancelled Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvCancelDate" runat="server" Text='<%# Bind("Cancel_Date") %>' ToolTip="Canceled Date"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="To_Status" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblgvToStatusid" runat="server" Text='<%# Bind("To_Status_ID") %>' Visible="false" ToolTip="Status"></asp:Label>
                                                                    <asp:Label ID="lblgvtostatus" runat="server" Text='<%# Bind("To_Status") %>' Visible="false"></asp:Label>
                                                                    <%--  <asp:UpdatePanel ID="updddlgvtostatus" runat="server">
                                                                    <ContentTemplate>--%>
                                                                    <asp:DropDownList ID="ddlgvtostatus" CausesValidation="false"
                                                                        runat="server" ToolTip="To Status">
                                                                    </asp:DropDownList>
                                                                    <%-- </ContentTemplate>
                                                                    <Triggers>
                                                                      
                                                                        <asp:AsyncPostBackTrigger ControlID="ddlgvtostatus" />
                                                                    </Triggers>
                                                                </asp:UpdatePanel>--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="row" style="float: right; margin-top: 5px;">
                                                            <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CausesValidation="false"
                                                                    CssClass="grid_btn" OnClick="btnUpdate_Click" AccessKey="U" />

                                                            </div>

                                                            <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">

                                                                <asp:Button ID="btnDimClose" runat="server" Text="Close" CausesValidation="false" EnableViewState="false"
                                                                    CssClass="grid_btn" OnClick="btnDimClose_Click" AccessKey="L" />
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <%--<uc1:PageNavigator ID="PageNavigator1" runat="server" />--%>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>



                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label runat="server" ID="lblErrorMessage">
                            </asp:Label>
                            <asp:HiddenField ID="hdnLocString" runat="server" />
                            <asp:HiddenField ID="hdnlocvalue" runat="server" Value="0" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript" language="javascript">
        var btnActive_index = 0;
        var index = 0;
        function pageLoad() {


            tab = $find('ctl00_ContentPlaceHolder1_TCAccountCard');

            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            PageLoadTabContSetFocus();
        }


        function PageLoadTabContSetFocus() {
            var TC = $find("<%=TCAccountCard.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlAccountNature.ClientID %>").focus();
            }
        }
        //code added to set tab focus
        function on_Change(sender, e) {

            fnMoveNextTab('Tab');
        }

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_TCAccountCard');


            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            <%--var Valgrp = document.getElementById('<%=vsPricing.ClientID %>')--%>
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            //btnSave.disabled=true;
            //    Valgrp.validationGroup = strValgrp;

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;
                if (tab._tabs[btnActive_index + 1].disabled = 'true') {

                    newindex = btnActive_index + 2;
                }

            }
            else if (Source_Invoker == 'btnPrevTab') {

                newindex = btnActive_index - 1;
            }
            else {

                newindex = tab.get_activeTabIndex(index);

                btnActive_index = newindex;
            }

            //if (newindex == tab._tabs.length - 1)
            //    btnSave.disabled = false;
            //else
            //    btnSave.disabled = true;
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {


                    switch (index) {

                        case 0:
                            
                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            //if (tab._tabs[index].disabled = 'true')
                            //{
                            //    tab.set_activeTabIndex(btnActive_index + 1);
                            //    index = tab.get_activeTabIndex(index);
                            //}
                            btnActive_index = index;
                            break;
                        case 1:
                            
                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 2:
                           
                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 3:
                            
                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 4:
                         
                            tab.set_activeTabIndex(newindex);

                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {

                tab.set_activeTabIndex(newindex);
                index = tab.get_activeTabIndex(newindex);

            }
        }
        function onloadByObject(strLocString) {
            if (strLocString != null) {
                var strlen = strLocString.split(',').length;
                for (var i = 1; i <= strlen; i++) {
                    if (strLocString.split(',')[i - 1].length > 0) {
                        var x = document.getElementById('ctl00_ContentPlaceHolder1_TCAccountCard_TPMainPage_treeviewn' + strLocString.split(',')[i - 1] + 'CheckBox');
                        x.disabled = true;
                    }
                }
            }

        }

        function onloadByObjectD(strLocString) {

            if (strLocString != null) {
                var strlen = strLocString.split(',').length;
                for (var i = 1; i <= strlen; i++) {
                    if (strLocString.split(',')[i - 1].length > 0) {
                        var x = document.getElementById('ctl00_ContentPlaceHolder1_TCAccountCard_TPMainPage_treeviewn' + strLocString.split(',')[i - 1] + 'CheckBox');
                        x.disabled = true;
                    }
                }
            }

        }

        function FuncheckZero(input, FieldName) {
            if (input != null) {
                if (input.value != '') {
                    if (parseFloat(input.value) == 0) {
                        alert(FieldName + ' should be greater than zero');
                        input.value = '';
                        input.focus();
                    }
                }
            }

        }

        function postBackByObject() {
            var obj = window.event.srcElement;
            var treeNodeFound = false;
            var checkedState;

            if (obj.tagName == "INPUT" && obj.type == "checkbox") {
                var treeNode = obj;
                checkedState = treeNode.checked;
                do {
                    obj = obj.parentElement;
                } while (obj.tagName != "TABLE")
                var parentTreeLevel = obj.rows[0].cells.length;
                var parentTreeNode = obj.rows[0].cells[0];
                var tables = obj.parentElement.getElementsByTagName("TABLE");
                var numTables = tables.length
                if (numTables >= 1) {
                    for (i = 0; i < numTables; i++) {
                        if (tables[i] == obj) {
                            treeNodeFound = true;
                            i++;
                            if (i == numTables) {
                                return;
                            }
                        }
                        if (treeNodeFound == true) {
                            var childTreeLevel = tables[i].rows[0].cells.length;
                            if (childTreeLevel > parentTreeLevel) {
                                var cell = tables[i].rows[0].cells[childTreeLevel - 1];
                                var inputs = cell.getElementsByTagName("INPUT");
                                if (!inputs[0].disabled) {
                                    inputs[0].checked = checkedState;
                                }
                            }
                            else {
                                return;
                            }
                        }
                    }
                }
            }
        }




        function funsetAcctDesc(input) {
            var txtAccountDescriptionE = document.getElementById('<%=txtAccountDescriptionE.ClientID %>');
            var txtAccountDescriptionAD1 = document.getElementById('<%=txtAccountDescriptionAD1.ClientID %>');
            var txtAccountDescriptionAD2 = document.getElementById('<%=txtAccountDescriptionAD2.ClientID %>');
            if (input != null) {
                FunTrimwhitespace(input, 'Account Description');
                if (input.value != '') {
                    if (input.value.trim() != '') {
                        if (input.value.trim().split('    ').length > 1) {
                            alert('Enter valid ' + FieldName);

                            input.value = '';
                            input.focus();
                            return;
                        }
                        else {
                            input.value = input.value.trim();
                        }
                    }
                    else {
                        input.value = input.value.trim();
                    }
                    txtAccountDescriptionE.value = txtAccountDescriptionAD1.value = txtAccountDescriptionAD2.value = input.value.trim();
                }
                else {
                    input.focus();
                    return;
                }
            }
        }

        function funsetGLAcctCode(input) {
            var txtAccountNumberE = document.getElementById('<%=txtAccountNumberE.ClientID %>');
            var txtAccountNumberAD1 = document.getElementById('<%=txtAccountNumberAD1.ClientID %>');
            var txtAccountNumberAD2 = document.getElementById('<%=txtAccountNumberAD2.ClientID %>');
            if (input != null) {
                txtAccountNumberE.value = txtAccountNumberAD1.value = txtAccountNumberAD2.value = input.value;
            }
        }

        function funsetSLAcctCode(input) {
            var txtSubAccountAD2 = document.getElementById('<%=txtSubAccountAD2.ClientID %>');

            if (input != null) {
                txtSubAccountAD2.value = input.value;
            }
        }

        function funsetSLAcctDesc(input) {
            var txtAccountNameAD2 = document.getElementById('<%=txtAccountNameAD2.ClientID %>');

            if (input != null) {
                txtAccountNameAD2.value = input.value;
            }
        }

    </script>


</asp:Content>
