<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnDelinquent_Parameter_Add, App_Web_4kkykzxm" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label ID="lblHeading" runat="server" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <%--                <tr>
                    <td valign="top">
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td colspan="3">--%>

                <%--<asp:RangeValidator ID="RVtxtCutOffMonth" runat="server" ControlToValidate="txtCutOffMonth" MinimumValue="1"
                                        Display="None" MaximumValue="12" ErrorMessage="Months can be between 1 and 12 only"
                                        Type="Integer" ValidationGroup="btnSave"></asp:RangeValidator>--%>
                <%--<asp:CustomValidator ID="custCheck" runat="server" Display="None" OnServerValidate="custCheck_ServerValidate"
                                         ValidationGroup="btnSave" ></asp:CustomValidator>--%>
                <%--</td>
                            </tr>--%>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel runat="server" ID="Panel1" CssClass="stylePanel" GroupingText="Delinquency Type"
                            Width="99%">
                            <div class="row" style="padding: 0px !important;">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="RBLDelinquentType" runat="server" RepeatDirection="Vertical"
                                            AutoPostBack="true" OnSelectedIndexChanged="RBLDelinquentType_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                            <%--onselectedindexchanged="RBLDelinquentType_SelectedIndexChanged" AutoPostBack="true">--%>
                                            <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Statutory" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Company" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvRBLDelinquentType" CssClass="validation_msg_box_sapn"
                                                runat="server" ValidationGroup="btnSave" InitialValue="-1" ControlToValidate="RBLDelinquentType"
                                                ErrorMessage="Select Delinquency Type"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Delinquency Type" ID="lblDelType" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" />
                                        </label>
                                    </div>
                                </div>
                                <%-- <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtBranchList" runat="server" MaxLength="50" OnTextChanged="txtBranchList_OnTextChanged"
                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:AutoCompleteExtender ID="autoLocationSearch" MinimumPrefixLength="3" OnClientPopulated="Location_ItemPopulated"
                                            OnClientItemSelected="Location_ItemSelected" runat="server" TargetControlID="txtBranchList"
                                            ServiceMethod="GetBranchList" Enabled="True" CompletionSetCount="5"
                                            CompletionListCssClass="CompletionList" DelimiterCharacters=";,:" CompletionListItemCssClass="CompletionListItemCssClass"
                                            CompletionListHighlightedItemCssClass="CompletionListHighlightedItemCssClass"
                                            ShowOnlyCurrentWordInCompletionListItem="true">
                                        </cc1:AutoCompleteExtender>
                                        <cc1:TextBoxWatermarkExtender ID="txtBranchExtender" runat="server" TargetControlID="txtBranchList"
                                            WatermarkText="--Select--">
                                        </cc1:TextBoxWatermarkExtender>
                                        <asp:HiddenField ID="hdnLocationID" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Location" ID="lblBranchSearch" />
                                        </label>
                                    </div>
                                </div>--%>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" ToolTip="Branch">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblBranchSearch" runat="server" Text="Location" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlPeriodtype" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPeriodtype_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                            <asp:ListItem Value="2">Days</asp:ListItem>
                                            <asp:ListItem Value="1">Month</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVPeriodType" CssClass="validation_msg_box_sapn"
                                                runat="server" ValidationGroup="btnSave" InitialValue="-1" ControlToValidate="ddlPeriodtype"
                                                ErrorMessage="Select Period Type"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblPeriodType" runat="server" Text="Period Type" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding: 0px !important;">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffectiveFromDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <%--<asp:Image ID="imgEffectiveFromDate" runat="server" ImageUrl="~/Images/calendaer.gif"  PopupButtonID="imgEffectiveFromDate"/>--%>
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtEffectiveFromDate"
                                            Format="dd/MM/YYYY" ID="calEffectiveFromDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <cc1:FilteredTextBoxExtender ID="ftvcalEffectiveFromDate" runat="server" ValidChars="/-"
                                            FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                            Enabled="true" TargetControlID="txtEffectiveFromDate">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEffectiveFromDate" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtEffectiveFromDate" ErrorMessage="Enter Effective Start Date"
                                                Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblEffFrom" runat="server" Text="Effective Start Date" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffectiveToDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <%--<asp:Image ID="imgEffectiveToDate" runat="server" ImageUrl="~/Images/calendaer.gif" PopupButtonID="imgEffectiveToDate" />--%>
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtEffectiveToDate"
                                            Format="dd/MM/YYYY" ID="calEffectiveToDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <cc1:FilteredTextBoxExtender ID="fteEffectiveToDate" runat="server" ValidChars="/-"
                                            FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                            Enabled="true" TargetControlID="txtEffectiveToDate">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEffectiveToDate" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtEffectiveToDate" ErrorMessage="Enter Effective End Date"
                                                Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblEffTo" runat="server" Text="Effective End Date" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCutOffMonth" runat="server" MaxLength="3" Enabled="false" Style="text-align: right;"
                                            onblur="FunZerocheck(this);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="FTEtxtCutOffMonth" runat="server" FilterType="Numbers"
                                            TargetControlID="txtCutOffMonth">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVtxtCutOffMonth" CssClass="validation_msg_box_sapn"
                                                runat="server" ControlToValidate="txtCutOffMonth" ErrorMessage="Enter Ageing Days"
                                                Display="Dynamic" ValidationGroup="btnSave"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Ageing Days" ID="lblageingdaysmonth" CssClass="styleReqFieldLabel" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkIsActive" runat="server" Enabled="false" />
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Active" ID="lblActive" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="padding: 0px !important;">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtDelinqNo" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            ToolTip="Delinquent No."></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblDelinqNo" runat="server" Text="Delinquent No." ToolTip="Delinquent No." />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAgeingDays" runat="server" MaxLength="3" Visible="false"
                                            onblur="FunZerocheck(this);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="fteAgeingDays" runat="server" FilterType="Numbers"
                                            TargetControlID="txtAgeingDays">
                                        </cc1:FilteredTextBoxExtender>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Ageing Days" ID="lblAgedays" CssClass="styleReqFieldLabel" Visible="false" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="gird">
                    <asp:Panel runat="server" ID="Panel7" CssClass="stylePanel" GroupingText="Delinquency Parameter" Width="99%">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:GridView ShowFooter="true" runat="server" AutoGenerateColumns="false" class="gird_details"
                                ID="grvDelinquentParameterdetails" OnRowEditing="grvDelinquentParameterdetails_RowEditing" OnRowDataBound="grvDelinquentParameterdetails_RowDataBound"
                                OnRowCommand="grvDelinquentParameterdetails_OnRowCommand" OnRowDeleting="grvDelinquentParameterdetails_OnRowDeleting"
                                OnRowUpdating="grvDelinquentParameterdetails_RowUpdating" OnRowCancelingEdit="grvDelinquentParameterdetails_RowCancelingEdit">
                                <Columns>
                                    <asp:TemplateField HeaderText="SI.No" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="txtSerial" Text='<%# Eval("Delinquent_Parameter_ID")%>'
                                                runat="server" Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtSerialAdd" MaxLength="7" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FTEtxtSerialAdd" runat="server" FilterType="Numbers"
                                                    TargetControlID="txtSerialAdd">
                                                </cc1:FilteredTextBoxExtender>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDELINQCATEGORY" Text='<%# Bind("CATEGORY") %>'
                                                runat="server" ToolTip="Category"></asp:Label>
                                            <asp:Label ID="lblDELINQCATEGORYID" Text='<%# Bind("DELINQ_CATEGORY") %>'
                                                runat="server" Visible="false"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlDelinqCategryEdit" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDelinqCategryEdit_SelectedIndexChanged"
                                                    class="md-form-control form-control login_form_content_input" ToolTip="Category">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <asp:HiddenField ID="gvHiddenValDelinqCategryId" runat="server" Value='<%#Eval("DELINQ_CATEGORY") %>' />
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVCategory" CssClass="validation_msg_box_sapn" SetFocusOnError="true"
                                                        runat="server" ValidationGroup="btnAdd" InitialValue="0" ControlToValidate="ddlDelinqCategryEdit"
                                                        ErrorMessage="Select Category" Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:DropDownList ID="ddlDELINQCATEGORY" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDeliquentType_SelectedIndexChanged"
                                                    class="md-form-control form-control login_form_content_input" ToolTip="Category">
                                                </asp:DropDownList>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVCategory" CssClass="validation_msg_box_sapn"
                                                        runat="server" ValidationGroup="btnAdd" InitialValue="0" ControlToValidate="ddlDELINQCATEGORY"
                                                        ErrorMessage="Select Category" Display="Dynamic" SetFocusOnError="true">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <%--  <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="4%" />
                                        <ItemStyle Width="3%" HorizontalAlign="Left" />
                                        <FooterStyle HorizontalAlign="Left" Width="3%" />--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="From Days">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMonthFrom" Text='<%# Bind("From_Month") %>'
                                                runat="server" ReadOnly="true" Style="text-align: right;" ToolTip="From Days"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%-- <asp:TextBox ID="txtMonthFrom" MaxLength="3" Text='<%# Bind("From_Month") %>' runat="server" Width="50%"
                                                                        ReadOnly="true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="FTEtxtMonthFrom" runat="server" FilterType="Numbers"
                                                                        TargetControlID="txtMonthFrom">
                                                                    </cc1:FilteredTextBoxExtender>--%>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:Label ID="txtMonthFrom" Text='<%# Bind("From_Month") %>' ToolTip="From Days"
                                                    runat="server" Style="text-align: right;"></asp:Label>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtMonthFromAdd" MaxLength="7" runat="server" Text="1" ReadOnly="true" ToolTip="From Days"
                                                    class="md-form-control form-control login_form_content_input requires_true"
                                                    Style="text-align: right;"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FTEtxtMonthFromAdd" runat="server" FilterType="Numbers"
                                                    TargetControlID="txtMonthFromAdd">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVtxtMonthFromAdd" CssClass="validation_msg_box_sapn" InitialValue=""
                                                        runat="server" ValidationGroup="btnAdd" ControlToValidate="txtMonthFromAdd" ErrorMessage="Enter From Days"
                                                        Display="Dynamic" SetFocusOnError="true">
                                                    </asp:RequiredFieldValidator>
                                                </div>
                                                <%-- <asp:RangeValidator ID="RVtxtMonthFromAdd" runat="server" ControlToValidate="txtMonthFromAdd" MinimumValue="1"
                                                Display="None" MaximumValue="12" ErrorMessage="Months can be between 1 and 12 only"
                                                Type="Integer" ValidationGroup="btnAdd"></asp:RangeValidator>--%>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Days">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMonthTo" Text='<%# Bind("To_Month")%>'
                                                MaxLength="3" runat="server" Style="text-align: right;" ToolTip="To Days"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="txtMonthTo" Text='<%# Bind("To_Month")%>' MaxLength="3" runat="server"
                                                                        OnTextChanged="txtMonthTo_OnTextChanged" AutoPostBack="true" Width="50%"></asp:TextBox>--%>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:Label ID="txtMonthTo" Text='<%# Bind("To_Month")%>'
                                                    runat="server" Style="text-align: right;"></asp:Label>
                                            </div>
                                            <%-- <cc1:FilteredTextBoxExtender ID="FTEtxtMonthTo" runat="server" FilterType="Numbers"
                                                                        TargetControlID="txtMonthTo">
                                                                    </cc1:FilteredTextBoxExtender>--%>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtMonthToAdd" MaxLength="7" runat="server" Style="text-align: right;" ToolTip="To Days"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender runat="server" ID="FTEtxtMonthToAdd" FilterType="Numbers"
                                                    TargetControlID="txtMonthToAdd">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVtxtMonthToAdd" CssClass="validation_msg_box_sapn"
                                                        runat="server" ValidationGroup="btnAdd" ControlToValidate="txtMonthToAdd" ErrorMessage="Enter To Days"
                                                        Display="Dynamic" SetFocusOnError="true" InitialValue="">
                                                    </asp:RequiredFieldValidator>
                                                    <%-- <asp:RangeValidator ID="RVtxtMonthToAdd" runat="server" ControlToValidate="txtMonthToAdd" MinimumValue="1"
                                                Type="Integer" MaximumValue="12" ErrorMessage="Months can be between 1 and 12 only"
                                                Display="None" ValidationGroup="btnAdd"></asp:RangeValidator>--%>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Base Provision %">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnsecurePrincipalPercentage" Text='<%# Bind("Insecure_Principal") %>'
                                                MaxLength="6" runat="server" Style="text-align: right;" ToolTip="Base Provision %"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtUnsecurePrincipalPercentage" Text='<%# Bind("Insecure_Principal") %>' ToolTip="Base Provision %"
                                                    MaxLength="6" runat="server" onblur="FuncheckPercentage(this);" Style="text-align: right;"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FTEtxtUnsecurePrincipalPercentage" runat="server"
                                                    FilterType="Numbers,Custom" ValidChars="." TargetControlID="txtUnsecurePrincipalPercentage">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtUnsecurePrincipalPercentageAdd" MaxLength="6" CausesValidation="false" ToolTip="Base Provision %"
                                                    runat="server" onblur="FuncheckPercentage(this);" Style="text-align: right;"
                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FTEtxtUnsecurePrincipalPercentageAdd" runat="server"
                                                    FilterType="Numbers,Custom" ValidChars="." TargetControlID="txtUnsecurePrincipalPercentageAdd">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVtxtUnsecurePrincipalPercentageAdd" CssClass="validation_msg_box_sapn"
                                                        runat="server" ControlToValidate="txtUnsecurePrincipalPercentageAdd" ErrorMessage="Enter Base Provision %"
                                                        Display="Dynamic" ValidationGroup="btnAdd" SetFocusOnError="true" InitialValue="">
                                                    </asp:RequiredFieldValidator>
                                                    <%--<asp:RangeValidator ID="RVtxtUnsecurePrincipalPercentageAdd" runat="server" ControlToValidate="txtUnsecurePrincipalPercentageAdd"
                                                        Type="Double" MinimumValue="0" MaximumValue="100" ErrorMessage="Percentage can be between 0 and 100 only"
                                                        Display="Dynamic" ValidationGroup="btnAdd" CssClass="validation_msg_box_sapn"></asp:RangeValidator>--%>
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cash Provision %">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSecurePrincipalPercentage" Text='<%# Bind("Secure_Principal") %>' ToolTip="Cash Provision %"
                                                runat="server" onblur="FuncheckPercentage(this);" Style="text-align: right;"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtSecurePrincipalPercentage" Text='<%# Bind("Secure_Principal") %>' Style="text-align: right;" ToolTip="Cash Provision %"
                                                    MaxLength="6" runat="server" onblur="FuncheckPercentage(this);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FTEtxtSecurePrincipalPercentage" runat="server"
                                                    FilterType="Numbers,Custom" ValidChars="." TargetControlID="txtSecurePrincipalPercentage">
                                                </cc1:FilteredTextBoxExtender>
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:TextBox ID="txtSecurePrincipalPercentageAdd" MaxLength="6" class="md-form-control form-control login_form_content_input requires_true"
                                                    runat="server" onblur="FuncheckPercentage(this);" Style="text-align: right;" ToolTip="Cash Provision %"></asp:TextBox>
                                                <cc1:FilteredTextBoxExtender ID="FTEtxtSecurePrincipalPercentageAdd" runat="server"
                                                    FilterType="Numbers,Custom" ValidChars="." TargetControlID="txtSecurePrincipalPercentageAdd">
                                                </cc1:FilteredTextBoxExtender>
                                                <div class="grid_validation_msg_box">
                                                    <asp:RequiredFieldValidator ID="RFVtxtSecurePrincipalPercentageAdd" CssClass="validation_msg_box_sapn"
                                                        runat="server" ControlToValidate="txtSecurePrincipalPercentageAdd" ErrorMessage="Enter Cash Provision %"
                                                        Display="Dynamic" ValidationGroup="btnAdd" SetFocusOnError="true" InitialValue="">
                                                    </asp:RequiredFieldValidator>
                                                    <%--<asp:RangeValidator ID="RVtxtSecurePrincipalPercentageAdd" runat="server" ControlToValidate="txtSecurePrincipalPercentageAdd"
                                                        ValidationGroup="btnAdd" Type="Double" Display="Dynamic" MinimumValue="0" MaximumValue="100" CssClass="validation_msg_box_sapn"
                                                        ErrorMessage="Percentage can be between 0 and 100 only"></asp:RangeValidator>--%>
                                                </div>
                                                <span class="highlight"></span>
                                                <span class="bar"></span>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Interest Income">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkInterestIncome" Checked='<%#DataBinder.Eval(Container.DataItem, "Interest_Income").ToString().ToUpper() == "TRUE"%>'
                                                runat="server" Enabled="false" ToolTip="Interest Income" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="EditchkInterestIncome" Checked='<%#DataBinder.Eval(Container.DataItem, "Interest_Income").ToString().ToUpper() == "TRUE"%>'
                                                    runat="server" ToolTip="Interest Income" />
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="chkInterestIncomeAdd" runat="server" ToolTip="Interest Income" />
                                            </div>
                                        </FooterTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Other Income">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkOtherIncome" Checked='<%#DataBinder.Eval(Container.DataItem, "Other_Income").ToString().ToUpper() == "TRUE"%>'
                                                runat="server" Enabled="false" ToolTip="Other Income" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="EditchkOtherIncome" Checked='<%#DataBinder.Eval(Container.DataItem, "Other_Income").ToString().ToUpper() == "TRUE"%>' runat="server"
                                                    ToolTip="Other Income" />
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="chkOtherIncomeAdd" runat="server" ToolTip="Other Income" />
                                            </div>
                                        </FooterTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Manual">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkIsManual" Checked='<%#DataBinder.Eval(Container.DataItem, "IsManual").ToString().ToUpper() == "TRUE"%>' runat="server" AutoPostBack="true"
                                                OnCheckedChanged="chkIsManual_CheckedChanged" Enabled="false" ToolTip="Manual" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="chkIsManualEdit" Checked='<%#DataBinder.Eval(Container.DataItem, "IsManual").ToString().ToUpper() == "TRUE"%>' runat="server"
                                                    ToolTip="Manual" />
                                            </div>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:CheckBox ID="chkIsManualAdd" runat="server" ToolTip="Manual" />
                                            </div>
                                        </FooterTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <FooterStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="grid_btn"
                                                CausesValidation="false" AccessKey="U" ToolTip="Update, Alt+U"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" Visible="false" CommandName="Edit" CssClass="grid_btn"
                                                    CausesValidation="false" AccessKey="I" ToolTip="Edit, Alt+I"></asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <button id="btnAdd" runat="server" type="button" accesskey="A" title="Add[Alt+A]" class="grid_btn"
                                                    onclick="if(fnCheckPageValidators('btnAdd',false))" causesvalidation="false" onserverclick="btnAdd_Click">
                                                    <i class="fa fa-plus" aria-hidden="true"></i><u>A</u>dd
                                                </button>
                                            </div>
                                        </FooterTemplate>
                                        <HeaderStyle HorizontalAlign="Center" Width="5%" />
                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                        <FooterStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="grid_btn"
                                                CausesValidation="false" AccessKey="C" ToolTip="Cancel, Alt+C"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div class="md-input" style="margin: 0px;">
                                                <asp:LinkButton ID="btnRemove" runat="server" Text="Delete" CommandName="Delete" CssClass="grid_btn"
                                                    Visible="false" OnClientClick="return confirm('Are you sure want to delete?');"
                                                    CausesValidation="false" AccessKey="R" ToolTip="Delete, Alt+R"></asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:Panel>

                </div>
                <%--</td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button runat="server" id="btnSave" class="css_btn_enabled" causesvalidation="false"
                        onserverclick="btnSave_Click" validationgroup="btnSave" onclick="if(fnCheckPageValidators('btnSave'))"
                        accesskey="S" title="Save the Details[Alt+S]" type="button">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave    
                    </button>
                    <button runat="server" id="btnClear" causesvalidation="false" class="css_btn_enabled"
                        onserverclick="btnClear_Click" onclick="if(confirm('Do you want to Clear?'))"
                        accesskey="L" title="Clear the Details[Alt+L]" type="button">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear       
                    </button>
                    <button runat="server" id="btnCancel" causesvalidation="false" type="button"
                        onclick="if(confirm('Do you want to Exit?'))"
                        class="css_btn_enabled" onserverclick="btnCancel_Click" accesskey="X" title="Exit[Alt+X]">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it    
                    </button>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <%-- <tr class="styleButtonArea">
                    <td colspan="3">--%>
                        <%--<asp:CustomValidator ID="CVDelinquentParameter" runat="server" Display="None" ValidationGroup="btnSave"></asp:CustomValidator>--%>
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="styleMandatoryLabel"></asp:Label>
                        <%-- </td>
                </tr>--%>
                    </div>
                </div>
                <%--  <tr>
                    <td colspan="3">--%>
                <%-- <asp:ValidationSummary runat="server" ID="VSDelinquentParametergrid" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnAdd"
                            ShowSummary="true" />
                        <asp:ValidationSummary runat="server" ID="VSDelinquentParameter" HeaderText="Correct the following validation(s):"
                            CssClass="styleSummaryStyle" ShowMessageBox="false" ValidationGroup="btnSave"
                  <%--          ShowSummary="true" />
                    </td>
                </tr>--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        <%--function Location_ItemSelected(sender, e) {
            var hdnLocationID = $get('<%= hdnLocationID.ClientID %>');
            hdnLocationID.value = e.get_value();
        }
        function Location_ItemPopulated(sender, e) {
            var hdnLocationID = $get('<%= hdnLocationID.ClientID %>');
            hdnLocationID.value = '';
        }--%>
        function FunZerocheck(Obj1) {
            if (Obj1 != null) {
                if (Obj1.value != '');
                {
                    if (Obj1.value == '0' || Obj1.value == '00' || Obj1.value == '000') {
                        alert('Value cannot be zero');
                        Obj1.value = '';
                        Obj1.focus();
                        return;
                    }
                }
            }
        }


        function FuncheckPercentage(Obj1) {
            if (Obj1 != null) {
                if (Obj1.value != '');
                {
                    if (Obj1.value > 100) {
                        alert('Value cannot exceed 100%');
                        Obj1.value = '';
                        Obj1.focus();
                        return;
                    }
                }
            }
        }

    </script>

</asp:Content>
