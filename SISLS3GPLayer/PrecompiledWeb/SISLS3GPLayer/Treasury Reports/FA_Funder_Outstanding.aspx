<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Common/FAMasterPageCollapse.master" inherits="Reports_FA_Funder_Outstanding, App_Web_u0nem2mh" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="tab-content" class="tab-content">
        <div class="tab-pane fade in active show" id="tab1">
            <div class="row">
                <div class="col">
                    <h6 class="title_name">
                        <asp:Label runat="server" Text="Funder Outstanding Report" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                    </h6>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlInput" runat="server" CssClass="stylePanel" GroupingText="Input Details">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlNatureofFund" OnSelectedIndexChanged="ddlNatureofFund_SelectedIndexChanged" onmouseover="ddl_itemchanged(this)" runat="server"
                                        AutoPostBack="true" class="md-form-control form-control">
                                    </asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblNatureofFund" ToolTip="Nature of Fund" runat="server" Text="Nature of Fund"
                                            CssClass="styleReqFieldLabel" />
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <cc1:ComboBox ID="cmbFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                        AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false"
                                        AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged">
                                    </cc1:ComboBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblFunder" runat="server" Text="Funder">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <div align="right">
                <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="Header" runat="server"
                    type="button" accesskey="G" title="Go,Alt+G">
                    <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear the Page[Alt+L]" onclick="if(fnConfirmClear())"
                    causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" visible="false" title="Exit the pagel[Alt+X]"
                    causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
                <button class="css_btn_enabled" id="btnexcel" onserverclick="btnexcel_ServerClick" runat="server"
                    type="button" accesskey="P"   title="Export to Excel,Alt+P" visible="false">
                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport to Excel
                </button>
            </div>


            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:Panel ID="pnlGridDetails" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="gird">
                                    <div id="divTransaction" runat="server" style="overflow: scroll; height: 200px; display: block">
                                        <asp:GridView ID="grvGridDetails" runat="server" BorderWidth="2" ShowFooter="true" AutoGenerateColumns="false"
                                            CssClass="styleInfoLabel" OnRowDataBound="grvGridDetails_DataBound" Width="100%" ShowHeader="true">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Nature Of Fund">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNature_Of_Fund" runat="server" Text='<%# Bind("Nature_Of_Fund") %>' ToolTip="Nature Of Fund"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Funder Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblfundername" runat="server" Text='<%# Bind("Funder_Name") %>' ToolTip="Deal_Number"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Deal No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeal_No" runat="server" Text='<%# Bind("Deal_No") %>' ToolTip="Deal Number"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Funder Tran Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFunder_Tran_Date" runat="server" Text='<%# Bind("Funder_Tran_Date") %>' ToolTip="Funder Tran Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Funder Tran No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFunder_Tran_DateF" runat="server" Text='<%# Bind("FUNDER_TRAN_NO") %>' ToolTip="Funder Tran No"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>




                                                <asp:TemplateField HeaderText="Maturity Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMaturity_Date" runat="server" Text='<%# Bind("Maturity_Date") %>' ToolTip="Maturity Date"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Tenure">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTenure" runat="server" Style="text-align: right;" Text='<%# Bind("Tenure") %>' ToolTip="Tenure"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Frequency">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFreq" runat="server" Style="text-align: right;" Text='<%# Bind("Frequency") %>' ToolTip="Frequency"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text="Total  " Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Deal Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeal_Amount" runat="server" Style="text-align: right;" Text='<%# Bind("Deal_Amount1") %>' ToolTip="Deal Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotalDeal_Amount" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Receipts So Far">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblReceipts_So_Far" runat="server" Style="text-align: right;" Text='<%# Bind("Receipts_So_Far1") %>' ToolTip="Receipts So Far"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotalReceipts_So_Far" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="payment So Far">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblpayment_So_Far" runat="server" Style="text-align: right;" Text='<%# Bind("payment_So_Far1") %>' ToolTip="payment So Far"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotalpayment_So_Far" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField  Visible="false" HeaderText="Appl Int Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAppl_Int_Rate" runat="server" Style="text-align: right;" Text='<%# Bind("Appl_Int_Rate1") %>' ToolTip="Appl Int Rate"></asp:Label>
                                                    </ItemTemplate>
                                                    <%--  <FooterTemplate>
                                                    <asp:Label ID="lblTotalAppl_Int_Rate" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                </FooterTemplate>--%>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Base Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBase_Rate" runat="server" Style="text-align: right;" Text='<%# Bind("Base_Rate1") %>' ToolTip="Base Rate"></asp:Label>
                                                    </ItemTemplate>
                                                    <%--  <FooterTemplate>
                                                    <asp:Label ID="lblTotalAppl_Int_Rate" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                </FooterTemplate>--%>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Spread Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSpread_Rate" runat="server" Style="text-align: right;" Text='<%# Bind("Spread_Rate1") %>' ToolTip="Spread Rate"></asp:Label>
                                                    </ItemTemplate>
                                                    <%--  <FooterTemplate>
                                                    <asp:Label ID="lblTotalAppl_Int_Rate" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                </FooterTemplate>--%>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Total Rate">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal_Rate" runat="server" Style="text-align: right;" Text='<%# Bind("Total_Rate1") %>' ToolTip="Total Rate"></asp:Label>
                                                    </ItemTemplate>
                                                    <%--  <FooterTemplate>
                                                    <asp:Label ID="lblTotalAppl_Int_Rate" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                </FooterTemplate>--%>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Principal o/s Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblos_Amount" runat="server" Style="text-align: right;" Text='<%# Bind("os_Amount1") %>' ToolTip="os Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblos_AmountF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Interest o/s Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIosInterest_AmountFI" runat="server" Style="text-align: right;" Text='<%# Bind("Int_os_Amnt1") %>' ToolTip="os Amount"></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblIosInterest_AmountF" runat="server" Style="text-align: right;" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <HeaderStyle CssClass="styleGridHeader" HorizontalAlign="Center" />
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
                    type="button" accesskey="P" visible="false">
                    <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                </button>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <asp:ValidationSummary ID="vs" runat="server" ShowSummary="true" CssClass="styleMandatoryLabel"
                        ValidationGroup="Header" ShowMessageBox="false" HeaderText="Correct the following validation(s):" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
