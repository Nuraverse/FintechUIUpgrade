<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Common/S3GMasterPageCollapse.master"
    CodeFile="S3GTemplate_Add.aspx.cs" Inherits="System_Admin_S3GTemplate_Add" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <div class="row">
                            <div class="col">
                                <h6 class="title_name">
                                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Template">
                                    </asp:Label>
                                </h6>
                            </div>
                        </div>
                        <%--<div class="row">
                            <div style="display: none" class="col">
                                <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                            </div>
                        </div>--%>
                        <div class="row">
                            <div class="col">
                                <cc1:TabContainer ID="TCTemplate" runat="server" CssClass="styleTabPanel" Width="100%"
                                    ScrollBars="None">
                                    <cc1:TabPanel runat="server" ID="TPTemplateDtls" CssClass="tabpan" BackColor="Red">
                                        <HeaderTemplate>
                                            Template Details
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <asp:Panel runat="server" ID="pnlTemplateHeader" CssClass="stylePanel" GroupingText="Template Details"
                                                                        Width="99%">
                                                                        <div>
                                                                            <div class="row">
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business"
                                                                                            CssClass="md-form-control form-control">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="RFVddlLOB" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                                                ControlToValidate="ddlLOB" InitialValue="0" Display="Dynamic" ErrorMessage="Select Line of Business"
                                                                                                ValidationGroup="btnSave" Enabled="False"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <label class="tess">
                                                                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtTemplateRefNo" runat="server" ReadOnly="True" ToolTip="Template Reference Number"
                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label class="tess">
                                                                                            <asp:Label ID="lblTemplateRefNo" runat="server" Text="Template Ref No"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <uc2:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" ErrorMessage="Select a Branch"
                                                                                            ValidationGroup="btnSave" IsMandatory="false" ToolTip="Branch" />
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <label class="tess">
                                                                                            <asp:Label ID="lblLocation" runat="server" Text="Branch"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlTemplateType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTemplateType_SelectedIndexChanged" ToolTip="Template Name"
                                                                                            CssClass="md-form-control form-control">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="RFVddlTemplateType" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                                                ControlToValidate="ddlTemplateType" InitialValue="0" Display="Dynamic" ErrorMessage="Select Template Name"
                                                                                                ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" Text="Template Name" ID="lblTemplateType" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlModeofMail" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlModeofMail_SelectedIndexChanged" ToolTip="Template Type"
                                                                                            CssClass="md-form-control form-control">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="RFVddlModeofMail" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                                                ControlToValidate="ddlModeofMail" InitialValue="0" Display="Dynamic" ErrorMessage="Select Template Type"
                                                                                                ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" Text="Template Type" ID="lblModeofMail" CssClass="styleReqFieldLabel"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtDocumentPath" runat="server" ReadOnly="True" ToolTip="Document Path"
                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="RFVtxtDocumentPath" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                                                ControlToValidate="txtDocumentPath" Display="Dynamic" ErrorMessage="Enter Document Path"
                                                                                                ValidationGroup="btnSave" Enabled="False"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" Text="Document Path" ID="lblDocumentPath"></asp:Label>
                                                                                        </label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtDescription" runat="server" ToolTip="Template Description"
                                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                                                ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="Enter Template Description"
                                                                                                ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" Text="Template Description" ID="lblTemplateDesc" CssClass="styleReqFieldLabel"></asp:Label></label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlLanguage" runat="server" ToolTip="To Language"
                                                                                            CssClass="md-form-control form-control">
                                                                                            <%--<asp:ListItem Value="en">English</asp:ListItem>
                                                                                            <asp:ListItem Value="ar">&#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577;</asp:ListItem>
                                                                                            <asp:ListItem Value="ta">&#2980;&#2990;&#3007;&#2996;&#3021;</asp:ListItem>
                                                                                            <asp:ListItem Value="te">&#3108;&#3142;&#3122;&#3137;&#3095;&#3137;</asp:ListItem>--%>
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="RFVddlLanguage" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                                                ControlToValidate="ddlLanguage" InitialValue="0" Display="Dynamic" ErrorMessage="Select To Language"
                                                                                                ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                        <label class="tess">
                                                                                            <asp:Label runat="server" Text="To Language" ID="lblLanguage" CssClass="styleReqFieldLabel"></asp:Label></label>
                                                                                    </div>
                                                                                    <asp:LinkButton ID="lnkViewTemplate" OnClick="lnkViewTemplate_Click" runat="server"
                                                                                        Text="View" CssClass="grid_btn" Visible="false"></asp:LinkButton>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                                    <div class="md-input">
                                                                                        <asp:CheckBox ID="chkIsActive" runat="server" Enabled="False" />
                                                                                        <asp:Label runat="server" Text="Active" ID="lblActvie"></asp:Label>
                                                                                        <asp:HiddenField runat="server" ID="hdnWrap" Value="1" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </asp:Panel>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <FTB:FreeTextBox ID="FTBTemplate" EnableHtmlMode="False" runat="server" Width="99%"
                                                            SupportFolder="~/aspnet_client/FreeTextBox/" JavaScriptLocation="ExternalFile"
                                                            ImageGalleryPath="~/aspnet_client/FreeTextBox/images" ToolbarImagesLocation="ExternalFile"
                                                            ButtonImagesLocation="ExternalFile" ToolbarLayout="ParagraphMenu,FontFacesMenu,
                                            FontSizesMenu,FontForeColorsMenu,Cut,Copy,Paste,Undo,Redo,Print;Bold,Italic,
                                            Underline,fontforecolorpicker,fontbackcolorpicker,Strikethrough;Superscript,
                                            Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;
                                            BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,insertdate,inserttime,WordClean,preview,InsertRule,InsertTable,InsertImage"
                                                            AllowHtmlMode="True" AssemblyResourceHandlerPath="" AutoConfigure="" AutoGenerateToolbarsFromString="True" AutoHideToolbar="True" AutoParseStyles="True" BackColor="158, 190, 245" BaseUrl="" BreakMode="Paragraph" ButtonDownImage="False" ButtonFileExtention="gif" ButtonFolder="Images" ButtonHeight="20" ButtonOverImage="False" ButtonPath="" ButtonSet="Office2003" ButtonWidth="21" ClientSideTextChanged="" ConvertHtmlSymbolsToHtmlCodes="False" DesignModeBodyTagCssClass="" DesignModeCss="" DisableIEBackButton="False" DownLevelCols="50" DownLevelMessage="" DownLevelMode="TextArea" DownLevelRows="10" EditorBorderColorDark="Gray" EditorBorderColorLight="Gray" EnableSsl="False" EnableToolbars="True" Focus="False" FormatHtmlTagsToXhtml="True" GutterBackColor="129, 169, 226" GutterBorderColorDark="Gray" GutterBorderColorLight="White" Height="350px" HelperFilesParameters="" HelperFilesPath="" HtmlModeCss="" HtmlModeDefaultsToMonoSpaceFont="True" ImageGalleryUrl="ftb.imagegallery.aspx?rif={0}&amp;cif={0}" InstallationErrorMessage="InlineMessage" Language="en-US" PasteMode="Default" ReadOnly="False" RemoveScriptNameFromBookmarks="True" RemoveServerNameFromUrls="True" RenderMode="NotSet" ScriptMode="External" ShowTagPath="False" SslUrl="/." StartMode="DesignMode" StripAllScripting="False" TabIndex="-1" TabMode="InsertSpaces" Text="" TextDirection="LeftToRight" ToolbarBackColor="Transparent" ToolbarBackgroundImage="True" ToolbarStyleConfiguration="Office2003" UpdateToolbar="True" UseToolbarBackGroundImage="True" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RFVFTBTemplate" runat="server" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                                ControlToValidate="FTBTemplate" Display="Dynamic" ErrorMessage="Enter Letter Format"
                                                                ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="display: none;">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <asp:FileUpload ID="FUpload" runat="server" ToolTip="Upload Image" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel runat="server" ID="TPExclusion" CssClass="tabpan" BackColor="Red">
                                        <HeaderTemplate>
                                            <%--Exclusion--%>
                                            <asp:Label ID="lblExclusion" runat="server" Text="Exclusion"></asp:Label>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <asp:Button ID="btnLoadCustomer" runat="server" Style="display: none" Text="Load Customer"
                                                                    OnClick="btnLoadCustomer_OnClick" />
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="row">
                                                                <asp:GridView ID="GrvExclusion" runat="server" FooterStyle-HorizontalAlign="Center"
                                                                    OnRowDeleting="GrvExclusion_RowDeleting" ShowFooter="true" OnRowCommand="GrvExclusion_RowCommand"
                                                                    AutoGenerateColumns="false" class="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="CategoryId" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCategoryId" ToolTip="Id" runat="server" Text='<%#Eval("CategoryId")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Category">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCategory" ToolTip="Category" runat="server" Text='<%#Eval("Category")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <%--OnSelectedIndexChanged="ddlFooterCategory_SelectedIndexChanged"--%>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:HiddenField ID="hFooCategVal" runat="server" />
                                                                                    <asp:DropDownList ID="ddlFooterCategory" ToolTip="Category" onchange="fnLoadCustomerg()"
                                                                                        runat="server">
                                                                                    </asp:DropDownList>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterCategory" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" ValidationGroup="lnkAdd" runat="server" ControlToValidate="ddlFooterCategory"
                                                                                            InitialValue="0" ErrorMessage="Select Category"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblId" ToolTip="Id" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblFooterId" ToolTip="Id" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Code">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCode" ToolTip="Code" runat="server" Text='<%#Eval("Code")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtCode" runat="server" Visible="false"></asp:TextBox>
                                                                                <uc2:LOV ID="ucCustomerLov" runat="server" onblur="fnLoadCustomerg()" ButtonEnabled="false" />
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtCode" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True" ValidationGroup="lnkAdd" runat="server" ControlToValidate="txtCode"
                                                                                        InitialValue="0" ErrorMessage="Select Code"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDescription" ToolTip="Description" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:TextBox ID="txtDescription" runat="server" ReadOnly="true"></asp:TextBox>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtDescription" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True" ValidationGroup="lnkAdd" runat="server" ControlToValidate="txtDescription"
                                                                                        InitialValue="0" ErrorMessage="Select Description"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="10%" FooterStyle-Width="10%"
                                                                            ItemStyle-Width="10%">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="lnkRemove" runat="server" ToolTip="Remove from the grid"
                                                                                    CommandName="Delete" Text="Remove" CssClass="grid_btn_delete"></asp:Button>
                                                                                <%--  <asp:ImageButton ImageUrl="~/Images/btn_delete.gif" runat="server"  CausesValidation="false"
                                                                    CommandName="Delete" />--%>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="lnkAdd" ValidationGroup="lnkAdd" AccessKey="T" ToolTip="Add,Alt+T" runat="server"
                                                                                    Text="Add" CommandName="Add" CssClass="grid_btn"></asp:Button>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </cc1:TabContainer>
                            </div>
                        </div>
                        <div class="btn_height"></div>
                        <div align="right" class="fixed_btn">
                            <button id="btnSave" runat="server" class="css_btn_enabled" title="Save[Alt+S]" accesskey="S" causesvalidation="false"
                                validationgroup="btnSave" onserverclick="btnSave_Click" onclick="if(fnCheckPageValidators('btnSave'))" type="button">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave        
                            </button>
                            <button runat="server" id="btnClear" causesvalidation="false" class="css_btn_enabled" title="Clear[Alt+L]" accesskey="L"
                                onclick="if(confirm('Do you want to Clear?'))" onserverclick="btnClear_Click" type="button">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                            </button>
                            <button runat="server" id="btnCancel" causesvalidation="false" title="Exit[Alt+X]" accesskey="X"
                                class="css_btn_enabled" onserverclick="btnCancel_Click" onclick="if(fnConfirmExit())" type="button">
                                <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                            </button>
                            <%--&nbsp;<asp:Button runat="server" ID="btnGenerate" Text="Generate Letter" CausesValidation="false"
                    CssClass="styleSubmitButton" OnClick="btnGenerate_Click" />--%>
                        </div>
                        <div class="row" style="display: none">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <asp:CustomValidator ID="CVTemplate" runat="server" Display="None" ValidationGroup="btnSave"></asp:CustomValidator>
                            </div>
                        </div>
                        <div class="row" style="display: none">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <asp:ValidationSummary runat="server" ID="VSDelinquentParameter" HeaderText="Correct the following validation(s):"
                                    CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnSave"
                                    ShowSummary="true" />
                            </div>
                        </div>
                        <div class="row" style="display: none">
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                <asp:ValidationSummary runat="server" ID="vsadd" HeaderText="Correct the following validation(s):"
                                    CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="lnkAdd"
                                    ShowSummary="true" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        function pageLoad() {
            FTBTextDesignWrap();
            //tab = $find('ctl00_ContentPlaceHolder1_TCTemplate');

            //tab.add_activeTabChanged(on_Change);
            //var newindex = tab.get_activeTabIndex(index);
            //btnActive_index = newindex;
            PageLoadTabContSetFocus();
        }

        //function on_Change(sender, e) {
        //    fnMoveNextTab('Tab');
        //}

        //function fnMoveNextTab(Source_Invoker) {

        //    tab = $find('ctl00_ContentPlaceHolder1_TCTemplate');

        //    var strValgrp = tab._tabs[index]._tab.outerText.trim();

        //    var newindex = tab.get_activeTabIndex(index);
        //    if (Source_Invoker == 'btnNextTab') {
        //        newindex = btnActive_index + 1;

        //    }
        //    else if (Source_Invoker == 'btnPrevTab') {
        //        newindex = btnActive_index - 1;
        //    }
        //    else {
        //        newindex = tab.get_activeTabIndex(index);
        //        btnActive_index = newindex;
        //    }

        //    if (newindex > index) {
        //        if (!fnCheckPageValidators(strValgrp, false)) {
        //            tab.set_activeTabIndex(index);
        //        }
        //        else {
        //            switch (index) {
        //                case 0:
        //                    tab.set_activeTabIndex(newindex);
        //                    index = tab.get_activeTabIndex(index);
        //                    btnActive_index = index;
        //                    break;
        //                case 1:
        //                    tab.set_activeTabIndex(newindex);
        //                    index = tab.get_activeTabIndex(index);
        //                    btnActive_index = index;
        //                    break;
        //                case 2:
        //                    tab.set_activeTabIndex(newindex);
        //                    index = tab.get_activeTabIndex(index);
        //                    btnActive_index = index;
        //                    break;
        //            }
        //        }
        //    }
        //    else {
        //        tab.set_activeTabIndex(newindex);
        //        index = tab.get_activeTabIndex(newindex);

        //    }
        //}

        function PageLoadTabContSetFocus() {
            var TC = $find("<%=TCTemplate.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
                    }
                }

                function FTBDesignWrap() {

                    FTBTextDesignWrap();
                    var hdnval = document.getElementById("ctl00_ContentPlaceHolder1_TCTemplate_TPTemplateDtls_hdnWrap");
                    if (hdnval.value == 0)
                        hdnval.value = 1;
                    else
                        hdnval.value = 0;

                }

                function FTBTextDesignWrap() {
                    var hdnval = document.getElementById("ctl00_ContentPlaceHolder1_TCTemplate_TPTemplateDtls_hdnWrap");
                    var SetWrapText = hdnval.value;
                    var freetextboxDesignFrame = document.getElementById("ctl00_ContentPlaceHolder1_TCTemplate_TPTemplateDtls_FTBTemplate_designEditor");
                    var iframe = freetextboxDesignFrame.contentDocument;
                    if (iframe == undefined)
                        iframe = freetextboxDesignFrame.contentWindow.document;
                    iframe.body.style.wordWrap = SetWrapText == 1 ? "break-word" : "normal";


                }


                function fnLoadCustomerg() {
                    document.getElementById('ctl00_ContentPlaceHolder1_TCTemplate_TPExclusion_btnLoadCustomer').click();
                }

    </script>

</asp:Content>
