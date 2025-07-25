<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgDealerMatrix_Add, App_Web_xfeo3ymh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                    <%-- <div class="col" align="right">
                        <a id="imgRefresh" onclick="location.reload();" href="#"><i class="fa fa-refresh"></i></a>&emsp;
                      <a href="#" onclick="menuhide()"><i class="fa fa-angle-double-up" aria-hidden="true" id="icon_fa"></i></a>
                    </div>--%>
                </div>
                <div class="row">
                    <div class="col-md-6 grid">
                        <asp:Panel ID="pnlLOBDetails" GroupingText="LOB Details" runat="server" CssClass="stylePanel">
                            <div style="overflow-x: hidden; overflow-y: auto; height: 120px; text-align: center" class="grid">
                                <asp:GridView runat="server" ID="grvLOB" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                    OnRowDataBound="grvLOB_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Line of Business"
                                            HeaderStyle-Width="70%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLOB" runat="server" ToolTip='<%#Eval("LOB_Name")%>' Text='<%#Eval("LOB_Name")%>'></asp:Label>
                                                <asp:Label ID="lblLOBID" runat="server" Visible="false" Text='<%#Eval("LOB_ID")%>'></asp:Label>
                                                <asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="30%">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkSelectAllLOB" runat="server"></asp:CheckBox>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelectLOB" runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="col-md-6">
                        <asp:Panel ID="pnlBranchDetails" GroupingText="Branch Details" runat="server" CssClass="stylePanel">
                            <div style="overflow-x: hidden; overflow-y: auto; height: 120px; text-align: center" class="grid">
                                <asp:GridView runat="server" ID="grvBranchDetails" HeaderStyle-CssClass="styleGridHeader" Width="100%"
                                    OnRowDataBound="grvBranchDetails_RowDataBound" AutoGenerateColumns="False" class="grid_details">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Branch"
                                            HeaderStyle-Width="60%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranchName" runat="server" ToolTip='<%#Eval("Branch")%>' Text='<%#Eval("Branch")%>'></asp:Label>
                                                <asp:Label ID="lblBranchID" runat="server" Visible="false" Text='<%#Eval("Branch_ID")%>'></asp:Label>
                                                <%--<asp:Label ID="lblAssigned" runat="server" Visible="false" Text='<%#Eval("Assigned")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="40%">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkSelectAllBranch" runat="server"></asp:CheckBox>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelectBranch" runat="server"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel ID="Panel1" GroupingText="Header" runat="server" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMatrixNumber" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" ToolTip="Matrix Number"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMatrixNumber" runat="server" Text="Matrix Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCustomerCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" ToolTip="Entity Name"></asp:TextBox>
                                        <uc3:LOV ID="ucCustomerCodeLov" onblur="return fnLoadCustomer();" runat="server" TabIndex="-1"
                                            strLOV_Code="ENT" />
                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                            Style="display: none" AccessKey="D" ToolTip="Load Customer,Alt+D" /><input id="Hidden1" type="hidden" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEntityName" runat="server" Text="Entity Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtMatrixDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" ToolTip="matrix date">
                                        </asp:TextBox>
                                        <cc1:CalendarExtender ID="ceMatrixDate" runat="server" Enabled="true"
                                            TargetControlID="txtmatrixdate">
                                        </cc1:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="rfvtxtMatrixDate" runat="server" ControlToValidate="txtmatrixdate" ErrorMessage="select matrix date"
                                            CssClass="stylemandatorylabel" Display="none" SetFocusOnError="true" ValidationGroup="save"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblMatrixDate" runat="server" Text="matrix date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <%--  </div>
                            <div class="row">--%>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:Label ID="lblSchemeType" CssClass="styleReqFieldLabel" runat="server" Text="Scheme Type"></asp:Label>
                                        <uc1:Suggest ID="ddlSchemeType" runat="server" ServiceMethod="GetSchemeType" IsMandatory="false"
                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="Scheme Type" ValidationGroup="Save" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtSchemeName" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            Style="background-image: url('');" ToolTip="Scheme Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtSchemeName" runat="server" ControlToValidate="txtSchemeName" ErrorMessage="Enter Scheme Name"
                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblSchemeName" runat="server" Text="Scheme Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active"
                                            ToolTip="Active"></asp:Label>
                                        <asp:CheckBox ID="chkIs_Active" runat="server" />

                                    </div>
                                </div>
                                <%-- </div>
                            <div class="row">--%>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffectiveFrom" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"
                                            ToolTip="Effective From" OnTextChanged="txtEffectiveFrom_TextChanged" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtEffectiveFrom" runat="server" ControlToValidate="txtEffectiveFrom" ErrorMessage="Select Effective From"
                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtEffectiveFrom" ID="ceFromDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEffectiveFrom" CssClass="styleReqFieldLabel" runat="server" Text="Effective From"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffectiveTo" AutoPostBack="true" ToolTip="Effective To" class="md-form-control form-control login_form_content_input requires_true" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvtxtEffectiveTo" runat="server" ControlToValidate="txtEffectiveTo" ErrorMessage="Select Effective To"
                                            CssClass="styleMandatoryLabel" Display="None" SetFocusOnError="True" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                        <cc1:CalendarExtender ID="ceToDate" runat="server" Enabled="True" PopupButtonID="imgToDate"
                                            TargetControlID="txtEffectiveTo" OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                        </cc1:CalendarExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEffectiveTo" CssClass="styleReqFieldLabel" runat="server" Text="Effective To"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Panel ID="pnlDelerDetails" GroupingText="Details" runat="server" CssClass="stylePanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtStartTenure" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="Start Tenure"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblStartTenure" runat="server" Text="Start Tenure"></asp:Label>
                                    </label>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtEndTenure" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="End Tenure"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEndTenure" CssClass="styleReqFieldLabel" runat="server" Text="End Tenure"></asp:Label>
                                    </label>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtMonthly_ICC" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="Monthly ICC"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblMonthly_ICC" runat="server" Text="Monthly ICC"></asp:Label>
                                    </label>
                                </div>
                                <%--    </div>

                            <div class="row">--%>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtHighRate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="High Rate"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblHighRate" CssClass="styleReqFieldLabel" runat="server" Text="High Rate"></asp:Label>
                                    </label>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtLowRate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="Low Rate"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblLowRate" runat="server" Text="Low Rate"></asp:Label>
                                    </label>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtMinDPRequired" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="Minimum DP"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblMinDPRequired" CssClass="styleReqFieldLabel" runat="server" Text="Minimum DP"></asp:Label>
                                    </label>
                                </div>
                                <%--                            </div>

                            <div class="row">--%>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtHighDP" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="High DP"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblHighDP" runat="server" Text="High DP"></asp:Label>
                                    </label>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:TextBox ID="txtLowDP" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Style="background-image: url('');" ToolTip="Low DP"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblLowDP" runat="server" Text="Low DP"></asp:Label>
                                    </label>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 md-input">
                                    <asp:DropDownList ID="ddlDealType" runat="server" AutoPostBack="true" ToolTip="Deal Type" Width="150px" class="md-form-control form-control"
                                        Style="background-image: url('');">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblDealType" runat="server" Text="Deal Type" Width="150px"></asp:Label>
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Button ID="btnAdd" Text="Add" runat="server" CssClass="styleGridShortButton" OnClick="btnAdd_Click" AccessKey="A" ToolTip="Add, Alt+A" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Panel ID="pnlGrid" runat="server">
                            <div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 grid">
                                        <asp:GridView ID="gvDealerMatrixDet" runat="server" ShowFooter="true" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader" Width="99%" OnRowCommand="gvDealerMatrixDet_RowCommand"
                                            OnRowDataBound="gvDealerMatrixDet_RowDataBound" OnRowDeleting="gvDealerMatrixDet_RowDeleting" class="grid_details">
                                            <Columns>

                                                <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                        <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Dealer Matrix Detail ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDealerMatrixDetID" runat="server" Visible="false" Text='<%#Eval("Dealer_Matrix_Det_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Start Tenure">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStartTenure" runat="server" Text='<%#Eval("StartTenure")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="End Tenure">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndTenure" runat="server" Text='<%#Eval("EndTenure")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Monthly ICC">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMonthlyICC" runat="server" Text='<%#Eval("Monthly_ICC")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="High Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHighRate" runat="server" Text='<%#Eval("HighRate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Low Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLowRate" runat="server" Text='<%#Eval("LowRate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Minimum DP Required">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMinDPRequired" runat="server" Text='<%#Eval("LowRate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="High DP">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHighDP" runat="server" Text='<%#Eval("HighDP")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Low DP">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLowDP" runat="server" Text='<%#Eval("LowDP")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Deal Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDealType" runat="server" Text='<%#Eval("DealType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Deal Type ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDealTypeID" runat="server" Text='<%#Eval("DealTypeID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnRemove" Text="Remove" CommandName="Delete" runat="server"
                                                            CausesValidation="false" />
                                                        <asp:Label ID="lblRowStatus" runat="server" Text='<%# Bind("RowStatus")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                </div>
                <div class="row">
                    <div class="col">
                        <div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="row" style="float: right; margin-top: 5px;">
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                            <asp:Button runat="server" ID="btnSave" CssClass="save_btn fa fa-floppy-o" Text="Save" AccessKey="S" ToolTip="Save, Alt+S"
                                                OnClick="btnSave_Click" ValidationGroup="Save" OnClientClick="return fnCheckPageValidators('Save');" />
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-eraser btn_i" aria-hidden="true"></i>
                                            <asp:Button runat="server" ID="btnClear" CausesValidation="false" CssClass="save_btn fa fa-eraser-o" ToolTip="Clear, Alt+L" AccessKey="L"
                                                Text="Clear" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12" style="margin-left: 10px;">
                                            <i class="fa fa-share btn_i" aria-hidden="true"></i>
                                            <asp:Button runat="server" ID="btnExit" Text="Exit" CausesValidation="false" ToolTip="Exit, Alt+X" AccessKey="X" OnClientClick="return fnConfirmExit();"
                                                CssClass="save_btn fa fa-share-o" OnClick="btnExit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:ValidationSummary runat="server" ID="vsummary" ValidationGroup="Save"
                            HeaderText="Correct the following validation(s):" CssClass="styleSummaryStyle"
                            Width="500px" ShowMessageBox="false" ShowSummary="true" />
                    </div>
                </div>
            </div>
            <div>
                <input type="hidden" value="0" runat="server" id="hdnMode" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCustomer').click();
        }
    </script>

</asp:Content>

