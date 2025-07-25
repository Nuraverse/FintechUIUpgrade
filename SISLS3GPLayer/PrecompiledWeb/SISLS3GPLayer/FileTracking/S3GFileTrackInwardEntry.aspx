<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FileTracking_S3GFileTrackInwardEntry, App_Web_ke4311yt" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlFileRequest" Width="100%" GroupingText="File Inward Manual Entry" CssClass="stylePanel"
                            runat="server">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtUserDepartment" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            ReadOnly="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Department" ID="lbltUserDepartment" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtUserName" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            ReadOnly="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="User Name" ID="lblUserName" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="txtProposalNumber" AutoPostBack="true" runat="server" ServiceMethod="GeProposalList"
                                            CssClass="md-form-control form-control login_form_content_input" IsMandatory="true" ErrorMessage="Select Proposal Number" class="md-form-control form-control"
                                            OnItem_Selected="txtProposalNumber_Item_Selected" ValidationGroup="btnSave" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Proposal Number" ID="lblJobDescription" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAccountNumber" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                            MaxLength="60" ReadOnly="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Account Number" ID="lblAccountNumber" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlFileType" runat="server" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="File Type" ID="lblFileType" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvJob" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                ValidationGroup="btnSave" ErrorMessage="Select a File Type" ControlToValidate="ddlFileType"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script src="../Content/Scripts/UserScript.js"></script>
</asp:Content>

