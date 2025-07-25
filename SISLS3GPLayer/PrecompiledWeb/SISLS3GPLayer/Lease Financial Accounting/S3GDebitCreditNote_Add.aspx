<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="S3GDebitCreditNote_Add, App_Web_523fo0sd" enableeventvalidation="false" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components"
    TagPrefix="cc2" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"
    TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx"
    TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GCustomerAddress.ascx"
    TagName="FAAddressDetail" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">                                       
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div>
                            <div class="row">
                                <asp:Panel ID="pnlDebitCreditnote" runat="server" GroupingText="Debit-Credit Note"
                                    CssClass="stylePanel" Width="100%">
                                    <div class="row" id="tractivity" runat="server" visible="false">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlActivity" runat="server" AutoPostBack="True"
                                                    ToolTip="Activity" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Activity" CssClass="styleReqFieldLabel"
                                                        ID="lblActivity"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="TextBox1" runat="server" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" ToolTip="Doc Number" class="md-form-control form-control login_form_content_input requires_false">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Doc Number" ID="lblDocNumber"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtDocNumber" runat="server" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" ToolTip="Doc Number"
                                                    class="md-form-control form-control login_form_content_input requires_false">
                                                </asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Doc Number" ID="Label2"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddllob" runat="server" AutoPostBack="True" onmouseover="ddl_itemchanged(this)"
                                                    OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hdnLobCode" runat="server" />
                                                <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvLineofBusiness" runat="server" ControlToValidate="ddlLOB"
                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                        ErrorMessage="Select a Line of Business" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Line of Business" ID="Label4"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlLocation" runat="server" ToolTip="Location" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlLocation_OnSelectedIndexChanged" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                        ErrorMessage="Select a Branch" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Branch" ID="lblLocation"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtDate" runat="server" onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true"
                                                    OnTextChanged="txtDate_OnTextChanged" class="md-form-control form-control login_form_content_input requires_false"
                                                    ToolTip="Date">
                                                </asp:TextBox>
                                                <cc1:CalendarExtender runat="server" TargetControlID="txtDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                    PopupButtonID="imgDate" ID="CEDate" Enabled="True" Format="dd/MM/YYYY">
                                                </cc1:CalendarExtender>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvDate" runat="server"
                                                        ControlToValidate="txtDate" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Enter Doc Date" Display="Dynamic" SetFocusOnError="True" InitialValue=""
                                                        ValidationGroup="Main" />
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Doc Date" ID="lblDate"
                                                        CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtCRDRValueDate" runat="server" Enabled="false" class="md-form-control form-control login_form_content_input requires_false" AutoPostBack="true" OnTextChanged="txtCRDRValueDate_TextChanged"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalExtenderValuedate" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate" runat="server" Enabled="True"
                                                    PopupButtonID="imgInvoiceDate" TargetControlID="txtCRDRValueDate" Format="dd/MM/YYYY">
                                                </cc1:CalendarExtender>
                                                <div class="validation_msg_box">
                                                    <asp:CustomValidator ID="rfvCompareMJVDate" runat="server" Display="None" CssClass="styleMandatoryLabel"
                                                        ValidationGroup="Header" ErrorMessage="Difference between Doc Date and CRDR Value Date must be 30 days"></asp:CustomValidator>
                                                </div>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ErrorMessage="Enter the Value Date" ValidationGroup="Main"
                                                        ID="rfvMJVValueDate" runat="server" ControlToValidate="txtCRDRValueDate" InitialValue="" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label ID="Label3" runat="server" CssClass="styleReqFieldLabel" Text="Value Date"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlDocType" runat="server" ToolTip="Doc Type" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlDocType_OnSelectedIndexChanged"
                                                    onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvDocType" runat="server"
                                                        ControlToValidate="ddlDocType" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Select DocType" Display="Dynamic" SetFocusOnError="True"
                                                        ValidationGroup="Main" />
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Doc Type" ID="lblDocType"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlEntityType" runat="server"
                                                    ToolTip="EntityType" AutoPostBack="true" OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged"
                                                    onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control">
                                                </asp:DropDownList>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvEntityType" runat="server"
                                                        ControlToValidate="ddlEntityType" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Select Entity Type" Display="Dynamic"
                                                        SetFocusOnError="True" ValidationGroup="Main" />
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Entity Type" ID="lblEntityType"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <UC6:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                    strLOV_Code="CUS_ACDBT" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                                <asp:Button ID="btnCreateCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnCreateCustomer_Click"
                                                    Style="display: none" />
                                                <asp:HiddenField ID="hdnCustId" runat="server" />
                                                <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <asp:TextBox ID="txtCustomerNames" runat="server" Style="display: none;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <%--<asp:TextBox ID="txtCode" ToolTip="Code" runat="server"
                                                    Style="display: none;" MaxLength="50" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server"
                                                    DispalyContent="Code" TextWidth="65%" />
                                                <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true"
                                                    Text="Create" Style="display: none;" OnClick="btnCreateCustomer_Click"
                                                    CssClass="styleSubmitShortButton" CausesValidation="false" />
                                                <asp:Button ID="btnCustAddsView" runat="server" OnClick="btnCustView_OnClick"
                                                    Text="AD+" CssClass="styleSubmitShortButton" CausesValidation="false" />--%>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvcmbCustomer" runat="server" ControlToValidate="txtCustomerNames"
                                                        ErrorMessage="Select a Customer/Entity" ValidationGroup="Main" Enabled="true" InitialValue="" CssClass="validation_msg_box_sapn"
                                                        Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" ToolTip="Code / Name" Text="Code / Name"
                                                        ID="lblEntityCodes" CssClass="styleReqFieldLabel"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtDocAmount" runat="server" Style="text-align: right;" onmouseover="txt_MouseoverTooltip(this)" ToolTip="Doc Amount"
                                                    ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false">
                                                </asp:TextBox>
                                                <div class="validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="rfvdocamount" runat="server"
                                                        ControlToValidate="txtDocAmount" InitialValue="0"
                                                        ErrorMessage="Enter Document Amount" Display="None"
                                                        SetFocusOnError="True" ValidationGroup="Main" />
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Doc Amount" ID="lblDocAmount"
                                                        CssClass="styleReqFieldLabel">
                                                    </asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtNoteStatus" runat="server" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true"
                                                    ToolTip="Note Status" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Note Status" ID="lblNoteStatus"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtDocRefNumber" MaxLength="35" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                    ToolTip="Refer. Number" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label runat="server" Text="Refer. Number" ID="lblDocRefNumber"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                            <div class="md-input">
                                                <asp:TextBox ID="txtRemarks" TextMode="MultiLine" onkeyup="maxlengthfortxt(100)" runat="server"
                                                    ToolTip="Remarks" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label class="tess">
                                                    <asp:Label runat="server" Text="Remarks" ID="lblRemarks"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="dvLanguage" runat="server">
                                            <div class="md-input">
                                                <asp:DropDownList ID="ddlLanguage" ToolTip="Language" runat="server" class="md-form-control form-control  requires_false">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <label>
                                                    <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" Text="Language"></asp:Label>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div class="row">
                                <asp:Panel ID="PanelGLSLDetails" ToolTip="Account Details"
                                    Width="99%" runat="server" GroupingText="Account Details"
                                    CssClass="stylePanel">
                                    <div class="gird" style="overflow-y: scroll;">
                                        <asp:GridView runat="server" ShowFooter="true" ID="grvGLSLDetails"
                                            Width="100%" ToolTip="Account Details" Visible="true"
                                            OnRowDataBound="grvGLSLDetails_RowDataBound" OnRowCommand="grvGLSLDetails_RowCommand"
                                            OnRowDeleting="grvGLSLDetails_RowDeleting" RowStyle-HorizontalAlign="Center"
                                            HeaderStyle-CssClass="styleGridHeader" FooterStyle-HorizontalAlign="Center"
                                            AutoGenerateColumns="False" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSerialNo" runat="server" ToolTip='<%#Container.DataItemIndex+1%>' Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Line Of Business" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("LOB_NAME")%>' ID="lblILOB_NAME" CausesValidation="false" ToolTip='<%#Eval("LOB_NAME")%>'></asp:Label>
                                                        <asp:Label runat="server" Text='<%#Eval("LOB_ID")%>' ID="lblILOB_ID" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlFLOB" runat="server" AutoPostBack="True" Width="150px" onmouseover="ddl_itemchanged(this)"
                                                                OnSelectedIndexChanged="ddlFLOB_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <div class="grid_validation_msg_box">
                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFLOB" CssClass="validation_msg_box_sapn"
                                                                    SetFocusOnError="True" ValidationGroup="vgAdd" runat="server" ControlToValidate="ddlFLOB"
                                                                    InitialValue="0" ErrorMessage="Select Line Of Business"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("LOCATION_NAME")%>' ID="lblILOCATION_NAME" ToolTip='<%#Eval("MLA_Desc")%>'></asp:Label>
                                                        <asp:Label runat="server" Text='<%#Eval("BRANCH_ID")%>' ID="lblIBRANCH_ID" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:DropDownList ID="ddlFBranch" runat="server" ToolTip="Branch" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlFBranch_OnSelectedIndexChanged" Width="110px" CssClass="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <div class="grid_validation_msg_box">
                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFBranch" CssClass="validation_msg_box_sapn"
                                                                    SetFocusOnError="True" ValidationGroup="vgAdd" runat="server" ControlToValidate="ddlFBranch"
                                                                    InitialValue="0" ErrorMessage="Select Branch"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text='<%#Eval("MLA_Desc")%>' ID="lblMLA" CausesValidation="false" ToolTip='<%#Eval("MLA_Desc")%>' OnClick="lblMLA_Number_Click" Style="color: red; text-underline-position: below;"></asp:LinkButton>
                                                        <asp:Label runat="server" Text='<%#Eval("Account_Creation_ID")%>' ID="lblAccount_Creation_ID" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <uc3:Suggest ID="txtMLASearchhdr" runat="server" ServiceMethod="GetMLAList" AutoPostBack="true" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <uc3:Suggest ID="txtMLASearch" Width="120px" runat="server" Enabled="false" ServiceMethod="GetMLAList" AutoPostBack="true"
                                                                OnItem_Selected="txtMLASearch_SelectedIndexChanged" IsMandatory="false" ErrorMessage="Select Account Number" ValidationGroup="vgAdd" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Asset / Invoice Number">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" Text='<%#Eval("Reference_Number")%>' ID="lblReference_Number" CausesValidation="false"
                                                            OnClick="lblReference_Number_Click" Style="color: red; text-underline-position: below;" ToolTip='<%#Eval("Reference_Number")%>'></asp:LinkButton>
                                                        <asp:Label runat="server" Text='<%#Eval("Asset_ID")%>' ID="lblAssetID" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <uc3:Suggest ID="txtRefNumber" runat="server" ServiceMethod="GetAssetInvoiceList" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="md-input">
                                                                                <uc3:Suggest ID="txtFRefNumber" runat="server" ServiceMethod="GetAssetInvoiceList"
                                                                                    IsMandatory="false" ValidationGroup="vgAdd" Width="100px" ErrorMessage="Select Invoice/Asset Number" AutoPostBack="true" OnItem_Selected="txtFRefNumber_Item_Selected" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Button ID="btnFtAddAss" runat="server"
                                                                                CssClass="btn_5" Text=".." ToolTip="Ref the Details, Alt+V" AccessKey="V" Enabled="false" CausesValidation="false"
                                                                                OnClick="btnFtAddAss_Click"></asp:Button>
                                                                            <asp:LinkButton runat="server" Text="View" ID="lblReferenceNumberF" CausesValidation="false"
                                                                                OnClick="lblReference_NumberF_Click" Style="color: red; text-underline-position: below;" ></asp:LinkButton>
                                                                             <asp:Label runat="server"  ID="lblAssetIDF" Visible="false"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                            </table>

                                                        </div>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Pay Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFlowType" ToolTip='<%#Eval("Flow_Type")%>' runat="server" Text='<%#Eval("Flow_Type")%>'></asp:Label>
                                                        <asp:Label ID="lblPayTypeID" runat="server" Value='<%#Eval("CashFlow_ID")%>' Visible="false" />
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:DropDownList ID="ddlFooterPayType" ToolTip="Pay Type" Width="175px" runat="server"
                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlFooterPayType_SelectedIndexChanged"
                                                                CssClass="md-form-control form-control">
                                                            </asp:DropDownList>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <div class="grid_validation_msg_box">
                                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RFVFooterPayType" CssClass="validation_msg_box_sapn"
                                                                    SetFocusOnError="True" ValidationGroup="vgAdd" runat="server" ControlToValidate="ddlFooterPayType"
                                                                    InitialValue="0" ErrorMessage="Select Pay Type"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <asp:Button ID="btnFtAdd" runat="server"
                                                                CssClass="grid_btn" Enabled="false" Visible="false"
                                                                Text=".." ToolTip="Ref the Details, Alt+V" AccessKey="V" CausesValidation="false"
                                                                OnClick="btnFtAdd_Click"></asp:Button>
                                                        </div>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="GL Account" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGLAccountI" ToolTip="GL Account"
                                                            Width="100%" runat="server" Text='<%#Eval("GL_Code")%>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblGLAccountDesc" ToolTip='<%#Eval("GL_Desc")%>'
                                                            Width="100%" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlGLCodeEdit" runat="server"
                                                            AutoPostBack="true" OnSelectedIndexChanged="ddlGLCodeEdit_OnSelectedIndexChanged"
                                                            onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control" Width="150px">
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:HiddenField ID="hdn_AccNature" runat="server" />
                                                            <uc3:Suggest ID="txtFooterGLAccount" runat="server" ToolTip="GL Account" AutoPostBack="true"
                                                                OnItem_Selected="ddlGLCodeEdit_OnSelectedIndexChanged" ServiceMethod="GetGLAccount" IsMandatory="true" ErrorMessage="Select GL Account" ValidationGroup="vgAdd" />
                                                            <asp:HiddenField ID="hdnglcode" runat="server" />
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub GL Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubAccountI" ToolTip="Sub Account"
                                                            Width="100%" runat="server" Text='<%#Eval("SL_Code")%>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblSubAccountDesc" ToolTip='<%#Eval("SL_Desc")%>'
                                                            Width="100%" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddlSLCodeEdit" onmouseover="ddl_itemchanged(this)"
                                                            runat="server" CssClass="md-form-control form-control">
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <uc3:Suggest ID="txtFooterSubGLAccount" runat="server" ToolTip="GL Account" ServiceMethod="GetSubGLAccount" />
                                                        </div>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Right"
                                                    HeaderText="Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" ToolTip='<%#Eval("Amount")%>' Width="95%"
                                                            runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtTargetAmount" Text='<%#Bind("Amount") %>'
                                                            runat="server" MaxLength="20" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"
                                                            ToolTip='<%#Bind("Amount") %>' onkeypress="fnAllowNumbersOnly(true,false,this)" class="md-form-control form-control login_form_content_input requires_false">
                                                        </asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtFooterAmount" ToolTip="Amount" MaxLength="15"
                                                                runat="server" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(true,false,this)" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                            <div class="grid_validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" Enabled="true" SetFocusOnError="True" InitialValue="" ValidationGroup="vgAdd"
                                                                    ErrorMessage="Enter the Amount"></asp:RequiredFieldValidator>
                                                            </div>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <asp:Label
                                                                ID="lblFooterActualAmount" runat="server"
                                                                Visible="false"></asp:Label>
                                                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtFooterAmount"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                        </div>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <FooterStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="left"
                                                    HeaderText="Narration">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNarration" ToolTip='<%#Eval("Narration")%>' Width="100%"
                                                            runat="server" Text='<%#Eval("Narration")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtTargetNarration" onkeyup="maxlengthfortxt(100)" onmouseover="txt_MouseoverTooltip(this)" Width="180px" Text='<%#Bind("Narration")%>'
                                                            runat="server" MaxLength="100" Style="text-align: left;"
                                                            ToolTip="Narration" onkeypress="fnAllowNumbersOnly(true,false,this)" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtFooterNarration" TextMode="MultiLine" onkeyup="maxlengthfortxt(100)"
                                                                ToolTip="Narration" onmouseover="txt_MouseoverTooltip(this)"
                                                                runat="server" MaxLength="100" Style="text-align: left" Width="200px" Wrap="true"></asp:TextBox>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                        </div>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:Button ID="lnkRemove" runat="server" Text="Delete" CssClass="grid_btn_delete"
                                                            CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                            CausesValidation="false" ToolTip="Remove the Details, Alt+R" AccessKey="R"></asp:Button>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Button ID="lnkUpdate" runat="server" Text="Update"
                                                            CommandName="Update" CausesValidation="false" CssClass="grid_btn" /><asp:Button
                                                                ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                                CausesValidation="false" ToolTip="Update the Details, Alt+U" AccessKey="U" />
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="md-input" style="margin: 0px;">
                                                            <asp:Button ID="lnkAdd" Width="100%" ToolTip="Add the Details, Alt+T" AccessKey="T"
                                                                CommandName="Add" ValidationGroup="vgAdd" CssClass="grid_btn"
                                                                runat="server" Text="Add"></asp:Button>
                                                        </div>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                    <FooterStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div class="row" style="float: right; padding-right: 17%;">
                                        <asp:Label ID="lblTot" runat="server" Text="Total :" Font-Bold="true" />
                                        <asp:Label ID="txttotaldue" ToolTip="Amount" runat="server" MaxLength="20" Style="text-align: right"
                                            Font-Bold="True"></asp:Label>
                                    </div>
                                </asp:Panel>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="dvHdrCustomerName" visible="false" runat="server">
                                    <div class="md-input">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtHdrCustomerName" ReadOnly="true" runat="server"
                                                ToolTip="Customer Name" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" Text="Customer Name" ID="lblHdrCustomerName"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="float: right; margin-top: 5px;">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Main'))" validationgroup="Main" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
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
                        <button class="css_btn_enabled" id="btn_print" visible="false" title="Print the Details[Alt+P]" causesvalidation="false" onserverclick="btn_print_Click" runat="server"
                            type="button" accesskey="P">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                        <button class="css_btn_enabled" id="btnDelete" title="Cancel Note[Alt+C]" visible="false" onclick="if(confirm('Are you sure want to cancel this record?'))" causesvalidation="false" onserverclick="btnDelete_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-close" aria-hidden="true"></i>&emsp;<u>C</u>ancel Note
                        </button>
                        <asp:Button runat="server" ID="btnPayPrint" Text="Print" CausesValidation="false" CssClass="styleSubmitButton"
                            OnClick="btnPayPrint_Click" Style="display: none;" />
                    </div>
                    <div class="row" style="display: none">
                        <asp:ValidationSummary ID="vsDCNote" runat="server" ShowSummary="true"
                            CssClass="styleMandatoryLabel" ValidationGroup="Main" ShowMessageBox="false"
                            HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                            CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                            HeaderText="Correct the following validation(s):" />
                    </div>
                    <div class="row" style="display: none">
                        <asp:CustomValidator ID="cvNote" runat="server" Display="None"
                            CssClass="styleMandatoryLabel" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_print" />
            <asp:PostBackTrigger ControlID="btnPayPrint" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblInstallmentPop" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeInstallmentPop" runat="server" PopupControlID="dvInstallmentPop" TargetControlID="lblInstallmentPop"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInstallmentPop" style="display: none; width: 75%; height: 50%;">
        <div>
            <asp:Panel ID="pnlInstallmentPop" GroupingText="Asset Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updInstView" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 250px;">
                            <div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAssetName" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_AssetName" runat="server" CssClass="styleReqFieldLabel" Text="Asset Description"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAssetCode" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_AssetCode" runat="server" CssClass="styleReqFieldLabel" Text="Asset Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMarginAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_MarginAmount" runat="server" CssClass="styleReqFieldLabel" Text="Margin Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTradeIn" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_DiscountValue" runat="server" CssClass="styleReqFieldLabel" Text="Discount Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_FinanceAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_FinanceAmount" runat="server" CssClass="styleReqFieldLabel" Text="Finance Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_PaidAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_PaidAmount" runat="server" CssClass="styleReqFieldLabel" Text="Paid Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="vertical-align: middle;">
                                            <asp:Button runat="server" ID="btnOk" CausesValidation="false" Visible="false"
                                                OnClick="btnInsrtOk_Click" Text="Ok" CssClass="save_btn fa fa-floppy-o" />
                                            <button class="css_btn_enabled" id="btnPopupCancel" title="Exit[Alt+3]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnInsrtCancel_Click" runat="server"
                                                type="button" accesskey="3">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <asp:Label ID="lblInvoicePopup" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpelInvoicePopup" runat="server" PopupControlID="dvlInvoicePopup" TargetControlID="lblInvoicePopup"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvlInvoicePopup" style="display: none; width: 75%; height: 60%;">
        <div>
            <asp:Panel ID="pnlInvoiceDetails" GroupingText="Invoice Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 290px;">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceAccountNumber" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceAccountNumber" runat="server" CssClass="styleDisplayLabel" Text="Account number" ToolTip="Account number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceNoPopup" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceNoPopup" runat="server" CssClass="styleDisplayLabel" Text="Invoice No" ToolTip="Invoice No"></asp:Label>

                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceDatePopup" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceDatePopup" runat="server" CssClass="styleDisplayLabel" Text="Invoice Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoicePartyName" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoicePartyName" runat="server" CssClass="styleDisplayLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceDueDate" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceDueDate" runat="server" CssClass="styleDisplayLabel" Text="Due Date" ToolTip="Due Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceAmount" runat="server" CssClass="styleDisplayLabel" Text="Invoice Amount" ToolTip="Invoice Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoicePaidAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoicePaidAmount" runat="server" CssClass="styleDisplayLabel" Text="Paid Amount" ToolTip="Paid Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceReceivedAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceReceivedAmount" runat="server" CssClass="styleDisplayLabel" Text="Realization Amount" ToolTip="Realization Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="vertical-align: middle;">
                                    <button class="css_btn_enabled" id="btnInvoicePopup" title="Exit[Alt+5]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnInvoiceOk_Click" runat="server"
                                        type="button" accesskey="5">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                    </button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>

    <asp:Label ID="lblInstallmens" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mprInstallments" runat="server" PopupControlID="dvInstallments" TargetControlID="lblInstallmens"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInstallments" style="height: 250px; width: 570px; display: none; background-color: white; border-style: solid; border-color: #336699; border-width: 1px" class="stylePanel">
        <div>
            <asp:Panel ID="pnlAccountInfoDet" DefaultButton="btnOk" runat="server"
                GroupingText="Installment Details" CssClass="stylePanel" ScrollBars="None">
                <asp:UpdatePanel ID="updInfoDet" runat="server">
                    <ContentTemplate>
                        <div>
                            <div class="row">
                                <div class="container" style="height: 200px; width: 550px;">
                                    <asp:GridView ID="grvAccountInfoDet" runat="server" AutoGenerateColumns="false" BorderWidth="1px" Width="530px"
                                        HeaderStyle-CssClass="styleGridHeader" ShowFooter="true"
                                        OnRowDataBound="grvAccountInfoDet_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Right" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDetAccount_Number" runat="server"
                                                        Text='<%# Eval("Account_Number") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment No" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallment_No" runat="server"
                                                        Text='<%# Eval("Installment_No") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Date" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallment_Date" runat="server"
                                                        Text='<%# Eval("Installment_Date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallment_Amount" runat="server"
                                                        Text='<%# Eval("InstallmentAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkAll" runat="server"
                                                        Text="All" ToolTip="Include" AutoPostBack="true"
                                                        OnCheckedChanged="chkAll_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkInclude" runat="server" CausesValidation="false"
                                                        CssClass="styleGridHeader" AutoPostBack="true"
                                                        OnCheckedChanged="chkInclude_CheckedChanged" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pay Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtPaidAmount" Style="text-align: right" runat="server"
                                                        MaxLength="15" Enabled="false" Width="80px" AutoPostBack="true"
                                                        OnTextChanged="txtPaidAmount_OnTextChanged"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftePaidAmount" runat="server"
                                                        TargetControlID="txtPaidAmount" FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                    </cc1:FilteredTextBoxExtender>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <asp:Button ID="btnInstOk" runat="server" CausesValidation="true" CssClass="styleSubmitButton" OnClick="btnInstOk_Click" Text="Ok" ToolTip="Ok" />
                                <asp:Button ID="btnInstCancel" runat="server" CausesValidation="true" CssClass="styleSubmitButton" OnClick="btnInstCancel_Click" Text="Cancel" ToolTip="Cancel" />
                            </div>
                            <div class="row">
                                <asp:Label ID="lblPopupMsg" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        function fnLoadCustomer() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }

        function fnTrashCommonSuggest(e) {
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNames.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNames.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNames.ClientID %>').value = "";
                }
            }
        }
    </script>

</asp:Content>
