<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAAssetMaster, App_Web_skbf4x1n" title="Asset Master" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                   
                    <div>
                         <div class="row title_header">
                                <h6 class="title_name">
                                    <asp:Label runat="server" ID="lblHeading" Text="Asset Master" >
                                    </asp:Label>
                                </h6>
                            
                        </div>
                        <div>
                            
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlAssetInformation" runat="server" CssClass="stylePanel"
                                        GroupingText="Asset Group Information">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                <div class="lmd-input md-input">
                                                    <asp:TextBox ID="txtAssetGroupcode" runat="server" MaxLength="4" AutoPostBack="true"
                                                        OnTextChanged="txtAssetGroupcode_TextChanged" class="md-form-control lmd-form-control form-control requires_false" />
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtAssetGroupcode" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                        TargetControlID="txtAssetGroupcode" runat="server" Enabled="True" ValidChars=" ">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAssetGroupcode" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAssetGroupcode"
                                                            ErrorMessage="Enter Asset Group code"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <cc1:AutoCompleteExtender runat="server" ID="ACEtxtAssetGroupcode" TargetControlID="txtAssetGroupcode"
                                                        ServiceMethod="GetAssetGroupcodeList" ServicePath="" MinimumPrefixLength="0" CompletionListCssClass="CompletionList"
                                        CompletionListItemCssClass="CompletionListItemCssClass"
                                        CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                                        EnableCaching="true" Enabled="True" CompletionSetCount="20" CompletionInterval="200">
                                                    </cc1:AutoCompleteExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAssetGroupcode" runat="server" Text="Asset Group code" CssClass="styleReqFieldLabel" />
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAssetGroupdesc" runat="server" MaxLength="40" class="md-form-control form-control login_form_content_input requires_true" />
                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtAssetGroupdesc" runat="server" Enabled="True" ValidChars=" ">
                                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAssetGroupdesc" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAssetGroupdesc"
                                                            ErrorMessage="Enter Asset Group description"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAssetGroupdesc" runat="server" CssClass="styleReqFieldLabel" Text="Asset Group description" />
                                                    </label>
                                                </div>
                                            </div>

                                           
                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <div class="md-input">
                                                     <UC:Suggest ID="ddlGLCode" runat="server" class="md-form-control form-control" IsMandatory="true" AutoPostBack="true" 
                                                         ServiceMethod="GetGlCodeList" OnItem_Selected="ddlGLCode_Item_Selected" ErrorMessage="Select Account" ValidationGroup="Save" />
                                                   
                                                 

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblGLCode" CssClass="styleReqFieldLabel" Text="Account"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                              <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <asp:CheckBox ID="chkDepreciation" runat="server" Text="Depreciation" AutoPostBack="true" OnCheckedChanged="chkDepreciation_CheckedChanged" />
                                            </div>
                                             <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAssetPrintsequence" runat="server" MaxLength="3" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" />
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" FilterType="Custom, Numbers"
                                                                        TargetControlID="txtAssetPrintsequence" runat="server" Enabled="True" ValidChars="">
                                                                    </cc1:FilteredTextBoxExtender>


                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAssetPrintsequence" runat="server" Text="Asset Print sequence" />
                                                    </label>
                                                </div>
                                            </div>

                                           
                                            </div>
                                        </asp:Panel>
                                          <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel"
                                        GroupingText="Asset Code Information">
                                              
                                        <div class="row">
                                             <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAssetcode" runat="server" MaxLength="6" class="md-form-control form-control login_form_content_input requires_true" />
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                        TargetControlID="txtAssetcode" runat="server" Enabled="True" ValidChars=" ">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAssetcode" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAssetcode"
                                                            ErrorMessage="Enter Asset code"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAssetcode" runat="server" CssClass="styleReqFieldLabel" Text="Asset code" />
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtAssetcodedesc" runat="server" MaxLength="40" class="md-form-control form-control login_form_content_input requires_true" />
                                                     <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                        TargetControlID="txtAssetcodedesc" runat="server" Enabled="True" ValidChars=" ">
                                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtAssetcodedesc" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtAssetcodedesc"
                                                            ErrorMessage="Enter Asset code description"></asp:RequiredFieldValidator>
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblAssetcodedesc" runat="server" CssClass="styleReqFieldLabel" Text="Asset code description" />
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <div class="md-input">
                                                     <UC:Suggest ID="ddlSLCode" runat="server" class="md-form-control form-control"  IsMandatory="false" ServiceMethod="GetSLCodeList" AutoPostBack="true"
                                                          ErrorMessage="Select Sub Account" ValidationGroup="Save" />
                                                     <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblSLCode" Text="Sub Account"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <div class="md-input">
                                                    <asp:DropDownList ID="cmbUOM" runat="server" class="md-form-control form-control" ></asp:DropDownList>
                                                    
                                                  
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cmbUOM"
                                                            InitialValue="0" ErrorMessage="Select UOM" Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                            ValidationGroup="Save" />
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblUOM" CssClass="styleReqFieldLabel" Text="UOM"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <div class="md-input">
                                                    <asp:DropDownList ID="cmbAssetcategory" runat="server" class="md-form-control form-control" ></asp:DropDownList>
                                                    
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvassetcategory" runat="server" ControlToValidate="cmbAssetcategory"
                                                            InitialValue="0" ErrorMessage="Select Asset Type" Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn"
                                                            ValidationGroup="Save" />
                                                    </div>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label runat="server" ID="lblAssetcategory" CssClass="styleReqFieldLabel" Text="Asset Type"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>


                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <asp:CheckBox ID="chkValidAsset" runat="server" Text="Valid Asset" />
                                            </div>
                                          

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBookdepreciation" Visible="false" runat="server" MaxLength="10" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" />


                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblBookdepreciation" Visible="false" runat="server" Text="Book depreciation %" />
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 ">

                                                <div class="md-input">
                                                    <asp:TextBox ID="txtBlockdepreciation" Visible="false" runat="server" MaxLength="10" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true" />


                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblBlockdepreciation" Visible="false" runat="server" Text="Block depreciation %" />
                                                    </label>
                                                </div>
                                            </div>

                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlbook" runat="server" GroupingText="WDV Details" CssClass="stylePanel">
                                                <div class="gird">
                                                    <asp:GridView ID="grvBookDepreciation" runat="server" AutoGenerateColumns="False" Width="100%" ShowFooter="true" OnRowDataBound="grvBookDepreciation_RowDataBound"
                                                        OnRowCommand="grvBookDepreciation_RowCommand" OnRowDeleting="grvBookDepreciation_RowDeleting">
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAutoID" runat="server" Text='<%# Bind("Dep_ID") %>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Effective From">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbleffectivefrom" runat="server" Text='<%# Bind("Effective_From_Date") %>'></asp:Label>
                                                                     
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtEffectivefrom" runat="server"
                                                                             class="md-form-control form-control login_form_content_input requires_true" ></asp:TextBox>
                                                                        
                                                                        <cc1:CalendarExtender ID="CEEffectivefromDate" runat="server" 
                                                                            TargetControlID="txtEffectivefrom">
                                                                        </cc1:CalendarExtender>
                                                                         <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEffectivefrom" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="AssetcodeAdd" runat="server" ControlToValidate="txtEffectivefrom"
                                                                            InitialValue=" " ErrorMessage="Enter Effective From Date" Enabled="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                          <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    </div>

                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Effective To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbleffectiveTO" runat="server" Text='<%# Bind("Effective_TO_DATE") %>'></asp:Label>
                                                                     <asp:Label ID="lblEffectiveToDate" Visible="false" runat="server" Text='<%# Bind("Effective_TO_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtEffectiveTo" runat="server"  class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Image ID="imgEffectiveTo" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                        <cc1:CalendarExtender ID="CEEffectiveToDate" runat="server" PopupButtonID="imgEffectiveTo"
                                                                            TargetControlID="txtEffectiveTo">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEffectiveTo" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="AssetcodeAdd" runat="server" ControlToValidate="txtEffectiveTo"
                                                                            InitialValue=" " ErrorMessage="Enter Effective To Date" Enabled="true" ></asp:RequiredFieldValidator>
                                                                    </div>
                                                                          <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    </div>

                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblbookDepreciationperDesc" runat="server" Text='<%# Bind("Book_Depreciatio_Per") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtBookDepreciationPer" runat="server" MaxLength="10" 
                                                                            class="md-form-control form-control login_form_content_input requires_true" ValidationGroup="AssetcodeAdd"></asp:TextBox>

                                                                         <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvDeprePer" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="AssetcodeAdd" runat="server" ControlToValidate="txtBookDepreciationPer"
                                                                            InitialValue=" " ErrorMessage="Enter WDV Depreciation Rate" Enabled="true" ></asp:RequiredFieldValidator>
                                                                    </div>

                                                                         <div class="validation_msg_box">
                                                                        <asp:RangeValidator ID="rngeWDV" runat="server" Display="Dynamic" ValidationGroup="AssetcodeAdd" Enabled="true"
                                                                            ControlToValidate="txtBookDepreciationPer" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 100" Type="Double" MinimumValue="0.001" MaximumValue="100"></asp:RangeValidator>
                                                                    </div>
                                                                          <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    </div>


                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField FooterStyle-Width="10%" HeaderText="Action" ItemStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="lnkRemove" runat="server" CausesValidation="false" CommandName="Delete" CssClass="grid_btn_delete" Text="Remove" ToolTip="Remove from the grid,Alt+R" AccessKey="R" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Button ID="lnkAdd" runat="server" CommandName="Add" CssClass="grid_btn" Text="Add" ToolTip="Add to the grid,Alt+A" ValidationGroup="AssetcodeAdd" AccessKey="A" />
                                                                </FooterTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                            <asp:Panel ID="pnlstline" runat="server" GroupingText="Straight Line Details" CssClass="stylePanel">
                                                <div class="gird">
                                                    <asp:GridView ID="grvBlockDepreciation" runat="server" AutoGenerateColumns="False" Width="100%" ShowFooter="true"
                                                        OnRowDataBound="grvBlockDepreciation_RowDataBound" OnRowCommand="grvBlockDepreciation_RowCommand" OnRowDeleting="grvBlockDepreciation_RowDeleting">
                                                        <Columns>

                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAutoID" runat="server" Text='<%# Bind("Dep_ID") %>'></asp:Label>

                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Effective From">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbleffectivefrom" runat="server" Text='<%# Bind("Effective_From_Date") %>'></asp:Label>
                                                                     <asp:Label ID="lblEffectiveToDate" Visible="false" runat="server" Text='<%# Bind("Effective_TO_Date1") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtEffectivefrom" runat="server" 
                                                                            class="md-form-control form-control login_form_content_input requires_true" ></asp:TextBox>
                                                                        <asp:Image ID="imgEffectivefrom" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                        <cc1:CalendarExtender ID="CEEffectivefromDate" runat="server" PopupButtonID="imgEffectivefrom"
                                                                             TargetControlID="txtEffectivefrom">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEffectivefrom" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Add" runat="server" ControlToValidate="txtEffectivefrom"
                                                                            InitialValue=" " ErrorMessage="Enter Effective From Date" Enabled="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                          <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    </div>

                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Effective To">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbleffectiveTO" runat="server" Text='<%# Bind("Effective_TO_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtEffectiveTo" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:Image ID="imgEffectiveTo" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                        <cc1:CalendarExtender ID="CEEffectiveToDate" runat="server" PopupButtonID="imgEffectiveTo"
                                                                            TargetControlID="txtEffectiveTo">
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEffectiveTo" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Add" runat="server" ControlToValidate="txtEffectiveTo"
                                                                            InitialValue=" " ErrorMessage="Enter Effective To Date" Enabled="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                          <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    </div>

                                                                </FooterTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Rate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBlockDepreciationperDesc" runat="server" Text='<%# Bind("Block_Depreciatio_Per") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <div class="md-input" style="margin: 0px;">
                                                                        <asp:TextBox ID="txtBlockDepreciationPer" runat="server" MaxLength="10"
                                                                             class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVRate" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Add" runat="server" ControlToValidate="txtBlockDepreciationPer"
                                                                            InitialValue=" " ErrorMessage="Enter Straight Line Depreciation Rate" Enabled="true"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                         <div class="validation_msg_box">
                                                                        <asp:RangeValidator ID="rngSLD" runat="server" Display="Dynamic" ValidationGroup="Add" Enabled="true"
                                                                            ControlToValidate="txtBlockDepreciationPer" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 100" Type="Double" MinimumValue="0.001" MaximumValue="100"></asp:RangeValidator>
                                                                    </div>
                                                                          <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    </div>


                                                                </FooterTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <FooterStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField FooterStyle-Width="10%" HeaderText="Action" ItemStyle-Width="10%">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="lnkRemove" runat="server" CausesValidation="false" CommandName="Delete" CssClass="grid_btn_delete" Text="Remove"  ToolTip="Remove from the grid,Alt+V" AccessKey="V" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Button ID="lnkAdd" runat="server" CommandName="Add" CssClass="grid_btn" Text="Add" ToolTip="Add to the grid,Alt+T" ValidationGroup="Add" AccessKey="T" />
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

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="grvAssetCode" runat="server" AutoGenerateColumns="False" OnRowDataBound="grvAssetCode_RowDataBound" CssClass="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="RBSelect" runat="server" Checked="false" OnCheckedChanged="RBSelectTrn_CheckedChanged"
                                                            AutoPostBack="true" Text="" Style="padding-left: 7px" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="20px" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        <asp:HiddenField ID="hdnSlno1" runat="server" Value='<%#Eval("Asset_code") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetcode" runat="server" Text='<%# Bind("Asset_code") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset code Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetcodeDesc" runat="server" Text='<%# Bind("Asset_Code_desc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="UOM">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUOM" runat="server" Text='<%# Bind("UOM") %>'></asp:Label>
                                                        <asp:Label ID="lblUOMID" runat="server" Visible="false" Text='<%# Bind("UOM_ID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetcategoryid" runat="server" Visible="false" Text='<%# Bind("Asset_Category_ID") %>'></asp:Label>
                                                        <asp:Label ID="lblAssetCategory" runat="server" Text='<%# Bind("Asset_Category") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="SL Desc">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblslcode" runat="server" Visible="false" Text='<%# Bind("SL_Code") %>'></asp:Label>
                                                        <asp:Label ID="lblsldesc" runat="server" Visible="true" Text='<%# Bind("SL_Desc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Valid Asset">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkIsActive" Enabled="false" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "Is_Active").ToString().ToUpper() == "TRUE"%>' />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:GridView ID="grvAssetCodeXL" runat="server" AutoGenerateColumns="False" Width="50%" CssClass="gird_details"
                                            Style="display: none;">
                                            <Columns>
                                                 <asp:TemplateField HeaderText="Group code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetgroupcode" runat="server" Text='<%# Bind("ASSET_GROUP_CODE") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Group Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetgrouopdesc" runat="server" Text='<%# Bind("asset_group_desc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetcode" runat="server" Text='<%# Bind("Asset_code") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset code Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAssetcodeDesc" runat="server" Text='<%# Bind("Asset_Code_desc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="UOM">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUOM" runat="server" Text='<%# Bind("UOM") %>'></asp:Label>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Asset Type">
                                                    <ItemTemplate>
                                                      
                                                        <asp:Label ID="lblAssetCategory" runat="server" Text='<%# Bind("Asset_Category") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="SL Desc">
                                                    <ItemTemplate>
                                                       
                                                        <asp:Label ID="lblsldesc" runat="server" Visible="true" Text='<%# Bind("SL_Desc") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Active">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblActive" runat="server" Text='<%# Bind("Is_Active1") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                              <div class="btn_height"></div>
                            <div align="right" class="fixed_btn">
                                 <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S" >   
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

                                 <button class="css_btn_enabled" id="btnExcel" title="Excel[Alt+C]"  causesvalidation="false" onserverclick="btnExcel_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Ex<u>c</u>el
                    </button>

                               
                       
                            </div>
                            <div>
                                <asp:CustomValidator ID="CVAssetMaster" runat="server" CssClass="styleMandatoryLabel"
                                    Enabled="true" />
                                <%-- <asp:ValidationSummary ValidationGroup="Save" ID="vs_AssetMaster" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />--%>
                            </div>
                        </div>


                    </div>
                </ContentTemplate>

                <Triggers>
                    <asp:PostBackTrigger ControlID="btnExcel" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
