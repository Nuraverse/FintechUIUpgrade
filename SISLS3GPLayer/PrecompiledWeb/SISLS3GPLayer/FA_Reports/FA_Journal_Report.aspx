<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FA_Journal_Report, App_Web_ygb51gin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" Text="" ID="lblHeading" CssClass="styleDisplayLabel">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Criteria">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="ddlFromLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AutoPostBack="true"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="ddlFromLocation_SelectedIndexChanged">
                                        </cc1:ComboBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlFromLocation"
                                                InitialValue="--Select--" ErrorMessage="Select From Location" Display="Dynamic" SetFocusOnError="True"
                                                ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblfromlocation" CssClass="styleReqFieldLabel" Text="From Location"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="ddltolocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AutoPostBack="true"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                        </cc1:ComboBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddltolocation"
                                                InitialValue="--Select--" ErrorMessage="Select To Location" Display="Dynamic" SetFocusOnError="True"
                                                ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label class="tess">
                                            <asp:Label runat="server" ID="lbltolocation" CssClass="styleReqFieldLabel" Text="To Location"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtFromDate"
                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                                                ErrorMessage="Select From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label>
                                            <asp:Label runat="server" ID="lblFromDate" Text="From Date" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox runat="server" ID="txtToDate"
                                            AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" />
                                        <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                            PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                                                ErrorMessage="Select To Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                CssClass="validation_msg_box_sapn" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label>
                                            <asp:Label runat="server" ID="lblToDate" Text="To Date" />
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <cc1:ComboBox ID="cmbreporttype" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                            AutoPostBack="true"
                                            AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Manual Journal"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="System Journal"></asp:ListItem>
                                            <%--<asp:ListItem Value=3 Text="Others"></asp:ListItem>--%>
                                            <asp:ListItem Value="4" Text="All"></asp:ListItem>
                                        </cc1:ComboBox>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="cmbreporttype"
                                                InitialValue="--Select--" ErrorMessage="Select Report Type" Display="Dynamic" SetFocusOnError="True"
                                                ValidationGroup="vgGo" />
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>

                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblReportType" CssClass="styleReqFieldLabel" Text="Report Type"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row" align="right">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                            type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClearClick" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+C]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                        </button>
                        <button class="css_btn_enabled" id="btnPrint" title="Cancel[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                            type="button" accesskey="P">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u></u>Print
                        </button>

                        <%--    <asp:Button ID="btnPrint" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                            Visible="false" Text="Print" OnClick="btnPrint_Click" />--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlScroll" runat="server" GroupingText="Journal Details" Width="100%" CssClass="stylePanel" Visible="false">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div id="divJournalDetails" runat="server" >
                                        <asp:GridView ID="gvjournal" runat="server" AutoGenerateColumns="false" ShowFooter="false"  EmptyDataText="No Records found" RowStyle-HorizontalAlign="Left" ShowHeaderWhenEmpty="true"
                                            RowStyle-Width="0" Width="100%">
                                            <Columns>
                                                <%--Serial Number--%>
                                                <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <%--Location--%>
                                                <asp:TemplateField HeaderText="Location" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>' ToolTip="Document Date" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                </asp:TemplateField>
                                                <%--Doc Date --%>
                                                <asp:TemplateField HeaderText="Document Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocDate" runat="server" Text='<%#Eval("Document_Date") %>' ToolTip="Document Date" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateField>
                                                <%--Doc No --%>
                                                <asp:TemplateField HeaderText="JV NO">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateField>

                                                <%--Account --%>
                                                <asp:TemplateField HeaderText="GL Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgl_code" runat="server" Text='<%#Eval("GL_Code") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SL Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblgl_code" runat="server" Text='<%#Eval("SL_Code") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%--Description --%>
                                                <%--<asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>

                                                        <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Datacolumn1") %>' ToolTip="Description" />

                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateField>--%>


                                                <%--Debit--%>
                                                <asp:TemplateField HeaderText="Debit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDebit" runat="server" Text='<%#Eval("Debit1") %>' ToolTip="Debit" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotDebit" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                </asp:TemplateField>
                                                <%--Credit--%>
                                                <asp:TemplateField HeaderText="Credit">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCredit" runat="server" Text='<%#Eval("Credit1") %>' ToolTip="Credit" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotCredit" runat="server" Text="" />
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                           <uc2:PageNavigator ID="ucCustomPaging" runat="server"></uc2:PageNavigator>
                                    </div>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                        <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                            Visible="false" Text="Email" />
                        <%-- <asp:Button ID="btnProceedSave" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                    Text="Proceed Save" OnClick="btnProceedSave_Click" Style="display: none" />--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsjournal" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                            ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true"
                    CssClass="styleMandatoryLabel" ValidationGroup="vgAdd" ShowMessageBox="false"
                    HeaderText="Correct the following validation(s):" />--%>
                        <asp:CustomValidator ID="cvjournal" runat="server" CssClass="styleMandatoryLabel"
                            Enabled="true" />
                    </div>
                </div>

            </div>
              <input type="hidden" id="hdnSortDirection" runat="server" />
            <input type="hidden" id="hdnSortExpression" runat="server" />
            <input type="hidden" id="hdnSearch" runat="server" />
            <input type="hidden" id="hdnOrderBy" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
