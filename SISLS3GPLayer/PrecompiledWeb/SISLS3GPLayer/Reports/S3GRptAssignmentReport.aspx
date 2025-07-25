<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Reports_S3GRptAssignmentReport, App_Web_nmps0mjf" title="Journal Query" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="javascript" type="text/javascript">

        function fnLoadCustomer() {
            ////debugger;
            document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

        }


    </script>
    <asp:UpdatePanel ID="updPanel" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Assignment Ledger">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlHeaderDetails" runat="server" GroupingText="Input Criteria" CssClass="stylePanel" Width="100%">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" ToolTip="Line of Business"
                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ErrorMessage="Select Line of Business"
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" InitialValue="-1"
                                                ControlToValidate="ddlLOB" CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel" ToolTip="Line of Business">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" ToolTip="Location1"
                                            OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Location1" ID="lblBranch" ToolTip="Location" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLocation2" runat="server" AutoPostBack="true" ToolTip="Location2"
                                            Enabled="false" OnSelectedIndexChanged="ddlLocation2_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Location2" ID="lblLocation2" ToolTip="Location2" CssClass="styleDisplayLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtStartDate" AutoPostBack="true" OnTextChanged="txtStartDate_TextChanged"
                                            runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="imgStartDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtStartDate" PopupButtonID="imgStartDate" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ErrorMessage="Enter the Start Date."
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtStartDate"
                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="Start Date" ID="lblStartDate" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEndDate" AutoPostBack="true" OnTextChanged="txtEndDate_TextChanged" runat="server"
                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <asp:Image ID="ImgEndDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                        <cc1:CalendarExtender runat="server" Format="MM/dd/yyyy" TargetControlID="txtEndDate"
                                            PopupButtonID="imgEndDate" ID="CalendarExtender2" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                        </cc1:CalendarExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" ErrorMessage="Enter the End Date."
                                                ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtEndDate"
                                                CssClass="validation_msg_box_sapn">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" Text="End Date" ID="lblEndDate" CssClass="styleReqFieldLabel">
                                            </asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc2:Suggest ID="ddlPNum" runat="server" ServiceMethod="GetAccountNo" OnItem_Selected="ddlPNum_Item_Selected" AutoPostBack="true" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label runat="server" ID="lblPNum" CssClass="styleDisplayLabel" Text="Account Number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButton ID="rbtnCust" Text="Customer" AutoPostBack="true" OnCheckedChanged="rbtnCust_CheckedChanged" GroupName="rbtn" runat="server"
                                            class="md-form-control form-control radio" RepeatDirection="Horizontal" />

                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButton ID="rbtnEntity" Text="Entity" AutoPostBack="true" OnCheckedChanged="rbtnEntity_CheckedChanged" GroupName="rbtn" runat="server"
                                            class="md-form-control form-control radio" RepeatDirection="Horizontal" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                    </div>
                                </div>
                                <%--  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <uc2:LOV ID="ucCustomerCodeLov" TextWidth="70px" ButtonEnabled="false" onblur="return fnLoadCustomer();" runat="server" />
                                <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" OnClick="btnLoadCustomer_OnClick"
                                    Style="display: none" /><input id="hdnCustID" type="hidden" runat="server" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                </label>
                            </div>
                        </div>--%>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtCustomerNameLease" runat="server" CssClass="md-form-control form-control"
                                            Style="display: none;" MaxLength="50"></asp:TextBox>
                                        <UC6:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" ToolTip="Customer Name" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                            ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                            Style="display: none" />
                                        <input id="hdnCustID" type="hidden" runat="server" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtCustomerNameLease" runat="server" ErrorMessage="Select the Customer"
                                                SetFocusOnError="true" ControlToValidate="txtCustomerNameLease" CssClass="validation_msg_box_sapn" ValidationGroup="Main Page"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <label>
                                            <asp:Label runat="server" Text="Customer Name" ID="lblCustFilter" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnOk" onserverclick="btnOk_Click" validationgroup="Ok" runat="server"
                        type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                        type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P">
                        <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlJournalDetails" runat="server" CssClass="stylePanel" GroupingText="Assignment Ledger Details" Width="100%" Visible="false">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <div id="divJournalDetails" runat="server" style="overflow: auto; height: 300px; display: none">

                                            <asp:GridView ID="grvAssinmentJvDetails" runat="server" Width="100%" OnRowDataBound="grvAssinmentJvDetails_OnRowDataBound" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" CellPadding="0" CellSpacing="0" ShowFooter="true">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDSno" runat="server" Text='<%# Bind("S_NO") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PANUM") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterStyle HorizontalAlign="Left" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Doc Reference">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDocumentReference" runat="server" Text='<%# Bind("DOC_NUM") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Value Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblvaluedate" runat="server" Text='<%# Bind("VALUE_DATE") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("DESCRIPTION") %>'></asp:Label>
                                                            <asp:Label ID="lblColDesc" Visible="false" runat="server" Text='<%# Bind("COLUMN_DESC") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblGLdescF" runat="server" Text="Total " ToolTip="sum of Dues Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <FooterStyle HorizontalAlign="Right" />
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDues" runat="server" Text='<%# Bind("DEBIT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalDues" runat="server" ToolTip="sum of Dues Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReceipts" runat="server" Text='<%# Bind("CREDIT") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Label ID="lblTotalReceipts" runat="server" ToolTip="sum of  Receipts Amount"></asp:Label>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Right" />
                                                        <FooterStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsJournal" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>













