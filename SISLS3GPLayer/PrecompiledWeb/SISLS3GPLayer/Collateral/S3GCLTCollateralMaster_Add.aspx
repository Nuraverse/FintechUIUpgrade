<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collateral_S3GCLTCollateralMaster_Add, App_Web_1zfg0k2m" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label ID="lblHeading" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCollateralRefNo" class="md-form-control form-control login_form_content_input requires_false" runat="server"
                                        Enabled="false"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblCollateralRefNo" Text="Collateral Ref No" runat="server" CssClass="styleFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        Enabled="false">
                                    </asp:TextBox>
                                    <cc1:CalendarExtender runat="server" TargetControlID="txtDate"
                                        Format="dd/MM/yyyy" ID="calDate" Enabled="True">
                                    </cc1:CalendarExtender>
                                    <cc1:FilteredTextBoxExtender ID="ftvDate" runat="server" ValidChars="/-"
                                        FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers"
                                        Enabled="true" TargetControlID="txtDate">
                                    </cc1:FilteredTextBoxExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="true" InitialValue="" Display="Dynamic" ValidationGroup="Header"
                                            ControlToValidate="txtDate" ErrorMessage="Select Date"></asp:RequiredFieldValidator>
                                    </div>
                                    <label class="tess">
                                        <asp:Label ID="lblDate" runat="server" CssClass="styleReqFieldLabel" Text="Date"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                        CssClass="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvLineOfBusiness" runat="server" CssClass="validation_msg_box_sapn"
                                            SetFocusOnError="true" InitialValue="0" Display="Dynamic" ValidationGroup="Header"
                                            ControlToValidate="ddlLOB"></asp:RequiredFieldValidator>
                                    </div>
                                    <label class="tess">
                                        <asp:Label ID="lblLineOfBusiness" Text="Line Of Business" runat="server" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlConstitution" runat="server" AutoPostBack="true" CssClass="md-form-control form-control"
                                        OnSelectedIndexChanged="ddlConstitution_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblConstitution" Text="Constitution" runat="server" CssClass="styleFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" CssClass="md-form-control form-control"
                                        OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblProduct" Text="Scheme" runat="server" CssClass="styleFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkActive" runat="server" Checked="true" Enabled="false" AutoPostBack="false" />
                                    <label class="tess">
                                        <asp:Label ID="lblActive" runat="server" Text="Active" CssClass="styleFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" type="submit" id="btnGo" runat="server" accesskey="G" title="Go[Alt+G]" onserverclick="btnGo_Click"
                        validationgroup="Header" enabled="false">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                </div>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Collateral Details">
                            <div class="gird">
                                <asp:GridView ID="grdCollateral" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                    OnRowCommand="grdCollateral_RowCommand" OnRowDataBound="grdCollateral_RowDataBound"
                                    OnRowEditing="grdCollateral_RowEditing" OnRowUpdating="grdCollateral_RowUpdating"
                                    OnRowCancelingEdit="grdCollateral_RowCancelingEdit" OnRowDeleting="grdCollateral_RowDeleting" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSlNo" runat="server" Text='<% #Container.DataItemIndex + 1%>'></asp:Label>
                                                <%--<asp:HiddenField ID="hdnSlno" runat="server" Value='<%#Eval("Serial_Number") %>' />--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description" FooterStyle-Wrap="true">
                                            <ItemTemplate>
                                                <asp:TextBox ID="lblDescription" BorderStyle="None" ReadOnly="true" TextMode="MultiLine"
                                                    runat="server" Text='<% #Bind("Description")%>' class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtDescription" runat="server" MaxLength="80" onkeyup="maxlengthfortxt(80);"
                                                        TextMode="MultiLine" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftvDescription" runat="server" InvalidChars="`~!@#$%^&*()-_=+/?><';:"
                                                        FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" FilterMode="InvalidChars"
                                                        Enabled="true" TargetControlID="txtDescription">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                                            ErrorMessage="Enter the Description" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValidationGroup="Footer"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtDescription" runat="server" onkeyup="maxlengthfortxt(80);" TextMode="MultiLine"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftvDescription" runat="server" InvalidChars="`~!@#$%^&*({}[]\|)-_=+/?><.,';:"
                                                        FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" FilterMode="InvalidChars"
                                                        Enabled="true" TargetControlID="txtDescription">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                                            ErrorMessage="Enter the Description" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValidationGroup="Footer"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Collateral Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCollateralType" runat="server" Text='<% #Bind("CollateralType")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlCollateralType1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCollateralType1_SelectedIndexChanged"
                                                        CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCollateralType" runat="server" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="true" InitialValue="0" Display="Dynamic" ErrorMessage="Select a Collateral Type"
                                                            ValidationGroup="Footer" ControlToValidate="ddlCollateralType1"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlCollateralType" runat="server" OnSelectedIndexChanged="ddlCollateralType_SelectedIndexChanged"
                                                        AutoPostBack="true" CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCollateralType" runat="server" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="true" InitialValue="0" Display="Dynamic" ErrorMessage="Select a Collateral Type"
                                                            ValidationGroup="Footer" ControlToValidate="ddlCollateralType"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Collateral Securities">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCollateralSecurities" runat="server" Text='<% #Bind("CollateralSecurities")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlCollateralSecurities" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCollateralSecurities" runat="server" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="true" InitialValue="0" Display="Dynamic" ErrorMessage="Select a Collateral Securities"
                                                            ValidationGroup="Footer" ControlToValidate="ddlCollateralSecurities"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:DropDownList ID="ddlCollateralSecurities" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                    </asp:DropDownList>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvCollateralSecurities" runat="server" CssClass="validation_msg_box_sapn"
                                                            SetFocusOnError="true" InitialValue="0" Display="Dynamic" ErrorMessage="Select a Collateral Securities"
                                                            ValidationGroup="Footer" ControlToValidate="ddlCollateralSecurities"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ownership % From" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromO" runat="server" Text='<% #Bind("FromOwnership")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromO" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                        MaxLength="3"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fteFromO" runat="server" FilterType="Numbers" TargetControlID="txtFromO">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvFromO" ControlToValidate="txtFromO"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'From' Ownership Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvFromO" runat="server" ControlToValidate="txtFromO" ErrorMessage="From Ownership percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromO" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                        MaxLength="3"></asp:TextBox>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvFromO" ControlToValidate="txtFromO"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'From' Ownership Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvFromO" runat="server" ControlToValidate="txtFromO" ErrorMessage="From Ownership percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteFromO" runat="server" FilterType="Numbers" TargetControlID="txtFromO">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ownership % To" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToO" runat="server" Text='<% #Bind("ToOwnership")%>' Style="text-align: right"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToO" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                        MaxLength="3"></asp:TextBox>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvToO" ControlToValidate="txtToO"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'To' Ownership Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvToO" runat="server" ControlToValidate="txtToO" ErrorMessage="To Ownership percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteToO" runat="server" FilterType="Numbers" TargetControlID="txtToO">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToO" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                        MaxLength="3"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fteToO" runat="server" FilterType="Numbers" TargetControlID="txtToO">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvToO" ControlToValidate="txtToO"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'To' Ownership Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvToO" runat="server" ControlToValidate="txtToO" ErrorMessage="To Ownership percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Loan Worth % From" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromL" runat="server" Text='<% #Bind("FromLoan")%>'
                                                    Style="text-align: right"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromL" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvFromL" ControlToValidate="txtFromL"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'From' Loan Worth Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvFromL" runat="server" ControlToValidate="txtFromL" ErrorMessage="From Loan Worth percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteFromL" runat="server" FilterType="Numbers,Custom"
                                                        ValidChars="." TargetControlID="txtFromL">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtFromL" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvFromL" ControlToValidate="txtFromL"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'From' Loan Worth Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvFromL" runat="server" ControlToValidate="txtFromL" ErrorMessage="From Loan Worth percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteFromL" runat="server" FilterType="Numbers,Custom"
                                                        ValidChars="." TargetControlID="txtFromL">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Loan Worth % To" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToL" runat="server" Text='<% #Bind("ToLoan")%>' Style="text-align: right"></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToL" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvToL" ControlToValidate="txtToL"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'To' Loan Worth Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvToL" runat="server" ControlToValidate="txtToL" ErrorMessage="To Loan Worth percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteToL" runat="server" FilterType="Numbers,Custom"
                                                        ValidChars="." TargetControlID="txtToL">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtToL" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvToL" ControlToValidate="txtToL"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter 'To' Loan Worth Percentage"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvToL" runat="server" ControlToValidate="txtToL" ErrorMessage="To Loan Worth percentage Must be &gt; 0"
                                                            Operator="GreaterThan" ValidationGroup="Footer" Type="Double" Display="Dynamic" CssClass="validation_msg_box_sapn"
                                                            ValueToCompare="0" />
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="fteToL" runat="server" FilterType="Numbers,Custom"
                                                        ValidChars="." TargetControlID="txtToL">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Weightage" FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right"
                                            HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblWeightage" Style="text-align: right" runat="server" Text='<% #Bind("Weightage")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtWeightage" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fteWeightage" runat="server" FilterType="Numbers,Custom"
                                                        ValidChars="." TargetControlID="txtWeightage">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvWeightage" ControlToValidate="txtWeightage"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter Weightage" InitialValue=""></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvWeightage" runat="server" ControlToValidate="txtWeightage"
                                                            ErrorMessage="Weightage Percentage Must be &gt; 0" Operator="GreaterThan" ValidationGroup="Footer"
                                                            Type="Double" Display="Dynamic" ValueToCompare="0" CssClass="validation_msg_box_sapn" />
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtWeightage" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="fteWeightage" runat="server" FilterType="Numbers,Custom"
                                                        ValidChars="." TargetControlID="txtWeightage">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="grid_validation_msg_box">
                                                        <asp:CompareValidator ID="cvWeightage" runat="server" ControlToValidate="txtWeightage" CssClass="validation_msg_box_sapn"
                                                            ErrorMessage="Weightage Percentage Must be &gt; 0" Operator="GreaterThan" ValidationGroup="Footer"
                                                            Type="Double" Display="Dynamic" ValueToCompare="0" />
                                                        <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" ID="rfvWeightage" ControlToValidate="txtWeightage"
                                                            runat="server" ValidationGroup="Footer" Display="Dynamic" ErrorMessage="Enter Weightage"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CollateralTypeValue" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCollateralTypeValue" runat="server" Text='<% #Bind("CollateralTypeValue")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CollateralSecuritiesValue" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCollateralSecuritiesValue" runat="server" Text='<% #Bind("CollateralSecuritiesValue")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblID" runat="server" Text='<% #Bind("ID")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mode" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMode" runat="server" Text='<% #Bind("Mode")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mode" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIS_ACTIVE" runat="server" Text='<% #Bind("IS_ACTIVE")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CausesValidation="false"
                                                    CommandName="Edit" class="grid_btn" AccessKey="I" title="Edit[Alt+I]"></asp:LinkButton>
                                                <%-- <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false"
                                                    CommandName="Delete" class="grid_btn_delete" AccessKey="T" title="Delete[Alt+T]"></asp:LinkButton>--%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="lnkUpdate" CausesValidation="true" ValidationGroup="Footer" CommandName="Update"
                                                    runat="server" Text="Update" class="grid_btn" AccessKey="U" title="Update[Alt+U]"></asp:LinkButton>
                                                <%--   &nbsp;<asp:LinkButton ID="lnkCancelEdit" runat="server" CommandName="Cancel" CausesValidation="false"
                                                    Text="Cancel" class="grid_btn" AccessKey="N" title="Cancel[Alt+N]"></asp:LinkButton>--%>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <button id="btnAdd" runat="server" type="button" accesskey="A" title="Add[Alt+A]"
                                                    causesvalidation="true" class="grid_btn" validationgroup="Footer" onserverclick="btnGvAdd_Click">
                                                    <i class="fa fa-plus" aria-hidden="true"></i><u>A</u>dd
                                                </button>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chk" runat="server" OnCheckedChanged="chk_CheckedChanged" AutoPostBack="true" />
                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" Visible="false"
                                                    CommandName="Delete" class="grid_btn_delete" AccessKey="T" title="Delete[Alt+T]"></asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                &nbsp;<asp:LinkButton ID="lnkCancelEdit" runat="server" CommandName="Cancel" CausesValidation="false"
                                                    Text="Cancel" class="grid_btn" AccessKey="N" title="Cancel[Alt+N]"></asp:LinkButton>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div align="right">
                                <div>
                                    <asp:Label ID="lblTotal" runat="server" Text="Total" CssClass="styleFieldLabel"></asp:Label>
                                    <asp:TextBox ID="txtTotal" Width="8%" Enabled="false" ContentEditable="false" runat="server" Style="text-align: right"></asp:TextBox>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button id="btnSave" runat="server" causesvalidation="false" validationgroup="Header" accesskey="S" title="Save[Alt+S]"
                        class="css_btn_enabled" type="button" onclick="if(fnCheckPageValidators('Header'))" onserverclick="btnSave_Click">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave   
                    </button>
                    <button id="btnClear" runat="server" onclick="if(fnConfirmClear())" accesskey="L" title="Clear[Alt+L]"
                        causesvalidation="false" class="css_btn_enabled" type="button" onserverclick="btnClear_Click">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                    </button>
                    <button id="btnCancel" runat="server" causesvalidation="false" accesskey="X" title="Exit[Alt+X]"
                        onclick="if(fnConfirmExit())" class="css_btn_enabled" type="button" onserverclick="btnCancel_Click">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%--<tr>
                    <td>
                        <asp:ValidationSummary ID="vsFooter" runat="server" ValidationGroup="Footer" HeaderText="Correct the Following Validation(s)"
                            ShowMessageBox="false" ShowSummary="true" />
                        <asp:ValidationSummary ID="vsHeader" runat="server" ValidationGroup="Header" HeaderText="Correct the Following Validation(s)"
                            ShowMessageBox="false" ShowSummary="true" />
                    </td>
                </tr>--%>
                <div class="row" style="margin-top: 10px; align-content: center">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Label ID="lblErrorMessage" runat="server" class="styleMandatoryLabel"></asp:Label>
                        <asp:HiddenField ID="hdnRowId" runat="server" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script language="javascript" type="text/javascript">
        function fncheckvalue(txtbox) {

            if (document.getElementById(txtbox).value > 100) {
                alert('Percentage value cannot be greater than 100');
                document.getElementById(txtbox).value = '';
            }
        }
    </script>

</asp:Content>
