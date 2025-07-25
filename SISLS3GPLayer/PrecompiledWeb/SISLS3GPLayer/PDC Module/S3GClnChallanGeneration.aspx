<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChallanGeneration, App_Web_k0kfymif" title="Untitled Page" %>

<%@ Register Assembly="iCONWebComponents" Namespace="iCON.Web.Components" TagPrefix="cc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Challan Generation" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" ToolTip="Line of Business"
                                    OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" CssClass="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Branch" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" CssClass="md-form-control form-control" ValidationGroup="btnListing">
                                </asp:DropDownList>
                                <%--                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="ddlBranch"
                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                        ValidationGroup="btnListing" ErrorMessage="Select the Branch"></asp:RequiredFieldValidator>
                                </div>--%>
                                <%--<uc:Suggest ID="ddlBranch" ToolTip="Branch" runat="server" AutoPostBack="True"
                                    OnItem_Selected="ddlBranch_SelectedIndexChanged" IsMandatory="true" ErrorMessage="Select a Branch"
                                    ValidationGroup="btnListing" ServiceMethod="GetBranchList" WatermarkText="--Select--" />--%>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Branch" ID="lblBranch" CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlDepositBank" ToolTip="Deposit Bank" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlDepositBank_SelectedIndexChanged" CssClass="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlDepositBank" runat="server" ControlToValidate="ddlDepositBank"
                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                        ValidationGroup="btnListing"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Deposit Bank" ID="lblDepositBank" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlReceiptType" runat="server" AutoPostBack="true" ToolTip="Receipt Type"
                                    OnSelectedIndexChanged="ddlReceiptType_SelectedIndexChanged" CssClass="md-form-control form-control" onmouseover="ddl_itemchanged(this);">
                                </asp:DropDownList>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvddlReceiptType" runat="server" ControlToValidate="ddlReceiptType"
                                        CssClass="validation_msg_box_sapn" Display="Dynamic" InitialValue="0" SetFocusOnError="True"
                                        ValidationGroup="btnListing" ErrorMessage="Select the Receipt Type"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Receipt Type" ID="lblReceiptType" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlInstrumentType" Visible="false" AutoPostBack="true" runat="server"
                                    ToolTip="Instrument Type" CssClass="md-form-control form-control" OnSelectedIndexChanged="ddlInstrumentType_SelectedIndexChanged"
                                    onmouseover="ddl_itemchanged(this);">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <uc:Suggest ID="suPickList" ToolTip="Pick List No." runat="server" IsMandatory="true" ErrorMessage="Select a Pick List No."
                                    ServiceMethod="GetPickList" WatermarkText="--Select--" Enabled="false" />
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Instrument Type" Visible="false" ID="lblInstrumentType"
                                        CssClass="styleDisplayLabel"></asp:Label>
                                    <asp:Label runat="server" Text="Pick List No." ID="lblPickList"
                                        CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtDate" runat="server" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_false"
                                    OnTextChanged="txtDate_TextChanged"
                                    ToolTip="Date"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                    PopupButtonID="Image1"
                                    ID="CalendarExtender2" Enabled="true">
                                </cc1:CalendarExtender>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvtxtDate" runat="server" ControlToValidate="txtDate"
                                        CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True" ValidationGroup="btnListing"></asp:RequiredFieldValidator>
                                </div>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Date" ID="lblDate" CssClass="styleReqFieldLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:TextBox ID="txtChallanNo" Visible="true" runat="server" class="md-form-control form-control login_form_content_input requires_false" ReadOnly="True" ToolTip="Challan Number"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Challan No" Visible="true" ID="lblChallanNo" CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:CheckBox ID="chkPastReceipts" runat="server" AutoPostBack="true" Checked="true" OnCheckedChanged="chkPastReceipts_CheckedChanged"></asp:CheckBox>
                                <asp:Label runat="server" Text="Past Receipts" ID="lblPastReceipts" CssClass="styleDisplayLabel"></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                            <div class="md-input">
                                <asp:TextBox ID="txtChallanStatus" runat="server" class="md-form-control form-control login_form_content_input requires_false" ReadOnly="True" ToolTip="Challan Status"></asp:TextBox>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label class="tess">
                                    <asp:Label runat="server" Text="Challan Status" Visible="true" ID="lblChallanStatus" CssClass="styleDisplayLabel"></asp:Label>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" id="dvLanguage" runat="server" visible="false">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLanguage" ToolTip="Language" runat="server" class="md-form-control form-control  requires_false">
                                </asp:DropDownList>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" Text="Language"></asp:Label>
                                </label>
                            </div>
                        </div>
                    </div>



                    <div class="row" runat="server" id="dvPickList" visible="false">
                        <div class="gird">
                            <asp:GridView ID="grvPickList" runat="server" AutoGenerateColumns="false" BorderWidth="2px"
                                HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="grvPickList_RowDataBound"
                                CssClass="gird_details" Width="100%" OnRowCommand="grvPickList_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="RowNumber" HeaderText="Sl.No" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="Pick List ID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpickListID" runat="server" Text='<%#Bind("PICK_LIST_ID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pick List No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpickListno" runat="server" Text='<%#Bind("PICK_LIST_NO") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pick List Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpickListDate" runat="server" Text='<%#Bind("PICK_LIST_DATE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Receipts" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNoOfReceipts" runat="server" Text='<%#Bind("RECEIPT_COUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRecAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="View">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnQuery" ImageUrl="~/Images/spacer.gif" CssClass="styleGridQuery"
                                                CommandArgument='<%# Bind("PICK_LIST_ID") %>' CommandName="Query" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Include">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkPickExclude" runat="server" AutoPostBack="true" CausesValidation="false"
                                                CssClass="styleGridHeader" OnCheckedChanged="chkPickExclude_CheckedChanged" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row" runat="server" id="pnlGrid" visible="false">
                        <div class="gird">
                            <asp:GridView ID="grvChallan" runat="server" AutoGenerateColumns="false" BorderWidth="2px"
                                HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="grvChallan_RowDataBound" CssClass="gird_details"
                                Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="RowNumber" HeaderText="Sl.No" ItemStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="Receipt No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReceiptno" runat="server" Text='<%#Bind("Receipt_No")%>'></asp:Label>
                                            <asp:Label ID="lblReceiptID" runat="server" Text='<%#Bind("Receipt_ID")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Receipt Date" DataField="Receipt_Date" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField HeaderText="Instrument Type" DataField="Instrument_Type" Visible="false" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField HeaderText="Instrument No" DataField="Instrument_No" ItemStyle-HorizontalAlign="Left" />
                                    <asp:TemplateField HeaderText="Instrument Date">
                                        <ItemTemplate>
                                          <asp:Label ID="lblInstrumentDate" runat="server" Text='<%#Bind("Instrument_Date")%>'></asp:Label>
                                            <%--  <%#Eval("Instrument_Date").ToString()%>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Customer_Code" HeaderText="Entity/Customer Code" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="Customer_Name" HeaderText="Entity/Customer Name" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="Account_No" HeaderText="Account Number" Visible="false" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="Drawee Bank" HeaderText="Drawee Bank" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField HeaderText="Branch" DataField="Location" ItemStyle-HorizontalAlign="Left" />
                                    <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="LOB_ID" HeaderText="LOB ID" ItemStyle-HorizontalAlign="Center"
                                        Visible="false" />
                                    <asp:TemplateField HeaderText="Include">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkExclude" runat="server" Checked="false" AutoPostBack="true" 
                                                CssClass="styleGridHeader" OnCheckedChanged="chkExclude_CheckedChanged" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row" runat="server" id="dvPaging" visible="false">
                        <uc1:PageNavigator ID="ucCustomPaging" runat="server" />
                    </div>
                    <div class="row">
                        <asp:Label ID="lblerrormessage" runat="server" CssClass="styleDisplayLabel" Text=""> </asp:Label>
                    </div>


                    <div class="row" align="right">
                        <div class="col">
                            <div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
                                        <asp:Label runat="server" Text="Page Total : " ID="LblPageTotal" CssClass="styleDisplayLabel"></asp:Label>
                                        <asp:Label runat="server" Text="0" ID="TxtPageTotal" CssClass="styleDisplayLabel"></asp:Label>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
                                        <asp:Label runat="server" Text="Grand Total : " ID="LblGrandTotal" CssClass="styleDisplayLabel"></asp:Label>
                                        <asp:Label runat="server" Text="0" ID="TxtGrandTotal" CssClass="styleDisplayLabel"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" runat="server" id="DivExport" visible="false">
                        <div class="col-xs-12 md-input">
                            <asp:Panel runat="server" ID="pnlReceipt" CssClass="stylePanel" GroupingText="Receipt Details"
                                Width="100%">
                                <div class="gird">
                                    <asp:GridView ID="grvChallan_Export" runat="server" AutoGenerateColumns="false" BorderWidth="2px"
                                        HeaderStyle-CssClass="styleGridHeader" CssClass="gird_details"
                                        Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="RowNumber" HeaderText="Sl.No" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateField HeaderText="Receipt No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceiptno" runat="server" Text='<%#Bind("Receipt_No")%>'></asp:Label>
                                                    <asp:Label ID="lblReceiptID" runat="server" Text='<%#Bind("Receipt_ID")%>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Receipt Date" DataField="Receipt_Date" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField HeaderText="Account No" DataField="ACCOUNT_NO" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Instrument Type" DataField="Instrument_Type" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField HeaderText="Instrument No" DataField="Instrument_No" ItemStyle-HorizontalAlign="Center" />
                                            <asp:TemplateField HeaderText="Instrument Date">
                                                <ItemTemplate>
                                                    <%#Eval("Instrument_Date").ToString()%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Customer_Code" HeaderText="Entity/Customer Code" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="Customer_Name" HeaderText="Entity/Customer Name" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="Account_No" HeaderText="Account Number" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="Drawee_Bank" HeaderText="Drawee Bank" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField HeaderText="Branch" DataField="Location" ItemStyle-HorizontalAlign="Left" />
                                            <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="LOB_ID" HeaderText="LOB ID" ItemStyle-HorizontalAlign="Center"
                                                Visible="false" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div style="display: none" class="row">
                            <div class="col">
                                <iframe id="MyIframeOpenFile" visible="false" src="~/Common/S3GViewFileCheckList.aspx" runat="server" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100px; height: 21px;" allowtransparency="true"></iframe>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="display: none;">
                        <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" ShowSummary="true" ValidationGroup="btnListing" />
                    </div>
                    <div class="row" align="right">
                        <div class="col">
                            <div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
                                        <button id="btnListing" runat="server" accesskey="S"
                                            class="css_btn_enabled" type="button" onserverclick="btnListing_Click" title="List the Receipt details[Alt+S]"
                                            validationgroup="btnListing">
                                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;Challan Li<u>s</u>ting
                                        </button>
                                        <button id="btnGeneration" runat="server" accesskey="G" onclick="if(fnCheckPageValidators())"
                                            class="css_btn_enabled" type="button" onserverclick="btnGeneration_Click" title="Challan Generation  [Alt+G]"
                                            causesvalidation="false">
                                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Challan <u>G</u>eneration 
                                        </button>
                                        <button id="btnPrint" runat="server" accesskey="P"
                                            class="css_btn_enabled" type="button" onserverclick="btnPrint_Click" title="Print [Alt+P]"
                                            causesvalidation="false">
                                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                                        </button>
                                        <asp:HiddenField ID="hdnChallanID" runat="server" />
                                        <asp:Button ID="BtnHdnPrint" runat="server" Text="CDS Print" CausesValidation="false" CssClass="styleSubmitButton"
                                            OnClick="BtnHdnPrint_Click" Style="display: none;" />
                                        <button id="BtnExport" runat="server" accesskey="E"
                                            class="css_btn_enabled" type="button" onserverclick="BtnExport_Click" title="Export [Alt+E]"
                                            causesvalidation="false">
                                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport
                                        </button>
                                        <button id="btnChallanCancel" runat="server" accesskey="C"
                                            class="css_btn_enabled" type="button" onserverclick="btnChallanCancel_Click" title="Challan Cancel [Alt+C]"
                                            causesvalidation="false" onclick="if(fnConfirmCancel())">
                                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel Challan
                                        </button>
                                        <button id="btnClear" runat="server" causesvalidation="false" class="css_btn_enabled"
                                            type="button" onclick="if(fnConfirmClear())" onserverclick="btnClear_Click"
                                            title="Clear [Alt+L]" accesskey="L">
                                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear   
                                        </button>
                                        <button id="btnCancel" runat="server" type="button" validationgroup="PRDDC"
                                            causesvalidation="false" class="css_btn_enabled" onserverclick="btnCancel_Click"
                                            title="Exit[Alt+X]" onclick="if(fnConfirmExit())" accesskey="X">
                                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
            <asp:PostBackTrigger ControlID="BtnExport" />
            <asp:PostBackTrigger ControlID="BtnHdnPrint" />
        </Triggers>
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
            /* if(document.getElementById('ctl00_ContentPlaceHolder1_ddlInstrumentType').value=="0")
            {
            alert("Select the Instrument Type");
            document.getElementById('ctl00_ContentPlaceHolder1_ddlInstrumentType').focus();
            return false;
            }  */
            return true;
        }

        function fnConfirmCancel() {
            if (confirm('Do you want to Cancel this Deposit Slip'))
                return true;
            else
                return false;
        }


    </script>

</asp:Content>
