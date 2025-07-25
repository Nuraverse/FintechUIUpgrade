<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_S3GRptDocumentDeficiencyReport, App_Web_lyohvbtb" title="Document Deficiency Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<%@ Register TagPrefix="uc1" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Document Deficiency Report">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlHeader" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                        Width="100%">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleDisplayLabel"
                                            ToolTip="Line of Business">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtCustomerName" runat="server" Style="display: none;" Width="100%"
                                        CausesValidation="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server"
                                        IsMandatory="true" AutoPostBack="true" DispalyContent="Both" class="md-form-control form-control"
                                        strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                    <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false"
                                        OnClick="btnLoadCustomer_OnClick" Style="display: none" />
                                    <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code" ValidationGroup="Go">  </asp:TextBox>
                                    <input id="hdnCustID" type="hidden" runat="server" />
                                    <input type="hidden" id="hdnCustomerID" runat="server" />
                                    <asp:Button ID="btncust" runat="server" Text="" CausesValidation="false" UseSubmitBehavior="false" OnClick="btncust_Click"
                                        Style="display: none" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblCustomerName" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlType" runat="server" ToolTip="Type" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RFVddlType" Display="Dynamic" runat="server" ErrorMessage="Select the Document Type"
                                            ValidationGroup="Ok" SetFocusOnError="True" ControlToValidate="ddlType" InitialValue="0"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblType" Text="Type" CssClass="styleDisplayLabel" ToolTip="Type"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div style="display: none" class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlStatus" runat="server" ToolTip="Status" class="md-form-control form-control login_form_content_input requires_true">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblStatus" Text="Status" CssClass="styleDisplayLabel"
                                            ToolTip="Status"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">

                                <div class="md-input">
                                    <uc1:Suggest ID="ucDealerLov" runat="server" ServiceMethod="GetDealerList" ToolTip="Dealer Name" class="md-form-control form-control login_form_content_input requires_true" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label runat="server" ID="lblDealerName" CssClass="styleDisplayLabel" Text="Dealer Name" ToolTip="Dealer Name"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtFrom" ContentEditable="true" runat="server" ToolTip="Report From Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgFrom" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtFrom"
                                        PopupButtonID="imgFrom" ID="CalendarExtender1" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Report From Date"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtFrom"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblfrom" Text="Report From Date" CssClass="styleReqFieldLabel"
                                            ToolTip="Report From Date"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtTo" ContentEditable="true" runat="server" ToolTip="Report To Date"
                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <asp:Image ID="imgTo" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                    <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtTo"
                                        PopupButtonID="imgTo" ID="CalendarExtender2" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                    </cc1:CalendarExtender>
                                    <div class="validation_msg_box">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Report To Date"
                                            ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtTo"
                                            CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                    </div>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" ID="lblto" Text="Report To Date" CssClass="styleReqFieldLabel"
                                            ToolTip="Report To Date"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div align="right">
                            <button class="css_btn_enabled" id="btnOk" onserverclick="btnOk_Click" validationgroup="Ok" runat="server"
                                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                            </button>
                            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                                causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                                type="button" accesskey="X">
                                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                            </button>
                            <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                                type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P">
                                <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:Panel ID="pnlDemand" runat="server" GroupingText="Document Deficiency Report" CssClass="stylePanel" Width="100%" Visible="false">
                                    <asp:Label ID="lblError" runat="server" CssClass="styleDisplayLabel"></asp:Label>
                                    <div id="divDemand" runat="server" style="overflow: Scroll; height: 200px;">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="gird">
                                                    <asp:GridView ID="grvDemand" runat="server" Width="100%" OnRowDataBound="grvDemand_RowDataBound" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader"
                                                        RowStyle-HorizontalAlign="Center" ShowFooter="true">
                                                        <Columns>
                                                            <%-- <asp:TemplateField HeaderText="Doctran" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPDDTID" runat="server" Text='<%# Bind("DOCTRANID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="styleGridHeader" />
                                                </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblLoc" runat="server" Text='<%# Bind("LOCATION") %>' ToolTip="Location"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCusName" runat="server" Text='<%# Bind("Customer_Name") %>' ToolTip="Customer Name"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Document Type" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDoctype" runat="server" Text='<%# Bind("Document_Type") %>' ToolTip="Document Type"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Dealer Name" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDealerName" runat="server" Text='<%# Bind("Entity_Name") %>' ToolTip="Dealer Name"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Proposal Number" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblProposalNumber" runat="server" Text='<%# Bind("BUSINESS_OFFER_NUMBER") %>' ToolTip="Proposal Number"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAccountNumber" runat="server" Text='<%# Bind("Account_Number") %>' ToolTip="Account Number"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Document Description" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDocdesc" runat="server" Text='<%# Bind("Prddc_Doc_Description") %>' ToolTip="Document Description"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>


                                                            <asp:TemplateField HeaderText="Marketing officer" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSalesPerson" runat="server" Text='<%# Bind("Sales_Person") %>' ToolTip="Collected On"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Proposal date" ItemStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblproposaldate" runat="server" Text='<%# Bind("PROPOSAL_DATE") %>' ToolTip="Collected By"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
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
                                <asp:ValidationSummary ID="VSDocDef" runat="server" CssClass="styleMandatoryLabel" CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:CustomValidator ID="CVDocDef" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <script language="javascript" type="text/javascript">
                function fnLoadCustomer() {
                    document.getElementById("<%= btnLoadCustomer.ClientID %>").click();

                }
            </script>
        </div>
    </div>
</asp:Content>

















