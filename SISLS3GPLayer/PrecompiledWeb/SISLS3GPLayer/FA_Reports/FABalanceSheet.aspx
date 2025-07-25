<%@ page language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="Reports_FABalanceSheet, App_Web_upeq32zu" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="update1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show" id="tab1">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Balance Sheet Report" ID="lblHeading" CssClass="styleDisplayLabel">
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
                                            <asp:DropDownList ID="ddlPattern" runat="server" ToolTip="Pattern"
                                                OnSelectedIndexChanged="ddl_SelectedIndexChanged" AutoPostBack="true"
                                                class="md-form-control form-control">
                                                <asp:ListItem Value="0" Text="--Select--" />
                                                <asp:ListItem Value="1" Text="Horizontal" />
                                                <asp:ListItem Value="2" Text="Vertical" />
                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvPattern" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlPattern" SetFocusOnError="True" ErrorMessage="Select Pattern"
                                                    Display="Dynamic" InitialValue="0">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" ID="lblActivity" CssClass="styleReqFieldLabel" Text="Pattern"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlFormat" runat="server" ToolTip="Format" OnSelectedIndexChanged="ddl_SelectedIndexChanged"
                                                AutoPostBack="true" class="md-form-control form-control">
                                                <asp:ListItem Value="0" Text="--Select--" />
                                                <asp:ListItem Value="1" Text="General" />

                                            </asp:DropDownList>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFormat" ValidationGroup="btnGo" CssClass="validation_msg_box_sapn"
                                                    runat="server" ControlToValidate="ddlFormat" SetFocusOnError="True" ErrorMessage="Select Format"
                                                    Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Format" ID="lblFrmMonth" CssClass="styleReqFieldLabel" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMonthyear" runat="server" ToolTip="Month/Year"
                                                AutoPostBack="true" OnTextChanged="txtMonthyear_OnTextChanged "
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="calendar1"
                                                Format="MMM/yyyy" TargetControlID="txtMonthyear" PopupButtonID="txtMonthyear"
                                                OnClientShown="onCalendarShown">
                                            </cc1:CalendarExtender>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvMonthyear" runat="server" ErrorMessage="Select Month/Year"
                                                    ValidationGroup="btnGo" Display="Dynamic" SetFocusOnError="True" ControlToValidate="txtMonthyear"
                                                    CssClass="validation_msg_box_sapn">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Month/Year" ID="lblEndMonth" CssClass="styleDisplayLabel"
                                                    ToolTip="Month/Year">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkAccount" runat="server" AutoPostBack="true"
                                                OnCheckedChanged="chkAccount_OnCheckedChanged" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>

                                            <asp:Label ID="lblAccount" runat="server" Text="Account Code" />

                                        </div>
                                    </div>
                                      <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:CheckBox ID="chkschPL" runat="server" ToolTip="Scheduled Balance Sheet"  />
                                            <asp:Label runat="server" ID="lblscheduledPL" Text="Scheduled Balance Sheet" />
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
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+X]" onclick="if(fnConfirmClear())"
                            causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+C]" onclick="if(fnConfirmExit('btnCancel'))"
                            causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlHorizontal" runat="server" CssClass="stylePanel" Visible="false" Width="100%"
                                GroupingText="Balance Sheet">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div id="Div2" runat="server" style="overflow: auto;">
                                            <%--   <div id="Div_HZ" runat="server" style="height: 250; overflow: auto;">--%>
                                            <%--  <div id="Div2" runat="server" style="overflow: auto;">--%>
                                            <asp:Panel GroupingText="Liability" ID="pnlLiabilityHZ" Height="200px" Width="100%"
                                                runat="server" HorizontalAlign="Center">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvLiabilityHZ" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                OnRowDataBound="gv_RowDataBound" CssClass="styleInfoLabel" ShowFooter="true">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Account Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("LGL_CODE") %>' ToolTip="Account Code"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Liabilities">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("Liability") %>' ToolTip="Account Description"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Budget">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblLiabBudget" runat="server" ToolTip="Total Budget"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblLiabTotal" runat="server" ToolTip="Total Liabilities"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 start--%>
                                                                    <asp:TemplateField HeaderText="Prev Year Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPrevAmount" runat="server" Text='<%# Bind("Prev_Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblPrevLiabTotal" runat="server" ToolTip="Total Liabilities"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 end--%>

                                                                    <asp:TemplateField HeaderText="Total" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Character" Value='<%# Bind("GL_ID") %>' runat="server" />
                                                                            <asp:HiddenField ID="hdn_Total" runat="server" />
                                                                            <asp:Label ID="lblTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                                        </ItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <%-- </div>--%>

                                            <%--</div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div id="Div1" runat="server" style="overflow: auto;">
                                            <asp:Panel ID="pnlAssetHZ" GroupingText="Asset" Height="200px" Width="100%"
                                                runat="server" HorizontalAlign="Center">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvAssetHZ" runat="server" AutoGenerateColumns="False" OnRowDataBound="gv_RowDataBound" Width="100%"
                                                                CssClass="styleInfoLabel" ShowFooter="true">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Account Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("AGL_CODE") %>' ToolTip="Account Code"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Asset">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("Asset") %>' ToolTip="Account Description"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Budget">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblAssetBudget" runat="server" ToolTip="Total Budget"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblAssetTotal" runat="server" ToolTip="Total Asset"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 start--%>
                                                                    <asp:TemplateField HeaderText="Prev Year Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPrevAmount" runat="server" Text='<%# Bind("Prev_Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblPrevAssetTotal" runat="server" ToolTip="Total Liabilities"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 end--%>
                                                                    <asp:TemplateField HeaderText="Total" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Character" Value='<%# Bind("GL_ID") %>' runat="server" />
                                                                            <asp:HiddenField ID="hdn_Total" runat="server" />
                                                                            <asp:Label ID="lblTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                                        </ItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlVertical" runat="server" CssClass="stylePanel" Visible="false"
                                Width="100%" GroupingText="Balance Sheet">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div id="Div3" runat="server" style="overflow: auto;">
                                            <asp:Panel GroupingText="Liability" ID="pnlLiability"  Width="100%"  Height="200px"
                                                runat="server" HorizontalAlign="Center">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvLiability" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                OnRowDataBound="gv_RowDataBound" CssClass="styleInfoLabel" ShowFooter="true">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Account Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("LGL_CODE") %>' ToolTip="Account Code"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Liabilities">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("Liability") %>' ToolTip="Account Description"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Budget">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblLiabBudget" runat="server" ToolTip="Total Budget"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblLiabTotal" runat="server" ToolTip="Total Liabilities"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 start--%>
                                                                    <asp:TemplateField HeaderText="Prev Year Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPrevAmount" runat="server" Text='<%# Bind("Prev_Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblPrevLiabTotal" runat="server" ToolTip="Total Liabilities"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 end--%>
                                                                    <asp:TemplateField HeaderText="Total" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Total" runat="server" />
                                                                            <asp:HiddenField ID="hdn_Character" Value='<%# Bind("GL_ID") %>' runat="server" />
                                                                            <asp:Label ID="lblTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                                        </ItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                        <div id="Div4" runat="server" style="overflow: auto;">
                                            <asp:Panel ID="pnlAsset" GroupingText="Asset" Width="100%"  Height="200px"
                                                runat="server" HorizontalAlign="Center">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="gird">
                                                            <asp:GridView ID="gvAsset" runat="server" AutoGenerateColumns="False" OnRowDataBound="gv_RowDataBound"
                                                                CssClass="styleInfoLabel" Width="100%" ShowFooter="true">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Account Code">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" runat="server" Text='<%# Bind("AGL_CODE") %>' ToolTip="Account Code"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Asset">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLdesc" runat="server" Text='<%# Bind("Asset") %>' ToolTip="Account Description"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblTotal" runat="server" Text="Total" ToolTip="Total"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Left" Width="40%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Budget">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblBudget" runat="server" Text='<%# Bind("budget") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblAssetBudget" runat="server" ToolTip="Total Budget"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblAssetTotal" runat="server" ToolTip="Total Asset"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 start--%>
                                                                    <asp:TemplateField HeaderText="Prev Year Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPrevAmount" runat="server" Text='<%# Bind("Prev_Amount1") %>' ToolTip="Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:Label ID="lblPrevAssetTotal" runat="server" ToolTip="Total Liabilities"></asp:Label>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                        <FooterStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                    <%-- 5148 end--%>
                                                                    <asp:TemplateField HeaderText="Total" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="hdn_Character" Value='<%# Bind("GL_ID") %>' runat="server" />
                                                                            <asp:HiddenField ID="hdn_Total" runat="server" />
                                                                            <asp:Label ID="lblTotal" runat="server" Text="" ToolTip="Total"></asp:Label>
                                                                        </ItemTemplate>

                                                                        <FooterStyle HorizontalAlign="Right" Width="10%" />
                                                                        <ItemStyle HorizontalAlign="Right" Width="20%" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:HiddenField ID="hdn_Total" runat="server" />
                        </div>
                    </div>
                      <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Panel ID="pnlscheduledPL" runat="server" CssClass="stylePanel" Visible="false" GroupingText="Summarised Income Statement">
                                  <div id="divacc" runat="server" visible="false" style="height: 300px; overflow: scroll;">
                                    
                        <table width="100%">
                            <tr class="gird">
                                <td id="tdExportDtl" runat="server" visible="false" class="gird_details"></td>
                            </tr>
                        </table>
                                      </div>
                                </asp:Panel>
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:Label ID="lblGT" Visible="false" runat="server" Text="Grand Total :" />
                            <asp:Label ID="lblGTAmount" Visible="false" runat="server" Text="" />
                        </div>
                    </div>
                    <div align="right">
                        <button class="css_btn_enabled" id="btnPrint" onserverclick="btnPrint_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="P" title="Print,Alt+P" visible="false">
                            <i class="fa fa-print" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>

                        <button class="css_btn_enabled" id="btnExcel" onserverclick="btnExcel_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="E" title="Excel,Alt+E" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;<u>E</u>xcel
                        </button>

                        <button class="css_btn_enabled" id="btnEmail" onserverclick="btnEmail_Click" runat="server"
                            type="button" causesvalidation="false" accesskey="M" title="e-Mail,Alt+M" visible="false">
                            <i class="fa fa-file-excel-o" aria-hidden="true"></i>&emsp;e<u>M</u>ail
                        </button>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsBalanceSheet" runat="server" CssClass="styleMandatoryLabel"
                                CausesValidation="true" HeaderText="Correct the following validation(s):" ValidationGroup="btnGo" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:CustomValidator ID="cvBalanceSheet" runat="server" CssClass="styleMandatoryLabel"
                                Enabled="true" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">

        var cal1;
        var cal2;

        function pageLoad() {
            cal1 = $find("calendar1");
            //cal2 = $find("calendar2"); 

            modifyCalDelegates(cal1);
            // modifyCalDelegates(cal2); 
        }

        function modifyCalDelegates(cal) {
            //we need to modify the original delegate of the month cell. 
            cal._cell$delegates = {
                mouseover: Function.createDelegate(cal, cal._cell_onmouseover),
                mouseout: Function.createDelegate(cal, cal._cell_onmouseout),

                click: Function.createDelegate(cal, function (e) {
                    /// <summary>  
                    /// Handles the click event of a cell 
                    /// </summary> 
                    /// <param name="e" type="Sys.UI.DomEvent">The arguments for the event</param> 

                    e.stopPropagation();
                    e.preventDefault();

                    if (!cal._enabled) return;

                    var target = e.target;
                    var visibleDate = cal._getEffectiveVisibleDate();
                    Sys.UI.DomElement.removeCssClass(target.parentNode, "ajax__calendar_hover");
                    switch (target.mode) {
                        case "prev":
                        case "next":
                            cal._switchMonth(target.date);
                            break;
                        case "title":
                            switch (cal._mode) {
                                case "days": cal._switchMode("months"); break;
                                case "months": cal._switchMode("years"); break;
                            }
                            break;
                        case "month":
                            //if the mode is month, then stop switching to day mode. 
                            if (target.month == visibleDate.getMonth()) {
                                //this._switchMode("days"); 
                            } else {
                                cal._visibleDate = target.date;
                                //this._switchMode("days"); 
                            }
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                        case "year":
                            if (target.date.getFullYear() == visibleDate.getFullYear()) {
                                cal._switchMode("months");
                            } else {
                                cal._visibleDate = target.date;
                                cal._switchMode("months");
                            }
                            break;

                            //                case "day":                             
                            //                    this.set_selectedDate(target.date);                             
                            //                    this._switchMonth(target.date);                             
                            //                    this._blur.post(true);                             
                            //                    this.raiseDateSelectionChanged();                             
                            //                    break;                             
                        case "today":
                            cal.set_selectedDate(target.date);
                            cal._switchMonth(target.date);
                            cal._blur.post(true);
                            cal.raiseDateSelectionChanged();
                            break;
                    }

                })
            }

        }

        function onCalendarShown(sender, args) {
            //set the default mode to month 
            sender._switchMode("months", true);
            changeCellHandlers(cal1);
        }


        function changeCellHandlers(cal) {

            if (cal._monthsBody) {

                //remove the old handler of each month body. 
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $common.removeHandlers(row.cells[j].firstChild, cal._cell$delegates);
                    }
                }
                //add the new handler of each month body. 
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $addHandlers(row.cells[j].firstChild, cal._cell$delegates);
                    }
                }

            }
        }

        function onCalendarHidden(sender, args) {

            if (sender.get_selectedDate()) {
                if (cal1.get_selectedDate() && cal2.get_selectedDate() && cal1.get_selectedDate() > cal2.get_selectedDate()) {
                    alert('Start Month/Year cannot be Greater than the End Month/Year, please reselect!');
                    sender.show();
                    return;
                }
                //get the final date 
                var finalDate = new Date(sender.get_selectedDate());
                var selectedMonth = finalDate.getMonth();
                finalDate.setDate(1);
                if (sender == cal2) {
                    // set the calender2's default date as the last day 
                    finalDate.setMonth(selectedMonth + 1);
                    finalDate = new Date(finalDate - 1);
                }
                //set the date to the TextBox 
                sender.get_element().value = finalDate.format(sender._format);
            }
        }


        function Resize() {
            if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null) {
                if (document.getElementById('divMenu').style.display == 'none') {
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
                }
                else {
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
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

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - 270;
            }
            if (show == 'F') {
                if (document.getElementById('divGrid1') != null) {
                    document.getElementById('divGrid1').style.width = "960px";
                    document.getElementById('divGrid1').style.overflow = "auto";
                }

                document.getElementById('divMenu').style.display = 'none';
                document.getElementById('ctl00_imgHideMenu').style.display = 'none';
                document.getElementById('ctl00_imgShowMenu').style.display = 'Block';

                if (document.getElementById('ctl00_ContentPlaceHolder1_divDetails') != null)
                    (document.getElementById('ctl00_ContentPlaceHolder1_divDetails')).style.width = screen.width - document.getElementById('divMenu').style.width - 60;
            }
        }

    </script>
</asp:Content>












