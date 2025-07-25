<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Financial_Accounting_FAChallanGeneration_Add, App_Web_4hds5vgj" title="Challan Generation" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/S3GAutoSuggest.ascx" TagName="Suggest" TagPrefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Challan Generation" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                       
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlChallanDetails" GroupingText="Challan Details" runat="server" CssClass="stylePanel">
                                <div class="row">
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">

                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlActivity" ValidationGroup="Header" runat="server" class="md-form-control form-control" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                                            ErrorMessage="Select Activity" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlActivity2" CssClass="validation_msg_box_sapn"
                                                                            SetFocusOnError="True" runat="server" ControlToValidate="ddlActivity" InitialValue="0"
                                                                            ErrorMessage="Select Activity" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                                        <asp:HiddenField ID="hdnPrint" runat="server" />
                                                                    </div>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Activity" ID="lblActivity" CssClass="styleReqFieldLabel"
                                                                            ToolTip="Activity"></asp:Label>

                                                                    </label>
                                                                </div>
                                                            </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                             <asp:DropDownList ID="ddlLocation" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:DropDownList>
                                            <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvLocation" SetFocusOnError="True" runat="server"
                                                                        ValidationGroup="btnListing" ControlToValidate="ddlLocation" CssClass="validation_msg_box_sapn"
                                                                        ErrorMessage="Select Branch" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                                </div>
                                           
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Branch" ID="lblLocation" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDraweeBank" ToolTip="Deposit Bank"
                                                runat="server" AutoPostBack="true" class="md-form-control form-control"
                                                OnSelectedIndexChanged="ddlDraweeBank_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Deposit Bank" ID="lblDepositbank" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtChallanNo" Visible="true"
                                                runat="server" ReadOnly="True" ToolTip="Challan Number"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Challan No" Visible="true" ID="lblChallanNo" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlReceiptType" runat="server" AutoPostBack="true"
                                                ToolTip="Receipt Type" class="md-form-control form-control"
                                                OnSelectedIndexChanged="ddlReceiptType_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Receipt Type" ID="lblReceiptType" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDate" runat="server" ContentEditable="False" AutoPostBack="true"
                                                OnTextChanged="txtDate_TextChanged" ToolTip="Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="Image1"
                                                ID="CalendarExtender2" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Date" ID="lblDate" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlInstrumentType" AutoPostBack="true" runat="server" Visible="false"
                                                ToolTip="Instrument Type" OnSelectedIndexChanged="ddlInstrumentType_SelectedIndexChanged"
                                                class="md-form-control form-control">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label Visible="false" runat="server" Text="Instrument Type" ID="lblInstrumentType" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkPastReceipts" runat="server"
                                                AutoPostBack="true" OnCheckedChanged="chkPastReceipts_CheckedChanged"></asp:CheckBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label runat="server" Text="Past Receipts" ID="lblPastReceipts" CssClass="styleDisplayLabel"></asp:Label>

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnListing" title="Challan Listing[Alt+C]" causesvalidation="true" onserverclick="btnListing_Click" runat="server"
                            type="button" accesskey="C" validationgroup="btnListing">
                            <i class="fa fa-list" aria-hidden="true"></i>&emsp;<u>C</u>hallan Listing
                        </button>
                        <button class="css_btn_enabled" id="btnGeneration" title="Challan Generation[Alt+G]"     causesvalidation="false"
                            onserverclick="btnGeneration_Click" runat="server"
                            type="button" accesskey="G" enabled="false">
                            <i class="fa fa-refresh" aria-hidden="true"></i>&emsp; Challan<u>G</u>eneration
                        </button>
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server" visible="true"
                            type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" enabled="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <button class="css_btn_enabled" id="btnchallancancel" title="Challan Cancel[Alt+W]" causesvalidation="false" runat="server"
                            type="button" accesskey="W">
                            <i class="fa fa-window-close-o" aria-hidden="true"></i>&emsp;<u></u>Challan Cancel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <%-- <div id="pnlGrid" runat="server" visible="false"></div>--%>
                            <asp:Panel ID="pnlGrid" runat="server" CssClass="stylePanel" Visible="false">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvChallan" runat="server" AutoGenerateColumns="false" BorderWidth="2px"
                                                HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="grvChallan_RowDataBound" ShowFooter="true"
                                                Width="100%">
                                                <%--                                         <PagerSettings Mode = "Numeric" PageButtonCount = "10" Position = "Bottom" Visible ="true" />
                                                --%>
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="Sl.No" ItemStyle-HorizontalAlign="Center" />
                                                    <%--<asp:TemplateField HeaderText="Sl.No">
                                        <ItemTemplate>
                                            <%# Eval("RowNumber").ToString() %>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                                    <asp:TemplateField HeaderText="Instrument Date">
                                                        <ItemTemplate>
                                                            <%# FormatDate(Eval("Instrument_Date").ToString())%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Receipt No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReceiptno" runat="server" Text='<%#Bind("Receipt_No")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField HeaderText="Receipt No" DataField="Receipt_No" ItemStyle-HorizontalAlign="Center" />--%>
                                                    <asp:BoundField DataField="Code" HeaderText="Instrument No" ItemStyle-HorizontalAlign="Left" />
                                                    <asp:BoundField DataField="Name" HeaderText="Entity/Funder Name" ItemStyle-HorizontalAlign="Left" />
                                                    <asp:BoundField DataField="Drawn_On" HeaderText="Drawee Bank" ItemStyle-HorizontalAlign="Left" />
                                                    <asp:BoundField HeaderText="Branch" DataField="Location" ItemStyle-HorizontalAlign="Left"
                                                        ItemStyle-Width="10%" />
                                                    <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                             <asp:Label ID="lblPageAmount" runat="server" ></asp:Label>
                                                             <asp:Label ID="lblGrandAmount" runat="server" ></asp:Label>
                                                        </FooterTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Exclude">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkExclude" runat="server" AutoPostBack="true" CausesValidation="false"
                                                                CssClass="styleGridHeader" OnCheckedChanged="chkExclude_CheckedChanged" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <%-- <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6"></PagerStyle>
                                                --%>
                                            </asp:GridView>
                                            <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <caption>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <%--                           <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlLocation"
                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                    ValidationGroup="btnListing" ErrorMessage="Select Location"></asp:RequiredFieldValidator>--%>
                                <asp:RequiredFieldValidator ID="rfvddlReceiptType" runat="server" ControlToValidate="ddlReceiptType"
                                    CssClass="styleMandatoryLabel" Display="None" InitialValue="0" SetFocusOnError="True"
                                    ValidationGroup="btnListing" ErrorMessage="Select Receipt type"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvtxtDate" runat="server" ControlToValidate="txtDate"
                                    CssClass="styleMandatoryLabel" ErrorMessage="Enter Date" Display="None" SetFocusOnError="True"
                                    ValidationGroup="btnListing"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="rfvddldraweeBank" runat="server" ControlToValidate="ddlDraweeBank"
                                    CssClass="styleMandatoryLabel" ErrorMessage="Select Deposit bank" Display="None"
                                    InitialValue="0" SetFocusOnError="True" ValidationGroup="btnListing"></asp:RequiredFieldValidator>
                                <%-- <asp:RequiredFieldValidator ID="rfvddlInstrumentType" runat="server" ControlToValidate="ddlInstrumentType"
                                    CssClass="styleMandatoryLabel" ErrorMessage="Select Instrument Type" Display="None"
                                    InitialValue="0" SetFocusOnError="True" ValidationGroup="btnListing"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:CustomValidator ID="CVChallanGeneration" runat="server" CssClass="styleMandatoryLabel"
                                    Height="50px">                                    
                                </asp:CustomValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                                    HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnListing" />
                            </div>
                        </div>
                    </caption>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblerrormessage" runat="server" CssClass="styleDisplayLabel" Text=""> </asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <%--        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
        </Triggers>--%>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
        function fnListing() {
            if (document.getElementById('ctl00_ContentPlaceHolder1_chkPastReceipts').checked == false) {
                if (document.getElementById('ctl00_ContentPlaceHolder1_txtDate').value == "") {
                    alert("Enter the Date");
                    document.getElementById('ctl00_ContentPlaceHolder1_txtDate').focus();
                    return false;
                }
            }
            if (document.getElementById('ctl00_ContentPlaceHolder1_ddlLOB').value == "0") {
                alert("Select the Line of Business.");
                document.getElementById('ctl00_ContentPlaceHolder1_ddlLOB').focus();
                return false;
            }
            if (document.getElementById('ctl00_ContentPlaceHolder1_ddlDraweeBank').value == "0") {
                alert("Select the Drawee Bank");
                document.getElementById('ctl00_ContentPlaceHolder1_ddlDraweeBank').focus();
                return false;
            }
            if (document.getElementById('ctl00_ContentPlaceHolder1_ddlBranch').value == "0") {
                alert("Select the Branch.");
                document.getElementById('ctl00_ContentPlaceHolder1_ddlBranch').focus();
                return false;
            }
            if (document.getElementById('ctl00_ContentPlaceHolder1_ddlReceiptType').value == "0") {
                alert("Select the Receipt Type.");
                document.getElementById('ctl00_ContentPlaceHolder1_ddlReceiptType').focus();
                return false;
            }
            if (document.getElementById('ctl00_ContentPlaceHolder1_ddlInstrumentType').value == "0") {
                alert("Select the Instrument Type");
                document.getElementById('ctl00_ContentPlaceHolder1_ddlInstrumentType').focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
