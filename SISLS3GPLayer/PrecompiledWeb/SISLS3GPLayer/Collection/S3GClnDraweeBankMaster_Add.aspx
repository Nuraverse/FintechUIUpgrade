<%@ page language="C#" autoeventwireup="true" inherits="Collection_S3GClnDraweeBankMaster_Add, App_Web_3jwyxbhk" masterpagefile="~/Common/S3GMasterPageCollapse.master" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc3" TagName="AddSetup" Src="~/UserControls/AddressSetup.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--   <asp:UpdatePanel ID="upCollection" runat="server">
        <ContentTemplate>--%>
    <script language="javascript" type="text/javascript">
        function calendarShown(sender, args) {
            sender._popupBehavior._element.style.zIndex = 99999999;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlDealerCommissionRate" runat="server" CssClass="stylePanel" GroupingText="Branch Header Details"
                            Width="98%">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="lmd-input md-input">
                                        <asp:TextBox ID="txtBankCode" MaxLength="15" runat="server" ToolTip="Bank Code" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvBankCode" runat="server" ValidationGroup="Save"
                                                ControlToValidate="txtBankCode" ErrorMessage="Enter the Bank Code"
                                                Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <label class="tess">
                                            <asp:Label ID="lblBankCode" runat="server" CssClass="styleDisplayLabel" Text="Bank Code" ToolTip="Bank Code" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtBankName" runat="server" MaxLength="80" ToolTip="Bank Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="frtxtBankName" runat="server" TargetControlID="txtBankName"
                                            FilterType="Custom,UppercaseLetters,LowercaseLetters" Enabled="true" ValidChars=" ">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvtxtBankName" runat="server" ValidationGroup="Save"
                                                ControlToValidate="txtBankName" ErrorMessage="Enter the Bank Name"
                                                Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                            <asp:HiddenField ID="Isflag" runat="server" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBankName" runat="server" CssClass="styleDisplayLabel" Text="Bank Name" ToolTip="Bank Name" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffectiveFromDate" runat="server" ToolTip="Effective From Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtenderEffectiveFromDate" runat="server" Enabled="True"
                                            TargetControlID="txtEffectiveFromDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="rfvtxtEffectiveFromDate" runat="server" ValidationGroup="Save"
                                                ControlToValidate="txtEffectiveFromDate" ErrorMessage="Enter the Effective From Date"
                                                Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEffectiveFrom" runat="server" CssClass="styleDisplayLabel" Text="Effective From Date" ToolTip="Effective From Date" />
                                        </label>
                                    </div>
                                    <asp:HiddenField ID="hdnBankSerialNo" runat="server" />
                                    <asp:HiddenField ID="hdnClearSerialNo" runat="server" />
                                    <asp:HiddenField ID="hdnDRAWEEBANKBRANCH_ID" runat="server" />
                                    <asp:HiddenField ID="hdnDRAWEEBANKCLEARING_ID" runat="server" />
                                    <asp:HiddenField ID="hdnbrnchrowcount" runat="server" />
                                    <asp:HiddenField ID="hdnDefaultdate" runat="server" />
                                    <asp:HiddenField ID="branchMasterId" runat="server" />
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEffectiveToDate" runat="server" ToolTip="Effective To Date" OnTextChanged="txtEffectiveToDate_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtenderEffectiveToDate" runat="server" Enabled="True" TargetControlID="txtEffectiveToDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box" style="top: 28px !important;">
                                            <asp:RequiredFieldValidator ID="frvtxtEffectiveToDate" runat="server" ValidationGroup="Save"
                                                ControlToValidate="txtEffectiveToDate" ErrorMessage="Enter the Effective To Date"
                                                Display="Dynamic" SetFocusOnError="True" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEffectiveTo" runat="server" CssClass="styleDisplayLabel" Text="Effective To Date" ToolTip="Effective To Date" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:CheckBox ID="chkHActive" runat="server" ToolTip="Active" Checked="true" Enabled="false" />
                                        <asp:Label ID="lblActive" runat="server" CssClass="styleDisplayLabel" Text="Active" ToolTip="Active" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-9 col-xs-12">
                        <asp:Panel ID="pnlBranchDtls" runat="server" CssClass="stylePanel" GroupingText="Branch Details">
                            <div class="gird" style="height:200px">
                                <asp:GridView ID="grvBranchDtls" runat="server" DataKeyNames="MasterID" AutoGenerateColumns="False" ShowFooter="True" Width="100%"  Height="50px" OnRowCommand="grvBranchDtls_RowCommand"
                                    OnRowDeleting="grvBranchDtls_RowDeleting" OnRowDataBound="grvBranchDtls_RowDataBound" class="gird_details">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCollectionSNo" runat="server" Text='<%# Bind("SNo") %>' Width="150px" Visible="false"></asp:Label>
                                                <asp:Label runat="server" ID="Label1" Width="70%" ToolTip="S.No" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                <asp:Label ID="lblDraweebankbranch_Id" runat="server" Text='<%# Bind("Draweebankbranch_Id") %>' Width="150px" Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Drawee Branch Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBranchCode" runat="server"
                                                    Text='<%#Bind("BranchCode")%>' ToolTip="Drawee Branch Code" Width="70%"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFBranchCode" runat="server" ToolTip="Drawee Branch Code" MaxLength="15"
                                                        CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFBranchCode" runat="server" ControlToValidate="txtFBranchCode"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Branch" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Drawee Branch Code"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Drawee Branch Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIBranchName" runat="server"
                                                    Text='<%#Bind("BranchName")%>' ToolTip='<%#Bind("BranchName")%>' Width="70%"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFBranchName" runat="server" Enabled="true" ToolTip="Branch Name" MaxLength="80"
                                                        ValidationGroup="vgBank" ErrorMessage="Enter the Drawee Branch Name"
                                                        CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="frtxtFBranchName" runat="server" TargetControlID="txtFBranchName"
                                                        FilterType="Custom,UppercaseLetters,LowercaseLetters" Enabled="true" ValidChars=" ">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFBranchName" runat="server" ControlToValidate="txtFBranchName"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Branch" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Drawee Branch Name"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MICR Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIMICRCode" runat="server"
                                                    Text='<%#Bind("Micr")%>' ToolTip='<%#Bind("Micr")%>' Width="70%"></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFMICRCode" runat="server" Enabled="true" ToolTip="MICR Code" MaxLength="25"
                                                        ValidationGroup="vgBank" ErrorMessage="Enter the MICR Code"
                                                        CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="frtxtFMICRCode" runat="server" TargetControlID="txtFMICRCode"
                                                        FilterType="Custom,UppercaseLetters,LowercaseLetters,Numbers" Enabled="true" ValidChars=" ">
                                                    </cc1:FilteredTextBoxExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFMICRCode" runat="server" ControlToValidate="txtFMICRCode"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Branch" SetFocusOnError="True"
                                                            ErrorMessage="Enter the MICR Code"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Effective From Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEffFromDate" Text='<%#Bind("EffectiveFromDate")%>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFEffFromDate" runat="server" ToolTip="Effective From Date"
                                                        CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="ceFromDate" runat="server" Enabled="True"
                                                        TargetControlID="txtFEffFromDate">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtFEffFromDate" runat="server" ControlToValidate="txtFEffFromDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Branch" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Effective From Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Effective To Date">
                                            <ItemTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtHEFFECTIVETO" runat="server" Text='<%#Bind("EffectiveToDate") %>' ToolTip="Effective To" OnTextChanged="txtHEFFECTIVETO_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="calEFFECTIVETo" runat="server" Enabled="True" TargetControlID="txtHEFFECTIVETO"
                                                        OnClientDateSelectionChanged="checkDate_OnlyPrevSystemDate">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtEFFECTIVETO" runat="server" ControlToValidate="txtHEFFECTIVETO"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Save" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Effective To"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <%--<asp:Label ID="lblEffToDate" Text='<%#Bind("EffectiveToDate")%>' runat="server"></asp:Label>--%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterTemplate>
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtFEffToDate" runat="server" ToolTip="Effective To Date" OnTextChanged="txtFEffToDate_TextChanged" AutoPostBack="true"
                                                        CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="ceToDate" runat="server" Enabled="True"
                                                        TargetControlID="txtFEffToDate">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <div class="validation_msg_box" style="top: 28px !important;">
                                                        <asp:RequiredFieldValidator ID="rfvtxtEFFECTIVETO" runat="server" ControlToValidate="txtFEffToDate"
                                                            CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="Branch" SetFocusOnError="True"
                                                            ErrorMessage="Enter the Effective To Date"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <FooterStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Button ID="btnIAddress" runat="server" CssClass="grid_btn" OnClick="btnIAddress_Click" Text="Address" ToolTip="Address,Alt+E" AccessKey="E" CausesValidation="false" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnFAddress" runat="server" CssClass="grid_btn" Text="Address" OnClick="btnFAddress_Click" ValidationGroup="Branch" ToolTip="Address,Alt+F" AccessKey="F" CausesValidation="false" />
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Clearing Days">
                                            <ItemTemplate>
                                                <asp:Button ID="btnIClearingDays" runat="server" CssClass="grid_btn" OnClick="btnIClearingDays_Click" Text="Clearing Days" CausesValidation="false"
                                                    Width="85%" ToolTip="Clearing Days,Alt+G" AccessKey="G" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnFClearingDays" runat="server" CssClass="grid_btn" OnClick="btnFClearingDays_Click" Text="Clearing Days" CausesValidation="false"
                                                    Width="85%" ToolTip="Clearing Days,Alt+I" AccessKey="I" />
                                            </FooterTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MasterID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <FooterTemplate>
                                                <asp:Button ID="btnAdd" runat="server" AccessKey="K" CommandName="Add" CausesValidation="true" ValidationGroup="Branch"
                                                    OnClick="btnAdd_Click" CssClass="grid_btn" Text="Add" ToolTip="Add,Alt+K" />
                                            </FooterTemplate>
                                            <ItemTemplate>
                                                <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" OnClientClick="return confirm('Do you want to Delete this record?');"
                                                    CssClass="grid_btn_delete" Text="Delete" ToolTip="Delete"></asp:Button>
                                                <asp:Label ID="lblIsDelete" runat="server" Text='<%#Bind("Is_Delete")%>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
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
                    </div>
                </div>
                <div align="right" class="fixed_btn">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" causesvalidation="false" validationgroup="Save" runat="server" onserverclick="btnSave_ServerClick"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                        onserverclick="btnClear_ServerClick"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnExit" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnExit_Click" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                </div>

                <%--<asp:Button ID="btnSave" runat="server" AccessKey="S" CssClass="styleSubmitButton" OnClientClick="return fnCheckPageValidators();" Text="Save" ToolTip="Save,Alt+S" />
                <asp:Button ID="btnClear" runat="server" AccessKey="L" CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();" Text="Clear" ToolTip="Clear,Alt+L" />
                <asp:Button ID="btnExit" runat="server" AccessKey="X" CssClass="styleSubmitButton" OnClick="btnExit_Click" OnClientClick="return fnConfirmExit();" Text="Exit" ToolTip="Exit,Alt+X" />--%>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderAddress" runat="server" TargetControlID="btnModal" BackgroundCssClass="styleModalBackground" Enabled="true"
        PopupControlID="PnlAddress">
    </cc1:ModalPopupExtender>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderClearingDays" runat="server" TargetControlID="btnModal1"
        PopupControlID="PnlClearingDays" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="PnlClearingDays" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="80%">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%--<div class="md-input">--%>
                            <asp:Panel ID="Panel1" runat="server" class="container" CssClass="stylePanel" GroupingText="Clearing Days Details">
                                <div class="gird" style="height:150px">
                                    <asp:GridView ID="grvClearingDays" runat="server" AutoGenerateColumns="false" ShowFooter="True"
                                        OnRowDeleting="grvClearingDays_RowDeleting" OnRowDataBound="grvClearingDays_RowDataBound" OnRowCommand="grvClearingDays_RowCommand" class="gird_details">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCollectionSNo" runat="server" Text='<%# Bind("SNo") %>' Width="150px" Visible="false"></asp:Label>
                                                    <asp:Label runat="server" ID="Label1" Width="70%" ToolTip="S.No" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    <asp:Label ID="lblDraweebankbranch_Id" runat="server" Text='<%# Bind("Draweebankbranch_Id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblDraweebankclearing_Id" runat="server" Text='<%# Bind("Draweebankclearing_Id") %>' Width="150px" Visible="false"></asp:Label>
                                                    <asp:Label ID="lblHMasterIDClear" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Clearing Days" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClearingDays" Text='<%#Bind("ClearingDays")%>' ToolTip="Clearing Days" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtClearingDays" runat="server" Enabled="true" Style="text-align: right;" ToolTip="Clearing Days" MaxLength="1"
                                                            CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="Filter" runat="server" TargetControlID="txtClearingDays"
                                                            FilterType="Numbers,Custom" ValidChars="" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RequiredFieldValidator ID="rfvtxtClearingDays" runat="server" ControlToValidate="txtClearingDays"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="ClearingAdd" SetFocusOnError="True"
                                                                ErrorMessage="Enter the Clearing Days"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RangeValidator ID="Regx" runat="server" Type="Integer" Display="Dynamic" CssClass="validation_msg_box_sapn" ValidationGroup="ClearingAdd"
                                                                ControlToValidate="txtClearingDays" MaximumValue="3"
                                                                MinimumValue="0" ErrorMessage="Clearing Days should not exceed 3 days"></asp:RangeValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Effective From Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEffectiveFromDate" Text='<%#Bind("EffectiveFromDate")%>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFEffectiveFromDate" runat="server" ToolTip="Effective From Date" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="ceEffectiveFromDate" runat="server" Enabled="True"
                                                            TargetControlID="txtFEffectiveFromDate" OnClientShown="calendarShown">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RequiredFieldValidator ID="rfvtxtFEffectiveFromDate" runat="server" ControlToValidate="txtFEffectiveFromDate"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="ClearingAdd" SetFocusOnError="True"
                                                                ErrorMessage="Enter the Effective From Date"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Effective To Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEffectiveToDate" Text='<%#Bind("EffectiveToDate")%>' runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtFEffectiveToDate" runat="server" ToolTip="Effective To Date" OnTextChanged="txtFEffectiveToDate_TextChanged" AutoPostBack="true"
                                                            CssClass="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="ceEffectiveToDate" runat="server" Enabled="True"
                                                            TargetControlID="txtFEffectiveToDate" OnClientShown="calendarShown">
                                                        </cc1:CalendarExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <div class="validation_msg_box" style="top: 28px !important;">
                                                            <asp:RequiredFieldValidator ID="rfvtxtFEffectiveToDate" runat="server" ControlToValidate="txtFEffectiveToDate"
                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ValidationGroup="ClearingAdd" SetFocusOnError="True"
                                                                ErrorMessage="Enter the Effective To Date"></asp:RequiredFieldValidator>
                                                        </div>

                                                    </div>

                                                    <%--<div class="md-input" style="margin: 0px !important">
                                                        <asp:TextBox ID="txtFEffectiveToDate" runat="server" ToolTip="Effective To Date"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <cc1:CalendarExtender ID="ceEffectiveToDate" runat="server" Enabled="True"
                                                            TargetControlID="txtFEffectiveToDate">
                                                        </cc1:CalendarExtender>--%>
                                                    </div>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MasterID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHMasterID" runat="server" Text='<%#Eval("MasterID") %>' Visible="false" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <FooterTemplate>
                                                    <asp:Button ID="btnAdd" runat="server" AccessKey="L" CommandName="Add" CausesValidation="true" ValidationGroup="ClearingAdd"
                                                        CssClass="grid_btn" Text="Add" ToolTip="Add,Alt+L" />
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CssClass="grid_btn_delete"
                                                        OnClientClick="return confirm('Do you want to Delete this record?');" Text="Delete" ToolTip="Delete"></asp:Button>
                                                    <asp:Label ID="lblIsDelete" runat="server" Text='<%#Bind("Is_Delete")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                            <%--</div>--%>
                        </div>
                    </div>
                    <%--<div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Button ID="btnModalAdd" ToolTip="Save,,Alt+A" runat="server" Text="Save" class="styleSubmitButton"
                            AccessKey="A" />
                        <asp:Button ID="btnModalCancel" runat="server" OnClick="btnModalCancel_Click" ToolTip="Exit,Alt+N" Text="Exit" class="styleSubmitButton"
                            AccessKey="N" OnClientClick="return fnConfirmExit();" />
                    </div>
                </div>--%>
                    <div class="btn_height"></div>
                    <div align="right">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <%--    <asp:Button ID="btnModalAdd" ToolTip="Save,Alt+A" runat="server" Text="Save" CssClass="grid_btn"
                                OnClick="btnModalAdd_Click" AccessKey="A" />--%>
                                <button class="css_btn_enabled" id="btnModalAdd" title="Save[Alt+P]" onserverclick="btnModalAdd_ServerClick"
                                    causesvalidation="false" runat="server"
                                    type="button" accesskey="P">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sa<u>v</u>e
                                </button>
                                <%--  <asp:Button ID="btnModalCancel" runat="server" ToolTip="Exit,Alt+N" Text="Exit" CssClass="grid_btn"
                                OnClick="btnModalCancel_Click" AccessKey="N" />--%>
                                <button class="css_btn_enabled" id="btnModalCancel" onserverclick="btnModalCancel_Click" runat="server" causesvalidation="false" title="Hide[Alt+H]"
                                    type="button" accesskey="H">
                                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>H</u>ide
                                </button>
                                <%--<button class="css_btn_enabled" id="btnModalCancel" title="Exit[Alt+T]" onclick="if(fnConfirmExit())"
                                    causesvalidation="false" onserverclick="btnModalCancel_Click" runat="server"
                                    type="button" accesskey="T">
                                    <i class="fa fa-share" aria-hidden="true"></i>&emsp;Exi<u>t</u>
                                </button>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Panel ID="PnlAddress" Style="display: none; vertical-align: middle" runat="server" GroupingText="Address Details" CssClass="stylePanel"
        BorderStyle="Solid" BackColor="White" Width="60%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="md-input">
                                <uc3:AddSetup ID="ucAddressDetailsSetup" runat="server" />
                            </div>
                        </div>
                    </div>
                    <%--  <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Button ID="btnAddressSave" ToolTip="Save,,Alt+A" runat="server" Text="Save" class="styleSubmitButton"
                                    AccessKey="A" />
                                <asp:Button ID="btnAddressCancel" runat="server" OnClick="btnAddressCancel_Click" ToolTip="Exit,Alt+N" Text="Exit" class="styleSubmitButton"
                                    AccessKey="N" OnClientClick="return fnConfirmExit();" />
                            </div>
                        </div>--%>
                    <div>
                    </div>
                    <div>
                    </div>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <div class="row" align="right">

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%--    <asp:Button ID="btnModalAdd" ToolTip="Save,Alt+A" runat="server" Text="Save" CssClass="grid_btn"
                                OnClick="btnModalAdd_Click" AccessKey="A" />--%>
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            <button class="css_btn_enabled" id="btnAddressSave" title="Save[Alt+V]" onclick="if(fnCheckPageValidators('Address'))" onserverclick="btnAddressSave_ServerClick" validationgroup="Address"
                                causesvalidation="false" runat="server"
                                type="button" accesskey="V">
                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Sa<u>v</u>e
                            </button>
                            <%--  <asp:Button ID="btnModalCancel" runat="server" ToolTip="Exit,Alt+N" Text="Exit" CssClass="grid_btn"
                                OnClick="btnModalCancel_Click" AccessKey="N" />--%>
                            <button class="css_btn_enabled" id="btnAddressCancel" title="Exit[Alt+T]"
                                causesvalidation="false" onserverclick="btnAddressCancel_Click" runat="server"
                                type="button" accesskey="T">
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exi<u>t</u>
                            </button>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
    <asp:Button ID="btnModal" Style="display: none" runat="server" />
    <asp:Button ID="btnModal1" Style="display: none" runat="server" />
    <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel"
        Width="98%" ValidationGroup="vgBank" HeaderText="Correct the following validation(s):  " />--%>
    <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
