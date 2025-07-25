<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GDealerSalesCommissionRateMaster, App_Web_x5tdsxrh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="ICM" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function fnCheckMaxLength(txtbox) {
            var AssetModel = txtbox.value;
            if (AssetModel.length > 4) {
                alert('Asset Model Length should not exceed 4');
                txtbox.value = '';
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading"></asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlDealerCommissionRate" runat="server" CssClass="stylePanel" GroupingText="Rate Details">
                                <div class="row">

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" class="md-form-control form-control"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" class="md-form-control form-control"></asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList runat="server" ID="ddlSchemeType" class="md-form-control form-control" ToolTip="Scheme Type">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Scheme Type" ID="lblRateType" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtSlabCode" class="md-form-control form-control login_form_content_input requires_true" ToolTip="Slab Code"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Slab Code" ID="lblSlabCode"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtSlabName" class="md-form-control form-control login_form_content_input requires_true"
                                                onkeydown="maxlengthfortxt(100);" ToolTip="Slab Name"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Slab Name" ID="lblSlabName" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvSlabName" runat="server" ControlToValidate="txtSlabName"
                                                    ErrorMessage="Enter Slab Name" Display="Dynamic" ValidationGroup="Save" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtFromDate" ToolTip="Start date" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Height="16px" Visible="false" />
                                            <cc1:CalendarExtender ID="ceFromDate"
                                                runat="server" Enabled="True" PopupButtonID="imgFromDate" TargetControlID="txtFromDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Start Date" ID="lblFromDate" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtFromDate"
                                                    ErrorMessage="Enter Start Date" Display="Dynamic" ValidationGroup="Save" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtToDate" ToolTip="End date" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender ID="ceToDate" runat="server" Enabled="True" PopupButtonID="imgToDate"
                                                TargetControlID="txtToDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="End Date" ID="lblToDate" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtToDate"
                                                    ErrorMessage="Enter End Date" Display="Dynamic" ValidationGroup="Save" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label ID="lblActive" runat="server" Text="Active" CssClass="styleReqFieldLabel" />
                                            <asp:CheckBox ID="chkActive" runat="server" />
                                        </div>
                                    </div>

                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlNewAsset" runat="server" CssClass="stylePanel" GroupingText="New Asset">
                                <div class="gird">
                                    <asp:GridView runat="server" ID="grvNewAsset" AutoGenerateColumns="false" ShowFooter="true"
                                        EmptyDataText="No Records Found" OnRowDataBound="grvNewAsset_RowDataBound" OnRowCommand="grvNewAsset_RowCommand"
                                        OnRowEditing="grvNewAsset_RowEditing" OnRowDeleting="grvNewAsset_RowDeleting" OnRowCancelingEdit="grvNewAsset_RowCancelingEdit"
                                        OnRowUpdating="grvNewAsset_RowUpdating">
                                        <Columns>
                                            <%--S.no--%>
                                            <asp:TemplateField HeaderText="Sl.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblsnoF" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmountFrom" runat="server" Text='<%# Bind("AmountFrom")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAmountFromE" runat="server" Text='<%# Bind("AmountFrom")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAmountFromE" runat="server" TargetControlID="txtAmountFromE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAmountFromF" runat="server" Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAmountFromF" runat="server" TargetControlID="txtAmountFromF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvAmountFromF" runat="server" ControlToValidate="txtAmountFromF"
                                                                ErrorMessage="Enter Amount From" Display="Dynamic" ValidationGroup="NewAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount To">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmountTo" runat="server" Text='<%# Bind("AmountTO")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAmountToE" runat="server" Text='<%# Bind("AmountTo")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAmountToE" runat="server" TargetControlID="txtAmountToE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtAmountToF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtAmountToF" runat="server" TargetControlID="txtAmountToF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvAmountToF" runat="server" ControlToValidate="txtAmountToF"
                                                                ErrorMessage="Enter Amount To" Display="Dynamic" ValidationGroup="NewAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Eligible Incentive">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEligibleIncentive" runat="server" Text='<%# Bind("EligibleIncentive")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEligibleIncentiveE" runat="server" Text='<%# Bind("EligibleIncentive")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEEligibleIncentiveE" runat="server" TargetControlID="txtEligibleIncentiveE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvEligibleIncentiveE" runat="server" ControlToValidate="txtEligibleIncentiveE"
                                                                ErrorMessage="Enter Eligible Incentive" Display="Dynamic" ValidationGroup="NewAssetEdit" />
                                                        </div>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtEligibleIncentiveF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtEligibleIncentiveF" runat="server" TargetControlID="txtEligibleIncentiveF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvEligibleIncentiveF" runat="server" ControlToValidate="txtEligibleIncentiveF"
                                                                ErrorMessage="Enter Eligible Incentive" Display="Dynamic" ValidationGroup="NewAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <%--To days--%>
                                            <asp:TemplateField HeaderText="Tenure From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTenureFrom" runat="server" Text='<%# Bind("TenureFrom")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureFromE" runat="server" Text='<%# Bind("TenureFrom")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtTenureFromE" runat="server" TargetControlID="txtTenureFromE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureFromF" runat="server" Style="text-align: right;" MaxLength="4"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtTenureFromF" runat="server" TargetControlID="txtTenureFromF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtTenureFromF" runat="server" ControlToValidate="txtTenureFromF"
                                                                ErrorMessage="Enter Tenure From" Display="Dynamic" ValidationGroup="NewAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <%-- Description (Days)--%>

                                            <asp:TemplateField HeaderText="Tenure To">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTenureTo" runat="server" Text='<%# Bind("TenureTo")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureToE" runat="server" Text='<%# Bind("TenureTo")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtTenureToE" runat="server" TargetControlID="txtTenureToE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureToF" runat="server" Style="text-align: right;" MaxLength="4"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTtxtTenureToF" runat="server" TargetControlID="txtTenureToF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvTenureToF" runat="server" ControlToValidate="txtTenureToF"
                                                                ErrorMessage="Enter Tenure To" Display="Dynamic" ValidationGroup="NewAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Flat Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFlatRate" runat="server" Text='<%# Bind("FlatRate")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFlatRateE" runat="server" Text='<%# Bind("FlatRate")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtFlatRateE" runat="server" TargetControlID="txtFlatRateE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvFlatRateE" runat="server" ControlToValidate="txtFlatRateE"
                                                                ErrorMessage="Enter Flat Rate" Display="Dynamic" ValidationGroup="NewAssetEdit" />
                                                        </div>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFlatRateF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtFlatRateF" runat="server" TargetControlID="txtFlatRateF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvFlatRateF" runat="server" ControlToValidate="txtFlatRateF"
                                                                ErrorMessage="Enter Flat Rate" Display="Dynamic" ValidationGroup="NewAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" CssClass="grid_btn"></asp:LinkButton>
                                                    <asp:LinkButton ID="btnRemoveDays" Text="Delete" CommandName="Delete" runat="server" CssClass="grid_btn_delete"
                                                        CausesValidation="false" OnClientClick="return confirm('Do you want to delete this record?');" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                        CausesValidation="true" ValidationGroup="NewAssetEdit"></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                        CausesValidation="false"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Add" ValidationGroup="NewAssetAdd"
                                                        CausesValidation="true" CssClass="grid_btn"></asp:LinkButton>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlusedAsset" runat="server" CssClass="stylePanel" GroupingText="Used Asset">
                                <div class="gird">
                                    <asp:GridView runat="server" ID="grvUsedAsset" AutoGenerateColumns="False" ShowFooter="true"
                                        OnRowDeleting="grvUsedAsset_RowDeleting" OnRowCommand="grvUsedAsset_RowCommand"
                                        OnRowCancelingEdit="grvUsedAsset_RowCancelingEdit" OnRowEditing="grvUsedAsset_RowEditing"
                                        OnRowUpdating="grvUsedAsset_RowUpdating" EmptyDataText="No Records Found" OnRowDataBound="grvUsedAsset_RowDataBound">
                                        <Columns>
                                            <%--S.no--%>
                                            <asp:TemplateField HeaderText="Sl.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUsedsno" runat="server" Text='<%#Container.DataItemIndex+1  %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblUsedsnoF" runat="server"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset Model">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedModel_Name" runat="server" Text='<%# Bind("Model_Name")%>' Style="text-align: right;"></asp:Label>
                                                    <asp:Label ID="lblusedModel_Id" runat="server" Text='<%# Bind("Model_ID")%>' Style="text-align: right;" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedModel_NameE" runat="server" Text='<%# Bind("Model_Name")%>' onkeydown="maxlengthfortxt(4);"
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEusedModel_NameE" runat="server" TargetControlID="txtusedModel_NameE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedModel_NameF" runat="server" Style="text-align: right;" 
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEusedModel_NameF" runat="server" TargetControlID="txtusedModel_NameF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedModel_NameF" runat="server" ControlToValidate="txtusedModel_NameF"
                                                                ErrorMessage="Enter Asset Model" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedAmountFrom" runat="server" Text='<%# Bind("AmountFrom")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedAmountFromE" runat="server" Text='<%# Bind("AmountFrom")%>' Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedAmountFromE" runat="server" TargetControlID="txtusedAmountFromE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedAmountFromF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedAmountFromF" runat="server" TargetControlID="txtusedAmountFromF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedAmountFromF" runat="server" ControlToValidate="txtusedAmountFromF"
                                                                ErrorMessage="Enter Amount From" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount To">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedAmountTo" runat="server" Text='<%# Bind("AmountTO")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedAmountToE" runat="server" Text='<%# Bind("AmountTo")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedAmountToE" runat="server" TargetControlID="txtusedAmountToE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedAmountToF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedAmountToF" runat="server" TargetControlID="txtusedAmountToF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedAmountToF" runat="server" ControlToValidate="txtusedAmountToF"
                                                                ErrorMessage="Enter Amount To" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Eligible Incentive">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedEligibleIncentive" runat="server" Text='<%# Bind("EligibleIncentive")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtUsedEligibleIncentiveE" runat="server" Text='<%# Bind("EligibleIncentive")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEusedEligibleIncentiveE" runat="server" TargetControlID="txtusedEligibleIncentiveE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvUsedEligibleIncentiveE" runat="server" ControlToValidate="txtUsedEligibleIncentiveE"
                                                                ErrorMessage="Enter Eligible Incentive" Display="Dynamic" ValidationGroup="UsedAssetEdit" />
                                                        </div>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedEligibleIncentiveF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedEligibleIncentiveF" runat="server" TargetControlID="txtusedEligibleIncentiveF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedEligibleIncentiveF" runat="server" ControlToValidate="txtusedEligibleIncentiveF"
                                                                ErrorMessage="Enter Eligible Incentive" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <%--To days--%>
                                            <asp:TemplateField HeaderText="Tenure From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedTenureFrom" runat="server" Text='<%# Bind("TenureFrom")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedTenureFromE" runat="server" MaxLength="4" Text='<%# Bind("TenureFrom")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedTenureFromE" runat="server" TargetControlID="txtusedTenureFromE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedTenureFromF" runat="server" MaxLength="4" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedTenureFromF" runat="server" TargetControlID="txtusedTenureFromF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedTenureFromF" runat="server" ControlToValidate="txtusedTenureFromF"
                                                                ErrorMessage="Enter Tenure From" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <%-- Description (Days)--%>

                                            <asp:TemplateField HeaderText="Tenure To">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedTenureTo" runat="server" Text='<%# Bind("TenureTo")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedTenureToE" runat="server" MaxLength="4" Text='<%# Bind("TenureTo")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtTenureToE" runat="server" TargetControlID="txtusedTenureToE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedTenureToF" runat="server" MaxLength="4" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTtxtusedTenureToF" runat="server" TargetControlID="txtusedTenureToF"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedTenureToF" runat="server" ControlToValidate="txtusedTenureToF"
                                                                ErrorMessage="Enter Tenure To" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Flat Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedFlatRate" runat="server" Text='<%# Bind("FlatRate")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedFlatRateE" runat="server" Text='<%# Bind("FlatRate")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedFlatRateE" runat="server" TargetControlID="txtusedFlatRateE"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedFlatRateE" runat="server" ControlToValidate="txtusedFlatRateE"
                                                                ErrorMessage="Enter Flat Rate" Display="Dynamic" ValidationGroup="UsedAssetEdit" />
                                                        </div>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedFlatRateF" runat="server" Style="text-align: right;"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedFlatRateF" runat="server" TargetControlID="txtusedFlatRateF"
                                                            FilterType="Numbers,Custom" Enabled="true" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvusedFlatRateF" runat="server" ControlToValidate="txtusedFlatRateF"
                                                                ErrorMessage="Enter Flat Rate" Display="Dynamic" ValidationGroup="UsedAssetAdd" />
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkusedEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" CssClass="grid_btn"></asp:LinkButton>
                                                    <asp:LinkButton ID="btnusedRemoveDays" Text="Delete" CommandName="Delete" runat="server" CssClass="grid_btn_delete"
                                                        CausesValidation="false" OnClientClick="return confirm('Do you want to delete this record?');" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnkusedUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn" ValidationGroup="UsedAssetEdit"
                                                        CausesValidation="true"></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkusedCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                        CausesValidation="false"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <asp:LinkButton ID="lnkusedAdd" runat="server" Text="Add" CommandName="Add" CssClass="grid_btn" ValidationGroup="UsedAssetAdd"
                                                        CausesValidation="true"></asp:LinkButton>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>

                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" onserverclick="btnSave_Click"
                            runat="server" type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click"
                            runat="server" type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click"
                            runat="server" type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                    </div>

                    <div>
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="false" ValidationGroup="Save" />
                        <asp:ValidationSummary ID="VSbtnAdd" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="NewAssetAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="VSbtnEdit" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="NewAssetEdit" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsbtnUsedAssetAdd" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="UsedAssetAdd" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="vsbtnUsedAssetEdit" runat="server" ShowSummary="false" CssClass="styleMandatoryLabel"
                            ValidationGroup="UsedAssetEdit" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <asp:CustomValidator ID="CVBucketParameter" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" Width="98%" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        <input type="hidden" runat="server" value="0" id="hdnRowID" />
                    </div>


                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

