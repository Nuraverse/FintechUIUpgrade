<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptStockReceivables, App_Web_ycyxh5gd" enableeventvalidation="false" title="Stock and Receivables" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="upd1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Stock and Receivables Report">
                                </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlDemand" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                                Width="100%">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="true" CausesValidation="true"
                                                OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" ToolTip="Line of Business"
                                                class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLOB" CssClass="validation_msg_box_sapn" runat="server"
                                                    ControlToValidate="ddlLOB" InitialValue="-1" ErrorMessage="Select Line of Business"
                                                    Display="Dynamic" ValidationGroup="Ok">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"
                                                    ToolTip="Line of Business">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" Visible="true" class="md-form-control form-control"
                                                ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" AutoPostBack="true">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="StyleReqFieldLabel"
                                                    ToolTip="Branch">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12" style="display:none;">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddllocation2" runat="server" Visible="true" class="md-form-control form-control"
                                                ToolTip="Branch 2">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lbllocation" runat="server" Text="Branch 2" CssClass="StyleReqFieldLabel"
                                                    ToolTip="Branch 2">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtDate" runat="server" ToolTip="Date"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender runat="server" Format="dd/MM/yyyy" TargetControlID="txtDate"
                                                OnClientDateSelectionChanged="checkDate_NextSystemDate" PopupButtonID="imgStartMonth"
                                                ID="CalendarExtender1">
                                            </cc1:CalendarExtender>
                                            <asp:Image ID="imgStartMonth" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Select the Date."
                                                    ValidationGroup="Ok" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtDate"
                                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDate" CssClass="styleReqFieldLabel" Text="Date"
                                                    ToolTip="Date"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlDenomination" class="md-form-control form-control" runat="server" ToolTip="Denomination">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Denomination" ID="lblDenomination" CssClass="styleReqFieldLabel"
                                                    ToolTip="Denomination">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlCustomerReference" class="md-form-control form-control" runat="server" AutoPostBack="true" ToolTip="Reference" OnSelectedIndexChanged="ddlCustomerReference_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="0">Contract</asp:ListItem>
                                                <asp:ListItem Value="1">Customer</asp:ListItem>
                                                <asp:ListItem Value="2">Group</asp:ListItem>
                                                <asp:ListItem Value="3">Industry</asp:ListItem>

                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Reference" ID="lblCustomerReference" CssClass="styleReqFieldLabel"
                                                    ToolTip="Reference"></asp:Label>
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
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="BtnExcel" onserverclick="btnExcel_Click" runat="server" visible="false"
                            type="button" causesvalidation="false" accesskey="A" title="Excel,Alt+A">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i></i>&emsp;<u>E</u>xcel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblAmounts" runat="server" Visible="false" CssClass="styleDisplayLabel"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlStockReceivables" runat="server" GroupingText="Stock and Receivables Customer wise Details"
                                CssClass="stylePanel" Width="100%" Visible="false">
                                <div id="div2" runat="server" style="overflow: auto; height: 300px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvStockRec" runat="server" OnRowDataBound="grvStockRec_RowDataBound" Width="99%" AutoGenerateColumns="false"
                                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                    BorderColor="Gray">
                                                    <RowStyle HorizontalAlign="Center" />
                                                    <Columns>
                                                        <%--  <asp:TemplateField HeaderText="Month" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMonth" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblGrndTotal" runat="server" Text="Grand Total"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="LOB Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOBId" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblStockLOB" runat="server" Text='<%# Bind("LOB") %>' ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchId" runat="server" Text='<%# Bind("LOCATION_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDemandBranch" runat="server" Text='<%# Bind("LOCATION_NAME") %>'
                                                                    ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcustomerid" runat="server" Text='<%# Bind("CUSTOMER_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lnkCustomername" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' ToolTip="Group Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Arrears" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGrossprincipal" runat="server" Text='<%# Bind("Gross_principal1") %>' ToolTip="Principal"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotGrossPrincipal" runat="server" ToolTip="Total Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Future Installments" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblfutureInstallments" runat="server" Text='<%# Bind("future_instal1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotfutureInstallments" runat="server" ToolTip="Total Future Installments"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Gross Stock" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgrossstock" runat="server" Text='<%# Bind("gross_stock1") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotgrossstock" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblUMFC" runat="server" Text='<%# Bind("UMFC1") %>' ToolTip="UMFC"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotUMFC" runat="server" ToolTip="Total UMFC"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Principal Outstanding" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblNetPrincipal" runat="server" Text='<%# Bind("Net_Principal1") %>' ToolTip="Dues UnCollected Billed Finance Charges"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotNetPrincipal" runat="server" ToolTip="Total Net Principal"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Outstanding" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblNIC" runat="server" Text='<%# Bind("Interest_OS1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotInterestOS" runat="server" ToolTip="Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Future principle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFuturePrinciple" runat="server" Text='<%# Bind("Future_principal1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotFuturePrinciple" runat="server" ToolTip="Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Net Stock" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblnetstock" runat="server" Text='<%# Bind("net_stock1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotnetstock" runat="server" ToolTip="Total Net Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Debtors Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeptors_Balance" runat="server" Text='<%# Bind("DEPTORS_BAL1") %>' ToolTip="Debtors Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblDeptors_BalanceF" runat="server" ToolTip="Total Debtors Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Subsidy Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubsidy" runat="server" Text='<%# Bind("SUBSIDY_BAL1") %>' ToolTip="Subsidy Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblSubsidyF" runat="server" ToolTip="Total Subsidy Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Details">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnQuerygrvStockRec" Enabled="true" ImageUrl="~/Images/spacer.gif" ToolTip="Details"
                                                                    CssClass="styleGridEdit" runat="server" OnClick="imgbtnQuery_Click" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
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
                            <asp:Panel ID="pnlcontractwise" runat="server" GroupingText="Stock and Receivables Contractwise Details"
                                CssClass="stylePanel" Width="100%" Visible="false">
                                <div id="div3" runat="server" style="overflow: auto; height: 300px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvcontract" runat="server" OnRowDataBound="grvcontract_RowDataBound" Width="99%" AutoGenerateColumns="false"
                                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                    BorderColor="Gray">
                                                    <RowStyle HorizontalAlign="Center" />
                                                    <Columns>
                                                        <%--  <asp:TemplateField HeaderText="Month" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcontMonth" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblcontGrndTotal" runat="server" Text="Grand Total"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="LOB Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontcontLOBId" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontcontStockLOB" runat="server" Text='<%# Bind("LOB") %>' ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblcontcontTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontBranchId" runat="server" Text='<%# Bind("LOCATION_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontDemandBranch" runat="server" Text='<%# Bind("LOCATION_NAME") %>'
                                                                    ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontcustomerid" runat="server" Text='<%# Bind("CUSTOMER_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Name" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontCustomername" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' ToolTip="Group Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Account" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontpanum" runat="server" Text='<%# Bind("PANUM") %>' ToolTip="Group Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Sub Account" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lnkcontsanum" runat="server" Text='<%# Bind("SANUM") %>' ToolTip="Group Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Total Arrears" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontGrossprincipal" runat="server" Text='<%# Bind("Gross_principal1") %>' ToolTip="Principal"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotGrossPrincipal" runat="server" ToolTip="Total Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Future Installments" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontfutureInstallments" runat="server" Text='<%# Bind("future_instal1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotfutureInstallments" runat="server" ToolTip="Total Future Installments"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Gross Stock" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontgrossstock" runat="server" Text='<%# Bind("gross_stock1") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotgrossstock" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="NOI" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontNOI" runat="server" Text='<%# Bind("NOI") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotNOI" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontUMFC" runat="server" Text='<%# Bind("UMFC1") %>' ToolTip="UMFC"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotUMFC" runat="server" ToolTip="Total UMFC"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Principal Outstanding" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontNetPrincipal" runat="server" Text='<%# Bind("Net_Principal1") %>' ToolTip="Dues UnCollected Billed Finance Charges"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotNetPrincipal" runat="server" ToolTip="Total Net Principal"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Outstanding" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontNIC" runat="server" Text='<%# Bind("Interest_OS1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotInterest_OS" runat="server" ToolTip="Total Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Future principle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFuturePrinciple" runat="server" Text='<%# Bind("Future_principal1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotFuturePrinciple" runat="server" ToolTip="Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Net Stock" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontnetstock" runat="server" Text='<%# Bind("net_stock1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblconttotnetstock" runat="server" ToolTip="Total Net Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Debtors Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeptors_Balance" runat="server" Text='<%# Bind("DEPTORS_BAL1") %>' ToolTip="Debtors Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblDeptors_BalanceF" runat="server" ToolTip="Total Debtors Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Subsidy Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubsidy" runat="server" Text='<%# Bind("SUBSIDY_BAL1") %>' ToolTip="Subsidy Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblSubsidyF" runat="server" ToolTip="Total Subsidy Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Details">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnQuery_grvcontract" Enabled="true" ImageUrl="~/Images/spacer.gif" ToolTip="Details"
                                                                    CssClass="styleGridEdit" runat="server" OnClick="imgbtnQuery_Click" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
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
                            <asp:Panel ID="pnlgroup" runat="server" GroupingText="Stock and Receivables Group Wise Details"
                                CssClass="stylePanel" Width="100%" Visible="false">
                                <div id="div4" runat="server" style="overflow: auto; height: 300px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvgroupwise" runat="server" OnRowDataBound="grvgroupwise_RowDataBound" Width="99%" AutoGenerateColumns="false"
                                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                    BorderColor="Gray">
                                                    <RowStyle HorizontalAlign="Center" />
                                                    <Columns>
                                                        <%--  <asp:TemplateField HeaderText="Month" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblgpMonth" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblgpGrndTotal" runat="server" Text="Grand Total"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="LOB Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpcontLOBId" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpcontStockLOB" runat="server" Text='<%# Bind("LOB") %>' ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgpcontTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpBranchId" runat="server" Text='<%# Bind("LOCATION_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpDemandBranch" runat="server" Text='<%# Bind("LOCATION_NAME") %>'
                                                                    ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpcustomerid" runat="server" Text='<%# Bind("GROUP_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Group Name" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpCustomername" runat="server" Text='<%# Bind("GroupNAME") %>' ToolTip="Group Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Total Arrears" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpGrossprincipal" runat="server" Text='<%# Bind("Gross_principal1") %>' ToolTip="Principal"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotGrossPrincipal" runat="server" ToolTip="Total Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Future Installments" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpfutureInstallments" runat="server" Text='<%# Bind("future_instal1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotfutureInstallments" runat="server" ToolTip="Total Future Installments"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Gross Stock" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpgrossstock" runat="server" Text='<%# Bind("gross_stock1") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotgrossstock" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpUMFC" runat="server" Text='<%# Bind("UMFC1") %>' ToolTip="UMFC"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotUMFC" runat="server" ToolTip="Total UMFC"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Principal Outstanding" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpNetPrincipal" runat="server" Text='<%# Bind("Net_Principal1") %>' ToolTip="Dues UnCollected Billed Finance Charges"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotNetPrincipal" runat="server" ToolTip="Total Net Principal"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Outstanding" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpNIC" runat="server" Text='<%# Bind("Interest_OS1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotInterestOS" runat="server" ToolTip="Total Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Future principle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFuturePrinciple" runat="server" Text='<%# Bind("Future_principal1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotFuturePrinciple" runat="server" ToolTip="Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Net Stock" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblgpnetstock" runat="server" Text='<%# Bind("net_stock1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblgptotnetstock" runat="server" ToolTip="Total Net Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Debtors Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeptors_Balance" runat="server" Text='<%# Bind("DEPTORS_BAL1") %>' ToolTip="Debtors Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblDeptors_BalanceF" runat="server" ToolTip="Total Debtors Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Subsidy Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right"  Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubsidy" runat="server" Text='<%# Bind("SUBSIDY_BAL1") %>' ToolTip="Subsidy Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblSubsidyF" runat="server" ToolTip="Total Subsidy Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Details">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnQuery" Enabled="true" ImageUrl="~/Images/spacer.gif" ToolTip="Details"
                                                                    CssClass="styleGridEdit" runat="server" OnClick="imgbtnQuery_Click" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
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
                            <asp:Panel ID="pnlIndustry" runat="server" GroupingText="Stock and Receivables Industry Wise Details"
                                CssClass="stylePanel" Width="100%" Visible="false">
                                <div id="div5" runat="server" style="overflow: auto; height: 300px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvindustry" runat="server" OnRowDataBound="grvindustry_RowDataBound" Width="99%" AutoGenerateColumns="false"
                                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                    BorderColor="Gray">
                                                    <RowStyle HorizontalAlign="Center" />
                                                    <Columns>
                                                        <%--  <asp:TemplateField HeaderText="Month" ItemStyle-HorizontalAlign="Left" FooterStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblindustryMonth" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lblindustryGrndTotal" runat="server" Text="Grand Total"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="LOB Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustrycontLOBId" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustrycontStockLOB" runat="server" Text='<%# Bind("LOB") %>' ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrycontTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryBranchId" runat="server" Text='<%# Bind("LOCATION_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryDemandBranch" runat="server" Text='<%# Bind("LOCATION_NAME") %>'
                                                                    ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Industry Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustrycustomerid" runat="server" Text='<%# Bind("GROUP_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Industry Name" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryCustomername" runat="server" Text='<%# Bind("GroupNAME") %>' ToolTip="Group Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Total Arrears" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryGrossprincipal" runat="server" Text='<%# Bind("Gross_principal1") %>' ToolTip="Principal"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotGrossPrincipal" runat="server" ToolTip="Total Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryUMFC" runat="server" Text='<%# Bind("UMFC1") %>' ToolTip="UMFC"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotUMFC" runat="server" ToolTip="Total UMFC"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Future Installments" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryfutureInstallments" runat="server" Text='<%# Bind("future_instal1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotfutureInstallments" runat="server" ToolTip="Total Future Installments"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Gross Stock" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustrygrossstock" runat="server" Text='<%# Bind("gross_stock1") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotgrossstock" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Principal Outstanding" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryNetPrincipal" runat="server" Text='<%# Bind("Net_Principal1") %>' ToolTip="Dues UnCollected Billed Finance Charges"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotNetPrincipal" runat="server" ToolTip="Total Net Principal"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Outstanding" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustryNIC" runat="server" Text='<%# Bind("Interest_OS1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotindustryNIC" runat="server" ToolTip="Total Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Future principle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFuturePrinciple" runat="server" Text='<%# Bind("Future_principal1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotFuturePrinciple" runat="server" ToolTip="Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Net Stock" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblindustrynetstock" runat="server" Text='<%# Bind("net_stock1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblindustrytotnetstock" runat="server" ToolTip="Total Net Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Debtors Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDeptors_Balance" runat="server" Text='<%# Bind("DEPTORS_BAL1") %>' ToolTip="Debtors Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblDeptors_BalanceF" runat="server" ToolTip="Total Debtors Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Subsidy Balance" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSubsidy" runat="server" Text='<%# Bind("SUBSIDY_BAL1") %>' ToolTip="Subsidy Balance"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblSubsidyF" runat="server" ToolTip="Total Subsidy Balance"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Details">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnQuery" Enabled="true" ImageUrl="~/Images/spacer.gif" ToolTip="Details"
                                                                    CssClass="styleGridEdit" runat="server" OnClick="imgbtnQuery_Click" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
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
                            <asp:Panel ID="pnlDetails" runat="server" GroupingText="Stock and Receivables Detail Level"
                                CssClass="stylePanel" Width="100%" Visible="false">
                                <div id="div1" runat="server" style="overflow: auto; height: 300px;">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvdetails" runat="server" Width="99%" AutoGenerateColumns="false"
                                                    HeaderStyle-CssClass="styleGridHeader" RowStyle-HorizontalAlign="Center" ShowFooter="true"
                                                    BorderColor="Gray" OnRowDataBound="grvdetails_OnRowDataBound">
                                                    <RowStyle HorizontalAlign="Center" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="LOB Id" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLOBId" runat="server" Text='<%# Bind("LOB_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Line of Business" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblStockLOB" runat="server" Text='<%# Bind("LOB") %>' ToolTip="Line of Business"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lblTotal" runat="server" Text="Grand Total" ToolTip="Grand Total"></asp:Label>
                                                            </FooterTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblBranchId" runat="server" Text='<%# Bind("LOCATION_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Branch" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDemandBranch" runat="server" Text='<%# Bind("LOCATION_NAME") %>' ToolTip="Branch"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Customer ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustomer_id" runat="server" Text='<%# Bind("level_id") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Level Name" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCustCodeName" runat="server" Text='<%# Bind("LevelName") %>'
                                                                    ToolTip="Customer Name"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Account No" ItemStyle-HorizontalAlign="Left">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrime" runat="server" Text='<%# Bind("PANum") %>' ToolTip="Account No"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Sub Account No" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSub" runat="server" Text='<%# Bind("SANum") %>' ToolTip="Sub Account No"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Total Arrears" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetGrossprincipal" runat="server" Text='<%# Bind("Gross_principal1") %>' ToolTip="Principal"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotGrossPrincipal" runat="server" ToolTip="Total Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Future Installments" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetfutureInstallments" runat="server" Text='<%# Bind("future_instal1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotfutureInstallments" runat="server" ToolTip="Total Future Installments"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Gross Stock" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetgrossstock" runat="server" Text='<%# Bind("gross_stock1") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotgrossstock" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="NOI" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetNOI" runat="server" Text='<%# Bind("NOI") %>'
                                                                    ToolTip="Gross Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotNOI" runat="server" ToolTip="Gross Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="UMFC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetUMFC" runat="server" Text='<%# Bind("UMFC1") %>' ToolTip="UMFC"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotUMFC" runat="server" ToolTip="Total UMFC"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Principal Outstanding" ItemStyle-HorizontalAlign="Right"
                                                            FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetNetPrincipal" runat="server" Text='<%# Bind("Net_Principal1") %>' ToolTip="Dues UnCollected Billed Finance Charges"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotNetPrincipal" runat="server" ToolTip="Total Net Principal"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Interest Outstanding" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetNIC" runat="server" Text='<%# Bind("Interest_OS1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotinterestOutstanding" runat="server" ToolTip="Total Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Future principle" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFuturePrinciple" runat="server" Text='<%# Bind("Future_principal1") %>' ToolTip="NO Of Installments"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbltotFuturePrinciple" runat="server" ToolTip="Interest Outstanding"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Net Stock" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldetnetstock" runat="server" Text='<%# Bind("net_stock1") %>' ToolTip="Net Stock"></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:Label ID="lbldettotnetstock" runat="server" ToolTip="Total Net Stock"></asp:Label>
                                                            </FooterTemplate>
                                                            <FooterStyle HorizontalAlign="Right" />
                                                            <ItemStyle HorizontalAlign="Right" />
                                                        </asp:TemplateField>

                                                    </Columns>
                                                    <HeaderStyle CssClass="styleGridHeader" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                            type="button" causesvalidation="true" accesskey="P" title="Print,Alt+P" visible="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsStockRec" runat="server" CssClass="styleMandatoryLabel" Enabled="false" Visible="false"
                                CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="Ok" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="CVStockRec" runat="server" Display="None" ValidationGroup="btnPrint"></asp:CustomValidator>
                        </div>
                    </div>
                    <script language="javascript" type="text/javascript">
                        function Resize() {
                            if (document.getElementById('ctl00_ContentPlaceHolder1_divDemand') != null) {
                                if (document.getElementById('divMenu').style.display == 'none') {
                                    (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                                }
                                else {
                                    (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - 270;
                                }
                            }
                        }


                        function showMenu(show) {
                            if (show == 'T') {

                                if (document.getElementById('divGrid1') != null) {
                                    document.getElementById('divGrid1').style.width = "800px";
                                    document.getElementById('divGrid1').style.overflow = "scroll";
                                }

                                document.getElementById('divMenu').style.display = 'Block';
                                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                                document.getElementById('ctl00_imgShowMenu').style.display = 'none';
                                document.getElementById('ctl00_imgHideMenu').style.display = 'Block';

                                if (document.getElementById('ctl00_ContentPlaceHolder1_divDemand') != null)
                                    (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - 270;
                            }
                            if (show == 'F') {
                                if (document.getElementById('divGrid1') != null) {
                                    document.getElementById('divGrid1').style.width = "960px";
                                    document.getElementById('divGrid1').style.overflow = "auto";
                                }

                                document.getElementById('divMenu').style.display = 'none';
                                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                                if (document.getElementById('ctl00_ContentPlaceHolder1_divDemand') != null)
                                    (document.getElementById('ctl00_ContentPlaceHolder1_divDemand')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                            }
                        }

                    </script>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
             <asp:PostBackTrigger ControlID="btnOk" />
            <asp:PostBackTrigger ControlID="BtnExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
