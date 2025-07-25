<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FA_MLMJV_Template, App_Web_4hds5vgj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/FALOVMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register Src="~/UserControls/PageNavigator.ascx" TagPrefix="uc1" TagName="PageNavigator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../Scripts/jquery-1.3.2.min.js"></script>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="tab-content" class="tab-content">
                        <div class="tab-pane fade in active show" id="tab1">
                            <div class="row">
                                <div class="col">
                                    <h6 class="title_name">
                                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel">
                                        </asp:Label>
                                    </h6>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlHeader" runat="server" CssClass="stylePanel">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMJVNo" onmouseover="txt_MouseoverTooltip(this)"
                                                        ToolTip="MJV Number" runat="server" ReadOnly="true"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMJVNO" runat="server" Text="Std JV Template Number"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <UC:Suggest ID="ddlLocation" runat="server" IsMandatory="true" ServiceMethod="GetBranchList" ErrorMessage="Select a Location"
                                                        ValidationGroup="vgSave" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblLocation" runat="server" Text="Location *"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlActivity" runat="server"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ValidationGroup="vgSave" ErrorMessage="Slect the Activity"
                                                            ControlToValidate="ddlActivity" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblActivity" runat="server" Text="Activity *"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtTemplateDesc" runat="server" MaxLength="100"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvTemplateDesc" runat="server" ValidationGroup="vgSave" ErrorMessage="Enter the Template Desc"
                                                            ControlToValidate="txtTemplateDesc" CssClass="validation_msg_box_sapn" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblTemplateName" runat="server" Text="Template Desc *"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMJVStartDate" ToolTip="Schedule Start Date" runat="server" MaxLength="15"
                                                        onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtMJVStartDate_TextChanged"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgMJVStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="False" />
                                                    <cc1:CalendarExtender ID="ceMJVStartDate" runat="server" Enabled="True"
                                                        PopupButtonID="imgMJVStartDate"
                                                        TargetControlID="txtMJVStartDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ErrorMessage="Select Schedule Start Date" ValidationGroup="vgSave"
                                                            ID="rfvMJVStartDate" runat="server" ControlToValidate="txtMJVStartDate" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMJVStartDate" runat="server" Text="Schedule Start Date *"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtMjvEndDate" ToolTip="Schedule End Date" runat="server" MaxLength="15"
                                                        onmouseover="txt_MouseoverTooltip(this)" OnTextChanged="txtMjvEndDate_TextChanged"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <asp:Image ID="imgMJVEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="False" />
                                                    <cc1:CalendarExtender ID="ceMJVEndDate" runat="server" Enabled="True" PopupButtonID="imgMJVEndDate" TargetControlID="txtMjvEndDate">
                                                    </cc1:CalendarExtender>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ErrorMessage="Select Schedule End Date" ValidationGroup="vgSave"
                                                            ID="rfvMJVEndDate" runat="server" ControlToValidate="txtMjvEndDate" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblMJVEndDate" runat="server" Text="Schedule End Date *"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddlFrequency" runat="server" onChange="javascript:funOnFrequencyChange()"
                                                        class="md-form-control form-control">
                                                    </asp:DropDownList>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvFrequncy" runat="server" ControlToValidate="ddlFrequency" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" ErrorMessage="Select the Frequency" ValidationGroup="vgSave" InitialValue="0"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFrequency" runat="server" Text="Frequency *"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:CheckBoxList ID="chklstFrquency" runat="server" RepeatDirection="Horizontal" Style="display: none;">
                                                        <asp:ListItem Text="S" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="T" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="W" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="T" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="F" Value="6"></asp:ListItem>
                                                        <asp:ListItem Text="S" Value="7"></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                    <asp:TextBox ID="txtFrqText" runat="server" onmouseover="txt_MouseoverTooltip(this)" MaxLength="2" Style="display: none;"
                                                        onblur="fnCheckDays(this);" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <cc1:FilteredTextBoxExtender ID="ftbeFrqText" runat="server" TargetControlID="txtFrqText" FilterType="Numbers" Enabled="True"></cc1:FilteredTextBoxExtender>

                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="rfvFrequencyTxt" runat="server" ControlToValidate="txtFrqText" Display="Dynamic" ErrorMessage="Enter the Day of Month"
                                                            Enabled="False" ValidationGroup="vgSave" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblFrqText" runat="server" Text="FrqText" Style="visibility: hidden;"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:CheckBox ID="cbxReversal" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <asp:Label ID="lblReversal" runat="server" Text="Reversal" CssClass="styleDisplayLabel"></asp:Label>

                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="md-input">
                                                    <asp:CheckBox ID="cbxIsActive" runat="server" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>

                                                    <asp:Label ID="lblActive" runat="server" Text="Active" CssClass="styleDisplayLabel"></asp:Label>
                                                    <asp:ImageButton ID="imgbtnExport" runat="server" ImageUrl="~/Images/Excel_Over.png" ImageAlign="AbsBottom" ToolTip="Export Journal Details"
                                                        OnClick="imgbtnExport_Click" Style="width: 20px; height: 20px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlJV" runat="server" CssClass="stylePanel" Width="100%" GroupingText="Standard JV Details"
                                        HorizontalAlign="Center">
                                        <center>
                                            <div class="row">
                                                <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                    <asp:Label ID="lblTotalDebit" runat="server" Text="Total Debit" Style="font-family: Calibri Arial SimHei; font-size: 14px;"></asp:Label>
                                                    <asp:Label ID="lblTtlDebit" runat="server" Width="150px" Style="font-family: Calibri Arial SimHei; font-size: 14px;"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <asp:Label ID="lblTotalCredit" runat="server" Text="Total Credit" Style="font-family: Calibri Arial SimHei; font-size: 14px;"></asp:Label>
                                                    <asp:Label ID="lblTtlCredit" runat="server" Width="150px" Style="font-family: Calibri Arial SimHei; font-size: 14px;"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="gird">
                                                        <asp:GridView runat="server" ShowFooter="True" ID="gvManualJournal" OnRowDataBound="gvManualJournal_RowDataBound"
                                                            OnRowCommand="gvManualJournal_RowCommand" OnRowEditing="gvManualJournal_RowEditing"
                                                            OnRowDeleting="gvManualJournal_RowDeleting" OnRowCancelingEdit="gvManualJournal_RowCancelingEdit"
                                                            OnRowUpdating="gvManualJournal_RowUpdating" Width="98%" AutoGenerateColumns="False"
                                                            HorizontalAlign="Center" EnableModelValidation="True" CssClass="gird_details">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl No">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" ID="lblSNO" Text='<%#Container.DataItemIndex+1%>' ToolTip="Sl No"></asp:Label>
                                                                        <asp:Label ID="lblMJVDetailID" runat="server" Text='<%#Eval("MJVDetail_ID") %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblTmpDtlID" runat="server" Text='<%#Eval("TmpDetail_ID") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="2%" />
                                                                    <FooterStyle Width="2%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Location">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("Location_desc")%>' ID="lbllocation" ToolTip="Location"></asp:Label>
                                                                        <asp:Label ID="lblLoctionID" runat="server" Text='<%#Eval("Location_ID") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <center>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlFtrLocation" runat="server" AutoPostBack="true" ServiceMethod="GetBranchList" ItemToValidate="Value"
                                                                                    IsMandatory="true" ValidationGroup="VgAdd" ErrorMessage="Select a Location" OnItem_Selected="ddlFtrLocation_Item_Selected"
                                                                                    class="md-form-control form-control" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </center>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <center>

                                                                            <UC:Suggest ID="ddlEdtLocation" runat="server" AutoPostBack="true" ServiceMethod="GetBranchList" ItemToValidate="Value"
                                                                                IsMandatory="true" ValidationGroup="VgUpdate" ErrorMessage="Select a Location" OnItem_Selected="ddlEdtLocation_Item_Selected" />
                                                                            <asp:Label ID="lblEdtMJVDetailID" runat="server" Text='<%#Eval("MJVDetail_ID") %>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblEdtTmpDtlID" runat="server" Text='<%#Eval("TmpDetail_ID") %>' Visible="false"></asp:Label>
                                                                        </center>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" Wrap="False" />
                                                                    <FooterStyle HorizontalAlign="Left" Width="15%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Account">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("GL_Code")%>' ID="lblGLCode" ToolTip="Account" Visible="false"></asp:Label>
                                                                        <asp:Label runat="server" Text='<%#Eval("GL_Desc")%>' ID="lblGLCodeDesc" ToolTip="Account"></asp:Label>
                                                                        <asp:Label ID="lblgdAccountLeg" runat="server" Text='<%#Eval("Acc_Leg") %>' Visible="false"></asp:Label>
                                                                        <asp:Label ID="lblgdAccountNature" runat="server" Text='<%#Eval("Acc_Nature") %>' Visible="false"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <center>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <UC:Suggest ID="ddlFtrGLCode" runat="server" ServiceMethod="GetGLCodeList" IsMandatory="true" ValidationGroup="VgAdd"
                                                                                    ErrorMessage="Select a Account Code" OnItem_Selected="ddlFtrGLCode_Item_Selected" AutoPostBack="true"
                                                                                    CssClass="md-form-control form-control login_form_content_input" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                            <asp:Label ID="lblFtrAccountLeg" runat="server" Text="" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblFtrAccountNature" runat="server" Text="" Visible="false"></asp:Label>
                                                                        </center>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <center>
                                                                            <UC:Suggest ID="ddlEdtGLCode" runat="server" ServiceMethod="GetGLCodeListEdt" IsMandatory="true" ValidationGroup="VgUpdate"
                                                                                AutoPostBack="true" OnItem_Selected="ddlEdtGLCode_Item_Selected" ErrorMessage="Select a Account Code" />
                                                                            <asp:Label ID="lblEdtAccountLeg" runat="server" Text="" Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblEdtAccountNature" runat="server" Text="" Visible="false"></asp:Label>
                                                                        </center>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" Wrap="False" />
                                                                    <FooterStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Sub Account">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("SL_Code")%>' ID="lblSLCode" ToolTip="Sub Account" Visible="false"></asp:Label>
                                                                        <asp:Label runat="server" Text='<%#Eval("SL_Desc")%>' ID="lblSLCodeDesc" ToolTip="Sub Account"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <UC:Suggest ID="ddlFtrSLCode" runat="server" ServiceMethod="GetSLCodeList" IsMandatory="false" ValidationGroup="VgAdd"
                                                                                ErrorMessage="Select a Sub Account" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <UC:Suggest ID="ddlEdtSLCode" runat="server" ServiceMethod="GetSLCodeListEdt" IsMandatory="false" ValidationGroup="VgUpdate"
                                                                            ErrorMessage="Select a Sub Account" class="md-form-control form-control" />
                                                                    </EditItemTemplate>
                                                                    <HeaderStyle Wrap="False" />
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Debit">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("Debit")%>' ID="lblDebit" ToolTip="Debit"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <center>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox MaxLength="15" Width="120px" runat="server" ID="txtFtrDebit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" Style="text-align: right;" ToolTip="Debit"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftbeFtrDebit" runat="server" TargetControlID="txtFtrDebit"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </center>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <center>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox MaxLength="15" Width="120px" Text='<%#Eval("Debit")%>' runat="server"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" ToolTip="Debit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    Style="text-align: right;" ID="txtEdtDebit" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftbeEdtDebit" runat="server" TargetControlID="txtEdtDebit"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </center>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Credit">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("Credit")%>' ID="lblCredit" ToolTip="Credit"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <center>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox MaxLength="15" Width="120px" runat="server" ID="txtFtrCredit" ToolTip="Credit"
                                                                                    onmouseover="txt_MouseoverTooltip(this)" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                    Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftbeFtrCredit" runat="server" TargetControlID="txtFtrCredit"
                                                                                    FilterType="Numbers,Custom" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </center>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:TextBox MaxLength="15" Width="120px" runat="server" Text='<%#Eval("Credit")%>'
                                                                                onmouseover="txt_MouseoverTooltip(this)" ToolTip="Credit" onkeypress="fnAllowNumbersOnly(true,false,this)"
                                                                                Style="text-align: right;" ID="txtEdtCredit" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            <cc1:FilteredTextBoxExtender ID="ftbeEdtCredit" runat="server" TargetControlID="txtEdtCredit"
                                                                                FilterType="Numbers,Custom" ValidChars=".">
                                                                            </cc1:FilteredTextBoxExtender>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="DIM1" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("DIM1_Desc")%>' ID="lblgdDIM1_Desc" ToolTip="DIM1"></asp:Label>
                                                                        <asp:Label ID="lblgdDim1ID" runat="server" Text='<%#Eval("DIM1_ID")%>' Visible="false" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlFtrDIM1" Width="130px" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlFtrDIM1_SelectedIndexChanged"
                                                                                CssClass="md-form-control form-control login_form_content_input" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="ddlEdtDIM1" Width="130px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEdtDIM1_SelectedIndexChanged" />
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    <FooterStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="DIM2" Visible="False">
                                                                    <ItemTemplate>
                                                                        <asp:Label runat="server" Text='<%#Eval("DIM2_Desc")%>' ID="lblgdDIM2_Desc" ToolTip="DIM2"></asp:Label>
                                                                        <asp:Label ID="lblgdDim2ID" runat="server" Text='<%#Eval("DIM2_ID")%>' Visible="false" />
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <div class="md-input" style="margin: 0px;">
                                                                            <asp:DropDownList ID="ddlFtrDIM2" Width="130px" runat="server"
                                                                                CssClass="md-form-control form-control login_form_content_input" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="ddlEdtDIM2" Width="130px" runat="server" />
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    <FooterStyle HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lblDIM" runat="server" Text="DIM" />
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imgbtngdShow" src="../Images/Dimm2.JPG" runat="server" ToolTip="Show DIM" Enabled="false" OnClick="imgbtngdShow_Click" />
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:ImageButton ID="imgbtnEdtShow" src="../Images/Dimm2.JPG" runat="server" ToolTip="Show DIM" OnClick="imgbtnEdtShow_Click" />
                                                                    </EditItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:ImageButton ID="imgbtnFtrShow" src="../Images/Dimm2.JPG" runat="server" ToolTip="Show DIM" OnClick="imgbtnFtrShow_Click" />
                                                                    </FooterTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="2%" />
                                                                    <FooterStyle HorizontalAlign="Left" Width="2%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Remarks">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblgdRemarks" runat="server" Text='<%#Eval("Remarks")%>' Style="word-wrap: normal; word-break: break-all; text-align: left">
                                                                        </asp:Label>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <center>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox runat="server" TextMode="MultiLine" ValidationGroup="Footer" MaxLength="300"
                                                                                    ToolTip="Remarks" onkeyup="maxlengthfortxt(300);" ID="txtFtrRemarks"
                                                                                    CssClass="md-form-control form-control login_form_content_input"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </center>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <center>
                                                                            <asp:TextBox runat="server" Width="120px" TextMode="MultiLine" Text='<%#Eval("Remarks")%>'
                                                                                ToolTip="Remarks" ValidationGroup="Footer" MaxLength="300" onkeyup="maxlengthfortxt(300);"
                                                                                ID="txtEdtRemarks"></asp:TextBox>
                                                                        </center>
                                                                    </EditItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                    <FooterStyle HorizontalAlign="Left" Width="15%" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CausesValidation="false"
                                                                            ToolTip="Edit">
                                                                        </asp:LinkButton>&nbsp;|
                                                                                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                                                                            OnClientClick="return confirm('Do you want to Delete this record?');"
                                                                                            ToolTip="Delete">
                                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        <asp:LinkButton ID="lnkAdd" runat="server" CommandName="Add" ValidationGroup="VgAdd"
                                                                            ToolTip="Add" CssClass="grid_btn" Text="Add"></asp:LinkButton>
                                                                    </FooterTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update"
                                                                            ValidationGroup="VgUpdate" ToolTip="Update"></asp:LinkButton>&nbsp;|
                                                                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                                                                            CausesValidation="false" ToolTip="Cancel"></asp:LinkButton>
                                                                    </EditItemTemplate>
                                                                    <FooterStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <span runat="server" id="lblPagingErrorMessage" style="color: Red; font-size: medium"></span>
                                                </div>
                                            </div>
                                        </center>
                                        <asp:HiddenField ID="hdn_DIM1_Type" runat="server" />
                                        <asp:HiddenField ID="hdn_DIM2_Type" runat="server" />
                                    </asp:Panel>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('vgSave'))" causesvalidation="false"
                                    onserverclick="btnSave_Click" runat="server"
                                    type="button" accesskey="S" validationgroup="vgSave">
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
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <cc1:ModalPopupExtender ID="popup" runat="server" TargetControlID="btnpop" PopupControlID="pnlpop"
                                        BackgroundCssClass="styleModalBackground" DynamicServicePath=""
                                        Enabled="True">
                                    </cc1:ModalPopupExtender>
                                    <asp:Panel ID="pnlpop" runat="server" Style="display: none" BackColor="White"
                                        BorderStyle="Solid">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="md-input">
                                                    <asp:DropDownList ID="ddl" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true" />
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Button runat="server" ID="btnpop" CssClass="styleSubmitButton" Text="Ok" Style="display: none" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:ValidationSummary runat="server" ID="vsUserMgmt" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="vgSave" Width="500px"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSAdd" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgAdd" Width="500px"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <asp:ValidationSummary runat="server" ID="VSUpdate" HeaderText="Correct the following validation(s):"
                                        Height="250px" CssClass="styleMandatoryLabel" ValidationGroup="VgUpdate" Width="500px"
                                        ShowMessageBox="false" ShowSummary="true" />
                                    <input type="hidden" runat="server" value="0" id="hdnRowID" />
                                    <input type="hidden" runat="server" value="1" id="hdnAccValid" />
                                    <input type="hidden" runat="server" value="0" id="hdnStatus" />
                                    <asp:CustomValidator ID="cvManualJournal" runat="server" CssClass="styleMandatoryLabel"
                                        Enabled="true" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="imgbtnExport" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        function fnCancelClick() {
            if (confirm('Do you want to cancel?')) {
                return true;
            }
            else {
                return false;
            }
        }

        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }

        function funClearDbtCrdVal(objOption, objDebit, objCredit, intPrefix, IntSuffix, strfield) {
            var txtDebit = document.getElementById(objDebit);
            var txtCredit = document.getElementById(objCredit);
            //Debit Amount validation starts
            if (objOption == 1) {
                if (txtDebit.value != "") {
                    var strDebit = txtDebit.value.split(".");
                    if (parseFloat(txtDebit.value) == 0) {
                        alert(strfield + ' should be greater than 0');
                        txtDebit.value = '';
                        return
                    }

                    if (strDebit[0].length > intPrefix) {
                        alert(strfield + ' should not exceed ' + intPrefix + ' digits');
                        txtDebit.focus();
                        return
                    }

                    if (strDebit[1] != null) {
                        if (strDebit[1].length > IntSuffix) {
                            strDebit[1] = strDebit[1].substring(0, IntSuffix);
                            txtDebit.value = strDebit[0] + '.' + strDebit[1];
                        }
                    }
                    txtCredit.value = '';
                }
            }
            //Debit Amount validation ends

            //Credit Amount validation starts
            if (objOption == 2) {
                if (txtCredit.value != "") {
                    var strCredit = txtCredit.value.split(".");
                    if (parseFloat(txtCredit.value) == 0) {
                        alert(strfield + ' should be greater than 0');
                        txtCredit.value = '';
                        return
                    }

                    if (strCredit[0].length > intPrefix) {
                        alert(strfield + ' should not exceed ' + intPrefix + ' digits');
                        txtCredit.focus();
                        return
                    }

                    if (strCredit[1] != null) {
                        if (strCredit[1].length > IntSuffix) {
                            strCredit[1] = strCredit[1].substring(0, IntSuffix);
                            txtCredit.value = strCredit[0] + '.' + strCredit[1];
                        }
                    }
                    txtDebit.value = '';
                }
            }
            //Credit Amount validation ends
        }

        function funOnFrequencyChange() {
            var dropDown = $get('<%=ddlFrequency.ClientID %>');
            var rfvFrqTxt = $get('<%=rfvFrequencyTxt.ClientID %>');
            if (dropDown.value == "3")//Weekly
            {
                document.getElementById('<%= chklstFrquency.ClientID %>').style.display = 'block';
                $('#<%= lblFrqText.ClientID %>').text("Day *");
                $('#<%= lblFrqText.ClientID %>').css('visibility', 'visible');
                document.getElementById('<%= txtFrqText.ClientID %>').style.display = 'none';
                rfvFrqTxt.enabled = false;
            }
            else if (dropDown.value > "3")//Monthly , Quartely , Halfyearly , Yearly
            {
                $('#<%= lblFrqText.ClientID %>').text("Day *");
                $('#<%= lblFrqText.ClientID %>').css('visibility', 'visible');
                document.getElementById('<%= chklstFrquency.ClientID %>').style.display = 'none';
                document.getElementById('<%= txtFrqText.ClientID %>').style.display = 'block';
                rfvFrqTxt.enabled = true;
            }
            else {
                $('#<%= lblFrqText.ClientID %>').css('visibility', 'hidden');
                document.getElementById('<%= chklstFrquency.ClientID %>').style.display = 'none';
                document.getElementById('<%= txtFrqText.ClientID %>').style.display = 'none';
                rfvFrqTxt.enabled = false;
            }
    }

    function fnCheckDays(objDay) {
        if (objDay.value != "") {
            if (parseInt(objDay.value) == 0) {
                alert('Days should be entered between 1 to 31');
                objDay.value = '';
                return;
            }
            if (parseInt(objDay.value) > 31) {
                alert('Days should be entered between 1 to 31');
                objDay.value = '';
                return;
            }
        }
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        funOnFrequencyChange();
    });

    </script>
</asp:Content>



