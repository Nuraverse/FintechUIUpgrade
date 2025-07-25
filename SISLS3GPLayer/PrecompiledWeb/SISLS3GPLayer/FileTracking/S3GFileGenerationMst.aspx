<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FileTracking_S3GFileGenerationMst, App_Web_ke4311yt" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                    <div class="col">
                        <div class="row">
                            <asp:Panel ID="pnlBarCodeGeneration" Width="100%" GroupingText="Bar Code Generation" CssClass="stylePanel"
                                runat="server">
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc2:Suggest ID="txtProposalNumber" AutoPostBack="true" runat="server" ServiceMethod="GetProposalList"
                                                CssClass="md-form-control form-control login_form_content_input" ErrorMessage="Select Proposal Number" IsMandatory="true" ValidationGroup="btngo" class="md-form-control form-control"
                                                OnItem_Selected="txtProposalNumber_Item_Selected" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label Text="Proposal Number" runat="server" ID="lblaccountNumber" ToolTip="Proposal Number" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFileType" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFileType_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="File Type" ID="lblFileType" ToolTip="File Type" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFileType" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                    ValidationGroup="btngo" ErrorMessage="Select a File Type" ControlToValidate="ddlFileType" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="rfvFileTypeSave" runat="server" Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                    ValidationGroup="btnsaves" ErrorMessage="Select a File Type" ControlToValidate="ddlFileType" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" runat="server" id="dvPrintType" visible="false">
                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:RadioButtonList ID="rdDelintype" runat="server" ToolTip="Print Type" class="md-form-control form-control radio" RepeatDirection="Horizontal">
                                                <asp:ListItem Text="Proposal" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Cheque Pouch" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPrint" runat="server" Display="Dynamic" InitialValue="" CssClass="validation_msg_box_sapn"
                                                    ValidationGroup="btnPrint" ErrorMessage="Select a Print Type" ControlToValidate="rdDelintype" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblDelintype" CssClass="styleFieldLabel" Text="Print Type" ToolTip="Print Type"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <button id="btnGenerate" runat="server" accesskey="G" causesvalidation="true" class="css_btn_enabled" validationgroup="btngo" onserverclick="btnGenerate_Click" title="Generate[Alt+G]" type="button">
                                                <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>enerate
                                            </button>
                                            <button id="btnPrint" runat="server" accesskey="P" causesvalidation="true" class="css_btn_enabled" validationgroup="btnPrint" onserverclick="btnPrint_Click" title="Print[Alt+P]" type="button">
                                                <i aria-hidden="true" class="fa fa-file-pdf-o"></i>&#8195;<u>P</u>rint
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" runat="server" id="dvdetailHide" visible="false">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label runat="server" ID="lblProposalFileNo" Visible="false"></asp:Label>
                                            <asp:Label runat="server" ID="lblProposalChequePouchFile" Visible="false"></asp:Label>
                                            <asp:Label runat="server" ID="lblProposalFileNoPath" Visible="false"></asp:Label>
                                            <asp:Label runat="server" ID="lblProposalChequePouchFilePath" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row">
                            <asp:Panel ID="pnlBarCodeView" Width="99%" GroupingText="Bar Code View" CssClass="stylePanel"
                                runat="server">
                                <div class="row">
                                    <div class="md-input">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <asp:Image ID="imgProposal" runat="server" Visible="false" Width="440px" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="md-input">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <asp:Image ID="imgProposalChequePouch" runat="server" Visible="false" Width="440px"  />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" validationgroup="btnsaves" onclick="if(fnCheckPageValidators('btnSave'))" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
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
</asp:Content>

