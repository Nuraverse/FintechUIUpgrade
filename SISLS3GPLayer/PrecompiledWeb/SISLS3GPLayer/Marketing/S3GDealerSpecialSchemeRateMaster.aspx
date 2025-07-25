<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GDealerSpecialSchemeRateMaster, App_Web_ru52obyl" %>

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
                                            <UC:Suggest ID="ddlDealerName" runat="server" class="md-form-control form-control" ToolTip="Dealer Name" AutoPostBack="true" OnItem_Selected="ddlDealerName_Item_Selected" ServiceMethod="GetVendors"
                                                ErrorMessage="Select an Dealer Name"
                                                ValidationGroup="Save" IsMandatory="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblDealerName" runat="server" Text="Dealer Name" ToolTip="Dealer Name" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlAssetCodeList" runat="server" ErrorMessage="Select the Asset" ValidationGroup="Save"
                                                OnItem_Selected="ddlAssetCodeList_Item_Selected"
                                                ServiceMethod="GetAsset" IsMandatory="true" AutoPostBack="true" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblAssetCodeList" CssClass="styleReqFieldLabel" Text="Asset"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlYearofManufacturer" runat="server" OnSelectedIndexChanged="ddlYearofManufacturer_SelectedIndexChanged"
                                                AutoPostBack="true">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RfvddlYearofManufacturer" runat="server" ControlToValidate="ddlYearofManufacturer"
                                                    ValidationGroup="Save" CssClass="validation_msg_box_sapn"  Display="Dynamic"
                                                    InitialValue="0" SetFocusOnError="True" ErrorMessage="Select a Year Manufacturer"></asp:RequiredFieldValidator>
                                            </div>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblYearofManufacture" CssClass="styleReqFieldLabel" Text="Year of Manufacture"></asp:Label>
                                            </label>
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
                                                <asp:RequiredFieldValidator ID="rfvSlabName" CssClass="validation_msg_box_sapn" runat="server" ControlToValidate="txtSlabName"
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
                                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="txtFromDate"
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
                                                <asp:RequiredFieldValidator ID="rfvToDate" runat="server" CssClass="validation_msg_box_sapn" ControlToValidate="txtToDate"
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

                                            <%--To days--%>
                                            <asp:TemplateField HeaderText="Tenure From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTenureFrom" runat="server" Text='<%# Bind("TenureFrom")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureFromE" Enabled="false" runat="server" Text='<%# Bind("TenureFrom")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtTenureFromE" runat="server" TargetControlID="txtTenureFromE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureFromF" Enabled="false" runat="server" Style="text-align: right;" MaxLength="4"
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
                                                        <asp:TextBox ID="txtTenureToE" Enabled="false" runat="server" Text='<%# Bind("TenureTo")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtTenureToE" runat="server" TargetControlID="txtTenureToE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtTenureToF"  runat="server" Style="text-align: right;" MaxLength="4"
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
                                            <%--To days--%>
                                            <asp:TemplateField HeaderText="Tenure From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusedTenureFrom" runat="server" Text='<%# Bind("TenureFrom")%>' Style="text-align: right;"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedTenureFromE" Enabled="false" runat="server" MaxLength="4" Text='<%# Bind("TenureFrom")%>'
                                                            Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="FTEtxtusedTenureFromE" runat="server" TargetControlID="txtusedTenureFromE"
                                                            FilterType="Numbers" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </div>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtusedTenureFromF" Enabled="false" runat="server" MaxLength="4" Style="text-align: right;"
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
                                                        <asp:TextBox ID="txtusedTenureToE" Enabled="false" runat="server" MaxLength="4" Text='<%# Bind("TenureTo")%>'
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

