<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAAssetTransaction, App_Web_skbf4x1n" title="Payment Request" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register TagPrefix="uc7" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upMain" runat="server">
        <ContentTemplate>

            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">

                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Asset Transaction" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                    </div>
                    <div>

                        <cc1:TabContainer ID="tcFunderTransaction" runat="server" CssClass="styleTabPanel"
                            Width="99%" TabStripPlacement="top" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" HeaderText="Main details" ID="tpMaindetails" CssClass="tabpan"
                                BackColor="Red" TabIndex="0" Width="100%">
                                <HeaderTemplate>
                                    Main details                        
                                </HeaderTemplate>



                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upMaindetails" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnldett" runat="server" CssClass="stylePanel" GroupingText="Header Details">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlActivity" ValidationGroup="Header" runat="server" class="md-form-control form-control" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                                            ErrorMessage="Select Activity" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity2" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                                            ErrorMessage="Select Activity" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                                        <asp:HiddenField ID="hdnPrint" runat="server" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Activity" ID="lblActivity" CssClass="styleReqFieldLabel"
                                                                            ToolTip="Activity"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlTransationType" ValidationGroup="Header" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlTransationType_SelectedIndexChanged" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvtransactionType" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlTransationType" InitialValue="0"
                                                                            ErrorMessage="Select Transaction Type" ValidationGroup="Save"></asp:RequiredFieldValidator>


                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Transaction Type" ID="lblTransactionType" CssClass="styleReqFieldLabel"
                                                                            ToolTip="Transaction Type"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvLocation" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlLocation" InitialValue="0"
                                                                            ErrorMessage="Select Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>


                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblLocation" Text="Branch" />

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">

                                                                    <asp:TextBox ID="txtCode" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control"
                                                                        Style="display: none;" MaxLength="50" ContentEditable="false"></asp:TextBox>
                                                                    <%-- <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" DispalyContent="Code"
                                                                        TextWidth="65%" />--%>
                                                                    <asp:HiddenField ID="hdncode" Value="0" runat="server" />
                                                                    <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" LOV_Code="FAENT" AutoPostBack="true" runat="server" DispalyContent="Name" ServiceMethod="GetEntityFunder" ShowHideAddressImageButton="false" HoverMenuExtenderLeft="true" OnItem_Selected="ucLov_Item_Selected" />
                                                                    <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="true" Text="Create"
                                                                        Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                                        CausesValidation="false" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtCode" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Vendor"
                                                                            ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label class="tess">
                                                                        <asp:Label runat="server" ToolTip="Vendor" Text="Vendor" ID="Label1" CssClass="styleReqFieldLabel"></asp:Label>
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
                                                                        <asp:Label ID="lblGLAccount" runat="server" Text="GL Account" CssClass="styleDisplayLabel"></asp:Label>

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
                                                                        <asp:Label ID="lblSLAccount" runat="server" Text="SL Account" CssClass="styleDisplayLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDocumentNo" runat="server" ToolTip="Document Number" class="md-form-control form-control login_form_content_input requires_true"
                                                                        ReadOnly="true" />

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblDocumentNo" Text="Document Number"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtPaymentRequestDate" runat="server" OnTextChanged="txtDocDate_TextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                                                        AutoPostBack="true"></asp:TextBox>
                                                                    <asp:Image ID="imgPaymentRequestDate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender ID="CEPaymentRequestDate" runat="server" PopupButtonID="imgPaymentRequestDate"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtPaymentRequestDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtPaymentRequestDate" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtPaymentRequestDate"
                                                                            ErrorMessage="Enter Document Date"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ID="lblDocumentDate" Text="Document Date"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPaymentStatus" ToolTip="Payment Status" runat="server" onmouseover="ddl_itemchanged(this)" class="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlPaymentStatus" CssClass="validation_msg_box_sapn"
                                                                            InitialValue="0" runat="server" SetFocusOnError="True" ControlToValidate="ddlPaymentStatus"
                                                                            ErrorMessage="Select Status" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Status" ToolTip="Payment Status" ID="lblPaymentStatus"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtValueDate" runat="server" OnTextChanged="txtValueDate_TextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                                                        AutoPostBack="true"></asp:TextBox>
                                                                    <asp:Image ID="imgValueDate" runat="server" Visible="false" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender ID="CEValueDate" runat="server" Enabled="True" PopupButtonID="imgValueDate"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate1" TargetControlID="txtValueDate">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVtxtValueDate" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtValueDate"
                                                                            ErrorMessage="Enter Value Date"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Value Date" ToolTip="Value date" ID="lblValueDate"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtTotalAmount" runat="server" MaxLength="20" ReadOnly="true" Style="text-align: right;" ToolTip="Total Amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                        </div>


                                                    </asp:Panel>

                                                </div>

                                                <asp:Panel ID="PnlLPO" runat="server" CssClass="stylePanel" GroupingText="PO Details" ToolTip="PO Details" Visible="false" Width="98%">

                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div id="divpo" runat="server" style="overflow: auto; height: 200px; display: none">
                                                                <div class="gird">
                                                                    <asp:GridView ID="grvpo" runat="server" AutoGenerateColumns="False" ToolTip="PO Details" Width="100%" CssClass="gird_details">
                                                                        <%--OnRowDataBound="grvpo_OnRowDataBound"--%>
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="PO Number">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblLPOID" runat="server" Text='<%#Eval("LPO_ID")%>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblGroupCode" runat="server" Text='<%#Eval("ASSET_GROUP_CODE")%>' Visible="false"></asp:Label>

                                                                                    <asp:Label ID="lblAssetCode" runat="server" Text='<%#Eval("ASSET_CODE")%>' Visible="false"></asp:Label>
                                                                                    <asp:Label ID="lblLPONo" runat="server" Text='<%#Eval("LPO_NO")%>' ToolTip="PO Number"></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="lpo_details_id" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblLPODtls" runat="server" Text='<%#Eval("LPO_DETAILS_ID")%>' ToolTip="PO Number"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="40%" />
                                                                            </asp:TemplateField>

                                                                            <asp:TemplateField HeaderText="Model Description">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblModDes" runat="server" Text='<%#Eval("MOD_DESC")%>' ToolTip="Model Description"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <ItemStyle Width="40%" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Select">
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="chkselect" runat="server" AutoPostBack="true" Checked='<%#DataBinder.Eval(Container.DataItem, "CHK").ToString().ToUpper() == "TRUE"%>' OnCheckedChanged="chkselect_OnCheckedChanged" ToolTip="Select" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div align="center">
                                                        <button class="grid_btn" id="btnGo" title="Alt+G" accesskey="G" runat="server" onserverclick="btnGo_OnClick"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i><u>G</u>O</button>
                                                        <asp:HiddenField ID="hdnvalue" runat="server" />
                                                        <asp:HiddenField ID="hdnserial" runat="server" />
                                                        <asp:HiddenField ID="hdnLPOValue" runat="server" Value="0" />

                                                    </div>

                                                </asp:Panel>

                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="pnlAssetDetails" runat="server" CssClass="stylePanel" GroupingText="Asset Details" ToolTip="Asset Details" Width="99%">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <div class="row">
                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtOtherAmount" runat="server" MaxLength="20" Style="text-align: right;" Visible="false" ToolTip="Other Amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblOtherAmount" runat="server" Text="Other Amount" Visible="false"></asp:Label>

                                                                            </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                        <div class="md-input">
                                                                            <asp:TextBox ID="txtVATAmount" runat="server" MaxLength="20" Style="text-align: right;" Visible="false" ToolTip="Total Amount" class="md-form-control form-control login_form_content_input requires_true" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblVATAmount" runat="server" Text="VAT Amount" Visible="false"></asp:Label>

                                                                            </label>
                                                                        </div>
                                                                    </div>



                                                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlAssetGroup" Visible="false" class="md-form-control form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAssetGroup_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblAssetGroup" runat="server" Visible="false" Text="Asset Group"></asp:Label>

                                                                            </label>
                                                                        </div>
                                                                    </div>


                                                                </div>

                                                                <div class="row">
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                        <div id="Div1" style="overflow: scroll;" runat="server">
                                                                            <div class="gird">
                                                                                <asp:GridView ID="grvAssetDetails" runat="server" AutoGenerateColumns="False" class="gird_details"
                                                                                    FooterStyle-HorizontalAlign="Center" OnRowCommand="grvAssetDetails_RowCommand"
                                                                                    OnRowDataBound="grvAssetDetails_RowDataBound" OnRowDeleting="grvAssetDetails_RowDeleting" RowStyle-HorizontalAlign="Center"
                                                                                    ShowFooter="false" ToolTip="Asset Details" Width="100%">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                                <asp:Label ID="lblslno" runat="server" Visible="false" Text='<%# Bind("Slno") %>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Branch" HeaderStyle-CssClass="styleGridHeader">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location" Width="100px" />
                                                                                                <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                                                <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Location ID" Visible="false" />
                                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Location") %>' ToolTip="Location" Visible="false" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input">
                                                                                                    <asp:DropDownList ID="ddlLocationF" runat="server" Width="100px" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">

                                                                                                        <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                                            ValidationGroup="AssetcodeAdd" ControlToValidate="ddlLocationF" CssClass="validation_msg_box_sapn"
                                                                                                            ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Activity">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" Width="200px" ToolTip="Activity"></asp:Label>
                                                                                                <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>

                                                                                                <div class="md-input" style="margin: 0px;">

                                                                                                    <asp:DropDownList ID="ddlActivityF" Width="200px"
                                                                                                        CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">

                                                                                                        <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                                            ValidationGroup="AssetcodeAdd" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                                            ErrorMessage="Select Acitvity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>


                                                                                            </FooterTemplate>

                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Asset Group Description" HeaderStyle-CssClass="styleGridHeader">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAssetDesc" Width="200px" runat="server" Text='<%# Bind("Asset_Group_Desc") %>' ToolTip="Asset Description" />
                                                                                                <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                                                <asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Group_Code") %>' ToolTip="Asset Group Code" Visible="false" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input">
                                                                                                    <UC:Suggest ID="ddlAssetDescF" Width="200px" runat="server" ServiceMethod="GetAssetGrouopList" ItemToValidate="Value" OnItem_Selected="ddlAssetDescF_Item_Selected"
                                                                                                        WatermarkText="--Select--" ErrorMessage="Select Asset Group Code" IsMandatory="true" AutoPostBack="true" ValidationGroup="AssetcodeAdd" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>

                                                                                                </div>

                                                                                                <asp:Label ID="lblAssetDescF" Font-Bold="false" runat="server" Text='<%# Bind("Asset_Desc") %>' Visible="false" ToolTip="Asset Description" />
                                                                                            </FooterTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Asset code" ItemStyle-HorizontalAlign="Left">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAssetcode" runat="server" Text='<%#Eval("Assetcode")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                                <asp:Label ID="lblAssetcodeDesc" Width="200px" runat="server" Text='<%#Eval("AssetDesc")%>' ToolTip="Asset Desc"></asp:Label>
                                                                                                <asp:Label ID="lblGroupCode" runat="server" Text='<%#Eval("GROUP_CODE")%>' ToolTip="Asset Group" Width="100%" Visible="false"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <UC:Suggest ID="ddlAssetDescGrF" Width="200px" runat="server" ServiceMethod="GetAssetCodeList" ItemToValidate="Value" OnItem_Selected="ddlAssetDescGrF_Item_Selected"
                                                                                                        WatermarkText="--Select--" ErrorMessage="Select Asset  Code" IsMandatory="true" AutoPostBack="true" ValidationGroup="AssetcodeAdd" />
                                                                                                </div>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="GL Account" HeaderStyle-CssClass="styleGridHeader">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblGLAccount" runat="server" Width="200px" Text='<%# Bind("GL_Account") %>' ToolTip="GL Account" />
                                                                                                <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("GL_Code") %>' ToolTip="GL Code" Visible="false" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                                                            <FooterTemplate>
                                                                                                <%--<asp:DropDownList ID="ddlGLAccountF" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlGLAccountF_SelectedIndexChanged" ToolTip="GL Account" ValidationGroup="btnSave">
                                                                </asp:DropDownList>--%>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <UC:Suggest ID="ddlGLAccountF" class="md-form-control form-control" Width="200px" runat="server" ServiceMethod="GetGLCodeList" OnItem_Selected="ddlGLAccountF_Item_Selected"
                                                                                                        ErrorMessage="Select GL Account" IsMandatory="true" AutoPostBack="true" ValidationGroup="AssetcodeAdd" />


                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                                <asp:Label ID="lblGLAccountF" Font-Bold="false" runat="server" Text='<%# Bind("GL_Account") %>' Visible="false" ToolTip="GL Account" />
                                                                                            </FooterTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="SL Account" HeaderStyle-CssClass="styleGridHeader">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSLAccount" runat="server" Width="200px" Text='<%# Bind("SL_Account") %>' ToolTip="SL Account" />
                                                                                                <asp:Label ID="lblSLCode" runat="server" Text='<%# Bind("SL_Code") %>' Visible="false" ToolTip="GL Code" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />

                                                                                            <FooterTemplate>
                                                                                                <%--     <asp:DropDownList ID="ddlSLAccountF" runat="server" OnSelectedIndexChanged="ddlSLAccountF_SelectedIndexChanged" ToolTip="SL Account" ValidationGroup="btnSave">
                                                                </asp:DropDownList>--%>
                                                                                                <div class="md-input">
                                                                                                    <UC:Suggest ID="ddlSLAccountF" Width="200px" runat="server" ServiceMethod="GetSLCodeList" ItemToValidate="Value"
                                                                                                        WatermarkText="--Select--" ErrorMessage="Select SL Account" IsMandatory="false" AutoPostBack="true" ValidationGroup="AssetcodeAdd" />
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                                <asp:Label ID="lblSLAccountF" Font-Bold="false" runat="server" Text='<%# Bind("SL_Account") %>' Visible="false" ToolTip="SL Account" />
                                                                                            </FooterTemplate>

                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Rate" ItemStyle-HorizontalAlign="Right">
                                                                                            <ItemTemplate>
                                                                                                <%--<asp:Label ID="lblRate" ToolTip="Funder Repayment" Text='<%#Eval("Rate")%>' Width="100%"
                                                                                    runat="server"></asp:Label>--%>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtRateL" runat="server" AutoPostBack="true" Width="200px" OnTextChanged="txtRateL_TextChanged" ReadOnly="true" Style="text-align: right;" Text='<%#Eval("Rate")%>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtRate" runat="server" Width="200px" AutoPostBack="true" OnTextChanged="txtRate_TextChanged" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvtxtRate" runat="server"
                                                                                                            ControlToValidate="txtRate" CssClass="validation_msg_box_sapn" Width="200px" Display="Dynamic" class="md-form-control form-control login_form_content_input requires_true" ErrorMessage="Enter Rate" SetFocusOnError="True"
                                                                                                            ValidationGroup="AssetcodeAdd"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Quantity" ItemStyle-HorizontalAlign="Right">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtQuantityL" runat="server" AutoPostBack="true" MaxLength="6" OnTextChanged="txtQuantityL_TextChanged" ReadOnly="true"
                                                                                                        Style="text-align: right;" Text='<%#Eval("Quantity")%>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="FTEQty" runat="server" Enabled="True" FilterType="Numbers"
                                                                                                        TargetControlID="txtQuantityL">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                                <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>' ToolTip="Quantity" Visible="false" Width="100%"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtQuantity" runat="server" AutoPostBack="true" MaxLength="6" OnTextChanged="txtQuantity_TextChanged" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                    <cc1:FilteredTextBoxExtender ID="FTEQtyF" runat="server" Enabled="True" FilterType="Numbers"
                                                                                                        TargetControlID="txtQuantity">
                                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvtxtQuantity" runat="server" ControlToValidate="txtQuantity"
                                                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Quantity" SetFocusOnError="True" ValidationGroup="AssetcodeAdd"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>

                                                                                        <asp:TemplateField HeaderText="Line Entry" ItemStyle-HorizontalAlign="Right">
                                                                                            <ItemTemplate>
                                                                                                <asp:DropDownList ID="ddlLineentryitem" runat="server" Visible="false" AutoPostBack="true" Width="70px" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input" OnSelectedIndexChanged="ddlLineentryitem_SelectedIndexChanged">
                                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                                    <asp:ListItem Value="2">No</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                                <asp:Label ID="lbllineentrycode" runat="server" Text='<%#Eval("Line_Entry_Val")%>' ToolTip="Asset code" Visible="false"></asp:Label>
                                                                                                <asp:Label ID="lblLinentry" runat="server" Text='<%#Eval("Line_Entry")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>

                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:DropDownList ID="ddlLineentry" runat="server" AutoPostBack="true" Width="70px" onmouseover="ddl_itemchanged(this)" CssClass="md-form-control form-control login_form_content_input" OnSelectedIndexChanged="ddlLineentry_SelectedIndexChanged">
                                                                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                                        <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                                                        <asp:ListItem Value="2">No</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <asp:RequiredFieldValidator ID="rfvddllineentry" runat="server" ControlToValidate="ddlLineentry"
                                                                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select Line Entry" InitialValue="0"
                                                                                                            SetFocusOnError="True" ValidationGroup="AssetcodeAdd"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>


                                                                                        <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblAmount" runat="server" Style="text-align: right" Text='<%#Eval("Amount")%>' ToolTip="Amount" Visible="false"></asp:Label>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtAmountL" runat="server" AutoPostBack="true" Width="200px" ReadOnly="true" Style="text-align: right" Text='<%#Eval("Amount")%>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtAmount" runat="server" Style="text-align: right" Width="200px" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                    <div class="grid_validation_msg_box">
                                                                                                        <%--onkeyup="maxlengthfortxt(60);"--%>
                                                                                                        <asp:RequiredFieldValidator ID="RFVtxtAmount" runat="server" ControlToValidate="txtAmount" CssClass="validation_msg_box_sapn"
                                                                                                            Display="Dynamic" ErrorMessage="Enter Amount" SetFocusOnError="True" ValidationGroup="AssetcodeAdd"></asp:RequiredFieldValidator>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Discount" ItemStyle-HorizontalAlign="Right">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblDiscount" runat="server" Width="200px" Style="text-align: right" Text='<%#Eval("Discount")%>' ToolTip="Discount"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtDiscount" runat="server" Width="200px" Style="text-align: right" AutoPostBack="true" OnTextChanged="txtDiscount_TextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                                                                                        CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>

                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>


                                                                                        <asp:TemplateField HeaderText="Asset Number">
                                                                                            <ItemTemplate>

                                                                                                <asp:ImageButton ID="imgAddAssetNumber" runat="server" ImageUrl="../Images/Dimm2.JPG"
                                                                                                    Style="cursor: pointer; height: 18px; width: 25px;" Visible="true" OnClick="imgViewAssetNumber_OnClick" />

                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <asp:Label ID="lblAssetNumberrF" Style="text-align: right" ToolTip="AssetNumber"
                                                                                                    Width="100%" runat="server" Text='<%#Eval("AssetNumber")%>' Visible="false"></asp:Label>
                                                                                                <asp:ImageButton ID="imgAddAssetNumber" runat="server" ImageUrl="../Images/Dimm2.JPG"
                                                                                                    Style="cursor: pointer; height: 18px; width: 25px;" Visible="true" OnClick="imgAddAssetNumber_OnClick" />

                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Remarks">
                                                                                            <ItemTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtRemarks" runat="server" MaxLength="100" Width="250px" Height="50px" ReadOnly="true" onkeyup="maxlengthfortxt(100);" Rows="3" Text='<%#Eval("Remarks")%>' TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>
                                                                                                <asp:Label ID="lblLpoDetailId" Text='<%#Eval("LPO_DETAIL_ID")%>' Visible="false" runat="server"></asp:Label>

                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <div class="md-input" style="margin: 0px;">
                                                                                                    <asp:TextBox ID="txtRemarks" runat="server" MaxLength="100" Width="250px" Height="50px" onkeyup="maxlengthfortxt(100);" Rows="2" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                                                                                                    <span class="highlight"></span>
                                                                                                    <span class="bar"></span>
                                                                                                </div>

                                                                                            </FooterTemplate>
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
                                                                            <asp:Label ID="lblAmount1" runat="server" Width="90px" Style="text-align: right" ToolTip="Amount" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                            <asp:Label ID="txtAmountL1" runat="server" Visible="false"></asp:Label>
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
                                                                                 <asp:Label ID="lblTotAmount" runat="server" Text='<%#Eval("TotalAmount")%>' ></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>


                                                                                        <asp:TemplateField HeaderText="Action">
                                                                                            <ItemTemplate>
                                                                                                <asp:Button ID="lnkRemove" runat="server" CausesValidation="false" CommandName="Delete" CssClass="grid_btn_delete" Text="Remove" ToolTip="Remove from the grid" />
                                                                                            </ItemTemplate>
                                                                                            <FooterTemplate>
                                                                                                <button class="grid_btn" id="btnAdd" validationgroup="AssetcodeAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="btnAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                                                <%-- <asp:Button ID="lnkAdd" runat="server" CommandName="Add" CssClass="styleGridShortButton" Text="Add" ToolTip="Add to the grid" ValidationGroup="AssetcodeAdd" />--%>
                                                                                            </FooterTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
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
                                                    <asp:Panel ID="pnlsaleDetails" runat="server" Visible="true" CssClass="stylePanel" GroupingText="Sale Details" ToolTip="Filter Details" Width="99%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <UC:Suggest ID="ddlPurchaseNumber" runat="server" class="md-form-control form-control" AutoPostBack="true" ServiceMethod="GetPurchaseNumber" />

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblPurchaseNumber" runat="server" Text="Purchase Number"></asp:Label>

                                                                    </label>
                                                                </div>

                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <UC:Suggest ID="ddlInvoiceNumber" runat="server" class="md-form-control form-control" ServiceMethod="GetInvoiceNumber" AutoPostBack="true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblInvoiceNumber" runat="server" Text="Invoice Number"></asp:Label>

                                                                    </label>
                                                                </div>

                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <UC:Suggest ID="ddlAssetDesc" runat="server" class="md-form-control form-control" ServiceMethod="GetAssetDescription" AutoPostBack="true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblAssetDescription" runat="server" Text="Asset code Description"></asp:Label>

                                                                    </label>
                                                                </div>

                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <UC:Suggest ID="ddlAssetNumber" runat="server" class="md-form-control form-control" ServiceMethod="GetAssetNumber" AutoPostBack="true" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblAssetNumber" runat="server" Text="Asset Number"></asp:Label>

                                                                    </label>
                                                                </div>

                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInvoiceFromDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <asp:Image ID="imgInvoiceFromdate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender ID="CEInvoiceFromDate" runat="server" Enabled="True" PopupButtonID="imgInvoiceFromdate"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate1" TargetControlID="txtInvoiceFromDate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Invoice From Date" ToolTip="Invoice from date" ID="lblInvoiceFromDate"
                                                                            CssClass="styleDisplayLabel"></asp:Label>

                                                                    </label>
                                                                </div>

                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtInvoieTodate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <asp:Image ID="imgInvoiceTodate" Visible="false" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                                    <cc1:CalendarExtender ID="CEInvoiceToDate" runat="server" Enabled="True" PopupButtonID="imgInvoiceTodate"
                                                                        OnClientDateSelectionChanged="checkDate_NextSystemDate1" TargetControlID="txtInvoieTodate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Invoice To Date" ToolTip="Invoice To date" ID="lblInvoiceTodate"
                                                                            CssClass="styleDisplayLabel"></asp:Label>

                                                                    </label>
                                                                </div>

                                                            </div>


                                                        </div>

                                                        <div align="center">

                                                            <button class="grid_btn" id="BtnFetch" title="Alt+T" accesskey="T" runat="server" onserverclick="BtnFetch_Click"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>Fe<u>t</u>ch</button>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlFilter" runat="server" CssClass="stylePanel" GroupingText="Filter Details" ToolTip="Filter Details" Visible="false" Width="98%">

                                                                    <div id="divfilter" runat="server" style="overflow: auto; height: 250px; display: none">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="GrvSaleDetails" Visible="false" runat="server" AutoGenerateColumns="False" FooterStyle-HorizontalAlign="Center" CssClass="gird_details"
                                                                                HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ToolTip="Sale Details" Width="100%" OnRowDataBound="GrvSaleDetails_RowDataBound">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="20%" HeaderText="Asset code" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetcode" runat="server" Text='<%#Eval("Assetcode")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Eval("AssetDesc")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblGroupCode" runat="server" Text='<%#Eval("GROUP_CODE")%>' ToolTip="Asset Group" Width="100%" Visible="false"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Rate" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblRate" ToolTip="Funder Repayment" Text='<%#Eval("Rate")%>' Width="100%"
                                                                                                runat="server"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Quantity" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>

                                                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>' ToolTip="Quantity" Width="100%"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Line Entry" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbllineentrycode" runat="server" Text='<%#Eval("Line_Entry_Val")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblLinentry" runat="server" Text='<%#Eval("Line_Entry")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>


                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAmount" runat="server" Style="text-align: right" Text='<%#Eval("Amount")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Depreciation Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbldepreciation" runat="server" Style="text-align: right" Text='<%#Eval("Depreciation_amount")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Discount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblDiscount" runat="server" Style="text-align: right" Text='<%#Eval("Discount")%>' ToolTip="Discount" Width="100%"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Asset Number" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAssetNumber" runat="server" Style="text-align: right" Text='<%#Eval("AssetNumber")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Sale Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:TextBox ID="txtSaleAmount" runat="server" Width="100px" Style="text-align: right" MaxLength="15" AutoPostBack="true" OnTextChanged="txtSaleAmount_TextChanged"
                                                                                                    Text='<%#Eval("Sale_Amount")%>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtSaleAmount" FilterType="Numbers,Custom"
                                                                                                    TargetControlID="txtSaleAmount" runat="server" Enabled="True" ValidChars=".">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>
                                                                                            </div>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Branch" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblLocationID" runat="server" Style="text-align: left" Text='<%#Eval("Location_ID")%>' Visible="false" ToolTip="Amount"></asp:Label>
                                                                                            <asp:Label ID="lblLocation1" runat="server" Style="text-align: left" Text='<%#Eval("Location")%>' ToolTip="Amount"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Activity" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblactivityID" runat="server" Style="text-align: left" Text='<%#Eval("Activity_ID")%>' Visible="false" ToolTip="Amount"></asp:Label>
                                                                                            <asp:Label ID="lblactivity1" runat="server" Style="text-align: left" Text='<%#Eval("Activity")%>' ToolTip="Amount"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Select">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="HlblSelect" runat="server" Text="Select" />
                                                                                            <br />

                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkselect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSaleselect_CheckedChanged" Checked='<%#DataBinder.Eval(Container.DataItem, "checked").ToString().ToUpper() == "TRUE"%>' ToolTip="Select" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                        <div class="row">
                                                                            <uc7:PageNavigator ID="ucCustomPaging" runat="server"></uc7:PageNavigator>
                                                                        </div>
                                                                    </div>
                                                                    <div align="center">
                                                                        <button class="grid_btn" id="BtnUpdate" title="Alt+Shift+E" accesskey="E" runat="server" onserverclick="BtnUpdate_Click"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>Update</button>

                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlTransferDetails" runat="server" CssClass="stylePanel" GroupingText="Transfer Details" ToolTip="Transfer Details" Visible="true" Width="98%">

                                                                    <div id="divtransfer" runat="server" style="overflow: auto; height: 200px; display: block">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="grvTransfer" runat="server" AutoGenerateColumns="False" FooterStyle-HorizontalAlign="Center" CssClass="gird_details"
                                                                                HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ToolTip="Sale Entry Details" Width="100%" OnRowDataBound="grvTransfer_RowDataBound">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="20%" HeaderText="Asset code" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetcode" runat="server" Text='<%#Eval("Assetcode")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Eval("AssetDesc")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblGroupCode" runat="server" Text='<%#Eval("GROUP_CODE")%>' ToolTip="Asset Group" Width="100%" Visible="false"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>


                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Asset Number" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAssetNumber" runat="server" Style="text-align: left" Text='<%#Eval("AssetNumber")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Operating Branch" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblOperatingLocation" Visible="false" runat="server" Style="text-align: right" Text='<%#Eval("OPER_LOCATION_ID")%>' ToolTip="Operating Location" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lbloperaLocation" runat="server" Style="text-align: left" Text='<%#Eval("OPER_LOCATION")%>' ToolTip="Operating Location" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Operating User" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblOperatingUserID" Visible="false" runat="server" Style="text-align: right" Text='<%#Eval("OPER_USER_ID")%>' ToolTip="Operating Location" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lbloperaUser" runat="server" Style="text-align: left" Text='<%#Eval("OPER_USER")%>' ToolTip="Operating Location" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="New Operating Branch" ItemStyle-HorizontalAlign="Left">

                                                                                        <ItemTemplate>
                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <asp:DropDownList ID="ddloperLocationF" runat="server" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>

                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="New Operating User" ItemStyle-HorizontalAlign="Left">

                                                                                        <ItemTemplate>

                                                                                            <div class="md-input" style="margin: 0px;">
                                                                                                <UC:Suggest ID="ddluserF" runat="server" ServiceMethod="GetUserNameList"
                                                                                                    ErrorMessage="Select Operating User" IsMandatory="false" AutoPostBack="true" />
                                                                                                <span class="highlight"></span>
                                                                                                <span class="bar"></span>

                                                                                            </div>


                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderText="Select">
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="HlblSelect" runat="server" Text="Select All" />
                                                                                            <br />

                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkselect" runat="server" Checked='<%#DataBinder.Eval(Container.DataItem, "checked").ToString().ToUpper() == "TRUE"%>' ToolTip="Select" AutoPostBack="true" OnCheckedChanged="chkTransferselect_CheckedChanged" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>


                                                                            </asp:GridView>
                                                                        </div>
                                                                        <div class="row">
                                                                            <uc7:PageNavigator ID="ucCustomTransfer" runat="server"></uc7:PageNavigator>
                                                                        </div>
                                                                        <div align="center">
                                                                            <button class="grid_btn" id="btntransferUpdate" title="Alt+D" accesskey="D" runat="server" onserverclick="btntransferUpdate_ServerClick"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i><u>U</u>pdate</button>

                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlsaleentry" runat="server" CssClass="stylePanel" GroupingText="Sale Entry Details" ToolTip="Sale Entry Details" Visible="false" Width="98%">

                                                                    <div id="divsaleentry" runat="server" style="overflow: auto; height: 200px; display: none">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="grvsaleentry" Visible="false" runat="server" AutoGenerateColumns="False" FooterStyle-HorizontalAlign="Center" CssClass="gird_details"
                                                                                HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ToolTip="Sale Entry Details" Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="20%" HeaderText="Asset code" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetcode" runat="server" Text='<%#Eval("Assetcode")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Eval("AssetDesc")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblGroupCode" runat="server" Text='<%#Eval("GROUP_CODE")%>' ToolTip="Asset Group" Width="100%" Visible="false"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Rate" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblRate" ToolTip="Funder Repayment" Text='<%#Eval("Rate")%>' Width="100%"
                                                                                                runat="server"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Quantity" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>

                                                                                            <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity")%>' ToolTip="Quantity" Width="100%"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Line Entry" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbllineentrycode" runat="server" Text='<%#Eval("Line_Entry_Val")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblLinentry" runat="server" Text='<%#Eval("Line_Entry")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>


                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAmount" runat="server" Style="text-align: right" Text='<%#Eval("Amount")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Depreciation Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbldepreciation" runat="server" Style="text-align: right" Text='<%#Eval("Depreciation_amount")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" Visible="false" HeaderText="Discount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblDiscount" runat="server" Style="text-align: right" Text='<%#Eval("Discount")%>' ToolTip="Discount" Width="100%"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Asset Number" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAssetNumber" runat="server" Style="text-align: left" Text='<%#Eval("AssetNumber")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Branch" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblLocationID" runat="server" Style="text-align: left" Text='<%#Eval("Location_ID")%>' Visible="false" ToolTip="Amount"></asp:Label>
                                                                                            <asp:Label ID="lblLocation1" runat="server" Style="text-align: left" Text='<%#Eval("Location")%>' ToolTip="Amount"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Activity" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblactivityItID" runat="server" Style="text-align: left" Text='<%#Eval("Activity_ID")%>' Visible="false" ToolTip="Amount"></asp:Label>
                                                                                            <asp:Label ID="lblactivityIT" runat="server" Style="text-align: left" Text='<%#Eval("Activity")%>' ToolTip="Amount"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="10%" HeaderText="Sale Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSaleAmount" runat="server" Style="text-align: right" Text='<%#Eval("Sale_Amount")%>' Width="95%"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                <asp:Panel ID="pnlTransfer" runat="server" CssClass="stylePanel" GroupingText="Transfer Entry Details" ToolTip="Transfer Entry Details" Visible="false" Width="98%">

                                                                    <div id="divFinalTransfer" runat="server" style="overflow: auto; height: 200px; display: none">
                                                                        <div class="gird">
                                                                            <asp:GridView ID="grvFinalTransfer" Visible="false" runat="server" AutoGenerateColumns="False" FooterStyle-HorizontalAlign="Center" CssClass="gird_details"
                                                                                HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ToolTip="Final Transfer Details" Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="20%" HeaderText="Asset code" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="20%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetcode" runat="server" Text='<%#Eval("Assetcode")%>' ToolTip="Asset code" Visible="false" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Eval("AssetDesc")%>' ToolTip="Asset Desc" Width="100%"></asp:Label>
                                                                                            <asp:Label ID="lblGroupCode" runat="server" Text='<%#Eval("GROUP_CODE")%>' ToolTip="Asset Group" Width="100%" Visible="false"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Asset Number" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblAssetNumber" runat="server" Style="text-align: left" Text='<%#Eval("AssetNumber")%>' ToolTip="Amount" Width="100%"></asp:Label>

                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Operating Branch" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblLocationID" runat="server" Style="text-align: left" Text='<%#Eval("OPER_LOCATION_ID")%>' Visible="false" ToolTip="Amount"></asp:Label>
                                                                                            <asp:Label ID="lblLocation" runat="server" Style="text-align: left" Text='<%#Eval("OPER_LOCATION")%>' ToolTip="Amount"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="Operating User" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblUserID" runat="server" Style="text-align: left" Text='<%#Eval("OPER_USER_ID")%>' Visible="false" ToolTip="Amount"></asp:Label>
                                                                                            <asp:Label ID="lblUser" runat="server" Style="text-align: left" Text='<%#Eval("OPER_USER")%>' ToolTip="Amount"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="New Operating Branch" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblNewLocationID" runat="server" Style="text-align: left" Text='<%#Eval("New_OPER_LOCATION_ID")%>' Visible="false" ToolTip="New Operating Location"></asp:Label>
                                                                                            <asp:Label ID="lblNewLocation" runat="server" Style="text-align: left" Text='<%#Eval("New_OPER_LOCATION")%>' ToolTip="New Operating Location"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField FooterStyle-Width="15%" HeaderText="New Operating User" ItemStyle-Width="15%">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblNewUserID" runat="server" Style="text-align: left" Text='<%#Eval("New_OPER_USER_ID")%>' Visible="false" ToolTip="User"></asp:Label>
                                                                                            <asp:Label ID="lblNewUser" runat="server" Style="text-align: left" Text='<%#Eval("New_OPER_USER")%>' ToolTip="User"></asp:Label>
                                                                                        </ItemTemplate>

                                                                                    </asp:TemplateField>


                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </asp:Panel>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>





                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </ContentTemplate>

                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Other details" ID="tpOtherdetails" CssClass="tabpan"
                                BackColor="Red">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upOtherdetails" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="Panel1" runat="server" ToolTip="Others Details" GroupingText="Others Details"
                                                        CssClass="stylePanel" Width="99%">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ToolTip="Others Details" ShowFooter="true" ID="grvInvoiceDetails"
                                                                Width="100%" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader"
                                                                FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False" OnRowCommand="grvInvoiceDetails_RowCommand"
                                                                OnRowDeleting="grvInvoiceDetails_RowDeleting" OnRowDataBound="grvInvoiceDetails_RowDataBound" CssClass="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Invoice Number" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblInvoice_number" ToolTip="Invoice number" Text='<%#Eval("Invoice_number")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtInvoice_number" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    runat="server" MaxLength="20"></asp:TextBox>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtInvoice_number" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="txtInvoice_number" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Invoice Number"
                                                                                        CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Invoice date" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblInvoice_date" ToolTip="Funder Name" Text='<%#Eval("Invoice_date")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtInvoice_date" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtInvoice_date"
                                                                                    PopupButtonID="txtInvoice_date"
                                                                                    ID="CEtxtInvoice_date" Enabled="True" />
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtInvoice_Date" runat="server" Display="Dynamic"
                                                                                        ControlToValidate="txtInvoice_date" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Invoice Date"
                                                                                        CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                                                </div>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="GRN No" ItemStyle-HorizontalAlign="Left"
                                                                        ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDelivery_number" ToolTip="GRN No" Text='<%#Eval("Delivery_number")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtDelivery_number" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                            <%--<UC:Suggest ID="ddlLPONo" runat="server" ServiceMethod="GetLPONo" AutoPostBack="true" OnItem_Selected="ddlLPONo_OnItem_Selected" ItemToValidate="Value" ValidationGroup="InvoiceAdd" IsMandatory="true" ErrorMessage="Select Delivery No" />--%>
                                                                            <%--<asp:RequiredFieldValidator ID="rfvtxtDelivery_number" runat="server" Display="None"
                                                                        ControlToValidate="txtDelivery_number" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Delivery Number"
                                                                        CssClass="styleMandatoryLabel" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="GRN date" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                        FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDelivery_date" ToolTip="GRN date" Text='<%#Eval("Delivery_date")%>'
                                                                                Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtDelivery_date" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                                                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDelivery_date"
                                                                                    PopupButtonID="txtDelivery_date"
                                                                                    ID="CEtxtDelivery_date" Enabled="True" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Delivery Address" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtDelivery_Address" ReadOnly="true" ToolTip="Delivery Address" TextMode="MultiLine"
                                                                                Rows="2" Width="225px" MaxLength="200" onkeyup="maxlengthfortxt(200);" runat="server"
                                                                                Wrap="true" Text='<%#Eval("Delivery_Address")%>'></asp:TextBox>
                                                                            <%--<asp:Label ID="lblLPOAmt" Text='<%#Eval("LPO_AMT")%>'
                                                                        Width="100%" runat="server" Visible="false"></asp:Label>--%>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtDelivery_Address" TextMode="MultiLine" Rows="2" class="md-form-control form-control login_form_content_input requires_true lowercase"
                                                                                    MaxLength="200" onkeyup="maxlengthfortxt(200);" runat="server" Wrap="true"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                                <%--<asp:TextBox ID="txtLPOAmt" Width="95%" runat="server" Visible="false"></asp:TextBox>--%>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Terms" ItemStyle-Width="25%" FooterStyle-Width="25%">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtTerms" ToolTip="Terms" TextMode="MultiLine" Rows="2" Width="225px" ReadOnly="true"
                                                                                MaxLength="500" onkeyup="maxlengthfortxt(500);" runat="server" Wrap="true" Text='<%#Eval("Terms")%>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtTerms" TextMode="MultiLine" Rows="2" MaxLength="500" class="md-form-control form-control login_form_content_input requires_true lowercase"
                                                                                    onkeyup="maxlengthfortxt(500);" runat="server" Wrap="true"></asp:TextBox><%--onkeyup="maxlengthfortxt(60);"--%>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                        <ItemTemplate>

                                                                            <asp:Button ID="lnkRemove" ToolTip="Remove from the grid,Alt+R" runat="server" CommandName="Delete" CssClass="grid_btn_delete"
                                                                                CausesValidation="false" Text="Remove" AccessKey="R"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>

                                                                            <button class="grid_btn" id="lnkAdd" validationgroup="InvoiceAdd" title="Alt+w" accesskey="w" runat="server" onserverclick="lnkAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>

                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>





                                </ContentTemplate>





                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="SJV details" ID="tpSJVdetails" CssClass="tabpan"
                                BackColor="Red">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="upSJVdetails" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="Panel2" runat="server" ToolTip="SJV Details" GroupingText="SJV Details"
                                                        CssClass="stylePanel" Width="99%">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ToolTip="Sys JV Details" ID="grvSysJV" Width="70%" RowStyle-HorizontalAlign="Center"
                                                                HeaderStyle-CssClass="styleGridHeader" AutoGenerateColumns="False" CssClass="gird_details">
                                                                <Columns>
                                                                    <asp:BoundField DataField="JV_Date" HeaderText="SJV Date" ShowHeader="true" />
                                                                    <asp:BoundField DataField="GL_Desc" HeaderText="Account Description" ShowHeader="true" />
                                                                    <asp:BoundField DataField="SL_Desc" HeaderText="Sub Account Description" ShowHeader="true" />
                                                                    <asp:BoundField DataField="Debit" HeaderText="Debit" ShowHeader="true" ItemStyle-HorizontalAlign="Right" />
                                                                    <asp:BoundField DataField="Credit" HeaderText="Credit" ShowHeader="true" ItemStyle-HorizontalAlign="Right" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                            <div align="right">
                                                <asp:Button runat="server" ID="btnExcel" Text="Export Excel" ToolTip="Export Excel"
                                                    CausesValidation="false" CssClass="styleSubmitButton" OnClick="btnExcel_Click"
                                                    Visible="false" />
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnExcel" />
                                        </Triggers>
                                    </asp:UpdatePanel>





                                </ContentTemplate>





                            </cc1:TabPanel>
                        </cc1:TabContainer>

                    </div>
                </div>

                <div class="btn_height"></div>
                <div align="right">
                    <asp:HiddenField ID="hdndocexists" runat="server" />

                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" onserverclick="btnSave_Click" runat="server"
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
                    <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+i]" causesvalidation="false" onserverclick="btnPrint_ServerClick" runat="server"
                        type="button" accesskey="i">
                        <i class="fa fa-print" aria-hidden="true"></i>&emsp;Pr<u>i</u>nt
                    </button>

                    <button class="css_btn_enabled" id="btnCancelTrans" title="Asset Cancel[Alt+C]" onclick="if(fnConfirmCancelDI())" causesvalidation="false" onserverclick="btnCancelTrans_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;Asset <u>C</u>ancel
                    </button>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />



        </Triggers>
    </asp:UpdatePanel>


    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:Label ID="lblCoproView" runat="server" Style="display: none;"></asp:Label>
            <cc1:ModalPopupExtender ID="mpecheque" runat="server" TargetControlID="lblCoproView"
                PopupControlID="pnlDimension1" BackgroundCssClass="styleModalBackground" DropShadow="false" />

            <div runat="server" id="dvProView" style="width: 75%;">
                <asp:Panel ID="pnlDimension1" runat="server" Width="40%" CssClass="stylePanel"
                    GroupingText="Asset Number Details" Style="overflow: hidden;" BackColor="White"
                    BorderColor="WhiteSmoke">
                    <asp:UpdatePanel ID="updPnlOTHBreakup" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div id="divassetnumber" runat="server" style="overflow: auto; height: 300px;">
                                        <div class="gird">
                                            <asp:GridView ID="grvInnerGridF" runat="server" AutoGenerateColumns="false" ShowFooter="false"
                                                OnRowDataBound="grvInnerGridF_RowDataBound" CssClass="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No." Visible="true">
                                                        <ItemTemplate>

                                                            <asp:Label ID="lblSerialNo" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>

                                                            <asp:Label ID="lblrowID" Visible="false" runat="server" Text='<%#Bind("sl_no")%>'></asp:Label>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Asset Number" ItemStyle-HorizontalAlign="Left">

                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtAssetNumber" runat="server" MaxLength="20" Text='<%#Bind("AssetNumber")%>'
                                                                    class="md-form-control form-control login_form_content_input" ReadOnly="true"></asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="FTEtxtAssetNumber" FilterType="UppercaseLetters,LowercaseLetters,Numbers,Custom"
                                                                    TargetControlID="txtAssetNumber" runat="server" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                            </div>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Operating Branch" ItemStyle-HorizontalAlign="Left">

                                                        <ItemTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddloperLocationF" runat="server" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                            </div>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Operating User" ItemStyle-HorizontalAlign="Left">

                                                        <ItemTemplate>
                                                            <%--<asp:UpdatePanel ID="updPnlOTHBreakup" runat="server">
                                                                    <ContentTemplate>--%>

                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddluserF1" runat="server" AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input"></asp:DropDownList>
                                                                <%-- <UC:Suggest ID="ddluserF" class="md-form-control form-control" runat="server" ServiceMethod="GetUserNameList" 
                                                                    ErrorMessage="Select Operating User" IsMandatory="true" AutoPostBack="true" ValidationGroup="VgAdd" OnItem_Selected="ddluserF_Item_Selected" />--%>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>

                                                            </div>
                                                            <%--</ContentTemplate>
                                                                 <Triggers>
                                                                     <asp:PostBackTrigger ControlID="ddluserF" />
                                                                 </Triggers>
                                                                 </asp:UpdatePanel>--%>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="center">
                                <div align="center">
                                    <button class="css_btn_enabled" id="btngridupdate" title="Update[Alt+O]" causesvalidation="false"
                                        onserverclick="btngridupdate_Click" runat="server"
                                        type="button" accesskey="o">
                                        <i class="fa fa-check" aria-hidden="true"></i>&emsp;<u>O</u>k
                                    </button>


                                </div>

                                <div align="center">
                                    <button class="css_btn_enabled" id="btnDimClose" title="Close[Alt+Shift+E]" causesvalidation="false"
                                        onserverclick="btnDimClose_Click" runat="server"
                                        type="button" accesskey="E">
                                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;Clos<u>e</u>
                                    </button>

                                </div>


                            </div>
                            </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </asp:Panel>



            </div>
        </div>
    </div>
    <div>
        <asp:Label runat="server" Text="" ID="lblErrorMessage" CssClass="styleDisplayLabel" />
    </div>



    <div>
        <asp:HiddenField ID="hdnIB" runat="server" />
        <asp:ValidationSummary ValidationGroup="Save" ID="vs_AssetTransaction" runat="server"
            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

        <asp:ValidationSummary ValidationGroup="AssetcodeAdd" ID="VSAssetcodeAdd" runat="server"
            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
        &nbsp;
                <asp:ValidationSummary ValidationGroup="InvoiceAdd" ID="VSInvoiceAdd" runat="server"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />

        <asp:CustomValidator ID="CVAssetTransaction" runat="server" CssClass="styleMandatoryLabel"
            Enabled="true" />
    </div>

    <script type="text/javascript" language="javascript">
        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_tcFunderTransaction');




            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {


                switch (index) {

                    case 0:
                        tab.set_activeTabIndex(newindex);
                        index = tab.get_activeTabIndex(index);
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


                }
            }
            else {
                tab.set_activeTabIndex(newindex);

                var TC = $find("<%=tcFunderTransaction.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlActivity.ClientID %>").focus();

                        }


                    }
                }

                var btnActive_index = 0;
                var index = 0;

                function pageLoad() {
                    debugger;
                    var TC = $find("<%=tcFunderTransaction.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlActivity.ClientID %>").focus();

            }

            tab = $find('ctl00_ContentPlaceHolder1_tcFunderTransaction');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;

            function on_Change(sender, e) {
                debugger;
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }

        }
        function checkValueDate_NextSystemDate(sender, args) {

            debugger;
            var today = new Date();
            var currentyear = today.getYear();
            var currentmonth = today.getMonth() + 1;


            if (currentmonth > 3) {
                pastvalidyear = currentyear;
                futurevalidyear = currentyear + 1;

            }
            else {
                pastvalidyear = currentyear - 1;
                futurevalidyear = currentyear;

            }
            if ((sender._selectedDate.getMonth() + 1) > currentmonth && (sender._selectedDate.getYear() == currentyear))//Future month date cannot be selected
            {
                alert('You cannot select a date greater than the current month end and lesser than the current year');
                sender._textbox.set_Value(today.format(sender._format));
                return;
            }
            if (sender._selectedDate.getYear() == pastvalidyear || sender._selectedDate.getYear() == futurevalidyear) {
                if (sender._selectedDate.getYear() == futurevalidyear && (sender._selectedDate.getMonth() + 1) > 3) {
                    alert('You cannot select a date greater than the current month end and lesser than the current year');
                    sender._textbox.set_Value(today.format(sender._format));
                    return;
                }
                if (sender._selectedDate.getYear() == pastvalidyear && (sender._selectedDate.getMonth() + 1) <= 3) {
                    alert('You cannot select a date greater than the current month end and lesser than the current year');
                    sender._textbox.set_Value(today.format(sender._format));
                    return;
                }
            }
            else {
                alert('You cannot select a date greater than the current month end and lesser than the current year');
                sender._textbox.set_Value(today.format(sender._format));
                return;

            }

        }

        function fnConfirmCancelDI() {

            if (confirm('Do you want to cancel Asset Transaction?')) {
                return true;
            }
            else
                return false;

        }


        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
        }



        function checkDate_NextSystemDate1(sender, args) {
            var today = new Date();
            if (sender._selectedDate > today) {

                //alert('You cannot select a date greater than system date');
                alert('Value Date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));

            }
            document.getElementById(sender._textbox._element.id).focus();

        }

    </script>
</asp:Content>
