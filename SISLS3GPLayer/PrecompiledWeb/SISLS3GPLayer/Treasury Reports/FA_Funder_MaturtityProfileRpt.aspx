<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Treasury_Reports_FA_Funder_MaturtityProfileRpt, App_Web_u0nem2mh" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
       
    </script>
    <asp:UpdatePanel ID="dd" runat="server">

        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                        <asp:Label runat="server" Text="Funder Maturity Profile Report" ID="lblHeading" CssClass="styleDisplayLabel">
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
                                                AutoPostBack="true" AppendDataBoundItems="true" CaseSensitive="false"
                                                AutoCompleteMode="SuggestAppend" OnSelectedIndexChanged="cmbFunder_SelectedIndexChanged">
                                            </cc1:ComboBox>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFunder" runat="server" ControlToValidate="cmbFunder"
                                                    InitialValue="--Select--" ErrorMessage="Select Funder" Display="Dynamic" SetFocusOnError="True"
                                                    ValidationGroup="vgGo" CssClass="validation_msg_box_sapn" />
                                            </div>
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
                                            <asp:TextBox runat="server" ToolTip="Repay Due From Date"  AutoPostBack="true" OnTextChanged="txtFrmDate_TextChanged" ID="txtFrmDate"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtFrmDate"
                                                PopupButtonID="txtDate" ID="CalendarFrmDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFrmDate"
                                                    ErrorMessage="Repay Due From Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblDate" Text="Repay Due From Date" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox runat="server" ToolTip="Repay Due to Date" ID="txtToDate"
                                                AutoPostBack="True" OnTextChanged="txtEndDateSearch_OnTextChanged"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender runat="server" TargetControlID="txtToDate"
                                                PopupButtonID="txtDate" ID="CalendarToDate" Enabled="True">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtToDate"
                                                    ErrorMessage="Select Repay Due to Date" Display="Dynamic" SetFocusOnError="True" ValidationGroup="vgGo"
                                                    CssClass="validation_msg_box_sapn" />
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="Label1" Text="Repay Due to Date" />
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
                        <button class="css_btn_enabled" id="btnexcel" runat="server" onserverclick="btnexcel_Click"
                            type="button" caccesskey="E" title="Export to Excel,Alt+E" enabled="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xport to Excel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="Main" runat="server" ValidationGroup="vgGo" CssClass="styleMandatoryLabel"
                                HeaderText="Correct the following validation(s):" ShowSummary="true" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlGrid" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                                <div style="overflow: auto; width: auto; height: 300px">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="gird">
                                                <asp:GridView ID="grvRepayable" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                    CssClass="gird_details" OnRowDataBound="grvRepayable_RowDataBound"
                                                    ShowHeader="true" HeaderStyle-HorizontalAlign="Center" ShowFooter="true">
                                                    <Columns>
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
                        <div style="display: none" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlExcel" runat="server" GroupingText="Grid Details" CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="gird">
                                            <asp:GridView ID="grvExcel" runat="server" AutoGenerateColumns="true" BorderWidth="2"
                                                CssClass="gird_details" OnRowDataBound="grvRepayableExcel_RowDataBound" Width="100%"
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

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnexcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
