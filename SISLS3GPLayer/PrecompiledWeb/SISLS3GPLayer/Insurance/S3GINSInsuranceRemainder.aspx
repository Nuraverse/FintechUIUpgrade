<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Insurance_S3GInsInsurancRemainder, App_Web_q5jmkrdt" title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="udpInsDetails" runat="server">
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
                            <asp:Panel ID="pnlGeneral" runat="server" CssClass="stylePanel" GroupingText="General">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                AutoPostBack="True" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB"
                                                    Display="Dynamic" InitialValue="0" ErrorMessage="Select a Line of Business" ValidationGroup="Govalidation"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlBranch"
                                                    Display="Dynamic" InitialValue="0" ErrorMessage="Select a Branch" ValidationGroup="Govalidation"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <%--  <uc2:Suggest ID="ddlBranch" runat="server" ServiceMethod="GetBranchList" AutoPostBack="true"
                                                OnItem_Selected="ddlBranch_SelectedIndexChanged" IsMandatory="true" ValidationGroup="Submit" ErrorMessage="Enter Location" />--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlRemainder" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRemainder_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">ALL</asp:ListItem>
                                                <asp:ListItem Value="2">Specific</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvRemainder" runat="server" ControlToValidate="ddlRemainder"
                                                    Display="Dynamic" InitialValue="0" ErrorMessage="Select a Reminder Type" ValidationGroup="Govalidation"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblRemainder" runat="server" CssClass="styleReqFieldLabel" Text="Reminder Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlInsDoneBy" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlInsDoneBy_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvInsDoneBy" runat="server" ControlToValidate="ddlInsDoneBy"
                                                    Display="Dynamic" InitialValue="0" ErrorMessage="Select Insurance Done By" ValidationGroup="Govalidation"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblInsDoneBy" runat="server" CssClass="styleReqFieldLabel" Text="Insurance Done By"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtPath" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPath" runat="server" ControlToValidate="txtPath"
                                                    Display="Dynamic" ErrorMessage="Enter the Path" ValidationGroup="Govalidation"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPath" runat="server" CssClass="styleReqFieldLabel" Text="Path"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="DivOutput" style="display: none">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlOutput" runat="server" Visible="false" Width="145px" OnSelectedIndexChanged="ddlOutput_SelectedIndexChanged">
                                                <asp:ListItem Value="0">---Select----</asp:ListItem>
                                                <asp:ListItem Value="1">PDF</asp:ListItem>
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvOutput" runat="server" ControlToValidate="ddlOutput"
                                                    Display="Dynamic" InitialValue="0" Enabled="false" ErrorMessage="Select a Output" ValidationGroup="Govalidation"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblOutput" runat="server" Visible="false" CssClass="styleReqFieldLabel"
                                                    Text="Output"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="DivPanum" visible="false">
                                    </div>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="dvcustomerName">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerNameDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="50"></asp:TextBox>
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" ShowHideAddressImageButton="false" runat="server" AutoPostBack="true" DispalyContent="Both" OnItem_Selected="ucCustomerCodeLov_Item_Selected"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" class="md-form-control form-control" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtCustomerNameDummy" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Submit"
                                                    SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvrfvtxtCustomerNameDummy1" runat="server" ErrorMessage="Select the Customer" ValidationGroup="Add"
                                                    SetFocusOnError="true" ControlToValidate="txtCustomerNameDummy" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            <label>
                                                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name/Code"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <%--   <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <uc4:ICM ID="ICM1" onblur="fnLoadCust()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" class="md-form-control form-control" />
                                            <asp:Button ID="Button2" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="TextBox1" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go" CssClass="md-form-control form-control">  </asp:TextBox>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label1" runat="server" Text="Customer Name/Code"></asp:Label>
                                            </label>
                                        </div>
                                    </div>--%>

                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" runat="server" id="dvAccountNumber">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <uc4:ICM ID="ddlPANum" onblur="fnLoadAccount()" runat="server" ToolTip="Account Number" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ddlPANum_Item_Selected"
                                                strLOV_Code="ACC_AINSREMI" ServiceMethod="GetAccList" class="md-form-control form-control" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />

                                            <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                            <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPANum" runat="server" ToolTip="Account Number" CssClass="styleReqFieldLabel"
                                                    Text="Account Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>


                                    <%--   <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server">
                                        <div class="md-input">
                                            <uc2:Suggest ID="ddlPANum" runat="server" OnItem_Selected="ddlPANum_Item_Selected"
                                                ServiceMethod="GetAccList" ToolTip="Invoice Number" AutoPostBack="true" />
                                           
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblPANum" runat="server" CssClass="styleReqFieldLabel" Text="Prime Account"></asp:Label>
                                            </label>
                                        </div>
                                    </div>--%>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="divInsDueFromDate">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInsDueFromDate" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgInsDueFromDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <cc1:FilteredTextBoxExtender ID="ftxtInsDueFromDate" runat="server" Enabled="True"
                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtInsDueFromDate"
                                                ValidChars="/-">
                                            </cc1:FilteredTextBoxExtender>
                                            <cc1:CalendarExtender ID="calInsDueFromDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                PopupButtonID="imgInsDueFromDate" TargetControlID="txtInsDueFromDate">
                                            </cc1:CalendarExtender>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblInsDueFromDate" runat="server" CssClass="styleReqFieldLabel" Text="Insurance Due From Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlSANum" runat="server" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlSANum_SelectedIndexChanged" Style="height: 22px"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblSANum" runat="server" CssClass="styleReqFieldLabel" Text="Sub Account"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" runat="server" id="DivInsDueToDate">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtInsDueToDate" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="imgInsDueToDate" runat="server" ImageUrl="~/Images/calendaer.gif"
                                                Visible="false" />
                                            <cc1:FilteredTextBoxExtender ID="ftxtInsDueToDate" runat="server" Enabled="True"
                                                FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters" TargetControlID="txtInsDueToDate"
                                                ValidChars="/-">
                                            </cc1:FilteredTextBoxExtender>
                                            <cc1:CalendarExtender ID="calInsDueToDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                PopupButtonID="imgInsDueToDate" TargetControlID="txtInsDueToDate">
                                            </cc1:CalendarExtender>

                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblInsDueToDate" runat="server" CssClass="styleReqFieldLabel" Text="Ins Due To Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                </div>







                                <div align="right" style="margin-top: 15px;">
                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Govalidation" runat="server"
                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>
                                    <button class="css_btn_enabled" id="Button1" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                                        type="button" accesskey="L">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                    </button>
                                </div>


                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="grid">
                                <asp:Panel ID="pnlInsDetails" CssClass="stylePanel" runat="server" Visible="false"
                                    ScrollBars="None" GroupingText="Insurance Details" Height="50%">
                                    <%--<div id="divInsDetails" style="width: 100%; padding-left: 1%; height:50% " runat="server">--%>
                                    <asp:GridView ID="grvInsDetails" runat="server" Width="100%" AutoGenerateColumns="False"
                                        EmptyDataText="Insurance Renewal Details Not Found"
                                        OnRowDataBound="grvInsDetails_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Account" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAccount" runat="server" Text='<%#Bind("PANum") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AssetInsID" HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblACCOUNT_INS_ID" runat="server" Text='<%#Bind("ACCOUNT_INS_DETAILS_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer_ID" HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomer_ID" runat="server" Text='<%#Bind("Customer_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustName" runat="server" Text='<%#Bind("CustomerName") %>' Width="200px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset Description" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetDesc" runat="server" Text='<%#Bind("AssetDescription") %>'  Width="150px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Regn/Serial/Engine/Chassis No" HeaderStyle-HorizontalAlign="Left" ItemStyle-Wrap="true">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssetRegNo" runat="server" Text='<%#Bind("AssetRegNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Insured By" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInsuredBy" runat="server" Text='<%#Bind("InsuredBy") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Policy No" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPolicyNo" runat="server" Text='<%#Bind("PolicyNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Policy Expiry Date" HeaderStyle-HorizontalAlign="Left" >
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPolicyExpiryDate" runat="server" Text='<%#Bind("PolicyExpiryDate") %>' Width="100px"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Insured Amount">
                                                <ItemTemplate>
                                                    <div style="text-align: right;">
                                                        <asp:Label ID="lblPolicyInsuredAmount" runat="server" Text='<%#Bind("InsuredAmount") %>'></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                                <HeaderStyle />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer E-Mail" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcustemail" runat="server" Text='<%#Bind("CUST_EMAIL") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exclude" HeaderStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkExclude" runat="server" Checked='<%# GVBoolFormat(Eval("STATUS").ToString()) %>' />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Path" HeaderStyle-HorizontalAlign="Left" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFilePath" runat="server" Text='<%#Bind("FILEPATH") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <%-- </div>--%>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" runat="server"
                            onserverclick="btnClear_Click"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <asp:Button ID="btnGenerate" runat="server" CssClass="grid_btn" OnClick="btnGenerate_Click"
                            Text="Generate" AccessKey="A" ToolTip="Generate,Alt+A" Visible="False" Enabled="false" />
                        <button class="css_btn_enabled" id="btnViewPDF" title="DownLoad[Alt+V]" causesvalidation="false" visible="false" onserverclick="btnViewPDF_ServerClick" runat="server"
                            type="button" accesskey="V">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>D</u>ownLoad
                        </button>
                        <%--<button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]"  causesvalidation="false" 
                            onserverclick="btnCancel_Click" runat="server" onclick="if(fnConfirmExit(btnCancel))"
                        type="button" accesskey="X" visible="true">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>--%>
                    </div>
                </div>
            </div>
            <asp:ValidationSummary ID="vsInsdetails" runat="server" CssClass="styleMandatoryLabel"
                ValidationGroup="Govalidation" HeaderText="Correct the following validation(s):" Enabled="false" />
        </ContentTemplate>
      <%--  <Triggers>
            <asp:PostBackTrigger ControlID="ddlRemainder" />
        </Triggers>--%>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">

        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }

        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }

        function fnTrashCustomerSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNameDummy.ClientID %>').value = "";


                }
            }
        }

        function fnTrashAccountSuggest(e) {

            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";

                }
            }
        }
    </script>
</asp:Content>
