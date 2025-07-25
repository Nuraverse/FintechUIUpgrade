<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FADebitCreditNote_Add, App_Web_sravfnz4" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components"
    TagPrefix="cc2" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"
    TagPrefix="cc1" %>

<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="LOV" TagPrefix="uc2" %>

<%@ Register Src="~/UserControls/FAAddressDetail.ascx"
    TagName="FAAddressDetail" TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Debit Credit Note" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                        </div>
                    </div>

                    <div class="row">
                        <div style="display: none" class="col">

                            <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                            <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                        </div>
                    </div>



                    <cc1:TabContainer ID="TCDebitCreditNote" runat="server"
                        CssClass="styleTabPanel" Width="100%" ScrollBars="None"
                        ActiveTabIndex="0">
                        <cc1:TabPanel runat="server" ID="TPDebitCreditNote"
                            CssClass="tabpan" BackColor="Red">
                            <HeaderTemplate>
                                Debit-Credit Note
                            </HeaderTemplate>
                            <ContentTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                    <asp:Panel ID="pnlDebitCreditnote" runat="server" GroupingText="Debit-Credit Note"
                                                        CssClass="stylePanel">
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
                                                                    <asp:TextBox ID="txtDocNumber" runat="server" onmouseover="txt_MouseoverTooltip(this)" class="md-form-control form-control login_form_content_input requires_true" ReadOnly="true" ToolTip="Doc Number">
                                                                    </asp:TextBox>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Doc Number" ID="lblDocNumber"
                                                                            CssClass="styleReqFieldLabel">
                                                                        </asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                                                    <div class="validation_msg_box">

                                                                        <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server" CssClass="validation_msg_box_sapn"
                                                                            ValidationGroup="Main" ControlToValidate="ddlLocation"
                                                                            ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>



                                                                    <label>
                                                                        <asp:Label runat="server" Text="Branch" ID="lblLocation"
                                                                            CssClass="styleReqFieldLabel">
                                                                        </asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDate" runat="server" onmouseover="txt_MouseoverTooltip(this)" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" OnTextChanged="txtDate_OnTextChanged"
                                                                        ToolTip="Date">
                                                                    </asp:TextBox>
                                                                    <%--<asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                                        PopupButtonID="imgDate" ID="CEDate" Enabled="True">
                                                                    </cc1:CalendarExtender>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvDate" runat="server"
                                                                            ControlToValidate="txtDate" CssClass="validation_msg_box_sapn"
                                                                            ErrorMessage="Select Doc Date" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="Main" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Doc Date" ID="lblDate"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>


                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlDocType" runat="server" ToolTip="Doc Type" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDocType_SelectedIndexChanged"
                                                                        onmouseover="ddl_itemchanged(this)">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvDocType" runat="server"
                                                                            ControlToValidate="ddlDocType" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                            ErrorMessage="Select Doc Type" Display="Dynamic" SetFocusOnError="True"
                                                                            ValidationGroup="Main" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Doc Type" ID="lblDocType"
                                                                            CssClass="styleReqFieldLabel">
                                                                        </asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtNoteStatus" runat="server" onmouseover="txt_MouseoverTooltip(this)" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"
                                                                        ToolTip="Note Status"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Note Status" ID="lblNoteStatus"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlEntityType" runat="server" class="md-form-control form-control"
                                                                        ToolTip="EntityType" AutoPostBack="true" OnSelectedIndexChanged="ddlEntityType_SelectedIndexChanged"
                                                                        onmouseover="ddl_itemchanged(this)">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvEntityType" runat="server"
                                                                            ControlToValidate="ddlEntityType" InitialValue="0"
                                                                            ErrorMessage="Select Entity Type" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" ValidationGroup="Main" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Entity Type" ID="lblEntityType"
                                                                            CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCode" onmouseover="txt_MouseoverTooltip(this)" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                        Style="display: none;" MaxLength="50" ContentEditable="false"></asp:TextBox>
                                                                    <uc2:LOV ID="ucLov" onblur="fnLoadEntity()" runat="server" strLOV_Code="FAENT" AutoPostBack="true" HoverMenuExtenderLeft="true" ServiceMethod="GetEntityFunder" ShowHideAddressImageButton="false" DispalyContent="Name" OnItem_Selected="ucLov_Item_Selected" />
                                                                    <asp:Button ID="btnCreateCustomer" runat="server" UseSubmitBehavior="false" Text="Create"
                                                                        Style="display: none;" OnClick="btnCreateCustomer_Click" CssClass="styleSubmitShortButton"
                                                                        CausesValidation="false" />
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ControlToValidate="txtCode" ErrorMessage="Select Entity" InitialValue="0"
                                                                            ValidationGroup="Main"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Code" Text="Entity code"
                                                                            ID="Label2" CssClass="styleMandatoryLabel"></asp:Label>

                                                                    </label>

                                                                    <asp:Label runat="server" ID="lblfunderdate" Visible="false"
                                                                        Text="Funder Date"></asp:Label>

                                                                    <asp:TextBox ID="txtfunderdate" runat="server" Visible="false"
                                                                        ToolTip="Funderdate" />
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
                                                                    <asp:TextBox ID="txtDocAmount" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"
                                                                        onmouseover="txt_MouseoverTooltip(this)" ToolTip="Doc Amount"
                                                                        ReadOnly="true">
                                                                    </asp:TextBox>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator ID="rfvdocamount" runat="server"
                                                                            ControlToValidate="txtDocAmount" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                            ErrorMessage="Enter Document Amount" Display="None"
                                                                            SetFocusOnError="True" ValidationGroup="Main" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Doc Amount" ID="lblDocAmount"
                                                                            CssClass="styleReqFieldLabel">
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>




                                                        </div>



                                                        </label>



                                                    </asp:Panel>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Panel ID="PanelGLSLDetails" ToolTip="Account Details"
                                                        Width="99   %" runat="server" GroupingText="Account Details"
                                                        CssClass="stylePanel">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ShowFooter="true" ID="grvGLSLDetails"
                                                                Width="100%" ToolTip="Account Details" Visible="true"
                                                                OnRowDataBound="grvGLSLDetails_RowDataBound" OnRowCommand="grvGLSLDetails_RowCommand"
                                                                OnRowDeleting="grvGLSLDetails_RowDeleting" RowStyle-HorizontalAlign="Center"
                                                                HeaderStyle-CssClass="styleGridHeader" FooterStyle-HorizontalAlign="Center"
                                                                AutoGenerateColumns="False" CssClass="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No" Visible="true">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSerialNo" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                                            <asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Tran_Details_ID") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLocations" runat="server" Text='<%# Bind("LOCATION") %>' ToolTip="Branch" />
                                                                            <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                            <asp:Label ID="lblLocationID" runat="server" Text='<%# Bind("Location_ID") %>' ToolTip="Branch ID" Visible="false" />
                                                                        </ItemTemplate>

                                                                        <FooterTemplate>

                                                                            <%-- <UC:Suggest ID="ddlLocation" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" ItemToValidate="Value"
                                                                        WatermarkText="--Select--" ErrorMessage="Select Branch" />--%>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlLocation" AutoPostBack="true" Width="100Px" CssClass="md-form-control form-control" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">

                                                                                    <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="vgAdd" ControlToValidate="ddlLocation" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>

                                                                            </div>
                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Activity" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("Activity")%>' ID="lblActivity" ToolTip="Activity" Width="200px"></asp:Label>
                                                                            <asp:HiddenField ID="hdnActivityId" runat="server" Value='<%#Eval("Activity_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>

                                                                            <div class="md-input" style="margin: 0px;">

                                                                                <asp:DropDownList ID="ddlActivityF"
                                                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server" Width="200px">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">

                                                                                    <asp:RequiredFieldValidator ID="rfvActivity" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="vgAdd" ControlToValidate="ddlActivityF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Activity" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>


                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Ref Doc Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" Text='<%#Eval("DocType")%>' ID="lblDocType" ToolTip="DocType" Width="100Px"></asp:Label>
                                                                            <asp:HiddenField ID="hdnDoctypeId" runat="server" Value='<%#Eval("DocType_ID") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>

                                                                            <div class="md-input" style="margin: 0px;">

                                                                                <asp:DropDownList ID="ddlDoctypeF" Width="100Px" OnSelectedIndexChanged="ddlDoctypeF_SelectedIndexChanged"
                                                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>

                                                                            </div>


                                                                        </FooterTemplate>

                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Ref Doc No">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblexpenseID" runat="server" Text='<%# Bind("Expense_booking_ID") %>' ToolTip="Expense Booking ID" Visible="false" />
                                                                            <%--<asp:Label ID="lblAssetId" runat="server" Text='<%# Bind("Asset_Id") %>' ToolTip="Asset Id" Visible="false" />--%>
                                                                            <asp:Label ID="lblExpenseBooking" runat="server" Text='<%# Bind("Expense_No") %>' ToolTip="Expense No" Width="200px" />
                                                                        </ItemTemplate>

                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlExpense" runat="server" class="md-form-control form-control" AutoPostBack="true" IsMandatory="false"
                                                                                    ServiceMethod="GetInvoiceNumber" ErrorMessage="Select Ref Doc No" ValidationGroup="vgAdd"
                                                                                    OnItem_Selected="ddlExpense_Item_Selected" Width="200px" isman />
                                                                            </div>

                                                                        </FooterTemplate>
                                                                        <ItemStyle Width="15%" />
                                                                        <FooterStyle Width="15%" />
                                                                    </asp:TemplateField>


                                                                    <asp:TemplateField HeaderText="Bill Type">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblbillType" runat="server" Text='<%# Bind("Bill_Type") %>' Width="100Px" ToolTip="Bill Type" />

                                                                        </ItemTemplate>

                                                                        <FooterTemplate>

                                                                            <asp:Label ID="lblbillTypefooter" runat="server" ToolTip="Bill Type" Width="100Px" />


                                                                        </FooterTemplate>


                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Ref Doc Bal. Amt.">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPBJAmount" runat="server" Text='<%# Bind("PBJ_Amount") %>' Width="100Px" ToolTip="Bill Type" />

                                                                        </ItemTemplate>

                                                                        <FooterTemplate>

                                                                            <asp:Label ID="llblPBJAmountfooter" runat="server" ToolTip="Bill Type" Width="100Px" />


                                                                        </FooterTemplate>


                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Debit Amount" Visible="false">


                                                                        <FooterTemplate>

                                                                            <asp:Label ID="llblPBJDebitAmountfooter" runat="server" ToolTip="Bill Type" Width="100Px" />


                                                                        </FooterTemplate>


                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="GL Account">
                                                                        <ItemTemplate>

                                                                            <asp:Label ID="lblGLAccountI" ToolTip="GL Account"
                                                                                Width="200px" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                                            <asp:HiddenField ID="hdn_AccNature" runat="server" Value='<%#Eval("Acc_Nature") %>' />
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:DropDownList ID="ddlGLCodeEdit" runat="server" Width="200px"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlGLCodeEdit_OnSelectedIndexChanged"
                                                                                onmouseover="ddl_itemchanged(this)">
                                                                            </asp:DropDownList>
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>


                                                                            <%--    <asp:DropDownList ID="ddlFooterGLAccount" ToolTip="GL Account"
                                                                                    runat="server" OnSelectedIndexChanged="ddlFooterGLAccount_OnSelectedIndexChanged"
                                                                                    AutoPostBack="true" onmouseover="ddl_itemchanged(this)">
                                                                                </asp:DropDownList>--%>
                                                                            <%--<cc1:ComboBox ID="ddlFooterGLAccount" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFooterGLAccount_OnSelectedIndexChanged"
                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                </cc1:ComboBox>
                                                                                    <asp:RequiredFieldValidator ID="rfvfooterGLAccount" runat="server" ControlToValidate="ddlFooterGLAccount"
                                                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" InitialValue="--Select--" ValidationGroup="vgAdd"
                                                                            ErrorMessage="Select GL Account"></asp:RequiredFieldValidator>
                                                                               
                                                                            --%>

                                                                            <div class="md-input" style="margin: 10px;">
                                                                                <UC:Suggest ID="ddlFooterGLAccount" runat="server" class="md-form-control form-control" IsMandatory="true" AutoPostBack="true" Width="200px"
                                                                                    ServiceMethod="GetGlCodeList" OnItem_Selected="ddlFooterGLAccount_OnSelectedIndexChanged" ErrorMessage="Select GL Account" ValidationGroup="vgAdd" />
                                                                                <asp:HiddenField ID="hdn_AccountLeg" runat="server" />
                                                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                                                <asp:HiddenField ID="hdn_AccNature" runat="server" />
                                                                                <asp:HiddenField ID="hdnglcode" runat="server" />

                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="SL Account" FooterStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSubAccountI" ToolTip="Sub Account"
                                                                                Width="200px" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:DropDownList ID="ddlSLCodeEdit" onmouseover="ddl_itemchanged(this)" Width="200px"
                                                                                runat="server">
                                                                            </asp:DropDownList>
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>

                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlFooterSubAccount" runat="server" class="md-form-control form-control" IsMandatory="false" ServiceMethod="GetSLCodeList"
                                                                                    ErrorMessage="Select SL Account" AutoPostBack="true" ValidationGroup="vgAdd" Width="200px" />
                                                                            </div>

                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right"
                                                                        HeaderText="Amount" FooterStyle-Width="10%" ItemStyle-Width="10%">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" ToolTip="Amount" Style="text-align: right" Width="150px"
                                                                                runat="server" Text='<%#Eval("Amount")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txtTargetAmount" Text='<%#Bind("Amount") %>'
                                                                                runat="server" MaxLength="20" onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;"
                                                                                ToolTip="Target Amount" onkeypress="fnAllowNumbersOnly(true,false,this)">
                                                                            </asp:TextBox>

                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <%-- <asp:Label ID="lblTotDue" runat="server" Text='<%#Eval("TotDue") %>' />--%>

                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFooterAmount" ToolTip="Amount" MaxLength="15" class="md-form-control form-control login_form_content_input requires_true" Width="150px"
                                                                                    runat="server" Style="text-align: right" onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox><asp:Label
                                                                                        ID="lblFooterActualAmount" runat="server"
                                                                                        Visible="false"></asp:Label>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1Hdr" runat="server" TargetControlID="txtFooterAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                                        ErrorMessage="Enter the Amount"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <FooterStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="left"
                                                                        HeaderText="Narration" FooterStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="lblNarration" ToolTip="Narration" Width="250px" Height="50px" TextMode="MultiLine" ReadOnly="true"
                                                                                runat="server" Text='<%#Eval("Narration")%>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txtTargetNarration" onmouseover="txt_MouseoverTooltip(this)" TextMode="MultiLine" Text='<%#Bind("Narration")%>'
                                                                                runat="server" MaxLength="100" Style="text-align: left;" Width="260px" Height="50px"
                                                                                ToolTip="Narration" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFooterNarration" ToolTip="Narration" onmouseover="txt_MouseoverTooltip(this)"
                                                                                    runat="server" MaxLength="100" Style="text-align: left" Width="260px" Height="50px" onkeyup="maxlengthfortxt(100);" TextMode="MultiLine"></asp:TextBox>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtFooterNarration" runat="server" ControlToValidate="txtFooterNarration"
                                                                                        CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgAdd"
                                                                                        ErrorMessage="Enter the Narration"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                            <headerstyle cssclass="styleGridHeader" />
                                                                            <itemstyle horizontalalign="Left" />
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
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlProductServices" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="vgAdd" ControlToValidate="ddlProductServicesF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <%--<UC:Suggest ID="ddlLocationF" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true" OnItem_Selected="ddlLocation_SelectedIndexChangedF" IsMandatory="true" WatermarkText="--Select--" ValidationGroup="VgAdd" ErrorMessage="Select Location" />--%>
                                                                                <asp:DropDownList ID="ddlProductServicesE" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" runat="server"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlProductServicesE_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlProductServicesE" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="btnadd" ControlToValidate="ddlProductServicesE" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                                <asp:HiddenField ID="hdnProductServicesE" Value='<%#Eval("ProductService_ID") %>' runat="server" />
                                                                            </div>
                                                                        </EditItemTemplate>
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
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlTaxTypeF" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="vgAdd" ControlToValidate="ddlTaxTypeF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlTaxTypeE" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true"
                                                                                    runat="server" OnSelectedIndexChanged="ddlTaxTypeE_SelectedIndexChanged">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlTaxTypeE" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="btnadd" ControlToValidate="ddlTaxTypeE" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Tax Type" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                                                                                </div>
                                                                                <asp:HiddenField ID="hdnTaxTypeE" Value='<%#Eval("TaxType_ID") %>' runat="server" />
                                                                            </div>
                                                                        </EditItemTemplate>
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
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlITCApplicabilityF" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="vgAdd" ControlToValidate="ddlITCApplicabilityF" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlITCApplicabilityE" Width="90px"
                                                                                    CssClass="md-form-control form-control login_form_content_input" AutoPostBack="true" runat="server">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvddlITCApplicabilityE" SetFocusOnError="True" runat="server"
                                                                                        ValidationGroup="btnadd" ControlToValidate="ddlITCApplicabilityE" CssClass="validation_msg_box_sapn"
                                                                                        ErrorMessage="Select Product/Services" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>

                                                                                </div>
                                                                                <asp:HiddenField ID="hdnITCApplicability_IDE" Value='<%#Eval("ITCApplicability_ID") %>' runat="server" />
                                                                            </div>
                                                                        </EditItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Taxable Amount(Excl. VAT)" ItemStyle-HorizontalAlign="Right" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount1" runat="server" Width="90px" Style="text-align: right" ToolTip="Amount" Text='<%#Eval("AMOUNT")%>'></asp:Label>
                                                                            <asp:Label ID="txtAmountL" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtamtF" runat="server" Width="90px" ReadOnly="true" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtamtE" runat="server" Width="90px" ReadOnly="true" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                            <asp:HiddenField ID="hdnAMOUNT" runat="server" Value='<%#Eval("AMOUNT") %>' />
                                                                        </EditItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Tax Rate" ItemStyle-HorizontalAlign="Right" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                            <asp:Label ID="txtTAXPERCENTAGE" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="lblTAXPERCENTAGE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXPERCENTAGE")%>'></asp:Label>
                                                                        </EditItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="VAT Amount" ItemStyle-HorizontalAlign="Right" >
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNT" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                            <asp:Label ID="txtTAXAMOUNT" runat="server" Visible="false"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNTF" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Amount" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="lblTAXAMOUNTE" runat="server" Width="90px" Style="text-align: right" ToolTip="Tax Rate" Text='<%#Eval("TAXAMOUNT")%>'></asp:Label>
                                                                        </EditItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Total Amount"  HeaderStyle-Width="15%" FooterStyle-Width="15%"
                                                                        ItemStyle-Width="15%">
                                                                        <ItemTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                 <asp:Label ID="lblTotAmount" runat="server" Text='<%#Eval("TotalAmount")%>' ></asp:Label>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="DIM1" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                            <asp:Label runat="server" Text='<%#Eval("DIM1_Desc")%>' ID="lblDDIM1" ToolTip="DIM1"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:DropDownList ID="TddlDim1" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                            <asp:HiddenField ID="hdn_Dim1" runat="server" Value="" />
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:DropDownList ID="TddlDim1" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                            <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="DIM2" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />
                                                                            <asp:Label runat="server" Text='<%#Eval("DIM2_Desc")%>' ID="lblDDIM2" ToolTip="DIM2"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value="" />
                                                                            <asp:DropDownList ID="TddlDim2" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />
                                                                            <asp:DropDownList ID="TddlDim2" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                        </EditItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <asp:Label ID="lblDIM" runat="server" Text="DIM" Visible="false" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM1"
                                                                                ToolTip="Show DIM" Visible="false" />
                                                                            <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                OnClick="lnk_Click1" ToolTip="Hide DIM" />
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM1"
                                                                                ToolTip="Show DIM" Visible="false" />
                                                                            <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                OnClick="lnk_Click1" ToolTip="Hide DIM" />
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:ImageButton ID="imgbtn1" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM1"
                                                                                ToolTip="Show DIM" Visible="false" />
                                                                            <asp:ImageButton ID="img1" src="../Images/Dimm2.jpg" Visible="false" runat="server"
                                                                                OnClick="lnk_Click1" ToolTip="Hide DIM" />
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dimension" Visible="false">
                                                                        <ItemTemplate>
                                                                            <center>
                                                                                <asp:ImageButton ID="imgbtn" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM"
                                                                                    ToolTip="Show DIM" />
                                                                                <%--  <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />--%>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <b>
                                                                                                <asp:Label ID="lbldim1" Text="DIM1" runat="server" Visible="false" />
                                                                                            </b>
                                                                                        </td>
                                                                                        <td>
                                                                                            <b>
                                                                                                <asp:Label ID="lbldim2" Text="DIM2" runat="server" Visible="false" />
                                                                                            </b>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlDim1" Width="130px" runat="server" Visible="false" />
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlDim2" Width="130px" runat="server" Visible="false" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:ImageButton ID="img" src="../Images/uparrow_03.png" Visible="false" runat="server"
                                                                                    OnClick="lnk_Click" ToolTip="Hide DIM" />
                                                                                <asp:LinkButton ID="lnk" Text="OK" runat="server" OnClick="lnk_Click" Visible="false" />
                                                                            </center>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <center>
                                                                                <asp:ImageButton ID="imgbtn" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM"
                                                                                    ToolTip="Show DIM" />
                                                                                <%-- <asp:HiddenField ID="hdn_Dim1" runat="server" Value='<%#Eval("DIM1") %>' />
                                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" Value='<%#Eval("DIM2") %>' />--%>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <b>
                                                                                                <asp:Label ID="lbldim1" Text="DIM1" runat="server" Visible="false" />
                                                                                            </b>
                                                                                        </td>
                                                                                        <td>
                                                                                            <b>
                                                                                                <asp:Label ID="lbldim2" Text="DIM2" runat="server" Visible="false" />
                                                                                            </b>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlDim1" Width="130px" runat="server" Visible="false" AutoPostBack="true"
                                                                                                OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged" />
                                                                                            <%--<asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim1" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim1" InitialValue="0" ErrorMessage="Select DIM1"
                                                            ValidationGroup="VgUpdate" Display="None">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlDim2" Width="130px" runat="server" Visible="false" AutoPostBack="true"
                                                                                                OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                                            <%--<asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim2" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim2" InitialValue="0" ErrorMessage="Select DIM2"
                                                            ValidationGroup="VgUpdate" Display="None">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:ImageButton ID="img" src="../Images/uparrow_03.png" Visible="false" runat="server"
                                                                                    OnClick="lnk_Click" ToolTip="Hide DIM" />
                                                                                <asp:LinkButton ID="lnk" Text="OK" runat="server" OnClick="lnk_Click" Visible="false" />
                                                                            </center>
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <br />
                                                                            <center>
                                                                                <%-- <asp:HiddenField ID="hdn_Dim1" runat="server" />
                                                                                            <asp:HiddenField ID="hdn_Dim2" runat="server" />--%>
                                                                                <asp:ImageButton ID="imgbtn" src="../Images/Dimm2.JPG" runat="server" OnClick="Show_DIM"
                                                                                    ToolTip="Show DIM" />
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <b>
                                                                                                <asp:Label ID="lbldim1" Text="DIM1" runat="server" Visible="false" />
                                                                                            </b>
                                                                                        </td>
                                                                                        <td>
                                                                                            <b>
                                                                                                <asp:Label ID="lbldim2" Text="DIM2" runat="server" Visible="false" />
                                                                                            </b>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlDim1" runat="server" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged"
                                                                                                Visible="false" />
                                                                                            <%--<asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim1" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim1" InitialValue="0" ErrorMessage="Select DIM1"
                                                            ValidationGroup="VgAdd" Display="None">
                                                        </asp:RequiredFieldValidator>--%>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="ddlDim2" runat="server" Width="130px" Visible="false" AutoPostBack="true"
                                                                                                OnSelectedIndexChanged="ddlDim2_SelectedIndexChanged" />
                                                                                            <%-- <asp:RequiredFieldValidator SetFocusOnError="true" ID="rfvDim2" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="ddlDim2" InitialValue="0" ErrorMessage="Select DIM2"
                                                            ValidationGroup="VgAdd" Display="None"></asp:RequiredFieldValidator> --%>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:ImageButton ID="img" src="../Images/uparrow_03.png" Visible="false" runat="server"
                                                                                    OnClick="lnk_Click" ToolTip="Hide DIM" />
                                                                                <asp:LinkButton ID="lnk" Text="OK" runat="server" OnClick="lnk_Click" Visible="false" />
                                                                            </center>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Action">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkRemove" runat="server" Text="Delete" ToolTip="Delete,Alt+R" AccessKey="R" CssClass="grid_btn_delete"
                                                                                CommandName="Delete" OnClientClick="return confirm('Are you sure want to delete?');"
                                                                                CausesValidation="false"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update"
                                                                                CommandName="Update" CausesValidation="false" /><asp:LinkButton
                                                                                    ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                    CausesValidation="false" />
                                                                        </EditItemTemplate>
                                                                        <FooterTemplate>
                                                                            <button class="grid_btn" id="lnkAdd" validationgroup="vgAdd" title="Alt+A" accesskey="A" runat="server" onserverclick="lnkAdd_ServerClick"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                            </div>

                                            <div class="btn_height"></div>
                                            <div align="right">
                                                <asp:HiddenField ID="hdndocexists" runat="server" />


                                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Main'))" causesvalidation="false" validationgroup="Main" onserverclick="btnSave_Click" runat="server"
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
                                                <button class="css_btn_enabled" id="btn_print" title="Print[Alt+i]" causesvalidation="false" visible="false" onserverclick="btn_print_Click" runat="server"
                                                    type="button" accesskey="i">
                                                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;Pr<u>i</u>nt
                                                </button>

                                                <button class="css_btn_enabled" id="btnCancelDCNote" title="DC Cancel[Alt+C]" onclick="if(fnCancelClick())" causesvalidation="false" onserverclick="btnCancelDCNote_ServerClick" runat="server"
                                                    type="button" accesskey="C">
                                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;DC <u>C</u>ancel
                                                </button>
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
                                                        <asp:GridView runat="server" ToolTip="Others Details" ShowFooter="true" ID="grvotherDetails"
                                                            Width="100%" RowStyle-HorizontalAlign="Center" HeaderStyle-CssClass="styleGridHeader" OnRowDeleting="grvotherDetails_RowDeleting" OnRowDataBound="grvotherDetails_RowDataBound"
                                                            FooterStyle-HorizontalAlign="Center" AutoGenerateColumns="False" CssClass="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Invoice Number" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10%"
                                                                    FooterStyle-Width="10%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblInvoice_number" ToolTip="Invoice number" Text='<%#Eval("Invoice_number")%>'
                                                                            Width="100%" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtInvoice_number" runat="server" MaxLength="20" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtInvoice_number" runat="server" Display="Dynamic"
                                                                                    ControlToValidate="txtInvoice_number" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Invoice Number"
                                                                                    CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                            </div>
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
                                                                            <asp:TextBox ID="txtInvoice_date" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtInvoice_date"
                                                                                PopupButtonID="txtInvoice_date"
                                                                                ID="CEtxtInvoice_date" Enabled="True" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtInvoice_Date" runat="server" Display="Dynamic"
                                                                                    ControlToValidate="txtInvoice_date" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Invoice Date"
                                                                                    CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Invoice Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                    FooterStyle-Width="10%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblother_amount" ToolTip="Funder Name" Text='<%#Eval("Invoice_Amount")%>'
                                                                            Style="text-align: right" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtOtheramount" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTTxtOtherAmount" runat="server" TargetControlID="txtOtheramount"
                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtotheramount" runat="server" Display="Dynamic"
                                                                                    ControlToValidate="txtOtheramount" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Invoice Amount"
                                                                                    CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                   <asp:TemplateField HeaderText="Credit Note Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%"
                                                                    FooterStyle-Width="10%">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblCreditNoteAmount" ToolTip="Credit Note Amount" Text='<%#Eval("Credit_Note_Amount")%>'
                                                                            Style="text-align: right" runat="server"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox ID="txtCreditNoteAmount" runat="server" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="FTTCreditNoteAmountt" runat="server" TargetControlID="txtCreditNoteAmount"
                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                            <div class="grid_validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvtxtCreditNoteAmount" runat="server" Display="Dynamic"
                                                                                    ControlToValidate="txtCreditNoteAmount" ValidationGroup="InvoiceAdd" ErrorMessage="Enter Credit Note Amount"
                                                                                    CssClass="validation_msg_box_sapn" SetFocusOnError="True"></asp:RequiredFieldValidator>

                                                                            </div>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%" FooterStyle-Width="10%">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="lnkRemove" ToolTip="Remove from the grid,Alt+U" runat="server" CommandName="Delete" AccessKey="U"
                                                                            CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"></asp:Button>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <button class="grid_btn" id="lnkAdd" validationgroup="InvoiceAdd" title="Alt+T" accesskey="T" runat="server" onserverclick="lnkAdd_ServerClick1"><i class="fa fa-plus" aria-hidden="true"></i>Add</button>

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

                        <cc1:TabPanel runat="server" HeaderText="Dimension" ID="tpDIM" CssClass="tabpan"
                            BackColor="Red" Visible="false">
                            <ContentTemplate>
                                <%-- <asp:UpdatePanel ID="upDIM" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>--%>
                                <asp:Panel ID="PnlDimension" runat="server" GroupingText="Dimension" CssClass="stylePanel">
                                    <table width="100%">
                                        <tr>
                                            <td class="styleReqFieldLabel" width="15%">
                                                <%--<span class="styleReqFieldLabel">Dimension1</span>--%>
                                                <asp:Label ID="lblHDIM1" runat="server" Text="Dimension1" />
                                            </td>
                                            <td class="styleFieldAlign" width="30%">
                                                <asp:DropDownList ID="ddlHeadDim1" runat="server" Width="170px" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlDim1_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hdn_HDIM1" runat="server" />
                                                <%--  <asp:Button ID="btn_HDIM1" Text="" runat="server" Style="display: none" OnClick="btnLocationChange_Click" />--%>
                                                <asp:RequiredFieldValidator ID="rfvHDIM1" runat="server" ControlToValidate="ddlHeadDim1"
                                                    InitialValue="0" Enabled="false" ErrorMessage="Select Dimension1" Display="None"
                                                    SetFocusOnError="True" ValidationGroup="Main" />
                                            </td>
                                            <td class="styleReqFieldLabel" width="15%">
                                                <%-- <span class="styleReqFieldLabel">Dimension2</span>--%>
                                                <asp:Label ID="lblHDIM2" runat="server" Text="Dimension2" />
                                            </td>
                                            <td class="styleFieldAlign" width="30%">
                                                <asp:DropDownList ID="ddlHeadDim2" Width="170px" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlHeadDim2_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:HiddenField ID="hdn_HDIM2" Value="" runat="server" />
                                                <asp:RequiredFieldValidator ID="rfvHDIM2" runat="server" ControlToValidate="ddlHeadDim2"
                                                    InitialValue="0" Enabled="false" ErrorMessage="Select Dimension2" Display="None"
                                                    SetFocusOnError="True" ValidationGroup="Main" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:HiddenField ID="hdn_DIM1_Type" runat="server" />
                                    <asp:HiddenField ID="hdn_DIM2_Type" runat="server" />
                                </asp:Panel>
                                <%-- </ContentTemplate>
                                                </asp:UpdatePanel>--%>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <div>
        <%-- <asp:ValidationSummary ID="vgAdd" runat="server" ValidationGroup="vgAdd"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                    ShowSummary="true" />--%>
        <%-- <asp:ValidationSummary ID="Main" runat="server" ValidationGroup="Main"
                    CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):"
                    ShowSummary="true" />--%>
        <asp:ValidationSummary ID="vsDCNote" runat="server" ShowSummary="true" Visible="false"
            CssClass="styleMandatoryLabel" ValidationGroup="Main" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" Visible="false"
            CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
            HeaderText="Correct the following validation(s):" />
    </div>

    <div>
        <asp:HiddenField ID="hdnIB" runat="server" />
        <asp:CustomValidator ID="cvNote" runat="server" Display="None"
            CssClass="styleMandatoryLabel" />

    </div>


    <script type="text/javascript" language="javascript">

        //Tab index code starts

        function fnMoveNextTab(Source_Invoker) {

            tab = $find('ctl00_ContentPlaceHolder1_TCDebitCreditNote');




            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;

            }
            else if (Source_Invoker == 'btnPrevTab') {
                if (btnActive_index != 0) {
                    newindex = btnActive_index - 1;
                }
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

                var TC = $find("<%=TCDebitCreditNote.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlActivity.ClientID %>").focus();

                }


            }
        }

        var btnActive_index = 0;
        var index = 0;

        function pageLoad() {
            debugger;
            var TC = $find("<%=TCDebitCreditNote.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlActivity.ClientID %>").focus();

            }

            tab = $find('ctl00_ContentPlaceHolder1_TCDebitCreditNote');
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

        function fnLoadEntity() {
            document.getElementById('<%=btnCreateCustomer.ClientID %>').click();
     }

     function fnCancelClick() {

         if (confirm('Do you want to cancel Debit Credit Note?')) {
             return true;
         }
         else {
             return false;
         }
     }
    </script>

</asp:Content>
