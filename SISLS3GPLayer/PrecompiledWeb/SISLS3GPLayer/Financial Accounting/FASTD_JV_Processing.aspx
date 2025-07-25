<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FASTD_JV_Processing, App_Web_mv5fp02i" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UPApprovals" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Standard JV Processing" ID="lblHeading" CssClass="styleInfoLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Standard JV Details" ID="pnlStandardDetailsJV" runat="server"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlLocation" runat="server" IsMandatory="true" ServiceMethod="GetBranchList" ErrorMessage="Select a Location"
                                                ValidationGroup="Header" />
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
                                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ValidationGroup="Header" ErrorMessage="Slect the Activity"
                                                    ControlToValidate="ddlActivity" CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblActivity" runat="server" Text="Activity *">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMJVStartDate" ToolTip="Start Date" runat="server" MaxLength="15"
                                                onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgMJVStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="False" />
                                            <cc1:CalendarExtender ID="ceMJVStartDate" runat="server" Enabled="True"
                                                PopupButtonID="imgMJVStartDate"
                                                TargetControlID="txtMJVStartDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ErrorMessage="Select Start Date" ValidationGroup="Header"
                                                    ID="rfvMJVStartDate" runat="server" ControlToValidate="txtMJVStartDate" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblMJVStartDate" runat="server" Text="Start Date *"></asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMjvEndDate" ToolTip="End Date" runat="server" MaxLength="15"
                                                onmouseover="txt_MouseoverTooltip(this)"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgMJVEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="False" />
                                            <cc1:CalendarExtender ID="ceMJVEndDate" runat="server" Enabled="True" PopupButtonID="imgMJVEndDate" TargetControlID="txtMjvEndDate">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ErrorMessage="Select End Date" ValidationGroup="Header"
                                                    ID="rfvMJVEndDate" runat="server" ControlToValidate="txtMjvEndDate" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblMJVEndDate" runat="server" Text="End Date *"></asp:Label>

                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div align="right">
                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvSTDJVDetails" runat="server" AutoGenerateColumns="false"
                                    ShowFooter="true" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl No" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSlno" runat="server" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Template Desc." ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTemplateDesc" runat="server" Text=''
                                                    ToolTip="Template Desc."></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Location" ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLocation" runat="server" Text=''
                                                    ToolTip="Location"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account No." ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAccountno" runat="server" Text=''
                                                    ToolTip="Account No."></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub A/c No." ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubAccountno" runat="server" Text=''
                                                    ToolTip="Sub Account No."></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Debit" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDebit" runat="server" Text=''
                                                    ToolTip="Debit"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Credit" ItemStyle-HorizontalAlign="Right">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCredit" runat="server" Text=''
                                                    ToolTip="Credit"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <div class="md-input" style="margin: 0px;">
                                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" onkeyup="maxlengthfortxt(200)"
                                                        MaxLength="200" Text='<%# Bind("remarks") %>' ToolTip="Remarks"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel GroupingText="Initiated Details" ID="pnlSTDJVInitiatedDetails" runat="server" CssClass="stylePanel" Visible="false">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblInitiated" runat="server" Text="Initiated Name :"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="ftxtPassword" runat="server" TargetControlID="txtPassword"
                                                FilterType="Custom" FilterMode="InvalidChars" InvalidChars=" ">
                                            </cc1:FilteredTextBoxExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ValidationGroup="btnSave"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter the Password"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPassword" runat="server" Text="Password :"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtRemarks" runat="server"
                                                onkeyDown="maxlengthfortxt(80)" TextMode="MultiLine"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblRemarks" runat="server" Text="Remarks :"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S" validationgroup="btnSave">
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
                            <asp:ValidationSummary ID="VSGo" runat="server" CssClass="styleMandatoryLabel" ValidationGroup="Header"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" />
                            <asp:HiddenField ID="hdnrow" runat="server" />
                            <asp:CustomValidator ID="CVApproval" runat="server" CssClass="styleMandatoryLabel"
                                Height="50px">                                    
                            </asp:CustomValidator>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
