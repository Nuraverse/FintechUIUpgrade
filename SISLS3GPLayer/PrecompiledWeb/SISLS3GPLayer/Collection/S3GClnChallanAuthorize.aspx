<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChallanAuthorize, App_Web_4kkykzxm" %>


<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Challan Authorization" ID="lblHeading" CssClass="styleDisplayLabel">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddllLineOfBusiness" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddllLineOfBusiness_SelectedIndexChanged" ToolTip="Line of Business"
                                    class="md-form-control form-control">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddllLineOfBusiness"
                                        CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Select the Line of Business"
                                        InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <uc3:Suggest ID="ddlBranch" runat="server" AutoPostBack="True" ServiceMethod="GetBranchList"
                                    OnItem_Selected="ddlBranch_SelectedIndexChanged"
                                    ErrorMessage="Select a Branch" IsMandatory="true" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <uc3:Suggest ID="ddlChallanNO" runat="server" ServiceMethod="GetChallan" AutoPostBack="true"
                                    OnItem_Selected="ddlChallanNO_SelectedIndexChanged" ErrorMessage="Select Challan Number"
                                    IsMandatory="true" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblChallanNo" runat="server" Text="Challan Number" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtChallanDate" runat="server"
                                    ReadOnly="true" ToolTip="Challan Date"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblDate" runat="server" Text="Challan Date"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtStatus" runat="server"
                                    ReadOnly="true" ToolTip="Challan Status"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblstatus" runat="server" Text="Challan Status"></asp:Label>
                                </label>
                            </div>
                        </div>

                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" runat="server"
                            type="button" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                  <input type="hidden" value="0" runat="server" id="hdnID" />
                            <asp:LinkButton Text="View Details" CausesValidation="false" runat="server" ID="ReqID"
                                OnClick="ReqID_serverclick" ToolTip="View Details"></asp:LinkButton>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <asp:GridView ID="grvApprovalDetails" runat="server" AutoGenerateColumns="false"
                                    OnRowDataBound="grvApprovalDetails_RowDataBound" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Approval No." ItemStyle-Width="15%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovalSNO" Text='<%# Bind("Task_Approval_Serialvalue")%>' runat="server"
                                                    ToolTip="Approval No."></asp:Label>
                                                <asp:Label ID="lblApproval_ID" Text='<%# Bind("Approval_ID")%>' Visible="false" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approver Name" ItemStyle-Width="15%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovarName" Text='<%# Bind("User_Name") %>' runat="server" ToolTip="Approver Name"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="15%">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlstatus" runat="server">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rvfNo" runat="server" ControlToValidate="ddlstatus"
                                                    ToolTip="Status" CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Select status"
                                                    InitialValue="0"></asp:RequiredFieldValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password" ItemStyle-Width="15%">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPassword" runat="server" MaxLength="15" TextMode="Password" ToolTip="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rvfNo2" runat="server" ControlToValidate="txtPassword"
                                                    CssClass="styleMandatoryLabel" Display="None" ErrorMessage="Enter password"></asp:RequiredFieldValidator>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approval Date" ItemStyle-Width="15%">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApprovalDate" Text='<%# Bind("Task_StatusDate") %>' runat="server"
                                                    ToolTip="Approval Date" MaxLength="6"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="btn_height"></div>
                    <div align="right" class="fixed_btn">
                        <button class="css_btn_enabled" id="btnSave" onserverclick="btnSave_Click" runat="server" onclick="if(fnCheckPageValidators())"
                            type="button" accesskey="S" causesvalidation="true" title="Save the Details[Alt+S]">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" onserverclick="btnClear_Click" runat="server" causesvalidation="false" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>C</u>lear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+C]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="C" visible="false">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                HeaderText="Please correct the following validation(s):" ShowSummary="true" />
                     </div>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


