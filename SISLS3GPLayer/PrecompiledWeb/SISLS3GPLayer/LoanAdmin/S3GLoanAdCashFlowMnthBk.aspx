<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="LoanAdmin_S3GLoanAdCashFlowMnthBk, App_Web_nqjy25qa" title="" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel" Text="Cashflow Monthly Booking">
                            </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlLineofBusiness" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged"
                                ToolTip="Line Of Business" class="md-form-control form-control">
                            </asp:DropDownList>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvLineofBusiness" runat="server" ErrorMessage="Select Line of Business"
                                    InitialValue="0" Display="Dynamic" ControlToValidate="ddlLineofBusiness" ValidationGroup="Submit"
                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                            </div>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblLineofBusiness" runat="server" Text="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                ToolTip="Branch" class="md-form-control form-control">
                            </asp:DropDownList>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ErrorMessage="Select Location"
                                    InitialValue="0" Display="Dynamic" ControlToValidate="ddlBranch" ValidationGroup="Submit"
                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                            </div>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlFinancialYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFinancialYear_SelectedIndexChanged"
                                ToolTip="Financial Year" class="md-form-control form-control">
                            </asp:DropDownList>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvFinYear" runat="server" ErrorMessage="Select Financial Year"
                                    InitialValue="0" Display="Dynamic" ControlToValidate="ddlFinancialYear" ValidationGroup="Submit"
                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                            </div>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblFinancialYear" runat="server" Text="Financial Year" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlFinancialMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFinancialMonth_SelectedIndexChanged"
                                ToolTip="Financial Month" class="md-form-control form-control">
                            </asp:DropDownList>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvFinMonth" runat="server" ErrorMessage="Select Financial month"
                                    InitialValue="0" Display="Dynamic" ControlToValidate="ddlFinancialMonth" ValidationGroup="Submit"
                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                            </div>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblFinancialMonth" runat="server" Text="Financial Month" CssClass="styleReqFieldLabel"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:DropDownList ID="ddlCashFlowType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCashFlowType_SelectedIndexChanged"
                                ToolTip="Cashflow Type" class="md-form-control form-control">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="2">Both</asp:ListItem>
                                <asp:ListItem Value="1">Payables</asp:ListItem>
                                <asp:ListItem Value="0">Receivables</asp:ListItem>
                            </asp:DropDownList>
                            <div class="validation_msg_box">
                                <asp:RequiredFieldValidator ID="rfvCashFlowType" runat="server" ErrorMessage="Select Cashflow Type"
                                    Display="Dynamic" ControlToValidate="ddlCashFlowType" ValidationGroup="Submit"
                                    CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                            </div>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblCahflowType" runat="server" CssClass="styleReqFieldLabel" Text="Cashflow Type"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtCFMDate" runat="server" ToolTip="Cashflow Monthly Booking Date "
                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblCFMDate" runat="server" CssClass="styleReqFieldLabel" Text="Cashflow Monthly Booking Date"></asp:Label>
                            </label>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                        <div class="md-input">
                            <asp:TextBox ID="txtCFMNumber" runat="server" ToolTip="Auto Generated Cashflow Monthly Booking Number"
                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <label>
                                <asp:Label ID="lblCFMNumber" runat="server" CssClass="styleReqFieldLabel" Text="Cashflow Monthly Booking Number"></asp:Label>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="gird">
                            <asp:GridView ID="grvCashflowDetails" runat="server" AutoGenerateColumns="False"
                                Width="100%" ToolTip="Cashflow details for selected Line Of Business and Financial Month"
                                CssClass="gird_details">
                                <Columns>
                                    <asp:BoundField DataField="PANumber" HeaderText="Prime Account Number" SortExpression="PANumber">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SANumber" HeaderText="Sub Account Number">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cust_Name" HeaderText="Customer Name">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CASHFLOW_DATE" HeaderText="Cashflow Date">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cash_Flow_Desc" HeaderText="Cashflow Description">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Cashflow_id" HeaderText="Cashflow_id" ReadOnly="true" />
                                    <asp:BoundField DataField="AccountCashFlow_Details_ID" HeaderText="AccountCashFlow_Details_ID"
                                        ReadOnly="true">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Amount" HeaderText="Amount">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Sys_JV_Ref" HeaderText="Sys JV Ref">
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(return fnCheckPageValidators('Submit'))"
                        onserverclick="btnSave_Click" runat="server" type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnRevoke" title="Revoke[Alt+R]" onclick="if(return confirm('Are you sure want to Revoke?')"
                        onserverclick="btnRevoke_Click" runat="server" type="button" accesskey="R" visible="false">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>R</u>evoke
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false"
                        onserverclick="btnClear_Click" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="btnCancel" title="Cancel[Alt+C]" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                        type="button" accesskey="C">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>C</u>ancel
                    </button>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator runat="server" ID="cvCashFlowMnthBk" Display="None" CssClass="styleMandatoryLabel"
                            ValidationGroup="Submit"></asp:CustomValidator>
                        <asp:ValidationSummary ID="vsCashFlowMnthBk" runat="server" ValidationGroup="Submit"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Add"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
