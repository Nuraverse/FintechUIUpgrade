<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnBucketParameter, App_Web_r4rfxxex" title="Bucket Parameter" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlBucketParameter" runat="server" CssClass="stylePanel" GroupingText="Bucket Parameter Details"
                            Width="98%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" ToolTip="Branch">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkActive" runat="server" Checked="true" AutoPostBack="True"
                                            ToolTip="Active" />
                                        <asp:Label runat="server" Text="Active" ID="lblActive" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:Panel ID="PnlCategory" runat="server" CssClass="stylePanel" GroupingText="Category"
                            Width="98%">
                            <%--  <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
                            <asp:GridView runat="server" ID="GrvCategory" AutoGenerateColumns="False" ShowFooter="false"
                                ToolTip="Category" class="gird_details">
                                <Columns>
                                    <asp:TemplateField HeaderText="Category" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcategoryId" runat="server" Text='<%# Bind("Category_ID") %>' Visible="false" />
                                            <asp:Label ID="lblcategoryName" runat="server" Text='<%# Bind("Category_Name") %>' ToolTip="Category Name" />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="styleGridHeader" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkCategory" runat="server" ToolTip="Select Category" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="styleGridHeader" />
                                <RowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                            <%--</div>
                            </div>--%>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:Panel ID="PNLDays" runat="server" CssClass="stylePanel" GroupingText="Days"
                            Width="98%">
                            <div class="gird">
                                <asp:GridView runat="server" ID="GRVDays" AutoGenerateColumns="False" ShowFooter="true"
                                    OnRowDeleting="GRVDays_RowDeleting" OnRowCommand="GRVDays_RowCommand1" ToolTip="Days"
                                    class="gird_details" OnRowCancelingEdit="GRVDays_RowCancelingEdit" OnRowEditing="GRVDays_RowEditing"
                                    OnRowUpdating="GRVDays_RowUpdating" EmptyDataText="No Records Found" OnRowCreated="GRVDays_RowCreated"
                                    OnRowDataBound="GRVDays_RowDataBound">
                                    <Columns>
                                        <%--S.no--%>
                                        <asp:TemplateField HeaderText="Sl.No." HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsno" runat="server" Text='<%#Container.DataItemIndex+1  %>' ToolTip="Sl.No."></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:Label ID="lblsnoF" runat="server"></asp:Label>
                                                </div>
                                            </FooterTemplate>
                                            <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                        </asp:TemplateField>
                                        <%--From Days--%>
                                        <asp:TemplateField HeaderText="From" HeaderStyle-Width="80px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromDays" runat="server" Text='<%# Bind("Fromdays")%>' ToolTip="From"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromDaysEdit" runat="server" MaxLength="4" Text='<%# Bind("Fromdays")%>' ToolTip="From"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"
                                                        onblur="ChkIsZero(this,'From Days');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtFromDaysEdit" runat="server" TargetControlID="txtFromDaysEdit"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFromDaysEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdate" InitialValue="" ControlToValidate="txtFromDaysEdit"
                                                            ErrorMessage="Enter From Days" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromDaysF" runat="server" MaxLength="4" ToolTip="From" onblur="ChkIsZero(this,'From Days');"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEFromDaysF" runat="server" TargetControlID="txtFromDaysF"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFromDaysF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAdd" InitialValue="" ControlToValidate="txtFromDaysF"
                                                            ErrorMessage="Enter From Days"
                                                            Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <%--To days--%>
                                        <asp:TemplateField HeaderText="To" HeaderStyle-Width="80px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToDays" runat="server" Text='<%# Bind("ToDays")%>' ToolTip="To"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToDaysEdit" runat="server" MaxLength="4" Text='<%# Bind("ToDays")%>' ToolTip="To"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"
                                                        onblur="ChkIsZero(this,'To Days');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtToDaysEdit" runat="server" TargetControlID="txtToDaysEdit"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVToDaysEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdate" InitialValue="" ControlToValidate="txtToDaysEdit"
                                                            ErrorMessage="Enter To Days" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToDaysF" runat="server" MaxLength="4" Style="text-align: right;" ToolTip="To"
                                                        class="md-form-control form-control login_form_content_input requires_true" onblur="ChkIsZero(this,'To Days');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEToDaysF" runat="server" TargetControlID="txtToDaysF"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVToDaysF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAdd" InitialValue="" ControlToValidate="txtToDaysF"
                                                            ErrorMessage="Enter To Days" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description" HeaderStyle-Width="80px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#Eval("Descvalue")%>' ID="lblDescriptionDaysVal"
                                                    Visible="false"></asp:Label>
                                                <asp:Label runat="server" Text='<%#Eval("DescriptionDays")%>' ID="lblDescriptionDays" ToolTip="Description"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlDescriptionDaysEdit" runat="server" ValidationGroup="VGDays" ToolTip="Description"
                                                        class="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <asp:HiddenField ID="hdnDescDays" runat="server" Value='<%#Eval("Descvalue") %>' />
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVDescriptionDaysEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdate" InitialValue="0" ControlToValidate="ddlDescriptionDaysEdit"
                                                            ErrorMessage="Select the Description" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlDescriptionDaysF" runat="server" ValidationGroup="VGDays" ToolTip="Description"
                                                        class="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVDescriptionDaysF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAdd" InitialValue="0" ControlToValidate="ddlDescriptionDaysF"
                                                            ErrorMessage="Select the Description" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Credit Weightage" HeaderStyle-Width="80px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreditWeightage" runat="server" Text='<%# Bind("CreditWeightage")%>' ToolTip="Credit Weightage"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtCreditWeightageEdit" runat="server" MaxLength="2" Text='<%# Bind("CreditWeightage")%>' ToolTip="Credit Weightage"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtCreditWeightageEdit" runat="server" TargetControlID="txtCreditWeightageEdit"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVCreditWeightageEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdate" InitialValue="" ControlToValidate="txtCreditWeightageEdit"
                                                            ErrorMessage="Enter Credit Weightage" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtCreditWeightageF" runat="server" MaxLength="2" Style="text-align: right;" ToolTip="Credit Weightage"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTtxtCreditWeightageF" runat="server" TargetControlID="txtCreditWeightageF"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVCreditWeightageF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAdd" InitialValue="" ControlToValidate="txtCreditWeightageF"
                                                            ErrorMessage="Enter Credit Weightage" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false" class="grid_btn"
                                                    AccessKey="I" title="Edit[Alt+I]" ToolTip="Edit[Alt+I]"></asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" ValidationGroup="btnUpdate"
                                                        CausesValidation="true" class="grid_btn" AccessKey="P" title="Update[Alt+P]" ToolTip="Update[Alt+P]"></asp:LinkButton>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <%--<asp:LinkButton ID="btnAddrowDays" runat="server" Text="Add" CommandName="Addnew" AccessKey="A" ToolTip="Add,Alt+A"
                                                    CausesValidation="false" class="grid_btn"></asp:LinkButton>--%>
                                                    <button id="btnGvDaysAdd" runat="server" type="button" accesskey="A" title="Add[Alt+A]"
                                                        class="grid_btn" validationgroup="btnAdd" causesvalidation="true" onserverclick="btnGvDaysAdd_Click">
                                                        <i class="fa fa-plus" aria-hidden="true"></i><u>A</u>dd
                                                    </button>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                            <FooterStyle Width="50px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnRemoveDays" Text="Delete" CommandName="Delete" runat="server" class="grid_btn_delete" AccessKey="T" title="Delete[Alt+T]"
                                                    CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" ToolTip="Delete[Alt+T]" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                        CausesValidation="false" class="grid_btn" AccessKey="C" title="Cancel[Alt+C]"></asp:LinkButton>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 gird">
                        <asp:Panel ID="PNLValue" runat="server" CssClass="stylePanel" GroupingText="Value"
                            Width="98%">
                            <div class="gird">
                                <asp:GridView runat="server" ID="GRDValue" AutoGenerateColumns="False" ShowFooter="true"
                                    OnRowCommand="GRDValue_RowCommand" OnRowDeleting="GRDValue_RowDeleting" ToolTip="Values"
                                    class="gird_details" OnRowCancelingEdit="GRDValue_RowCancelingEdit" OnRowEditing="GRDValue_RowEditing"
                                    OnRowUpdating="GRDValue_RowUpdating" EmptyDataText="No Records Found" OnRowCreated="GRDValue_RowCreated"
                                    OnRowDataBound="GRDValue_RowDataBound">
                                    <Columns>
                                        <%--S.no--%>
                                        <asp:TemplateField HeaderText="Sl.No." HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsno" runat="server" Text='<%# Container.DataItemIndex+1%>' ToolTip="Sl.No."></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblsnoF" runat="server" ToolTip="Sl.No."></asp:Label>
                                            </FooterTemplate>
                                            <%--<ItemStyle Width="10%" HorizontalAlign="Center" />--%>
                                        </asp:TemplateField>
                                        <%--From Value--%>
                                        <asp:TemplateField HeaderText="From" HeaderStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromValue" runat="server" Text='<%# Bind("FromValue")%>' ToolTip="From"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromValueEdit" runat="server" MaxLength="10" Text='<%# Bind("FromValue")%>' ToolTip="From"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"
                                                        onblur="ChkIsZero(this,'From Value');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtFromValueEdit" runat="server" TargetControlID="txtFromValueEdit"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFromValueEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdateV" InitialValue="" ControlToValidate="txtFromValueEdit"
                                                            ErrorMessage="Enter From Value" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromValueF" runat="server" MaxLength="10" Style="text-align: right;" ToolTip="From"
                                                        class="md-form-control form-control login_form_content_input requires_true" onblur="ChkIsZero(this,'From Value');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEFromValueF" runat="server" TargetControlID="txtFromValueF"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVFromValueF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAddV" InitialValue="" ControlToValidate="txtFromValueF"
                                                            ErrorMessage="Enter From Value" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <%--To Value--%>
                                        <asp:TemplateField HeaderText="To" HeaderStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToValue" runat="server" Text='<%# Bind("ToValue")%>' ToolTip="To"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToValueEdit" runat="server" MaxLength="10" Text='<%# Bind("ToValue")%>' ToolTip="To"
                                                        class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"
                                                        onblur="ChkIsZero(this,'To Value');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtToValueEdit" runat="server" TargetControlID="txtToValueEdit"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVToValueEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdateV" InitialValue="" ControlToValidate="txtToValueEdit"
                                                            ErrorMessage="Enter To Value" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToValueF" runat="server" MaxLength="10" Style="text-align: right;" ToolTip="To"
                                                        class="md-form-control form-control login_form_content_input requires_true" onblur="ChkIsZero(this,'To Value');"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="FTEToValueF" runat="server" TargetControlID="txtToValueF"
                                                        FilterType="Numbers" Enabled="true">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVToValueF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAddV" InitialValue="" ControlToValidate="txtToValueF"
                                                            ErrorMessage="Enter To Value" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <%--Description  (Value)--%>
                                        <asp:TemplateField HeaderText="Description" HeaderStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%#Eval("Descvalue")%>' ID="lblDescriptionValueVal"
                                                    Visible="false"></asp:Label>
                                                <asp:Label runat="server" Text='<%#Eval("Descriptionvalue")%>' ID="lblDescriptionValue" ToolTip="Description"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlDescriptionValueEdit" runat="server" ValidationGroup="VGDays" ToolTip="Description"
                                                        class="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <asp:HiddenField ID="hdnDescValue" runat="server" Value='<%#Eval("Descvalue") %>' />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVDescriptionValueEdit" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnUpdateV" InitialValue="0" ControlToValidate="ddlDescriptionValueEdit"
                                                            ErrorMessage="Select the Description" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlDescriptionValueF" runat="server" ValidationGroup="VGValue" ToolTip="Description"
                                                        class="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RFVDescriptionValueF" CssClass="validation_msg_box_sapn"
                                                            runat="server" ValidationGroup="btnAddV" InitialValue="0" ControlToValidate="ddlDescriptionValueF"
                                                            ErrorMessage="Select the Description" Display="Dynamic" SetFocusOnError="true">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <%--<ItemStyle Width="20%" />--%>
                                        </asp:TemplateField>
                                        <%--Action  (Value)--%>
                                        <asp:TemplateField HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                    class="grid_btn" AccessKey="M" title="Edit[Alt+M]" ToolTip="Edit[Alt+M]"></asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" class="grid_btn" ValidationGroup="btnUpdateV"
                                                        CausesValidation="true" AccessKey="U" title="Update[Alt+U]" ToolTip="Edit[Alt+M]"></asp:LinkButton>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <%--<asp:LinkButton ID="btnAddrowvalue" runat="server" Text="Add" CommandName="AddNew"
                                                CausesValidation="false" class="grid_btn" AccessKey="N" title="Add[Alt+N]"></asp:LinkButton>--%>
                                                    <button id="btnGvValueAdd" runat="server" type="button" accesskey="N" title="Add[Alt+N]" validationgroup="btnAddV"
                                                        causesvalidation="true" class="grid_btn" onserverclick="btnGvValueAdd_Click">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>Add
                                                    </button>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                            <FooterStyle Width="50px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnRemovevalue" Text="Delete" CommandName="Delete" runat="server" class="grid_btn_delete"
                                                    AccessKey="R" title="Delete[Alt+R]" ToolTip="Delete[Alt+R]"
                                                    CausesValidation="false" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" class="grid_btn"
                                                        CausesValidation="false" AccessKey="G" title="Cancel[Alt+G]" ToolTip="Cancel[Alt+G]"></asp:LinkButton>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" onclick="if(fnCheckPageValidators('VGBuck'))" accesskey="S"
                        class="css_btn_enabled" type="button" validationgroup="VGBuck" onserverclick="btnSave_Click"
                        title="Save[Alt+S]">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button id="btnClear" runat="server" causesvalidation="false" class="css_btn_enabled"
                        type="button" onclick="if(fnConfirmClear())" onserverclick="btnClear_Click"
                        title="Clear[Alt+L]" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" type="button" validationgroup="PRDDC"
                        causesvalidation="false" class="css_btn_enabled" onserverclick="btnCancel_Click" onclick="if(fnConfirmExit())"
                        title="Exit[Alt+X]" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%--  <tr class="styleButtonArea">
                    <td colspan="2">
                        <asp:ValidationSummary runat="server" ID="vsFactoringInvoiceLoadinf" HeaderText="Correct the following validation(s):"
                            Height="177px" CssClass="styleMandatoryLabel" Width="500px" ShowMessageBox="false"
                            ShowSummary="true" ValidationGroup="VGBuck" />
                    </td>
                </tr>--%>
                <div class="row" style="display: none">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                        <asp:CustomValidator ID="CVBucketParameter" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="false" Width="98%" />
                    </div>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        <input type="hidden" runat="server" value="0" id="hdnRowID" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
