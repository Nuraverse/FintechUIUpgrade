<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Reports_FA_Funder_MaturtityProfileRpt, App_Web_aagoig1p" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="dd" runat="server">
        <ContentTemplate>
            <%-- <table width="100%" align="center" cellpadding="0" cellspacing="0">--%>

            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">

                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Funder Maturity Profile Bank Borrowing Report" ID="lblHeading" CssClass="styleDisplayLabel">
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

                                            <cc1:ComboBox ID="cmbFunder" runat="server" CssClass="WindowsStyle" DropDownStyle="DropDownList"
                                                AutoPostBack="true" Width="170px" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged">
                                            </cc1:ComboBox>
                                            <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="cmbFunder"
                                                InitialValue="--Select--" ErrorMessage="Select Funder" Display="None" SetFocusOnError="True"
                                                ValidationGroup="vgGo" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblFunder" runat="server" Text="Funder">
                                                </asp:Label>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" class="md-form-control form-control login_form_content_input requires_true" ID="txtFrmDate" />
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFrmDate"
                                                PopupButtonID="txtDate" ID="CalendarFrmDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFrmDate"
                                                ErrorMessage="Repay Due From Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="lblDate" Text="Repay Due From Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" class="md-form-control form-control login_form_content_input requires_true" ID="txtToDate"
                                                AutoPostBack="True"  OnTextChanged="txtEndDateSearch_OnTextChanged" />
                                            <%-- <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtToDate"
                                                PopupButtonID="txtDate" ID="CalendarToDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate"
                                                ErrorMessage="Repay Due To Date" Display="None" SetFocusOnError="True" ValidationGroup="vgGo" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label runat="server" ID="Label1" Text="Repay Due To Date" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnGo" onserverclick="btnGo_Click" validationgroup="vgGo" runat="server"
                            type="button" accesskey="G" title="Go,Alt+G">
                            <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                        </button>

                        <button class="css_btn_enabled" id="btnClear" title="Clear the Details[Alt+L]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" visible="false" title="Exit the pagel[Alt+X]"
                            causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <asp:ImageButton ID="btnexcel" Enabled="false" CssClass="styleDisplayLabel" OnClick="btnexcel_Click" ImageUrl="~/Images/ExcelExport10.png"
                            Width="30px" Height="30px" runat="server" ToolTip="Export to Excel,Alt+E" AccessKey="E" />
                    </div>
                    <%--<tr>
                            <td align="center" colspan="4">--%>
                    <%--  <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="styleSubmitButton" OnClick="btnGo_Click"
                                    ValidationGroup="vgGo" ToolTip="Go,Alt+G" AccessKey="G" />--%>
                    <%--  <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_OnClick"
                                    CssClass="styleSubmitButton" ToolTip="Clear the Details,Alt+L" AccessKey="L" />--%>
                    <%-- <asp:Button ID="btnCancel" runat="server" Text="Exit"
                                    CssClass="styleSubmitButton" OnClick="btnCancel_Click" ToolTip="Exit the Page,Alt+X" AccessKey="X" />--%>
                    <%--                        <asp:Button ID="btnexcel" runat="server" CssClass="styleSubmitButton" CausesValidation="False"
                            Visible="false" Text="Excel" OnClick="btnexcel_Click" />--%>
                    <%--  </td>
                        </tr>--%>
                    <%--</div>--%>
                    <div class="row">
                        <div>
                            <asp:ValidationSummary ID="Main" runat="server" ValidationGroup="vgGo" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlGrid" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                                <div style="overflow: auto; width: auto; height: 300px">
                                    <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grvRepayable" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                    CssClass="styleInfoLabel" OnRowDataBound="grvRepayable_RowDataBound" Style="table-layout: fixed;" Width="1800px"
                                                    ShowHeader="true" HeaderStyle-HorizontalAlign="Center" ShowFooter="true">
                                                    <Columns>
                                                        <%--<asp:TemplateField>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblDueamountTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>--%>
                                                    </Columns>
                                                </asp:GridView>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel1" runat="server" GroupingText="SummaryDetails" CssClass="stylePanel">
                                <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="gvSummaryDetails" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                CssClass="styleInfoLabel" OnRowDataBound="gvSummaryDetails_RowDataBound" Width="50%"
                                                ShowHeader="true" HeaderStyle-HorizontalAlign="Center" ShowFooter="true">
                                                <Columns>
                                                </Columns>
                                            </asp:GridView>

                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="Panel2" runat="server" GroupingText="Final Summary Details Details" CssClass="stylePanel">
                                <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="gvFinalSummary" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                CssClass="styleInfoLabel" OnRowDataBound="gvFinalSummary_RowDataBound" Width="50%"
                                                ShowHeader="true" HeaderStyle-HorizontalAlign="Center" ShowFooter="true">
                                                <Columns>
                                                </Columns>
                                            </asp:GridView>

                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>


                </div>
            </div>
            <%--  </table>--%>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnexcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
