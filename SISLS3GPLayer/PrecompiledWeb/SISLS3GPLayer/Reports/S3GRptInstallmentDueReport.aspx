<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptInstallmentDueReport, App_Web_qvacefhr" title="Instalment Due Report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="row">
            <div class="col">
                <h6 class="title_name">
                    <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Installment Due Report">
                    </asp:Label>
                </h6>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel runat="server" ID="PnlInput" CssClass="stylePanel" GroupingText="INPUT CRITERIA"
                    Width="100%">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlLOB" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                    AutoPostBack="True" ValidationGroup="Header" ToolTip="Line of Business"
                                    class="md-form-control form-control">
                                </asp:DropDownList>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleDisplayLabel" ToolTip="Line of Business"></asp:Label>
                                </label>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlbranch" runat="server" AutoPostBack="True" ValidationGroup="Header"
                                    ToolTip="Branch" OnSelectedIndexChanged="ddlbranch_SelectedIndexChanged"
                                    class="md-form-control form-control">
                                </asp:DropDownList>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblbranch" runat="server" CssClass="styleDisplayLabel" Text="Branch" ToolTip="Branch"></asp:Label>
                                </label>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" ValidationGroup="Header"
                                    ToolTip="Product" class="md-form-control form-control">
                                </asp:DropDownList>

                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblProduct" runat="server" Text="Product" CssClass="styleDisplayLabel" ToolTip="Product"></asp:Label>
                                </label>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">
                                <input id="hidDate" runat="server" type="hidden" />
                                <asp:TextBox ID="txtStartDateSearch" runat="server" OnTextChanged="txtStartDateSearch_TextChanged"
                                    AutoPostBack="true" ToolTip="Start Date" autocomplete="off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" Display="Dynamic" ControlToValidate="txtStartDateSearch"
                                        ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select Start Date"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Image ID="imgStartDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                    PopupButtonID="imgStartDateSearch" TargetControlID="txtStartDateSearch">
                                </cc1:CalendarExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblStartDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="Start Date" ToolTip="Start Date" />
                                </label>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="md-input">

                                <asp:TextBox ID="txtEndDateSearch" runat="server" OnTextChanged="txtEndDateSearch_TextChanged"
                                    AutoPostBack="true" ToolTip="End Date" autocomplete="off"
                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                <div class="validation_msg_box">
                                    <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" Display="Dynamic" ControlToValidate="txtEndDateSearch"
                                        ValidationGroup="btnGo" CssClass="validation_msg_box_sapn" ErrorMessage="Select End Date"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <asp:Image ID="imgEndDateSearch" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True"
                                    PopupButtonID="imgEndDateSearch" TargetControlID="txtEndDateSearch">
                                </cc1:CalendarExtender>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>
                                    <asp:Label ID="lblEndDateSearch" runat="server" CssClass="styleReqFieldLabel" Text="End Date" ToolTip="End Date" />
                                </label>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div align="right">
            <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                type="button" causesvalidation="true" accesskey="G" title="Go,Alt+G">
                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
            </button>
            <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                type="button" accesskey="L">
                <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Label ID="lblAmounts" runat="server" Text="[All amounts are in" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                <asp:Label ID="lblCurrency" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:Panel ID="PnlInstalmentDue" runat="server" CssClass="stylePanel" GroupingText="Installment Due Report">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird">
                                <div id="divAbstract" runat="server" style="overflow: scroll; height: 200px;">
                                    <asp:Label ID="lblRecord" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                                    <asp:GridView ID="grvAbstract" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-CssClass="styleGridHeader"
                                        OnRowDataBound="grvAbstract_RowDataBound" ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Line Of Business">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLOBGA" runat="server" Text='<%# Bind("LobName") %>' ToolTip="Line Of Business"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Branch">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranchGA" runat="server" Text='<%# Bind("LOCATION") %>' ToolTip="Branch"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProductGA" runat="server" Text='<%# Bind("Product") %>' ToolTip="Product"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPanum" runat="server" Text='<%# Bind("PANUM") %>' ToolTip="Account No."></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Customer Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%# Bind("CUSTOMER_NAME") %>' ToolTip="Customer Name"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Due Date" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDueDate" runat="server" Style="text-align: right" Text='<%# Bind("InstalmentDate") %>' ToolTip="Approved Amount"></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Style="text-align: left;" Text="Total" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment No" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstallment_No" runat="server" Style="text-align: right" Text='<%# Bind("Installment_No") %>' ToolTip="Installment No"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblInstallment_NoF" runat="server" Style="text-align: right;"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <FooterStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Installment Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstalmentAmt" runat="server" Style="text-align: right" Text='<%# Bind("InstalmentAmt") %>' ToolTip="Paid Amount"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalInstalment" runat="server" Style="text-align: right;" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Principal Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrincipalAmt" runat="server" Style="text-align: right" Text='<%# Bind("PrinciaplAmt") %>' ToolTip="Principal Amount"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalPrincipal" runat="server" Style="text-align: right;" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
                                                <ItemStyle HorizontalAlign="Right" />
                                                <FooterStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Interest Amount" ItemStyle-HorizontalAlign="Right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbInterestAmt" runat="server" Style="text-align: right" Text='<%# Bind("InterestAmt") %>' ToolTip="Interest Amount"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                <FooterTemplate>
                                                    <asp:Label ID="lblTotalInterest" runat="server" Style="text-align: right;" Font-Bold="true"></asp:Label>
                                                </FooterTemplate>
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
        <div align="right">
            <button class="css_btn_enabled" id="btnPrint" title="Print[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click" runat="server"
                type="button" accesskey="P">
                <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
            </button>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:ValidationSummary ID="vsDis" runat="server" CssClass="styleMandatoryLabel" visible="false" HeaderText="Please correct the following validation(s):"
                    ShowSummary="true" ValidationGroup="btnGo" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <asp:CustomValidator ID="CVInstalmentDueRpt" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
           </div>
            </div>
        </div>
    </asp:Content>


