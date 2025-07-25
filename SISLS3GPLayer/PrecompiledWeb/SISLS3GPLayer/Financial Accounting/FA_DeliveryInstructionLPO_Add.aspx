<%@ page title="Local Purchase Order" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_DeliveryInstructionLPO_Add, App_Web_hqzzel3u" %>

<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Delivery Details" ID="pnlCustomerInfo" runat="server" CssClass="stylePanel">

                                <div class="row">

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlActivity" ValidationGroup="Header" runat="server" class="md-form-control form-control" AutoPostBack="true">
                                            </asp:DropDownList>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Activity" CssClass="styleReqFieldLabel"
                                                    ID="lblActivity"></asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                            <div class="validation_msg_box">

                                                <asp:RequiredFieldValidator ID="rfvddllocation" SetFocusOnError="True" runat="server" CssClass="validation_msg_box_sapn"
                                                    ValidationGroup="btnSave" ControlToValidate="ddlLocation"
                                                    ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                                <asp:Label ID="lblIsActivated" runat="server" Text="Label" Visible="false"></asp:Label>

                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtName" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                Style="display: none;" MaxLength="50" ContentEditable="false"></asp:TextBox>
                                            <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" LOV_Code="FALPOENT" AutoPostBack="true" runat="server" DispalyContent="Name" ServiceMethod="GetEntityFunder" ShowHideAddressImageButton="false" HoverMenuExtenderLeft="true" OnItem_Selected="ucLov_Item_Selected" />
                                            <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                CausesValidation="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn"
                                                    runat="server" SetFocusOnError="True" ControlToValidate="txtName" ErrorMessage="Select Vendor"
                                                    ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblVendor" runat="server" CssClass="styleReqFieldLabel" Text="Vendor"></asp:Label>

                                            </label>
                                        </div>
                                    </div>



                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDate" runat="server" ToolTip="LPO Date" AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtDate_OnTextChanged"></asp:TextBox>
                                            <cc1:CalendarExtender ID="cedate" runat="server" Enabled="True"
                                                OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                TargetControlID="txtDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" CssClass="validation_msg_box_sapn"
                                                    runat="server" SetFocusOnError="True" ControlToValidate="txtDate" ErrorMessage="Enter LPO Date"
                                                    ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDate" runat="server" Text="LPO Date" CssClass="styleReqFieldLabel"></asp:Label>

                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtGlAccount" runat="server" ToolTip="GL Account" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblGLAccount" runat="server" Text="GL Account" CssClass="styleReqFieldLabel"></asp:Label>

                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtSLAccount" runat="server" ToolTip="SL Account" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSLAccount" runat="server" Text="SL Account" CssClass="styleReqFieldLabel"></asp:Label>

                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtLPONo" runat="server" ReadOnly="true" ToolTip="LPO Number" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblDLNo" runat="server" Text="LPO Number" CssClass="styleReqFieldLabel"></asp:Label>

                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBillType" runat="server" AutoPostBack="true" class="md-form-control form-control"
                                                OnSelectedIndexChanged="ddlBillType_OnSelectedIndexChanged">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvBillType" runat="server" ControlToValidate="ddlBillType" CssClass="validation_msg_box_sapn"
                                                    InitialValue="0" ErrorMessage="Select Bill Type" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="btnSave" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Bill Type" ID="lblBillType" CssClass="styleReqFieldLabel"></asp:Label>

                                            </label>
                                        </div>
                                    </div>




                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtQuotNo" runat="server" onmouseover="txt_MouseoverTooltip(this)" ToolTip="Quotation Ref Number"
                                                class="md-form-control form-control login_form_content_input requires_true" MaxLength="50"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvQuotationNumber" runat="server" ControlToValidate="txtQuotNo" CssClass="validation_msg_box_sapn"
                                                    InitialValue="" ErrorMessage="Enter Quotation ref Number" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="btnSave" />
                                            </div>--%>
                                            <label>
                                                <asp:Label runat="server" Text="Quotation Ref Number" ID="lblQuotNo" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtQuotDt" ToolTip="Quotation Date" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                onmouseover="txt_MouseoverTooltip(this)"></asp:TextBox>
                                            <cc1:CalendarExtender ID="ceQuotDt" runat="server" Enabled="True"
                                                OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                TargetControlID="txtQuotDt">
                                            </cc1:CalendarExtender>
                                            <%--<div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvQuotationDate" runat="server" ControlToValidate="txtQuotDt" CssClass="validation_msg_box_sapn"
                                                    InitialValue="" ErrorMessage="Enter Quotation Date" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="btnSave" />
                                            </div>--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Quotation Date" ID="lblQuotdt" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCrdays" MaxLength="3" runat="server" OnTextChanged="txtCrdays_OnTextChanged" AutoPostBack="true"
                                                class="md-form-control form-control login_form_content_input requires_true" onmouseover="txt_MouseoverTooltip(this)" ToolTip="Credit Days"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftbCrdays" runat="server" TargetControlID="txtCrdays"
                                                FilterType="Numbers" ValidChars="" Enabled="True">
                                            </cc1:FilteredTextBoxExtender>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Credit Days" ID="lblCrdays" CssClass="StyleDisplaylabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtterms" runat="server" onmouseover="txt_MouseoverTooltip(this)"
                                                ToolTip="Terms and Conditions" class="md-form-control form-control login_form_content_input requires_true" MaxLength="500" onkeyup="maxlengthfortxt(500)" TextMode="MultiLine"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftterms" runat="server" TargetControlID="txtterms"
                                                FilterType="Custom" FilterMode="InvalidChars" InvalidChars="<>&'" Enabled="true">
                                            </cc1:FilteredTextBoxExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtterms" CssClass="validation_msg_box_sapn"
                                                    InitialValue="" ErrorMessage="Enter Terms and Conditions" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="btnSave" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Payment Terms" ID="lblTerms" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtfavouringname" runat="server" ToolTip="Favouring Name" MaxLength="50" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RFVfAVOURINGNAME" runat="server" ControlToValidate="txtfavouringname" CssClass="validation_msg_box_sapn"
                                                    InitialValue="" ErrorMessage="Enter Favouring Name" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="btnSave" />
                                            </div>
                                            <label>
                                                <asp:Label runat="server" Text="Favouring Name" ID="lblFaouringName" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDocumentType" runat="server" onmouseover="txt_MouseoverTooltip(this)" Text="FAPO" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Document Type" ID="lblDocumentType"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtNarration" runat="server" onmouseover="txt_MouseoverTooltip(this)" MaxLength="200" onkeyup="maxlengthfortxt(500)" TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true lowercase"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvNarration" runat="server" ControlToValidate="txtNarration" CssClass="validation_msg_box_sapn"
                                                    InitialValue="" ErrorMessage="Enter Narration" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="btnSave" />
                                            </div>
                                            <label>
                                                <asp:Label runat="server" Text="Narration" ID="lblNarration" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtStatus" runat="server" ToolTip="Status" ReadOnly="true"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblStatus" runat="server" Text="Status" CssClass="styleDisplayLabel"></asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <asp:CheckBox ID="chkfixedasset" runat="server" Text="Fixed Asset" AutoPostBack="true" OnCheckedChanged="chkfixedasset_OnCheckedChanged" />
                                        <asp:HiddenField ID="hdnPrint" runat="server" />
                                    </div>

                                </div>
                            </asp:Panel>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Details" ID="Panel3" runat="server" CssClass="stylePanel">
                                <div class="gird" style="max-height: 450px; overflow-y: scroll;">
                                    <asp:GridView ID="gvDlivery" runat="server" ShowFooter="true"
                                        AutoGenerateColumns="False" OnRowDataBound="gvDlivery_RowDataBound"
                                        OnRowDeleting="gvDlivery_RowDeleting" class="gird_details">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No." HeaderStyle-CssClass="styleGridHeader">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" Width="80Px" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location" />
                                                    <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                    <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Location ID" Visible="false" />
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location" Visible="false" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:DropDownList ID="ddlLocation" Width="80Px" runat="server"
                                                            CssClass="md-form-control form-control">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="grid_validation_msg_box">

                                                            <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                ValidationGroup="VgAdd" ControlToValidate="ddlLocation" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Activity" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" Width="200px" Text='<%#Eval("Activity")%>' ID="lblActivity" ToolTip="Activity"></asp:Label>
                                                    <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:DropDownList ID="ddlActivityF" Width="100px"
                                                            CssClass="md-form-control form-control" AutoPostBack="true" runat="server">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="grid_validation_msg_box">

                                                            <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                ValidationGroup="VgAdd" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Select Acitvity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>


                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Asset Group Description" Visible="false" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetDesc" Width="400px" runat="server" Text='<%# Bind("Asset_Desc") %>' ToolTip="Asset Description" />
                                                    <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                    <asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Group_Code") %>' ToolTip="Asset Group Code" Visible="false" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <UC:Suggest ID="ddlAssetDescF" runat="server" Width="400px" ServiceMethod="GetAssetGrouopList" ItemToValidate="Value" OnItem_Selected="ddlAssetDescF_Item_Selected"
                                                            WatermarkText="--Select--" ErrorMessage="Select Asset Group Code" IsMandatory="false" AutoPostBack="true" ValidationGroup="VgAdd" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                    </div>

                                                    <asp:Label ID="lblAssetDescF" Font-Bold="false" runat="server" Text='<%# Bind("Asset_Desc") %>' Visible="false" ToolTip="Asset Description" />
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Asset Code Description" Visible="false" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetGrdesc" Width="400px" runat="server" Text='<%# Bind("Asset_Descrip") %>' ToolTip="Asset Code Description" />
                                                    <asp:Label ID="lblAssetgrId" runat="server" Text='<%# Bind("Asset_Code") %>' ToolTip="Asset Id" Visible="false" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <%--  <asp:DropDownList ID="ddlAssetDescGrF" runat="server" AutoPostBack="true" ToolTip="Asset Code Description" ValidationGroup="btnSave">
                                                                </asp:DropDownList>--%>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <UC:Suggest ID="ddlAssetDescGrF" runat="server" Width="200px" ServiceMethod="GetAssetCodeList" ItemToValidate="Value" OnItem_Selected="ddlAssetDescGrF_Item_Selected"
                                                            WatermarkText="--Select--" ErrorMessage="Select Asset  Code" IsMandatory="false" AutoPostBack="true" ValidationGroup="VgAdd" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>

                                                    </div>
                                                    <asp:Label ID="lblAssetGrF" Font-Bold="false" runat="server" Text='<%# Bind("Asset_Descrip") %>' Visible="false" ToolTip="Asset Code Description" />
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GL Account" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGLAccount" Width="200px" runat="server" Text='<%# Bind("GL_Account") %>' ToolTip="GL Account" />
                                                    <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("GL_Code") %>' ToolTip="GL Code" Visible="false" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <%--<asp:DropDownList ID="ddlGLAccountF" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlGLAccountF_SelectedIndexChanged" ToolTip="GL Account" ValidationGroup="btnSave">
                                                                </asp:DropDownList>--%>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <UC:Suggest ID="ddlGLAccountF" class="md-form-control form-control" Width="200px" runat="server" ServiceMethod="GetGLCodeList" OnItem_Selected="ddlGLAccountF_Item_Selected"
                                                            ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="VgAdd" />


                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <asp:Label ID="lblGLAccountF" Font-Bold="false" runat="server" Text='<%# Bind("GL_Account") %>' Visible="false" ToolTip="GL Account" />
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SL Account" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSLAccount" Width="150px" runat="server" Text='<%# Bind("SL_Account") %>' ToolTip="SL Account" />
                                                    <asp:Label ID="lblSLCode" runat="server" Text='<%# Bind("SL_Code") %>' Visible="false" ToolTip="GL Code" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                <FooterTemplate>
                                                    <%--     <asp:DropDownList ID="ddlSLAccountF" runat="server" OnSelectedIndexChanged="ddlSLAccountF_SelectedIndexChanged" ToolTip="SL Account" ValidationGroup="btnSave">
                                                                </asp:DropDownList>--%>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <UC:Suggest ID="ddlSLAccountF" runat="server" Width="200px" ServiceMethod="GetSLCodeList" ItemToValidate="Value"
                                                            WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="VgAdd" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <asp:Label ID="lblSLAccountF" Font-Bold="false" runat="server" Text='<%# Bind("SL_Account") %>' Visible="false" ToolTip="SL Account" />
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Model Description" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtModelDesc" runat="server" TextMode="MultiLine" ReadOnly="true" Width="250px" Height="50px"
                                                            MaxLength="450" Text='<%# Bind("Model_description") %>' onmouseover="txt_MouseoverTooltip(this)"
                                                            onkeyup="maxlengthfortxt(450)"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <%-- <cc1:FilteredTextBoxExtender ID="ftbModelDesc" runat="server" TargetControlID="txtModelDesc"
                                                FilterType="Custom" FilterMode="InvalidChars" InvalidChars="<>&'">
                                            </cc1:FilteredTextBoxExtender>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtModelDescF" runat="server" TextMode="MultiLine"  Width="250px" Height="50px"
                                                            MaxLength="450" Text='<%# Bind("Model_description") %>' ToolTip="Model Description" onmouseover="txt_MouseoverTooltip(this)"
                                                            onkeyup="maxlengthfortxt(450)"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbModelDesc" runat="server" TargetControlID="txtModelDescF"
                                                            FilterType="Custom" FilterMode="InvalidChars" InvalidChars="<>&'">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="grid_validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvModelDesc" SetFocusOnError="True" runat="server"
                                                                ValidationGroup="VgAdd" ControlToValidate="txtModelDescF" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Enter Model Description" Display="Dynamic" InitialValue=" " Enabled="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit Quantity" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Asset_quantity") %>' ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            ToolTip="Unit Quantity" Style="text-align: right" MaxLength="3"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <%--   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" TargetControlID="txtQuantity"
                                                FilterType="Numbers" ValidChars="" Enabled="True">onblur="fnBlur()"onblur="fnBlur()"
                                            </cc1:FilteredTextBoxExtender>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtQuantityF" OnTextChanged="txtQuantityF_OnTextChanged" runat="server" class="md-form-control form-control login_form_content_input requires_true" MaxLength="3" Text='<%# Bind("Asset_quantity") %>'
                                                            ToolTip="Unit Quantity" AutoPostBack="true" Style="text-align: right" Width="40px"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbQuantityF" runat="server" TargetControlID="txtQuantityF"
                                                            FilterType="Numbers" ValidChars="" Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="grid_validation_msg_box">

                                                            <asp:RequiredFieldValidator ID="rfvQuantity" SetFocusOnError="True" runat="server"
                                                                ValidationGroup="VgAdd" ControlToValidate="txtQuantityF" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Enter Unit Quantity" Display="Dynamic" InitialValue=" " Enabled="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="grid_validation_msg_box">
                                                            <asp:RangeValidator ID="rngquantity" runat="server" Display="Dynamic" ValidationGroup="VgAdd" Enabled="true"
                                                                ControlToValidate="txtQuantityF" CssClass="validation_msg_box_sapn" ErrorMessage="Enter number between 1 and 999" Type="Double" MinimumValue="1" MaximumValue="999"></asp:RangeValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UOM" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtUOMID" runat="server" Text='<%# Bind("UOM_ID") %>' ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            ToolTip="UOM ID" Visible="false"></asp:TextBox>
                                                        <asp:TextBox ID="txtUOM" Width="100Px" runat="server" ReadOnly="true" Text='<%# Bind("UOM") %>' class="md-form-control form-control login_form_content_input requires_true"
                                                            ToolTip="UOM"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <%--   <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server" TargetControlID="txtQuantity"
                                                FilterType="Numbers" ValidChars="" Enabled="True">onblur="fnBlur()"onblur="fnBlur()"
                                            </cc1:FilteredTextBoxExtender>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:DropDownList ID="ddlUOM" Width="70px" runat="server" CssClass="md-form-control form-control"></asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="grid_validation_msg_box">

                                                            <asp:RequiredFieldValidator ID="rfvUOM" SetFocusOnError="True" runat="server"
                                                                ValidationGroup="VgAdd" ControlToValidate="ddlUOM" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Select UOM" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                        </div>

                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Unit Value" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtAssetValue" Width="90px" Text='<%# Bind("Asset_Value")%>' runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            Style="text-align: right" ToolTip="Asset Value"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyAsset" Width="200px" Text='<%# Bind("Asset_quantity")%>' runat="server"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <%--<asp:TextBox ID="txtAssetValue1" Text='<%# Bind("Asset_Value")%>' Width="180px" runat="server"
                                                Style="text-align: right" ToolTip="Asset Value" Visible="false" MaxLength="14">Text='<%# Bind("Asset_Value")%>'
                                            </asp:TextBox>--%>
                                                        <cc1:FilteredTextBoxExtender ID="ftbAssetValueF" runat="server" TargetControlID="txtAssetValue"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <%--<cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtAssetValue1"
                                                 FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                            </cc1:FilteredTextBoxExtender>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtAssetValueF" Width="90px" MaxLength="15" OnTextChanged="txtAssetValueF_OnTextChanged" class="md-form-control form-control login_form_content_input requires_true" runat="server"
                                                            Style="text-align: right" ToolTip="Asset Value" AutoPostBack="true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbAssetValueF" runat="server" TargetControlID="txtAssetValueF"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="grid_validation_msg_box">

                                                            <asp:RequiredFieldValidator ID="rfvUnitValue" SetFocusOnError="True" runat="server"
                                                                ValidationGroup="VgAdd" ControlToValidate="txtAssetValueF" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Enter Unit Value" Display="Dynamic" InitialValue=" " Enabled="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Discount" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtDiscount" Width="90px" runat="server" Text='<%# Bind("Discount") %>' ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            ToolTip="Discount" Style="text-align: right"></asp:TextBox>
                                                    </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtDiscountF" Width="90px" MaxLength="15" runat="server" class="md-form-control form-control login_form_content_input requires_true" Text='<%# Bind("Discount") %>'
                                                            ToolTip="Discount" OnTextChanged="txtDiscountF_OnTextChanged" AutoPostBack="true" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbDiscountF" runat="server" TargetControlID="txtDiscountF"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txttotal" Width="120Px" Text='<%# Bind("Total")%>' runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            Style="text-align: right" ToolTip="Total"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyAssetCost" Text='<%# Bind("Asset_quantity")%>' runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyAssetVal" Text='<%# Bind("Asset_Value")%>' runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyDiscount" Text='<%# Bind("Discount")%>' runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbtotal" runat="server" TargetControlID="txtAssetValue"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txttotalF" MaxLength="15" Width="120Px" Text='<%# Bind("Total")%>' runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                            Style="text-align: right" ToolTip="Total"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyAsset" Text='<%# Bind("ASSET_COST")%>' runat="server"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyAssetVal" Text='<%# Bind("Asset_Value")%>' runat="server"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <asp:TextBox ID="txtDyDiscount" Text='<%# Bind("Discount")%>' runat="server"
                                                            ReadOnly="true" Style="display: none;"></asp:TextBox>
                                                        <%-- <cc1:FilteredTextBoxExtender ID="ftbtotal" runat="server" TargetControlID="txttotalF"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>--%>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks" HeaderStyle-VerticalAlign="Top">
                                                <ItemTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtRemarks" runat="server" Height="50px" TextMode="MultiLine" Width="250px"   onkeyup="maxlengthfortxt(450)"
                                                            MaxLength="450" Text='<%# Bind("Remarks") %>' ToolTip="Remarks" ReadOnly="true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                    <%-- <cc1:FilteredTextBoxExtender ID="ftbRemarks" runat="server" TargetControlID="txtRemarks"
                                                FilterType="Custom" FilterMode="InvalidChars" InvalidChars="<>&'">
                                            </cc1:FilteredTextBoxExtender>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px;">
                                                        <asp:TextBox ID="txtRemarksF" runat="server" Width="250px" Height="50px" TextMode="MultiLine" onkeyup="maxlengthfortxt(450)"
                                                            MaxLength="450" Text='<%# Bind("Remarks") %>' ToolTip="Remarks"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftbRemarks" runat="server" TargetControlID="txtRemarksF"
                                                            FilterType="Custom" FilterMode="InvalidChars" InvalidChars="<>&'">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                    </div>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>


                                                                        <asp:TemplateField HeaderText="Product/Services" >
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("ProductService")%>' ID="lblProductServices" Width="150px" ToolTip="Product Services"></asp:Label>
                                                                            <asp:HiddenField ID="hdnProductServicesId" runat="server" Value='<%#Eval("ProductService_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlProductServicesF" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesF_SelectedIndexChanged">
                                                                                </asp:DropDownList> 
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Type" >
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("TaxType")%>' ID="lblTaxType" ToolTip="Product Services"></asp:Label>
                                                                            <asp:HiddenField ID="hdnTaxTypeId" runat="server" Value='<%#Eval("TaxType_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlTaxTypeF" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlTaxTypeF_SelectedIndexChanged">
                                                                                </asp:DropDownList> 
                                                                            </div>
                                                                        </FooterTemplate>
                                                                         
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="ITC Applicability" >
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("ITCApplicability")%>' ID="lblITCApplicability" ToolTip="ITC Applicability"></asp:Label>
                                                                            <asp:HiddenField ID="hdnITCApplicabilityId" runat="server" Value='<%#Eval("ITCApplicability_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlITCApplicabilityF" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server">
                                                                                </asp:DropDownList> 
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Taxable Amount(Excl. VAT)" ItemStyle-HorizontalAlign="Right" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount1" runat="server" Width="90px" Style="text-align: right" ToolTip="Amount" Text='<%#Eval("Total")%>'></asp:Label>
                                                                            <asp:Label ID="txtAmountL" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtamtF" runat="server" Width="90px" ReadOnly="true" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Rate" ItemStyle-HorizontalAlign="Right" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                            <asp:Label ID="txtTAXPERCENTAGE" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                        </FooterTemplate> 
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="VAT Amount" ItemStyle-HorizontalAlign="Right" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNT" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                            <asp:Label ID="txtTAXAMOUNT" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNTF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                        </FooterTemplate> 
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Total Amount"  HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                 <asp:Label ID="lblTotAmount" runat="server" Text='<%#Eval("TAmount")%>' ></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnDelete" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" CssClass="grid_btn_delete"
                                                        OnClientClick="return confirm('Do you sure want to delete?');" AccessKey="R" ToolTip="[Alt+R]"></asp:LinkButton>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <button class="css_btn_enabled" id="btnAdd" validationgroup="VgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                <div align="right">
                                    <div>
                                        <asp:Label ID="lblTotal" CssClass="styleDisplayLabel" runat="server" Text="Total"></asp:Label>

                                        <asp:Label ID="lblAccountDetailsTotal" ToolTip="Total amount of asset details grid"
                                            CssClass="styleDisplayLabel" runat="server"></asp:Label>
                                    </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="btn_height"></div>
                    <div align="right">
                        <asp:HiddenField ID="hdndocexists" runat="server" />

                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" validationgroup="btnSave" onserverclick="btnSave_Click" runat="server"
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

                        <%--<asp:Button ID="btnPrint" OnClick="btnPrint_Click" runat="server" />--%>
                        <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+i]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                            type="button" accesskey="i">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;Pr<u>i</u>nt
                        </button>

                        <button class="css_btn_enabled" id="btnCancelLPO" title="LPO Cancel[Alt+C]" onclick="if(fnConfirmCancelDI())" causesvalidation="false" onserverclick="btnCancelLPO_ServerClick" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;LPO <u>C</u>ancel
                        </button>
                    </div>


                    <div>
                        <asp:ValidationSummary ID="vsDelivery" runat="server" CssClass="styleMandatoryLabel" Visible="false"
                            HeaderText="Correct the following validation(s):  "
                            Height="177px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="btnSave" />
                        <asp:CustomValidator ID="cvDelivery" runat="server" Display="None" CssClass="styleMandatoryLabel"></asp:CustomValidator>
                        <asp:Label ID="lblCustID" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                    </div>
                </div>
            </div>











        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        function fnConfirmCancelDI() {

            if (confirm('Do you want to cancel LPO?')) {
                return true;
            }
            else
                return false;

        }

        function fnBlur() {
            var Quantity;
            var total;
            var actualvalue;
            var mode = ("<%= Request.QueryString["qsMode"] %>");
            if (mode == "C") {
                var Grid = document.getElementById("<%=gvDlivery.ClientID%>");
                if (Grid != null) {
                    var intGridLen = Grid.rows.length;
                    for (var i = 2; i <= intGridLen; i++) {
                        if (i < 10)
                            i = "0" + i;
                        var txtQuantity = document.getElementById(Grid.id + "_ctl" + i + "_txtQuantity");
                        var txtDyAsset = document.getElementById(Grid.id + "_ctl" + i + "_txtDyAsset");
                        var txtAssetValue = document.getElementById(Grid.id + "_ctl" + i + "_txtAssetValue");
                        if (txtAssetValue == null) {
                            txtAssetValue.value = 0;
                        }
                        else if (txtDyAsset == null) {
                            txtDyAsset.value = 0;
                        }

                        if ((txtQuantity.value != "") && (txtAssetValue.value != "") && (txtDyAsset.value != "")) {
                            txtAssetValue.value = ((txtQuantity.value) * (txtDyAsset.value));

                        }
                        else {
                            txtAssetValue.value = 0;
                        }
                    }
                }
            }
        }
        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }

        function fnTrashSuggest(e) {
            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                }
            }
        }

        function fnTrashCommonSuggest(e) {


            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtName.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtName.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtName.ClientID %>').value = "";


                }
            }
        }

    </script>

</asp:Content>

