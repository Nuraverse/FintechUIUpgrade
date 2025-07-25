<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Origination_S3GOrgComplainceMaster_Add, App_Web_xumyvyef" %>

<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="AutoSugg" TagPrefix="UC3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="upCollection" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlComplainceType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlComplainceType_SelectedIndexChanged"
                                        ToolTip="Compliance Type" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblComplainceType" runat="server" CssClass="styleDisplayLabel" Text="Compliance Type" ToolTip="Compliance Type" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEffectiveFromDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                        ToolTip="Effective From Date" AutoPostBack="true" OnTextChanged="txtEffectiveFromDate_TextChanged"></asp:TextBox>
                                    <%--   <asp:Image ID="imgEffectiveFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Effective From Date" />--%>
                                    <cc1:CalendarExtender ID="CalendarExtenderEffectiveFromDate" runat="server" Enabled="True"
                                        TargetControlID="txtEffectiveFromDate">
                                    </cc1:CalendarExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEffectiveFrom" runat="server" CssClass="styleReqFieldLabel" Text="Effective From Date" ToolTip="Effective From Date" />
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtEffectiveFromDate"
                                            CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                            ErrorMessage="Select a Effective From Date" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtEffectiveToDate" runat="server" ToolTip="Effective To Date" AutoPostBack="true" OnTextChanged="txtEffectiveToDate_TextChanged"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <%-- <asp:Image ID="imgEffectiveToDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Effective To Date" />--%>
                                    <cc1:CalendarExtender ID="CalendarExtenderEffectiveToDate" runat="server" Enabled="True"
                                        TargetControlID="txtEffectiveToDate">
                                    </cc1:CalendarExtender>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblEffectiveTo" runat="server" CssClass="styleReqFieldLabel" Text="Effective To Date" ToolTip="Effective To Date" />
                                    </label>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="rfvToDate" runat="server" ControlToValidate="txtEffectiveToDate"
                                            CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                            ErrorMessage="Select a Effective To Date" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:CheckBox ID="chkHActive" runat="server" ToolTip="Active" Checked="true" Enabled="false" />
                                    <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active" ToolTip="Active" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:HiddenField ID="hdnCollectionApp" runat="server" Visible="false" Value="0" />
                                    <asp:HiddenField ID="hdnClosureApp" runat="server" Visible="false" Value="0" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <%--  <cc1:TabContainer ID="tcComplainceMaster" runat="server" CssClass="styleTabPanel"
                                Width="100%" ScrollBars="None">
                                <cc1:TabPanel runat="server" ID="TabCollection" CssClass="tabpan" BackColor="Red" HeaderText="TabCollection"
                                    Width="100%">
                                    <HeaderTemplate>
                                        Collection
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">--%>
                            <asp:Panel ID="pnlCollectionDtls" class="container" GroupingText="Collection Details"
                                runat="server" Width="100%" CssClass="stylePanel">
                                <div class="gird">
                                    <asp:GridView runat="server" ShowFooter="True" ID="grvCollectionDtls" AutoGenerateColumns="False" Width="100%" CssClass="gird_details"
                                        OnRowDataBound="grvCollectionDtls_RowDataBound" OnRowCommand="grvCollectionDtls_RowCommand" OnRowDeleting="grvCollectionDtls_RowDeleting">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCollectionSNo" runat="server" Text='<%# Bind("SNo") %>' Width="150px" Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="Label1" Width="70%" ToolTip="S.No." Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label ID="lblCollectionID" runat="server" Text='<%# Bind("CollectionID") %>' Width="150px" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType" Visible="true" runat="server" Text='<% #Bind("COLLTYPE")%>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblTypeID" Visible="false" runat="server" Text='<% #Bind("Type_ID")%>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px !important">
                                                        <asp:DropDownList ID="ddlFType" runat="server" ToolTip="Type" CssClass="md-form-control form-control login_form_content_input">
                                                        </asp:DropDownList>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="ddlFType"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                                                ErrorMessage="Select a Type" ValidationGroup="vgCollection"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Within No. of Days">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDays" runat="server" CssClass="styleTxtRightAlign" ToolTip="Within No. of Days" Text='<%# Bind("NO_OF_DAYS") %>'
                                                        Width="70%"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px !important">
                                                        <asp:TextBox ID="txtFDays" MaxLength="3" onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right"
                                                            onchange="ChkIsZero(this,'Within No. of Days')" CssClass="md-form-control form-control login_form_content_input" runat="server" ToolTip="Within No. of Days"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtFDays" runat="server" TargetControlID="txtFDays"
                                                            FilterType="Numbers,Custom">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" Display="Dynamic" ID="rfvtxtFDays" ErrorMessage="Enter Within No.of Days"
                                                                runat="server" ControlToValidate="txtFDays" ValidationGroup="vgCollection">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount(OMR)">
                                                <FooterTemplate>
                                                    <div class="md-input" style="margin: 0px !important">
                                                        <asp:TextBox ID="txtFTAmount" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="Amount(OMR)" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtFAmount" runat="server" TargetControlID="txtFTAmount"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtFAmount" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Amount(OMR)"
                                                                runat="server" ControlToValidate="txtFTAmount" ValidationGroup="vgCollection">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" CssClass="styleTxtRightAlign" Text='<%# Bind("RECEIVED_AMT")%>'
                                                        MaxLength="9" Width="70%" ToolTip="Amount" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="No.of Approvals">
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFNoofApproval" Enabled="true" Style="text-align: right" OnTextChanged="txtFNoofApproval_TextChanged" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input requires_true" MaxLength="1" ToolTip="No.of Approvals" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="fteFApprovalOrder" runat="server" TargetControlID="txtFNoofApproval"
                                                            FilterType="Numbers,Custom" InvalidChars="0">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtFApprovalOrder" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter No.of Approvals"
                                                                runat="server" ControlToValidate="txtFNoofApproval" ValidationGroup="vgColl">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter No.of Approvals"
                                                                runat="server" ControlToValidate="txtFNoofApproval" ValidationGroup="vgCollection">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box">
                                                            <asp:RangeValidator ID="rngCAPNoofApproval" runat="server" ControlToValidate="txtFNoofApproval"
                                                                MinimumValue="1" MaximumValue="9" Type="Integer" CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="vgColl"
                                                                ErrorMessage="No.of Approvals should be from 1 to 9">
                                                            </asp:RangeValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblINoofApprovals" ToolTip="No.of Approval" CssClass="styleTxtRightAlign"
                                                        Text='<%# Bind("NO_OF_APPROVAL")%>' Width="50px" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approver">
                                                <FooterTemplate>
                                                    <asp:Button ID="btnFCollectionApprover" CssClass="grid_btn" OnClick="btnFCollectionApprover_Click"
                                                        runat="server" Text="Approver" ValidationGroup="vgColl"
                                                        ToolTip="Approver,Alt+P" AccessKey="P" />
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnICollectionApprover" CssClass="grid_btn" runat="server" OnClick="btnICollectionApprover_Click"
                                                        Text="Approver" ToolTip="Approver,Alt+P" AccessKey="P" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <FooterTemplate>
                                                    <%--  <asp:Button ID="btnAdd" CssClass="grid_btn" CommandName="Add" runat="server" ToolTip="Add,Alt+T" Text="Add" AccessKey="T"
                                                    ValidationGroup="vgCollection" />--%>
                                                    <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+A" onserverclick="btnAdd_ServerClick" runat="server"
                                                        type="button" accesskey="A" validationgroup="vgCollection">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                    </button>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkDelete" runat="server" Text="Delete" ToolTip="Delete,Alt+O" OnClientClick="return confirm('Do you want to Delete this record?');"
                                                        CommandName="Delete" CssClass="grid_btn_delete" AccessKey="O"></asp:Button>
                                                    <asp:Label ID="lblIsDelete" Visible="false" runat="server" Text='<%# Bind("Is_Delete") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <span>No data Found...</span>
                                        </EmptyDataTemplate>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <%--  </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabClosure" CssClass="tabpan" BackColor="Red" HeaderText="TabClosure" Width="100%">
                                    <HeaderTemplate>
                                        Closure
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">--%>
                            <asp:Panel ID="PnlClosure" class="container" GroupingText="Closure Details" Visible="false"
                                runat="server" Width="100%" CssClass="stylePanel">
                                <div class="gird">
                                    <asp:GridView runat="server" ShowFooter="True" ID="grvClosureDtls" AutoGenerateColumns="False" Width="100%" OnRowDataBound="grvClosureDtls_RowDataBound"
                                        OnRowCommand="grvClosureDtls_RowCommand" OnRowDeleting="grvClosureDtls_RowDeleting" CssClass="gird_details">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClosureSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                    <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label ID="lblClosureID" runat="server" Text='<%# Bind("ClosureID") %>' Width="150px" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Down Payment(%)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDownPayment" runat="server" ToolTip="Down Payment" Text='<%# Bind("Down_Payment") %>'
                                                        Width="70%"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFDownPayment" onkeypress="fnAllowNumbersOnly(true,true,this)"
                                                            class="md-form-control form-control login_form_content_input requires_true" runat="server" ToolTip="Down Payment(%)"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtFDownPayment" runat="server" TargetControlID="txtFDownPayment"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDownPayment" runat="server" ControlToValidate="txtFDownPayment"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Enter Down Payment (%)" ValidationGroup="vgClosure"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box">
                                                            <asp:RangeValidator ID="rngDownPayment" runat="server" ControlToValidate="txtFDownPayment"
                                                                CssClass="validation_msg_box_sapn" MinimumValue="1" MaximumValue="100" Type="Double" Display="Dynamic" ValidationGroup="vgClosure"
                                                                ErrorMessage="Down Payment(%) should be from 1 to 100">
                                                            </asp:RangeValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Month Closure">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMonthClosure" runat="server" ToolTip="Month Closure" Text='<%# Bind("Month_Of_Closure") %>'
                                                        Width="70%"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFMonthClosure" MaxLength="2" onkeypress="fnAllowNumbersOnly(false,false,this)" Style="text-align: right"
                                                            onchange="ChkIsZero(this,'Month Closure')" class="md-form-control form-control login_form_content_input requires_true" runat="server" ToolTip="Month Closure"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtFMonth_Closure" runat="server" TargetControlID="txtFMonthClosure"
                                                            FilterType="Numbers,Custom">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator CssClass="validation_msg_box_sapn" Display="Dynamic" ID="rfvtxtFMonthClosure" ErrorMessage="Enter Month Closure"
                                                                runat="server" ControlToValidate="txtFMonthClosure" ValidationGroup="vgClosure">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <FooterStyle HorizontalAlign="Right" />
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="No.of Approvals">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIClosureApprovals" ToolTip="No.of Approval" CssClass="styleTxtRightAlign"
                                                        Text='<%# Bind("No_of_Approval")%>' Width="50px" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFClosureApproval" Enabled="true" Style="text-align: right" OnTextChanged="txtFClosureApproval_TextChanged"
                                                            class="md-form-control form-control login_form_content_input requires_true" MaxLength="1" ToolTip="No.of Approvals" runat="server"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:FilteredTextBoxExtender ID="fteFApprovalOrder" runat="server" TargetControlID="txtFClosureApproval"
                                                            FilterType="Numbers,Custom" InvalidChars="0">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtFClosureApproval" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter No.of Approvals"
                                                                runat="server" ControlToValidate="txtFClosureApproval" ValidationGroup="vgClo">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter No.of Approvals"
                                                                runat="server" ControlToValidate="txtFClosureApproval" ValidationGroup="vgClosure">
                                                            </asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box">
                                                            <asp:RangeValidator ID="rngCAPNoofApproval" runat="server" ControlToValidate="txtFClosureApproval"
                                                                MinimumValue="1" MaximumValue="9" Type="Integer" CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="vgClo"
                                                                ErrorMessage="No.of Approvals should be from 1 to 9">
                                                            </asp:RangeValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approver">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnIClosureApprover" CssClass="grid_btn" runat="server" CausesValidation="false"
                                                        OnClick="btnIClosureApprover_Click" Text="Approver" ToolTip="Approver,Alt+R" AccessKey="R" />
                                                    <%--   <button class="css_btn_enabled" id="btnIClosureApprover" title="Approver,Alt+R" causesvalidation="false" onserverclick="btnIClosureApprover_Click" runat="server"
                                                    type="button" accesskey="R" validationgroup="vgClosure">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;App<u>r</u>over
                                                </button>--%>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Button ID="btnFClosureApprover" CssClass="grid_btn" OnClick="btnFClosureApprover_Click" CausesValidation="false"
                                                        runat="server" Text="Approver" OnClientClick="return fnCheckPageValidators('vgClo',false);" ValidationGroup="vgClo"
                                                        ToolTip="Approver,Alt+R" AccessKey="R" />
                                                    <%-- <button class="css_btn_enabled" id="btnFClosureApprover" title="Approver,Alt+R" causesvalidation="false" onserverclick="btnFClosureApprover_Click" 
                                                     runat="server" type="button" accesskey="R" validationgroup="vgClosure">
                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;App<u>r</u>over
                                                </button>--%>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <%--   <asp:TemplateField HeaderText="IS Active">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkIClosureIActive" AutoPostBack="true"
                                                                                    Checked='<%#bool.Parse(Convert.ToString(DataBinder.Eval(Container.DataItem, "Active")))%>'
                                                                                    runat="server" Enabled="true" ToolTip="Active" />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:CheckBox ID="chkFClosureActive" runat="server" ToolTip="Is Active" Checked="true" Enabled="false" />
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkClosureDelete" runat="server" Text="Delete" ToolTip="Delete,Alt+K" OnClientClick="return confirm('Do you want to Delete this record?');"
                                                        CommandName="Delete" CssClass="grid_btn_delete" AccessKey="K"></asp:Button>
                                                    <asp:Label ID="lblClosureIsDelete" Visible="false" runat="server" Text='<%# Bind("Is_Delete") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <%-- <asp:Button ID="btnAdd" CssClass="grid_btn" CommandName="Add" runat="server" ToolTip="Add,Alt+T" Text="Add" AccessKey="T"
                                                    ValidationGroup="vgClosure" />--%>
                                                    <button class="css_btn_enabled" id="btnAdd" title="Add,Alt+Shift+D" onserverclick="btnAdd_ServerClick1" runat="server"
                                                        type="button" accesskey="D" validationgroup="vgClosure">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;A<u>d</u>d
                                                    </button>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="styleGridHeader" />
                                        <RowStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <%-- </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabDedupe" CssClass="tabpan" BackColor="Red" HeaderText="TabDedupe" Width="100%">
                                    <HeaderTemplate>
                                        De dupe
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">--%>
                            <asp:Panel ID="pnlDedupe" class="container" GroupingText="De dupe Details" Visible="false"
                                runat="server" Width="100%" CssClass="stylePanel">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text="NID" ID="lblNID" CssClass="styleDisplayLabel" ToolTip="NID" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkNID" runat="server" Enabled="true" ToolTip="NID" />
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text="Labour Card" ID="lblLabourCard" CssClass="styleDisplayLabel" ToolTip="Labour Card" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkLabourCard" runat="server" Enabled="true" ToolTip="Labour Card" />
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text="Name" ID="lblName" CssClass="styleDisplayLabel" ToolTip="Name" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkName" runat="server" Enabled="true" ToolTip="Name" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text="Passport" ID="lblPassport" CssClass="styleDisplayLabel" ToolTip="Passport" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkPassport" runat="server" Enabled="true" ToolTip="Passport" />
                                        </td>

                                        <td>
                                            <asp:Label runat="server" Text="CR No" ID="Label3" CssClass="styleDisplayLabel" ToolTip="CR No" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkCRNo" runat="server" Enabled="true" ToolTip="CR No" />
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text="NRID" ID="lblNRID" CssClass="styleDisplayLabel" ToolTip="NRID" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkNRID" runat="server" Enabled="true" ToolTip="NRID" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" Text="Date of Birth" ID="lblDOB" CssClass="styleDisplayLabel" ToolTip="Date of Birth" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkDOB" runat="server" Enabled="true" ToolTip="Date of Birth" />
                                        </td>
                                        <td>
                                            <asp:Label runat="server" Text="Third Party Check" ID="lblThirdPartyCheck" CssClass="styleDisplayLabel" ToolTip="Third Party Check" Visible="false" />
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkThirdPartyCheck" runat="server" Enabled="true" ToolTip="Third Party Check" Visible="false" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <%--  </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabOtherComplaince" CssClass="tabpan" BackColor="Red" HeaderText="TabOtherComplaince" Width="100%">
                                    <HeaderTemplate>
                                        Other Compliance
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">--%>
                            <asp:Panel ID="PnlOtherComplaince" class="container" GroupingText="Other Compliance Details" Visible="false"
                                runat="server" Width="100%" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtMaxAgeBorrower" class="md-form-control form-control login_form_content_input requires_true"
                                                AutoPostBack="true" onchange="ChkIsZero(this, 'Max Age of Borrower')" MaxLength="2" Style="text-align: right" ToolTip="Max Age Of Borrower" onkeypress="fnAllowNumbersOnly(false,false,this)"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftetxtMaxAgeBorrower" runat="server" TargetControlID="txtMaxAgeBorrower"
                                                FilterType="Numbers,Custom">
                                            </cc1:FilteredTextBoxExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Max Age of Borrower" ID="lblMaxAge" CssClass="styleReqFieldLabel" ToolTip="Max Age Of Borrower" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvAge" runat="server" ErrorMessage="Enter the Max Age of Borrower"
                                                    CssClass="validation_msg_box_sapn" ValidationGroup="vgHeader" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtMaxAgeBorrower">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <%-- </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabSME" CssClass="tabpan" BackColor="Red" HeaderText="TabSME" Width="100%">
                                    <HeaderTemplate>
                                        SME
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="row">--%>
                            <asp:Panel ID="Panel1" class="container" GroupingText="SME Details" Visible="false"
                                runat="server" Width="100%" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <asp:Panel ID="pnlSmall" GroupingText="Small SME Details"
                                            runat="server" Width="100%" CssClass="stylePanel">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSmallMinEmpSize" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)" MaxLength="5" ToolTip="Min Employee Size"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtSmallMinEmpSize" runat="server" TargetControlID="txtSmallMinEmpSize"
                                                            FilterType="Numbers,Custom">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Min Employee Size" ID="lblMinEmpSize" CssClass="styleReqFieldLabel" ToolTip="Min Employee Size" />
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtSmallMinEmpSize" runat="server" ControlToValidate="txtSmallMinEmpSize"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Select a Small Min Employee Size" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSmallMaxEmpSize" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)" MaxLength="5" ToolTip="Max Employee Size" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtSmallMaxEmpSize" runat="server" TargetControlID="txtSmallMaxEmpSize"
                                                            FilterType="Numbers,Custom">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Max Employee Size" ID="Label1" CssClass="styleReqFieldLabel" ToolTip="Max Employee Size" />
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtSmallMaxEmpSize" runat="server" ControlToValidate="txtSmallMaxEmpSize"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Select a Small Max Employee Size" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSmallMinTurnOver" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            ToolTip="Min Turn Over" Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtSmallMinTurnOver" runat="server" TargetControlID="txtSmallMinTurnOver"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Min Turn Over" ID="Label2" CssClass="styleReqFieldLabel" ToolTip="Min Turn Over" />
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtSmallMinTurnOver" runat="server" ControlToValidate="txtSmallMinTurnOver"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Select a Small Min Turn Over" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSmallMaxTurnOver" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            ToolTip="Max Turn Over" Style="text-align: right" onkeypress="fnAllowNumbersOnly(true,false,this)"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtSmallMaxTurnOver" runat="server" TargetControlID="txtSmallMaxTurnOver"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Max Turn Over" ID="Label4" CssClass="styleReqFieldLabel" ToolTip="Max Turn Over" />
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtSmallMaxTurnOver" runat="server" ControlToValidate="txtSmallMaxTurnOver"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Select a Small Max Turn Over" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMinSmallAssetValue" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Min Total Asset Value" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtMinSmallAssetValue" runat="server" TargetControlID="txtMinSmallAssetValue"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Min Total Asset Value" ID="lblMinAssetValue" CssClass="styleReqFieldLabel" ToolTip="Min Total Asset Value" />
                                                        </label>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RequiredFieldValidator ID="rfvtxtMinSmallAssetValue" runat="server" ControlToValidate="txtMinSmallAssetValue"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Select a Small Min Total Asset Value" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtMaxSmallAssetValue" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                            onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Max Total Asset Value" Style="text-align: right"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftetxtMaxSmallAssetValue" runat="server" TargetControlID="txtMaxSmallAssetValue"
                                                            FilterType="Numbers,Custom" ValidChars=".">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label runat="server" Text="Max Total Asset Value" ID="lblMaxAssetValue" CssClass="styleReqFieldLabel" ToolTip="Max Total Asset Value" />
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtMaxSmallAssetValue" runat="server" ControlToValidate="txtMaxSmallAssetValue"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                ErrorMessage="Select a Small Max Total Asset Value" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:Panel ID="pnlMicro" class="container" GroupingText="Micro SME Details"
                                                runat="server" Width="100%" CssClass="stylePanel">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMicroMinEmpSize" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                MaxLength="5" onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Min Employee Size" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMicroMinEmpSize" runat="server" TargetControlID="txtMicroMinEmpSize"
                                                                FilterType="Numbers,Custom">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Min Employee Size" ID="Label5" CssClass="styleReqFieldLabel" ToolTip="Min Employee Size" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMicroMinEmpSize" runat="server" ControlToValidate="txtMicroMinEmpSize"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Micro Min Employee Size" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMicroMaxEmpSize" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                MaxLength="5" onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Max Employee Size" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMicroMaxEmpSize" runat="server" TargetControlID="txtMicroMaxEmpSize"
                                                                FilterType="Numbers,Custom">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Max Employee Size" ID="Label6" CssClass="styleReqFieldLabel" ToolTip="Max Employee Size" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMicroMaxEmpSize" runat="server" ControlToValidate="txtMicroMaxEmpSize"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Micro Max Employee Size" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMicroMinTurnOver" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Min Turn Over" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMicroMinTurnOver" runat="server" TargetControlID="txtMicroMinTurnOver"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Min Turn Over" ID="Label8" CssClass="styleReqFieldLabel" ToolTip="Min Turn Over" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMicroMinTurnOver" runat="server" ControlToValidate="txtMicroMinTurnOver"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Micro Min Turn Over" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMicroMaxTurnOver" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Max Turn Over" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMicroMaxTurnOver" runat="server" TargetControlID="txtMicroMaxTurnOver"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Max Turn Over" ID="Label9" CssClass="styleReqFieldLabel" ToolTip="Max Turn Over" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMicroMaxTurnOver" runat="server" ControlToValidate="txtMicroMaxTurnOver"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Micro Max Turn Over" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMinMicroAssetValue" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                ToolTip="Min Total Asset Value" onkeypress="fnAllowNumbersOnly(true,false,this)" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMinMicroAssetValue" runat="server" TargetControlID="txtMinMicroAssetValue"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Min Total Asset Value" ID="Label10" CssClass="styleReqFieldLabel" ToolTip="Min Total Asset Value" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMinMicroAssetValue" runat="server" ControlToValidate="txtMinMicroAssetValue"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Micro Min Total Asset Value" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMaxMicroAssetValue" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Max Total Asset Value" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMaxMicroAssetValue" runat="server" TargetControlID="txtMaxMicroAssetValue"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Max Total Asset Value" ID="Label16" CssClass="styleReqFieldLabel" ToolTip="Max Total Asset Value" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMaxMicroAssetValue" runat="server" ControlToValidate="txtMaxMicroAssetValue"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Micro Max Total Asset Value" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>

                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:Panel ID="pnlMedium" class="container" GroupingText="Medium SME Details"
                                                runat="server" Width="100%" CssClass="stylePanel">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMediumMinEmpSize" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                MaxLength="5" ToolTip="Min Employee Size" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMediumMinEmpSize" runat="server" TargetControlID="txtMediumMinEmpSize"
                                                                FilterType="Numbers,Custom">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Min Employee Size" ID="Label15" CssClass="styleReqFieldLabel" ToolTip="Min Employee Size" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMediumMinEmpSize" runat="server" ControlToValidate="txtMediumMinEmpSize"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Medium Min Employee Size" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMediumMaxEmpSize" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                MaxLength="5" ToolTip="Max Employee Size" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMediumMaxEmpSize" runat="server" TargetControlID="txtMediumMaxEmpSize"
                                                                FilterType="Numbers,Custom">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Max Employee Size" ID="Label7" CssClass="styleReqFieldLabel" ToolTip="Max Employee Size" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMediumMaxEmpSize" runat="server" ControlToValidate="txtMediumMaxEmpSize"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Medium Max Employee Size" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMediumMinTurnOver" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Min Turn Over" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMediumMinTurnOver" runat="server" TargetControlID="txtMediumMinTurnOver"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Min Turn Over" ID="Label14" CssClass="styleReqFieldLabel" ToolTip="Min Turn Over" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMediumMinTurnOver" runat="server" ControlToValidate="txtMediumMinTurnOver"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Medium Min Turn Over" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMediumMaxTurnOver" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Max Turn Over" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMediumMaxTurnOver" runat="server" TargetControlID="txtMediumMaxTurnOver"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Max Turn Over" ID="Label13" CssClass="styleReqFieldLabel" ToolTip="Max Turn Over" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMediumMaxTurnOver" runat="server" ControlToValidate="txtMediumMaxTurnOver"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Medium Max Turn Over" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMinMediumAssetValue" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Min Total Asset Value" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMinMediumAssetValue" runat="server" TargetControlID="txtMinMediumAssetValue"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Min Total Asset Value" ID="Label12" CssClass="styleReqFieldLabel" ToolTip="Min Total Asset Value" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMinMediumAssetValue" runat="server" ControlToValidate="txtMinMediumAssetValue"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Medium Min Total Asset Value" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                                        <div class="md-input">
                                                            <asp:TextBox ID="txtMaxMediumAssetValue" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                onkeypress="fnAllowNumbersOnly(true,false,this)" ToolTip="Max Total Asset Value" Style="text-align: right"></asp:TextBox>
                                                            <cc1:FilteredTextBoxExtender ID="ftetxtMaxMediumAssetValue" runat="server" TargetControlID="txtMaxMediumAssetValue"
                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                            </cc1:FilteredTextBoxExtender>
                                                            <span class="highlight"></span>
                                                            <span class="bar"></span>
                                                            <label>
                                                                <asp:Label runat="server" Text="Max Total Asset Value" ID="Label11" CssClass="styleReqFieldLabel" ToolTip="Max Total Asset Value" />
                                                            </label>
                                                            <div class="validation_msg_box">
                                                                <asp:RequiredFieldValidator ID="rfvtxtMaxMediumAssetValue" runat="server" ControlToValidate="txtMaxMediumAssetValue"
                                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                                    ErrorMessage="Select a Medium Max Total Asset Value" ValidationGroup="vgHeader"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <%--  </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>--%>
                        </div>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('vgHeader'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S" validationgroup="vgHeader">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-share" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>
                <%-- <table width="100%">
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnSave" ToolTip="Save,Alt+S" AccessKey="S" runat="server" OnClick="btnSave_Click"
                                CssClass="styleSubmitButton" Text="Save"
                                ValidationGroup="vgHeader" OnClientClick="return fnCheckPageValidators('vgHeader');" />
                            <asp:Button Text="Clear" ID="btnClear" runat="server" CssClass="styleSubmitButton" ToolTip="Clear,Alt+L" AccessKey="L"
                                UseSubmitBehavior="true" OnClientClick="return fnConfirmClear();" OnClick="btnClear_Click" />
                            <asp:Button ID="btnCancel" ToolTip="Exit,Alt+X" AccessKey="X" CssClass="styleSubmitButton" runat="server"
                                Text="Exit" OnClientClick="return fnConfirmExit();" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>--%>

                <%--   <asp:ValidationSummary ID="vs_TabCollection" runat="server" CssClass="styleMandatoryLabel"
                    Width="98%" ValidationGroup="vgCollection" HeaderText="Correct the following validation(s):  " />
                <asp:ValidationSummary ID="vs_TabClosure" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" ValidationGroup="vgClosure" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
                    ShowSummary="true" />
                <asp:ValidationSummary ID="vs_TabDedupe" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" ValidationGroup="vgDedupe" Width="98%" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):  " ShowSummary="true" />
                <asp:ValidationSummary ID="vs_TabOtherComplaince" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" ValidationGroup="vgOtherComplaince" Width="98%" ShowMessageBox="false" HeaderText="Correct the following validation(s):  "
                    ShowSummary="true" />
                <asp:ValidationSummary ID="vsHeader" runat="server" CssClass="styleMandatoryLabel"
                    Enabled="true" ValidationGroup="vgHeader" Width="98%" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):  " ShowSummary="true" />--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlApprover" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderDEVApprover" runat="server" TargetControlID="btnModal1"
        PopupControlID="PnlApprover1" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="PnlApprover" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <%--    <div id="divTransaction" class="container" runat="server" style="height: 200px; width: auto; overflow: scroll">--%>
                                <asp:GridView ID="grvApprover" runat="server" AutoGenerateColumns="false" Height="50px"
                                    OnRowDataBound="grvApprover_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber")%>'
                                                    runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approver">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovalEntity" Visible="false" runat="server" Text='<% #Bind("ApprovEntity")%>'>
                                                </asp:Label>
                                                <asp:DropDownList ID="ddlApprovalEntity" ToolTip="Approver"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlApprovalEntity_SelectedIndexChanged" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Branch">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" Visible="false" runat="server" Text='<% #Bind("Location")%>'>
                                                </asp:Label>
                                                <asp:DropDownList ID="ddlLocation" ToolTip="Branch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approval Authority">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovalPerson" Visible="false" runat="server" Text='<% #Bind("ApprovPerson")%>'>
                                                </asp:Label>
                                                <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%--    <asp:Button ID="btnModalAdd" ToolTip="Save,Alt+A" runat="server" Text="Save" CssClass="grid_btn"
                                OnClick="btnModalAdd_Click" AccessKey="A" />--%>
                            <button class="css_btn_enabled" id="btnModalAdd" title="Save[Alt+V]"
                                causesvalidation="false" onserverclick="btnModalAdd_Click" runat="server"
                                type="button" accesskey="V">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sa<u>v</u>e
                            </button>
                            <%--  <asp:Button ID="btnModalCancel" runat="server" ToolTip="Exit,Alt+N" Text="Exit" CssClass="grid_btn"
                                OnClick="btnModalCancel_Click" AccessKey="N" />--%>
                            <button class="css_btn_enabled" id="btnModalCancel" title="Exit[Alt+T]"
                                causesvalidation="false" onserverclick="btnModalCancel_Click" runat="server"
                                type="button" accesskey="T">
                                <i class="fa fa-share" aria-hidden="true"></i>&emsp;Exi<u>t</u>
                            </button>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="PnlApprover1" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <%--    <div id="div1" class="container" runat="server" style="height: 200px; width: auto; overflow: scroll">--%>
                                <asp:GridView ID="grvDEVApprover" runat="server" Height="50px" AutoGenerateColumns="false"
                                    OnRowDataBound="grvDEVApprover_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSNo" Text='<% #Bind("SNo")%>' Visible="false" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sequence Number" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSequenceNumber" ToolTip="Sequence Number" Text='<% #Bind("SequenceNumber")%>'
                                                    runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approver">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovalEntity" Visible="false" runat="server" Text='<% #Bind("ApprovEntity")%>'>
                                                </asp:Label>
                                                <asp:DropDownList ID="ddlApprovalEntity" ToolTip="Approver" runat="server"
                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlApprovalEntity_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Branch">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" Visible="false" runat="server" Text='<% #Bind("Location")%>'>
                                                </asp:Label>
                                                <asp:DropDownList ID="ddlLocation" ToolTip="Branch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approval Authority">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovalPerson" Visible="false" runat="server" Text='<% #Bind("ApprovPerson")%>'>
                                                </asp:Label>
                                                <asp:DropDownList ID="ddlApprovPerson" ToolTip="Approval Authority" runat="server">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <%--  </div>--%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%--  <asp:Button ID="btnDEVModalAdd" runat="server" Text="Save" ToolTip="Save,Alt+V" CssClass="grid_btn"
                                OnClick="btnDEVModalAdd_Click" AccessKey="V" />
                            <asp:Button ID="btnDEVModalCancel" runat="server" Text="Exit" ToolTip="Exit,Alt+N" CssClass="grid_btn"
                                OnClick="btnDEVModalCancel_Click" AccessKey="N" />--%>
                            <button class="css_btn_enabled" id="btnDEVModalAdd" title="Save[Alt+Shift+E]"
                                causesvalidation="false" onserverclick="btnDEVModalAdd_Click" runat="server"
                                type="button" accesskey="E">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sav<u>e</u>
                            </button>
                            <%--  <asp:Button ID="btnModalCancel" runat="server" ToolTip="Exit,Alt+N" Text="Exit" CssClass="grid_btn"
                                OnClick="btnModalCancel_Click" AccessKey="N" />--%>
                            <button class="css_btn_enabled" id="btnDEVModalCancel" title="Exit[Alt+I]"
                                causesvalidation="false" onserverclick="btnDEVModalCancel_Click" runat="server"
                                type="button" accesskey="I">
                                <i class="fa fa-share" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                            </button>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />
    <asp:Button ID="btnModal1" Style="display: none" runat="server" />
</asp:Content>
