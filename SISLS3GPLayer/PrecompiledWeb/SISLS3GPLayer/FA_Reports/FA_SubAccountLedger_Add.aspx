<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_FA_SubAccountLedger_Add, App_Web_ygb51gin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="FAAddressDetail"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<%@ Register TagPrefix="uc2" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
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
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlActivity" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" Width="130px" OnSelectedIndexChanged="ddlActivity_SelectedIndexChanged"
                                                AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Activity"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvActivity" runat="server" ControlToValidate="ddlActivity"
                                                    InitialValue="--Select--" ErrorMessage="Select Activity" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocation" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblLocation" Text="Branch" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlLocation"
                                                    InitialValue="--Select--" ErrorMessage="Select Branch" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label runat="server" ID="lblLocationPrint" Text="Branch Print" />
                                            <asp:CheckBox ID="chkLocationPrint" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlAccount" runat="server" AutoPostBack="True"
                                                OnItem_Selected="ddlAccount_Item_Selected"
                                                ServiceMethod="FunPriLoadGL" ErrorMessage="Enter Account From"
                                                IsMandatory="true" ValidationGroup="vgGo" ToolTip="Account From"
                                                watermarktext="--Select--" />

                                            <cc1:ComboBox ID="ddlAccountFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList" Visible="false"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblAccFrom" CssClass="styleReqFieldLabel" Text="Account"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlSLAccountFrom" runat="server" AutoPostBack="True"
                                                OnItem_Selected="ddlSLAccountFrom_Item_Selected"
                                                ServiceMethod="FunPriBindSL" ErrorMessage="Enter Account From"
                                                ValidationGroup="vgGo" ToolTip="Account From"
                                                watermarktext="--Select--" />

                                            <cc1:ComboBox ID="ddlSLFrom" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" Visible="false">
                                            </cc1:ComboBox>
                                            <%--AutoPostBack="true" OnSelectedIndexChanged="ddlAccountFrom_SelectedIndexChanged"--%>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblSLfrom" CssClass="styleReqFieldLabel" Text="SL From"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlAccountFrom"
                                                    InitialValue="--Select--" ErrorMessage="Select An Account" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <UC:Suggest ID="ddlSLAccountTo" runat="server" AutoPostBack="True"
                                                OnItem_Selected="ddlSLAccountTo_Item_Selected"
                                                ServiceMethod="FunPriBindSL" ErrorMessage="Enter Account To"
                                                ValidationGroup="vgGo" ToolTip="Account To"
                                                watermarktext="--Select--" />

                                            <cc1:ComboBox ID="ddlSLTo" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" Visible="false">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblSLTo" CssClass="styleReqFieldLabel" Text="SL To"></asp:Label>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtFromDate"
                                                AutoPostBack="true" OnTextChanged="txtFromDate_OnTextChanged" class="md-form-control form-control login_form_content_input requires_true" />
                                            <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFromDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="txtFromDate" ID="CalFromDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblFromDate" Text="From Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate" CssClass="validation_msg_box_sapn"
                                                    ErrorMessage="Select From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ID="txtToDate"
                                                AutoPostBack="true" OnTextChanged="txtToDate_OnTextChanged" class="md-form-control form-control login_form_content_input requires_true" />
                                            <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtToDate" OnClientDateSelectionChanged="checkDate_NextSystemDate"
                                                PopupButtonID="txtToDate" ID="CalToDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblToDate" Text="To Date" CssClass="styleReqFieldLabel" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate" CssClass="validation_msg_box_sapn"
                                                    ErrorMessage="Select To Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label runat="server" ID="lblRemarks" Text="Remarks" AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" />
                                            <asp:CheckBox ID="chkRemarks" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlLocationrecord" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList" Visible="false"
                                                AutoPostBack="true"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="Label1" Text="Record Location" Visible="false" />
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlLocation" CssClass="validation_msg_box_sapn"
                                                    InitialValue="--Select--" ErrorMessage="Select Location" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <cc1:ComboBox ID="ddlAccountTo" Visible="false" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlAccountTo_SelectedIndexChanged"
                                                Width="130px" AppendDataBoundItems="true" CaseSensitive="false" AutoCompleteMode="SuggestAppend">
                                            </cc1:ComboBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblAccTo" Visible="false" CssClass="styleReqFieldLabel" Text="Account To"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:Label runat="server" ID="lblSubAccount" Visible="false" Text="Sub Account" />
                                            <asp:CheckBox ID="chkSubAccount" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlSL_SelectedIndexChanged" />
                                        </div>
                                    </div>
                                </div>

                                <div align="right">
                                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                    </button>

                                    <button class="css_btn_enabled" id="btnClear" causesvalidation="false" runat="server" onclick="if( fnConfirmClear())"
                                        type="button" accesskey="L" title="Clear[Alt+L]" onserverclick="btnClear_Click">
                                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                                    </button>

                                    <button class="css_btn_enabled" id="btnCancel" onserverclick="btnCancel_Click" causesvalidation="false" runat="server" onclick="if(fnConfirmExit())"
                                        type="button" accesskey="X" title="Exit[Alt+X]">
                                         <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                    </button>
                                    <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" visible="false" causesvalidation="false" runat="server"
                                        type="button" accesskey="E" title="ExcelAlt+Shift+E">
                                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                                    </button>
                                    <asp:Button ID="btnEmail" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                                        Visible="false" Text="Email" OnClick="btnEmail_Click" />
                                </div>
                            </asp:Panel>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlAccountLedger" runat="server" Visible="false" GroupingText="Account Ledger Details"
                                Width="100%" CssClass="stylePanel">
                                <asp:Label ID="lblLocationG" runat="server" Text="Location" Visible="false" />
                                <asp:Label ID="lblUserName" Font-Size="Small" runat="server" Text="User Name" Visible="false" />
                                <asp:Label ID="lblOpenBal" runat="server" Text="" />

                                <%--                                <div style="height: 250px; overflow: auto">--%>
                                <asp:Panel ID="pnlScroll" runat="server" GroupingText="" Width="100%" CssClass="stylePanel">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvAccountLedger" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                                                RowStyle-Width="0" OnRowDataBound="gvAccountLedger_RowDataBound" Width="100%">
                                                                <Columns>
                                                                    <%--Serial Number--%>
                                                                    <%-- <asp:TemplateField HeaderText="Sl No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSno" runat="server" Text='<%#Container.DataItemIndex+1%>' ToolTip="Serial Number" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                    <%--Location--%>
                                                                    <asp:TemplateField HeaderText="Branch">
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
                                                                    <asp:TemplateField HeaderText="Document Number">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDocNo" runat="server" Text='<%#Eval("Document_No") %>' ToolTip="Document Number" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Value Date --%>
                                                                    <asp:TemplateField HeaderText="Value Date">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblValDate" runat="server" Text='<%#Eval("Value_Date") %>' ToolTip="Value Date" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateField>
                                                                    <%--Account --%>
                                                                    <%--  <asp:TemplateField HeaderText="Account">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' ToolTip="Selected Account" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                                    <%--Description --%>
                                                                    <asp:TemplateField HeaderText="Description">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAcc" runat="server" Text='<%#Eval("Account") %>' />

                                                                            <asp:Label ID="lblDesc" runat="server" Text='<%#Eval("Description") %>' ToolTip="Description" />
                                                                            <asp:HiddenField ID="hdnSelGL" runat="server" Value='<%#Eval("col1") %>' />
                                                                            <asp:HiddenField ID="hdnSelSL" runat="server" Value='<%#Eval("col2") %>' />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotalD" runat="server" Text="Total :" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%--SL Code--%>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSubAccount" runat="server" Text='<%#Eval("Remarks") %>' ToolTip="Sub Account" />
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total :" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" />
                                                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                                    </asp:TemplateField>
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
                                                                    <%--Balance--%>
                                                                    <asp:TemplateField HeaderText="Balance">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBalance" runat="server" Text='<%#Eval("Balance1") %>' ToolTip="Balance" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotBalance" runat="server" Text="" />
                                                                        </FooterTemplate>
                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <uc2:PageNavigator ID="ucCustomPaging" runat="server"></uc2:PageNavigator>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <%--  </div>--%>
                            </asp:Panel>

                            <asp:HiddenField ID="hdn_FTDate" runat="server" />
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsAccountLedger" Visible="false" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                                ValidationGroup="vgGo" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="cvAccountLedger" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                    <asp:TextBox ID="txthiddenfield" runat="server" Visible="false"></asp:TextBox>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>







