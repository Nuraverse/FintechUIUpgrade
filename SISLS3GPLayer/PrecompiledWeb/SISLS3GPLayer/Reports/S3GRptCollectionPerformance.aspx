<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_S3GRptCollectionPerformance, App_Web_zznul5le" title="Collection Performance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .Freezing {
            position: relative;
            top: fixed;
            z-index: auto;
            left: auto;
        }
    </style>
    <asp:UpdatePanel ID="udpInsDetails" runat="server">
        <ContentTemplate>
            <div>

                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Collection Performance Report">
                            </asp:Label>
                        </h6>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlIntput" runat="server" GroupingText="Input Criteria" CssClass="stylePanel"
                            Width="99%">

                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLOB" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                            class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="RFVLOB" CssClass="validation_msg_box_sapn"
                                                runat="server" InitialValue="0" ControlToValidate="ddlLOB" ValidationGroup="btnGo"
                                                ErrorMessage="Select the Line of Business" Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblLOB" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblProduct" runat="server" Text="Scheme" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 styleFieldLabel" style="display: none">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlLoc2" runat="server" Width="185px">
                                        </asp:DropDownList>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="LblLoc2" runat="server" CssClass="styleDisplayLabel" Text="Location2"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:RadioButtonList ID="rdbRptBasis" runat="server" RepeatDirection="Horizontal"
                                            CssClass="md-form-control form-control radio"
                                            RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="rdbRptBasis_SelectedIndexChanged">
                                            <asp:ListItem Text="Net of Cheque Return" Value="Net of ChequeReturn"></asp:ListItem>
                                            <asp:ListItem Text="Comparative Analysis" Value="Comparative Analysis">
                                            </asp:ListItem>
                                        </asp:RadioButtonList>
                                        <label class="tess">
                                            <asp:Label ID="LblReportBasis" runat="server" CssClass="styleDisplayLabel" Text="Report Basis"> </asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlchkCollaection" runat="server" GroupingText="Search Criteria" CssClass="stylePanel"
                            Width="99%">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <asp:Panel ID="PnlNormal" runat="server" GroupingText="Normal Date range" CssClass="stylePanel">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtNormalFromDate" ContentEditable="false" AutoPostBack="true" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"
                                                        OnTextChanged="FunDateValidation"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RqvtxtNormalFromDate" Enabled="true" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtNormalFromDate" ValidationGroup="btnGo"
                                                            ErrorMessage="Enter the From Date in Normal Date Range" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <asp:Image ID="imgNormalFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" ToolTip="Date From" Visible="false" />
                                                    <cc1:CalendarExtender runat="server" TargetControlID="txtNormalFromDate" PopupButtonID="imgNormalFromDate"
                                                        ID="calNormalFromDate" PopupPosition="BottomLeft">
                                                    </cc1:CalendarExtender>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblNormalFromDate" runat="server" Text="From" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtNormalToDate" ContentEditable="false" runat="server" AutoPostBack="true"
                                                        OnTextChanged="FunDateValidation"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RqvtxtNormalToDate" Enabled="true" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtNormalToDate" ValidationGroup="btnGo"
                                                            ErrorMessage="Enter the To Date in Normal Date Range"
                                                            Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <asp:Image ID="imgNormalToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender runat="server" Format="MM/yyyy" TargetControlID="txtNormalToDate"
                                                        PopupButtonID="imgNormalToDate" ID="calNormalToDate">
                                                    </cc1:CalendarExtender>
                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblNormalToDate" runat="server" Text="To" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <asp:Panel ID="PnlCompare" runat="server" CssClass="stylePanel" GroupingText="Comparative Date Range">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtComparativeFromDate" ContentEditable="false" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RqvtxtComparativeFromDate" Enabled="true" CssClass="styleMandatoryLabel"
                                                            runat="server" ControlToValidate="txtComparativeFromDate" ValidationGroup="btnGo"
                                                            ErrorMessage="Enter the From Date in Comparative Date Range" Display="None">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <asp:Image ID="imgComparativeFromDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender runat="server" Format="MM/yyyy" TargetControlID="txtComparativeFromDate"
                                                        PopupButtonID="imgComparativeFromDate" ID="calComparativeFromDate">
                                                    </cc1:CalendarExtender>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblComparativeFromDate" runat="server" Text="From" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 styleFieldLabel">
                                                <div class="md-input">
                                                    <asp:TextBox ID="txtComparativeToDate" ContentEditable="false" runat="server"
                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator ID="RqvtxtComparativeToDate" Enabled="true" CssClass="validation_msg_box_sapn"
                                                            runat="server" ControlToValidate="txtComparativeToDate" ValidationGroup="btnGo" InitialValue="0"
                                                            ErrorMessage="Enter the To Date in Comparative Date Range" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                    <asp:Image ID="imgComparativeToDate" runat="server" ImageUrl="~/Images/calendaer.gif" Visible="false" />
                                                    <cc1:CalendarExtender runat="server" Format="MM/yyyy" TargetControlID="txtComparativeToDate"
                                                        PopupButtonID="imgComparativeToDate" ID="calComparativeToDate">
                                                    </cc1:CalendarExtender>

                                                    <span class="highlight"></span>
                                                    <span class="bar"></span>
                                                    <label>
                                                        <asp:Label ID="lblComparativeToDate" runat="server" Text="To" CssClass="styleReqFieldLabel"></asp:Label>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>

                        </asp:Panel>
                    </div>
                </div>

                <div align="right">

                    <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="btnGo" runat="server"
                        type="button" accesskey="G" title="Go,Alt+G" causesvalidation="true">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())"
                        causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ID="vsDPDRep" runat="server" Visible="false" ValidationGroup="btnGo" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlCollectionAmount" runat="server" GroupingText="Collection Amount"
                            CssClass="stylePanel" Width="99%" ScrollBars="Horizontal" HorizontalAlign="Center">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:Label ID="lblCollAmtMsg" runat="server" Visible="false"></asp:Label>
                                        <asp:GridView ID="grvCollectionAmount" runat="server" AutoGenerateColumns="False"
                                            ShowFooter="true" OnRowCreated="grvCollectionAmount_RowCreated" OnPageIndexChanging="grvCollectionAmount_PageIndexChanging"
                                            OnSelectedIndexChanged="grvCollectionAmount_SelectedIndexChanged" PageSize="100">
                                            <Columns>
                                                <asp:TemplateField HeaderText="LOB">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB_Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomer" runat="server" Text='<%# Bind("Customer_Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location_Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Product")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PANum")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Account No" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SANum")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Due Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("INSTALLMENTDATE")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <%-- <asp:TemplateField HeaderText="Receipt Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("RECEIPTDATE")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                        <HeaderStyle Width="10%" />
                                    </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Due Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDue" runat="server" Text='<%# Bind("PERIOD")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NOD">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNOD" runat="server" Text='<%# Bind("NOD")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="0 - 30">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeing0to30" runat="server" Text='<%# Bind("Ageing0to30")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotal0to30" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="31 - 60">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeing31to60" runat="server" Text='<%# Bind("Ageing31to60")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotal31to60" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="61 - 90">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeing61to90" runat="server" Text='<%# Bind("Ageing61to90")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotal61to90" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="&gt; 90 ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeingAbove90" runat="server" Text='<%# Bind("AgeingAbove90")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotalAbove90" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Balance Due">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBalDue" runat="server" Text='<%# Bind("BALDUE")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotalBalDue" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnPrint" title="Export Report Details[Alt+P]" causesvalidation="false" onserverclick="btnPrint_Click"
                                    runat="server" type="button">
                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Export
                                </button>
                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlChequeReturn" runat="server" GroupingText="Cheque Return" CssClass="stylePanel"
                            Width="99%" ScrollBars="Horizontal" HorizontalAlign="Center">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:Label ID="lblChqRtnMsg" runat="server" Visible="false"></asp:Label>
                                        <asp:GridView ID="grvChequeReturn" runat="server" AutoGenerateColumns="False" OnRowCreated="grvChequeReturn_RowCreated"
                                            OnPageIndexChanging="grvChequeReturn_PageIndexChanging"
                                            OnSelectedIndexChanged="grvCollectionAmount_SelectedIndexChanged" ShowFooter="true"
                                            PageSize="100">
                                            <Columns>
                                                <asp:TemplateField HeaderText="LOB">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB_Name")%>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomer" runat="server" Text='<%# Bind("Customer_Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location_Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Product")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("PANum")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sub Account No" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SANum")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="10%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Due Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("Due_Date")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <%-- <asp:TemplateField HeaderText="Receipt Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDueDate" runat="server" Text='<%# Bind("RECEIPTDATE")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                        <HeaderStyle Width="10%" />
                                    </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Due Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDue" runat="server" Text='<%# Bind("Due_Amount")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NOD">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNOD" runat="server" Text='<%# Bind("NOD")%>' Width="30px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total" Width="30px"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="15%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="15%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeing0to30" runat="server" Text='<%# Bind("Ageing0to30")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCMTotal0to30" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cheque Return Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeReturn0to30" runat="server" Text='<%# Bind("Chq_Ageing0to30")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCRTotal0to30" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeing31to60" runat="server" Text='<%# Bind("Ageing31to60")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCMTotal31to60" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cheque Return Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeReturn31to60" runat="server" Text='<%# Bind("Chq_Ageing31to60")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCRTotal31to60" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeing61to90" runat="server" Text='<%# Bind("Ageing61to90")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCMTotal61to90" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cheque Return Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeReturn61to90" runat="server" Text='<%# Bind("Chq_Ageing61to90")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCRTotal61to90" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Collection Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAgeingAbove90" runat="server" Text='<%# Bind("AgeingAbove90")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCMTotalAbove90" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cheque Return Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeReturnAbove90" runat="server" Text='<%# Bind("Chq_AgeingAbove90")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtCRTotalAbove90" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Right" />
                                                    <HeaderStyle Width="25%" HorizontalAlign="Left" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnChkPrint" title="Export Report Details[Alt+P]" causesvalidation="false" onserverclick="btnChkPrint_Click"
                                    runat="server" type="button">
                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Export
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:Panel ID="pnlComparative" runat="server" GroupingText="Comparative Analysis"
                            CssClass="stylePanel" Width="99%" ScrollBars="Horizontal" HorizontalAlign="Center">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="gird">
                                        <asp:Label ID="lblAnlyAmtMsg" runat="server" Visible="false"></asp:Label>
                                        <asp:GridView ID="GrvComparativeAnalysis" runat="server" AutoGenerateColumns="false"
                                            OnRowCreated="GrvComparativeAnalysis_RowCreated" Width="100%" OnPageIndexChanging="GrvComparativeAnalysis_PageIndexChanging"
                                            ShowFooter="true">
                                            <Columns>
                                                <asp:TemplateField HeaderText="LOB">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLOB" runat="server" Text='<%# Bind("LOB")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Customer Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCustomer" runat="server" Text='<%# Bind("CustomerName")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Location">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location_Name")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Product")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" />
                                                    <HeaderStyle Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Account No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPANum" runat="server" Text='<%# Bind("AccountNumber")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="25%" />
                                                    <FooterStyle Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" HeaderText="Sub Account No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSANum" runat="server" Text='<%# Bind("SubAccountNumber")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Left" Wrap="true" />
                                                    <HeaderStyle Width="10%" />
                                                    <FooterStyle Width="10%" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="First Period Due">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFirstDue" runat="server" Text='<%# Bind("FstPrdDue")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtFirstDue" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Second Period Due">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSecondDue" runat="server" Text='<%# Bind("SndPrdDue")%>' Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtSecondDue" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="First Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl030FstPrdClnAmnt" runat="server" Text='<%# Bind("FstprdClnAmt030")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt030FstPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Second Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl030SndPrdClnAmnt" runat="server" Text='<%# Bind("SndprdClnAmt030")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt030SndPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="First Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl3160FstPrdClnAmnt" runat="server" Text='<%# Bind("FstprdClnAmt3160")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt3160FstPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Second Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl3160SndPrdClnAmnt" runat="server" Text='<%# Bind("SndprdClnAmt3160")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt3160SndPrdClnTotal" runat="server" ReadOnly="true" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="First Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl6190FstPrdClnAmnt" runat="server" Text='<%# Bind("FstprdClnAmt6190")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt6190FstPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Second Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl6190SndPrdClnAmnt" runat="server" Text='<%# Bind("SndprdClnAmt6190")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txt6190SndPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="First Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAbv90FstPrdClnAmnt" runat="server" Text='<%# Bind("FstprdClnAmtAbv90")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtAbv90FstPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Second Period Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAbv90SndPrdClnAmnt" runat="server" Text='<%# Bind("SndprdClnAmtAbv90")%>'
                                                            Width="150px"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtAbv90SndPrdClnTotal" ReadOnly="true" runat="server" Width="150px" Style="text-align: right"></asp:TextBox>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Right" Width="25%" />
                                                    <FooterStyle HorizontalAlign="Right" Width="25%" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <div align="right">
                                <button class="css_btn_enabled" id="btnAnlyPrint" title="Export Report Details[Alt+P]" causesvalidation="false" onserverclick="btnAnlyPrint_Click"
                                    runat="server" type="button">
                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;Export
                                </button>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
