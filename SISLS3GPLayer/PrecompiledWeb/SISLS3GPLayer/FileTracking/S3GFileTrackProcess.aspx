<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="FileTracking_S3GFileTrackProcess, App_Web_ke4311yt" %>

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
                        <asp:Panel ID="pnlFileRequest" Width="100%" GroupingText="File Request" CssClass="stylePanel"
                            runat="server">
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control" ToolTip="Branch" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" Text="Branch" ID="lblLocation" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="txtProposalNumber" AutoPostBack="true" runat="server" ServiceMethod="GetProposalList"
                                            CssClass="md-form-control form-control login_form_content_input" IsMandatory="true" ErrorMessage="Select Proposal Number" ValidationGroup="btngo" class="md-form-control form-control"
                                            OnItem_Selected="txtProposalNumber_Item_Selected" />
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
                                            Enabled="false" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Account Number" ID="lblAccountNumber" CssClass="styleFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-input">
                                    <button id="btnGo" runat="server" accesskey="G" validationgroup="btngo" causesvalidation="true" class="css_btn_enabled" onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                        <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                    </button>
                                    <button id="btnExcelUpload" runat="server" accesskey="E" causesvalidation="false" class="css_btn_enabled" onserverclick="btnExcelUpload_Click" title="Print[Alt+G]" type="button">
                                        <i aria-hidden="true" class="fa fa-file-excel-o"></i>&#8195;<u>E</u>xcel Upload
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:Panel ID="pnlGridTrackDetails" Width="100%" GroupingText="Track Details" CssClass="stylePanel"
                                        runat="server">
                                        <div class="gird">
                                            <asp:GridView ID="gvTrackDetails" runat="server" AutoGenerateColumns="false" Width="100%"
                                                class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNo.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSerialno" runat="server" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="File Type" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRFID_TYPE" runat="server" Text='<%# Bind("FILE_TYPE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Department Name" ItemStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDEPARTMENT_NAME" runat="server" Text='<%# Bind("DEPARTMENT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblScheduleDateTime" runat="server" Text='<%# Bind("Issued_Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Time">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStartDateTime" runat="server" Text='<%# Bind("Issued_Time") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnManualUpdate" title="Manual Update[Alt+M]" causesvalidation="false" onserverclick="btnManualUpdate_Click" runat="server"
                        type="button" accesskey="M">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>M</u>anual Update
                    </button>
                    <button class="css_btn_enabled" id="btnRequest" title="Send File Request[Alt+S]" causesvalidation="false" onserverclick="btnRequest_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;<u>S</u>end File Request
                    </button>
                    <button class="css_btn_enabled" id="btnExcel" title="Export To Excel[Alt+T]" causesvalidation="false" onserverclick="btnExcel_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Export <u>T</u>o Excel
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblfile" runat="server" Style="display: none;"></asp:Label>

    <cc1:ModalPopupExtender ID="MPUploadFiles" runat="server" PopupControlID="plUploadfiles" TargetControlID="lblfile"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="plUploadfiles" GroupingText="" Height="150px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">

        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="md-input">
                    <asp:FileUpload ID="fuOtherFiles" runat="server" Width="200px" />
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label class="tess">
                        <asp:Label ID="Label1" runat="server" Text="Upload File"></asp:Label>
                    </label>
                </div>
            </div>

        </div>
        <div class="row">
            <asp:UpdatePanel ID="updpnlPopup" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnOk" title="Ok[Alt+O]" causesvalidation="false" onserverclick="btnOk_Click"
                            runat="server" type="button" accesskey="O">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>O</u>k
                        </button>
                        <button class="css_btn_enabled" id="btnUploadCancel" title="Exit[Alt+I]" causesvalidation="false" onserverclick="btnUploadCancel_Click"
                            runat="server" type="button" accesskey="I">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                        </button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnOk" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</asp:Content>

